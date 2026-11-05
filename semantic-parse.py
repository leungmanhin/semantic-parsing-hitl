#!/usr/bin/env python3
"""semantic-parse.py — parse one English sentence into template instances with an LLM.

The instruction set is the generated catalog prompt (templates/generated/PROMPT_CATALOG.txt by
default); the sentence is sent as one item; the model's JSON object (instances, unmapped spans,
issues) is printed.  Providers are pluggable: one small class per provider, selected by name.

    python semantic-parse.py "Teodor gave Yusra a thermos."
    python semantic-parse.py "…" --provider google --model gemini-2.5-flash --effort low
    python semantic-parse.py "…" --provider deepseek --model deepseek-v4-pro --effort low
    python semantic-parse.py "…" --provider anthropic --model claude-opus-5-5 --effort low
    python semantic-parse.py "…" --provider chat-completions --base-url http://127.0.0.1:8000/v1 --model <name>
    python semantic-parse.py "…" --out run.json          # keep the full run record
    python semantic-parse.py "…" --dry-run               # show the request, call nothing

Keys come from the environment: GEMINI_API_KEY (or GOOGLE_API_KEY), OPENAI_API_KEY,
DEEPSEEK_API_KEY, ANTHROPIC_API_KEY; for ``--provider chat-completions --base-url <url>`` (any
OpenAI-compatible server) the variable named by --api-key-env.  Only the standard library is used.

Every reply is validated after the call by the catalog's validator (templates/tmpl/validate.py:
the emitter's instance checks, graph lints, C9 type check): findings go to stderr and into the run
record, the reply itself is never changed.  ``--atoms`` also prints the emitted statements and
declarations; ``--statements-only`` prints nothing but the statements, one per line — the
chainer's input, ready to feed to add_atom beside templates/generated/seeded_rules.metta;
``--no-validate`` skips the step.

Exit status: 0 the reply is a JSON object that validates; 3 it has validation findings; 2 it is
not valid JSON (the raw text is printed); 1 a request failed.
"""
from __future__ import annotations

import argparse
import hashlib
import http.client
import json
import os
import re
import sys
import time
import urllib.error
import urllib.request

ROOT = os.path.dirname(os.path.abspath(__file__))
DEFAULT_PROMPT = os.path.join(ROOT, "templates", "generated", "PROMPT_CATALOG.txt")
EFFORTS = ("none", "low", "medium", "high", "xhigh", "max")
ACK = "Understood. Send the item."          # the fixed model turn between the catalog and the item (turn layout)
CACHE_MIN_TOKENS = 4096                     # below this Gemini never caches; above it a reply without cached tokens means the cache was lost


# --------------------------------------------------------------------------
# providers
# --------------------------------------------------------------------------


class ProviderError(Exception):
    pass


class Reply:
    def __init__(self, text: str, usage: dict, raw: dict):
        self.text, self.usage, self.raw = text, usage, raw


#: Seconds to wait before each retry while a provider has no capacity, about ten minutes in all; such an
#: answer is not billed and clears by waiting. OpenAI: a 429 — Flex's "Resource Unavailable" (OpenAI's
#: Flex guide: not charged; retry with exponential backoff), or the tokens-per-minute limit, which cached
#: tokens count toward. Gemini's Flex tier: a 503 "at capacity" or a 429 (Google's Flex guide: no fallback
#: to the standard tier; retry with exponential backoff).
PATIENT_WAITS = (5, 10, 20, 40, 80, 160, 300)


def _read_sse(resp) -> dict:
    """A Chat Completions event stream gathered into the shape of a non-streaming reply: the content and
    the reasoning joined, the finish reason, and the usage that the last chunk carries. Blank lines and
    keep-alive comments are skipped; a stream cut before ``data: [DONE]`` or a line that is not JSON
    counts as a reply cut short (``IncompleteRead``), which ``_post_json`` retries like a dropped
    connection."""
    content, reasoning, finish, usage, model = [], [], None, None, None
    for raw_line in resp:
        line = raw_line.decode("utf-8").strip()
        if not line.startswith("data:"):
            continue                                           # blank lines, ": keep-alive" comments
        data = line[len("data:"):].strip()
        if data == "[DONE]":
            break
        try:
            chunk = json.loads(data)
        except json.JSONDecodeError:
            raise http.client.IncompleteRead(raw_line) from None
        if chunk.get("error"):
            raise ProviderError(f"error in the stream: {json.dumps(chunk['error'])[:800]}")
        model = chunk.get("model") or model
        usage = chunk.get("usage") or usage
        for choice in chunk.get("choices") or []:
            delta = choice.get("delta") or {}
            content.append(delta.get("content") or "")
            reasoning.append(delta.get("reasoning_content") or "")
            finish = choice.get("finish_reason") or finish
    else:
        raise http.client.IncompleteRead(b"")                   # no [DONE]: the stream was cut
    return {"model": model, "usage": usage or {},
            "choices": [{"finish_reason": finish,
                         "message": {"content": "".join(content), "reasoning_content": "".join(reasoning) or None}}]}


