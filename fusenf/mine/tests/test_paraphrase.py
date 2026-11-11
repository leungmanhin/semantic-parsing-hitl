"""§5.4 on our side: the pair aligner (typed correspondences, the guards, the core, the residual edits and their rules),
the questions a direction asks of the other sentence's space, the reading of the engine's answers, the admission of
two-way rewrites on the pairs' yes / no label (with what the labels of a direction add), and the admit and evaluate
steps on a small run. No engine here. Run from the repo root: ``python -m unittest discover -s fusenf/mine/tests``."""
from __future__ import annotations

import collections
import json
import os
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir, os.pardir))
sys.path.insert(0, REPO)

from fusenf.mine import align as AL, candidates as CD, chainer as CH, generalize as G, paraphrase as PA  # noqa: E402
from tmpl import answers as ANS, catalog as CAT  # noqa: E402

CATALOG = CAT.load()


def W(i, cls, **kw):
    return {"t": "witness", "id": i, "class": cls, **kw}


def V(i, verb, actor, tense="past", **kw):
    return {"t": "activity", "id": i, "verb": verb, "actor": actor, "tense": tense, **kw}


def side(text: str, instances: list, rid: str = "s") -> AL.Side:
    row = {"id": rid, "text": text, "dataset": "test", "family": "f", "role": "mine",
           "reply": {"manifest_id": "test", "response": {"id": rid, "instances": instances, "unmapped": []}}}
    s = AL.Side.of_record(row, CATALOG)
    assert s is not None, text
    return s


def aligned(x: AL.Side, y: AL.Side):
    al = AL.align(x, y)
    return al, AL.core(x, y, al), AL.edits(x, y, al)


KID = side("A kid played.", [W("x1", "kid"), V("v1", "play", "@x1")], "a")
CHILD = side("A child played.", [W("x1", "child"), V("v1", "play", "@x1")], "b")
PARK = side("A kid played in a park.", [W("x1", "kid"), W("x2", "park"), V("v1", "play", "@x1"),
                                        {"t": "location", "id": "l1", "event": "@v1", "place": "@x2", "head": "Location", "preposition": "in"}], "c")
NOT_PLAY = side("A kid did not play.", [W("x1", "kid"), V("v1", "play", "@x1"), {"t": "negation", "id": "s1", "over": ["@v1"]}], "d")
WITH_HAT = side("A man with a hat laughed.", [W("x1", "man"), W("x2", "hat"), V("v1", "laugh", "@x1"),
                                              {"t": "postmodifier", "id": "a1", "noun": "@x1", "head": "With", "object": "@x2"}], "e")
WEARS_HAT = side("A man wore a hat and laughed.", [W("x1", "man"), W("x2", "hat"), V("v1", "laugh", "@x1"),
                                                   V("v2", "wear", "@x1", patient="@x2")], "f")
ONIONS = side("A woman cut onions.", [W("x1", "woman"), V("v1", "cut", "@x1", patient="onion")], "k")
TOFU = side("A woman cut tofu.", [W("x1", "woman"), V("v1", "cut", "@x1", patient="tofu")], "l")
NOT_TOFU = side("A woman did not cut tofu.", [W("x1", "woman"), V("v1", "cut", "@x1", patient="tofu"),
                                             {"t": "negation", "id": "s1", "over": ["@v1"]}], "m")
AN_ONION = side("A woman cut an onion.", [W("x1", "woman"), W("x2", "onion"), V("v1", "cut", "@x1", patient="@x2")], "n")


