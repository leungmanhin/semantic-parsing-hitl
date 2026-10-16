#!/usr/bin/env python3
"""semantic-parse.py — parse one English sentence into template instances with an LLM.

The instruction set is the generated catalog prompt (templates/generated/PROMPT_CATALOG.txt by
default); the sentence is sent as one item; the model's JSON object (instances, unmapped spans,
issues) is printed.  Providers are pluggable: one small class per provider, selected by name.

    python semantic-parse.py "Teodor gave Yusra a thermos."
    python semantic-parse.py "…" --provider google --model gemini-2.5-flash --effort low
    python semantic-parse.py "…" --out run.json          # keep the full run record
    python semantic-parse.py "…" --dry-run               # show the request, call nothing

Keys come from the environment: GEMINI_API_KEY (or GOOGLE_API_KEY), OPENAI_API_KEY,
ANTHROPIC_API_KEY.  Only the standard library is used.

Exit status: 0 the reply is a JSON object; 2 the reply is not valid JSON (the raw text is
printed); 1 a request failed.
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
EFFORTS = ("none", "low", "medium", "high")


# --------------------------------------------------------------------------
# providers
# --------------------------------------------------------------------------


class ProviderError(Exception):
    pass


class Reply:
    def __init__(self, text: str, usage: dict, raw: dict):
        self.text, self.usage, self.raw = text, usage, raw


def _post_json(url: str, headers: dict, body: dict, timeout: float, attempts: int = 3) -> dict:
    """POST a JSON body; retry on 429 / 5xx with backoff; raise ProviderError otherwise."""
    data = json.dumps(body).encode("utf-8")
    last = None
    for attempt in range(1, attempts + 1):
        req = urllib.request.Request(url, data=data, method="POST",
                                     headers={"Content-Type": "application/json", **headers})
        try:
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return json.loads(resp.read().decode("utf-8"))
        except urllib.error.HTTPError as exc:
            detail = exc.read().decode("utf-8", "replace")[:2000]
            last = f"HTTP {exc.code}: {detail}"
            if exc.code in (429, 500, 502, 503, 504) and attempt < attempts:
                time.sleep(2 ** attempt)
                continue
            raise ProviderError(last) from None
        except urllib.error.URLError as exc:
            last = f"network error: {exc.reason}"
            if attempt < attempts:
                time.sleep(2 ** attempt)
                continue
            raise ProviderError(last) from None
        except (http.client.RemoteDisconnected, ConnectionResetError, TimeoutError, OSError) as exc:
            # the server closed the connection (long thinking runs do this) or the client timed out
            last = f"connection dropped before a reply ({exc.__class__.__name__}: {exc}); attempt {attempt} of {attempts}"
            if attempt < attempts:
                time.sleep(2 ** attempt)
                continue
            raise ProviderError(last + " — raise --timeout, lower the thinking level, or retry") from None
    raise ProviderError(last or "request failed")


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
    budgets = {"none": 0, "low": 1024, "medium": 8192, "high": 24576}
    levels = {"none": "LOW", "low": "LOW", "medium": "MEDIUM", "high": "HIGH"}

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
        body = {"system_instruction": {"parts": [{"text": system}]},
                "contents": [{"role": "user", "parts": [{"text": user}]}],
                "generationConfig": gen}
        url = f"https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent"
        return url, {"x-goog-api-key": "<key>"}, body

    def complete(self, system: str, user: str, model: str) -> Reply:
        url, headers, body = self.request(system, user, model)
        headers["x-goog-api-key"] = self.key()
        raw = _post_json(url, headers, body, self.args.timeout)
        cands = raw.get("candidates") or []
        if not cands:
            raise ProviderError(f"no candidates in the reply: {json.dumps(raw)[:800]}")
        parts = (cands[0].get("content") or {}).get("parts") or []
        text = "".join(p.get("text", "") for p in parts if not p.get("thought"))
        thoughts = [p.get("text", "") for p in parts if p.get("thought")]
        u = raw.get("usageMetadata") or {}
        usage = {"input": u.get("promptTokenCount"), "output": u.get("candidatesTokenCount"),
                 "thinking": u.get("thoughtsTokenCount"), "total": u.get("totalTokenCount"),
                 "finish": cands[0].get("finishReason"), "thought_parts": len(thoughts)}
        reply = Reply(text, usage, raw)
        reply.thoughts = thoughts
        reply.config = body["generationConfig"]
        reply.raw_usage = u
        return reply


class OpenAI:
    """OpenAI through the Responses REST API. Written to the documented shape; not yet exercised."""

    name = "openai"
    default_model = "gpt-5-mini"
    env_keys = ("OPENAI_API_KEY",)

    def __init__(self, args):
        self.args = args

    def key(self) -> str:
        if os.environ.get("OPENAI_API_KEY"):
            return os.environ["OPENAI_API_KEY"]
        raise ProviderError("set OPENAI_API_KEY")

    def request(self, system: str, user: str, model: str) -> tuple[str, dict, dict]:
        a = self.args
        body = {"model": model, "instructions": system, "input": user,
                "text": {"format": {"type": "json_object"}}}
        if a.effort != "none":
            body["reasoning"] = {"effort": a.effort}
        if a.max_tokens:
            body["max_output_tokens"] = a.max_tokens
        return "https://api.openai.com/v1/responses", {"Authorization": "Bearer <key>"}, body

    def complete(self, system: str, user: str, model: str) -> Reply:
        url, headers, body = self.request(system, user, model)
        headers["Authorization"] = f"Bearer {self.key()}"
        raw = _post_json(url, headers, body, self.args.timeout)
        text = ""
        for item in raw.get("output") or []:
            for c in item.get("content") or []:
                if c.get("type") == "output_text":
                    text += c.get("text", "")
        u = raw.get("usage") or {}
        usage = {"input": u.get("input_tokens"), "output": u.get("output_tokens"),
                 "thinking": (u.get("output_tokens_details") or {}).get("reasoning_tokens"),
                 "total": u.get("total_tokens"), "finish": raw.get("status")}
        return Reply(text, usage, raw)


class Anthropic:
    """Placeholder: add when needed (Messages API)."""

    name = "anthropic"
    default_model = "claude-sonnet-5-5"
    env_keys = ("ANTHROPIC_API_KEY",)

    def __init__(self, args):
        self.args = args

    def request(self, system, user, model):
        raise ProviderError("the anthropic provider is not implemented yet")

    def complete(self, system, user, model):
        raise ProviderError("the anthropic provider is not implemented yet")


PROVIDERS = {p.name: p for p in (Google, OpenAI, Anthropic)}


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
        if "instructions" in shown:
            shown["instructions"] = f"<{len(system)} chars of {record['prompt_path']}>"
        record["request"] = {"url": url, "headers": headers, "body": shown}
        return record
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
    ap.add_argument("--effort", choices=EFFORTS, default="low",
                    help="reasoning effort (default: low). Gemini 3+: a thinking level (none -> LOW, the lowest level every model offers); Gemini 2.x: a thinking budget (none -> 0)")
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
                    help="ask for thought summaries (includeThoughts); kept in the run record, counted on stderr")


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0], formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("text", help="the English sentence to parse")
    add_provider_args(ap)
    ap.add_argument("--id", default="item", help="the item id written into the request and expected back")
    ap.add_argument("--out", default=None, help="write the full run record (request parameters, usage, raw text, parsed reply) here")
    ap.add_argument("--raw", action="store_true", help="print the reply text as received instead of the parsed JSON")
    ap.add_argument("--dry-run", action="store_true", help="show the request that would be sent and call nothing")
    args = ap.parse_args(argv)

    try:
        record = parse_sentence(args.text, args, args.id)
    except ProviderError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1
    if args.out:
        with open(args.out, "w", encoding="utf-8") as fh:
            json.dump(record, fh, indent=2, ensure_ascii=False)
    if args.dry_run:
        print(json.dumps(record["request"], indent=2, ensure_ascii=False))
        return 0
    if args.raw or record.get("response") is None:
        print(record["raw_text"])
    else:
        print(json.dumps(record["response"], indent=2, ensure_ascii=False))
    u = record.get("usage") or {}
    print(f"[{record['provider']} {record['model']} effort={record['effort']} tokens in={u.get('input')} "
          f"out={u.get('output')} thinking={u.get('thinking')} total={u.get('total')} "
          f"thought_parts={u.get('thought_parts')} finish={u.get('finish')}]", file=sys.stderr)
    if record.get("error"):
        print(f"error: {record['error']}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