def _post_json(url: str, headers: dict, body: dict, timeout: float, attempts: int = 3,
               long_waits: tuple = (), long_codes: tuple = (429,), read=None) -> dict:
    """POST a JSON body; retry on 429 / 5xx with backoff; raise ProviderError otherwise.

    ``long_waits`` is a longer schedule (the seconds before each retry) for the HTTP codes in
    ``long_codes`` — a provider out of capacity — spent without using up ``attempts``; every other
    failure keeps the short backoff, since a re-send after a dropped connection may be billed. A 429
    for an exhausted quota (OpenAI's insufficient_quota, a Gemini quota per day) does not clear by
    waiting and is raised at once. ``read`` turns the open response into the reply (default: the
    JSON body; a streaming provider passes ``_read_sse``); a body cut short is retried like a dropped
    connection."""
    data = json.dumps(body).encode("utf-8")
    attempt, waited = 1, 0
    while True:
        req = urllib.request.Request(url, data=data, method="POST",
                                     headers={"Content-Type": "application/json", **headers})
        try:
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return read(resp) if read else json.loads(resp.read().decode("utf-8"))
        except urllib.error.HTTPError as exc:
            detail = exc.read().decode("utf-8", "replace")[:2000]
            last = f"HTTP {exc.code}: {detail}"
            if exc.code == 429 and ("insufficient_quota" in detail or "PerDay" in detail):
                raise ProviderError(last) from None
            if exc.code in long_codes and waited < len(long_waits):
                print(f"[HTTP {exc.code} (not billed): retry {waited + 1} of {len(long_waits)} in {long_waits[waited]} s]",
                      file=sys.stderr, flush=True)
                time.sleep(long_waits[waited])
                waited += 1
                continue
            if exc.code not in (429, 500, 502, 503, 504) or attempt >= attempts:
                raise ProviderError(last) from None
        except urllib.error.URLError as exc:
            last = f"network error: {exc.reason}"
            if attempt >= attempts:
                raise ProviderError(last) from None
        except (http.client.HTTPException, ConnectionResetError, TimeoutError, OSError) as exc:
            # the server closed the connection (long thinking runs do this), cut the body short
            # (IncompleteRead), or the client timed out
            last = f"connection dropped before a complete reply ({exc.__class__.__name__}: {exc}); attempt {attempt} of {attempts}"
            if attempt >= attempts:
                raise ProviderError(last + " — raise --timeout, lower the thinking level, or retry") from None
        time.sleep(2 ** attempt)
        attempt += 1


