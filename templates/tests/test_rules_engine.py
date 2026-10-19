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
RULES = os.path.join(HERE, os.pardir, "seeded_rules.metta")

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


if __name__ == "__main__":
    unittest.main()
