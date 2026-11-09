"""The question form (tmpl.query, tmpl.answers, the question and wh templates): a parsed question → its query; the
engine's proofs → answers. The engine side is tests/test_query_engine.py; this file checks that the program writes
exactly the strings that file asks the engine with.

    python -m unittest tests.test_query        (from templates/)
"""
from __future__ import annotations

import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir))
sys.path.insert(0, HERE)

from tmpl import answers as A, blocks as B, catalog as CAT, emit as E, lower as L, query as Q, suite as S, validate as V  # noqa: E402
from test_query_engine import CASES, KIN_STORIES  # noqa: E402

CATALOG = CAT.load()


def N(i, name):
    return {"t": "named-entity", "id": i, "name": name}


def context(sentences):
    return B.context_of([{"text": t, "instances": i} for t, i in sentences])


def ask_after(sentences, question):
    ctx = context(sentences)
    return Q.ask(B.qualify(question, len(ctx) + 1), CATALOG, [i for c in ctx for i in c["instances"]])


class TheEngineCases(unittest.TestCase):
    def test_the_engine_cases_are_what_the_program_writes(self):
        """The statements and queries tests/test_query_engine.py asks the chainer with are the program's own."""
        for case in CASES:
            with self.subTest(case["name"]):
                ctx = context(case["context"])
                self.assertEqual([s for r in B.block_records(ctx, CATALOG) for s in r["statements"]], case["statements"])
                asked = ask_after(case["context"], case["question"]) if case["after_context"] else Q.ask(case["question"], CATALOG)
                self.assertEqual(L.question(asked)["queries"], case["queries"])
                self.assertEqual([a["var"] for a in asked["asked"]], case["asked"])
                self.assertEqual(asked["findings"], [])

    def test_the_kinship_cases_are_what_the_program_writes(self):
        for sentences, statements, questions in KIN_STORIES:
            ctx = context(sentences)
            self.assertEqual([s for r in B.block_records(ctx, CATALOG) for s in r["statements"]], statements)
            for q in questions:
                with self.subTest(q["name"]):
                    self.assertEqual(L.question(ask_after(sentences, q["question"]))["queries"], q["queries"])


