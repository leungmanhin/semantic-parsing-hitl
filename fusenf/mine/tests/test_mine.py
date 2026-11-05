"""The mining infrastructure: a parsed sentence becomes a graph of atoms with scopes and provenance; lifting
names typed variables and applies the key dials; presence counts families; the candidate record aggregates
evidence. Run from the repo root: ``python -m unittest discover -s fusenf/mine/tests``."""
from __future__ import annotations

import os
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir, os.pardir))
sys.path.insert(0, REPO)

from fusenf.mine import atoms as A, lift as L, tables as TB, candidates as CD  # noqa: E402
from tmpl import catalog as CAT  # noqa: E402

CATALOG = CAT.load()


def example(tid: str, text: str) -> dict:
    for sec in ("shown", "held_out"):
        for ex in CATALOG[tid]["examples"][sec]:
            if ex["text"] == text:
                return ex
    raise KeyError(text)


def record(tid: str, text: str, family: str = "f", role: str = "mine", rid: str | None = None) -> dict:
    ex = example(tid, text)
    return {"id": rid or f"ex-{tid}-{abs(hash(text)) % 10000}", "text": text, "dataset": "suite", "family": family, "role": role,
            "reply": {"manifest_id": "test", "response": {"id": "x", "instances": [dict(i) for i in ex["instances"]], "unmapped": []}}}


class GraphTests(unittest.TestCase):
    def test_a_reported_clause_carries_its_scope(self):
        g = A.graph_of(record("attitude", "The audit was in the hall on Sunday, Yusra said."), CATALOG)
        heads = {(a["head"], tuple(tuple(s) for s in a["scope"])) for a in g["atoms"]}
        self.assertIn(("Location", (("Theme", "sk_say_1"),)), heads)          # sealed under the saying
        self.assertIn(("Member", ()), heads)                                   # the audit's class, presupposed, outside
        theme = next(a for a in g["atoms"] if a["head"] == "Theme")
        self.assertEqual(theme["kind"], "scope")
        self.assertEqual(theme["args"][1], "§1")                               # the content replaced by a placeholder
        self.assertEqual(theme["inst"], "a1")
        self.assertEqual(theme["template"], "attitude")

    def test_a_rule_marks_premise_and_consequent(self):
        g = A.graph_of(record("frequency", "Teodor was often in the forge."), CATALOG)
        scopes = {a["head"]: a["scope"] for a in g["atoms"] if a["head"] in ("Member", "Holds", "Time")}
        self.assertEqual(scopes["Holds"], [["Implication:consequent", "f1_implication"]])
        premise = [a for a in g["atoms"] if a["scope"] == [["Implication:premise", "f1_implication"]]]
        self.assertEqual([a["head"] for a in premise], ["Member"])             # (Member $x occasion)
        rule = next(a for a in g["atoms"] if a["head"] == "Implication")
        self.assertAlmostEqual(rule["s"], 0.7)                                 # often

    def test_a_tense_wrapper_lands_on_the_inner_atom(self):
        g = A.graph_of(record("frequency", "Teodor was often in the forge."), CATALOG)
        located = [a for a in g["atoms"] if a["head"] == "LocatedIn" and a["scope"] == [["Implication:consequent", "f1_implication"]]]
        self.assertTrue(any(a["tense"] == "Past" for a in located), located)

    def test_a_failed_or_malformed_reply_gives_no_graph(self):
        self.assertIsNone(A.graph_of({"id": "x", "text": "t", "reply": {"error": "boom", "response": None}}, CATALOG))
        self.assertIsNone(A.graph_of({"id": "x", "text": "t", "reply": {"response": {"id": "x", "instances": [
            {"t": "activity", "id": "v1", "verb": "sing", "actor": "@zz", "tense": "past"}], "unmapped": []}}}, CATALOG))


