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

    def test_spans_reported_by_convention_are_not_gaps(self):
        """A quotation's wording (G10), a ticker tag (G03) or a connective opening the text (G05) is reported by
        the catalog's own convention: a sentence whose only unmapped spans carry such a code is covered, and
        one with a gap code beside them is partial. Both stay in the gap-code tally."""
        insts = [{"t": "named-entity", "id": "n1", "name": "Yusra", "span": "Yusra"},
                 {"t": "activity", "id": "v1", "verb": "sing", "actor": "@n1", "tense": "past", "span": "Yusra sang"}]
        parsed = [
            {**rec("mrpc", 1, 0, '"Yusra sang," she said.'), "sample": {"group": "mrpc.train/mine"},
             "reply": {"model": "fake", "manifest_id": "abc", "usage": {},
                       "response": {"id": "a", "instances": insts, "unmapped": [{"span": '"Yusra sang,"', "code": "G10"}]}}},
            {**rec("mrpc", 2, 0, 'But "Yusra sang," she said eventually.'), "sample": {"group": "mrpc.train/mine"},
             "reply": {"model": "fake", "manifest_id": "abc", "usage": {},
                       "response": {"id": "b", "instances": insts,
                                    "unmapped": [{"span": "But", "code": "G05"}, {"span": "eventually", "code": "G02"}]}}},
        ]
        a = C.assess(parsed, CATALOG, typecheck=False)
        self.assertEqual([x["outcome"] for x in a["rows"]], ["covered", "partial"])
        self.assertEqual(a["overall"]["covered"], 1)
        self.assertEqual(a["overall"]["reported"], 1)                            # the covered one carries a reported span
        self.assertEqual(a["gap_codes"], {"G10": 1, "G05": 1, "G02": 1})
        text = C.render_report(a, "abc", "fake")
        self.assertIn("reported by convention, not gaps: G10: 1, G05: 1", text)
        self.assertIn("- G02: 1", text)
        self.assertNotIn("- G10: 1", text)

    def test_families_are_drawn_whole_and_a_small_draw_starts_a_large_one(self):
        rows = []
        for f in range(30):                                   # families of 1-3 sentences, roles alternating
            size = 1 + f % 3
            rows += [rec("sick", f"{f}-{i}", 0, f"A kid {f} plays game {i} in the yard.", family=f"sick:{f}",
                         role="mine" if f % 2 == 0 else "evaluate") for i in range(size)]
        rows += [rec("sick", f"big-{i}", 0, f"A heron {i} stands in the pond.", family="sick:big", role="mine")
                 for i in range(C.FAMILY_CAP + 1)]           # larger than the cap: never drawn
        with open(os.path.join(self.prepared, "sick.all.jsonl"), "w") as fh:
            fh.write("\n".join(json.dumps(r) for r in rows) + "\n")
        mine = lambda r: r.get("role") == "mine"
        C.PLANS["fam-small"] = [("sick.all", 6, "families", mine)]
        C.PLANS["fam-large"] = [("sick.all", 20, "families", mine)]
        try:
            small = C.sample("fam-small", 5, self.prepared, os.path.join(self.dir, "a.jsonl"))
            large = C.sample("fam-large", 5, self.prepared, os.path.join(self.dir, "b.jsonl"))
        finally:
            C.PLANS.pop("fam-small"); C.PLANS.pop("fam-large")
        sizes = {f"sick:{f}": 1 + f % 3 for f in range(30)}
        for draw in (small, large):
            got = {}
            for r in draw:
                got[r["family"]] = got.get(r["family"], 0) + 1
            self.assertTrue(all(n == sizes[f] for f, n in got.items()), got)    # every family whole
            self.assertTrue(all(r["role"] == "mine" for r in draw))
            self.assertNotIn("sick:big", got)
        self.assertGreaterEqual(len(small), 6)
        self.assertEqual([r["id"] for r in large[: len(small)]], [r["id"] for r in small])   # the small draw starts the large one

    def test_parallel_parse_writes_each_reply_once_and_resumes(self):
        script = os.path.join(self.dir, "fake_parse.py")
        with open(script, "w") as fh:
            fh.write(
                "import time\n"
                "class ProviderError(Exception):\n    pass\n"
                "class _P:\n    default_model = 'fake-1'\n"
                "PROVIDERS = {'google': _P}\n"
                "def prime(args):\n    return {'input': 10, 'cached': 0}\n"
                "def cache_lost(u):\n    return (u or {}).get('cached') == 0\n"
                "def parse_sentence(text, args, item_id='item'):\n"
                "    time.sleep(0.01)\n"
                "    return {'provider': 'google', 'model': 'fake-1', 'item': {'id': item_id, 'text': text},\n"
                "            'response': {'id': item_id, 'instances': []}, 'usage': {'input': 10, 'cached': 8}}\n")
        sample = os.path.join(self.dir, "s.jsonl")
        C.sample("tiny", 3, self.prepared, sample)
        out = os.path.join(self.dir, "parsed.jsonl")
        argv = ["parse", "--sample", sample, "--out", out, "--parse-script", script, "--provider", "google", "--workers", "4"]
        self.assertEqual(C.main(argv), 0)
        rows = [json.loads(l) for l in open(out)]
        ids = [r["id"] for r in rows]
        self.assertEqual(len(ids), len(set(ids)))
        self.assertEqual(set(ids), {json.loads(l)["id"] for l in open(sample)})
        self.assertTrue(all("timing" in r["reply"] and r["reply"]["timing"]["worker"].startswith("w") for r in rows))
        self.assertEqual(C.main(argv), 0)                     # resumable: nothing left to parse, nothing appended
        self.assertEqual(len(open(out).readlines()), len(rows))

    def test_a_stale_prompt_stops_a_run(self):
        from tmpl import suite as S
        stale = os.path.join(self.dir, "stale.txt")
        with open(stale, "w", encoding="utf-8") as fh:
            fh.write("# prompt\n\ncatalog sha256 0000000000000000 · 1 templates\n")
        self.assertIn("render it first", S.stale_prompt(stale))
        self.assertIsNone(S.stale_prompt(os.path.join(TEMPLATES, "generated", "PROMPT_CATALOG.txt")))   # rendered from today's catalog


if __name__ == "__main__":
    unittest.main(verbosity=1)
