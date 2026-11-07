"""§5.1: the connected-pattern miner, the generalizer and its two tests, on a toy corpus built by hand — "a man
holds a key; the key opens a box", the doc's helper join. Run from the repo root:
``python -m unittest discover -s fusenf/mine/tests``."""
from __future__ import annotations

import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir, os.pardir))
sys.path.insert(0, REPO)

from fusenf.mine import freq_pattern as S, generalize as G, lift as L, patterns as P  # noqa: E402

JOIN = "|Agent($e1,$x1)|asserted & |Patient($e2,$x1)|asserted"          # one thing: the agent of one event, the patient of another


def graph(gid: str, family: str, atoms: list, role: str = "mine") -> dict:
    """A graph of atoms as ``fusenf.mine.atoms`` builds them: ``(head, args[, inst])`` per atom."""
    out, types = [], {}
    for i, spec in enumerate(atoms):
        head, args = spec[0], list(spec[1])
        out.append({"i": i, "head": head, "args": args, "scope": [], "tense": None, "name": f"s{i}", "inst": spec[2] if len(spec) > 2 else f"v{i}",
                    "template": "toy", "s": 1.0, "c": 0.99, "kind": "content"})
        for a in args:
            if isinstance(a, str) and a.startswith("sk_"):
                types.setdefault(a, ["Event"] if head in ("Agent", "Patient") and a == args[0] else ["Entity"])
    for a in out:                                                          # an event's class atom: the event stays an Event
        if a["head"] == "Member" and any(b["head"] == "Agent" and b["args"][0] == a["args"][0] for b in out):
            types[a["args"][0]] = ["Event"]
    return {"id": gid, "text": gid, "dataset": "toy", "family": family, "role": role, "manifest": "test", "types": types, "atoms": out, "unmapped": []}


def helper(gid: str, family: str, verb1: str = "hold", verb2: str = "open", thing: str = "key", joined: bool = True, role: str = "mine") -> dict:
    """Someone ``verb1``s a thing; a thing ``verb2``s a box. ``joined``: it is the same thing."""
    second = "sk_a_1" if joined else "sk_b_1"
    atoms = [("Member", ["sk_man_1", "man"], "x1"), ("Member", ["sk_a_1", thing], "x2"), ("Member", ["sk_box_1", "box"], "x3"),
             ("Member", ["sk_v_1", verb1], "q1"), ("Agent", ["sk_v_1", "sk_man_1"], "q1"), ("Patient", ["sk_v_1", "sk_a_1"], "q1"),
             ("Member", ["sk_w_1", verb2], "q2"), ("Agent", ["sk_w_1", second], "q2"), ("Patient", ["sk_w_1", "sk_box_1"], "q2")]
    if not joined:
        atoms.insert(2, ("Member", ["sk_b_1", thing], "x4"))
    return graph(gid, family, atoms, role)


def group(gid: str, family: str, role: str = "mine") -> dict:
    """"Three women are sitting": the group's event, and the distribution template's rule saying it again of each member."""
    rule = "r1_implication"

    def atom(head, args, inst, template, scope=(), kind="content", name=None):
        return {"head": head, "args": args, "scope": [list(x) for x in scope], "tense": None, "name": name or f"{inst}_{head.lower()}",
                "inst": inst, "template": template, "s": 1.0, "c": 0.99, "kind": kind}
    prem, cons = [("Implication:premise", rule)], [("Implication:consequent", rule)]
    atoms = [atom("GroupOf", ["sk_group_1", "woman"], "g1", "group"),
             atom("Member", ["sk_sit_1", "sit"], "e1", "activity"), atom("Agent", ["sk_sit_1", "sk_group_1"], "e1", "activity"),
             atom("Implication", ["§premise", "§consequent"], "r1", "distribution", kind="scope", name=rule),
             atom("PartOf", ["$x", "sk_group_1"], "r1", "distribution", prem, name=rule),
             atom("Member", [["sk_sit", "$x"], "sit"], "r1", "distribution", cons, name=rule),
             atom("Agent", [["sk_sit", "$x"], "$x"], "r1", "distribution", cons, name=rule)]
    for i, a in enumerate(atoms):
        a["i"] = i
    return {"id": gid, "text": gid, "dataset": "toy", "family": family, "role": role, "manifest": "test",
            "types": {"sk_group_1": ["Entity"], "sk_sit_1": ["Event"]}, "atoms": atoms, "unmapped": []}


