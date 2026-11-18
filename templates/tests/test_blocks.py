"""The sentence-by-sentence mode (tmpl.blocks): qualified ids, one symbol table per block, per-sentence records by
prefix difference, REVISIONS (a label names one statement; what a record supersedes; what stands is the text so far),
what was not read (unmapped spans, issues, the validator's lints per sentence), and PREFIX INVARIANCE end to end with
a stand-in parser — the records and the contexts of the earlier sentences do not change when a later sentence is
changed or appended.

    python -m unittest tests.test_blocks        (from templates/)
"""
from __future__ import annotations

import json
import os
import shutil
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import blocks as B, catalog as CAT, emit as E, lower as L  # noqa: E402

CATALOG = CAT.load()

SOLD = [{"t": "named-entity", "id": "n1", "name": "Lamine", "span": "Lamine"},
        {"t": "witness", "id": "x1", "class": "quilt", "span": "a quilt"},
        {"t": "transfer", "id": "e1", "verb": "sell", "giver": "@n1", "object": "@x1", "tense": "past",
         "span": "Lamine sold a quilt"}]
BLUE = [{"t": "mention", "id": "m1", "word": "it", "span": "It"},
        {"t": "coref", "id": "k1", "mention": "@m1", "antecedent": "@s1.x1", "certainty": "certain", "span": "It"},
        {"t": "copular", "id": "c1", "subject": "@m1", "predicate": "blue", "form": "adjective", "tense": "past",
         "span": "It was blue"}]
OTHER = [{"t": "named-entity", "id": "n1", "name": "Yusra", "span": "Yusra"},
         {"t": "witness", "id": "x1", "class": "quilt", "span": "a quilt"},
         {"t": "transfer", "id": "e1", "verb": "sell", "giver": "@n1", "object": "@x1", "tense": "past",
          "span": "Yusra sold a quilt"}]
LEFT = [{"t": "named-entity", "id": "n1", "name": "Teodor", "span": "Teodor"},
        {"t": "motion", "id": "m1", "verb": "leave", "mover": "@n1", "tense": "past", "span": "Teodor left"}]
NOT_TRUE = [{"t": "negation", "id": "s1", "over": ["@s1.e1"], "span": "That is not true"}]
# a command about an indefinite thing, and later sentences that refer to the thing
BRING = [{"t": "witness", "id": "x1", "class": "anvil", "span": "an anvil"},
         {"t": "motion", "id": "m1", "verb": "bring", "moved": "@x1", "tense": "present", "span": "Bring an anvil"},
         {"t": "imperative", "id": "s1", "over": ["@m1"], "span": "Bring an anvil"}]


def said_of_it(adjective, antecedent="@s1.x1"):
    return [{"t": "mention", "id": "m1", "word": "it", "span": "It"},
            {"t": "coref", "id": "k1", "mention": "@m1", "antecedent": antecedent, "certainty": "certain", "span": "It"},
            {"t": "copular", "id": "c1", "subject": "@m1", "predicate": adjective, "form": "adjective", "tense": "present",
             "span": f"It is {adjective}"}]


# a rule over a class, and a sentence that distributes over a group (the emitter then names the rule's variable anew)
DOZE = [{"t": "range", "id": "q1", "class": "otter", "span": "Otters"},
        {"t": "activity", "id": "v1", "verb": "doze", "actor": "@q1", "tense": "present", "span": "Otters doze"},
        {"t": "generic", "id": "r1", "ranges": ["@q1"], "over": ["@v1"], "span": "Otters doze"}]
CLAP = [{"t": "group", "id": "g1", "class": "juggler", "quantity": "several", "span": "Several jugglers"},
        {"t": "activity", "id": "v1", "verb": "clap", "actor": "@g1", "tense": "past", "span": "Several jugglers clapped"},
        {"t": "distribution", "id": "d1", "group": "@g1", "over": ["@v1"], "span": "Several jugglers clapped"}]


def read_jsonl(path):
    with open(path) as fh:
        return [json.loads(l) for l in fh if l.strip()]


def block(*parts):
    """``(text, instances)`` per sentence, or ``(text, instances, {"unmapped": …, "issues": …})``."""
    return [{"k": k, "text": part[0], "instances": B.qualify(part[1], k), **(part[2] if len(part) > 2 else {})}
            for k, part in enumerate(parts, start=1)]


