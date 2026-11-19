"""The catalog's background rules: the neutral source (rules.yaml) validates, lowers to the chainer's
form, the generated file is fresh, the lowered statements type-check under C9 (inference mode, as the
goldens do: rules carry variables, not declarations), and the validator catches unsound rules.

Run from ``templates/``: ``python tests/test_rules.py``
"""
from __future__ import annotations

import collections
import copy
import json
import os
import re
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import lower as L, rules as R, typecheck as T  # noqa: E402

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

    def test_a_rule_over_one_stated_fact_also_stands_for_that_fact_in_the_past_and_the_future(self):
        """A state is stated flat in the present and under its tense otherwise; a rule that declares its one such
        premise as ``tensed`` stands for three: as written, and with that premise and the conclusion under the tense."""
        unit = next(r for r in RULES if r["id"] == "unit_measure")
        self.assertEqual(unit["tensed"], "(Measure $x $d $n $u)")
        plain, past, future = R.expand(unit)
        self.assertEqual([v["id"] for v in (plain, past, future)], ["unit_measure", "unit_measure_past", "unit_measure_future"])
        self.assertEqual((plain["premises"], plain["conclusion"]), (unit["premises"], unit["conclusion"]))
        self.assertNotIn("tensed", plain)
        self.assertEqual(past["premises"], ["(Past (Measure $x $d $n $u))", "(UnitFactor $u $c $f)"])   # the lexicon fact as written
        self.assertEqual(past["conclusion"], "(Past (Measure $x $d $m $c))")
        self.assertEqual(R.lower(past, R.MASTER),
                         "(: unit_measure_past (Implication (And (Past (Measure $x $d $n $u)) (UnitFactor $u $c $f) "
                         "(Compute * ($n $f) -> $m)) (Past (Measure $x $d $m $c))) (CTV (STV 1.0 0.99) (STV 0.0 0.001)))")
        self.assertEqual(future["conclusion"], "(Future (Measure $x $d $m $c))")
        link = next(r for r in RULES if r["id"] == "coref_member")                # an identity link holds at any time
        self.assertEqual(link["premises"], ["(Member $m $k)", "(Coref $m $a)"])
        self.assertEqual(R.expand(link)[1]["premises"], ["(Past (Member $m $k))", "(Coref $m $a)"])   # the stated fact first
        turned = {**link, "premises": link["premises"][::-1]}                     # … however the rule is written
        self.assertEqual(R.expand(turned)[1]["premises"], ["(Past (Member $m $k))", "(Coref $m $a)"])
        for rid in ("pole_more", "pole_moreby", "pole_samedegree", "coref_member", "coref_locatedin"):
            written = next(r for r in RULES if r["id"] == rid)                    # as written too: before the link or the
            self.assertEqual(written["premises"][0], written["tensed"], rid)      # lexicon fact (a measured cost)
        for src in RULES:                                                         # in every variant, whatever the rule's order —
            for variant in R.expand(src)[1:] if src.get("tensed") else []:        # unless the rule keeps its own (the link first)
                under = [p.startswith(("(Past ", "(Future ")) for p in variant["premises"]]
                if src.get("tensed_order") == "as_written":
                    self.assertEqual([p.startswith(("(Past ", "(Future ")) for p in variant["premises"]],
                                     [p in R.tensed_facts(src) for p in src["premises"]], variant["id"])
                    continue
                self.assertEqual(under, sorted(under, reverse=True), variant["id"])
                self.assertEqual(sorted(re.sub(r"^\((?:Past|Future) (.*)\)$", r"\1", p) for p in variant["premises"]),
                                 sorted(src["premises"]), variant["id"])
        sym = R.expand(next(r for r in RULES if r["id"] == "samedegree_sym"))[1]  # an equivalence: both sides
        self.assertEqual(R.lower(sym), "(: samedegree_sym_past (Equivalence (Past (SameDegree $s $x $y)) "
                                       "(Past (SameDegree $s $y $x))) (STV 1.0 0.99))")
        text = R.render(RULES)
        for rid in ("unit_measure_past", "unit_measure_future", "coref_member_past", "most_rank_one_past"):
            self.assertIn(f"(: {rid} ", text)
        for src in RULES:                                                         # one fact: as reliable as the rule
            if isinstance(src.get("tensed"), str):
                self.assertTrue(all(v["truth"] == src["truth"] for v in R.expand(src)), src["id"])
        heads, ids = R.substrate_heads(), R.catalog_ids()
        self.assertEqual(R.check([copy.deepcopy(unit)], heads, ids), [])
        bad = copy.deepcopy(unit); bad["tensed"] = "(Measure $x $d $n $v)"        # not a premise of the rule
        self.assertTrue(any("one of the rule's premises as written there" in p for p in R.check([bad], heads, ids)))
        bad = copy.deepcopy(unit); bad["tensed_truth"] = {"strength": 0.9, "confidence": 0.7}  # one fact: no default
        self.assertTrue(any("keep its truth" in p for p in R.check([bad], heads, ids)))
        bad = copy.deepcopy(next(r for r in RULES if r["id"] == "theme_entailed")); bad["tensed"] = bad["premises"][0]
        self.assertTrue(any("neither expands" in p for p in R.check([bad], heads, ids)))
        taken = {k: v for k, v in copy.deepcopy(unit).items() if k != "tensed"}
        taken["id"] = "unit_measure_past"                                                      # a variant's id is an id
        self.assertTrue(any("duplicate id" in p for p in R.check([copy.deepcopy(unit), taken], heads, ids)))

    def test_a_rule_over_two_stated_facts_reads_them_under_one_tense_as_a_default(self):
        """Two things said in the past need not have held together: a rule over two stated facts lists both as
        ``tensed`` and states the truth of its variants — a default at the catalog's weakest claim kind, never the
        rule's own reliability. No variant mixes a fact under a tense with a flat one."""
        chain = next(r for r in RULES if r["id"] == "located_trans")
        self.assertEqual(chain["tensed"], ["(LocatedIn $x $y)", "(LocatedIn $y $z)"])
        self.assertEqual(chain["tensed_truth"], {"strength": 0.9, "confidence": 0.7})
        plain, past, future = R.expand(chain)
        self.assertEqual((plain["premises"], plain["conclusion"], plain["truth"]),
                         (chain["premises"], chain["conclusion"], chain["truth"]))
        self.assertNotIn("tensed_truth", plain)
        self.assertEqual(past["premises"], ["(Past (LocatedIn $x $y))", "(Past (LocatedIn $y $z))"])
        self.assertEqual(R.lower(past, R.MASTER),
                         "(: located_trans_past (Implication (And (Past (LocatedIn $x $y)) (Past (LocatedIn $y $z))) "
                         "(Past (LocatedIn $x $z))) (CTV (STV 0.9 0.7) (STV 0.0 0.001)))")
        self.assertEqual(R.lower(future),
                         "(: located_trans_future (Implication (And (Future (LocatedIn $x $y)) (Future (LocatedIn $y $z))) "
                         "(Future (LocatedIn $x $z))) (CTV (STV 0.9 0.7) (STV 0.0 0.0)))")
        gap = R.expand(next(r for r in RULES if r["id"] == "measure_moreby"))[1]      # a computation and a guard as written
        self.assertEqual(R.lower(gap),
                         "(: measure_moreby_past (Implication (And (Past (Measure $x $d $a $u)) (Past (Measure $y $d $b $u)) "
                         "(Compute - ($a $b) -> $g) (Compute > ($g 0) -> true)) (Past (MoreBy $d $x $y $g $u))) "
                         "(CTV (STV 0.9 0.7) (STV 0.0 0.0)))")
        kept = R.expand(next(r for r in RULES if r["id"] == "coref_measure"))        # a rule that keeps its order: the link first
        self.assertEqual([v["premises"] for v in kept], [["(Coref $m $a)", "(Measure $m $d $n $u)"], ["(Coref $m $a)", "(Past (Measure $m $d $n $u))"],
                                                         ["(Coref $m $a)", "(Future (Measure $m $d $n $u))"]])
        self.assertTrue(all("tensed_order" not in v for v in kept))
        self.assertEqual(R.expand(next(r for r in RULES if r["id"] == "coref_member"))[1]["premises"], ["(Past (Member $m $k))", "(Coref $m $a)"])
        bound = R.expand(next(r for r in RULES if r["id"] == "most_bounds"))[1]       # a denial stays outside the tense,
        self.assertEqual(bound["premises"], ["(Past (Most $s $x $c))", "(Past (Member $y $c))"])
        self.assertEqual(bound["conclusion"], "(Not (Past (More $s $y $x)))")         # as the catalog writes a denied state
        two = ("measure_same", "measure_moreby", "located_trans", "located_in_part", "part_located", "partof_trans",
               "more_trans", "morebydiff_trans", "rank_orders", "most_exceeds", "most_bounds")
        self.assertEqual({r["id"] for r in RULES if isinstance(r.get("tensed"), list)}, set(two))
        text = R.render(RULES)
        for rid in two:
            src = next(r for r in RULES if r["id"] == rid)
            self.assertEqual(len(src["tensed"]), 2, rid)
            for head, v in zip(("Past", "Future"), R.expand(src)[1:]):
                self.assertEqual(v["truth"], {"strength": 0.9, "confidence": 0.7}, v["id"])
                self.assertEqual(sum(p.startswith(f"({head} ") for p in v["premises"]), 2, v["id"])   # both, under one tense
                self.assertIn(f"(: {v['id']} ", text)
        heads, ids = R.substrate_heads(), R.catalog_ids()
        self.assertEqual(R.check([copy.deepcopy(chain)], heads, ids), [])
        bad = copy.deepcopy(chain); del bad["tensed_truth"]                           # a default states its truth
        self.assertTrue(any("states tensed_truth" in p for p in R.check([bad], heads, ids)))
        bad = copy.deepcopy(chain); bad["tensed"] = ["(LocatedIn $x $y)"]             # a list names two or more
        self.assertTrue(any("two or more" in p for p in R.check([bad], heads, ids)))
        bad = copy.deepcopy(chain); bad["tensed"] = ["(LocatedIn $x $y)", "(LocatedIn $x $y)"]
        self.assertTrue(any("two or more" in p for p in R.check([bad], heads, ids)))
        bad = copy.deepcopy(next(r for r in RULES if r["id"] == "coref_agent"))       # a truth for variants it has not
        bad["tensed_truth"] = {"strength": 0.9, "confidence": 0.7}
        self.assertTrue(any("tensed must be" in p for p in R.check([bad], heads, ids)))

    def test_an_offset_from_an_event_reads_the_events_time(self):
        rule = next(r for r in RULES if r["id"] == "days_before_event_day")
        self.assertEqual(R.lower(rule, R.MASTER),
                         "(: days_before_event_day (Implication (And (BeforeBy $t $a $n day) (Time $a $ta) (Day $ta $d) "
                         "(Compute - ($d $n) -> $e)) (Day $t $e)) (CTV (STV 1.0 0.99) (STV 0.0 0.001)))")
        ids = {r["id"] for r in RULES}
        for unit in ("day", "month", "year"):                                     # a twin for each rule on a time anchor
            for side in ("before", "after"):
                self.assertIn(f"days_{side}_{unit}", ids)
                self.assertIn(f"days_{side}_event_{unit}", ids)

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


