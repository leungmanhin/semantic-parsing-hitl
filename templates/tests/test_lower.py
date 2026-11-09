"""The lowering (tmpl.lower): the emitter's records written in one consumer's syntax.

    python -m unittest tests.test_lower        (from templates/)
"""
from __future__ import annotations

import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir))

from tmpl import catalog as CAT, emit as E, lower as L, typecheck as T  # noqa: E402

CATALOG = CAT.load()


class LoweringTests(unittest.TestCase):
    def test_records_and_types_lower_to_our_engine_lines_syntax(self):
        emitted = {"records": [{"name": "n1_name", "term": ["Name", "sk_mill_1", L.Str('The "Old" Mill')],
                                "truth": [1.0, 0.99], "owner": "named-entity", "inst": "n1"},
                               {"name": "m1_measure", "term": ["Measure", "sk_teodor_1", "old", 31, "year"],
                                "truth": [0.9, 0.7], "owner": "measure", "inst": "m1"}],
                   "types": {"old": ["Class"], "sk_teodor_1": ["Entity", "Instance"]},
                   "functions": [{"stem": "sk_loom", "arity": 1, "classes": ["Entity", "Instance"]}]}
        out = L.lower(emitted, "pettachainer")
        self.assertEqual(out["statements"], ['(: n1_name (Name sk_mill_1 "The \\"Old\\" Mill") (STV 1.0 0.99))',
                                             "(: m1_measure (Measure sk_teodor_1 old 31 year) (STV 0.9 0.7))"])
        self.assertEqual(out["declarations"], ["(: old Class)", "(: sk_teodor_1 Entity)", "(: sk_teodor_1 Instance)",
                                               "(: sk_loom (-> Atom Entity))", "(: sk_loom (-> Atom Instance))"])

    def test_an_unknown_target_is_refused(self):
        with self.assertRaises(ValueError):
            L.lower({"records": [], "types": {}, "functions": []}, "some-other-engine")

    def test_every_example_emits_records_whose_lowering_is_its_text(self):
        """For every catalog example: the text keys are the lowering of the records, and a record's leaves are
        the tree a reader of the statement's text gets — what the miner used to re-parse."""
        n = 0
        for tid, t in CATALOG.items():
            for section in ("shown", "held_out"):
                for ex in (t.get("examples") or {}).get(section) or []:
                    if not ex.get("instances"):
                        continue
                    out = E.emit({"id": "x", "instances": ex["instances"]}, CATALOG)
                    low = L.lower(out)
                    self.assertEqual(low["statements"], out["statements"], (tid, ex["text"]))
                    self.assertEqual(low["declarations"], out["declarations"], (tid, ex["text"]))
                    for rec, text in zip(out["records"], out["statements"]):
                        name, term = T.split_statement(text)
                        self.assertEqual((rec["name"], L.leaves(rec["term"])), (name, term), (tid, ex["text"]))
                    n += 1
        self.assertGreater(n, 1000)


if __name__ == "__main__":
    unittest.main()