class AlignTests(unittest.TestCase):
    def test_the_same_sentence_aligns_whole(self):
        al, co, ed = aligned(KID, side("A kid played.", [W("x1", "kid"), V("v1", "play", "@x1")], "a2"))
        self.assertEqual(al["unaligned"], [[], []])
        self.assertTrue(all(k == "exact" for _, _, k, _ in al["pairs"]))
        self.assertEqual(co["atoms"], len(KID.atoms))
        self.assertEqual((ed["classes"], ed["substitutions"], ed["drops"]), ([], [], []))

    def test_a_relabelled_class_is_a_class_correspondence_with_its_rule(self):
        al, co, ed = aligned(KID, CHILD)
        self.assertEqual([(c["a"], c["b"], c["position"]) for c in ed["classes"]], [("kid", "child", "Member($x,·)")])
        c = ed["classes"][0]
        self.assertTrue(c["executable"])
        self.assertIn("(Implication (Member $v1 kid) (Member $v1 child))", c["rule"])
        self.assertIn("(Implication (Member $v1 child) (Member $v1 kid))", c["reverse_rule"])
        self.assertIn("$c1", co["pattern"])                              # the class differs: a class variable in the core
        self.assertIn("play", co["constants"])

    def test_what_one_side_adds_is_a_drop(self):
        al, co, ed = aligned(KID, PARK)
        self.assertEqual(ed["classes"], [])
        self.assertEqual([d["side"] for d in ed["drops"]], ["y"])
        self.assertIn("Location", ed["drops"][0]["key"])
        self.assertIn("park", ed["drops"][0]["key"])

    def test_negation_is_aligned_across_as_a_flip_never_as_a_match(self):
        al, co, ed = aligned(NOT_PLAY, KID)
        kinds = {k for _, _, k, _ in al["pairs"]}
        self.assertIn("flip", kinds)
        self.assertTrue(ed["flips"])
        self.assertNotIn("play", co["constants"])                       # a flipped atom is no part of the core

    def test_a_negated_statement_aligned_whole_flips_the_core(self):
        self.assertTrue(AL.core_flip(NOT_PLAY, KID, AL.align(NOT_PLAY, KID)))
        self.assertTrue(AL.core_flip(KID, NOT_PLAY, AL.align(KID, NOT_PLAY)))

    def test_a_negation_over_another_word_is_no_flip(self):
        guitar = side("A kid did not play a guitar.", [W("x1", "kid"), W("x2", "guitar"), V("v1", "play", "@x1", patient="@x2"),
                                                       {"t": "negation", "id": "s1", "over": ["@v1", "@x2"]}], "i")
        flute = side("A kid played a flute.", [W("x1", "kid"), W("x2", "flute"), V("v1", "play", "@x1", patient="@x2")], "j")
        self.assertFalse(AL.core_flip(guitar, flute, AL.align(guitar, flute)))

    def test_atoms_of_both_sides_on_the_same_individuals_are_one_substitution(self):
        al, co, ed = aligned(WITH_HAT, WEARS_HAT)
        self.assertEqual(len(ed["substitutions"]), 1)
        sub = ed["substitutions"][0]
        self.assertIn("L:|With(", sub["key"])
        self.assertIn("R:|Member($e", sub["key"])
        self.assertTrue(sub["executable"])
        self.assertIn("(Implication (With $v1 $v2) (And", sub["rule"])  # the wearing is a new event: a skolem term
        self.assertIn("(sk_p54_", sub["rule"])

    def test_coreference_is_resolved_before_aligning(self):
        s = side("Odile baked a bun and she ate it.",
                 [{"t": "named-entity", "id": "n1", "name": "Odile"}, W("x1", "bun"),
                  {"t": "creation", "id": "e1", "verb": "bake", "creator": "@n1", "product": "@x1", "tense": "past"},
                  {"t": "mention", "id": "m1", "word": "she"}, {"t": "mention", "id": "m2", "word": "it"},
                  V("v1", "eat", "@m1", patient="@m2"),
                  {"t": "coref", "id": "c1", "mention": "@m1", "antecedent": "@n1", "certainty": "certain"},
                  {"t": "coref", "id": "c2", "mention": "@m2", "antecedent": "@x1", "certainty": "certain"}], "g")
        heads = {a["head"] for a in s.graph["atoms"]}
        self.assertNotIn("Coref", heads)
        self.assertFalse(any("sk_she" in st or "sk_it" in st for st in s.statements))
        eat_agent = [a for a in s.graph["atoms"] if a["head"] == "Agent" and a["args"][0].startswith("sk_eat")]
        self.assertEqual(eat_agent[0]["args"][1], "sk_odile_1")

    def test_renaming_and_shuffling_both_sides_changes_nothing(self):
        for x, y in ((KID, CHILD), (WITH_HAT, WEARS_HAT), (NOT_PLAY, PARK)):
            al, co, ed = aligned(x, y)
            xr, yr = AL.Side(G.rename_graph(x.graph, seed=3)[0]), AL.Side(G.rename_graph(y.graph, seed=4)[0])
            alr, cor, edr = aligned(xr, yr)
            self.assertEqual(PA._signature(co, ed, al), PA._signature(cor, edr, alr))

    def test_implied_rules_are_recognized(self):
        self.assertEqual(AL.implied_rule(["Implication", ["Member", "sk_g", ["Narrow", "girl", ["Member", "little"]]], ["Member", "sk_g", "little"]]),
                         "adjective-default")
        self.assertEqual(AL.implied_rule(["Implication", ["PartOf", "$x", "sk_group_1"], ["Member", ["sk_look", "$x"], "look"]]), "distribution")
        self.assertIsNone(AL.implied_rule(["Implication", ["Member", "$x", "biker"], ["Member", ["sk_jump", "$x"], "jump"]]))

    def test_the_other_rules_the_emitter_adds_are_implied_too(self):
        def kind(statement):
            return AL.implied_rule(ANS.statement_parts(statement)[1])
        # the adjective's default under a tense; a group inside another rule (a skolem term); a narrowed class's definition
        self.assertEqual(kind("(: c (Implication (Past (Member sk_ship_1 (Narrow airfield (Member floating)))) (Past (Member sk_ship_1 floating))) (STV 0.9 0.7))"),
                         "adjective-default")
        self.assertIsNone(kind("(: c (Implication (Past (Member sk_ship_1 (Narrow airfield (Member floating)))) (Future (Member sk_ship_1 floating))) (STV 0.9 0.7))"))
        self.assertEqual(kind("(: d (Implication (PartOf $x (sk_group $y)) (Member (sk_rub $x $y) rub)) (STV 1.0 0.99))"), "distribution")
        for definition in (
                "(Implication (And (Member $y issue) (PartOf $y sk_journal_1)) (Member $y (Narrow issue (PartOf sk_journal_1))))",
                "(Implication (And (Member $s wife) (Bearer $s $y) (Theme $s sk_berry_1)) (Member $y (Narrow wife (Relation wife sk_berry_1))))",
                "(Implication (And (Member $y chance) (Member $e have) (Theme $e $y) (Holder $e sk_i_1)) (Member $y (Narrow chance (Event have Theme (Holder sk_i_1)))))",
                "(Implication (And (Member $y (Narrow chain (Mod store))) (Possession $y sk_nation_1)) (Member $y (Narrow chain (And (Mod store) (Possession sk_nation_1)))))"):
            self.assertEqual(kind(f"(: s {definition} (STV 1.0 0.99))"), "class-definition", definition)
        # a generic whose predicate is a narrowed class says something: the premise does not show the restriction
        self.assertIsNone(kind("(: r (Implication (Member $x poodle) (Member $x (Narrow dog (Member small)))) (STV 1.0 0.9))"))
        self.assertIsNone(kind("(: r (Implication (And (Member $x dog) (LocatedIn $x sk_park_1)) (Member $x (Narrow dog (Member small)))) (STV 1.0 0.9))"))