def corpus_graphs() -> list[dict]:
    return [helper("a1", "A"), helper("a2", "A"), helper("b1", "B"), helper("c1", "C"),
            helper("d1", "D", joined=False),                               # two keys: the atoms without the link
            helper("e1", "E", role="evaluate")]


def find(records: list[dict], pattern: str) -> dict:
    return next(c for c in records if P.SEP.join(c["pattern"]["atoms"]) == pattern)


class CanonicalFormTests(unittest.TestCase):
    def test_names_and_order_do_not_matter(self):
        a = P.canon(["|Patient($e2,$x5)|asserted", "|Agent($e7,$x5)|asserted"])[0]
        b = P.canon(["|Agent($e1,$x9)|asserted", "|Patient($e4,$x9)|asserted"])[0]
        self.assertEqual(a, JOIN)
        self.assertEqual(a, b)

    def test_the_binding_is_part_of_the_pattern(self):
        joined = P.canon(["|Agent($e1,$x1)|asserted", "|Patient($e2,$x1)|asserted"])[0]
        apart = P.canon(["|Agent($e1,$x1)|asserted", "|Patient($e2,$x2)|asserted"])[0]
        reflexive = P.canon(["|Agent($e1,$x1)|asserted", "|Patient($e1,$x1)|asserted"])[0]
        self.assertEqual(len({joined, apart, reflexive}), 3)                # three structures, three patterns

    def test_atoms_the_colour_cannot_tell_apart(self):
        a = P.canon(["|PartOf($x3,$x1)|asserted", "|PartOf($x4,$x1)|asserted", "|GroupOf($x1,parent)|asserted"])[0]
        b = P.canon(["|GroupOf($x7,parent)|asserted", "|PartOf($x2,$x7)|asserted", "|PartOf($x1,$x7)|asserted"])[0]
        self.assertEqual(a, b)
        pattern, order = P.canon(["|Patient($e2,$x5)|asserted", "|Agent($e7,$x5)|asserted"])
        self.assertEqual(order, (1, 0))                                     # the order that yields the pattern
        self.assertEqual(P.bindings(["|Agent($e7,$x5)|asserted", "|Patient($e2,$x5)|asserted"]), {"$e7": "$e1", "$x5": "$x1", "$e2": "$e2"})

    def test_labels_tell_a_tree_from_a_join(self):
        self.assertEqual(P.labels(P.atoms_of(JOIN))["view"], "join")        # one thing in two events
        self.assertEqual(P.labels(P.atoms_of(JOIN))["cross_event"], ["$x1"])
        tree = "|Agent($e1,$x1)|asserted & |Member($e1,take)|asserted & |Member($x1,man)|asserted"
        self.assertEqual(P.labels(P.atoms_of(tree))["view"], "tree")
        loop = "|Agent($e1,$x1)|asserted & |Patient($e1,$x2)|asserted & |Possession($x2,$x1)|asserted"
        self.assertTrue(P.labels(P.atoms_of(loop))["cyclic"])
        sealed = "Theme:$e1|Agent($e2,$x1)|asserted & Theme:$e1|Member($e2,leave)|asserted"
        self.assertEqual(P.labels(P.atoms_of(sealed))["view"], "tree")      # a scope anchor is structure, not a loop
        during = "|During($e1,$e3)|asserted & |During($e2,$e3)|asserted"
        self.assertEqual(P.labels(P.atoms_of(during))["cross_event"], ["$e3"])   # an event is an argument of two other events
        self.assertEqual(P.labels(P.atoms_of(during))["view"], "join")
        nested = "Theme:$e1|Agent($e2,$x1)|asserted & Theme:$e1|Agent($e3,$x2)|asserted"
        self.assertEqual(P.labels(P.atoms_of(nested))["cross_event"], [])   # two events inside one clause: its anchor is no argument
        self.assertEqual(P.labels(P.atoms_of(nested))["view"], "tree")