class Asking(unittest.TestCase):
    def test_every_question_example_asks(self):
        """Every catalog example that asks gives a query whose readings hold every asked word, with no finding."""
        n = 0
        for tid, t in CATALOG.items():
            for section in ("shown", "held_out"):
                for ex in (t.get("examples") or {}).get(section) or []:
                    insts = ex.get("instances") or []
                    if Q.question_of(insts, CATALOG) is None:
                        continue
                    asked = ask_after([(c["text"], c["instances"]) for c in ex["context"]], insts) if ex.get("context") \
                        else Q.ask(insts, CATALOG)
                    self.assertEqual(asked["findings"], [], ex["text"])
                    self.assertTrue(asked["readings"], ex["text"])
                    want = "choice" if any(i.get("options") for i in insts) else "wh" if any(i["t"] == "wh" for i in insts) else "yes-no"
                    self.assertEqual(asked["form"], want, ex["text"])
                    n += 1
        self.assertGreaterEqual(n, 20)

    def test_a_question_names_the_contexts_referent_and_drops_the_mentions_description(self):
        asked = ask_after(CASES[0]["context"], CASES[0]["question"])
        pattern = L.render(asked["readings"][0]["pattern"])
        self.assertIn("sk_ferret_1", pattern)                  # the context's ferret
        self.assertNotIn("Coref", pattern)                     # the link did the identifying
        self.assertNotIn("ferret)", pattern.replace("sk_ferret_1)", ""))   # no (Member … ferret) for the question's mention
        self.assertEqual(asked["readings"][0]["resolution"], [{"mention": "s2.x1", "antecedent": "s1.x1", "certainty": 0.99}])

    def test_an_asked_word_in_a_lexicon_tested_slot_reads_both_outcomes(self):
        rel = Q.ask([N("n1", "Joost"), N("n2", "Anouk"), {"t": "wh", "id": "w1", "word": "how"},
                     {"t": "stative-relation", "id": "p1", "relation": "@w1", "subject": "@n1", "object": "@n2", "tense": "present"},
                     {"t": "question", "id": "a1"}], CATALOG)
        self.assertEqual([rd["lexicon"] for rd in rel["readings"]], [False, True])
        self.assertIn("(Theme $wh_1 $anouk_1)", L.render(rel["readings"][0]["pattern"]))
        self.assertIn("(Bearer $wh_1 $anouk_1)", L.render(rel["readings"][1]["pattern"]))
        known = Q.ask([N("n1", "Lamine"), {"t": "wh", "id": "w1", "word": "who"},
                       {"t": "stative-relation", "id": "p1", "relation": "daughter", "subject": "@w1", "object": "@n1", "tense": "present"},
                       {"t": "question", "id": "a1"}], CATALOG)
        self.assertEqual([rd["lexicon"] for rd in known["readings"]], [None])

    def test_a_mention_with_two_candidate_antecedents_gives_one_reading_each(self):
        sentences = [("Teodor met Lamine.", [N("n1", "Teodor"), N("n2", "Lamine"),
                                             {"t": "activity", "id": "e1", "verb": "meet", "actor": "@n1", "patient": "@n2", "tense": "past"}])]
        asked = ask_after(sentences, [{"t": "mention", "id": "m1", "word": "he"},
                                      {"t": "coref", "id": "c1", "mention": "@m1", "antecedent": "@s1.n1", "certainty": "likely"},
                                      {"t": "coref", "id": "c2", "mention": "@m1", "antecedent": "@s1.n2", "certainty": "unsure"},
                                      {"t": "motion", "id": "e1", "verb": "leave", "mover": "@m1", "tense": "past"},
                                      {"t": "question", "id": "a1"}])
        self.assertEqual([rd["certainty"] for rd in asked["readings"]], [0.8, 0.5])
        self.assertIn("sk_teodor_1", L.render(asked["readings"][0]["pattern"]))
        self.assertIn("sk_lamine_1", L.render(asked["readings"][1]["pattern"]))

    def test_a_choice_reading_holds_its_option_and_what_the_option_names(self):
        case = next(c for c in CASES if "choice" in c["name"] or "or Yusra" in c["name"])
        one, two = [L.render(rd["pattern"]) for rd in Q.ask(case["question"], CATALOG)["readings"]]
        self.assertIn('"Teodor"', one)
        self.assertNotIn('"Yusra"', one)
        self.assertIn('"Yusra"', two)
        self.assertNotIn('"Teodor"', two)
        self.assertIn("(Member $ferret_1 ferret)", one)        # the shared ferret, in both
        self.assertIn("(Member $ferret_1 ferret)", two)
        bad = Q.ask([N("n1", "Teodor"), {"t": "motion", "id": "e1", "verb": "leave", "mover": "@n1", "tense": "past"},
                     {"t": "question", "id": "a1", "options": ["@e1"]}], CATALOG)
        self.assertTrue(any("two or more" in f["detail"] for f in bad["findings"]))

    def test_a_statement_is_not_asked(self):
        with self.assertRaises(Q.QueryError):
            Q.ask([N("n1", "Teodor"), {"t": "motion", "id": "e1", "verb": "leave", "mover": "@n1", "tense": "past"}], CATALOG)

    def test_an_asked_word_belongs_to_a_question_and_a_text_asks_once(self):
        with self.assertRaises(E.EmitError) as err:
            E.emit({"id": "x", "instances": [{"t": "wh", "id": "w1", "word": "who"},
                                             {"t": "motion", "id": "e1", "verb": "leave", "mover": "@w1", "tense": "past"}]}, CATALOG)
        self.assertIn("asked word", str(err.exception))
        with self.assertRaises(E.EmitError) as err:
            E.emit({"id": "x", "instances": [{"t": "question", "id": "a1"}, {"t": "question", "id": "a2"}]}, CATALOG)
        self.assertIn("question instances", str(err.exception))

    def test_a_definition_is_carried_beside_the_query(self):
        """A superlative in a question defines its comparison class: no conjunct, a definition beside the query."""
        asked = Q.ask([N("n1", "Lamine"), {"t": "wh", "id": "w1", "word": "who"},
                       {"t": "stative-relation", "id": "p1", "relation": "child", "subject": "@w1", "object": "@n1", "tense": "present"},
                       {"t": "superlative", "id": "s1", "subject": "@w1", "scale": "young", "class": "child", "kind": "most",
                        "predicative": True, "within": ["@p1"], "tense": "present"},
                       {"t": "question", "id": "a1"}], CATALOG)
        rd = asked["readings"][0]
        self.assertTrue(rd["definitions"])
        self.assertFalse(any(isinstance(c, list) and c[:1] == ["Implication"] for c in rd["conjuncts"]))
        self.assertTrue(L.question(asked)["definitions"][0].startswith("(: "))