class WordTests(unittest.TestCase):
    """A bare noun as an argument ("cut onions": (Patient e onion)) is a word at its position, not an individual."""

    def test_two_bare_nouns_are_a_class_correspondence_at_the_role(self):
        al, co, ed = aligned(ONIONS, TOFU)
        self.assertEqual(set(al["phi"]), {"sk_cut_1", "sk_woman_1"})                # the words correspond to nothing
        self.assertEqual([(c["a"], c["b"], c["position"]) for c in ed["classes"]], [("onion", "tofu", "Patient($e,·)")])
        self.assertIn("(Implication (Patient $v1 onion) (Patient $v1 tofu))", ed["classes"][0]["rule"])
        self.assertIn("(Implication (Patient $v1 tofu) (Patient $v1 onion))", ed["classes"][0]["reverse_rule"])
        self.assertIn("|Patient($e1,$c1)|", co["pattern"])

    def test_the_same_bare_noun_is_a_constant_of_the_core(self):
        al, co, ed = aligned(ONIONS, side("A woman cut onions.", [W("x1", "woman"), V("v1", "cut", "@x1", patient="onion")], "k2"))
        self.assertTrue(all(k == "exact" for _, _, k, _ in al["pairs"]))
        self.assertIn("onion", co["constants"])

    def test_a_negation_over_another_bare_noun_is_no_flip(self):
        self.assertTrue(AL.core_flip(TOFU, NOT_TOFU, AL.align(TOFU, NOT_TOFU)))
        self.assertFalse(AL.core_flip(ONIONS, NOT_TOFU, AL.align(ONIONS, NOT_TOFU)))
        self.assertFalse(AL.core_flip(NOT_TOFU, ONIONS, AL.align(NOT_TOFU, ONIONS)))

    def test_a_bare_noun_never_aligns_with_an_individual(self):
        al, co, ed = aligned(ONIONS, AN_ONION)                                      # onions (a kind) / an onion (a thing)
        self.assertEqual(len(ed["substitutions"]), 1)
        sub = ed["substitutions"][0]
        self.assertIn("L:|Patient($e1,onion)|", sub["key"])                         # the key names the word, as its rule does
        self.assertIn("(Patient $v2 onion)", sub["reverse_rule"])