class MinerTests(unittest.TestCase):
    def setUp(self):
        self.result = S.run("toy", P.params_of(min_families=3), graphs=corpus_graphs(), write=False, tests="full", log=lambda *_: None)
        self.lex = self.result["views"]["lexicalized"]["records"]
        self.shape = self.result["views"]["shape"]["records"]

    def test_support_is_counted_in_families_of_the_mining_share(self):
        c = find(self.lex, JOIN)
        self.assertEqual(c["support"]["families"], 3)                       # A (two sentences), B, C — not D, whose keys differ
        self.assertEqual(c["support"]["roles"], {"evaluate": 1, "mine": 3})  # the held-out family is reported beside it
        self.assertEqual(c["support"]["sentences"], 4)                      # the sentences of the mining share
        self.assertEqual(c["support"]["held_out"], {"families": 1, "sentences": 1, "embeddings": 1})
        apart = "|Agent($e1,$x1)|asserted & |Member($e1,hold)|asserted"
        self.assertEqual(find(self.lex, apart)["support"]["families"], 4)   # D has the atoms, not the link

    def test_a_candidate_carries_its_evidence(self):
        c = find(self.lex, JOIN)
        self.assertEqual(c["pattern"]["variables"], {"$e1": "Event", "$x1": "Entity", "$e2": "Event"})
        self.assertEqual(c["pattern"]["labels"]["view"], "join")
        self.assertEqual(c["evidence"]["instances"], {"one": 0, "several": 4})       # two template instances in every match
        self.assertEqual(c["evidence"]["fillers"]["$x1"]["top"], {"key": 4})          # what the shared thing is
        self.assertEqual(c["evidence"]["fillers"]["$e1"]["top"], {"open": 4})         # the held-out sentence adds nothing here
        self.assertEqual({m["role"] for m in c["matches"]}, {"mine"})                 # nor to the sample
        self.assertEqual(c["matches"][0]["bindings"]["$x1"], "sk_a_1")
        self.assertTrue(all(m["family"] != c["matches"][0]["family"] for m in c["matches"][1:]))   # one match a family

    def test_the_views_are_linked(self):
        c = find(self.lex, "|Agent($e1,$x1)|asserted & |Member($e1,open)|asserted & |Patient($e2,$x1)|asserted")
        sh = next(s for s in self.shape if s["id"] == c["pattern"]["shape"])
        self.assertEqual(P.SEP.join(sh["pattern"]["atoms"]), "|Agent($e1,$x1)|asserted & |Member($e1,$c1)|asserted & |Patient($e2,$x1)|asserted")
        self.assertIn(c["id"], sh["pattern"]["covers"])
        self.assertEqual(sh["generalization"]["constants"], ["open"])       # every match shares the class: the generalizer keeps it
        self.assertFalse(sh["generalization"]["equals_pattern"])

    def test_patterns_with_the_same_sentences_name_their_largest(self):
        small = find(self.lex, "|Agent($e1,$x1)|asserted & |Member($e1,hold)|asserted")           # never without its patient
        big = next(c for c in self.lex if c["id"] == small["pattern"]["match_class"]["largest"])
        self.assertFalse(small["pattern"]["match_class"]["is_largest"])
        self.assertTrue(big["pattern"]["match_class"]["is_largest"])
        self.assertEqual(big["pattern"]["size"], 5)
        self.assertEqual(big["support"]["sentences"], small["support"]["sentences"])
        self.assertGreater(small["pattern"]["match_class"]["candidates"], 1)
        self.assertNotEqual(find(self.lex, JOIN)["pattern"]["match_class"]["largest"], big["id"])  # D has one, not the other

    def test_labels_are_fields_and_the_summary_reads_them(self):
        c = find(self.lex, JOIN)
        self.assertEqual((c["pattern"]["labels"]["in_rule"], c["pattern"]["labels"]["sealed"]), (0, 0))
        self.assertEqual(c["evidence"]["derived_rule"], 0)
        text = S.summary("toy", self.result)
        self.assertIn("Joins between events", text)
        for column in ("connected atoms", "inside one template instance", "after merging candidates with identical matches",
                       "candidates merged into this row", "using a distribution rule", "without a distribution rule"):
            self.assertIn(column, text)
        self.assertIn(c["id"], text + "".join(x["id"] for x in self.lex))
        self.assertEqual(S.stands_for(c), "$e1 open; $e2 hold; $x1 key")
        self.assertIn("keeps hold, open", text)                             # the shape table shows what the generalizer kept

    def test_the_held_out_share_checks_the_generalization(self):
        shape = "|Agent($e1,$x1)|asserted & |Member($e1,$c1)|asserted & |Patient($e2,$x1)|asserted"
        same = find(self.shape, shape)                                      # the held-out sentence opens a box too
        self.assertEqual(same["generalization"]["held_out"], {"fragments": 1, "holds": True, "lost_constants": []})
        graphs = corpus_graphs()[:-1] + [helper("e1", "E", verb2="unlock", role="evaluate")]
        res = S.run("toy", P.params_of(min_families=3), graphs=graphs, write=False, tests="none", log=lambda *_: None)
        other = find(res["views"]["shape"]["records"], shape)
        self.assertEqual(other["generalization"]["constants"], ["open"])    # what the four mining matches share …
        self.assertEqual(other["generalization"]["held_out"], {"fragments": 1, "holds": False, "lost_constants": ["open"]})   # … fails there
        self.assertIn("fails held-out: open", S.summary("toy", res))
        alone = S.run("toy", P.params_of(min_families=3), graphs=corpus_graphs()[:-1], write=False, tests="none", log=lambda *_: None)
        self.assertIsNone(find(alone["views"]["shape"]["records"], shape)["generalization"]["held_out"]["holds"])   # nothing to check with

    def test_a_candidate_that_uses_a_derived_rule_is_labelled_and_kept_apart(self):
        graphs = [group("g1", "G"), group("h1", "H"), group("i1", "I"), group("i2", "I"), group("j1", "J", role="evaluate")]
        res = S.run("toy", P.params_of(min_families=3), graphs=graphs, write=False, tests="full", log=lambda *_: None)
        lex = res["views"]["lexicalized"]["records"]
        own = find(lex, "|Agent($e1,$x1)|asserted & |GroupOf($x1,woman)|asserted")             # the group's own event
        copy = find(lex, "Implication:consequent:$r1|Agent($e1,$x1)|asserted & Implication:premise:$r1|PartOf($x1,$x2)|asserted")
        both = find(lex, "Implication:premise:$r1|PartOf($x1,$x2)|asserted & |Agent($e1,$x2)|asserted")   # the rule beside the event
        self.assertEqual([c["evidence"]["derived_rule"] for c in (own, copy, both)], [0, 4, 4])
        self.assertEqual(copy["evidence"]["instances"], {"one": 4, "several": 0})        # inside the distribution instance
        self.assertEqual(both["evidence"]["instances"], {"one": 0, "several": 4})        # … which "inside one instance" misses
        ids = {c["id"]: c for c in lex}
        largest = ids[own["pattern"]["match_class"]["largest"]]                          # the same sentences, yet merged apart:
        self.assertEqual((largest["pattern"]["size"], largest["evidence"]["derived_rule"]), (3, 0))   # a lean row shows a lean pattern
        self.assertTrue(ids[both["pattern"]["match_class"]["largest"]]["evidence"]["derived_rule"])
        self.assertTrue(all(c["tests"]["renaming"]["pass"] and c["tests"]["broken_link"]["pass"] for c in lex))
        text = S.summary("toy", res)
        view = text[text.index("## The lexicalized view"):text.index("## The shape view")]
        head, _, tail = view.partition("### Candidates using a distribution rule")
        rows = [line for line in head.splitlines() if line.startswith("| freq-pattern-")]
        self.assertTrue(rows and not any("rule " in line for line in rows))              # the tables lead with the others
        self.assertIn("rule premise:$r1 ▸ PartOf", tail)

    def test_the_generalization_of_a_lexicalized_pattern_is_the_pattern(self):
        self.assertTrue(self.lex and all(c["generalization"]["equals_pattern"] for c in self.lex))

    def test_every_candidate_passes_the_two_tests(self):
        for c in self.lex + self.shape:
            self.assertTrue(c["tests"]["renaming"]["pass"], c["id"])
            self.assertTrue(c["tests"]["broken_link"]["pass"], (c["id"], c["tests"]))
        self.assertTrue(all(r["identical"] for r in self.result["renamed_corpus"].values()))

    def test_a_capped_sentence_is_named(self):
        corpus = P.Corpus(corpus_graphs())
        report = P.mine(corpus.sentences["lexicalized"], P.params_of(min_families=3, max_embeddings=2))
        self.assertTrue(report["levels"][0]["capped_sentences"])

    def test_the_parameters_constrain_growth(self):
        corpus = P.Corpus(corpus_graphs())
        two = P.mine(corpus.sentences["lexicalized"], P.params_of(min_families=3, max_atoms=2))
        self.assertEqual([lv["size"] for lv in two["levels"]], [2])
        few = S.run("toy", P.params_of(min_families=3, max_variables=2), graphs=corpus_graphs(), write=False, tests="none", log=lambda *_: None)
        self.assertTrue(all(len(c["pattern"]["variables"]) <= 2 for c in few["views"]["lexicalized"]["records"]))
        without = S.run("toy", P.params_of(min_families=3, exclude_heads=["Patient"]), graphs=corpus_graphs(), write=False, tests="none", log=lambda *_: None)
        self.assertFalse(any("Patient" in a for c in without["views"]["lexicalized"]["records"] for a in c["pattern"]["atoms"]))


