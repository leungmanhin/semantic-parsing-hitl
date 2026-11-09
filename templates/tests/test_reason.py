"""The reasoning setup on our engine line (tmpl.reason): the resolved view, the rules split by stage, the question job.
The engine side (saturation, then asking) is tests/test_query_engine.py.

    python -m unittest tests.test_reason        (from templates/)
"""
from __future__ import annotations

import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir))

from tmpl import reason as R, rules as RU  # noqa: E402

STATEMENTS = ['(: n1 (Name sk_stanley_1 "Stanley") (STV 1.0 0.99))',
              "(: m1 (Member sk_his_1 male) (STV 1.0 0.99))",
              "(: c1 (Coref sk_his_1 sk_stanley_1) (STV 0.99 0.9))",
              '(: n2 (Name sk_stanley_2 "Stanley") (STV 1.0 0.99))',
              "(: c2 (Coref sk_stanley_2 sk_his_1) (STV 0.99 0.9))",
              "(: c3 (Coref sk_alan_1 sk_brother_1) (STV 0.8 0.9))",
              "(: p1 (Theme sk_son_1 sk_stanley_2) (STV 1.0 0.99))"]


class ResolvedView(unittest.TestCase):
    def test_certain_links_merge_and_weaker_ones_stay_links(self):
        v = R.view(STATEMENTS)
        self.assertEqual(v["canon"], {"sk_his_1": "sk_stanley_1", "sk_stanley_2": "sk_stanley_1"})   # a chain followed
        text = " ".join(v["statements"])
        self.assertIn("(Member sk_stanley_1 male)", text)                # the pronoun's gender is the person's
        self.assertIn("(Theme sk_son_1 sk_stanley_1)", text)
        self.assertNotIn("(Coref sk_his_1", text)                       # a merged link holds by the merge
        self.assertIn("(Coref sk_alan_1 sk_brother_1)", text)           # a likely link stays a link
        self.assertEqual(text.count('(Name sk_stanley_1 "Stanley")'), 1)   # the second mention's Name, stated once
        self.assertEqual(R.on_view("(: $prf (Theme $s sk_his_1) $tv)", v["canon"]), "(: $prf (Theme $s sk_stanley_1) $tv)")

    def test_no_link_no_change(self):
        plain = ["(: x (Member sk_ferret_1 ferret) (STV 1.0 0.99))"]
        self.assertEqual(R.view(plain), {"statements": plain, "canon": {}})


class Stages(unittest.TestCase):
    def test_the_closure_stage_is_apart_and_the_files_say_the_same(self):
        sets = R.rule_sets()
        rules = RU.load()
        self.assertEqual(len(sets["closure"]), sum(1 for r in RU.lowered(rules, RU.load_closures(rules=rules)) if r["stage"] == "closure"))
        self.assertTrue(all(s.startswith("(: kin_") for s in sets["closure"]))
        self.assertFalse(any(s.startswith("(: kin_compose") for s in sets["query"]))
        self.assertTrue(any(s.startswith("(: kin_state_member") for s in sets["query"]))
        self.assertTrue(any("(KinGeneral son child)" in s for s in sets["facts"]))
        files = R.rule_sets_from_files(RU.GENERATED, RU.GENERATED_CLOSURE)
        self.assertEqual({k: sorted(v) for k, v in files.items()}, {k: sorted(v) for k, v in sets.items()})

    def test_a_question_job_saturates_the_closure_and_asks_with_the_rest(self):
        sets = R.rule_sets()
        job = R.question_job(STATEMENTS, ["(: $prf (Theme $s sk_stanley_2) $tv)"], sets)
        self.assertEqual(job["queries"], ["(: $prf (Theme $s sk_stanley_1) $tv)"])
        self.assertEqual(job["saturate"]["rules"], sets["closure"])
        self.assertFalse(set(job["rules"]) & set(sets["closure"]))
        self.assertTrue(set(sets["facts"]) <= set(job["rules"]))
        none = R.question_job(STATEMENTS, [], {"facts": [], "closure": [], "query": []})
        self.assertNotIn("saturate", none)

    def test_a_closure_rule_must_be_a_plain_deductive_implication_with_a_role(self):
        bad = [{"id": "x", "meaning": "m", "premises": ["(Coref $a $b)"], "conclusion": "(Coref $b $a)",
                "truth": {"strength": 1.0, "confidence": 0.99}, "semantics": "equivalence", "closure": {"name": "kin", "role": "base"}},
               {"id": "y", "meaning": "m", "premises": ["(Coref $a $b)"], "conclusion": "(Coref $b $a)",
                "truth": {"strength": 1.0, "confidence": 0.99}, "semantics": "deductive", "closure": {"name": "kin", "role": "later"}}]
        problems = RU.check(bad)
        self.assertTrue(any("plain deductive implication" in p for p in problems))
        self.assertTrue(any("role one of" in p for p in problems))