class QuestionsInABlock(unittest.TestCase):
    def test_a_question_sentence_asks_and_joins_nothing(self):
        s1 = [N("n1", "Teodor"), {"t": "witness", "id": "x1", "class": "ferret"},
              {"t": "activity", "id": "v1", "verb": "feed", "actor": "@n1", "patient": "@x1", "tense": "past"}]
        s2 = [{"t": "wh", "id": "w1", "word": "who"}, {"t": "witness", "id": "x1", "class": "ferret", "definite": True},
              {"t": "coref", "id": "c1", "mention": "@x1", "antecedent": "@s1.x1", "certainty": "certain"},
              {"t": "activity", "id": "e1", "verb": "feed", "actor": "@w1", "patient": "@x1", "tense": "past"},
              {"t": "question", "id": "a1"}]
        s3 = [{"t": "witness", "id": "x1", "class": "ferret", "definite": True},
              {"t": "coref", "id": "c1", "mention": "@x1", "antecedent": "@s1.x1", "certainty": "certain"},
              {"t": "activity", "id": "v1", "verb": "sleep", "actor": "@x1", "tense": "past"}]
        recs = B.block_records(context([("Teodor fed a ferret.", s1), ("Who fed the ferret?", s2), ("The ferret slept.", s3)]), CATALOG)
        self.assertEqual([r["status"] for r in recs], ["ok", "ok", "ok"])
        self.assertEqual(recs[1].get("kind"), "question")
        self.assertEqual((recs[1]["statements"], recs[1]["declarations"]), ([], []))
        self.assertEqual(recs[1]["question"]["queries"], CASES[0]["queries"])
        self.assertIn("(Member sk_ferret_2 ferret)", " ".join(recs[2]["statements"]))   # the question's ferret took no number
        self.assertFalse(any(s.startswith("(: s2_") for s in recs[2]["statements"]))


class Validation(unittest.TestCase):
    def test_a_question_is_flagged_and_not_typed_as_facts(self):
        res = V.validate({"instances": CASES[2]["question"]}, CATALOG)
        self.assertTrue(res["question"])
        self.assertTrue(res["typecheck"].startswith("skipped (a question"))
        self.assertEqual(res["status"], "ok")

    def test_a_reference_in_a_lemma_slot_outside_a_question_is_a_lint(self):
        """The emitter still renders it, as it always has; the validator reports it."""
        reply = {"instances": [{"t": "witness", "id": "x1", "class": "way", "definite": True},
                               {"t": "activity", "id": "e1", "verb": "handle", "patient": "situation", "tense": "past"},
                               {"t": "manner", "id": "a1", "event": "@e1", "manner": "@x1"}]}
        res = V.inspect(reply, CATALOG)
        self.assertEqual(res["status"], "ok")
        self.assertIn("lemma-reference", [f["kind"] for f in res["findings"]])
        self.assertIn("(Manner sk_handle_1 sk_way_1)", " ".join(res["statements"]))