class QualifiedIds(unittest.TestCase):
    def test_local_ids_are_qualified_and_earlier_references_kept(self):
        q = B.qualify(BLUE + [{"t": "time", "id": "t1", "event": "@c1", "deictic": "yesterday", "anchor": "@now",
                               "span": "@c1 stays text"}], 2)
        self.assertEqual([i["id"] for i in q], ["s2.m1", "s2.k1", "s2.c1", "s2.t1"])
        self.assertEqual(q[1]["mention"], "@s2.m1")
        self.assertEqual(q[1]["antecedent"], "@s1.x1")                  # already qualified: an earlier sentence's
        self.assertEqual(q[3]["anchor"], "@now")                        # reserved
        self.assertEqual(q[3]["span"], "@c1 stays text")                # a span is words, never a reference

    def test_a_name_that_starts_with_an_at_sign_is_a_name(self):
        """A slot that holds words as written holds no reference: the company @Stake keeps its name, and its sentence
        is no breach of prefix causality."""
        said = [{"t": "named-entity", "id": "n1", "name": "@Stake", "span": "@Stake"},
                {"t": "motion", "id": "m1", "verb": "leave", "mover": "@n1", "tense": "past", "span": "@Stake left"}]
        q = B.qualify(said, 2)
        self.assertEqual((q[0]["name"], q[1]["mover"]), ("@Stake", "@s2.n1"))
        self.assertEqual(B.prefix_problems(q, 2, set()), [])
        recs = B.block_records(block(("Teodor left.", LEFT), ("@Stake left.", said)), CATALOG)
        self.assertEqual([r["status"] for r in recs], ["ok", "ok"])
        self.assertIn('(: s2_n1_name (Name sk_stake_1 "@Stake") (STV 1.0 0.99))', recs[1]["statements"])

    def test_prefix_problems(self):
        later = B.qualify([{"t": "coref", "id": "k1", "mention": "@m1", "antecedent": "@s3.x1", "certainty": "certain"},
                           {"t": "mention", "id": "m1", "word": "it"}], 2)
        self.assertTrue(any("later sentence" in p for p in B.prefix_problems(later, 2, {"s1.x1"})))
        unknown = B.qualify([{"t": "coref", "id": "k1", "mention": "@m1", "antecedent": "@s1.x9", "certainty": "certain"},
                             {"t": "mention", "id": "m1", "word": "it"}], 2)
        self.assertTrue(any("does not hold" in p for p in B.prefix_problems(unknown, 2, {"s1.x1"})))
        foreign = [{"t": "witness", "id": "s1.x5", "class": "quilt"}]
        self.assertTrue(any("only its own instances" in p for p in B.prefix_problems(foreign, 2, {"s1.x1"})))
        self.assertEqual(B.prefix_problems(B.qualify(BLUE, 2), 2, {"s1.n1", "s1.x1", "s1.e1"}), [])