class LiftTests(unittest.TestCase):
    def test_variables_are_typed_and_named_by_first_occurrence(self):
        g = A.graph_of(record("attitude", "The audit was in the hall on Sunday, Yusra said."), CATALOG)
        lg = L.lift(g)
        self.assertEqual(lg["varmap"]["sk_audit_1"], "$e1")                   # eventive: an Event variable
        self.assertEqual(lg["varmap"]["sk_hall_1"], "$x1")
        self.assertIn("Theme:$e2|Location($e1,$x1)|asserted", lg["atoms"])
        self.assertIn("|Member($e1,audit)|asserted", lg["atoms"])
        self.assertNotIn("Name", " ".join(lg["atoms"]))                         # a surface record: evidence only
        self.assertEqual(lg["evidence"]["names"], {"sk_yusra_1": "Yusra"})

    def test_the_polarity_dial(self):
        self.assertEqual(L.band(0.0, "three"), "denied")
        self.assertEqual(L.band(0.7, "three"), "graded")
        self.assertEqual(L.band(1.0, "three"), "asserted")
        self.assertEqual(L.band(0.7, "two"), "asserted")
        self.assertIsNone(L.band(0.0, "none"))
        self.assertEqual(L.band(0.5, [0.25, 0.75]), "band1")
        g = A.graph_of(record("frequency", "Teodor was often in the forge."), CATALOG)
        three = L.lift(g)["atoms"]
        none = L.lift(g, L.key_of(polarity="none"))["atoms"]
        self.assertTrue(any(k.endswith("|graded") for k in three))
        self.assertFalse(any("|graded" in k or "|asserted" in k for k in none))

    def test_tense_is_evidence_unless_dialled_into_the_key(self):
        g = A.graph_of(record("frequency", "Teodor was often in the forge."), CATALOG)
        ev = L.lift(g)["evidence"]["tenses"]
        self.assertTrue(any("Past" in ts for ts in ev.values()), ev)
        keyed = L.lift(g, L.key_of(tense="key"))["atoms"]
        self.assertTrue(any(k.endswith("|Past") for k in keyed), keyed)

    def test_canonical_unit_names_variables_by_appearance(self):
        self.assertEqual(L.canonical("Theme:$e2|Location($e1,$x1)|asserted"), "Theme:$e1|Location($e2,$x1)|asserted")
        self.assertEqual(L.canonical("|Patient($e3,$e3)|asserted"), "|Patient($e1,$e1)|asserted")

    def test_the_shape_view_variablizes_classes(self):
        g = A.graph_of(record("attitude", "The audit was in the hall on Sunday, Yusra said."), CATALOG)
        shape = L.lift(g, L.key_of(shape="shape"))["atoms"]
        self.assertIn("|Member($e1,$c1)|asserted", shape)
        self.assertFalse(any("audit" in k for k in shape))


class TableAndCandidateTests(unittest.TestCase):
    def test_presence_counts_a_family_once(self):
        a = L.lift(A.graph_of(record("attitude", "The audit was in the hall on Sunday, Yusra said.", family="F1", rid="s1"), CATALOG))
        b = L.lift(A.graph_of(record("attitude", "A fire was at the mill on Monday, Teodor said.", family="F1", rid="s2"), CATALOG))
        c = L.lift(A.graph_of(record("frequency", "Teodor was often in the forge.", family="F2", role="evaluate", rid="s3"), CATALOG))
        table = TB.presence([a, b, c])
        say = table["|Member($e1,say)|asserted"]                              # canonical within the unit
        self.assertEqual(TB.support(say)["families"], 1)                       # two sentences, one family
        self.assertEqual(TB.support(say)["sentences"], 2)
        self.assertEqual(TB.support(say)["roles"], {"mine": 1})
        with tempfile.TemporaryDirectory() as d:
            rows = TB.write_table(table, os.path.join(d, "p.jsonl"), min_families=1)
            self.assertTrue(rows and rows[0]["families"] >= rows[-1]["families"])
        cand = CD.new("subtree", 1, ["|Member($e1,say)|asserted"], "lexicalized", L.DEFAULT_KEY, run="t")
        for g in (a, b):
            CD.add_match(cand, g)
        CD.finish(cand, {g["id"]: g for g in (a, b, c)}, {"s1": "m1", "s2": "m2"})
        self.assertEqual(cand["support"], {"families": 1, "sentences": 2, "datasets": {"suite": 1}, "roles": {"mine": 1}})
        self.assertIn("Past", cand["evidence"]["tenses"])
        self.assertEqual(cand["provenance"]["manifests"], ["m1", "m2"])
        with tempfile.TemporaryDirectory() as d:
            CD.write([cand], os.path.join(d, "c.jsonl"))
            self.assertEqual(CD.read(os.path.join(d, "c.jsonl"))[0]["id"], "subtree-000001")


if __name__ == "__main__":
    unittest.main(verbosity=1)
