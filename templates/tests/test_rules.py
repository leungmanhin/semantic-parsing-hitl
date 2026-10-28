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
        for r in R.concrete(RULES):
            st = R.lower(r)
            name, atom = T.split_statement(st)
            if r.get("semantics") == "equivalence":
                self.assertTrue(st.startswith(f"(: {r['id']} (Equivalence "), st)
                self.assertTrue(st.endswith(f"(STV {float(r['truth']['strength'])!r} {float(r['truth']['confidence'])!r}))"), st)
                self.assertEqual(atom[0], "Equivalence")
                continue
            self.assertTrue(st.startswith(f"(: {r['id']} (Implication "), st)
            self.assertTrue(st.endswith("(STV 0.0 0.0)))"), st)
            self.assertEqual(atom[0], "Implication")
        self.assertEqual(sum(1 for r in RULES if R.runnable(r)), len(RULES))         # every rule lowers now
        days = next(r for r in RULES if r["id"] == "days_before_day")
        self.assertIn("(Compute - ($d $n) -> $e)", R.lower(days))
        single = next(r for r in RULES if r["id"] == "result_holds")
        self.assertNotIn("(And ", R.lower(single))                       # one premise, no conjunction

    def test_generated_file_is_fresh(self):
        self.assertEqual(open(R.GENERATED, encoding="utf-8").read(), R.render(RULES))

    def test_sealed_clause_rules_expand_by_tense_and_lower_when_the_chainer_can(self):
        """A rule over a sealed clause stands for one rule per matrix tense, the tense carried
        onto the clause's event named by the clause-event computation; it requires the chainer's
        sealed-term projection, which the chainer has, so it lowers; for a target without the
        capability it is listed as pending instead; a placeholder without ``expand`` is a problem."""
        src = next(r for r in RULES if r["id"] == "theme_entailed")
        variants = R.expand(src)
        self.assertEqual([v["id"] for v in variants], ["theme_entailed", "theme_entailed_past", "theme_entailed_future"])
        none, past = variants[0], variants[1]
        self.assertEqual(none["premises"], ["(Entails $m)", "(Theme $m $c)"])
        self.assertEqual(none["conclusion"], "$c")
        self.assertEqual(past["premises"], ["(Entails $m)", "(Theme $m $c)", "(Past $m)"])
        self.assertEqual(past["conclusion"], "(And $c (Past $o))")
        self.assertIn("(Compute clause-event ($c) -> $o)", R.lower(past))
        self.assertEqual(R.expand(next(r for r in RULES if r["id"] == "theme_precluded"))[2]["conclusion"], "(Not (And $c (Future $o)))")
        self.assertNotIn("expand", past)
        self.assertTrue(R.runnable(src))
        rendered = R.render(RULES)
        self.assertEqual(rendered.count("(: theme_entailed"), 3)
        self.assertEqual(rendered.count("(: theme_precluded"), 3)
        self.assertNotIn("NOT WRITTEN", rendered)
        caps = R.TARGET_CAPABILITIES["pettachainer"]                    # the same consumer without the capability
        R.TARGET_CAPABILITIES["pettachainer"] = set()
        try:
            self.assertFalse(R.runnable(src))
            pending = R.render(RULES)
            self.assertNotIn("(: theme_entailed", pending)
            self.assertIn("theme_entailed — an entailing event's sealed Theme holds", pending)
        finally:
            R.TARGET_CAPABILITIES["pettachainer"] = caps
        stray = copy.deepcopy(next(r for r in RULES if r["id"] == "result_holds"))
        stray["conclusion"] = "{tensed}"
        self.assertTrue(any("placeholder" in p for p in R.check([stray], R.substrate_heads(), R.catalog_ids())))
        unknown = copy.deepcopy(src); unknown["requires"] = "telepathy"
        self.assertTrue(any("unknown capability" in p for p in R.check([unknown], R.substrate_heads(), R.catalog_ids())))

    def test_equivalences_lower_to_the_link_and_validate(self):
        """A rule with semantics equivalence lowers to the chainer's Equivalence link with a plain
        STV; the validator wants one premise, the same variables on both sides, no computation,
        no skolem term."""
        sym = next(r for r in RULES if r["id"] == "samedegree_sym")
        self.assertEqual(R.lower(sym), "(: samedegree_sym (Equivalence (SameDegree $s $x $y) (SameDegree $s $y $x)) (STV 1.0 0.99))")
        self.assertGreaterEqual(sum(1 for r in RULES if r.get("semantics") == "equivalence"), 3)
        heads, ids = R.substrate_heads(), R.catalog_ids()
        bad = copy.deepcopy(sym); bad["conclusion"] = "(SameDegree $s $y $z)"
        self.assertTrue(any("same variables" in p for p in R.check([bad], heads, ids)))
        bad = copy.deepcopy(sym); bad["premises"] = ["(SameDegree $s $x $y)", "(Member $x $s)"]
        self.assertTrue(any("exactly one premise" in p for p in R.check([bad], heads, ids)))
        bad = copy.deepcopy(sym); bad["computations"] = [{"result": "$q", "op": "+", "args": ["$x", 1]}]
        self.assertTrue(any("no computations" in p for p in R.check([bad], heads, ids)))
        bad = copy.deepcopy(sym); bad["conclusion"] = "(SameDegree $s (sk_sym $x) $y)"
        self.assertTrue(any("skolem" in p for p in R.check([bad], heads, ids)))

    def test_validator_catches_unsound_rules(self):
        base = copy.deepcopy(next(r for r in RULES if r["id"] == "coref_agent"))
        heads, ids = R.substrate_heads(), R.catalog_ids()
        unbound = copy.deepcopy(base); unbound["conclusion"] = "(Agent $e $z)"
        self.assertTrue(any("$z" in p for p in R.check([unbound], heads, ids)))
        unknown = copy.deepcopy(base); unknown["premises"] = ["(Coref $m $a)", "(Agentt $e $m)"]
        self.assertTrue(any("unknown head" in p for p in R.check([unknown], heads, ids)))
        badop = copy.deepcopy(base); badop["computations"] = [{"result": "$q", "op": "^", "args": ["$e"]}]
        self.assertTrue(any("op must be" in p for p in R.check([badop], heads, ids)))
        dup = [copy.deepcopy(base), copy.deepcopy(base)]
        self.assertTrue(any("duplicate id" in p for p in R.check(dup, heads, ids)))
        badtruth = copy.deepcopy(base); badtruth["truth"] = {"strength": 1.5, "confidence": 0.9}
        self.assertTrue(any("truth" in p for p in R.check([badtruth], heads, ids)))