class BlockRecords(unittest.TestCase):
    def test_one_symbol_table_per_block_and_a_link_back(self):
        recs = B.block_records(block(("Lamine sold a quilt.", SOLD), ("It was blue.", BLUE),
                                     ("Yusra sold a quilt.", OTHER)), CATALOG)
        self.assertEqual([r["available_from"] for r in recs], [1, 2, 3])
        self.assertTrue(all(r["status"] == "ok" and not r["findings"] for r in recs))
        self.assertIn("(: s1_x1_member (Member sk_quilt_1 quilt) (STV 1.0 0.99))", recs[0]["statements"])
        self.assertIn("(: s2_k1_coref (Coref sk_it_1 sk_quilt_1) (STV 0.99 0.9))", recs[1]["statements"])   # the link back
        self.assertFalse(any("sk_lamine_1" in st and "Name" in st for st in recs[1]["statements"]))       # never repeated
        self.assertIn("(: s3_x1_member (Member sk_quilt_2 quilt) (STV 1.0 0.99))", recs[2]["statements"])  # a second quilt
        self.assertEqual(len(recs[2]["records"]), len(recs[2]["statements"]))
        self.assertIn("(: sk_quilt_2 Entity)", recs[2]["declarations"])
        self.assertNotIn("(: sk_quilt_1 Entity)", recs[2]["declarations"])                                # declared once, at s1

    def test_a_sentences_record_lowers_on_its_own_for_another_consumer(self):
        """A record carries what the lowering takes — the emitter's records, the types of the symbols its sentence adds
        and its skolem functions — so it can be written for another consumer sentence by sentence; for upstream master
        the sentence's class symbols come back as the predicates to declare before its statements are loaded."""
        one, two = B.block_records(block(("Lamine sold a quilt.", SOLD), ("It was blue.", BLUE)), CATALOG)
        self.assertEqual(one["types"]["quilt"], ["Class"])
        self.assertIn("sk_quilt_1", one["types"])
        self.assertNotIn("quilt", two["types"])                                 # typed by the first sentence, once
        self.assertEqual(two["types"]["blue"], ["Class"])
        self.assertEqual(one["functions"], [])
        self.assertEqual(sorted(sym for sym, kinds in two["types"].items() for k in kinds),
                         sorted(d[3:-1].split(" ")[0] for d in two["declarations"]))     # the same symbols as the declarations
        for rec in (one, two):
            low = L.lower({"records": rec["records"], "types": rec["types"], "functions": rec["functions"]}, "pettachainer-master")
            self.assertEqual(len(low["statements"]), len(rec["statements"]))
            ours = L.lower({"records": rec["records"], "types": rec["types"], "functions": rec["functions"]})
            self.assertEqual(ours["statements"], rec["statements"])            # our engine line: the record's own text
            self.assertEqual(ours["declarations"], rec["declarations"])
        self.assertEqual(L.lower({"records": one["records"], "types": one["types"], "functions": one["functions"]},
                                 "pettachainer-master")["predicates"], ["quilt", "sell"])
        self.assertEqual(L.lower({"records": two["records"], "types": two["types"], "functions": two["functions"]},
                                 "pettachainer-master")["predicates"], ["blue"])

    def test_a_sentence_that_scopes_over_an_earlier_claim_needs_a_revision(self):
        recs = B.block_records(block(("Lamine sold a quilt.", SOLD), ("That is not true.", NOT_TRUE)), CATALOG)
        self.assertIn("(: s1_e1_member (Member sk_sell_1 sell) (STV 1.0 0.99))", recs[0]["statements"])   # kept as said
        self.assertTrue(any(st.startswith("(: s2_s1_not (Not (And (Member sk_sell_1 sell)") for st in recs[1]["statements"]))
        self.assertEqual([f["kind"] for f in recs[1]["findings"]], ["revision-needed"])
        # the claim's statements stand no longer, nor does the quilt it introduced: each is named, and none has a
        # statement in its place (they are inside the negation now); the name, which a negation leaves alone, is not
        self.assertEqual(sorted(g["label"] for g in recs[1]["supersedes"]),
                         ["s1_e1_agent", "s1_e1_member", "s1_e1_past", "s1_e1_theme", "s1_x1_member"])
        self.assertTrue(all(g == {"label": g["label"], "k": 1, "by": None} for g in recs[1]["supersedes"]))
        self.assertEqual([L.statement(r) for r in B.standing(recs)],
                         ['(: s1_n1_name (Name sk_lamine_1 "Lamine") (STV 1.0 0.99))', recs[1]["statements"][0]])
        self.assertEqual([r["name"] for r in recs[1]["records"]], ["s2_s1_not"])

    def test_a_sentence_breaking_prefix_causality_is_malformed_and_left_out(self):
        bad = [{"t": "mention", "id": "m1", "word": "it"},
               {"t": "coref", "id": "k1", "mention": "@m1", "antecedent": "@s3.x1", "certainty": "certain"}]
        recs = B.block_records(block(("Lamine sold a quilt.", SOLD), ("It was blue.", bad), ("Teodor left.", LEFT)), CATALOG)
        self.assertEqual([r["status"] for r in recs], ["ok", "malformed", "ok"])
        self.assertFalse(any("sk_it_1" in st for st in recs[2]["statements"]))

    def test_the_context_grows_as_a_prefix(self):
        b = block(("Lamine sold a quilt.", SOLD), ("It was blue.", BLUE))
        c1, c2 = B.context_section(b[:1]), B.context_section(b[:2])
        self.assertEqual(B.context_section([]), "")
        self.assertTrue(c2.startswith(c1))
        self.assertIn('[s1] Lamine sold a quilt.', c1)
        self.assertIn('"id": "s1.x1"', c1)
        self.assertNotIn('"span"', c1)


