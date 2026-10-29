"""The coverage instrument: a deterministic stratified sample that respects quotas and keeps whole
documents where asked, and a report that classifies replies without any parser call."""
from __future__ import annotations

import json
import os
import shutil
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import catalog as CAT, coverage as C  # noqa: E402

CATALOG = CAT.load()


def rec(ds, doc, i, text, **kw):
    return {"id": f"{ds}-t-{doc}-{i:03d}", "dataset": ds, "split": "t", "doc": str(doc), "sent": i, "text": text, "prev": [], "register": "x", **kw}


class CoverageTests(unittest.TestCase):
    def setUp(self):
        self.dir = tempfile.mkdtemp()
        self.prepared = os.path.join(self.dir, "prepared")
        os.makedirs(self.prepared)
        rows = [rec("hotpotqa", d, i, f"Sentence {i} of document {d} is here.") for d in range(20) for i in range(5)]
        with open(os.path.join(self.prepared, "hotpotqa.validation.jsonl"), "w") as fh:
            fh.write("\n".join(json.dumps(r) for r in rows) + "\n")
        stories = [rec("clutrr", d, i, f"Person {d} and sibling {i} went to the park.") for d in range(10) for i in range(4)]
        with open(os.path.join(self.prepared, "clutrr.gen_train23_test2to10.test.jsonl"), "w") as fh:
            fh.write("\n".join(json.dumps(r) for r in stories) + "\n")
        C.PLANS["tiny"] = [("hotpotqa.validation", 12, "spread", None), ("clutrr.gen_train23_test2to10.test", 10, "documents", None),
                           ("missing.file", 5, "spread", None)]

    def tearDown(self):
        shutil.rmtree(self.dir, ignore_errors=True)
        C.PLANS.pop("tiny", None)

    def test_sample_is_deterministic_spread_and_keeps_documents_whole(self):
        out = os.path.join(self.dir, "s.jsonl")
        a = C.sample("tiny", 3, self.prepared, out)
        b = C.sample("tiny", 3, self.prepared, out)
        self.assertEqual([r["id"] for r in a], [r["id"] for r in b])
        hot = [r for r in a if r["dataset"] == "hotpotqa"]
        self.assertEqual(len(hot), 12)
        self.assertEqual(len({r["doc"] for r in hot}), 12)                       # spread: one sentence per document first
        clu = [r for r in a if r["dataset"] == "clutrr"]
        self.assertGreaterEqual(len(clu), 10)
        docs = {r["doc"] for r in clu}
        self.assertEqual(len(clu), 4 * len(docs))                                # whole stories, never a fragment of one
        self.assertTrue(all(r["sample"]["plan"] == "tiny" and r["sample"]["seed"] == 3 for r in a))
        c = C.sample("tiny", 4, self.prepared, out)
        self.assertNotEqual([r["id"] for r in a], [r["id"] for r in c])         # another seed, another draw

    def test_report_classifies_replies(self):
        parsed = [
            {**rec("hotpotqa", 1, 0, "Yusra left."), "sample": {"group": "hotpotqa.validation"},
             "reply": {"model": "fake", "manifest_id": "abc", "usage": {"input": 10, "cached": 8, "output": 2, "total": 12},
                       "response": {"id": "x", "instances": [{"t": "named-entity", "id": "n1", "name": "Yusra", "span": "Yusra"},
                                                               {"t": "motion", "id": "m1", "verb": "leave", "mover": "@n1", "tense": "past", "span": "Yusra left"}]}}},
            {**rec("hotpotqa", 2, 0, "Yusra left reluctantly."), "sample": {"group": "hotpotqa.validation"},
             "reply": {"model": "fake", "manifest_id": "abc", "usage": {},
                       "response": {"id": "y", "instances": [{"t": "named-entity", "id": "n1", "name": "Yusra", "span": "Yusra"},
                                                               {"t": "motion", "id": "m1", "verb": "leave", "mover": "@n1", "tense": "past", "span": "Yusra left"}],
                                    "unmapped": [{"span": "reluctantly", "code": "G02"}]}}},
            {**rec("drop", 3, 0, "Nothing here."), "sample": {"group": "drop.dev/history"},
             "reply": {"model": "fake", "manifest_id": "abc", "usage": {}, "response": {"id": "z", "instances": [], "unmapped": [{"span": "Nothing here.", "code": "G00"}]}}},
            {**rec("drop", 4, 0, "Broken."), "sample": {"group": "drop.dev/history"}, "reply": {"error": "request failed", "response": None}},
        ]
        a = C.assess(parsed, CATALOG, typecheck=False)
        self.assertEqual([x["outcome"] for x in a["rows"]], ["covered", "partial", "none", "error"])
        self.assertEqual(a["overall"]["covered"], 1)
        self.assertEqual(a["gap_codes"], {"G02": 1, "G00": 1})
        self.assertEqual(a["by_group"]["hotpotqa.validation"]["covered_rate"], 0.5)
        self.assertIn("motion", a["fired"])
        text = C.render_report(a, "abc", "fake")
        self.assertIn("| hotpotqa.validation | 2 | 1 | 1 |", text)
        self.assertIn("G02: 1", text)


if __name__ == "__main__":
    unittest.main(verbosity=1)
