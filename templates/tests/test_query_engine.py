"""The question form on the chainer: a question's query, asked of the statements of the text it is asked against
(with the seeded rules beside them), binds the asked words to the right referents and words.

Each case holds the text's sentences and the question as the parser writes them, and — literal — the statements
the text's records lower to and the queries the question lowers to; ``tests/test_query.py`` checks that the program
still produces exactly these strings from those instances, so the two stay in step.

Needs the chainer's own environment; skipped elsewhere:
    cd <PeTTaChainer checkout> && uv run python <this file>      (or its .venv/bin/python)
"""
from __future__ import annotations

import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir))
RULES = os.path.join(HERE, os.pardir, "generated", "seeded_rules.metta")
CLOSURE = os.path.join(HERE, os.pardir, "generated", "closure_rules.metta")

from tmpl import answers as A, reason as R  # noqa: E402  (pure Python: runs in the chainer's environment too)

try:
    from pettachainer import PeTTaChainer
except Exception:  # not the chainer's environment
    PeTTaChainer = None


def N(i, name):
    return {"t": "named-entity", "id": i, "name": name}


CASES = [
    {"name": "who fed the ferret — read after the text: the definite is the text's ferret",
     "context": [("Teodor fed a ferret.",
                  [N("n1", "Teodor"), {"t": "witness", "id": "x1", "class": "ferret"},
                   {"t": "activity", "id": "v1", "verb": "feed", "actor": "@n1", "patient": "@x1", "tense": "past"}])],
     "after_context": True,
     "question": [{"t": "wh", "id": "w1", "word": "who"}, {"t": "witness", "id": "x1", "class": "ferret", "definite": True},
                  {"t": "coref", "id": "c1", "mention": "@x1", "antecedent": "@s1.x1", "certainty": "certain"},
                  {"t": "activity", "id": "e1", "verb": "feed", "actor": "@w1", "patient": "@x1", "tense": "past"},
                  {"t": "question", "id": "a1"}],
     "statements": ['(: s1_n1_name (Name sk_teodor_1 "Teodor") (STV 1.0 0.99))',
                    "(: s1_x1_member (Member sk_ferret_1 ferret) (STV 1.0 0.99))",
                    "(: s1_v1_member (Member sk_feed_1 feed) (STV 1.0 0.99))",
                    "(: s1_v1_agent (Agent sk_feed_1 sk_teodor_1) (STV 1.0 0.99))",
                    "(: s1_v1_patient (Patient sk_feed_1 sk_ferret_1) (STV 1.0 0.99))",
                    "(: s1_v1_past (Past sk_feed_1) (STV 1.0 0.99))"],
     "queries": ["(: $prf (And (Member $feed_2 feed) (Agent $feed_2 $who) (Patient $feed_2 sk_ferret_1) (Past $feed_2)) $tv)"],
     "asked": ["$who"],
     "expect": [{"$who": ["Teodor"]}]},
    {"name": "how is Yusra related to Lamine — the relation through the possessive's coref; the symmetric reading finds none",
     "context": [("Lamine hugged his daughter Yusra.",
                  [N("n1", "Lamine"), {"t": "mention", "id": "m1", "word": "his"},
                   {"t": "coref", "id": "c1", "mention": "@m1", "antecedent": "@n1", "certainty": "certain"}, N("n2", "Yusra"),
                   {"t": "stative-relation", "id": "p1", "relation": "daughter", "subject": "@n2", "object": "@m1", "tense": "present"},
                   {"t": "activity", "id": "e1", "verb": "hug", "actor": "@n1", "patient": "@n2", "tense": "past"}])],
     "after_context": True,
     "question": [N("n1", "Yusra"), {"t": "coref", "id": "c1", "mention": "@n1", "antecedent": "@s1.n2", "certainty": "certain"},
                  N("n2", "Lamine"), {"t": "coref", "id": "c2", "mention": "@n2", "antecedent": "@s1.n1", "certainty": "certain"},
                  {"t": "wh", "id": "w1", "word": "how"},
                  {"t": "stative-relation", "id": "p1", "relation": "@w1", "subject": "@n1", "object": "@n2", "tense": "present"},
                  {"t": "question", "id": "a1"}],
     "statements": ['(: s1_n1_name (Name sk_lamine_1 "Lamine") (STV 1.0 0.99))',
                    "(: s1_m1_member (Member sk_his_1 male) (STV 1.0 0.99))",
                    "(: s1_c1_coref (Coref sk_his_1 sk_lamine_1) (STV 0.99 0.9))",
                    '(: s1_n2_name (Name sk_yusra_1 "Yusra") (STV 1.0 0.99))',
                    "(: s1_p1_member (Member sk_daughter_1 daughter) (STV 1.0 0.99))",
                    "(: s1_p1_bearer (Bearer sk_daughter_1 sk_yusra_1) (STV 1.0 0.99))",
                    "(: s1_p1_theme (Theme sk_daughter_1 sk_his_1) (STV 1.0 0.99))",
                    "(: s1_e1_member (Member sk_hug_1 hug) (STV 1.0 0.99))",
                    "(: s1_e1_agent (Agent sk_hug_1 sk_lamine_1) (STV 1.0 0.99))",
                    "(: s1_e1_patient (Patient sk_hug_1 sk_yusra_1) (STV 1.0 0.99))",
                    "(: s1_e1_past (Past sk_hug_1) (STV 1.0 0.99))"],
     "queries": ["(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_yusra_1) (Theme $wh_1 sk_lamine_1)) $tv)",
                 "(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_yusra_1) (Bearer $wh_1 sk_lamine_1)) $tv)"],
     "asked": ["$how"],
     "expect": [{"$how": "daughter"}, None]},
    {"name": "did Lamine sell the quilt — read on its own: the name binds by its Name atom",
     "context": [("Lamine sold the quilt.",
                  [N("n1", "Lamine"), {"t": "witness", "id": "x1", "class": "quilt", "definite": True},
                   {"t": "transfer", "id": "e1", "verb": "sell", "giver": "@n1", "object": "@x1", "tense": "past"}])],
     "after_context": False,
     "question": [N("n1", "Lamine"), {"t": "witness", "id": "x1", "class": "quilt", "definite": True},
                  {"t": "transfer", "id": "e1", "verb": "sell", "giver": "@n1", "object": "@x1", "tense": "past"},
                  {"t": "question", "id": "a1"}],
     "statements": ['(: s1_n1_name (Name sk_lamine_1 "Lamine") (STV 1.0 0.99))',
                    "(: s1_x1_member (Member sk_quilt_1 quilt) (STV 1.0 0.99))",
                    "(: s1_e1_member (Member sk_sell_1 sell) (STV 1.0 0.99))",
                    "(: s1_e1_agent (Agent sk_sell_1 sk_lamine_1) (STV 1.0 0.99))",
                    "(: s1_e1_theme (Theme sk_sell_1 sk_quilt_1) (STV 1.0 0.99))",
                    "(: s1_e1_past (Past sk_sell_1) (STV 1.0 0.99))"],
     "queries": ['(: $prf (And (Name $lamine_1 "Lamine") (Member $quilt_1 quilt) (Member $sell_1 sell) (Agent $sell_1 $lamine_1) '
                 "(Theme $sell_1 $quilt_1) (Past $sell_1)) $tv)"],
     "asked": [],
     "expect": [{"strength": 1.0}]},
    {"name": "did Teodor leave — the text denies it: the answer is no, not unknown",
     "context": [("Teodor did not leave.",
                  [N("n1", "Teodor"), {"t": "motion", "id": "e1", "verb": "leave", "mover": "@n1", "tense": "past"},
                   {"t": "negation", "id": "s1", "over": ["@e1"]}])],
     "after_context": False,
     "question": [N("n1", "Teodor"), {"t": "motion", "id": "e1", "verb": "leave", "mover": "@n1", "tense": "past"},
                  {"t": "question", "id": "a1"}],
     "statements": ['(: s1_n1_name (Name sk_teodor_1 "Teodor") (STV 1.0 0.99))',
                    "(: s1_s1_not (Not (And (Member sk_leave_1 leave) (Agent sk_leave_1 sk_teodor_1) (Past sk_leave_1))) (STV 1.0 0.99))"],
     "queries": ['(: $prf (And (Name $teodor_1 "Teodor") (Member $leave_1 leave) (Agent $leave_1 $teodor_1) (Past $leave_1)) $tv)'],
     "asked": [],
     "expect": [{"strength": 0.0}]},
    {"name": "who did not leave — the question's own negation, asked as written",
     "context": [("Teodor did not leave.",
                  [N("n1", "Teodor"), {"t": "motion", "id": "e1", "verb": "leave", "mover": "@n1", "tense": "past"},
                   {"t": "negation", "id": "s1", "over": ["@e1"]}])],
     "after_context": False,
     "question": [{"t": "wh", "id": "w1", "word": "who"}, {"t": "motion", "id": "e1", "verb": "leave", "mover": "@w1", "tense": "past"},
                  {"t": "negation", "id": "s1", "over": ["@e1"]}, {"t": "question", "id": "a1"}],
     "statements": ['(: s1_n1_name (Name sk_teodor_1 "Teodor") (STV 1.0 0.99))',
                    "(: s1_s1_not (Not (And (Member sk_leave_1 leave) (Agent sk_leave_1 sk_teodor_1) (Past sk_leave_1))) (STV 1.0 0.99))"],
     "queries": ["(: $prf (Not (And (Member $leave_1 leave) (Agent $leave_1 $who) (Past $leave_1))) $tv)"],
     "asked": ["$who"],
     "expect": [{"$who": ["Teodor"]}]},
    {"name": "did Teodor or Yusra feed the ferret — one query per option",
     "context": [("Teodor fed the ferret.",
                  [N("n1", "Teodor"), {"t": "witness", "id": "x1", "class": "ferret", "definite": True},
                   {"t": "activity", "id": "v1", "verb": "feed", "actor": "@n1", "patient": "@x1", "tense": "past"}])],
     "after_context": False,
     "question": [N("n1", "Teodor"), N("n2", "Yusra"), {"t": "witness", "id": "x1", "class": "ferret", "definite": True},
                  {"t": "activity", "id": "e1", "verb": "feed", "actor": "@n1", "patient": "@x1", "tense": "past"},
                  {"t": "activity", "id": "e2", "verb": "feed", "actor": "@n2", "patient": "@x1", "tense": "past"},
                  {"t": "question", "id": "a1", "options": ["@e1", "@e2"]}],
     "statements": ['(: s1_n1_name (Name sk_teodor_1 "Teodor") (STV 1.0 0.99))',
                    "(: s1_x1_member (Member sk_ferret_1 ferret) (STV 1.0 0.99))",
                    "(: s1_v1_member (Member sk_feed_1 feed) (STV 1.0 0.99))",
                    "(: s1_v1_agent (Agent sk_feed_1 sk_teodor_1) (STV 1.0 0.99))",
                    "(: s1_v1_patient (Patient sk_feed_1 sk_ferret_1) (STV 1.0 0.99))",
                    "(: s1_v1_past (Past sk_feed_1) (STV 1.0 0.99))"],
     "queries": ['(: $prf (And (Name $teodor_1 "Teodor") (Member $ferret_1 ferret) (Member $feed_1 feed) (Agent $feed_1 $teodor_1) '
                 "(Patient $feed_1 $ferret_1) (Past $feed_1)) $tv)",
                 '(: $prf (And (Name $yusra_1 "Yusra") (Member $ferret_1 ferret) (Member $feed_2 feed) (Agent $feed_2 $yusra_1) '
                 "(Patient $feed_2 $ferret_1) (Past $feed_2)) $tv)"],
     "asked": [],
     "expect": [{"strength": 1.0}, None]},
    {"name": "where did Yusra sleep — the place, answered by its class",
     "context": [("Yusra slept in the barn.",
                  [N("n1", "Yusra"), {"t": "witness", "id": "x1", "class": "barn", "definite": True},
                   {"t": "activity", "id": "e1", "verb": "sleep", "actor": "@n1", "tense": "past"},
                   {"t": "location", "id": "l1", "event": "@e1", "place": "@x1", "head": "Location", "preposition": "in"}])],
     "after_context": False,
     "question": [N("n1", "Yusra"), {"t": "activity", "id": "e1", "verb": "sleep", "actor": "@n1", "tense": "past"},
                  {"t": "wh", "id": "w1", "word": "where"},
                  {"t": "location", "id": "l1", "event": "@e1", "place": "@w1", "head": "Location", "preposition": "where"},
                  {"t": "question", "id": "a1"}],
     "statements": ['(: s1_n1_name (Name sk_yusra_1 "Yusra") (STV 1.0 0.99))',
                    "(: s1_x1_member (Member sk_barn_1 barn) (STV 1.0 0.99))",
                    "(: s1_e1_member (Member sk_sleep_1 sleep) (STV 1.0 0.99))",
                    "(: s1_e1_agent (Agent sk_sleep_1 sk_yusra_1) (STV 1.0 0.99))",
                    "(: s1_e1_past (Past sk_sleep_1) (STV 1.0 0.99))",
                    "(: s1_l1_location (Location sk_sleep_1 sk_barn_1) (STV 1.0 0.99))"],
     "queries": ['(: $prf (And (Name $yusra_1 "Yusra") (Member $sleep_1 sleep) (Agent $sleep_1 $yusra_1) (Past $sleep_1) '
                 "(Location $sleep_1 $where)) $tv)"],
     "asked": ["$where"],
     "expect": [{"$where": {"classes": ["barn"]}}]},
    {"name": "when did Lamine leave — the time, answered by what is said of it",
     "context": [("Lamine left on Monday.",
                  [N("n1", "Lamine"), {"t": "motion", "id": "e1", "verb": "leave", "mover": "@n1", "tense": "past"},
                   {"t": "time", "id": "t1", "event": "@e1", "weekday": "monday"}])],
     "after_context": False,
     "question": [N("n1", "Lamine"), {"t": "motion", "id": "e1", "verb": "leave", "mover": "@n1", "tense": "past"},
                  {"t": "wh", "id": "w1", "word": "when", "event": "@e1"}, {"t": "question", "id": "a1"}],
     "statements": ['(: s1_n1_name (Name sk_lamine_1 "Lamine") (STV 1.0 0.99))',
                    "(: s1_e1_member (Member sk_leave_1 leave) (STV 1.0 0.99))",
                    "(: s1_e1_agent (Agent sk_leave_1 sk_lamine_1) (STV 1.0 0.99))",
                    "(: s1_e1_past (Past sk_leave_1) (STV 1.0 0.99))",
                    "(: s1_t1_time (Time sk_leave_1 sk_time_1) (STV 1.0 0.99))",
                    "(: s1_t1_weekday (Weekday sk_time_1 monday) (STV 1.0 0.99))",
                    "(: s1_t1_member (Member sk_time_1 day) (STV 1.0 0.99))"],
     "queries": ['(: $prf (And (Name $lamine_1 "Lamine") (Member $leave_1 leave) (Agent $leave_1 $lamine_1) (Past $leave_1) '
                 "(Time $leave_1 $when)) $tv)"],
     "asked": ["$when"],
     "expect": [{"$when": {"attributes": ["(Weekday monday)"]}}]},
]