def _rule(rid, premises, conclusion, closure=None, computations=None):
    r = {"id": rid, "meaning": rid, "premises": premises, "conclusion": conclusion,
         "truth": {"strength": 1.0, "confidence": 0.99}, "semantics": "deductive"}
    if closure:
        r["closure"] = closure
    if computations:
        r["computations"] = computations
    return r


CLOSURE = [{"id": "kin", "meaning": "m", "head": "Kin", "depth": 4}]
NATURAL = [
    _rule("base", ["(KinGeneral $w $n)", "(KinWord $w $x $y)"], "(Kin $n $x $y)", {"name": "kin", "role": "base"}),
    _rule("conv", ["(KinConverse $n $c)", "(Kin $n $x $y)"], "(Kin $c $y $x)", {"name": "kin", "role": "converse"}),
    _rule("comp", ["(KinCompose $a $b $c)", "(Kin $a $x $y)", "(Kin $b $y $z)"], "(Kin $c $x $z)", {"name": "kin", "role": "compose"}),
    _rule("out", ["(Kin $n $x $y)"], "(Member (sk_kin $n $x $y) $n)"),
]


class Unrolling(unittest.TestCase):
    def test_a_natural_closure_unrolls_acyclic(self):
        """Depth 0 for a base conclusion, d + 1 for a composition of a depth-d atom with a depth-0 one below the bound,
        each converse folded into its producers (and not lowered itself), a reader outside the closure at any depth."""
        got = {r["id"]: r for r in RU.unroll(NATURAL, CLOSURE)}
        self.assertEqual(sorted(got), ["base", "base_converse", "comp", "comp_converse", "out"])
        self.assertEqual(got["base"]["conclusion"], "(Kin 0 $n $x $y)")
        self.assertEqual(got["base_converse"]["premises"], ["(KinGeneral $w $n)", "(KinConverse $n $c)", "(KinWord $w $x $y)"])
        self.assertEqual(got["base_converse"]["conclusion"], "(Kin 0 $c $y $x)")
        self.assertEqual(got["comp"]["premises"], ["(KinCompose $a $b $c)", "(Kin $d $a $x $y)", "(Kin 0 $b $y $z)"])
        self.assertEqual(got["comp"]["computations"][:2], [{"result": "$e", "op": "+", "args": ["$d", 1]},
                                                           {"result": True, "op": "<", "args": ["$e", 4]}])
        self.assertEqual(got["comp"]["conclusion"], "(Kin $e $c $x $z)")
        self.assertEqual(got["comp_converse"]["premises"][:2], ["(KinCompose $a $b $c)", "(KinConverse $c $f)"])   # renamed apart
        self.assertEqual(got["comp_converse"]["conclusion"], "(Kin $e $f $z $x)")
        self.assertEqual(got["out"]["premises"], ["(Kin $d $n $x $y)"])
        self.assertEqual({r["stage"] for r in got.values() if r["id"] != "out"}, {"closure"})
        self.assertEqual(got["out"]["stage"], "query")

    def test_the_closures_are_checked_against_their_rules(self):
        wrong = NATURAL + [_rule("stray", ["(KinWord $w $x $y)"], "(Kin $w $x $y)"),
                           _rule("bad_compose", ["(Kin $a $x $y)"], "(Kin $a $y $x)", {"name": "kin", "role": "compose"}),
                           _rule("ghost", ["(KinWord $w $x $y)"], "(KinWord $w $y $x)", {"name": "nowhere", "role": "input"})]
        problems = RU.check_closures(CLOSURE, wrong)
        self.assertTrue(any("stray" in p and "not one of its rules" in p for p in problems))
        self.assertTrue(any("bad_compose" in p and "reads 2" in p for p in problems))
        self.assertTrue(any("ghost" in p and "not declared" in p for p in problems))
        self.assertEqual(RU.check_closures(CLOSURE, NATURAL), [])


if __name__ == "__main__":
    unittest.main()