def contents(records):
    return sorted(B._content(r) for r in records)


class Revisions(unittest.TestCase):
    """A label names ONE statement of its block; a record tells which earlier statements no longer stand as written;
    what stands after sentence k is what the emitter states for sentences 1..k as one text."""

    def test_a_statement_that_takes_an_earlier_ones_place_has_its_own_label(self):
        """The anvil of the command is stated inside the command while nothing else mentions it; once a later sentence
        refers to it, that it is an anvil is stated outside, and the command is restated without it."""
        recs = B.block_records(block(("Bring an anvil.", BRING), ("It is rusty.", said_of_it("rusty")),
                                     ("It is heavy.", said_of_it("heavy"))), CATALOG)
        self.assertEqual(recs[0]["statements"], [
            "(: s1_s1_directive (Directive (And (Member sk_bring_1 bring) (Theme sk_bring_1 sk_anvil_1) "
            "(Member sk_anvil_1 anvil))) (STV 1.0 0.99))"])
        self.assertEqual(recs[1]["statements"], [
            "(: s1_x1_member (Member sk_anvil_1 anvil) (STV 1.0 0.99))",
            "(: s1_s1_directive__r2 (Directive (And (Member sk_bring_1 bring) (Theme sk_bring_1 sk_anvil_1))) (STV 1.0 0.99))",
            "(: s2_k1_coref (Coref sk_it_1 sk_anvil_1) (STV 0.99 0.9))",
            "(: s2_c1_member (Member sk_it_1 rusty) (STV 1.0 0.99))"])
        self.assertEqual(recs[1]["supersedes"], [{"label": "s1_s1_directive", "k": 1, "by": "s1_s1_directive__r2"}])
        self.assertEqual([f["kind"] for f in recs[1]["findings"]], ["revision-needed"])
        self.assertEqual(recs[2]["statements"], ["(: s3_k1_coref (Coref sk_it_2 sk_anvil_1) (STV 0.99 0.9))",
                                                 "(: s3_c1_member (Member sk_it_2 heavy) (STV 1.0 0.99))"])
        self.assertEqual((recs[2]["supersedes"], recs[2]["findings"]), ([], []))    # a second reference changes nothing more
        for target in L.TARGETS:                                                    # every consumer gets the same labels
            low = L.lower({"records": recs[1]["records"], "types": recs[1]["types"], "functions": recs[1]["functions"]}, target)
            self.assertEqual([st.split()[1] for st in low["statements"]],
                             ["s1_x1_member", "s1_s1_directive__r2", "s2_k1_coref", "s2_c1_member"])

    def test_no_label_names_two_statements_and_what_stands_is_the_text_so_far(self):
        blocks = [block(("Bring an anvil.", BRING), ("It is rusty.", said_of_it("rusty")), ("It is heavy.", said_of_it("heavy"))),
                  block(("Lamine sold a quilt.", SOLD), ("It was blue.", BLUE), ("That is not true.", NOT_TRUE)),
                  block(("Bring an anvil.", BRING), ("Otters doze.", DOZE), ("It is rusty.", said_of_it("rusty")),
                        ("Several jugglers clapped.", CLAP), ("Teodor left.", LEFT)),
                  block(("Otters doze.", DOZE), ("Several jugglers clapped.", CLAP), ("Yusra sold a quilt.", OTHER))]
        for sentences in blocks:
            recs = B.block_records(sentences, CATALOG)
            self.assertTrue(all(r["status"] == "ok" for r in recs))
            named = {}
            for rec in recs:
                for st in rec["statements"]:
                    self.assertEqual(named.setdefault(st.split()[1], st), st)      # one label, one statement
            for k in range(1, len(sentences) + 1):
                as_one_text = E.emit({"id": "t", "instances": [i for s in sentences[:k] for i in s["instances"]]}, CATALOG)
                self.assertEqual(contents(B.standing(recs, k)), contents(as_one_text["records"]))

    def test_a_rule_whose_variables_a_later_sentence_renames_is_the_same_statement(self):
        """The emitter names a text's variables as a whole: with a distribution in the text the rule over the otters
        is written with $y. It states what it stated with $x, so the later sentence's record holds nothing of it."""
        sentences = block(("Otters doze.", DOZE), ("Several jugglers clapped.", CLAP))
        one, two = B.block_records(sentences, CATALOG)
        rule = "(: s1_r1_implication (Implication (Member $x otter) (And (Member (sk_doze $x) doze) (Agent (sk_doze $x) $x))) (STV 0.9 0.7))"
        self.assertEqual(one["statements"], [rule])
        as_one_text = E.emit({"id": "t", "instances": [i for s in sentences for i in s["instances"]]}, CATALOG)["statements"]
        self.assertIn(rule.replace("$x", "$y"), as_one_text)                        # the renaming this test is about
        self.assertFalse(any(st.split()[1].startswith("s1_") for st in two["statements"]))
        self.assertEqual((two["supersedes"], two["findings"]), ([], []))
        self.assertEqual(B._content({"term": ["Implication", ["Member", "$x", "otter"], ["Member", "$x", "tame"]], "truth": [1.0, 0.9]}),
                         B._content({"term": ["Implication", ["Member", "$y", "otter"], ["Member", "$y", "tame"]], "truth": [1.0, 0.9]}))
        self.assertNotEqual(B._content({"term": ["Member", "$x", "tame"], "truth": [1.0, 0.9]}),     # bound by no rule:
                            B._content({"term": ["Member", "$y", "tame"], "truth": [1.0, 0.9]}))     # the name is all it has


