"""The sentence-by-sentence mode (tmpl.blocks): qualified ids, one symbol table per block, per-sentence records by
prefix difference, the revision-needed finding, and PREFIX INVARIANCE end to end with a stand-in parser — the records
and the contexts of the earlier sentences do not change when a later sentence is changed or appended.

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

from tmpl import blocks as B, catalog as CAT  # noqa: E402

CATALOG = CAT.load()

SOLD = [{"t": "named-entity", "id": "n1", "name": "Lamine"},
        {"t": "witness", "id": "x1", "class": "quilt"},
        {"t": "transfer", "id": "e1", "verb": "sell", "giver": "@n1", "object": "@x1", "tense": "past"}]
BLUE = [{"t": "mention", "id": "m1", "word": "it"},
        {"t": "coref", "id": "k1", "mention": "@m1", "antecedent": "@s1.x1", "certainty": "certain"},
        {"t": "copular", "id": "c1", "subject": "@m1", "predicate": "blue", "form": "adjective", "tense": "past"}]
OTHER = [{"t": "named-entity", "id": "n1", "name": "Yusra"},
         {"t": "witness", "id": "x1", "class": "quilt"},
         {"t": "transfer", "id": "e1", "verb": "sell", "giver": "@n1", "object": "@x1", "tense": "past"}]
LEFT = [{"t": "named-entity", "id": "n1", "name": "Teodor"},
        {"t": "motion", "id": "m1", "verb": "leave", "mover": "@n1", "tense": "past"}]


def read_jsonl(path):
    with open(path) as fh:
        return [json.loads(l) for l in fh if l.strip()]


def block(*parts):
    return [{"k": k, "text": text, "instances": B.qualify(insts, k)} for k, (text, insts) in enumerate(parts, start=1)]


class QualifiedIds(unittest.TestCase):
    def test_local_ids_are_qualified_and_earlier_references_kept(self):
        q = B.qualify(BLUE + [{"t": "time", "id": "t1", "event": "@c1", "deictic": "yesterday", "anchor": "@now",
                               "span": "@c1 stays text"}], 2)
        self.assertEqual([i["id"] for i in q], ["s2.m1", "s2.k1", "s2.c1", "s2.t1"])
        self.assertEqual(q[1]["mention"], "@s2.m1")
        self.assertEqual(q[1]["antecedent"], "@s1.x1")                  # already qualified: an earlier sentence's
        self.assertEqual(q[3]["anchor"], "@now")                        # reserved
        self.assertEqual(q[3]["span"], "@c1 stays text")                # a span is words, never a reference

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

    def test_a_sentence_that_scopes_over_an_earlier_claim_needs_a_revision(self):
        recs = B.block_records(block(("Lamine sold a quilt.", SOLD),
                                     ("That is not true.", [{"t": "negation", "id": "s1", "over": ["@s1.e1"]}])), CATALOG)
        self.assertIn("(: s1_e1_member (Member sk_sell_1 sell) (STV 1.0 0.99))", recs[0]["statements"])   # kept as said
        self.assertTrue(any(st.startswith("(: s2_s1_not (Not (And (Member sk_sell_1 sell)") for st in recs[1]["statements"]))
        self.assertEqual([f["kind"] for f in recs[1]["findings"]], ["revision-needed"])

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