def C(i, m, a):
    return {"t": "coref", "id": i, "mention": m, "antecedent": a, "certainty": "certain"}


def RELATION_QUESTION(a, a_ref, b, b_ref):
    """How is <a> related to <b>? — read after the kinship text, both names linked to their first mention."""
    return [N("n1", a), C("c1", "@n1", a_ref), N("n2", b), C("c2", "@n2", b_ref), {"t": "wh", "id": "w1", "word": "how"},
            {"t": "stative-relation", "id": "p1", "relation": "@w1", "subject": "@n1", "object": "@n2", "tense": "present"},
            {"t": "question", "id": "a1"}]


# A kinship text: no relation the questions ask for is stated; each needs the kinship closure (rules.yaml kin_*),
# saturated once over the resolved view (tmpl.reason). Elliott's gender comes from "son", Annie's from "daughter",
# Stanley's only from the pronoun "his" (the mention's gender, merged into Stanley by the view).
KIN_SENTENCES = [
    ("Stanley hugged his daughter Valerie.",
     [N("n1", "Stanley"), {"t": "mention", "id": "m1", "word": "his"}, C("c1", "@m1", "@n1"), N("n2", "Valerie"),
      {"t": "stative-relation", "id": "p1", "relation": "daughter", "subject": "@n2", "object": "@m1", "tense": "present"},
      {"t": "activity", "id": "e1", "verb": "hug", "actor": "@n1", "patient": "@n2", "tense": "past"}]),
    ("Valerie fed her daughter Annie.",
     [N("n1", "Valerie"), C("c1", "@n1", "@s1.n2"), {"t": "mention", "id": "m1", "word": "her"}, C("c2", "@m1", "@s1.n2"),
      N("n2", "Annie"),
      {"t": "stative-relation", "id": "p1", "relation": "daughter", "subject": "@n2", "object": "@m1", "tense": "present"},
      {"t": "activity", "id": "e1", "verb": "feed", "actor": "@n1", "patient": "@n2", "tense": "past"}]),
    ("Stanley's son Elliott laughed.",
     [N("n1", "Stanley"), C("c1", "@n1", "@s1.n1"), N("n2", "Elliott"),
      {"t": "stative-relation", "id": "p1", "relation": "son", "subject": "@n2", "object": "@n1", "tense": "present"},
      {"t": "activity", "id": "e1", "verb": "laugh", "actor": "@n2", "tense": "past"}]),
]
KIN_STATEMENTS = [
    '(: s1_n1_name (Name sk_stanley_1 "Stanley") (STV 1.0 0.99))', "(: s1_m1_member (Member sk_his_1 male) (STV 1.0 0.99))",
    "(: s1_c1_coref (Coref sk_his_1 sk_stanley_1) (STV 0.99 0.9))", '(: s1_n2_name (Name sk_valerie_1 "Valerie") (STV 1.0 0.99))',
    "(: s1_p1_member (Member sk_daughter_1 daughter) (STV 1.0 0.99))", "(: s1_p1_bearer (Bearer sk_daughter_1 sk_valerie_1) (STV 1.0 0.99))",
    "(: s1_p1_theme (Theme sk_daughter_1 sk_his_1) (STV 1.0 0.99))", "(: s1_e1_member (Member sk_hug_1 hug) (STV 1.0 0.99))",
    "(: s1_e1_agent (Agent sk_hug_1 sk_stanley_1) (STV 1.0 0.99))", "(: s1_e1_patient (Patient sk_hug_1 sk_valerie_1) (STV 1.0 0.99))",
    "(: s1_e1_past (Past sk_hug_1) (STV 1.0 0.99))", '(: s2_n1_name (Name sk_valerie_2 "Valerie") (STV 1.0 0.99))',
    "(: s2_c1_coref (Coref sk_valerie_2 sk_valerie_1) (STV 0.99 0.9))", "(: s2_m1_member (Member sk_her_1 female) (STV 1.0 0.99))",
    "(: s2_c2_coref (Coref sk_her_1 sk_valerie_1) (STV 0.99 0.9))", '(: s2_n2_name (Name sk_annie_1 "Annie") (STV 1.0 0.99))',
    "(: s2_p1_member (Member sk_daughter_2 daughter) (STV 1.0 0.99))", "(: s2_p1_bearer (Bearer sk_daughter_2 sk_annie_1) (STV 1.0 0.99))",
    "(: s2_p1_theme (Theme sk_daughter_2 sk_her_1) (STV 1.0 0.99))", "(: s2_e1_member (Member sk_feed_1 feed) (STV 1.0 0.99))",
    "(: s2_e1_agent (Agent sk_feed_1 sk_valerie_2) (STV 1.0 0.99))", "(: s2_e1_patient (Patient sk_feed_1 sk_annie_1) (STV 1.0 0.99))",
    "(: s2_e1_past (Past sk_feed_1) (STV 1.0 0.99))", '(: s3_n1_name (Name sk_stanley_2 "Stanley") (STV 1.0 0.99))',
    "(: s3_c1_coref (Coref sk_stanley_2 sk_stanley_1) (STV 0.99 0.9))", '(: s3_n2_name (Name sk_elliott_1 "Elliott") (STV 1.0 0.99))',
    "(: s3_p1_member (Member sk_son_1 son) (STV 1.0 0.99))", "(: s3_p1_bearer (Bearer sk_son_1 sk_elliott_1) (STV 1.0 0.99))",
    "(: s3_p1_theme (Theme sk_son_1 sk_stanley_2) (STV 1.0 0.99))", "(: s3_e1_member (Member sk_laugh_1 laugh) (STV 1.0 0.99))",
    "(: s3_e1_agent (Agent sk_laugh_1 sk_elliott_1) (STV 1.0 0.99))", "(: s3_e1_past (Past sk_laugh_1) (STV 1.0 0.99))",
]
KIN_QUESTIONS = [
    {"name": "How is Elliott related to Annie? — her mother's brother", "question": RELATION_QUESTION("Elliott", "@s3.n2", "Annie", "@s2.n2"),
     "queries": ["(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_elliott_1) (Theme $wh_1 sk_annie_1)) $tv)",
                 "(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_elliott_1) (Bearer $wh_1 sk_annie_1)) $tv)"],
     "expect": {"aunt_or_uncle", "uncle"}},
    {"name": "How is Annie related to Elliott? — the converse", "question": RELATION_QUESTION("Annie", "@s2.n2", "Elliott", "@s3.n2"),
     "queries": ["(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_annie_1) (Theme $wh_1 sk_elliott_1)) $tv)",
                 "(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_annie_1) (Bearer $wh_1 sk_elliott_1)) $tv)"],
     "expect": {"niece_or_nephew", "niece"}},
    {"name": "How is Stanley related to Annie? — his gender from the pronoun his", "question": RELATION_QUESTION("Stanley", "@s1.n1", "Annie", "@s2.n2"),
     "queries": ["(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_stanley_1) (Theme $wh_1 sk_annie_1)) $tv)",
                 "(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_stanley_1) (Bearer $wh_1 sk_annie_1)) $tv)"],
     "expect": {"grandparent", "grandfather"}},
]