class FactsTests(unittest.TestCase):
    def test_facts_validate_and_lower(self):
        facts = R.load_facts(rules=RULES)
        self.assertGreaterEqual(len(R.statements_of(facts)), 40)
        groups = {g["id"]: g for g in facts}
        self.assertEqual(groups["pole"]["head"], "ScaleOpposite")
        self.assertEqual(R.lower_fact(groups["pole"], ["short", "tall"]), "(: pole_short_tall (ScaleOpposite short tall) (STV 1.0 0.99))")
        self.assertIn("(: unit_centimetre_metre (UnitFactor centimetre metre 0.01) (STV 1.0 0.99))", R.statements_of(facts))
        rendered = R.render(RULES, facts=facts)
        self.assertLess(rendered.index("(: pole_short_tall"), rendered.index("(: result_holds"))      # facts before rules
        self.assertEqual(R.render(RULES), rendered)                                                     # the default loads the same facts

    def test_facts_validator(self):
        arities, ids = R.substrate_arities(), R.catalog_ids()
        base = {"id": "pole", "meaning": "m", "head": "ScaleOpposite", "truth": {"strength": 1.0, "confidence": 0.99},
                "reads": ["comparative"], "entries": [["short", "tall"]]}
        self.assertEqual(R.check_facts([base], arities, ids), [])
        bad = copy.deepcopy(base); bad["head"] = "ScaleOpposit"
        self.assertTrue(any("unknown head" in p for p in R.check_facts([bad], arities, ids)))
        bad = copy.deepcopy(base); bad["entries"] = [["short"]]
        self.assertTrue(any("takes 2" in p for p in R.check_facts([bad], arities, ids)))
        bad = copy.deepcopy(base); bad["entries"] = [["short", "$x"]]
        self.assertTrue(any("not a lowercase symbol" in p for p in R.check_facts([bad], arities, ids)))
        bad = copy.deepcopy(base); bad["entries"] = [["short", "tall"], ["short", "tall"]]
        self.assertTrue(any("duplicate entry" in p for p in R.check_facts([bad], arities, ids)))
        self.assertTrue(any("already used" in p for p in R.check_facts([base], arities, ids, seen={"pole_short_tall"})))
        bad = copy.deepcopy(base); bad["reads"] = ["nowhere"]
        self.assertTrue(any("unknown template" in p for p in R.check_facts([bad], arities, ids)))


class TypecheckTests(unittest.TestCase):
    def test_lowered_rules_typecheck(self):
        try:
            import petta  # noqa: F401
        except Exception:
            self.skipTest("petta package not importable")
        with tempfile.NamedTemporaryFile("w", suffix=".jsonl", delete=False) as fh:
            fh.write(json.dumps({"id": "rules", "statements": [R.lower(r) for r in R.concrete([r for r in RULES if R.runnable(r)])] + R.statements_of(R.load_facts(rules=RULES))}) + "\n")
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