class Google:
    """Google (the Gemini models) through the Generative Language REST API (generateContent)."""

    name = "google"
    default_model = "gemini-2.5-flash"
    env_keys = ("GEMINI_API_KEY", "GOOGLE_API_KEY")
    #: Per the generateContent reference (GenerationConfig.ThinkingConfig): ``thinkingLevel`` —
    #: MINIMAL / LOW / MEDIUM / HIGH, "recommended for Gemini 3 or later models; use with earlier
    #: models results in an error" — and ``thinkingBudget`` (a token count; 0 disables thinking
    #: where the model allows it, -1 lets the model choose) for the 2.x family. The thinking
    #: guide's table gives each model's allowed levels (gemini-4-argon: low / medium / high,
    #: default medium). Thinking tokens come back as usageMetadata.thoughtsTokenCount.
    budgets = {"none": 0, "low": 1024, "medium": 8192, "high": 24576, "xhigh": 24576, "max": 24576}
    levels = {"none": "LOW", "low": "LOW", "medium": "MEDIUM", "high": "HIGH", "xhigh": "HIGH", "max": "HIGH"}

    @staticmethod
    def takes_levels(model: str) -> bool:
        """Gemini 3 and later take a thinking level; the 1.x / 2.x families take a budget."""
        return not (model.startswith("gemini-1") or model.startswith("gemini-2"))

    def __init__(self, args):
        self.args = args

    def key(self) -> str:
        for k in self.env_keys:
            if os.environ.get(k):
                return os.environ[k]
        raise ProviderError(f"set one of {', '.join(self.env_keys)}")

    def request(self, system: str, user: str, model: str) -> tuple[str, dict, dict]:
        a = self.args
        gen = {}
        if a.temperature is not None:
            gen["temperature"] = a.temperature
        if not a.no_json_mode:
            gen["responseMimeType"] = "application/json"
        if a.max_tokens:
            gen["maxOutputTokens"] = a.max_tokens
        if a.include_thoughts:
            gen.setdefault("thinkingConfig", {})
        if not a.no_thinking:
            if a.thinking_level:
                gen["thinkingConfig"] = {"thinkingLevel": a.thinking_level.upper()}
            elif a.thinking_budget is not None:
                gen["thinkingConfig"] = {"thinkingBudget": a.thinking_budget}
            elif self.takes_levels(model):
                gen["thinkingConfig"] = {"thinkingLevel": self.levels[a.effort]}
            else:
                gen["thinkingConfig"] = {"thinkingBudget": self.budgets[a.effort]}
        if a.include_thoughts:
            gen.setdefault("thinkingConfig", {})["includeThoughts"] = True
        if getattr(a, "layout", "turns") == "system":
            body = {"system_instruction": {"parts": [{"text": system}]},
                    "contents": [{"role": "user", "parts": [{"text": user}]}],
                    "generationConfig": gen}
        else:
            # The catalog as the first user turn, a fixed acknowledgement, then the item: a request whose
            # whole prompt is the catalog alone (``prime``) is then a prefix of every item request, which
            # is what Gemini's implicit caching needs to discount the catalog (measured 2026-10-18).
            body = {"contents": [{"role": "user", "parts": [{"text": system}]},
                                 {"role": "model", "parts": [{"text": ACK}]},
                                 {"role": "user", "parts": [{"text": user}]}],
                    "generationConfig": gen}
        if getattr(a, "service_tier", None):
            body["service_tier"] = a.service_tier      # flex: half price, minutes of queueing (Google's Flex guide)
        url = f"https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent"
        return url, {"x-goog-api-key": "<key>"}, body

    def _post(self, url: str, headers: dict, body: dict) -> dict:
        """The Flex tier answers 503 or 429 while it has no capacity: wait it out on the long schedule."""
        flex = body.get("service_tier") == "flex"
        return _post_json(url, headers, body, self.args.timeout,
                          long_waits=PATIENT_WAITS if flex else (), long_codes=(429, 503))

    def prime(self, system: str, model: str) -> dict:
        """Send the catalog alone, so that later requests starting with it hit the implicit cache.
        Returns the usage of the priming call (``cached`` is what an earlier prime left)."""
        url, headers, body = self.request(system, "", model)
        if "system_instruction" in body:
            raise ProviderError("priming needs the turn layout (--layout turns)")
        body["contents"] = body["contents"][:1]
        headers["x-goog-api-key"] = self.key()
        raw = self._post(url, headers, body)
        u = raw.get("usageMetadata") or {}
        return {"input": u.get("promptTokenCount"), "output": u.get("candidatesTokenCount"),
                "cached": u.get("cachedContentTokenCount"), "total": u.get("totalTokenCount")}

    def complete(self, system: str, user: str, model: str) -> Reply:
        url, headers, body = self.request(system, user, model)
        headers["x-goog-api-key"] = self.key()
        raw = self._post(url, headers, body)
        cands = raw.get("candidates") or []
        if not cands:
            raise ProviderError(f"no candidates in the reply: {json.dumps(raw)[:800]}")
        parts = (cands[0].get("content") or {}).get("parts") or []
        text = "".join(p.get("text", "") for p in parts if not p.get("thought"))
        thoughts = [p.get("text", "") for p in parts if p.get("thought")]
        u = raw.get("usageMetadata") or {}
        usage = {"input": u.get("promptTokenCount"), "output": u.get("candidatesTokenCount"),
                 "thinking": u.get("thoughtsTokenCount"), "total": u.get("totalTokenCount"),
                 "cached": u.get("cachedContentTokenCount"),
                 "finish": cands[0].get("finishReason"), "thought_parts": len(thoughts)}
        reply = Reply(text, usage, raw)
        reply.thoughts = thoughts
        reply.config = {**body["generationConfig"], **({"service_tier": body["service_tier"]} if "service_tier" in body else {})}
        reply.raw_usage = u
        return reply


class OpenAI:
    """OpenAI through the Responses REST API.

    Caching, per OpenAI's prompt-caching guide: on GPT-5.6 and later a cache write is billed (1.25x the
    uncached input rate for the default 30-minute lifetime; a read is 0.1x), and the implicit breakpoint
    sits at the end of the latest user message — a catalog sent as ``instructions`` with the item after it
    would be written afresh with every item and never read back ("a shared prefix is not always a cached
    prefix"). These models therefore get the catalog as a developer message ending in an explicit
    breakpoint, in explicit-only mode: the first call writes the catalog, later calls read it, and the item
    after the breakpoint is plain input with no write charge. No priming is needed: the first item call is
    the write. Earlier models cache a shared prefix implicitly and keep the ``instructions`` layout.
    Responses are not stored on OpenAI's side (``store: false``); the run record keeps them."""

    name = "openai"
    default_model = "gpt-5-mini"
    env_keys = ("OPENAI_API_KEY",)

    def __init__(self, args):
        self.args = args

    @staticmethod
    def explicit_cache(model: str) -> bool:
        """GPT-5.6 and later take ``prompt_cache_options`` and explicit cache breakpoints."""
        m = re.match(r"gpt-(\d+)(?:\.(\d+))?", model)
        return bool(m) and (int(m.group(1)), int(m.group(2) or 0)) >= (5, 6)

    def key(self) -> str:
        if os.environ.get("OPENAI_API_KEY"):
            return os.environ["OPENAI_API_KEY"]
        raise ProviderError("set OPENAI_API_KEY")

    def request(self, system: str, user: str, model: str) -> tuple[str, dict, dict]:
        a = self.args
        body = {"model": model, "text": {"format": {"type": "json_object"}}, "store": False}
        if self.explicit_cache(model):
            body["input"] = [
                {"role": "developer", "content": [{"type": "input_text", "text": system,
                                                   "prompt_cache_breakpoint": {"mode": "explicit"}}]},
                {"role": "user", "content": user}]
            body["prompt_cache_options"] = {"mode": "explicit"}
        else:
            body["instructions"], body["input"] = system, user
        if a.effort != "none":
            body["reasoning"] = {"effort": a.effort}
        if a.max_tokens:
            body["max_output_tokens"] = a.max_tokens
        if getattr(a, "service_tier", None):
            body["service_tier"] = a.service_tier
        return "https://api.openai.com/v1/responses", {"Authorization": "Bearer <key>"}, body

    def complete(self, system: str, user: str, model: str) -> Reply:
        url, headers, body = self.request(system, user, model)
        headers["Authorization"] = f"Bearer {self.key()}"
        raw = _post_json(url, headers, body, self.args.timeout, long_waits=PATIENT_WAITS)
        text = ""
        for item in raw.get("output") or []:
            for c in item.get("content") or []:
                if c.get("type") == "output_text":
                    text += c.get("text", "")
        u = raw.get("usage") or {}
        d = u.get("input_tokens_details") or {}
        finish = raw.get("status")
        if raw.get("incomplete_details"):
            finish = f"{finish}: {(raw['incomplete_details'] or {}).get('reason')}"
        usage = {"input": u.get("input_tokens"), "output": u.get("output_tokens"),
                 "thinking": (u.get("output_tokens_details") or {}).get("reasoning_tokens"),
                 "total": u.get("total_tokens"), "cached": d.get("cached_tokens"),
                 "cache_write": d.get("cache_write_tokens"), "finish": finish,
                 "service_tier": raw.get("service_tier")}
        reply = Reply(text, usage, raw)
        reply.config = {k: v for k, v in body.items() if k not in ("input", "instructions")}
        reply.raw_usage = u
        return reply


