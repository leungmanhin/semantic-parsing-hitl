"""Tests for tmpl/typecheck.py (C9): the checker must reject known-bad shapes when types are
declared and accept the good ones, with and without declarations.  The catalog's own examples
are type-checked in tests/test_emit.py.  Needs the ``petta`` package; skips otherwise.

Run from ``templates/``: ``python tests/test_typecheck.py``
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

class ArityLintTests(unittest.TestCase):
    """No engine needed: the substrate's own heads. The sets are PINNED — a new head at two arities fails here,
    and so does fixing a known one without updating the pin."""

    def test_heads_declared_at_several_arities_are_the_known_ones(self):
        lint = typecheck.arity_lints()
        # none since the preposition "past" is emitted as PastPlace (it was written as its own head, Past, and
        # collided with the tense tag: both type-checked, and a consumer wanting one arity a head refused the text)
        self.assertEqual(lint["collisions"], {})
        self.assertEqual(sorted(lint["several"]), ["Between", "Day", "Hour", "Minute", "Month", "Weekday", "Year", "Yet"])

    def test_a_preposition_colliding_with_a_head_of_another_arity_is_reported(self):
        src = {"heads": {"Up": {"kind": "temporal", "arity": 1, "arg_types": ["Event"], "out": "Proposition"},
                         "During": {"kind": "temporal", "arity": 2, "arg_types": ["Event", "Event"], "out": "Proposition"}},
               "open_class": {"oblique_prepositions": ["Up", "During", "Near"],
                              "oblique_signature": {"arg_types": ["Instance", "Instance"], "out": "Proposition"}}}
        self.assertEqual(typecheck.arity_lints(src), {"collisions": {"Up": {"declared": [1], "kind": "temporal", "oblique": 2}}, "several": {}})


    def test_a_head_that_is_also_a_preposition_accepts_both_readings_of_a_nested_term(self):
        """(To e <clause>) is the purpose link, (To e <thing>) the preposition: a skolem term after it is a thing."""
        heads = typecheck.load_substrate()["heads"]
        self.assertEqual(typecheck.arg_types_here_for(heads["To"], 2), ["Event", "Proposition"])       # the head's own entry
        self.assertEqual(typecheck.expected_types(heads["To"], 2),
                         ["Event|Instance|Class", "Proposition|Instance|Class"])                      # what a nested term may be
        self.assertEqual(typecheck.expected_types(heads["Agent"], 2), typecheck.arg_types_here_for(heads["Agent"], 2))
        self.assertEqual(typecheck.expected_types(heads["Past"], 1), ["Event|Proposition"])           # no preposition now


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


if __name__ == "__main__":
    unittest.main(verbosity=1)