class WhatWasNotRead(unittest.TestCase):
    """A record carries its sentence's unmapped spans and issues as reported and, unless turned off, what the
    validator's lints say of the sentence alone."""

    def test_unmapped_spans_issues_and_the_lints_of_each_sentence(self):
        frankly = [dict(i, span=["it is", "rusty"] if i["t"] == "copular" else "it") for i in said_of_it("rusty")]
        reported = {"unmapped": [{"span": "Frankly", "code": "G02"}, {"span": "quite", "code": "G02"}],
                    "issues": [{"code": "P00", "note": "no slot for a degree word on an adjective"}]}
        one, two = B.block_records(block(("Bring an anvil.", BRING), ("Frankly, it is quite rusty.", frankly, reported)), CATALOG)
        self.assertEqual((one["unmapped"], one["issues"], one["findings"]), ([], [], []))
        self.assertEqual(two["unmapped"], reported["unmapped"])
        self.assertEqual(two["issues"], reported["issues"])
        self.assertEqual([f["kind"] for f in two["findings"]], ["revision-needed"])     # every word parsed or reported
        dropped = dict(reported, unmapped=reported["unmapped"][:1])                     # "quite" neither parsed nor reported
        two = B.block_records(block(("Bring an anvil.", BRING), ("Frankly, it is quite rusty.", frankly, dropped)), CATALOG)[1]
        lint = [f for f in two["findings"] if f["kind"] == "content-unaccounted"]
        self.assertEqual(len(lint), 1)
        self.assertIn("'quite'", lint[0]["detail"])
        two = B.block_records(block(("Bring an anvil.", BRING), ("Frankly, it is quite rusty.", frankly, dropped)), CATALOG,
                              lint=False)[1]
        self.assertEqual([f["kind"] for f in two["findings"]], ["revision-needed"])     # no lint asked for
        self.assertEqual(two["unmapped"], dropped["unmapped"])                          # what was reported is always there

    def test_the_lints_are_each_sentences_own(self):
        """A witness that nothing in its own sentence mentions is that sentence's finding, once; a reference to an
        earlier sentence's instance is no fault; a span is checked against its own sentence's text."""
        stray = BRING + [{"t": "witness", "id": "x2", "class": "sieve", "span": "a sieve"}]
        wrong_span = [dict(i, span="It was dusty") if i["t"] == "copular" else i for i in said_of_it("rusty")]
        recs = B.block_records(block(("Bring an anvil and a sieve.", stray), ("It is rusty.", said_of_it("rusty")),
                                     ("It is rusty.", wrong_span)), CATALOG)
        self.assertEqual([(f["kind"], f["instance"]) for f in recs[0]["findings"]], [("dangling-referent", "s1.x2")])
        self.assertEqual([f["kind"] for f in recs[1]["findings"]], ["revision-needed"])
        self.assertEqual([(f["kind"], f["instance"]) for f in recs[2]["findings"]], [("span-not-verbatim", "s3.c1")])

    def test_walk_keeps_what_the_parser_reported(self):
        row = {"id": "doc-a-000", "dataset": "toy", "doc": "a", "sent": 0, "text": "Bring an anvil."}
        reply = {"item": {"id": row["id"], "text": row["text"]},
                 "response": {"instances": BRING, "unmapped": [{"span": "Bring", "code": "G00"}],
                              "issues": [{"code": "P01", "note": "n"}]}}
        prior, nxt = B.walk([row], {row["id"]: reply})
        self.assertIsNone(nxt)
        self.assertEqual((prior[0]["unmapped"], prior[0]["issues"]),
                         ([{"span": "Bring", "code": "G00"}], [{"code": "P01", "note": "n"}]))
        rec = B.block_records(prior, CATALOG)[0]
        self.assertEqual((rec["unmapped"], rec["issues"]), (prior[0]["unmapped"], prior[0]["issues"]))