class QuestionTests(unittest.TestCase):
    def test_a_direction_asks_the_other_sides_statements_in_this_sides_symbols(self):
        al = AL.align(KID, PARK)
        inv = {t: s for s, t in al["phi"].items()}
        qs = PA.questions(PARK, inv, "p|x>y", 0.5)                      # does "a kid played" derive "… in a park"?
        texts = [q["q"] for q in qs]
        self.assertIn("(: $prf (Member sk_play_1 play) $tv)", texts)
        joint = [q for q in qs if "park" in q["q"]]
        self.assertEqual(len(joint), 1)                                 # the park has no counterpart: asked with its location
        self.assertIn("(And ", joint[0]["q"])
        self.assertIn("$u1", joint[0]["q"])

    def test_a_denied_generic_is_also_asked_as_an_instance(self):
        # "There is no biker jumping." as the emitter states it; the side is built from the statement alone
        stmts = ["(: r1_implication (Implication (Member $x biker) (And (Member (sk_jump $x) jump) (Agent (sk_jump $x) $x))) (STV 0.0 0.9))"]
        s = AL.Side({"id": "h", "text": "There is no biker jumping.", "atoms": [], "types": {}}, stmts, {})
        qs = PA.questions(s, {}, "p|x>y", 0.5)
        self.assertEqual([q["kind"] for q in qs], ["rule", "deny"])
        self.assertEqual(qs[1]["q"], "(: $prf (And (Member $x biker) (Member $w1 jump) (Agent $w1 $x)) $tv)")

    def test_the_instance_of_a_denial_leaves_out_the_rule_its_own_atoms_imply(self):
        # "There is no man rubbing his eyes": the eyes are a group, whose distribution rule sits inside the denied content
        deny = ("(: r1_implication (Implication (Member $y man) (And (Member (sk_rub $y) rub) (Agent (sk_rub $y) $y) (Patient (sk_rub $y) (sk_group $y))"
                " (GroupOf (sk_group $y) eye) (Implication (PartOf $x (sk_group $y)) (And (Member (sk_rub2 $x $y) rub) (Patient (sk_rub2 $x $y) $x)))))"
                " (STV 0.0 0.9))")
        s = AL.Side({"id": "h", "text": "There is no man rubbing his eyes.", "atoms": [], "types": {}}, [deny], {})
        qs = PA.questions(s, {}, "p|x>y", 0.5)
        self.assertEqual([q["kind"] for q in qs], ["rule", "deny"])
        self.assertEqual(qs[1]["q"], "(: $prf (And (Member $y man) (Member $w1 rub) (Agent $w1 $y) (Patient $w1 $w2) (GroupOf $w2 eye)) $tv)")

    def test_no_instance_is_asked_when_the_denied_content_holds_a_rule_of_its_own(self):
        deny = "(: r1_implication (Implication (Member $y man) (And (Member (sk_say $y) say) (Implication (Member $x dog) (Member $x loud)))) (STV 0.0 0.9))"
        s = AL.Side({"id": "h", "text": "…", "atoms": [], "types": {}}, [deny], {})
        self.assertEqual([q["kind"] for q in PA.questions(s, {}, "p|x>y", 0.5)], ["rule"])

    def test_a_narrowed_classs_definition_is_not_asked(self):
        stmts = ["(: x1_member (Member sk_wife_1 wife) (STV 1.0 0.99))",
                 "(: d1_implication (Implication (And (Member $s wife) (Bearer $s $y) (Theme $s sk_berry_1)) (Member $y (Narrow wife (Relation wife sk_berry_1)))) (STV 1.0 0.99))"]
        s = AL.Side({"id": "h", "text": "…", "atoms": [], "types": {}}, stmts, {})
        self.assertEqual([q["kind"] for q in PA.questions(s, {}, "p|x>y", 0.5)], ["fact"])


class JudgeTests(unittest.TestCase):
    P = {"min_confidence": 0.1, "polarity_cut": 0.5}

    def test_polarity_reads_strength_confidence_and_a_rules_positive_branch(self):
        self.assertEqual(PA.polarity(["(: p (Member a b) (STV 1.0 0.99))"], 0.1, 0.5)[0], "+")
        self.assertEqual(PA.polarity(["(: p (Member a b) (STV 0.0 0.9))"], 0.1, 0.5)[0], "-")
        self.assertIsNone(PA.polarity(["(: p (Member a b) (STV 0.0 1e-06))"], 0.1, 0.5)[0])
        self.assertEqual(PA.polarity(["(: r (Implication a b) (CTV (STV 0.9 0.7) (STV 0.0 1e-06)))"], 0.1, 0.5)[0], "+")

    def test_a_direction_holds_fails_or_contradicts(self):
        qs = [{"id": "1", "kind": "fact", "sign": "+"}, {"id": "2", "kind": "fact", "sign": "+"}]
        ok = {"1": ["(: p (A) (STV 1.0 0.99))"], "2": ["(: p (B) (STV 1.0 0.9))"]}
        self.assertEqual(PA.judge(qs, ok, self.P)["verdict"], "holds")
        self.assertEqual(PA.judge(qs, {"1": ok["1"]}, self.P)["verdict"], "fails")
        self.assertEqual(PA.judge(qs, {**ok, "2": ["(: p (B) (STV 0.0 0.9))"]}, self.P)["verdict"], "contradicts")
        deny = qs[:1] + [{"id": "3", "kind": "deny", "sign": "+"}]
        self.assertEqual(PA.judge(deny, {"1": ok["1"], "3": ["(: p (C) (STV 1.0 0.99))"]}, self.P)["verdict"], "contradicts")


def _pair(pid, dataset, family, labels, role="mine"):
    """A pair as the admit and evaluate steps read it: one question per direction, both missing in round 1."""
    qs = {dr: [{"id": f"{pid}|{dr}|0", "kind": "fact", "sign": "+", "q": f"(: $prf (Member sk_{pid.replace('-', '_')} c) $tv)"}] for dr in PA.DIRS}
    return {"pair": pid, "dataset": dataset, "family": family, "role": role, "labels": labels, "x": pid + ".x", "y": pid + ".y",
            "texts": [f"{pid} first", f"{pid} second"], "queries": qs, "alignment": {"kinds": {"exact": 1}}, "core_flip": False,
            "edits": {"classes": [], "substitutions": [], "drops": [], "flips": [], "bands": []}}


