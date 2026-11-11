"""The lowering (tmpl.lower): the emitter's records written in one consumer's syntax.

    python -m unittest tests.test_lower        (from templates/)
"""
from __future__ import annotations

import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir))

from tmpl import catalog as CAT, emit as E, lower as L, typecheck as T  # noqa: E402

CATALOG = CAT.load()


class LoweringTests(unittest.TestCase):
    def test_records_and_types_lower_to_our_engine_lines_syntax(self):
        emitted = {"records": [{"name": "n1_name", "term": ["Name", "sk_mill_1", L.Str('The "Old" Mill')],
                                "truth": [1.0, 0.99], "owner": "named-entity", "inst": "n1"},
                               {"name": "m1_measure", "term": ["Measure", "sk_teodor_1", "old", 31, "year"],
                                "truth": [0.9, 0.7], "owner": "measure", "inst": "m1"}],
                   "types": {"old": ["Class"], "sk_teodor_1": ["Entity", "Instance"]},
                   "functions": [{"stem": "sk_loom", "arity": 1, "classes": ["Entity", "Instance"]}]}
        out = L.lower(emitted, "pettachainer")
        self.assertEqual(out["statements"], ['(: n1_name (Name sk_mill_1 "The \\"Old\\" Mill") (STV 1.0 0.99))',
                                             "(: m1_measure (Measure sk_teodor_1 old 31 year) (STV 0.9 0.7))"])
        self.assertEqual(out["declarations"], ["(: old Class)", "(: sk_teodor_1 Entity)", "(: sk_teodor_1 Instance)",
                                               "(: sk_loom (-> Atom Entity))", "(: sk_loom (-> Atom Instance))"])

    def test_an_unknown_target_is_refused(self):
        with self.assertRaises(ValueError):
            L.lower({"records": [], "types": {}, "functions": []}, "some-other-engine")

    def test_every_example_emits_records_whose_lowering_is_its_text(self):
        """For every catalog example: the text keys are the lowering of the records, and a record's leaves are
        the tree a reader of the statement's text gets — what the miner used to re-parse."""
        n = 0
        for tid, t in CATALOG.items():
            for section in ("shown", "held_out"):
                for ex in (t.get("examples") or {}).get(section) or []:
                    if not ex.get("instances") or ex.get("context"):     # a case read after a context: test_blocks
                        continue
                    out = E.emit({"id": "x", "instances": ex["instances"]}, CATALOG)
                    low = L.lower(out)
                    self.assertEqual(low["statements"], out["statements"], (tid, ex["text"]))
                    self.assertEqual(low["declarations"], out["declarations"], (tid, ex["text"]))
                    for rec, text in zip(out["records"], out["statements"]):
                        name, term = T.split_statement(text)
                        self.assertEqual((rec["name"], L.leaves(rec["term"])), (name, term), (tid, ex["text"]))
                    n += 1
        self.assertGreater(n, 1000)


def _emit(instances):
    return E.emit({"id": "x", "instances": instances}, CATALOG)


REPORT = [{"t": "witness", "id": "x1", "class": "report", "mods": ["hive", "progress"]},
          {"t": "activity", "id": "v1", "verb": "arrive", "actor": "@x1", "tense": "past"}]
BIKE = [{"t": "witness", "id": "x1", "class": "bike", "props": ["yellow"]},
        {"t": "activity", "id": "v1", "verb": "fall", "actor": "@x1", "tense": "past"}]