# A naming clause (the identity template): "His name is Craig." names the son of the first sentence, so the closure
# relates Craig to Mark (Marian's two sons) and to Mark's sister; Darnell's relation to Craig needs the default that
# siblings share their parents (a half-sister would break it), hence its lower strength.
NAMING_SENTENCES = [
    ("Marian cooked for her son.",
     [N("n1", "Marian"), {"t": "mention", "id": "m1", "word": "her"}, C("c1", "@m1", "@n1"), {"t": "witness", "id": "x1", "class": "son"},
      {"t": "stative-relation", "id": "p1", "relation": "son", "subject": "@x1", "object": "@m1", "tense": "present"},
      {"t": "activity", "id": "e1", "verb": "cook", "actor": "@n1", "tense": "past"}]),
    ("His name is Craig.",
     [{"t": "mention", "id": "m1", "word": "his"}, C("c1", "@m1", "@s1.x1"), N("n1", "Craig"),
      {"t": "identity", "id": "i1", "subject": "@m1", "object": "@n1"}]),
    ("Marian hugged her son Mark.",
     [N("n1", "Marian"), C("c1", "@n1", "@s1.n1"), {"t": "mention", "id": "m1", "word": "her"}, C("c2", "@m1", "@s1.n1"), N("n2", "Mark"),
      {"t": "stative-relation", "id": "p1", "relation": "son", "subject": "@n2", "object": "@m1", "tense": "present"},
      {"t": "activity", "id": "e1", "verb": "hug", "actor": "@n1", "patient": "@n2", "tense": "past"}]),
    ("Mark hugged his sister Darnell.",
     [N("n1", "Mark"), C("c1", "@n1", "@s3.n2"), {"t": "mention", "id": "m1", "word": "his"}, C("c2", "@m1", "@s3.n2"), N("n2", "Darnell"),
      {"t": "stative-relation", "id": "p1", "relation": "sister", "subject": "@n2", "object": "@m1", "tense": "present"},
      {"t": "activity", "id": "e1", "verb": "hug", "actor": "@n1", "patient": "@n2", "tense": "past"}]),
]
NAMING_STATEMENTS = [
    '(: s1_n1_name (Name sk_marian_1 "Marian") (STV 1.0 0.99))', "(: s1_m1_member (Member sk_her_1 female) (STV 1.0 0.99))",
    "(: s1_c1_coref (Coref sk_her_1 sk_marian_1) (STV 0.99 0.9))", "(: s1_x1_member (Member sk_son_1 son) (STV 1.0 0.99))",
    "(: s1_p1_member (Member sk_son_2 son) (STV 1.0 0.99))", "(: s1_p1_bearer (Bearer sk_son_2 sk_son_1) (STV 1.0 0.99))",
    "(: s1_p1_theme (Theme sk_son_2 sk_her_1) (STV 1.0 0.99))", "(: s1_e1_member (Member sk_cook_1 cook) (STV 1.0 0.99))",
    "(: s1_e1_agent (Agent sk_cook_1 sk_marian_1) (STV 1.0 0.99))", "(: s1_e1_past (Past sk_cook_1) (STV 1.0 0.99))",
    "(: s2_m1_member (Member sk_his_1 male) (STV 1.0 0.99))", "(: s2_c1_coref (Coref sk_his_1 sk_son_1) (STV 0.99 0.9))",
    '(: s2_n1_name (Name sk_craig_1 "Craig") (STV 1.0 0.99))', "(: s2_i1_same (Same sk_his_1 sk_craig_1) (STV 1.0 0.99))",
    '(: s3_n1_name (Name sk_marian_2 "Marian") (STV 1.0 0.99))', "(: s3_c1_coref (Coref sk_marian_2 sk_marian_1) (STV 0.99 0.9))",
    "(: s3_m1_member (Member sk_her_2 female) (STV 1.0 0.99))", "(: s3_c2_coref (Coref sk_her_2 sk_marian_1) (STV 0.99 0.9))",
    '(: s3_n2_name (Name sk_mark_1 "Mark") (STV 1.0 0.99))', "(: s3_p1_member (Member sk_son_3 son) (STV 1.0 0.99))",
    "(: s3_p1_bearer (Bearer sk_son_3 sk_mark_1) (STV 1.0 0.99))", "(: s3_p1_theme (Theme sk_son_3 sk_her_2) (STV 1.0 0.99))",
    "(: s3_e1_member (Member sk_hug_1 hug) (STV 1.0 0.99))", "(: s3_e1_agent (Agent sk_hug_1 sk_marian_2) (STV 1.0 0.99))",
    "(: s3_e1_patient (Patient sk_hug_1 sk_mark_1) (STV 1.0 0.99))", "(: s3_e1_past (Past sk_hug_1) (STV 1.0 0.99))",
    '(: s4_n1_name (Name sk_mark_2 "Mark") (STV 1.0 0.99))', "(: s4_c1_coref (Coref sk_mark_2 sk_mark_1) (STV 0.99 0.9))",
    "(: s4_m1_member (Member sk_his_2 male) (STV 1.0 0.99))", "(: s4_c2_coref (Coref sk_his_2 sk_mark_1) (STV 0.99 0.9))",
    '(: s4_n2_name (Name sk_darnell_1 "Darnell") (STV 1.0 0.99))', "(: s4_p1_member (Member sk_sister_1 sister) (STV 1.0 0.99))",
    "(: s4_p1_bearer (Bearer sk_sister_1 sk_darnell_1) (STV 1.0 0.99))", "(: s4_p1_theme (Theme sk_sister_1 sk_his_2) (STV 1.0 0.99))",
    "(: s4_e1_member (Member sk_hug_2 hug) (STV 1.0 0.99))", "(: s4_e1_agent (Agent sk_hug_2 sk_mark_2) (STV 1.0 0.99))",
    "(: s4_e1_patient (Patient sk_hug_2 sk_darnell_1) (STV 1.0 0.99))", "(: s4_e1_past (Past sk_hug_2) (STV 1.0 0.99))",
]
NAMING_QUESTIONS = [
    {"name": "How is Darnell related to Craig? — Craig named by a naming clause", "question": RELATION_QUESTION("Darnell", "@s4.n2", "Craig", "@s2.n1"),
     "queries": ["(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_darnell_1) (Theme $wh_1 sk_craig_1)) $tv)",
                 "(: $prf (And (Member $wh_1 $how) (Bearer $wh_1 sk_darnell_1) (Bearer $wh_1 sk_craig_1)) $tv)"],
     "expect": {"sibling", "sister"}},
]
KIN_STORIES = [(KIN_SENTENCES, KIN_STATEMENTS, KIN_QUESTIONS), (NAMING_SENTENCES, NAMING_STATEMENTS, NAMING_QUESTIONS)]


