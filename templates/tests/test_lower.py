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

    def test_a_consumers_names_are_applied_before_the_class_is_named(self):
        """A consumer that keeps one symbol for a name across its texts passes it in: the class narrowed by that
        individual is named after the consumer's symbol and is no longer one text's own. Renaming the lowered text
        instead could not reach inside the class symbol."""
        out = _emit([{"t": "named-entity", "id": "n1", "name": "Brackenford"},
                     {"t": "witness", "id": "x1", "class": "report", "mods": ["@n1"]},
                     {"t": "activity", "id": "v1", "verb": "arrive", "actor": "@x1", "tense": "past"}])
        names = {"sk_brackenford_1": "brackenford", "sk_report_1": "sk_report_1__n7", "sk_absent_9": "absent"}
        low = L.lower(out, "pettachainer-master", symbols=names)
        self.assertIn('(: n1_name (Name brackenford "Brackenford") (STV 1.0 0.99))', low["statements"])
        self.assertIn("(: x1_member_2 (Member sk_report_1__n7 report__mod_brackenford) (STV 1.0 0.99))", low["statements"])
        self.assertEqual(low["definitions"], [
            "(: kind__report__mod_brackenford (Inheritance report__mod_brackenford report) (STV 1.0 0.99))",
            "(: by_1__report__mod_brackenford (NarrowBy report__mod_brackenford (Mod brackenford)) (STV 1.0 0.99))"])
        self.assertEqual(low["classes"], {"report__mod_brackenford": "(Narrow report (Mod brackenford))"})
        everything = low["statements"] + low["definitions"] + low["declarations"]
        self.assertFalse([x for x in everything if "sk_brackenford_1" in x or "sk_report_1 " in x])
        self.assertTrue([x for x in low["declarations"] if x.startswith("(: brackenford ")])
        # our engine line takes the names too, the class still a term
        ours = L.lower(out, "pettachainer", symbols=names)
        self.assertIn("(: x1_member_2 (Member sk_report_1__n7 (Narrow report (Mod brackenford))) (STV 1.0 0.99))", ours["statements"])
        self.assertEqual(L.lower(out, "pettachainer-master", symbols={})["statements"], L.lower(out, "pettachainer-master")["statements"])
        # a string literal is no symbol; a skolem function's stem is one; a query takes the names as well
        recs = {"records": [{"name": "a", "term": ["Name", "sk_mill_1", L.Str("sk_mill_1")], "truth": [1.0, 0.99]},
                            {"name": "b", "term": ["Member", ["sk_loom", "sk_mill_1"], "loom"], "truth": [1.0, 0.9]}],
                "types": {"sk_mill_1": ["Entity"], "sk_mill_2": ["Instance"]},
                "functions": [{"stem": "sk_loom", "arity": 1, "classes": ["Entity"]}]}
        low = L.lower(recs, "pettachainer-master", symbols={"sk_mill_1": "mill", "sk_mill_2": "mill", "sk_loom": "sk_loom__n7"})
        self.assertEqual(low["statements"], ['(: a (Name mill "sk_mill_1") (STV 1.0 0.99))',
                                             "(: b (Member (sk_loom__n7 mill) loom) (STV 1.0 0.9))"])
        self.assertEqual(low["declarations"], ["(: mill Entity)", "(: mill Instance)", "(: sk_loom__n7 (-> Atom Entity))"])
        self.assertEqual(L.query(["Member", "$x", ["Narrow", "report", ["Mod", "sk_brackenford_1"]]], "pettachainer-master", names),
                         "(: $prf (Member $x report__mod_brackenford) $tv)")
        self.assertEqual(L.statement({"name": "c", "term": ["Agent", "sk_wash_1", "sk_brackenford_1"], "truth": [1.0, 0.99]},
                                     "pettachainer", names), "(: c (Agent sk_wash_1 brackenford) (STV 1.0 0.99))")
        for bad in ("two words", "$x", "(a)", '"quoted"', ""):
            with self.assertRaises(ValueError):
                L.lower(out, "pettachainer-master", symbols={"sk_brackenford_1": bad})

    def test_the_restrictions_of_a_class_come_in_one_order_whatever_the_sentence_had(self):
        """The emitter sorts a class's restrictions by their text — an adjective before a noun, each alphabetical — so
        "a yellow hive progress report" and the same words in another order are one class with one symbol."""
        def low(mods):
            return L.lower(_emit([{"t": "witness", "id": "x1", "class": "report", "mods": mods, "props": ["yellow"]},
                                  {"t": "activity", "id": "v1", "verb": "arrive", "actor": "@x1", "tense": "past"}]), "pettachainer-master")
        a, b = low(["hive", "progress"]), low(["progress", "hive"])
        self.assertIn("report__member_yellow__mod_hive__mod_progress", a["classes"])
        self.assertEqual(a["classes"]["report__member_yellow__mod_hive__mod_progress"],
                         "(Narrow report (And (Member yellow) (Mod hive) (Mod progress)))")
        self.assertEqual(sorted(a["classes"]), sorted(b["classes"]))
        self.assertEqual(sorted(a["definitions"]), sorted(b["definitions"]))
        # under a consumer's own names the order is taken again: two texts whose symbols sort differently, one class
        def named(first, second, names):
            rec = {"name": "a", "term": ["Member", "sk_report_1", ["Narrow", "report", ["And", ["Mod", first], ["Mod", second]]]], "truth": [1.0, 0.99]}
            return L.lower({"records": [rec], "types": {}, "functions": []}, "pettachainer-master", symbols=names)
        one = named("sk_ibm_1", "sk_india_1", {"sk_ibm_1": "ibm", "sk_india_1": "india"})
        two = named("sk_india_1", "sk_international_business_machines_1", {"sk_india_1": "india", "sk_international_business_machines_1": "ibm"})
        self.assertEqual(list(one["classes"]), ["report__mod_ibm__mod_india"])
        self.assertEqual(list(two["classes"]), ["report__mod_ibm__mod_india"])
        self.assertEqual(one["definitions"], two["definitions"])
        self.assertEqual([d.split(" ")[1] for d in one["definitions"]],
                         ["kind__report__mod_ibm__mod_india", "by_1__report__mod_ibm__mod_india", "by_2__report__mod_ibm__mod_india"])
        self.assertIn("(NarrowBy report__mod_ibm__mod_india (Mod ibm))", one["definitions"][1])
        # each restriction alone and all of them together, never every subset
        self.assertEqual(sorted(a["classes"]), ["report__member_yellow", "report__member_yellow__mod_hive__mod_progress",
                                                "report__mod_hive", "report__mod_progress"])

    def test_the_predicates_to_declare_are_the_heads_that_state_something(self):
        """Upstream master is told which predicates are positive-only before it loads anything: every head that states
        something of its arguments, never the logical links; our engine line declares nothing."""
        names = L.predicates("pettachainer-master")
        self.assertEqual(names, sorted(set(names)))
        for head in ("Agent", "Coref", "LocatedIn", "Past", "Name", "Tag", "Measure", "Because", "Permitted", "Holds", "UnitFactor",
                     "NarrowBy", "Is"):
            self.assertIn(head, names)
        for head in ("Member", "Inheritance", "Not", "And", "Or", "Implication", "Equivalence", "Narrow", "Compute", "Interpretation"):
            self.assertNotIn(head, names)
        self.assertGreater(len(names), 150)
        self.assertEqual(L.predicates(), [])
        self.assertEqual(L.predicates("pettachainer"), [])
        with self.assertRaises(ValueError):
            L.predicates("some-other-engine")
        # a text's own predicates on that engine are its class symbols: its words' classes and the narrowed ones
        low = L.lower(_emit(REPORT), "pettachainer-master", symbols={"sk_report_1": "sk_report_1__n7"})
        self.assertEqual(low["predicates"], sorted(set(low["predicates"])))
        for name in ("report", "arrive", "report__mod_hive", "report__mod_progress", "report__mod_hive__mod_progress"):
            self.assertIn(name, low["predicates"])
        self.assertFalse([n for n in low["predicates"] if n.startswith("sk_report_1")])     # an individual is no predicate
        self.assertEqual(low["predicates"], sorted(d[3:-1].split(" ")[0] for d in low["declarations"] if d.endswith(" Class)")))
        self.assertNotIn("predicates", L.lower(_emit(REPORT)))                              # our engine line declares nothing

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
