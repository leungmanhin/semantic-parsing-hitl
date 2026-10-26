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

    def query(self, h, pattern):
        return h.query(f"(: $prf {pattern} $tv)", steps=400, timeout_sec=0)

    def test_every_rule_is_a_conditional(self):
        for r in rules():
            self.assertIn("(CTV (STV ", r, r)
            self.assertTrue(r.rstrip().endswith("(STV 0.0 1.0)))"), r)

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


if __name__ == "__main__":
    unittest.main()