def pattern_of(query: str):
    """The pattern of ``(: $prf <pattern> $tv)``."""
    return A.parse(query)[2]


class QuestionsOnTheEngine(unittest.TestCase):
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

    def test_every_case_answers_as_the_text_says(self):
        for case in CASES:
            with self.subTest(case["name"]):
                out = A.run_job({"statements": case["statements"], "rules": [RULES], "queries": case["queries"], "steps": 2000})
                self.assertEqual(out["refused"], [])
                for query, expect, results in zip(case["queries"], case["expect"], out["results"]):
                    got = A.answers(results, pattern_of(query), case["asked"], case["statements"])
                    if expect is None:                       # the text does not say it: no proof, not a denial
                        self.assertEqual(got["proofs"], 0, query)
                        continue
                    self.assertGreater(got["proofs"], 0, query)
                    self.assertEqual(got["unread"], 0, query)
                    if "strength" in expect:                 # yes / no: the truth value is the answer
                        self.assertAlmostEqual(got["best"][0], expect["strength"], places=2)
                        self.assertGreater(got["best"][1], 0.85)
                        continue
                    top = got["answers"][0]["bindings"]
                    for var, want in expect.items():
                        d = top[var]
                        if isinstance(want, str):            # a word: the class a relation question asks for
                            self.assertEqual(d.get("value"), want)
                        elif isinstance(want, list):         # a referent: its names, through the coreference links
                            self.assertEqual(d.get("names"), want)
                        else:
                            for k, v in want.items():
                                self.assertTrue(set(v) <= set(d.get(k) or []), (var, k, d))

    def test_kinship_questions_answer_through_the_saturated_closure(self):
        """The kinship closure, forward-chained once over the resolved view, answers relations the text never states —
        in the neutral word, and in the gendered word when the text states the gender — and nothing else."""
        sets = R.rule_sets_from_files(RULES, CLOSURE)
        self.assertTrue(sets["closure"])
        cases = [(statements, q) for _sentences, statements, questions in KIN_STORIES for q in questions]
        for statements, q in cases:
            with self.subTest(q["name"]):
                job = R.question_job(statements, q["queries"], sets)
                out = A.run_job(job)
                self.assertEqual(out["refused"], [])
                self.assertTrue(out["derived"])
                words = set()
                for query, lines in zip(job["queries"], out["results"]):
                    got = A.answers(lines, pattern_of(query), ["$how"], job["statements"] + out["derived"])
                    self.assertEqual(got["unread"], 0)
                    words |= {ans["bindings"]["$how"].get("value") for ans in got["answers"]}
                self.assertEqual(words, q["expect"])


if __name__ == "__main__":
    unittest.main()