class GeneralizerTests(unittest.TestCase):
    ATOMS = [5, 7, 3, 6]                                                    # Patient(hold), Agent(open), Member(v, verb1), Member(w, verb2)

    def fragments(self, graphs):
        corpus = P.Corpus(graphs)
        out = []
        for n in range(len(graphs)):
            sh = corpus.sentences["shape"][n]
            out.append(G.fragment(sh, [sh.local[i] for i in self.ATOMS]))
        return out

    def test_shared_classes_stay_and_the_shared_thing_is_one_variable(self):
        g = G.lgg(self.fragments([helper("a", "A"), helper("b", "B")]))
        self.assertEqual(g["constants"], ["hold", "open"])
        self.assertEqual(g["pattern"], "|Agent($e1,$x1)|asserted & |Member($e2,hold)|asserted & |Member($e1,open)|asserted & |Patient($e2,$x1)|asserted")

    def test_a_class_that_differs_becomes_a_variable(self):
        g = G.lgg(self.fragments([helper("a", "A"), helper("b", "B", verb1="carry")]))
        self.assertEqual(g["constants"], ["open"])                          # hold / carry → a class variable; open stays
        self.assertIn("|Member($e2,$c1)|asserted", g["atoms"])
        self.assertEqual(g["variables"], 4)                                 # two events, the thing, the class

    def test_a_link_one_fragment_lacks_is_not_in_the_generalization(self):
        joined = G.lgg(self.fragments([helper("a", "A"), helper("b", "B")]))
        mixed = G.lgg(self.fragments([helper("a", "A"), helper("d", "D", joined=False)][:1]) + self._apart())
        self.assertEqual(mixed["variables"], joined["variables"] + 1)       # the key of one, the two keys of the other
        self.assertIn("|Agent($e1,$x1)|asserted", mixed["atoms"])
        self.assertIn("|Patient($e2,$x2)|asserted", mixed["atoms"])

    def _apart(self):
        corpus = P.Corpus([helper("d", "D", joined=False)])
        sh = corpus.sentences["shape"][0]
        return [G.fragment(sh, [sh.local[i] for i in (6, 8, 4, 7)])]        # the same four atoms, one index later

    def test_fragments_of_another_skeleton_do_not_generalize(self):
        corpus = P.Corpus([helper("a", "A")])
        sh = corpus.sentences["shape"][0]
        one, other = G.fragment(sh, [sh.local[5]]), G.fragment(sh, [sh.local[4]])   # a Patient atom, an Agent atom
        self.assertIsNone(G.lgg([one, other]))

    def test_breaking_a_link_and_renaming(self):
        g = helper("a", "A")
        broken = G.break_link(g, 7, "sk_a_1", "Entity")                     # the opener is no longer the thing held
        self.assertEqual(broken["atoms"][7]["args"], ["sk_w_1", "sk_a_1_broken"])
        self.assertEqual(g["atoms"][7]["args"], ["sk_w_1", "sk_a_1"])       # the original is untouched
        self.assertIsNone(G.break_link(g, 0, "sk_a_1"))                     # that atom does not hold it
        s = P.Sentence(0, L.lift(broken))
        self.assertNotEqual(P.canon([s.keys[s.local[5]], s.keys[s.local[7]]])[0], JOIN)
        renamed, moved = G.rename_graph(g, seed=3)
        self.assertNotIn("sk_a_1", str(renamed["atoms"]))
        r = P.Sentence(0, L.lift(renamed))
        self.assertEqual(P.canon([r.keys[r.local[moved[5]]], r.keys[r.local[moved[7]]]])[0], JOIN)


if __name__ == "__main__":
    unittest.main(verbosity=1)