class UpstreamMasterTests(unittest.TestCase):
    """The second target: upstream master takes a class as one symbol, so a narrowed class is spelled as one, and
    what its term said is kept beside the statements."""

    def test_a_narrowed_class_gets_one_symbol_from_its_noun_and_its_restrictions(self):
        for term, symbol in (
                (["Narrow", "report", ["Mod", "progress"]], "report__mod_progress"),
                (["Narrow", "bike", ["Member", "yellow"]], "bike__member_yellow"),
                (["Narrow", "juice", ["Mod", "orange"]], "juice__mod_orange"),
                (["Narrow", "juice", ["Member", "orange"]], "juice__member_orange"),      # the fruit's and the colour's: two classes
                (["Narrow", "report", ["And", ["Mod", "hive"], ["Mod", "progress"]]], "report__mod_hive__mod_progress"),
                (["Narrow", "season", ["Possession", "sk_town_1"]], "sk_season__possession_sk_town_1")):
            self.assertEqual(L.class_symbol(term), symbol)
        # more than a head and one plain symbol: the head and a hash of the restriction's text
        wife = L.class_symbol(["Narrow", "wife", ["Relation", "wife", "sk_berry_1"]])
        self.assertRegex(wife, r"^sk_wife__relation_[0-9a-f]{8}$")
        self.assertEqual(wife, L.class_symbol(["Narrow", "wife", ["Relation", "wife", "sk_berry_1"]]))
        self.assertNotEqual(wife, L.class_symbol(["Narrow", "wife", ["Relation", "wife", "sk_odile_1"]]))
        self.assertRegex(L.class_symbol(["Narrow", "tractor", ["Mod", ["Year", 1923]]]), r"^tractor__mod_[0-9a-f]{8}$")

    def test_the_statements_name_the_class_and_the_definitions_say_what_it_is(self):
        out = _emit(REPORT)
        low = L.lower(out, "pettachainer-master")
        self.assertEqual(len(low["statements"]), len(out["statements"]))                  # the same statements, respelled
        self.assertIn("(: x1_member (Member sk_report_1 report) (STV 1.0 0.99))", low["statements"])
        self.assertIn("(: x1_member_3 (Member sk_report_1 report__mod_progress) (STV 1.0 0.99))", low["statements"])
        self.assertIn("(: x1_member_4 (Member sk_report_1 report__mod_hive__mod_progress) (STV 1.0 0.99))", low["statements"])
        self.assertFalse(any("(Narrow " in st for st in low["statements"] + low["definitions"][:0]))
        self.assertEqual(low["definitions"], [
            "(: kind__report__mod_hive (Inheritance report__mod_hive report) (STV 1.0 0.99))",
            "(: by_1__report__mod_hive (NarrowBy report__mod_hive (Mod hive)) (STV 1.0 0.99))",
            "(: kind__report__mod_progress (Inheritance report__mod_progress report) (STV 1.0 0.99))",
            "(: by_1__report__mod_progress (NarrowBy report__mod_progress (Mod progress)) (STV 1.0 0.99))",
            "(: kind__report__mod_hive__mod_progress (Inheritance report__mod_hive__mod_progress report) (STV 1.0 0.99))",
            "(: by_1__report__mod_hive__mod_progress (NarrowBy report__mod_hive__mod_progress (Mod hive)) (STV 1.0 0.99))",
            "(: by_2__report__mod_hive__mod_progress (NarrowBy report__mod_hive__mod_progress (Mod progress)) (STV 1.0 0.99))"])
        self.assertEqual(low["classes"]["report__mod_progress"], "(Narrow report (Mod progress))")
        self.assertIn("(: report__mod_progress Class)", low["declarations"])
        self.assertEqual(low["kept"], [])
        self.assertEqual(L.lower(out)["statements"], out["statements"])                    # our engine line: untouched

    def test_an_adjectives_restriction_is_spelled_is_and_its_default_rule_follows_the_class(self):
        low = L.lower(_emit(BIKE), "pettachainer-master")
        self.assertIn("(: x1_implication (Implication (Member sk_bike_1 bike__member_yellow) (Member sk_bike_1 yellow)) (STV 0.9 0.7))",
                      low["statements"])
        self.assertEqual(low["definitions"], ["(: kind__bike__member_yellow (Inheritance bike__member_yellow bike) (STV 1.0 0.99))",
                                              "(: by_1__bike__member_yellow (NarrowBy bike__member_yellow (Is yellow)) (STV 1.0 0.99))"])

    def test_a_class_that_names_an_individual_of_the_text_is_the_texts(self):
        low = L.lower(_emit([{"t": "named-entity", "id": "n1", "name": "Brackenford"},
                             {"t": "witness", "id": "x1", "class": "report", "mods": ["@n1"]},
                             {"t": "activity", "id": "v1", "verb": "arrive", "actor": "@x1", "tense": "past"}]), "pettachainer-master")
        self.assertIn("(: x1_member_2 (Member sk_report_1 sk_report__mod_sk_brackenford_1) (STV 1.0 0.99))", low["statements"])
        self.assertIn("(: by_1__sk_report__mod_sk_brackenford_1 (NarrowBy sk_report__mod_sk_brackenford_1 (Mod sk_brackenford_1)) (STV 1.0 0.99))",
                      low["definitions"])
        self.assertFalse(any(d.split(" ", 2)[1].startswith("sk_") for d in low["definitions"]))   # a statement's name is no symbol

    def test_a_narrowed_class_is_interned_wherever_it_stands_and_one_with_a_variable_is_kept(self):
        records = [{"name": "a", "term": ["GroupOf", "sk_group_1", ["Narrow", "man", ["Member", "young"]]], "truth": [1.0, 0.99]},
                   {"name": "b", "term": ["Directive", ["And", ["Member", "sk_post_1", "post"], ["As", "sk_post_1", ["Narrow", "report", ["Mod", "progress"]]]]],
                    "truth": [1.0, 0.99]},
                   {"name": "c", "term": ["Inheritance", ["Narrow", "request", ["Mod", "user"]], "open"], "truth": [0.0, 0.9]},
                   {"name": "d", "term": ["Implication", ["Member", "$x", "dog"], ["Member", ["sk_tail", "$x"], ["Narrow", "tail", ["PartOf", "$x"]]]],
                    "truth": [1.0, 0.9]}]
        low = L.lower({"records": records, "types": {}, "functions": []}, "pettachainer-master")
        self.assertEqual(low["statements"][:3], [
            "(: a (GroupOf sk_group_1 man__member_young) (STV 1.0 0.99))",
            "(: b (Directive (And (Member sk_post_1 post) (As sk_post_1 report__mod_progress))) (STV 1.0 0.99))",
            "(: c (Inheritance request__mod_user open) (STV 0.0 0.9))"])
        self.assertIn("(Narrow tail (PartOf $x))", low["statements"][3])                  # no one symbol for a class of each $x
        self.assertEqual(low["kept"], ["(Narrow tail (PartOf $x))"])
        self.assertEqual(sorted(low["classes"]), ["man__member_young", "report__mod_progress", "request__mod_user"])

    def test_a_query_names_the_class_or_asks_through_the_definitions(self):
        self.assertEqual(L.query(["Member", "$x", ["Narrow", "report", ["Mod", "progress"]]], "pettachainer-master"),
                         "(: $prf (Member $x report__mod_progress) $tv)")
        self.assertEqual(L.query(["Member", "$x", ["Narrow", "report", ["Mod", "$m"]]], "pettachainer-master"),
                         "(: $prf (And (Member $x $class_1) (Inheritance $class_1 report) (NarrowBy $class_1 (Mod $m))) $tv)")
        self.assertEqual(L.query(["And", ["Member", "$x", ["Narrow", "bike", ["Member", "$a"]]], ["Agent", "$e", "$x"]], "pettachainer-master"),
                         "(: $prf (And (Member $x $class_1) (Agent $e $x) (Inheritance $class_1 bike) (NarrowBy $class_1 (Is $a))) $tv)")
        self.assertEqual(L.query(["Member", "$x", ["Narrow", "report", ["Mod", "progress"]]]),
                         "(: $prf (Member $x (Narrow report (Mod progress))) $tv)")         # our engine line: as written

    def test_every_example_lowers_to_what_upstream_master_accepts_by_its_stated_contracts(self):
        """Over every catalog example: no narrowed class is left in a statement unless it holds a variable, no unary
        Member is left in a definition, every definition is about an interned class, and the lowering is a function of
        the records (twice the same)."""
        n = narrowed = 0
        for tid, t in CATALOG.items():
            for section in ("shown", "held_out"):
                for ex in (t.get("examples") or {}).get(section) or []:
                    if not ex.get("instances") or ex.get("context"):
                        continue
                    out = E.emit({"id": "x", "instances": ex["instances"]}, CATALOG)
                    low = L.lower(out, "pettachainer-master")
                    self.assertEqual(low, L.lower(out, "pettachainer-master"), (tid, ex["text"]))
                    self.assertEqual(len(low["statements"]), len(out["statements"]))
                    for st in low["statements"]:
                        _name, term = T.split_statement(st)
                        for sub in _narrow_terms(term):
                            self.assertIn(L.render(sub), low["kept"], (tid, ex["text"], st))
                    for d in low["definitions"]:
                        name, term = T.split_statement(d)
                        self.assertIn(term[0], ("Inheritance", "NarrowBy"), d)
                        self.assertIn(term[1], low["classes"], d)
                        self.assertFalse(any(len(sub) == 2 and sub[0] == "Member" for sub in _subterms(term)), d)
                    narrowed += bool(low["classes"])
                    n += 1
        self.assertGreater(n, 1000)
        self.assertGreater(narrowed, 30)


def _subterms(term):
    if isinstance(term, list):
        yield term
        for x in term:
            yield from _subterms(x)


def _narrow_terms(term):
    return [sub for sub in _subterms(term) if sub and sub[0] == "Narrow"]


if __name__ == "__main__":
    unittest.main()
