"""The catalog's seeded rules (templates/seeded_rules.metta) parse as statements and type-check
under C9 (inference mode, as the goldens do: rules carry variables, not declarations).

Run from ``templates/``: ``python tests/test_rules.py``
"""
from __future__ import annotations

import json
import os
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import typecheck as T  # noqa: E402

RULES = os.path.join(TEMPLATES, "seeded_rules.metta")


def statements():
    out, depth, start = [], 0, None
    text = "\n".join(ln for ln in open(RULES, encoding="utf-8").read().splitlines() if not ln.strip().startswith(";"))
    for i, ch in enumerate(text):
        if ch == "(":
            if depth == 0:
                start = i
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0 and start is not None:
                out.append(text[start:i + 1])
                start = None
    return out


class RulesTests(unittest.TestCase):
    def test_every_rule_is_a_statement(self):
        rules = statements()
        self.assertTrue(rules)
        for st in rules:
            name, atom = T.split_statement(st)
            self.assertEqual(atom[0], "Implication", st)

    def test_rules_typecheck(self):
        try:
            import petta  # noqa: F401
        except Exception:
            self.skipTest("petta package not importable")
        with tempfile.NamedTemporaryFile("w", suffix=".jsonl", delete=False) as fh:
            fh.write(json.dumps({"id": "rules", "statements": statements()}) + "\n")
            path = fh.name
        report = path + ".report.json"
        try:
            T.main([path, "--report", report])
            with open(report, encoding="utf-8") as fh:
                rep = json.load(fh)
        finally:
            for p in (path, report):
                if os.path.exists(p):
                    os.unlink(p)
        bad = [f for f in rep["findings"] if f["kind"] in ("type", "type-conflict", "parse-error")]
        self.assertEqual(bad, [], bad[:2])


if __name__ == "__main__":
    unittest.main(verbosity=1)
