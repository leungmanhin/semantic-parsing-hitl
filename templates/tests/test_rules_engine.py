"""The catalog's seeded rules on the chainer: loaded from the file beside emitted statements, they
derive what they promise and carry a premise's truth value (the conditional form).

Needs the chainer's own environment; skipped elsewhere:
    cd <PeTTaChainer checkout> && uv run python <this file>
"""
from __future__ import annotations

import os
import re
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
RULES = os.path.join(HERE, os.pardir, "generated", "seeded_rules.metta")

try:
    from pettachainer import PeTTaChainer
except Exception:  # not the chainer's environment
    PeTTaChainer = None


def rules() -> list[str]:
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


def tv(result):
    m = re.search(r"\(STV ([0-9.e-]+) ([0-9.e-]+)\)\)$", result[0]) if result else None
    return (float(m.group(1)), float(m.group(2))) if m else None


class SeededRulesOnTheEngine(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if PeTTaChainer is None:
            raise unittest.SkipTest("pettachainer not importable: run inside the chainer's environment")
        try:                                                     # the package may import where its interpreter cannot run
            h = PeTTaChainer()
            h.add_atom("(: smoke (Member a b) (STV 1.0 0.99))")
            if not h.query("(: $prf (Member a b) $tv)", steps=10, timeout_sec=0):
                raise RuntimeError("no answer to a stored fact")
        except Exception as exc:
            raise unittest.SkipTest(f"the chainer does not run here: {exc}")

    def space(self, facts):
        h = PeTTaChainer()
        for a in facts + rules():
            h.add_atom(a)
        return h

    def query(self, h, pattern, steps=400):
        """A proof query; ``steps`` is the chainer's budget — 400 covers two derivation hops, a
        lexicon chain through a unit, a gap, a dimension and a pole needs about 4000."""
        return h.query(f"(: $prf {pattern} $tv)", steps=steps, timeout_sec=0)

    def test_every_rule_is_a_conditional(self):
        """Every implication in the generated file is a conditional with a confidence-free
        negative branch; the lexicon facts beside them are ground statements with a plain STV."""
        for r in rules():
            if "(Implication " not in r:
                self.assertNotIn("$", r, r)                                      # a fact: no variables
                self.assertTrue(r.rstrip().endswith("(STV 1.0 0.99))"), r)
                continue
            self.assertIn("(CTV (STV ", r, r)
            self.assertTrue(r.rstrip().endswith("(STV 0.0 0.0)))"), r)          # a negative branch with no confidence

    def test_named_result_holds_afterwards(self):
        h = self.space(['(: n1 (Name sk_teodor_1 "Teodor") (STV 1.0 0.99))',
                        '(: c1_member (Member sk_become_1 become) (STV 1.0 0.99))',
                        '(: c1_patient (Patient sk_become_1 sk_teodor_1) (STV 1.0 0.99))',
                        '(: c1_result (Result sk_become_1 (Member sk_teodor_1 locksmith)) (STV 1.0 0.99))',
                        '(: c1_past (Past sk_become_1) (STV 1.0 0.99))'])
        res = self.query(h, "(Member sk_teodor_1 locksmith)")
        self.assertTrue(res and "(by result_holds" in res[0])
        s, c = tv(res)
        self.assertAlmostEqual(s, 1.0, places=2)
        self.assertGreater(c, 0.85)

    def test_coref_carries_the_link_strength(self):
        base = ['(: p1_exp (Experiencer sk_like_1 sk_he_1) (STV 1.0 0.99))']
        h = self.space(base + ['(: c1 (Coref sk_he_1 sk_bob_1) (STV 0.95 0.9))'])
        s, c = tv(self.query(h, "(Experiencer sk_like_1 sk_bob_1)"))
        self.assertAlmostEqual(s, 0.95, places=2)                  # the premise's strength, not 1.0
        self.assertGreater(c, 0.85)                                 # not collapsed
        h = self.space(base + ['(: c1 (Coref sk_he_1 sk_bob_1) (STV 1.0 0.3))'])
        s, c = tv(self.query(h, "(Experiencer sk_like_1 sk_bob_1)"))
        self.assertLess(c, 0.4)                                     # a weak link gives a weak conclusion
        two = self.space(base + ['(: c1 (Coref sk_he_1 sk_bob_1) (STV 0.7 0.9))',
                                 '(: c2 (Coref sk_he_1 sk_teodor_1) (STV 0.3 0.9))'])
        bob = tv(self.query(two, "(Experiencer sk_like_1 sk_bob_1)"))
        teo = tv(self.query(two, "(Experiencer sk_like_1 sk_teodor_1)"))
        self.assertAlmostEqual(bob[0], 0.7, places=2)
        self.assertAlmostEqual(teo[0], 0.3, places=2)
        sym = self.space(['(: e1_agent (Agent sk_eat_1 sk_bob_1) (STV 1.0 0.99))', '(: c1 (Coref sk_he_1 sk_bob_1) (STV 0.95 0.9))'])
        self.assertTrue(self.query(sym, "(Agent sk_eat_1 sk_he_1)"))   # through the symmetry rule
        self.assertFalse(self.query(self.space(base), "(Experiencer sk_like_1 sk_bob_1)"))   # no link, nothing

    def test_sealed_complements_derive_at_the_matrix_tense(self):
        """An entailing event's sealed Theme is derived with the event's tense on the clause's
        event; a precluding event's is derived denied; an unmarked event derives nothing. Runs
        once the chainer projects a bound sealed term (the rules are pending until then)."""
        if not any(r.startswith("(: theme_entailed") for r in rules()):           # listed as pending in the file's header
            self.skipTest("the chainer does not project sealed terms yet: theme_entailed is pending")
        manage = ['(: n1 (Name sk_lamine_1 "Lamine") (STV 1.0 0.99))',
                  '(: x1 (Member sk_shed_1 shed) (STV 1.0 0.99))',
                  '(: e1_member (Member sk_manage_1 manage) (STV 1.0 0.99))',
                  '(: e1_agent (Agent sk_manage_1 sk_lamine_1) (STV 1.0 0.99))',
                  '(: e1_theme (Theme sk_manage_1 (And (Member sk_open_1 open) (Agent sk_open_1 sk_lamine_1) (Patient sk_open_1 sk_shed_1))) (STV 1.0 0.99))',
                  '(: e1_past (Past sk_manage_1) (STV 1.0 0.99))']
        h = self.space(manage + ['(: e1_entails (Entails sk_manage_1) (STV 1.0 0.99))'])
        res = self.query(h, "(Past sk_open_1)")
        self.assertTrue(res and "theme_entailed_past" in res[0], res)
        self.assertGreater(tv(res)[1], 0.85)
        self.assertTrue(self.query(h, "(Patient sk_open_1 sk_shed_1)"))
        self.assertFalse(self.query(self.space(manage), "(Member sk_open_1 open)"))        # no marker: a plain try
        fail = ['(: n1 (Name sk_teodor_1 "Teodor") (STV 1.0 0.99))',
                '(: e1_member (Member sk_fail_1 fail) (STV 1.0 0.99))',
                '(: e1_theme (Theme sk_fail_1 (And (Member sk_arrive_1 arrive) (Agent sk_arrive_1 sk_teodor_1))) (STV 1.0 0.99))',
                '(: e1_past (Past sk_fail_1) (STV 1.0 0.99))',
                '(: e1_precludes (Precludes sk_fail_1) (STV 1.0 0.99))']
        h = self.space(fail)
        denied = self.query(h, "(Not (And (Member sk_arrive_1 arrive) (Agent sk_arrive_1 sk_teodor_1) (Past sk_arrive_1)))")
        self.assertTrue(denied and "theme_precluded_past" in denied[0], denied)
        self.assertFalse(self.query(h, "(Member sk_arrive_1 arrive)"))

    def test_dates_resolve_against_the_anchor(self):
        facts = ['(: t1 (Time sk_bake_1 sk_time_1) (STV 1.0 0.99))',
                 '(: t1b (BeforeBy sk_time_1 sk_now_1 1 day) (STV 1.0 0.99))',
                 '(: ny (Year sk_now_1 2026) (STV 1.0 0.99))', '(: nm (Month sk_now_1 october) (STV 1.0 0.99))',
                 '(: nd (Day sk_now_1 18) (STV 1.0 0.99))']
        h = self.space(facts)
        res = self.query(h, "(Day sk_time_1 $d)")
        self.assertTrue(res and "(Day sk_time_1 17)" in res[0])
        self.assertTrue(any("(Month sk_time_1 october)" in r for r in self.query(h, "(Month sk_time_1 $m)")))
        after = self.space([f.replace("(BeforeBy sk_time_1 sk_now_1 1 day)", "(BeforeBy sk_now_1 sk_time_1 1 day)") for f in facts])
        self.assertTrue(any("(Day sk_time_1 19)" in r for r in self.query(after, "(Day sk_time_1 $d)")))
        self.assertFalse(self.query(self.space(facts[:2]), "(Day sk_time_1 $d)"))      # no anchor fields

    def test_frequency_rule_instantiates_on_a_stated_time(self):
        """A frequency rule quantifies over a class of times; a stated time joins it through the
        weekday_class bridge (a weekday field puts the time in the weekday's class) or its stated
        granularity, and the episode is a function of the occasion. A time of another class gets
        nothing."""
        facts = ['(: n1 (Name sk_ottoline_1 "Ottoline") (STV 1.0 0.99))',
                 '(: f1 (Implication (Member $x sunday) (And (Member (sk_swim $x) swim) (Agent (sk_swim $x) sk_ottoline_1) (Time (sk_swim $x) $x))) (STV 1.0 0.9))',
                 '(: t2 (Weekday sk_time_2 sunday) (STV 1.0 0.99))',
                 '(: t3 (Weekday sk_time_3 monday) (STV 1.0 0.99))']
        h = self.space(facts)
        res = self.query(h, "(Agent (sk_swim sk_time_2) sk_ottoline_1)")
        self.assertTrue(res, res)
        s, c = tv(res)
        self.assertAlmostEqual(s, 1.0, places=2)
        self.assertGreater(c, 0.8)
        self.assertTrue(self.query(h, "(Time (sk_swim sk_time_2) sk_time_2)"))
        self.assertFalse(self.query(h, "(Agent (sk_swim sk_time_3) sk_ottoline_1)"))     # a Monday: no occasion
        daily = self.space(['(: n1 (Name sk_teodor_1 "Teodor") (STV 1.0 0.99))',
                            '(: f1 (Implication (Member $x day) (And (Member (sk_read $x) read) (Agent (sk_read $x) sk_teodor_1) (Time (sk_read $x) $x))) (STV 1.0 0.9))',
                            '(: t9 (Day sk_time_9 3) (STV 1.0 0.99))', '(: t9m (Month sk_time_9 may) (STV 1.0 0.99))',
                            '(: t9c (Member sk_time_9 day) (STV 1.0 0.99))'])          # the time template states the granularity
        self.assertTrue(self.query(daily, "(Member (sk_read sk_time_9) read)"))          # a date is a day
        self.assertFalse(self.query(daily, "(Member (sk_read sk_time_8) read)"))         # no such time stated
    def test_comparisons_chain_and_a_gap_entails_the_ordering(self):
        """More is transitive, an equative is symmetric, a measured gap entails the plain ordering
        and gaps add along a chain; nothing is derived about the positive property."""
        facts = ['(: c1 (More tall sk_teodor_1 sk_yusra_1) (STV 1.0 0.99))',
                 '(: c2 (More tall sk_yusra_1 sk_lamine_1) (STV 1.0 0.99))',
                 '(: c3 (SameDegree strong sk_yusra_1 sk_lamine_1) (STV 1.0 0.99))',
                 '(: c4 (MoreBy old sk_yusra_1 sk_teodor_1 2 year) (STV 1.0 0.99))',
                 '(: c5 (MoreBy old sk_teodor_1 sk_lamine_1 3 year) (STV 1.0 0.99))']
        h = self.space(facts)
        res = self.query(h, "(More tall sk_teodor_1 sk_lamine_1)")
        self.assertTrue(res and "more_trans" in res[0], res)
        self.assertTrue(self.query(h, "(SameDegree strong sk_lamine_1 sk_yusra_1)"))
        self.assertTrue(self.query(h, "(More old sk_yusra_1 sk_teodor_1)"))
        gap = self.query(h, "(MoreBy old sk_yusra_1 sk_lamine_1 $n year)")
        self.assertTrue(gap and "5 year" in gap[0], gap)
        self.assertFalse(self.query(h, "(Member sk_teodor_1 tall)"))                 # no positive

    def test_a_restricted_rule_fires_on_a_stated_event(self):
        """An adverb with an attachment restricts to the clause's own events: a stated arrival
        gets the noon time, by instantiation of the skolemized time instance."""
        facts = ['(: n1 (Name sk_teodor_1 "Teodor") (STV 1.0 0.99))',
                 '(: f1 (Implication (And (Member $e arrive) (Agent $e sk_teodor_1)) (And (Time $e (sk_time $e)) (Hour (sk_time $e) 12))) (STV 1.0 0.9))',
                 '(: m1 (Member sk_arrive_1 arrive) (STV 1.0 0.99))',
                 '(: m1a (Agent sk_arrive_1 sk_teodor_1) (STV 1.0 0.99))',
                 '(: m1p (Past sk_arrive_1) (STV 1.0 0.99))',
                 '(: m2 (Member sk_arrive_2 arrive) (STV 1.0 0.99))',
                 '(: m2a (Agent sk_arrive_2 sk_yusra_1) (STV 1.0 0.99))']
        h = self.space(facts)
        res = self.query(h, "(Hour (sk_time sk_arrive_1) $h)")
        self.assertTrue(res and "12" in res[0], res)
        self.assertTrue(self.query(h, "(Time sk_arrive_1 (sk_time sk_arrive_1))"))
        self.assertFalse(self.query(h, "(Hour (sk_time sk_arrive_2) $h)"))      # Yusra's arrival: not restricted

    def test_a_superlative_answers_both_ways_about_another_member(self):
        """Lamine is the oldest glazier, Bob is a glazier: Lamine is older than Bob (yes), Bob is
        older than Lamine (no, at strength 0), nothing about Lamine against herself; and a factor
        entails the ordering by its side of one."""
        facts = ['(: n1 (Name sk_lamine_1 "Lamine") (STV 1.0 0.99))', '(: n2 (Name sk_bob_1 "Bob") (STV 1.0 0.99))',
                 '(: s1 (Most old sk_lamine_1 glazier) (STV 1.0 0.99))',
                 '(: s1m (Member sk_lamine_1 glazier) (STV 1.0 0.99))',
                 '(: b1 (Member sk_bob_1 glazier) (STV 1.0 0.99))',
                 '(: t1 (TimesAs tall sk_bob_1 sk_lamine_1 0.5) (STV 1.0 0.99))']
        h = self.space(facts)
        yes = self.query(h, "(More old sk_lamine_1 sk_bob_1)")
        self.assertTrue(yes and "most_exceeds" in yes[0], yes)
        self.assertAlmostEqual(tv(yes)[0], 1.0, places=2)
        no = self.query(h, "(More old sk_bob_1 sk_lamine_1)")
        self.assertTrue(no and "most_bounds" in no[0], no)
        self.assertAlmostEqual(tv(no)[0], 0.0, places=2)                           # answered, as a no
        self.assertTrue(h.query("(: $p (More old sk_bob_1 sk_lamine_1) (STV (Band 0.0 0.05) $c))", steps=400, timeout_sec=0))
        self.assertFalse(self.query(h, "(More old sk_lamine_1 sk_lamine_1)"))     # guarded: nothing against herself
        self.assertTrue(self.query(h, "(More tall sk_lamine_1 sk_bob_1)"))        # half as tall: the reverse ordering
        self.assertFalse(self.query(h, "(More tall sk_bob_1 sk_lamine_1)"))

    def test_a_counterfactual_denies_its_antecedent(self):
        """The sealed antecedent of a counterfactual is derived denied as a whole — the catalog's
        own form for a denied past clause — while neither clause is asserted. The engine does not
        project a negated bundle's conjuncts at strength 0, so the denial is queried as the bundle."""
        facts = ['(: n1 (Name sk_lamine_1 "Lamine") (STV 1.0 0.99))',
                 '(: k1 (Counterfactual (And (Member sk_sing_1 sing) (Agent sk_sing_1 sk_lamine_1) (Past sk_sing_1)) (And (Member sk_leave_1 leave) (Agent sk_leave_1 sk_yusra_1) (Past sk_leave_1))) (STV 1.0 0.99))']
        h = self.space(facts)
        denied = self.query(h, "(Not (And (Member sk_sing_1 sing) (Agent sk_sing_1 sk_lamine_1) (Past sk_sing_1)))")
        self.assertTrue(denied and "counterfactual_antecedent_false" in denied[0], denied)
        self.assertGreater(tv(denied)[1], 0.8)
        self.assertFalse(self.query(h, "(Member sk_sing_1 sing)"))                  # not asserted
        self.assertFalse(self.query(h, "(Member sk_leave_1 leave)"))                 # nor the consequent


    def test_a_norm_permits_and_a_prohibition_denies(self):
        """An obligation permits the same sealed act (obligation_permits, at the obligation's
        strength); a stored denial of permission answers the permission at strength 0; a class
        norm instantiates for a stated member and chains to the permission; a class prohibition
        answers the member's permission at 0. The sealed act is never asserted."""
        lock = "(And (Member sk_lock_1 lock) (Agent sk_lock_1 sk_lamine_1) (Patient sk_lock_1 sk_shed_1))"
        h = self.space(['(: n1 (Name sk_lamine_1 "Lamine") (STV 1.0 0.99))', '(: x1 (Member sk_shed_1 shed) (STV 1.0 0.99))',
                        f'(: s1 (Obligated {lock}) (STV 1.0 0.99))'])
        res = self.query(h, f"(Permitted {lock})")
        self.assertTrue(res and "obligation_permits" in res[0], res)
        self.assertAlmostEqual(tv(res)[0], 1.0, places=2)
        self.assertFalse(self.query(h, "(Member sk_lock_1 lock)"))                      # sealed, not asserted
        wash = "(And (Member sk_wash_1 wash) (Agent sk_wash_1 sk_teodor_1) (Patient sk_wash_1 sk_quilt_1))"
        weak = self.query(self.space([f'(: s1 (Obligated {wash}) (STV 0.7 0.99))']), f"(Permitted {wash})")
        self.assertAlmostEqual(tv(weak)[0], 0.7, places=2)                             # should: permits at 0.7
        touch = "(And (Member sk_touch_1 touch) (Agent sk_touch_1 sk_lamine_1) (Patient sk_touch_1 sk_spindle_1))"
        h = self.space([f'(: s1 (Not (Permitted {touch})) (STV 1.0 0.99))'])
        no = self.query(h, f"(Permitted {touch})")
        self.assertTrue(no, no)
        self.assertAlmostEqual(tv(no)[0], 0.0, places=2)                                 # answered, as a no
        self.assertTrue(h.query(f"(: $p (Permitted {touch}) (STV (Band 0.0 0.05) $c))", steps=400, timeout_sec=0))
        self.assertFalse(self.query(h, f"(Obligated {touch})"))
        wear = "(And (Member (sk_wear sk_bob_1) wear) (Agent (sk_wear sk_bob_1) sk_bob_1) (Patient (sk_wear sk_bob_1) glove))"
        h = self.space(['(: r1 (Implication (Member $x glazier) (Obligated (And (Member (sk_wear $x) wear) (Agent (sk_wear $x) $x) (Patient (sk_wear $x) glove)))) (STV 1.0 0.99))',
                        '(: k1 (Member sk_bob_1 glazier) (STV 1.0 0.99))'])
        self.assertTrue(self.query(h, f"(Obligated {wear})"))                            # Bob's own obligation
        two = self.query(h, f"(Permitted {wear})")
        self.assertTrue(two and "obligation_permits" in two[0], two)                    # and its permission, two steps
        enter = "(And (Member (sk_enter sk_bob_1) enter) (Agent (sk_enter sk_bob_1) sk_bob_1) (Goal (sk_enter sk_bob_1) sk_barn_1))"
        h = self.space(['(: r1 (Implication (Member $x visitor) (Not (Permitted (And (Member (sk_enter $x) enter) (Agent (sk_enter $x) $x) (Goal (sk_enter $x) sk_barn_1))))) (STV 1.0 0.99))',
                        '(: k1 (Member sk_bob_1 visitor) (STV 1.0 0.99))'])
        self.assertAlmostEqual(tv(self.query(h, f"(Permitted {enter})"))[0], 0.0, places=2)   # a class prohibition: no for Bob


    def test_a_symmetric_relation_is_one_state_with_two_bearers(self):
        """A symmetric stative relation is one state whose two relata are both its Experiencer:
        the yes/no question holds in either order, the wh-question names the other bearer, no
        trivial self-binding appears, and a != guard is accepted as a query conjunct. Nothing is
        derived: no rule is involved."""
        h = self.space(['(: n1 (Name sk_yusra_1 "Yusra") (STV 1.0 0.99))', '(: n2 (Name sk_lamine_1 "Lamine") (STV 1.0 0.99))',
                        '(: p1_member (Member sk_married_1 married) (STV 1.0 0.99))',
                        '(: p1_experiencer (Experiencer sk_married_1 sk_yusra_1) (STV 1.0 0.99))',
                        '(: p1_experiencer_2 (Experiencer sk_married_1 sk_lamine_1) (STV 1.0 0.99))'])
        self.assertTrue(self.query(h, "(And (Member $s married) (Experiencer $s sk_lamine_1) (Experiencer $s sk_yusra_1))"))   # either order
        who = self.query(h, "(And (Member $s married) (Experiencer $s sk_yusra_1) (Experiencer $s $y))")
        self.assertTrue(who and "sk_lamine_1" in who[0], who)
        self.assertEqual(len(who), 1)                                                            # no self-binding
        self.assertAlmostEqual(tv(who)[0], 1.0, places=2)
        guarded = self.query(h, "(And (Member $s married) (Experiencer $s sk_yusra_1) (Experiencer $s $y) (Compute != (sk_yusra_1 $y) -> true))")
        self.assertTrue(guarded and "sk_lamine_1" in guarded[0], guarded)
        self.assertFalse(self.query(h, "(And (Member $s married) (Experiencer $s sk_yusra_1) (Experiencer $s sk_teodor_1))"))
        asym = self.space(['(: p1_member (Member sk_depend_1 depend) (STV 1.0 0.99))',
                           '(: p1_experiencer (Experiencer sk_depend_1 sk_mill_1) (STV 1.0 0.99))',
                           '(: p1_theme (Theme sk_depend_1 sk_stream_1) (STV 1.0 0.99))'])
        self.assertFalse(self.query(asym, "(And (Member $s depend) (Experiencer $s sk_stream_1) (Theme $s $y))"))   # asymmetric: one way only


    def test_a_part_of_a_part_and_a_part_is_where_its_whole_is(self):
        """partof_trans carries parthood up the chain; part_located places a part where its
        whole is; a group's member is a part of what the group is a part of (the distribution
        premise is the same relation); nothing is derived for an unrelated thing."""
        facts = ['(: w1 (PartOf sk_wick_1 sk_lantern_1) (STV 1.0 0.99))',
                 '(: w2 (PartOf sk_lantern_1 sk_lamp_1) (STV 1.0 0.99))',
                 '(: l1 (LocatedIn sk_lamp_1 sk_shed_1) (STV 1.0 0.99))',
                 '(: x1 (Member sk_spindle_1 spindle) (STV 1.0 0.99))']
        h = self.space(facts)
        up = self.query(h, "(PartOf sk_wick_1 sk_lamp_1)")
        self.assertTrue(up and "partof_trans" in up[0], up)
        self.assertAlmostEqual(tv(up)[0], 1.0, places=2)
        where = self.query(h, "(LocatedIn sk_lantern_1 sk_shed_1)")
        self.assertTrue(where and "part_located" in where[0], where)
        self.assertTrue(self.query(h, "(LocatedIn sk_wick_1 sk_shed_1)"))                  # two steps: up, then where
        self.assertFalse(self.query(h, "(PartOf sk_spindle_1 $w)"))
        legs = ['(: g1 (GroupOf sk_group_1 leg) (STV 1.0 0.99))',
                '(: w1 (PartOf sk_group_1 sk_table_1) (STV 1.0 0.99))',
                '(: d1 (Implication (PartOf $x sk_group_1) (PartOf $x sk_table_1)) (STV 1.0 0.9))',
                '(: m1 (PartOf sk_leg_1 sk_group_1) (STV 1.0 0.99))']
        self.assertTrue(self.query(self.space(legs), "(PartOf sk_leg_1 sk_table_1)"))       # each member a part


    def test_a_measure_binds_its_magnitude_and_takes_a_threshold(self):
        """A stored measure answers a value query by binding the magnitude and the unit; a
        threshold is a boolean Compute guard in the query; a bound (MeasureAtLeast) does not
        answer a value query; a tensed measure answers under its operator."""
        h = self.space(['(: x1 (Member sk_rope_1 rope) (STV 1.0 0.99))',
                        '(: m1 (Measure sk_rope_1 long 3 metre) (STV 1.0 0.99))',
                        '(: x2 (Member sk_wall_1 wall) (STV 1.0 0.99))',
                        '(: m2 (MeasureAtLeast sk_wall_1 high 2 metre) (STV 1.0 0.99))',
                        '(: x3 (Member sk_bridge_1 bridge) (STV 1.0 0.99))',
                        '(: m3 (Past (Measure sk_bridge_1 long 200 metre)) (STV 1.0 0.99))'])
        how = self.query(h, "(Measure sk_rope_1 long $n $u)")
        self.assertTrue(how and " 3 " in how[0] and "metre" in how[0], how)                 # how long is the rope?
        self.assertTrue(self.query(h, "(And (Measure sk_rope_1 long $n metre) (Compute > ($n 2) -> true))"))    # longer than 2 metres?
        self.assertFalse(self.query(h, "(And (Measure sk_rope_1 long $n metre) (Compute > ($n 5) -> true))"))   # longer than 5?
        self.assertFalse(self.query(h, "(Measure sk_wall_1 high $n $u)"))                    # a bound is not a value
        self.assertTrue(self.query(h, "(MeasureAtLeast sk_wall_1 high $n $u)"))
        self.assertTrue(self.query(h, "(Past (Measure sk_bridge_1 long $n $u))"))            # tensed: under its operator


    def test_an_appearance_yields_its_claim_weakly(self):
        """An evidential's sealed claim is derived at the appearance dial (0.9 at 0.7), below any
        stated fact; a negated evidential yields nothing; a fact never yields its appearance."""
        if not any(r.startswith("(: look_holds") for r in rules()):
            self.skipTest("the appearance rules are pending")
        h = self.space(['(: x1 (Member sk_ferret_1 ferret) (STV 1.0 0.99))',
                        '(: s1 (Look (Member sk_ferret_1 tired)) (STV 1.0 0.99))',
                        '(: s2 (Not (Seem (Member sk_teodor_1 tired))) (STV 1.0 0.99))',
                        '(: c1 (Member sk_lamine_1 pale) (STV 1.0 0.99))'])
        looked = self.query(h, "(Member sk_ferret_1 tired)")
        self.assertTrue(looked and "look_holds" in looked[0], looked)
        s, c = tv(looked)
        self.assertAlmostEqual(s, 0.9, places=2)
        self.assertLess(c, 0.75)                                                 # below a stated fact's 0.99
        denied = self.query(h, "(Member sk_teodor_1 tired)")                     # a negated evidential: no information
        self.assertTrue(not denied or tv(denied)[1] < 0.01, denied)              # (a strength-0 answer with no confidence at most)
        self.assertFalse(self.query(h, "(Look (Member sk_lamine_1 pale))"))       # never the other way

    def test_an_adjective_complement_is_a_state_with_its_complement(self):
        """A quality adjective with its complement is a state eventuality whose complement sits
        under the preposition as written: the wh-questions read the bearer and the complement off
        the state, a denied state answers the positive at strength 0, an unstated one answers
        nothing, a class-level one instantiates for a member through the generic's rule, and a
        gerund complement is a sealed term — not asserted, yet reachable as the complement."""
        h = self.space(['(: n1 (Name sk_yusra_1 "Yusra") (STV 1.0 0.99))', '(: n2 (Name sk_teodor_1 "Teodor") (STV 1.0 0.99))',
                        '(: p1_member (Member sk_fond_1 fond) (STV 1.0 0.99))',
                        '(: p1_experiencer (Experiencer sk_fond_1 sk_yusra_1) (STV 1.0 0.99))',
                        '(: p1_of (Of sk_fond_1 sk_teodor_1) (STV 1.0 0.99))',
                        '(: p2_member (Member sk_good_1 good) (STV 1.0 0.99))',
                        '(: p2_experiencer (Experiencer sk_good_1 sk_teodor_1) (STV 1.0 0.99))',
                        '(: p2_at (At sk_good_1 chess) (STV 1.0 0.99))',
                        '(: s1_not (Not (And (Member sk_fond_2 fond) (Experiencer sk_fond_2 sk_lamine_1) (Of sk_fond_2 sk_yusra_1))) (STV 1.0 0.99))',
                        '(: r1_implication (Implication (Member $x heron) (And (Member (sk_sensitive $x) sensitive) (Experiencer (sk_sensitive $x) $x) (To (sk_sensitive $x) noise))) (STV 0.9 0.7))',
                        '(: c1_member (Member sk_ottoline_1 heron) (STV 1.0 0.99))',
                        '(: p3_member (Member sk_tired_1 tired) (STV 1.0 0.99))',
                        '(: p3_experiencer (Experiencer sk_tired_1 sk_lamine_1) (STV 1.0 0.99))',
                        '(: p3_of (Of sk_tired_1 (And (Member sk_wait_1 wait) (Agent sk_wait_1 sk_lamine_1))) (STV 1.0 0.99))'])
        who = self.query(h, "(And (Member $s fond) (Experiencer $s $x) (Of $s sk_teodor_1))")
        self.assertTrue(who and "sk_yusra_1" in who[0], who)                                   # who is fond of Teodor
        what = self.query(h, "(And (Member $s good) (Experiencer $s sk_teodor_1) (At $s $y))")
        self.assertTrue(what and "chess" in what[0], what)                                     # what is Teodor good at
        denied = self.query(h, "(And (Member $s fond) (Experiencer $s sk_lamine_1) (Of $s sk_yusra_1))")
        self.assertTrue(denied and tv(denied)[0] < 0.01, denied)                               # a stored denial answers at strength 0
        self.assertFalse(self.query(h, "(And (Member $s good) (Experiencer $s sk_yusra_1) (At $s chess))"))   # unstated: nothing
        member = self.query(h, "(And (Member $s sensitive) (Experiencer $s sk_ottoline_1) (To $s $what))")
        self.assertTrue(member and "noise" in member[0], member)                               # the class rule instantiates for a member
        s, c = tv(member)
        self.assertAlmostEqual(s, 0.9, places=2)
        self.assertLess(c, 0.75)
        self.assertFalse(self.query(h, "(Member $e wait)"))                                    # the gerund is sealed: no waiting asserted
        sealed = self.query(h, "(And (Member $s tired) (Experiencer $s sk_lamine_1) (Of $s $what))")
        self.assertTrue(sealed and "(Member sk_wait_1 wait)" in sealed[0], sealed)             # yet reachable as the complement

    def test_a_portion_is_a_subset_or_a_part_of_its_whole(self):
        """A quantified portion of a definite group is a subset group whose count or proportion
        binds; the distribution rule over it instantiates for a stated member; the member is a
        part of the whole group through subset_is_part and partof_trans; a fraction level binds
        as a Fraction term; a portion of a mass is a part of it; and nothing is claimed of the
        class in general."""
        if not any(r.startswith("(: subset_is_part") for r in rules()):
            self.skipTest("the subset rule is pending")
        h = self.space(['(: g1_groupof (GroupOf sk_group_1 ferret) (STV 1.0 0.99))',
                        '(: g2_groupof (GroupOf sk_portion_1 ferret) (STV 1.0 0.99))',
                        '(: g2_subsetof (SubsetOf sk_portion_1 sk_group_1) (STV 1.0 0.99))',
                        '(: g2_cardinality (Cardinality sk_portion_1 3) (STV 1.0 0.99))',
                        '(: v1_member (Member sk_sleep_1 sleep) (STV 1.0 0.99))',
                        '(: v1_agent (Agent sk_sleep_1 sk_portion_1) (STV 1.0 0.99))',
                        '(: v1_past (Past sk_sleep_1) (STV 1.0 0.99))',
                        '(: d1_implication (Implication (PartOf $x sk_portion_1) (And (Member (sk_sleep $x) sleep) (Agent (sk_sleep $x) $x) (Past (sk_sleep $x)))) (STV 1.0 0.9))',
                        '(: f9 (Member sk_ferret_9 ferret) (STV 1.0 0.99))',
                        '(: f9p (PartOf sk_ferret_9 sk_portion_1) (STV 1.0 0.99))',
                        '(: g3_groupof (GroupOf sk_group_2 quilt) (STV 1.0 0.99))',
                        '(: g4_groupof (GroupOf sk_portion_2 quilt) (STV 1.0 0.99))',
                        '(: g4_subsetof (SubsetOf sk_portion_2 sk_group_2) (STV 1.0 0.99))',
                        '(: g4_proportionof (ProportionOf sk_portion_2 sk_group_2 most) (STV 1.0 0.99))',
                        '(: c1_member (Member sk_portion_2 damp) (STV 1.0 0.99))',
                        '(: g6_proportionof (ProportionOf sk_portion_3 sk_group_3 (Fraction 40 100)) (STV 1.0 0.99))',
                        '(: x1_member (Member sk_loaf_1 loaf) (STV 1.0 0.99))',
                        '(: g7_partof (PartOf sk_portion_4 sk_loaf_1) (STV 1.0 0.99))',
                        '(: g7_proportionof (ProportionOf sk_portion_4 sk_loaf_1 half) (STV 1.0 0.99))',
                        '(: c2_member (Member sk_portion_4 stale) (STV 1.0 0.99))'])
        how_many = self.query(h, "(And (SubsetOf $s sk_group_1) (Cardinality $s $n) (Member $e sleep) (Agent $e $s))")
        self.assertTrue(how_many and "(Cardinality sk_portion_1 3)" in how_many[0], how_many)      # how many of the ferrets slept
        member = self.query(h, "(And (Member (sk_sleep sk_ferret_9) sleep) (Agent (sk_sleep sk_ferret_9) sk_ferret_9))")
        self.assertTrue(member and "d1_implication" in member[0], member)                            # a stated member slept, by the distribution
        whole = self.query(h, "(PartOf sk_ferret_9 sk_group_1)")
        self.assertTrue(whole and "subset_is_part" in whole[0] and "partof_trans" in whole[0], whole)   # a member of the portion is a member of the whole
        share = self.query(h, "(And (ProportionOf $p sk_group_2 $level) (Member $p damp))")
        self.assertTrue(share and " most)" in share[0], share)                                       # what share of the quilts is damp
        fraction = self.query(h, "(ProportionOf $p sk_group_3 (Fraction $n $d))")
        self.assertTrue(fraction and "(Fraction 40 100)" in fraction[0], fraction)                   # a fraction level binds
        self.assertTrue(self.query(h, "(And (PartOf $p sk_loaf_1) (ProportionOf $p sk_loaf_1 half) (Member $p stale))"))   # a portion of a mass
        self.assertFalse(self.query(h, "(Implication (Member $x quilt) (Member $x damp))"))         # no claim about quilts in general

    def test_the_lexicon_bridges_poles_units_and_dimensions(self):
        """The background lexicon: a comparison on one pole answers a question on the opposite
        pole and a measured gap flips with it; a measure in a non-canonical unit holds in the
        canonical unit; two measures on one dimension give the gap, the ordering and, when equal,
        the equative; a dimension noun's ordering reaches its adjective scale and then the
        opposite pole; nothing is derived the wrong way round."""
        if not any(r.startswith("(: pole_short_tall") for r in rules()):
            self.skipTest("the lexicon is pending")
        h = self.space(['(: c1 (More short sk_bob_1 sk_alice_1) (STV 1.0 0.99))',
                        '(: c2 (MoreBy light sk_pony_1 sk_horse_1 30 kilogram) (STV 1.0 0.99))',
                        '(: m1 (Measure sk_rope_1 long 300 centimetre) (STV 1.0 0.99))',
                        '(: m2 (Measure sk_beam_1 long 2 metre) (STV 1.0 0.99))',
                        '(: m3 (Measure sk_crate_1 weight 12 kilogram) (STV 1.0 0.99))',
                        '(: m4 (Measure sk_box_1 weight 10 kilogram) (STV 1.0 0.99))',
                        '(: m5 (Measure sk_yusra_1 old 30 year) (STV 1.0 0.99))',
                        '(: m6 (Measure sk_teodor_1 old 30 year) (STV 1.0 0.99))'])
        flipped = self.query(h, "(More tall sk_alice_1 sk_bob_1)")
        self.assertTrue(flipped and "pole_more" in flipped[0], flipped)                   # shorter than = taller than, reversed
        self.assertFalse(self.query(h, "(More tall sk_bob_1 sk_alice_1)"))                # never the wrong way round
        self.assertTrue(self.query(h, "(More heavy sk_horse_1 sk_pony_1)"))               # the gap flips, then the ordering
        metres = self.query(h, "(Measure sk_rope_1 long $m metre)")
        self.assertTrue(metres and " 3.0 " in metres[0], metres)                          # 300 centimetres in the canonical unit
        gap = self.query(h, "(MoreBy long sk_rope_1 sk_beam_1 $g metre)")
        self.assertTrue(gap and " 1.0 " in gap[0], gap)                                   # the gap across units
        self.assertTrue(self.query(h, "(More long sk_rope_1 sk_beam_1)", steps=1500))     # and the ordering: three hops
        self.assertFalse(self.query(h, "(More long sk_beam_1 sk_rope_1)", steps=1500))
        self.assertTrue(self.query(h, "(More heavy sk_crate_1 sk_box_1)", steps=1500))    # weight → heavy
        self.assertTrue(self.query(h, "(More light sk_box_1 sk_crate_1)", steps=4000))    # → light, the opposite pole: five hops
        self.assertTrue(self.query(h, "(SameDegree old sk_yusra_1 sk_teodor_1)"))         # equal measures: the equative
        self.assertFalse(self.query(h, "(More old sk_yusra_1 sk_teodor_1)"))


if __name__ == "__main__":
    unittest.main()
