"""Tests for the chat-completions provider (semantic-parse.py, class ChatCompletions): any OpenAI-compatible
Chat Completions endpoint at --base-url, with no network and no key.

* --base-url is required and the URL is <base-url>/chat/completions; --model is required (no default);
* the key comes from the variable named by --api-key-env only, and a missing key is a clear ProviderError;
* the request carries only the portable fields (no thinking / JSON-mode fields) and asks for usage in the stream;
* usage in the shared shape; a field the server does not report stays None, never zero.

Run from ``templates/``: ``python tests/test_chat_completions.py``
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
    ap.add_argument("--dry-run", action="store_true")
    return ap.parse_args(["--provider", "chat-completions", *argv])


def reply(usage):
    r = {"choices": [{"message": {"role": "assistant", "content": '{"instances": []}'}, "finish_reason": "stop"}]}
    if usage is not None:
        r["usage"] = usage
    return r


class ChatCompletionsTest(unittest.TestCase):
    def test_registered(self):
        self.assertIs(SP.PROVIDERS["chat-completions"], SP.ChatCompletions)

    def test_base_url_required(self):
        with self.assertRaisesRegex(SP.ProviderError, "--base-url"):
            SP.ChatCompletions(args())

    def test_url_and_model(self):
        p = SP.ChatCompletions(args("--base-url", "http://127.0.0.1:8000/v1/"))
        url, headers, body = p.request("CATALOG", "ITEM", "agent/x")
        self.assertEqual(url, "http://127.0.0.1:8000/v1/chat/completions")
        self.assertEqual(headers["Authorization"], "Bearer <key>")
        self.assertEqual(body["model"], "agent/x")
        self.assertEqual(body["stream_options"], {"include_usage": True})
        self.assertEqual([m["role"] for m in body["messages"]], ["system", "user"])
        for k in ("thinking", "reasoning_effort", "response_format"):
            self.assertNotIn(k, body)
        with self.assertRaisesRegex(SP.ProviderError, "--model"):
            p.request("C", "I", None)

    def test_key_from_named_variable(self):
        p = SP.ChatCompletions(args("--base-url", "http://h/v1", "--api-key-env", "GW_TOKEN"))
        with mock.patch.dict(os.environ, {}, clear=True):
            with self.assertRaisesRegex(SP.ProviderError, "GW_TOKEN"):
                p.key()
        with mock.patch.dict(os.environ, {"GW_TOKEN": "t"}, clear=True):
            self.assertEqual(p.key(), "t")

    def complete(self, usage):
        p = SP.ChatCompletions(args("--base-url", "http://h/v1"))
        with mock.patch.dict(os.environ, {"CHAT_COMPLETIONS_API_KEY": "k"}, clear=True), \
                mock.patch.object(SP, "_post_json", return_value=reply(usage)) as post:
            r = p.complete("CATALOG", "ITEM", "m")
        self.assertEqual(post.call_args[0][1]["Authorization"], "Bearer k")
        return r

    def test_usage_openai_shape(self):
        r = self.complete({"prompt_tokens": 3100, "completion_tokens": 50, "total_tokens": 3150,
                           "prompt_tokens_details": {"cached_tokens": 3000}})
        self.assertEqual(r.text, '{"instances": []}')
        self.assertEqual((r.usage["input"], r.usage["cached"], r.usage["output"]), (3100, 3000, 50))
        self.assertIsNone(r.usage["cache_write"])

    def test_usage_partial_stays_unknown(self):
        r = self.complete({"prompt_tokens": 3100, "completion_tokens": 50})
        self.assertEqual((r.usage["input"], r.usage["output"]), (3100, 50))
        self.assertIsNone(r.usage["cached"])
        self.assertIsNone(r.usage["cache_write"])

    def test_no_usage_stays_unknown(self):
        r = self.complete(None)
        for k in ("input", "output", "cached", "cache_write", "total"):
            self.assertIsNone(r.usage[k], k)


if __name__ == "__main__":
    unittest.main()