def _cand(cid, a, b, reverse, pairs=(), rules=True):
    rule = f"(: p54_{cid[-4:]} (Implication (Member $v1 {a}) (Member $v1 {b})) (CTV (STV 1.0 0.99) (STV 0.0 0.0)))"
    return {"id": cid, "kind": "class", "key": [a, b], "reverse": reverse, "rules": [rule] if rules else [], "positions": {"Member($x,·)": 1},
            "occurrences": [{"pair": p, "dir": "x>y", "family": f, "executable": rules} for p, f in pairs]}


BOTH = {"label": "entailment", "ab": "A_entails_B", "ba": "B_entails_A"}
ONE_WAY = {"label": "entailment", "ab": "A_entails_B", "ba": "B_neutral_A"}
NEITHER = {"label": "neutral", "ab": "A_neutral_B", "ba": "B_neutral_A"}
FAILS = {"directions": {dr: {"verdict": "fails"} for dr in PA.DIRS}}
PARAMS = PA.params_of()
C = {n: f"paraphrase-C{n:06d}" for n in range(1, 9)}


def _world():
    """kid ↔ child (1, 2), dog ↔ animal (3, 4), sofa ↔ couch (5, 6): the one-way candidates, each with its reverse."""
    cands = [_cand(C[1], "kid", "child", C[2]), _cand(C[2], "child", "kid", C[1]), _cand(C[3], "dog", "animal", C[4]),
             _cand(C[4], "animal", "dog", C[3]), _cand(C[5], "sofa", "couch", C[6]), _cand(C[6], "couch", "sofa", C[5])]
    return {c["id"]: c for c in cands}


def _admit(pairs, under, verdicts=None, **params):
    pairs = {p["pair"]: p for p in pairs}
    return PA.admission(pairs, verdicts or {pid: FAILS for pid in pairs}, _world(), under, {**PARAMS, **params})


def _both(pid, a, b):
    """Each direction of a pair holds under one member of a unit alone."""
    return {(pid, "x>y"): (True, [a]), (pid, "y>x"): (True, [b])}