class DeepSeek:
    """DeepSeek through its OpenAI-format Chat Completions API.

    Thinking is on by default at effort high: ``--effort`` low / high are sent as ``reasoning_effort``
    (medium as high, DeepSeek's own mapping) and none turns thinking off (``thinking: disabled``).

    Caching, per DeepSeek's context-caching guide: automatic and on disk, with no write charge (a
    miss is billed at the input rate, a hit at a small fraction of it), kept for hours to days. A
    request hits only a stored prefix it matches IN FULL; prefixes are stored at the end of each
    request's input and output, at fixed intervals inside long inputs, and as a common prefix once
    several requests are seen to share it. The catalog is therefore the system message, unchanged,
    ahead of the item: the first requests with different items store it as a shared prefix, and
    later requests read it. No priming is needed.

    JSON Output replaces a reply it cannot read as JSON with spaces (finish ``stop``): the finish then
    says so, and the reply fails as not valid JSON, to be collected again.

    Replies are streamed: a non-streaming reply sends nothing while the model thinks, and a long
    thinking run had its connection closed at sixty seconds with the body unsent; the stream keeps
    tokens flowing and is gathered back into the usual reply."""

    name = "deepseek"
    default_model = "deepseek-v4-pro"
    env_keys = ("DEEPSEEK_API_KEY",)
    url = "https://api.deepseek.com/chat/completions"
    efforts = {"low": "low", "medium": "high", "high": "high", "xhigh": "high", "max": "max"}

    def __init__(self, args):
        self.args = args

    def key(self) -> str:
        if os.environ.get("DEEPSEEK_API_KEY"):
            return os.environ["DEEPSEEK_API_KEY"]
        raise ProviderError("set DEEPSEEK_API_KEY")

    def request(self, system: str, user: str, model: str) -> tuple[str, dict, dict]:
        a = self.args
        body = {"model": model, "messages": [{"role": "system", "content": system}, {"role": "user", "content": user}],
                "stream": True}
        if not a.no_json_mode:
            body["response_format"] = {"type": "json_object"}
        if a.effort == "none":
            body["thinking"] = {"type": "disabled"}
        else:
            body["thinking"] = {"type": "enabled"}
            body["reasoning_effort"] = self.efforts[a.effort]
        if a.max_tokens:
            body["max_tokens"] = a.max_tokens
        if a.temperature is not None:              # thinking mode ignores it (DeepSeek: no error, no effect)
            body["temperature"] = a.temperature
        return self.url, {"Authorization": "Bearer <key>"}, body

    def complete(self, system: str, user: str, model: str) -> Reply:
        url, headers, body = self.request(system, user, model)
        headers["Authorization"] = f"Bearer {self.key()}"
        raw = _post_json(url, headers, body, self.args.timeout, read=_read_sse)
        choices = raw.get("choices") or []
        if not choices:
            raise ProviderError(f"no choices in the reply: {json.dumps(raw)[:800]}")
        message = choices[0].get("message") or {}
        text = message.get("content") or ""
        finish = choices[0].get("finish_reason")
        if not text.strip():
            finish = f"{finish}: blank content" + (" (JSON Output blanks a reply it cannot read as JSON)" if finish == "stop" else "")
        u = raw.get("usage") or {}
        usage = {"input": u.get("prompt_tokens"), "output": u.get("completion_tokens"),
                 "thinking": (u.get("completion_tokens_details") or {}).get("reasoning_tokens"),
                 "total": u.get("total_tokens"), "cached": u.get("prompt_cache_hit_tokens"), "finish": finish}
        reply = Reply(text, usage, raw)
        if self.args.include_thoughts and message.get("reasoning_content"):
            reply.thoughts = [message["reasoning_content"]]
        reply.config = {k: v for k, v in body.items() if k != "messages"}
        reply.raw_usage = u
        return reply


