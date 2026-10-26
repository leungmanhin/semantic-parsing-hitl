"""The frequency template's rule form on the emitter: a period of one unit or an adverb builds a
rule over an occasion range with the episode a function of the occasion and its time the
occasion; a pattern stays a tag on a top-level event. Run from ``templates/``:
``python tests/test_frequency_rule.py``."""
from __future__ import annotations

import os
import sys
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir))

from tmpl import catalog as CAT, emit as E  # noqa: E402

CATALOG = CAT.load()


def example(tid: str, text: str) -> dict:
    for section in ("shown", "held_out"):
        for ex in CATALOG[tid]["examples"][section]:
            if ex["text"] == text:
                return ex
    raise KeyError(text)


def emit(text: str) -> list[str]:
    ex = example("frequency", text)
    return [d["term"] for d in E.emit({"id": "t", "instances": [dict(i) for i in ex["instances"]]}, CATALOG)["detail"]]


class FrequencyRuleForm(unittest.TestCase):
    def test_a_period_is_a_rule_over_the_occasions(self):
        terms = emit("Yusra swims every morning.")
        rule = [t for t in terms if t.startswith("(Implication")]
        self.assertEqual(len(rule), 1, terms)
        self.assertIn("(Implication (Member $x morning) (And (Member (sk_swim $x) swim) (Agent (sk_swim $x) sk_yusra_1) (Time (sk_swim $x) $x)))", rule[0])
        self.assertNotIn("(Member sk_swim_1 swim)", terms)                      # no top-level episode
        self.assertFalse(any("QuantifierPhrase" in t for t in terms), terms)      # the word stays in the instance record

    def test_an_adverb_sets_the_strength(self):
        ex = example("frequency", "Ottoline often laughs.")
        out = E.emit({"id": "t", "instances": [dict(i) for i in ex["instances"]]}, CATALOG)
        rule = [s for s in out["statements"] if "(Implication" in s]
        self.assertEqual(len(rule), 1)
        self.assertTrue(rule[0].endswith("(STV 0.7 0.9))"), rule[0])                 # often = many
        self.assertIn("(Member $x occasion)", rule[0])
        ex = example("frequency", "Ottoline sometimes waits at the gate.")
        out = E.emit({"id": "t", "instances": [dict(i) for i in ex["instances"]]}, CATALOG)
        rule = [s for s in out["statements"] if "(Implication" in s]
        self.assertTrue(rule[0].endswith("(STV 0.5 0.7))"), rule[0])                 # existential: no proportion stated

    def test_two_ranges_give_a_function_of_both(self):
        terms = emit("Every ferret sleeps every night.")
        rule = [t for t in terms if t.startswith("(Implication")][0]
        self.assertIn("(And (Member $x ferret) (Member $y night))", rule)
        self.assertIn("(sk_sleep $x $y)", rule)
        self.assertIn("(Time (sk_sleep $x $y) $y)", rule)

    def test_an_adverb_with_an_attachment_restricts_to_the_clauses_events(self):
        terms = emit("Teodor always arrives at noon.")
        rule = [t for t in terms if t.startswith("(Implication")]
        self.assertEqual(rule, ["(Implication (And (Member $e arrive) (Agent $e sk_teodor_1)) (And (Time $e (sk_time $e)) (Hour (sk_time $e) 12)))"], terms)
        self.assertNotIn("(Member sk_arrive_1 arrive)", terms)                  # no top-level arrival
        night = [t for t in emit("Yusra usually sleeps at night.") if t.startswith("(Implication")][0]
        self.assertEqual(night, "(Implication (And (Member $e sleep) (Agent $e sk_yusra_1)) (Time $e night))")
        gate = emit("Ottoline sometimes waits at the gate.")
        self.assertIn("(Implication (And (Member $e wait) (Agent $e sk_ottoline_1)) (Location $e sk_gate_1))", gate)
        self.assertIn("(Member sk_gate_1 gate)", gate)                          # the definite stays outside

    def test_never_with_a_restrictor_is_the_rule_at_zero(self):
        ex = example("frequency", "Teodor never arrives late.")
        out = E.emit({"id": "t", "instances": [dict(i) for i in ex["instances"]]}, CATALOG)
        rule = [s for s in out["statements"] if "(Implication" in s][0]
        self.assertIn("(Implication (And (Member $e arrive) (Agent $e sk_teodor_1)) (Manner $e late))", rule)
        self.assertTrue(rule.endswith("(STV 0.0 0.9))"), rule)

    def test_a_when_clause_is_the_restrictor(self):
        terms = emit("When Lamine sings, Yusra usually leaves.")
        rule = [t for t in terms if t.startswith("(Implication")][0]
        self.assertIn("(Implication (And (Member $e sing) (Agent $e sk_lamine_1))", rule)
        self.assertIn("(Member (sk_leave $e) leave)", rule)
        self.assertIn("(During (sk_leave $e) $e)", rule)
        whenever = [t for t in emit("Whenever Yusra sang, the ferret hid.") if t.startswith("(Implication")][0]
        self.assertIn("(Past $e)", whenever)                                    # the restrictor keeps its tense
        self.assertIn("(Past (sk_hide $e))", whenever)

    def test_a_rate_is_a_rule_with_the_count_on_each_occasion(self):
        terms = emit("Lamine visits the market twice a week.")
        rule = [t for t in terms if t.startswith("(Implication")]
        self.assertEqual(len(rule), 1, terms)
        self.assertIn("(Member $x week)", rule[0])
        self.assertIn("(Times (sk_visit $x) 2)", rule[0])
        self.assertIn("(Time (sk_visit $x) $x)", rule[0])
        self.assertNotIn("(Member sk_visit_1 visit)", terms)                     # no top-level episode
        self.assertIn("(Member sk_market_1 market)", terms)                      # the definite stays outside

    def test_a_pattern_stays_a_tag_on_a_top_level_event(self):
        self.assertIn("(Times sk_knock_1 2)", emit("Teodor knocked twice."))
        self.assertIn("(Every sk_visit_1 2 week)", emit("Yusra visits Lamine every two weeks."))

    def test_negation_and_modal_scope_over_the_rule(self):
        neg = emit("Lamine does not laugh often.")
        self.assertTrue(any(t.startswith("(Not (Implication") for t in neg), neg)
        might = emit("Yusra might swim every day.")
        self.assertTrue(any(t.startswith("(Might (Implication") for t in might), might)


if __name__ == "__main__":
    unittest.main(verbosity=1)
