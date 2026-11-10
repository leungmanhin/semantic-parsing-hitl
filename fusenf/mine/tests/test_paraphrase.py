"""§5.4 on our side: the pair aligner (typed correspondences, the guards, the core, the residual edits and their rules),
the questions a direction asks of the other sentence's space, and the reading of the engine's answers. No engine here.
Run from the repo root: ``python -m unittest discover -s fusenf/mine/tests``."""
from __future__ import annotations

import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir, os.pardir))
sys.path.insert(0, REPO)

from fusenf.mine import align as AL, generalize as G, paraphrase as PA  # noqa: E402
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


if __name__ == "__main__":
    unittest.main()