class ChatCompletions(DeepSeek):
    """Any OpenAI-compatible Chat Completions endpoint at ``--base-url`` (a self-hosted model server, a
    gateway or proxy): ``<base-url>/chat/completions``, streamed like DeepSeek, with the bearer key read from
    the environment variable named by ``--api-key-env`` (default CHAT_COMPLETIONS_API_KEY).

    Only the portable request fields are sent (model, messages, stream with usage, max_tokens,
    temperature): no thinking or JSON-mode fields, whose names differ between servers. Usage is reported in
    the shared shape; the cache read is taken from ``prompt_tokens_details.cached_tokens`` (OpenAI's field)
    or ``prompt_cache_hit_tokens`` (DeepSeek's), the cache write from ``cache_creation_input_tokens`` where a
    server reports it. A field the server does not report stays None (unknown), never zero."""

    name = "chat-completions"
    default_model = None
    env_keys = ("CHAT_COMPLETIONS_API_KEY",)

    def __init__(self, args):
        self.args = args
        base = getattr(args, "base_url", None)
        if not base:
            raise ProviderError("--provider chat-completions needs --base-url (e.g. http://127.0.0.1:8000/v1)")
        self.url = base.rstrip("/") + "/chat/completions"
        self.key_env = getattr(args, "api_key_env", None) or "CHAT_COMPLETIONS_API_KEY"
        self.env_keys = (self.key_env,)

    def key(self) -> str:
        if os.environ.get(self.key_env):
            return os.environ[self.key_env]
        raise ProviderError(f"set {self.key_env}")

    def request(self, system: str, user: str, model: str) -> tuple[str, dict, dict]:
        a = self.args
        if not model:
            raise ProviderError("--provider chat-completions needs --model (the server has no default here)")
        body = {"model": model, "messages": [{"role": "system", "content": system}, {"role": "user", "content": user}],
                "stream": True, "stream_options": {"include_usage": True}}
        if a.max_tokens:
            body["max_tokens"] = a.max_tokens
        if a.temperature is not None:
            body["temperature"] = a.temperature
        return self.url, {"Authorization": "Bearer <key>"}, body

    def complete(self, system: str, user: str, model: str) -> Reply:
        reply = super().complete(system, user, model)
        u = reply.raw_usage or {}
        cached = (u.get("prompt_tokens_details") or {}).get("cached_tokens")
        reply.usage["cached"] = cached if cached is not None else u.get("prompt_cache_hit_tokens")
        reply.usage["cache_write"] = u.get("cache_creation_input_tokens")
        return reply


