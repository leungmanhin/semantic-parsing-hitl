"""The parse viewer: one page with every parsed sentence and its emitted statements; a failed parse
is shown, never dropped; two sentences that share an id (an older sample cut ids short) both stay."""
from __future__ import annotations

import io
import json
import os
import shutil
import sys
import tempfile
import unittest
from contextlib import redirect_stdout

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import catalog as CAT, viewer as V  # noqa: E402

CATALOG = CAT.load()


def example(tid, text):
    return next(e for e in CATALOG[tid]["examples"]["held_out"] if e["text"] == text)


class ViewerTests(unittest.TestCase):
    def setUp(self):
        self.dir = tempfile.mkdtemp()
        ex = example("location", "Bram slept outdoors.")
        reply = lambda insts: {"model": "fake-1", "manifest_id": "abc", "response": {"id": "x", "instances": insts, "unmapped": []}}
        rows = [
            {"id": "wikitext-103-test-Same-000", "dataset": "wikitext-103", "doc": "A#0", "text": ex["text"], "reply": reply(ex["instances"])},
            {"id": "wikitext-103-test-Same-000", "dataset": "wikitext-103", "doc": "A#1", "text": "Another sentence.", "reply": reply([])},
            {"id": "sick-all-x-000", "dataset": "sick", "doc": "x", "family": "sick:f", "role": "mine", "text": "A badger sleeps",
             "reply": {"error": "request failed: HTTP 503", "response": None}},
        ]
        self.parsed = os.path.join(self.dir, "p.parsed.jsonl")
        with open(self.parsed, "w", encoding="utf-8") as fh:
            fh.write("".join(json.dumps(r) + "\n" for r in rows))

    def tearDown(self):
        shutil.rmtree(self.dir, ignore_errors=True)

    def test_page_holds_every_sentence_and_its_statements(self):
        out = os.path.join(self.dir, "v.html")
        with redirect_stdout(io.StringIO()):
            self.assertEqual(V.main(["--parsed", self.parsed, "--out", out]), 0)
        page = open(out, encoding="utf-8").read()
        blob = page.split('<script id="data" type="application/json">', 1)[1].split("</script>", 1)[0]
        data = json.loads(blob.replace("<\\/", "</"))
        texts = [r["text"] for r in data["rows"]]
        self.assertEqual(len(texts), 3)                                          # the shared id keeps both sentences
        bram = next(r for r in data["rows"] if r["text"] == "Bram slept outdoors.")
        self.assertIn("(Location sk_sleep_1 outdoors)", " ".join(bram["statements"]))
        failed = next(r for r in data["rows"] if r["dataset"] == "sick")
        self.assertTrue(failed["error"].startswith("no parse"))                   # shown, not dropped

    def test_show_prints_the_statements(self):
        buf = io.StringIO()
        with redirect_stdout(buf):
            V.main(["--parsed", self.parsed, "--show", "slept outdoors"])
        self.assertIn("(Location sk_sleep_1 outdoors)", buf.getvalue())


if __name__ == "__main__":
    unittest.main(verbosity=1)
