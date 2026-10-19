"""The catalog's background rules: the neutral source (rules.yaml) validates, lowers to the chainer's
form, the generated file is fresh, the lowered statements type-check under C9 (inference mode, as the
goldens do: rules carry variables, not declarations), and the validator catches unsound rules.

Run from ``templates/``: ``python tests/test_rules.py``
"""
from __future__ import annotations

import copy
import json
import os
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import rules as R, typecheck as T  # noqa: E402

RULES = R.load()


class SourceTests(unittest.TestCase):
    def test_source_validates_and_is_not_empty(self):
        self.assertGreaterEqual(len(RULES), 20)
        self.assertEqual(R.check(RULES, R.substrate_heads(), R.catalog_ids()), [])

    def test_lowering_form(self):
        for r in RULES:
            st = R.lower(r)
            self.assertTrue(st.startswith(f"(: {r['id']} (Implication "), st)
            self.assertTrue(st.endswith("(STV 0.0 1.0)))"), st)
            name, atom = T.split_statement(st)
            self.assertEqual(atom[0], "Implication")
        days = next(r for r in RULES if r["id"] == "days_before_day")
        self.assertIn("(Compute - ($d $n) -> $e)", R.lower(days))
        single = next(r for r in RULES if r["id"] == "result_holds")
        self.assertNotIn("(And ", R.lower(single))                       # one premise, no conjunction

    def test_generated_file_is_fresh(self):
        self.assertEqual(open(R.GENERATED, encoding="utf-8").read(), R.render(RULES))

    def test_validator_catches_unsound_rules(self):
        base = copy.deepcopy(next(r for r in RULES if r["id"] == "coref_agent"))
        heads, ids = R.substrate_heads(), R.catalog_ids()
        unbound = copy.deepcopy(base); unbound["conclusion"] = "(Agent $e $z)"
        self.assertTrue(any("$z" in p for p in R.check([unbound], heads, ids)))
        unknown = copy.deepcopy(base); unknown["premises"] = ["(Coref $m $a)", "(Agentt $e $m)"]
        self.assertTrue(any("unknown head" in p for p in R.check([unknown], heads, ids)))
        badop = copy.deepcopy(base); badop["computations"] = [{"result": "$q", "op": "*", "args": ["$e"]}]
        self.assertTrue(any("op must be" in p for p in R.check([badop], heads, ids)))
        dup = [copy.deepcopy(base), copy.deepcopy(base)]
        self.assertTrue(any("duplicate id" in p for p in R.check(dup, heads, ids)))
        badtruth = copy.deepcopy(base); badtruth["truth"] = {"strength": 1.5, "confidence": 0.9}
        self.assertTrue(any("truth" in p for p in R.check([badtruth], heads, ids)))


class TypecheckTests(unittest.TestCase):
    def test_lowered_rules_typecheck(self):
        try:
            import petta  # noqa: F401
        except Exception:
            self.skipTest("petta package not importable")
        with tempfile.NamedTemporaryFile("w", suffix=".jsonl", delete=False) as fh:
            fh.write(json.dumps({"id": "rules", "statements": [R.lower(r) for r in RULES]}) + "\n")
            path = fh.name
        report = path + ".report.json"
        try:
            T.main([path, "--report", report])
            with open(report, encoding="utf-8") as fh:
                rep = json.load(fh)
        finally:
            for p in (path, report):
                if os.path.exists(p):
                    os.remove(p)
        bad = [f for f in rep["findings"] if f["kind"] in ("type", "type-conflict", "parse-error")]
        self.assertEqual(bad, [], bad[:2])


if __name__ == "__main__":
    unittest.main()
