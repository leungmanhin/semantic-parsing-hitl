"""Tests for tmpl/typecheck.py (C9): the checker must reject known-bad shapes when sorts are
declared, and must accept the emitter's own examples and the goldens (modulo the two known
warning kinds).  Needs the ``petta`` package; skips otherwise.

Run from ``templates/``: ``/home/manhin/Dev/.venv-dev/bin/python tests/test_typecheck.py``
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

try:
    import petta  # noqa: F401

    HAVE_PETTA = True
except Exception:  # pragma: no cover
    HAVE_PETTA = False

from tmpl import typecheck  # noqa: E402

DECLS = ["(: e1 Event)", "(: e1 Instance)", "(: marta Entity)", "(: marta Instance)", "(: cook Class)"]
GOOD = [
    "(: ok1 (Member e1 cook) (STV 1.0 0.9))",
    "(: ok2 (Agent e1 marta) (STV 1.0 0.9))",
    "(: ok3 (Not (And (Member e1 cook) (Agent e1 marta))) (STV 1.0 0.9))",
    "(: ok4 (Past e1) (STV 1.0 0.9))",
    "(: ok5 (Theme e1 (And (Member e1 cook) (Agent e1 marta))) (STV 1.0 0.9))",
]
BAD = [
    "(: bad1 (Agent marta e1) (STV 1.0 0.9))",            # swapped role
    "(: bad2 (Not marta) (STV 1.0 0.9))",                  # negation over an entity
    "(: bad3 (Member cook e1) (STV 1.0 0.9))",             # swapped typing link
    "(: bad4 (And (Member e1 cook) marta) (STV 1.0 0.9))",  # non-proposition conjunct
    "(: bad5 (Time e1 marta) (STV 1.0 0.9))",              # an entity as a time
    "(: bad6 (And (Member e1 cook)) (STV 1.0 0.9))",       # arity-1 bundle (the kiln case)
    "(: bad7 (Theme e1 (Member cook e1)) (STV 1.0 0.9))",  # bad atom nested under a seal
]


def run(records, extra_args=()):
    with tempfile.NamedTemporaryFile("w", suffix=".jsonl", delete=False) as fh:
        for r in records:
            fh.write(json.dumps(r) + "\n")
        path = fh.name
    report = path + ".report.json"
    try:
        typecheck.main([path, "--report", report, *extra_args])
        with open(report, encoding="utf-8") as fh:
            return json.load(fh)
    finally:
        for p in (path, report):
            if os.path.exists(p):
                os.unlink(p)


@unittest.skipUnless(HAVE_PETTA, "petta package not importable")
class TypecheckTests(unittest.TestCase):
    def test_declared_sorts_catch_every_bad_shape(self):
        rep = run([{"id": "neg", "declarations": DECLS, "statements": GOOD + BAD}], ["--no-infer"])
        types = [f for f in rep["findings"] if f["kind"] == "type"]
        self.assertEqual(rep["passed"], len(GOOD))
        self.assertEqual(sorted(f["statement"] for f in types), sorted(BAD))

    def test_inference_runs_on_good_statements(self):
        rep = run([{"id": "good", "statements": GOOD}])
        self.assertEqual(rep["passed"], len(GOOD))
        self.assertEqual([f for f in rep["findings"] if f["kind"] == "type"], [])

    def test_registry_examples_type(self):
        path = os.path.join(TEMPLATES, "pilot", "out", "registry_examples.statements.jsonl")
        if not os.path.exists(path):
            self.skipTest("registry examples not generated")
        report = path + ".tc.json"
        try:
            typecheck.main([path, "--report", report])
            with open(report, encoding="utf-8") as fh:
                rep = json.load(fh)
        finally:
            if os.path.exists(report):
                os.unlink(report)
        self.assertEqual(rep["passed"], rep["statements"], rep["findings"][:3])

    def test_registry_examples_type_strictly_with_emitter_declarations(self):
        path = os.path.join(TEMPLATES, "pilot", "out", "registry_examples.statements.jsonl")
        if not os.path.exists(path):
            self.skipTest("registry examples not generated")
        report = path + ".tc.json"
        try:
            typecheck.main([path, "--no-infer", "--report", report])
            with open(report, encoding="utf-8") as fh:
                rep = json.load(fh)
        finally:
            if os.path.exists(report):
                os.unlink(report)
        self.assertEqual(rep["passed"], rep["statements"], rep["findings"][:3])

    def test_goldens_have_no_type_failures(self):
        path = os.path.join(TEMPLATES, "pilot", "corpus", "gold.expected.jsonl")
        if not os.path.exists(path):
            self.skipTest("gold corpus not present")
        report = path + ".tc.json"
        try:
            typecheck.main([path, "--report", report])
            with open(report, encoding="utf-8") as fh:
                rep = json.load(fh)
        finally:
            if os.path.exists(report):
                os.unlink(report)
        bad = [f for f in rep["findings"] if f["kind"] in ("type", "type-conflict", "parse-error")]
        self.assertEqual(bad, [], bad[:3])


if __name__ == "__main__":
    unittest.main(verbosity=1)
