"""Tests for the Anthropic provider (semantic-parse.py, class Anthropic), with no network and no key.

* the key comes from ANTHROPIC_API_KEY only, and a missing key is a clear ProviderError;
* the model: --model wins, else the provider's default;
* the request: the catalog is one system block ending in a cache_control breakpoint (none with
  --no-cache), the item is the user message; thinking budgets per --effort, max_tokens above the budget,
  temperature only without thinking;
* the reply: text blocks joined, thinking blocks kept apart, usage in the shared shape (input = uncached
  + cache read + cache write) with Anthropic's own fields in raw_usage;
* HTTP errors become ProviderError.

Run from ``templates/``: ``python tests/test_anthropic.py``
"""
from __future__ import annotations

import argparse
import importlib.util
import os
import unittest
from unittest import mock

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir))
_spec = importlib.util.spec_from_file_location("semantic_parse", os.path.join(ROOT, "semantic-parse.py"))
SP = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(SP)


def args(*argv):
    ap = argparse.ArgumentParser()
    SP.add_provider_args(ap)
    ap.add_argument("--dry-run", action="store_true")                       # added by main(), not add_provider_args
    return ap.parse_args(["--provider", "anthropic", *argv])


REPLY = {"content": [{"type": "thinking", "thinking": "hmm"}, {"type": "text", "text": '{"instances": '},
                     {"type": "text", "text": "[]}"}],
         "stop_reason": "end_turn",
         "usage": {"input_tokens": 40, "cache_read_input_tokens": 5000, "cache_creation_input_tokens": 0,
                   "output_tokens": 120, "service_tier": "standard"}}


class AnthropicTest(unittest.TestCase):
    def test_registered(self):
        self.assertIs(SP.PROVIDERS["anthropic"], SP.Anthropic)

    def test_key_from_environment_only(self):
        p = SP.Anthropic(args())
        with mock.patch.dict(os.environ, {}, clear=True):
            with self.assertRaisesRegex(SP.ProviderError, "ANTHROPIC_API_KEY"):
                p.key()
        with mock.patch.dict(os.environ, {"ANTHROPIC_API_KEY": "k-test"}, clear=True):
            self.assertEqual(p.key(), "k-test")

    def test_request_caches_the_catalog(self):
        url, headers, body = SP.Anthropic(args("--effort", "none")).request("CATALOG", "ITEM", "m-1")
        self.assertEqual(url, "https://api.anthropic.com/v1/messages")
        self.assertEqual(headers["x-api-key"], "<key>")                    # never the key in the request
        self.assertEqual(body["model"], "m-1")
        self.assertEqual(body["system"], [{"type": "text", "text": "CATALOG", "cache_control": {"type": "ephemeral"}}])
        self.assertEqual(body["messages"], [{"role": "user", "content": "ITEM"}])
        self.assertNotIn("thinking", body)
        self.assertEqual(body["max_tokens"], SP.Anthropic.REPLY_TOKENS)

    def test_no_cache(self):
        _, _, body = SP.Anthropic(args("--no-cache")).request("CATALOG", "ITEM", "m-1")
        self.assertNotIn("cache_control", body["system"][0])

    def test_thinking_budget_and_temperature(self):
        _, _, body = SP.Anthropic(args("--effort", "medium", "--temperature", "0")).request("C", "I", "m")
        self.assertEqual(body["thinking"], {"type": "enabled", "budget_tokens": 4096})
        self.assertGreater(body["max_tokens"], 4096)
        self.assertNotIn("temperature", body)                              # refused with thinking on
        _, _, body = SP.Anthropic(args("--effort", "none", "--temperature", "0")).request("C", "I", "m")
        self.assertEqual(body["temperature"], 0.0)
        _, _, body = SP.Anthropic(args("--effort", "high", "--no-thinking")).request("C", "I", "m")
        self.assertNotIn("thinking", body)
        _, _, body = SP.Anthropic(args("--effort", "low", "--max-tokens", "3000")).request("C", "I", "m")
        self.assertEqual(body["max_tokens"], 3000)

    def test_complete_reply_and_usage(self):
        a = args("--effort", "low", "--include-thoughts")
        with mock.patch.dict(os.environ, {"ANTHROPIC_API_KEY": "k-test"}, clear=True), \
                mock.patch.object(SP, "_post_json", return_value=REPLY) as post:
            reply = SP.Anthropic(a).complete("CATALOG", "ITEM", "m-1")
        url, headers, body = post.call_args[0][:3]
        self.assertEqual(headers["x-api-key"], "k-test")
        self.assertEqual(headers["anthropic-version"], SP.Anthropic.version)
        self.assertEqual(reply.text, '{"instances": []}')
        self.assertEqual(reply.thoughts, ["hmm"])
        self.assertEqual(reply.usage["input"], 5040)
        self.assertEqual(reply.usage["cached"], 5000)
        self.assertEqual(reply.usage["cache_write"], 0)
        self.assertEqual(reply.usage["output"], 120)
        self.assertEqual(reply.usage["total"], 5160)
        self.assertEqual(reply.usage["finish"], "end_turn")
        self.assertEqual(reply.raw_usage, REPLY["usage"])
        self.assertNotIn("system", reply.config)
        self.assertNotIn("messages", reply.config)

    def test_http_error_is_provider_error(self):
        with mock.patch.dict(os.environ, {"ANTHROPIC_API_KEY": "k-test"}, clear=True), \
                mock.patch.object(SP, "_post_json", side_effect=SP.ProviderError("HTTP 400: bad")):
            with self.assertRaisesRegex(SP.ProviderError, "HTTP 400"):
                SP.Anthropic(args()).complete("C", "I", "m")

    def test_parse_sentence_end_to_end(self):
        a = args("--effort", "none")
        with mock.patch.dict(os.environ, {"ANTHROPIC_API_KEY": "k-test"}, clear=True), \
                mock.patch.object(SP, "_post_json", return_value=REPLY):
            rec = SP.parse_sentence("Teodor gave Yusra a thermos.", a, item_id="t1")
        self.assertEqual(rec["provider"], "anthropic")
        self.assertEqual(rec["model"], SP.Anthropic.default_model)
        self.assertEqual(rec["response"], {"instances": []})
        self.assertEqual(rec["usage"]["cached"], 5000)

    def test_dry_run_hides_the_catalog(self):
        rec = SP.parse_sentence("Teodor gave Yusra a thermos.", args("--dry-run"), item_id="t1")
        self.assertNotIn("x-api-key", {k: v for k, v in rec["request"]["headers"].items() if v != "<key>"})
        self.assertTrue(rec["request"]["body"]["system"][0]["text"].startswith("<"))


if __name__ == "__main__":
    unittest.main()
