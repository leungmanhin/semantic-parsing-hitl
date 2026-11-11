"""The background rules lowered for upstream PeTTaChainer master, on that engine: the generated file loads whole, the
rules derive what they derive on our engine line, at its values, and with the predicates declared a question that
nothing derives gets no answer.

Needs upstream master's own environment (the engine that refuses a narrowed class under ``Member``); skipped on our
engine line and where no chainer is installed:
    cd <upstream PeTTaChainer checkout> && .venv/bin/python <this file>
"""
from __future__ import annotations

import os
import re
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir))

from tmpl import lower as L  # noqa: E402  (pure Python: runs in the chainer's environment too)

try:
    from pettachainer import PeTTaChainer
except Exception:  # not the chainer's environment
    PeTTaChainer = None

RULES = os.path.join(HERE, os.pardir, "generated", "seeded_rules.pettachainer-master.metta")
TV = "(STV 1.0 0.99)"
# "She washed the barn." after a sentence about Marisol, a weaver: the mention's role and class, the link at its value.
WASH = [f"(: f1 (Member sk_wash_1 wash) {TV})", f"(: f2 (Agent sk_wash_1 sk_she_1) {TV})",
        "(: f3 (Coref sk_she_1 sk_marisol_1) (STV 0.99 0.9))", f"(: f4 (Member sk_she_1 weaver) {TV})",
        f"(: f5 (Member sk_pieter_1 glazier) {TV})"]
# "The shed is in the yard. The yard is on the farm. The farm is in the county."
PLACES = [f"(: p1 (LocatedIn sk_shed_1 sk_yard_1) {TV})", f"(: p2 (LocatedIn sk_yard_1 sk_farm_1) {TV})",
          f"(: p3 (LocatedIn sk_farm_1 sk_county_1) {TV})"]


def rules() -> list[str]:
    with open(RULES, encoding="utf-8") as fh:
        return [ln.strip() for ln in fh if ln.startswith("(: ")]


def _upstream_master() -> bool:
    """Is the installed chainer the one this target is for? It refuses a narrowed class under Member."""
    if PeTTaChainer is None:
        return False
    try:
        h = PeTTaChainer()
        h.add_atom("(: probe_fact (Member sk_probe_1 probe) (STV 1.0 0.99))")
    except Exception:  # a chainer that is installed but does not run here
        return False
    try:
        h.add_atom("(: probe (Member sk_probe_1 (Narrow report (Mod progress))) (STV 1.0 0.99))")
    except Exception:
        return True
    return False


def kb(facts: list[str], declare: bool = True):
    """A knowledge base as a consumer builds it: the predicates declared, then the rules file, then the text's class
    symbols declared (here read off the facts: the class of each Member), then its statements."""
    h = PeTTaChainer()
    if declare:
        for name in L.predicates("pettachainer-master"):
            h.set_positive_only_predicate(name)
    for st in rules():
        h.add_atom(st)
    if declare:
        for name in sorted(set(re.findall(r"\(Member \S+ ([a-z][a-z_0-9]*)\)", " ".join(facts)))):
            h.set_positive_only_predicate(name)
    for st in facts:
        h.add_atom(st)
    return h


def values(h, pattern: str, steps: int = 400) -> list[tuple]:
    out = []
    for a in h.query(f"(: $prf {pattern} $tv)", steps=steps, timeout_sec=0):
        m = re.search(r"\(STV ([0-9.e-]+) ([0-9.e-]+)\)\)$", str(a).strip())
        out.append((float(m.group(1)), float(m.group(2))))
    return out


@unittest.skipUnless(_upstream_master(), "needs upstream PeTTaChainer master (the engine this file is lowered for)")
class BackgroundRulesOnUpstreamMaster(unittest.TestCase):
    def near(self, got: list, strength: float, confidence: float):
        self.assertTrue(got, "no answer")
        self.assertAlmostEqual(got[0][0], strength, delta=0.01, msg=got)
        self.assertAlmostEqual(got[0][1], confidence, delta=0.01, msg=got)

    def test_the_file_loads_whole_and_every_listed_predicate_is_accepted(self):
        h = PeTTaChainer()
        for name in L.predicates("pettachainer-master"):
            h.set_positive_only_predicate(name)
        refused = []
        for st in rules():
            try:
                h.add_atom(st)
            except Exception:
                refused.append(st)
        self.assertEqual(refused, [])
        self.assertGreater(len(rules()), 250)

    def test_a_role_and_a_class_cross_a_coreference_link_at_the_links_value(self):
        h = kb(WASH)
        self.near(values(h, "(Agent sk_wash_1 sk_marisol_1)"), 0.99, 0.9)       # our engine line: (0.99 0.9)
        self.near(values(kb(WASH), "(Member sk_marisol_1 weaver)"), 0.99, 0.9)
        self.near(values(kb(WASH), "(Agent sk_wash_1 sk_she_1)"), 1.0, 0.99)    # what was stated reads back

    def test_an_equivalence_is_read_both_ways_and_a_denied_side_denies_the_other(self):
        self.near(values(kb(WASH), "(Coref sk_marisol_1 sk_she_1)"), 0.99, 0.9)
        denied = kb([f"(: d1 (Not (Coref sk_she_1 sk_marisol_1)) {TV})"])
        self.near(values(denied, "(Coref sk_marisol_1 sk_she_1)"), 0.0, 0.99)

    def test_places_chain_at_our_lines_confidence(self):
        self.near(values(kb(PLACES[:2]), "(LocatedIn sk_shed_1 sk_farm_1)"), 1.0, 0.884)                 # one step
        self.near(values(kb(PLACES), "(LocatedIn sk_shed_1 sk_county_1)", steps=1500), 1.0, 0.798)       # two steps

    def test_a_rule_with_a_computation_computes(self):
        day = kb([f"(: t1 (BeforeBy sk_time_1 sk_time_2 3 day) {TV})", f"(: t2 (Day sk_time_2 10) {TV})"])
        got = [str(a) for a in day.query("(: $prf (Day sk_time_1 $d) $tv)", steps=400, timeout_sec=0)]
        self.assertTrue(got and "(Day sk_time_1 7" in got[0], got)                # three days before the 10th
        metres = kb([f"(: m1 (Measure sk_plank_1 long 30 centimetre) {TV})"])
        got = [str(a) for a in metres.query("(: $prf (Measure sk_plank_1 long $n metre) $tv)", steps=1500, timeout_sec=0)]
        self.assertTrue(got and re.search(r"\(Measure sk_plank_1 long 0\.3\d* metre\)", got[0]), got)

    def test_a_question_nothing_derives_gets_no_answer_once_the_predicates_are_declared(self):
        for goal in ("(Agent sk_wash_1 sk_pieter_1)", "(Member sk_marisol_1 glazier)", "(Member sk_marisol_1 potter)"):
            self.assertEqual(values(kb(WASH), goal), [], goal)
        self.assertEqual(values(kb(PLACES[:2] + [f"(: p9 (LocatedIn sk_mill_1 sk_town_1) {TV})"]), "(LocatedIn sk_shed_1 sk_town_1)"), [])
        prior = values(kb(WASH, declare=False), "(Agent sk_wash_1 sk_pieter_1)")   # undeclared: a prior, at almost no confidence
        self.assertTrue(prior and prior[0][1] < 0.05, prior)


if __name__ == "__main__":
    unittest.main()