class Anthropic:
    """Anthropic (the Claude models) through the Messages REST API.

    Caching, per Anthropic's prompt-caching guide: explicit only. A ``cache_control`` breakpoint on a
    content block caches the whole prefix up to it (a write is billed at 1.25x the input rate for the
    default 5-minute lifetime, a read at 0.1x); a prefix shorter than the model's minimum is sent
    uncached without an error. The catalog is therefore the system prompt, one text block ending in a
    breakpoint, and the item is the user message after it: the first call writes the catalog, later
    calls read it, and the item is plain input. No priming is needed. ``--no-cache`` drops the breakpoint.

    Thinking: on the current models (Claude Sonnet 5.5, Opus 5.5, Fable 5.1 and their predecessors from
    4.7) thinking is adaptive and always on — a token budget (``thinking: {type: enabled, budget_tokens}``)
    or ``{type: disabled}`` is refused with a 400 —, and the depth is set by ``output_config.effort``, whose
    levels are ours (low / medium / high / xhigh / max); ``--effort none`` and ``--no-thinking`` send the
    lowest, low. Thinking tokens count against ``max_tokens`` (default ``MAX_TOKENS``). Sampling settings
    are not sent: the API version below refuses a temperature on every model. With ``--include-thoughts``
    the request asks for the summarized thinking (``display: summarized``; the text is empty otherwise)
    and the blocks come back as ``thoughts``.

    A reply the model's safety classifiers decline arrives with ``stop_reason: refusal`` and no text: it is
    raised as a ProviderError naming the category, like a Gemini safety block, never parsed; a reply cut
    by ``max_tokens`` is raised too. The Messages API has no JSON mode here: the reply is read by
    ``extract_json`` like any other.
    Usage is reported in the shape the other providers use: ``input`` is the whole prompt (uncached +
    cache read + cache write, Anthropic counts them apart), ``cached`` the cache read, ``cache_write``
    the cache write; ``raw_usage`` keeps Anthropic's own fields."""

    name = "anthropic"
    default_model = "claude-sonnet-5-5"
    env_keys = ("ANTHROPIC_API_KEY",)
    url = "https://api.anthropic.com/v1/messages"
    version = "2026-10-21"                                 # the current API version: no sampling fields
    EFFORTS = ("low", "medium", "high", "xhigh", "max")    # output_config.effort, the same names as ours
    MAX_TOKENS = 16000                                     # thinking tokens count against it

    def __init__(self, args):
        self.args = args

    def key(self) -> str:
        if os.environ.get("ANTHROPIC_API_KEY"):
            return os.environ["ANTHROPIC_API_KEY"]
        raise ProviderError("set ANTHROPIC_API_KEY")

    def request(self, system: str, user: str, model: str) -> tuple[str, dict, dict]:
        a = self.args
        block = {"type": "text", "text": system}
        if not getattr(a, "no_cache", False):
            block["cache_control"] = {"type": "ephemeral"}
        effort = a.effort if a.effort in self.EFFORTS and not getattr(a, "no_thinking", False) else "low"
        body = {"model": model, "system": [block], "messages": [{"role": "user", "content": user}],
                "max_tokens": a.max_tokens or self.MAX_TOKENS, "output_config": {"effort": effort}}
        if getattr(a, "include_thoughts", False):
            body["thinking"] = {"type": "adaptive", "display": "summarized"}
        return self.url, {"x-api-key": "<key>", "anthropic-version": self.version}, body

    def complete(self, system: str, user: str, model: str) -> Reply:
        url, headers, body = self.request(system, user, model)
        headers["x-api-key"] = self.key()
        raw = _post_json(url, headers, body, self.args.timeout, long_waits=PATIENT_WAITS, long_codes=(429, 529))
        stop = raw.get("stop_reason")
        if stop == "refusal":                              # declined by the safety classifiers: no text to parse
            details = raw.get("stop_details") or {}
            raise ProviderError(f"refused by the model (stop_reason refusal, category {details.get('category')!r}): "
                                f"{details.get('explanation') or ''}".rstrip(": "))
        if stop == "max_tokens":
            raise ProviderError(f"the reply was cut by max_tokens ({body.get('max_tokens')}): raise --max-tokens")
        blocks = raw.get("content") or []
        text = "".join(b.get("text", "") for b in blocks if b.get("type") == "text")
        thoughts = [b.get("thinking", "") for b in blocks if b.get("type") == "thinking"]
        u = raw.get("usage") or {}
        uncached, read, write = (u.get("input_tokens") or 0), (u.get("cache_read_input_tokens") or 0), \
            (u.get("cache_creation_input_tokens") or 0)
        usage = {"input": uncached + read + write, "output": u.get("output_tokens"),
                 "total": uncached + read + write + (u.get("output_tokens") or 0),
                 "cached": read, "cache_write": write, "finish": raw.get("stop_reason"),
                 "service_tier": u.get("service_tier")}
        reply = Reply(text, usage, raw)
        if self.args.include_thoughts and thoughts:
            reply.thoughts = thoughts
        reply.config = {k: v for k, v in body.items() if k not in ("system", "messages")}
        reply.raw_usage = u
        return reply


PROVIDERS = {p.name: p for p in (Google, OpenAI, DeepSeek, ChatCompletions, Anthropic)}


# --------------------------------------------------------------------------
# the parse
# --------------------------------------------------------------------------


def item_message(item_id: str, text: str) -> str:
    return f'Item id: {item_id}\nTEXT: {text}\n\nWrite the JSON object for this item.'


def extract_json(text: str):
    """The reply as a JSON object: strip code fences or stray prose around the braces."""
    t = text.strip()
    t = re.sub(r"^```(?:json)?\s*|\s*```$", "", t, flags=re.S)
    try:
        return json.loads(t)
    except json.JSONDecodeError:
        start, end = t.find("{"), t.rfind("}")
        if start >= 0 and end > start:
            return json.loads(t[start:end + 1])
        raise


def prime(args) -> dict | None:
    """Prime the provider's cache with the instruction set alone; None when the provider has no priming."""
    provider = PROVIDERS[args.provider](args)
    if not hasattr(provider, "prime") or getattr(args, "layout", "turns") != "turns":
        return None
    with open(args.prompt, encoding="utf-8") as fh:
        system = fh.read()
    return provider.prime(system, args.model or provider.default_model)


def cache_lost(usage: dict | None) -> bool:
    """A reply long enough to be cached came back without cached tokens: the catalog is not in the cache."""
    u = usage or {}
    return (u.get("input") or 0) >= CACHE_MIN_TOKENS and not u.get("cached")