class AdmissionTests(unittest.TestCase):
    """Step 5 on the yes / no label (the baseline), with what the labels of a direction add (the bonus)."""

    def test_the_yes_no_label_of_a_pair(self):
        self.assertTrue(PA.yes_no(_pair("s1", "sick", "f", BOTH)))
        self.assertFalse(PA.yes_no(_pair("s2", "sick", "f", ONE_WAY)))          # entailing one way only: no paraphrase
        self.assertTrue(PA.yes_no(_pair("m1", "mrpc", "f", {"label": 1})))
        self.assertFalse(PA.yes_no(_pair("m2", "mrpc", "f", {"label": 0})))
        self.assertTrue(PA.directional(_pair("s1", "sick", "f", BOTH)))
        self.assertFalse(PA.directional(_pair("m1", "mrpc", "f", {"label": 1})))

    def test_a_rewrite_and_its_reverse_are_one_unit(self):
        cands = _world()
        cands["paraphrase-S000001"] = {"id": "paraphrase-S000001", "kind": "substitution", "key": ["L:a & R:a"], "reverse": "paraphrase-S000001",
                                       "rules": [], "positions": {}, "occurrences": []}
        units = PA.units_of(cands)
        self.assertEqual([u["members"] for u in units.values()], [[C[1], C[2]], [C[3], C[4]], [C[5], C[6]], ["paraphrase-S000001"]])
        self.assertEqual(list(units)[0], "paraphrase-E000001")
        self.assertEqual(PA.unit_name(units["paraphrase-E000001"], cands), "kid ↔ child")

    def test_yes_pairs_that_the_unit_alone_makes_equivalent_support_it(self):
        two = [_pair("a", "sick", "f1", BOTH), _pair("b", "sick", "f2", BOTH)]
        adm = _admit(two, {**_both("a", C[1], C[2]), **_both("b", C[1], C[2])})
        unit = adm["unit_of"][C[1]]
        self.assertEqual(adm["status"][unit], "admitted")
        self.assertEqual([e["pair"] for e in adm["pair"][unit]["sole"]], ["a", "b"])
        self.assertEqual(adm["one_way"], [])                                   # the halves of an admitted unit are no one-way findings
        self.assertEqual(_admit(two[:1], _both("a", C[1], C[2]))["status"][unit], "candidate")      # one family: not yet
        same = [_pair("a", "sick", "f1", BOTH), _pair("b", "sick", "f1", BOTH)]
        self.assertEqual(_admit(same, {**_both("a", C[1], C[2]), **_both("b", C[1], C[2])})["status"][unit], "candidate")   # families, not pairs
        half = _admit(two, {("a", "x>y"): (True, [C[1]]), ("b", "x>y"): (True, [C[1]])})             # one direction only: no equivalence
        self.assertEqual((half["status"][unit], half["pair"][unit]["sole"]), ("note", []))
        held = {"a": {"directions": {"x>y": {"verdict": "fails"}, "y>x": {"verdict": "holds"}}}, "b": FAILS}
        one = _admit(two, {("a", "x>y"): (True, [C[1]]), **_both("b", C[1], C[2])}, held)            # the other direction held already
        self.assertEqual(one["status"][unit], "admitted")

    def test_a_no_pair_that_the_unit_alone_makes_equivalent_is_a_violation(self):
        pairs = [_pair("a", "sick", "f1", BOTH), _pair("b", "sick", "f2", BOTH), _pair("n", "mrpc", "f3", {"label": 0})]
        adm = _admit(pairs, {**_both("a", C[1], C[2]), **_both("b", C[1], C[2]), **_both("n", C[1], C[2])})
        unit = adm["unit_of"][C[1]]
        self.assertEqual(adm["status"][unit], "rejected")
        self.assertEqual([e["pair"] for e in adm["pair"][unit]["violations"]], ["n"])
        self.assertEqual(adm["direction"][C[1]]["violations"], [])               # no label speaks of that pair's directions

    def test_a_direction_the_label_denies_rejects_the_unit_and_leaves_a_one_way_finding(self):
        pairs = [_pair("a", "sick", "f1", ONE_WAY), _pair("b", "sick", "f2", ONE_WAY)]
        adm = _admit(pairs, {**_both("a", C[3], C[4]), **_both("b", C[3], C[4])})
        unit = adm["unit_of"][C[3]]
        self.assertEqual(adm["status"][unit], "rejected")
        self.assertEqual(len(adm["pair"][unit]["violations"]), 2)               # by the pair: labelled no, made equivalent
        self.assertEqual([e["dir"] for e in adm["direction"][C[4]]["violations"]], ["y>x", "y>x"])   # by the direction: animal → dog
        self.assertEqual(adm["one_way"], [C[3]])                               # dog → animal: entailing in two families, never denied
        only = _admit(pairs, {("a", "y>x"): (True, [C[4]])})                    # the denied direction alone: the pair is not equivalent,
        self.assertEqual((only["status"][unit], only["pair"][unit]["violations"]), ("rejected", []))   # the direction's label still rejects
        self.assertEqual(only["one_way"], [])
        blind = [_pair("a", "mrpc", "f1", {"label": 1}), _pair("b", "mrpc", "f2", {"label": 1})]
        none = _admit(blind, {("a", "x>y"): (True, [C[3]]), ("b", "x>y"): (True, [C[3]])})
        self.assertEqual(none["one_way"], [])                                  # without a label on the direction: recorded only
        self.assertEqual(len(none["direction"][C[3]]["unlabelled"]), 2)

    def test_a_loose_yes_is_recorded_apart_and_counted_only_in_the_side_view(self):
        pairs = [_pair("a", "sick", "f1", BOTH), _pair("m", "mrpc", "f2", {"label": 1}), _pair("n", "mrpc", "f3", {"label": 1})]
        under = {**_both("a", C[5], C[6]), **_both("m", C[5], C[6]), **_both("n", C[1], C[2])}
        adm = _admit(pairs, under)
        sofa, kid = adm["unit_of"][C[5]], adm["unit_of"][C[1]]
        self.assertEqual((adm["status"][sofa], adm["side_status"][sofa]), ("candidate", "admitted"))
        self.assertEqual((adm["status"][kid], adm["side_status"][kid]), ("note", "candidate"))
        self.assertEqual([e["pair"] for e in adm["pair"][sofa]["loose"]], ["m"])
        strict = _admit(pairs, under, loose_yes=[])                             # the same set taken as strict: counted
        self.assertEqual(strict["status"][sofa], "admitted")
        no = _admit(pairs[:1] + [_pair("m", "mrpc", "f2", {"label": 0})], under)   # a loose set's NO still counts
        self.assertEqual(no["status"][sofa], "rejected")

    def test_several_units_together_are_joint_support_or_a_contact_never_counted(self):
        pairs = [_pair("a", "sick", "f1", BOTH), _pair("b", "sick", "f2", BOTH), _pair("n", "sick", "f3", NEITHER)]
        both = {("a", "x>y"): (True, [C[1], C[5]]), ("a", "y>x"): (True, [C[2], C[6]]), ("b", "x>y"): (True, [C[1], C[5]]),
                ("b", "y>x"): (True, [C[2], C[6]]), ("n", "x>y"): (True, [C[1], C[5]]), ("n", "y>x"): (True, [C[2], C[6]])}
        adm = _admit(pairs, both)
        for cid in (C[1], C[5]):
            unit = adm["unit_of"][cid]
            self.assertEqual(adm["status"][unit], "note")
            self.assertEqual((len(adm["pair"][unit]["joint"]), len(adm["pair"][unit]["contacts"])), (2, 1))
            self.assertEqual((len(adm["direction"][cid]["joint"]), len(adm["direction"][cid]["contacts"])), (2, 1))

    def test_a_unit_without_a_rule_both_ways_is_a_note(self):
        cands = _world()
        cands[C[2]]["rules"] = []
        pairs = {p["pair"]: p for p in [_pair("a", "sick", "f1", BOTH), _pair("b", "sick", "f2", BOTH)]}
        adm = PA.admission(pairs, {pid: FAILS for pid in pairs}, cands, {**_both("a", C[1], C[2]), **_both("b", C[1], C[2])}, PARAMS)
        self.assertEqual(adm["status"][adm["unit_of"][C[1]]], "note")

    def test_the_scores_every_set_has_and_those_a_direction_adds(self):
        table = collections.Counter({("entails", "holds"): 3, ("entails", "fails"): 1, ("neutral", "holds"): 1, ("neutral", "fails"): 5})
        pv = collections.Counter({("contradiction", "contradiction"): 2, ("contradiction", "relatedness"): 2, ("neutral", "contradiction"): 0})
        pe = collections.Counter({(True, True): 2, (True, False): 2, (False, True): 1, (False, False): 5})
        base = PA._scores(False, table, pv, pe)
        self.assertEqual(base, {"equivalence_precision": 0.667, "equivalence_recall": 0.5, "equivalent": 3, "paraphrases": 4,
                                "non_paraphrase_equivalent": 1})
        more = PA._scores(True, table, pv, pe)
        self.assertEqual({k: more[k] for k in base}, base)
        self.assertEqual((more["holds_precision"], more["holds_recall"], more["neutral_or_contradicts_holding"]), (0.75, 0.75, 1))
        self.assertEqual((more["contradiction_precision"], more["contradiction_recall"]), (1.0, 0.5))