class UpstreamMasterTests(unittest.TestCase):
    """The second target: the same rules in upstream PeTTaChainer master's spelling, in a file of their own."""

    def test_an_implication_keeps_its_form_with_that_engines_negative_branch(self):
        rule = next(r for r in RULES if r["id"] == "coref_agent")
        self.assertEqual(R.lower(rule, R.MASTER),
                         "(: coref_agent (Implication (And (Coref $m $a) (Agent $e $m)) (Agent $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 0.001)))")
        self.assertTrue(R.lower(rule).endswith("(CTV (STV 1.0 0.99) (STV 0.0 0.0)))"))       # our engine line: as before
        days = next(r for r in RULES if r["id"] == "days_before_day")
        self.assertIn("(Compute - ($d $n) -> $e)", R.lower(days, R.MASTER))                  # a computation is spelled the same
        with self.assertRaises(R.RulesError):
            R.lower(rule, "some-other-engine")

    def test_an_equivalence_is_a_two_way_conditional_there(self):
        sym = next(r for r in RULES if r["id"] == "samedegree_sym")
        self.assertEqual(R.lower(sym, R.MASTER),
                         "(: samedegree_sym (BiImplication (SameDegree $s $x $y) (SameDegree $s $y $x)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))")
        weaker = copy.deepcopy(sym); weaker["truth"] = {"strength": 0.5, "confidence": 0.9}
        self.assertIn("(CTV (STV 0.6666666666666666 0.9) (STV 0.0 1.0))", R.lower(weaker, R.MASTER))   # 2s / (1 + s), as our line reads the link

    def test_what_that_engine_cannot_run_is_listed_and_not_written(self):
        closures = R.load_closures(rules=RULES)
        left = R.unwritten(RULES, closures, R.MASTER)
        self.assertEqual(collections.Counter(why for _r, why in left),
                         {"requires sealed-term-projection": 12, "requires evidence-tracking": 3, "the closure kin": 15})
        ids = {r["id"] for r, _why in left}
        self.assertEqual({r["id"] for r, why in left if why == "requires evidence-tracking"},    # the SECOND place of a relation
                         {"coref_whole", "coref_place", "coref_moreby_second"})
        for rid in ("look_holds", "theme_entailed", "kin_compose", "kin_lift", "kin_state_theme"):   # the last one only READS the closure's head
            self.assertIn(rid, ids)
        self.assertEqual(R.unwritten(RULES, closures), [])                                    # our line runs every rule
        low = R.lowered(RULES, closures, R.MASTER)
        self.assertEqual(len(low), len(R.concrete([r for r in RULES if r["id"] not in ids])))   # a tensed rule: three
        self.assertTrue({"coref_part", "coref_locatedin", "coref_moreby_first", "coref_part_past"} <= {r["id"] for r in low})   # the first place stays
        self.assertTrue(all(r["stage"] == "query" for r in low))                              # no closure stage, no unrolling
        text = R.render(RULES, R.MASTER)
        self.assertIn(";;   look_holds — what looks so is taken to be so (requires sealed-term-projection)", text)
        self.assertIn(" (the closure kin)", text)
        statements = [ln for ln in text.splitlines() if ln.startswith("(: ")]
        rules = [ln for ln in statements if "(Implication " in ln or "(BiImplication " in ln]
        self.assertEqual(len(rules), len(low))
        self.assertFalse([ln for ln in rules if "(Kin " in ln or "clause-event" in ln])
        self.assertFalse([ln for ln in statements if "(Equivalence " in ln or "(STV 0.0 0.0)))" in ln])
        self.assertEqual(sum("(BiImplication " in ln for ln in rules),
                         sum(1 for r in R.concrete(RULES) if r.get("semantics") == "equivalence"))
        facts = R.load_facts(rules=RULES)
        self.assertEqual(R.statements_of(facts, R.MASTER), R.statements_of(facts))            # the lexicon: the same statements
        self.assertEqual([ln for ln in statements if ln not in rules], R.statements_of(facts))

    def test_the_generated_file_for_that_engine_is_fresh(self):
        self.assertEqual(open(R.GENERATED_MASTER, encoding="utf-8").read(), R.render(RULES, R.MASTER))

    def test_every_head_the_rules_use_is_a_predicate_the_consumer_declares(self):
        names = set(L.predicates(R.MASTER))
        heads = R.substrate_heads()
        self.assertEqual(sorted(names - heads), ["Is", "NarrowBy"])                           # the lowering's two definition heads
        used = {h for r in RULES for a in r["premises"] + [r["conclusion"]] for h in R._heads(T.parse(a), set())}
        logical = {"And", "Or", "Not", "Member", "Inheritance", "Implication"}
        self.assertEqual(sorted((used & heads) - logical - names), [])
        facts = {g["head"] for g in R.load_facts(rules=RULES)}
        self.assertEqual(sorted(facts - names), [])
        self.assertIn('tmpl.lower.predicates("pettachainer-master")', R.render(RULES, R.MASTER))


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