class Scoring(unittest.TestCase):
    def test_queries_compare_modulo_their_variable_names(self):
        case = {"instances": CASES[5]["question"]}
        a = S.query_units(Q.ask(CASES[5]["question"], CATALOG))
        swapped = [CASES[5]["question"][1], CASES[5]["question"][0]] + CASES[5]["question"][2:]   # Yusra numbered first
        b = S.query_units(Q.ask(swapped, CATALOG))
        self.assertTrue(S.same(a, b))
        no_options = [dict(i) for i in CASES[5]["question"]]
        no_options[-1] = {"t": "question", "id": "a1"}
        self.assertFalse(S.same(a, S.query_units(Q.ask(no_options, CATALOG))))
        self.assertTrue(S.is_question_case(case, CATALOG))


class Answers(unittest.TestCase):
    STATEMENTS = ['(: n1 (Name sk_valerie_1 "Valerie") (STV 1.0 0.99))', '(: n2 (Name sk_valerie_2 "Valerie") (STV 1.0 0.99))',
                  "(: c1 (Coref sk_valerie_2 sk_valerie_1) (STV 0.99 0.9))", "(: c2 (Coref sk_her_1 sk_valerie_1) (STV 0.99 0.9))",
                  "(: p1 (Member sk_daughter_1 daughter) (STV 1.0 0.99))"]
    PATTERN = "(And (Member $s daughter) (Bearer $s $who) (Theme $s sk_stanley_1))"

    def line(self, who, s, c):
        return (f"(: (conjunction p1 b1) (And (Member sk_daughter_1 daughter) (Bearer sk_daughter_1 {who}) "
                f"(Theme sk_daughter_1 sk_stanley_1)) (STV {s} {c}))")

    def test_coreferent_bindings_are_one_answer_and_every_proof_is_kept(self):
        got = A.answers([self.line("sk_valerie_1", 0.99, 0.9), self.line("sk_valerie_2", 0.98, 0.9), self.line("sk_her_1", 0.98, 0.9)],
                        self.PATTERN, ["$who"], self.STATEMENTS)
        self.assertEqual(got["proofs"], 3)
        self.assertEqual(len(got["answers"]), 1)
        self.assertEqual(got["answers"][0]["proofs"], 3)
        self.assertEqual(got["answers"][0]["bindings"]["$who"]["names"], ["Valerie"])
        self.assertEqual(got["best"], (0.99, 0.9))

    def test_a_word_is_answered_as_a_word(self):
        got = A.answers(["(: s1 (Member sk_daughter_1 daughter) (STV 1.0 0.99))"], "(Member sk_daughter_1 $rel)", ["$rel"], self.STATEMENTS)
        self.assertEqual(got["answers"][0]["bindings"]["$rel"], {"value": "daughter", "word": True})

    def test_a_line_that_does_not_fit_the_pattern_is_counted_unread(self):
        got = A.answers(["(: x (Member a b) (STV 1.0 0.9))", "garbage"], self.PATTERN, ["$who"], self.STATEMENTS)
        self.assertEqual((got["proofs"], got["unread"], got["answers"]), (2, 2, []))

    def test_the_query_syntax(self):
        self.assertEqual(L.query(["Member", "$x", "cat"]), "(: $prf (Member $x cat) $tv)")
        self.assertEqual(A.statements_of('; a comment\n(: a (Name x "a (b") (STV 1.0 0.99))\n(: b (Member x c) (STV 1.0 0.99))'),
                         ['(: a (Name x "a (b") (STV 1.0 0.99))', "(: b (Member x c) (STV 1.0 0.99))"])


if __name__ == "__main__":
    unittest.main()