class RunTests(unittest.TestCase):
    """The admit and evaluate steps on a small run written to a temporary folder: which rounds are asked, what each
    view of the evaluation share reads, and the refusal to make numbers from a round that was not asked."""

    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.runs, PA.RUNS = PA.RUNS, self.tmp.name
        self.addCleanup(setattr, PA, "RUNS", self.runs)
        self.out = os.path.join(self.tmp.name, "t", "paraphrase")
        os.makedirs(self.out)
        mine = [_pair("a", "sick", "f1", BOTH), _pair("b", "sick", "f2", BOTH),                    # kid ↔ child: two families
                _pair("c", "sick", "f3", ONE_WAY), _pair("d", "sick", "f4", ONE_WAY),              # dog → animal, never the reverse
                _pair("e", "sick", "f5", BOTH), _pair("m", "mrpc", "f6", {"label": 1})]            # sofa ↔ couch: one strict, one loose
        held = [_pair("x", "sick", "g1", BOTH, "evaluate"), _pair("y", "sick", "g2", ONE_WAY, "evaluate"),
                _pair("z", "sick", "g3", BOTH, "evaluate")]
        self.pairs = mine + held
        used = {"a": (C[1], C[2]), "b": (C[1], C[2]), "c": (C[3], C[4]), "d": (C[3], C[4]), "e": (C[5], C[6]), "m": (C[5], C[6])}
        cands = _world()
        for pid, (fwd, back) in used.items():
            fam = next(p["family"] for p in mine if p["pair"] == pid)
            cands[fwd]["occurrences"].append({"pair": pid, "dir": "x>y", "family": fam, "executable": True})
            cands[back]["occurrences"].append({"pair": pid, "dir": "y>x", "family": fam, "executable": True})
        jobs, results = [], []
        for pid, (fwd, back) in used.items():
            for dr, cid in (("x>y", fwd), ("y>x", back)):
                qid = f"r2:{pid}|{dr}|0"
                jobs.append({"id": f"r2:{pid}|{dr}", "statements": [], "extra": cands[cid]["rules"], "queries": [{"id": qid, "q": "(q)"}], "candidates": [cid]})
                results.append({"id": f"r2:{pid}|{dr}", "results": {qid: ["(: p (Member a b) (STV 1.0 0.98))"]}, "refused": []})
        verdicts = {p["pair"]: {"directions": {dr: {"verdict": "fails", "missing": [f"{p['pair']}|{dr}|0"]} for dr in PA.DIRS},
                                "verdict": "relatedness", "contradiction_by": []} for p in self.pairs}
        sentences = [{"id": f"{p['pair']}.{s}", "text": "", "statements": [f"(: f (Member {p['pair']}_{s} c) (STV 1.0 0.99))"], "canon": {}}
                     for p in self.pairs for s in "xy"]
        files = {"pairs.jsonl": self.pairs, "proposed.jsonl": list(cands.values()), "round2.jobs.jsonl": jobs, "round2.results.jsonl": results,
                 "sentences.jsonl": sentences}
        for name, rows in files.items():
            PA._write_jsonl(os.path.join(self.out, name), rows)
        for name, obj in {"verdicts1.json": verdicts, "background.json": ["(: bg (Member a b) (STV 1.0 0.99))"],
                          "align.json": {"pairs": len(self.pairs), "sentences": 2 * len(self.pairs), "missing_parse": {}, "no_graph": {},
                                         "renaming_same": len(self.pairs), "jobs": 0, "queries": 0, "background": 1, "closure_left_out": 0}}.items():
            with open(os.path.join(self.out, name), "w", encoding="utf-8") as fh:
                json.dump(obj, fh)

    def answer(self, rnd: int, holding: set):
        """The round's results as the runner writes them: each job's fingerprint, and a proof for the questions of
        ``holding`` (pair, direction)."""
        background = PA._json(os.path.join(self.out, f"round{rnd}.background.json"))
        bg = CH.background_fingerprint(background)
        rows = []
        for job in PA._jsonl(os.path.join(self.out, "round3.jobs.jsonl")):
            res = {q["id"]: (["(: p (Member a b) (STV 1.0 0.98))"] if tuple(q["id"][3:].split("|")[:2]) in holding else []) for q in job["queries"]}
            rows.append({"id": job["id"], "job": CH.fingerprint(job, bg, PARAMS["steps"]), "results": res, "refused": []})
        PA._write_jsonl(os.path.join(self.out, f"round{rnd}.results.jsonl"), rows)

    def test_the_admit_step_writes_the_units_the_one_way_findings_and_the_rounds_that_apply(self):
        info = PA.step_admit("t", PARAMS)
        self.assertEqual((info["admitted"], info["one_way"], info["side_admitted"], info["rounds_to_ask"]), (1, 1, 2, [3, 4, 5]))
        units = {" & ".join(c["pattern"]["atoms"]): c for c in CD.read(os.path.join(self.out, "candidates.jsonl"))}
        self.assertEqual({k: (c["status"], c["side"]["loose_yes_counted"]) for k, c in units.items()},
                         {"kid ↔ child": ("admitted", "admitted"), "dog ↔ animal": ("rejected", "rejected"), "sofa ↔ couch": ("candidate", "admitted")})
        self.assertEqual(units["dog ↔ animal"]["tests"]["boundary"]["by"], ["pair", "direction"])
        self.assertEqual(units["sofa ↔ couch"]["support"]["loose"], {"families": 1, "pairs": 1})
        one = CD.read(os.path.join(self.out, "one_way.jsonl"))
        self.assertEqual([(c["id"], c["pattern"]["atoms"], c["status"], c["pattern"]["unit"]) for c in one],
                         [(C[3], ["dog → animal"], "candidate", units["dog ↔ animal"]["id"])])
        self.assertEqual(one[0]["evidence"]["reverse"], {"id": C[4], "violations": 2, "entailing_families": 0})
        adm = PA._json(os.path.join(self.out, "admitted.json"))
        self.assertEqual((len(adm["rules"]), len(adm["one_way_rules"]), len(adm["side"]["loose_yes_counted"]["rules"])), (2, 1, 4))
        size = {rnd: len(PA._json(os.path.join(self.out, f"round{rnd}.background.json"))) for rnd in (3, 4, 5)}
        self.assertEqual(size, {3: 3, 4: 4, 5: 5})                              # the background + each view's rules
        self.assertEqual(len(PA._jsonl(os.path.join(self.out, "round3.jobs.jsonl"))), 6)       # the six held-out sentences
        PA.step_admit("t", {**PARAMS, "loose_yes": []})                         # nothing loose: the side view is the main one
        self.assertFalse(os.path.exists(os.path.join(self.out, "round5.background.json")))

    def test_the_evaluation_reads_each_view_from_its_own_round(self):
        PA.step_admit("t", PARAMS)
        with self.assertRaises(RuntimeError):                                   # no round asked yet: no numbers
            PA.step_evaluate("t", PARAMS)
        kid = {("x", "x>y"), ("x", "y>x")}
        self.answer(3, kid)
        self.answer(4, kid | {("y", "x>y")})
        self.answer(5, kid | {("z", "x>y"), ("z", "y>x")})
        scores = PA.step_evaluate("t", PARAMS)["sick/evaluate"]
        self.assertEqual([scores[v]["equivalent"] for v in ("before", "after", "with_one_way", "loose_yes")], [0, 1, 1, 2])
        self.assertEqual([scores[v]["holds"] for v in ("before", "after", "with_one_way", "loose_yes")], [0, 2, 3, 4])
        self.assertEqual(scores["after"]["equivalence_recall"], 0.5)            # x of the two yes pairs x and z
        report = PA._json(os.path.join(self.tmp.name, "t", "paraphrase.report.json"))
        self.assertEqual({v: c["directions"] for v, c in report["changes"].items()}, {"after": 2, "with_one_way": 3, "loose_yes": 4})
        self.assertEqual(report["candidates"]["one_way"], [C[3]])
        with open(os.path.join(self.tmp.name, "t", "paraphrase.md"), encoding="utf-8") as fh:
            text = fh.read()
        for line in ("## The candidates: two-way rewrites", "## One-way findings", "`dog → animal`", "## Side view: a loose yes counted as support",
                     "candidate → admitted"):
            self.assertIn(line, text)
        PA.step_admit("t", {**PARAMS, "min_sole_families": 1})                  # the rules changed: the stored rounds are stale
        with self.assertRaises(RuntimeError):
            PA.step_evaluate("t", {**PARAMS, "min_sole_families": 1})


if __name__ == "__main__":
    unittest.main()