def parse_sentence(text: str, args, item_id: str = "item") -> dict:
    """One sentence -> the run record (the parsed JSON object under ``response``)."""
    with open(args.prompt, encoding="utf-8") as fh:
        system = fh.read()
    provider = PROVIDERS[args.provider](args)
    model = args.model or provider.default_model
    user = item_message(item_id, text)
    record = {"provider": args.provider, "model": model, "effort": args.effort,
              "temperature": args.temperature, "prompt_path": os.path.relpath(args.prompt, ROOT),
              "prompt_sha256": hashlib.sha256(system.encode("utf-8")).hexdigest(),
              "item": {"id": item_id, "text": text}}
    if args.dry_run:
        url, headers, body = provider.request(system, user, model)
        shown = json.loads(json.dumps(body))
        if "system_instruction" in shown:
            shown["system_instruction"] = {"parts": [{"text": f"<{len(system)} chars of {record['prompt_path']}>"}]}
        for turn in shown.get("contents") or []:
            for part in turn.get("parts") or []:
                if part.get("text") == system:
                    part["text"] = f"<{len(system)} chars of {record['prompt_path']}>"
        if "instructions" in shown:
            shown["instructions"] = f"<{len(system)} chars of {record['prompt_path']}>"
        for block in shown.get("system") if isinstance(shown.get("system"), list) else []:  # anthropic: system blocks
            if block.get("text") == system:
                block["text"] = f"<{len(system)} chars of {record['prompt_path']}>"
        for msg in (shown.get("input") if isinstance(shown.get("input"), list) else []) + (shown.get("messages") or []):
            if msg.get("content") == system:
                msg["content"] = f"<{len(system)} chars of {record['prompt_path']}>"
            for part in msg["content"] if isinstance(msg.get("content"), list) else []:
                if part.get("text") == system:
                    part["text"] = f"<{len(system)} chars of {record['prompt_path']}>"
        record["request"] = {"url": url, "headers": headers, "body": shown}
        return record
    if getattr(args, "prime", False) and hasattr(provider, "prime") and getattr(args, "layout", "turns") == "turns":
        record["prime"] = provider.prime(system, model)
    reply = provider.complete(system, user, model)
    record["usage"] = reply.usage
    record["request_config"] = getattr(reply, "config", None)
    record["raw_usage"] = getattr(reply, "raw_usage", None)
    if getattr(reply, "thoughts", None):
        record["thoughts"] = reply.thoughts
    record["raw_text"] = reply.text
    try:
        record["response"] = extract_json(reply.text)
    except json.JSONDecodeError as exc:
        record["response"] = None
        record["error"] = f"the reply is not valid JSON: {exc}"
    return record


def add_provider_args(ap: argparse.ArgumentParser) -> None:
    """The provider, model, effort and request flags ``parse_sentence`` reads from ``args``;
    shared with the suite runner (templates/tmpl/suite.py), which adds them to its own parser."""
    ap.add_argument("--provider", choices=sorted(PROVIDERS), default="google")
    ap.add_argument("--model", default=None, help="model name (default: the provider's default)")
    ap.add_argument("--base-url", default=None,
                    help="chat-completions: the OpenAI-compatible API base, e.g. http://127.0.0.1:8000/v1 (required for it)")
    ap.add_argument("--api-key-env", default="CHAT_COMPLETIONS_API_KEY",
                    help="chat-completions: environment variable holding the bearer key (default: CHAT_COMPLETIONS_API_KEY)")
    ap.add_argument("--effort", choices=EFFORTS, default="low",
                    help="reasoning effort (default: low). Gemini 3+: a thinking level (none -> LOW, the lowest level every model offers; "
                         "xhigh / max -> HIGH, the highest); Gemini 2.x: a thinking budget (none -> 0); "
                         "OpenAI: reasoning.effort, xhigh and max as sent (none -> not sent, the model's default); DeepSeek: reasoning_effort "
                         "(medium / xhigh -> high, DeepSeek's own mapping; max as sent; none -> thinking disabled); "
                         "Anthropic: output_config.effort as named (none -> low; thinking is adaptive and always on)")
    ap.add_argument("--prompt", default=DEFAULT_PROMPT, help="instruction set file (default: the generated catalog prompt)")
    ap.add_argument("--temperature", type=float, default=None,
                    help="sampling temperature; default: not sent, the model's own default applies (Gemini 4 Argon ignores "
                         "sampling parameters altogether; for Gemini 3 Google recommends its default of 1.0)")
    ap.add_argument("--max-tokens", type=int, default=None)
    ap.add_argument("--timeout", type=float, default=600.0, help="seconds to wait for a reply (default 600; long thinking runs need it)")
    ap.add_argument("--thinking-budget", type=int, default=None,
                    help="gemini 1.x / 2.x: thinking token budget, 0 = off where allowed, -1 = dynamic (overrides --effort)")
    ap.add_argument("--thinking-level", choices=("minimal", "low", "medium", "high"), default=None,
                    help="gemini 3 and later: thinking level (overrides --effort; a model errors on a level it does not offer)")
    ap.add_argument("--no-thinking", action="store_true", help="send no thinking configuration at all")
    ap.add_argument("--no-json-mode", action="store_true",
                    help="do not request application/json replies (diagnostic: JSON mode may interact with thinking)")
    ap.add_argument("--include-thoughts", action="store_true",
                    help="google: ask for thought summaries (includeThoughts); deepseek: keep the reasoning_content; "
                         "kept in the run record, counted on stderr")
    ap.add_argument("--layout", choices=("turns", "system"), default="turns",
                    help="google: where the instruction set goes. turns (default): the catalog as the first user turn, a fixed "
                         "model acknowledgement, then the item — primable, so the catalog is cached across items; system: as the "
                         "system instruction (the layout before 2026-10-18; never cached across items)")
    ap.add_argument("--prime", action="store_true",
                    help="send the catalog alone once before the call, so the catalog is served from the implicit cache (the suite runner primes by itself)")
    ap.add_argument("--no-cache", action="store_true",
                    help="anthropic: send the catalog without a cache_control breakpoint (default: cached, the first call writes the catalog and later calls read it)")
    ap.add_argument("--service-tier", choices=("auto", "default", "flex", "priority"), default=None,
                    help="openai and google: the processing tier (service_tier; google takes flex or priority); default: not sent, "
                         "the standard tier. flex: half price and slower — OpenAI may answer 429 Resource Unavailable, Gemini 503 or 429 "
                         "while at capacity (not billed), retried for up to about ten minutes; Gemini's Flex queue can hold a request "
                         "for minutes (give it --timeout 1200; OpenAI's flex --timeout 900)")