class SuiteCasesWithContext(unittest.TestCase):
    """A catalog case may carry a context (the earlier sentences with their instances): its key covers the context,
    its request carries the context without spans, and a reply is scored as the sentence's share of the block."""

    def case(self, text):
        from tmpl import suite as S
        return next(c for c in S.cases_of(CATALOG, "coref", ("held_out",)) if c.get("context") and c["text"] == text)

    def test_key_request_and_expected_statements(self):
        from tmpl import suite as S
        c = self.case("He smiled.")
        self.assertNotEqual(c["key"], S.key_of("He smiled."))                     # the context is part of the case
        ctx = S.case_context(c)
        self.assertTrue(ctx.startswith("CONTEXT"))
        self.assertIn("[s1] Lamine sold a quilt.", ctx)
        self.assertNotIn('"span"', ctx)                                            # full records without spans
        st = S.case_statements(c, c["instances"], CATALOG)
        self.assertIn("(: s2_c1_coref (Coref sk_he_1 sk_lamine_1) (STV 0.99 0.9))", st)
        self.assertFalse(any("Lamine" in x for x in st))                          # the context is not restated

    def test_a_reply_in_context_is_scored_as_the_sentences_share(self):
        from tmpl import suite as S, typecheck as T
        c = self.case("The ferret escaped.")
        spans = {"x1": "The ferret", "c1": "The ferret", "m1": "The ferret escaped"}
        good = [dict(i, span=spans[i["id"]]) for i in c["instances"]]
        heads = T.load_substrate()["heads"]
        row = S.score_record(c, {"run": 1, "response": {"instances": good, "unmapped": []}}, CATALOG, heads, None)
        self.assertTrue(row["pass"], row["reasons"])
        self.assertEqual(row["fired"], {"witness": 1, "coref": 1, "motion": 1})   # the sentence's own templates
        later = [dict(i, antecedent="@s4.x1") if i["t"] == "coref" else i for i in good]
        row = S.score_record(c, {"run": 1, "response": {"instances": later, "unmapped": []}}, CATALOG, heads, None)
        self.assertEqual(row["status"], "malformed")                               # prefix causality broken
        stated = [i for i in good if i["t"] != "coref"] + [
            {"t": "witness", "id": "x9", "class": "ferret", "span": "The ferret"}]   # a second ferret, no link back
        row = S.score_record(c, {"run": 1, "response": {"instances": stated, "unmapped": []}}, CATALOG, heads, None)
        self.assertFalse(row["pass"])


FAKE = r'''
import json, os, threading
class ProviderError(Exception):
    pass
class FatalProviderError(ProviderError):
    pass
class _P:
    default_model = "fake-1"
PROVIDERS = {"google": _P}
with open(os.environ["BLOCKS_FAKE_REPLIES"]) as _fh:
    REPLIES = json.load(_fh)
LOG = os.environ["BLOCKS_FAKE_LOG"]
lock = threading.Lock()
def parse_sentence(text, args, item_id="item", context=None):
    import hashlib
    with lock:
        with open(LOG, "a") as fh:
            fh.write(json.dumps({"id": item_id, "text": text, "context": context}) + "\n")
    if text not in REPLIES:
        raise ProviderError("no canned reply")
    item = {"id": item_id, "text": text}
    if context:
        item["context_sha256"] = hashlib.sha256(context.encode("utf-8")).hexdigest()
    return {"provider": "google", "model": "fake-1", "item": item,
            "response": {"id": item_id, "instances": REPLIES[text], "unmapped": []}, "usage": {"input": 10, "cached": 8}}
'''