def validate_reply(reply: dict, reference_time=None, text: str | None = None) -> dict:
    """Run the catalog's validator on the parsed reply and return its result (report only)."""
    sys.path.insert(0, os.path.join(ROOT, "templates"))
    try:
        from tmpl import validate as V
    except Exception as exc:  # no pyyaml, or the templates tree is missing
        return {"status": "skipped", "summary": f"validation skipped: {exc}", "findings": [], "typecheck": "not run"}
    res = V.validate(reply, reference_time=reference_time, text=text)
    keep = {k: res.get(k) for k in ("status", "findings", "typecheck", "statements", "declarations", "fired", "null_slots")}
    keep["summary"] = V.summary(res)
    return keep


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0], formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("text", help="the English sentence to parse")
    add_provider_args(ap)
    ap.add_argument("--id", default="item", help="the item id written into the request and expected back")
    ap.add_argument("--out", default=None, help="write the full run record (request parameters, usage, raw text, parsed reply) here")
    ap.add_argument("--raw", action="store_true", help="print the reply text as received instead of the parsed JSON")
    ap.add_argument("--dry-run", action="store_true", help="show the request that would be sent and call nothing")
    ap.add_argument("--no-validate", action="store_true", help="do not run the catalog's validator on the reply")
    ap.add_argument("--atoms", action="store_true", help="also print the emitted statements and declarations")
    ap.add_argument("--statements-only", action="store_true",
                    help="print only the emitted statements, one per line (the chainer's input); the reply and the declarations are not printed")
    ap.add_argument("--reference-time", default=None,
                    help="the text's reference time as an ISO date (YYYY-MM-DD, optionally THH:MM): gives the anchor `now` its calendar fields; 'today' = the system date")
    args = ap.parse_args(argv)
    if args.statements_only and args.no_validate:
        ap.error("--statements-only needs the validator, which emits the statements: drop --no-validate")
    if args.reference_time == "today":
        import datetime
        args.reference_time = datetime.date.today().isoformat()

    try:
        record = parse_sentence(args.text, args, args.id)
    except ProviderError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1
    if not args.dry_run and not args.no_validate and record.get("response") is not None:
        record["validation"] = validate_reply(record["response"], args.reference_time, args.text)
    if args.out:
        with open(args.out, "w", encoding="utf-8") as fh:
            json.dump(record, fh, indent=2, ensure_ascii=False)
    if args.dry_run:
        print(json.dumps(record["request"], indent=2, ensure_ascii=False))
        return 0
    v = record.get("validation")
    if args.statements_only:                      # stdout carries the statements alone
        if record.get("response") is None:
            print(record["raw_text"], file=sys.stderr)
        elif v and v.get("statements"):
            print("\n".join(v["statements"]))
        elif v:
            print(f"[no statements: {v['summary']}]", file=sys.stderr)
    elif args.raw or record.get("response") is None:
        print(record["raw_text"])
    else:
        print(json.dumps(record["response"], indent=2, ensure_ascii=False))
    if args.atoms and not args.statements_only and v and v.get("statements"):
        print("\n; statements")
        print("\n".join(v["statements"]))
        print("; declarations")
        print("\n".join(v["declarations"]))
    u = record.get("usage") or {}
    write = f" cache_write={u.get('cache_write')}" if "cache_write" in u else ""
    print(f"[{record['provider']} {record['model']} effort={record['effort']} tokens in={u.get('input')} "
          f"cached={u.get('cached')}{write} out={u.get('output')} thinking={u.get('thinking')} total={u.get('total')} "
          f"thought_parts={u.get('thought_parts')} finish={u.get('finish')}]", file=sys.stderr)
    if v:
        print(f"[{v['summary']}]", file=sys.stderr)
        for f in v["findings"]:
            print(f"  - {f['kind']}: {f['detail']}", file=sys.stderr)
    if record.get("error"):
        print(f"error: {record['error']}", file=sys.stderr)
        return 2
    if v and (v["status"] not in ("ok", "skipped") or v["findings"]):
        return 3
    return 0


if __name__ == "__main__":
    sys.exit(main())