class PrefixInvariance(unittest.TestCase):
    def setUp(self):
        self.dir = tempfile.mkdtemp()
        self.script = os.path.join(self.dir, "fake_parse.py")
        with open(self.script, "w") as fh:
            fh.write(FAKE)
        replies = {"Lamine sold a quilt.": SOLD, "It was blue.": BLUE, "Yusra sold a quilt.": OTHER, "Teodor left.": LEFT}
        with open(os.path.join(self.dir, "replies.json"), "w") as fh:
            json.dump(replies, fh)
        os.environ["BLOCKS_FAKE_REPLIES"] = os.path.join(self.dir, "replies.json")

    def tearDown(self):
        shutil.rmtree(self.dir, ignore_errors=True)
        os.environ.pop("BLOCKS_FAKE_REPLIES", None)
        os.environ.pop("BLOCKS_FAKE_LOG", None)

    def run_block(self, name, texts):
        sample = os.path.join(self.dir, f"{name}.jsonl")
        with open(sample, "w") as fh:
            for i, t in enumerate(texts):
                fh.write(json.dumps({"id": f"doc-a-{i:03d}", "dataset": "toy", "doc": "a", "sent": i, "text": t}) + "\n")
        out = os.path.join(self.dir, f"{name}.parsed.jsonl")
        os.environ["BLOCKS_FAKE_LOG"] = os.path.join(self.dir, f"{name}.log")
        argv = ["parse", "--sample", sample, "--out", out, "--parse-script", self.script, "--provider", "google", "--no-prime"]
        self.assertEqual(B.main(argv), 0)
        rows = read_jsonl(sample)
        prior, nxt = B.walk(B.blocks_of(rows)[0], B.read_replies(out))
        log = read_jsonl(os.environ["BLOCKS_FAKE_LOG"])
        return B.block_records(prior, CATALOG), log, nxt, argv

    def test_earlier_records_and_contexts_do_not_depend_on_later_sentences(self):
        base, log_base, nxt, argv = self.run_block("base", ["Lamine sold a quilt.", "It was blue.", "Yusra sold a quilt."])
        self.assertIsNone(nxt)
        changed, log_changed, _, _ = self.run_block("changed", ["Lamine sold a quilt.", "It was blue.", "Teodor left."])
        longer, log_longer, _, _ = self.run_block("longer", ["Lamine sold a quilt.", "It was blue.", "Yusra sold a quilt.",
                                                             "Teodor left."])
        for other in (changed, longer):
            for i in (0, 1):
                self.assertEqual(base[i]["statements"], other[i]["statements"])
                self.assertEqual(base[i]["declarations"], other[i]["declarations"])
        for other in (log_changed, log_longer):
            self.assertEqual([e["context"] for e in log_base[:2]], [e["context"] for e in other[:2]])
        self.assertIsNone(log_base[0]["context"])                                   # the first sentence has none
        self.assertIn("[s1] Lamine sold a quilt.", log_base[2]["context"])
        self.assertIn("[s2] It was blue.", log_base[2]["context"])
        self.assertNotIn("Yusra", log_base[2]["context"])                           # never its own or a later text
        self.assertEqual(longer[3]["statements"][0].split()[1], "s4_n1_name")
        os.environ["BLOCKS_FAKE_LOG"] = os.path.join(self.dir, "base.log")
        self.assertEqual(B.main(argv), 0)                                           # resumable: nothing left to parse
        self.assertEqual(len(read_jsonl(os.environ["BLOCKS_FAKE_LOG"])), 3)

    def test_a_failed_sentence_stops_its_block_until_the_next_run(self):
        _, log, nxt, argv = self.run_block("gap", ["Lamine sold a quilt.", "Nobody knows this one.", "It was blue."])
        self.assertEqual(nxt["text"], "Nobody knows this one.")                     # the block waits at the failure
        self.assertEqual([e["text"] for e in log], ["Lamine sold a quilt.", "Nobody knows this one."])


if __name__ == "__main__":
    unittest.main()
