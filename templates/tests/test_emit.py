"""Tests for the generic emitter (tmpl/emit.py) over the catalog (templates/catalog/*.yaml).

* the catalog loads and passes its structural checks;
* every example that carries an illustration (``emitted`` / ``declarations``) emits exactly
  the illustrated atoms and declarations;
* an attitude seals its complement; a factive also states it flat, and that presupposition
  projects out of a negation over the attitude;
* every example with instances emits, deterministically, and type-checks strictly (C9) with
  the emitter's own declarations;
* scope: an indefinite witness mentioned only inside a negated clause is rendered inside the
  Not, a definite one stays at the top level;
* malformed instances are refused with a reason.

Run from ``templates/``: ``python tests/test_emit.py``
"""
from __future__ import annotations

import json
import os
import re
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import catalog as CAT, emit as E, typecheck as T  # noqa: E402

CATALOG = CAT.load()


def atoms_of(statements):
    """The atom texts of statements, proof names dropped."""
    out = []
    for st in statements:
        _, atom = T.split_statement(st)
        out.append(T.render(atom))
    return out


def all_examples():
    for tid, t in CATALOG.items():
        for section in ("shown", "held_out"):
            for ex in (t.get("examples") or {}).get(section) or []:
                if ex.get("instances"):
                    yield tid, section, ex


class CatalogTests(unittest.TestCase):
    def test_catalog_loads_without_problems(self):
        self.assertIn("transfer", CATALOG)
        for tid, t in CATALOG.items():
            self.assertEqual(t["id"], tid)

    def test_when_conditions_are_checked_by_slot_type(self):
        """A ``when`` clause compares a slot with one of its values (enum), true / false (bool) or
        any lowercase word (lemma, string); an unknown slot or value is a problem."""
        slots = {"level": {"type": "lemma", "class": "Level"}, "for_kind": {"type": "lemma", "class": "Class"},
                 "tense": {"type": "enum", "values": ["past", "present"]}, "definite": {"type": "bool"}}
        self.assertEqual(CAT.check_when("not for_kind and level != almost and tense == past or definite == true", slots), [])
        self.assertTrue(CAT.check_when("tense == sometime", slots))
        self.assertTrue(CAT.check_when("definite == yes", slots))
        self.assertTrue(CAT.check_when("mood == past", slots))
        self.assertTrue(CAT.check_when("level != Almost", slots))


class EmitTests(unittest.TestCase):
    def test_illustrations_match_the_emitter(self):
        n = 0
        for tid, section, ex in all_examples():
            if not ex.get("emitted"):
                continue
            n += 1
            out = E.emit({"id": "x", "instances": ex["instances"]}, CATALOG)
            self.assertEqual(sorted(atoms_of(out["statements"])), sorted(ex["emitted"]), (tid, ex["text"]))
            want = set(ex["declarations"]) | {d.replace(f" {c})", " Instance)") for d in ex["declarations"]
                                              for c in E.INSTANCE_SUBTYPES if f" {c})" in d}
            self.assertEqual(set(out["declarations"]), want, (tid, ex["text"]))
        self.assertGreaterEqual(n, 2)

    def test_attitude_seals_and_factives_project(self):
        def atoms_for(text):
            ex = next(e for _, _, e in all_examples() if e["text"] == text)
            return atoms_of(E.emit({"id": "a", "instances": ex["instances"]}, CATALOG)["statements"])

        belief = atoms_for("Teodor believes that Lamine lent Ottoline the trowel.")
        self.assertTrue(any(a.startswith("(Theme sk_believe_1 (And (Member sk_lend_1 lend)") for a in belief))
        self.assertFalse(any(a.startswith("(Member sk_lend_1") or a.startswith("(Agent sk_lend_1") for a in belief))
        know = atoms_for("Yusra knows that Teodor sold the spindle.")
        self.assertIn("(Agent sk_sell_1 sk_teodor_1)", know)                      # the presupposed complement, flat
        self.assertIn("(Member sk_spindle_1 spindle)", know)
        self.assertEqual(sum(a.startswith("(Theme sk_know_1 ") for a in know), 1)
        neg_know = atoms_for("Yusra does not know that Teodor sold the spindle.")
        self.assertEqual(sum(a.startswith("(Not (And (Member sk_know_1 know)") for a in neg_know), 1)
        self.assertIn("(Agent sk_sell_1 sk_teodor_1)", neg_know)                  # projects through the negation
        neg_belief = atoms_for("Teodor does not believe that Lamine sold the spindle.")
        self.assertFalse(any(a.startswith("(Agent sk_sell_1") for a in neg_belief))
        self.assertEqual(len([a for a in neg_belief if a.startswith("(Not ")]), 1)
        modal = atoms_for("Teodor believes that Lamine might lend Ottoline the trowel.")
        self.assertTrue(any(a.startswith("(Theme sk_believe_1 (Might (And ") for a in modal))

    def test_truth_rule_sets_the_confidence(self):
        def stmts(text):
            ex = next(e for _, _, e in all_examples() if e["text"] == text)
            return E.emit({"id": "t", "instances": ex["instances"]}, CATALOG)["statements"]

        self.assertTrue(all(st.endswith("(STV 1.0 0.99))") for st in stmts("Ferrets are mustelids.")))
        self.assertTrue(all(st.endswith("(STV 0.9 0.9))") for st in stmts("Ferrets are curious.")))
        quant = stmts("All ferrets are curious.")
        self.assertIn("(: k1_inheritance (Inheritance ferret curious) (STV 1.0 0.9))", quant)
        self.assertIn('(: k1_quantifierphrase (QuantifierPhrase ferret curious "all") (STV 1.0 0.99))', quant)
        neg = stmts("Ferrets are not rodents.")
        self.assertEqual(len(neg), 1)
        self.assertTrue(neg[0].startswith("(: s1_not (Not (Inheritance ferret rodent))") and neg[0].endswith("(STV 1.0 0.99))"))

    def test_distribution_rule_keeps_the_group_statement_and_skolemizes(self):
        ex = next(e for _, _, e in all_examples() if e["text"] == "Several ferrets slept.")
        out = E.emit({"id": "g", "instances": ex["instances"]}, CATALOG)
        atoms = atoms_of(out["statements"])
        self.assertIn("(Agent sk_sleep_1 sk_group_1)", atoms)                 # the group-level statement stays
        rule = next(a for a in atoms if a.startswith("(Implication"))
        self.assertEqual(rule, "(Implication (PartOf $x sk_group_1) (And (Member (sk_sleep $x) sleep) (Agent (sk_sleep $x) $x) (Past (sk_sleep $x))))")
        self.assertTrue(next(st for st in out["statements"] if "(Implication" in st).endswith("(STV 1.0 0.9))"))
        neg = next(e for _, _, e in all_examples() if e["text"] == "The ferrets did not sleep.")
        natoms = atoms_of(E.emit({"id": "n", "instances": neg["instances"]}, CATALOG)["statements"])
        self.assertTrue(any(a.startswith("(Not (And (Member sk_sleep_1 sleep)") for a in natoms))
        self.assertTrue(any(a.startswith("(Implication (PartOf $x sk_group_1) (Not (And (Member (sk_sleep $x) sleep)") for a in natoms))

    def test_generic_rules_over_a_variable(self):
        def stmts(text):
            ex = next(e for _, _, e in all_examples() if e["text"] == text)
            return E.emit({"id": "g", "instances": ex["instances"]}, CATALOG)["statements"]

        every = stmts("Every ferret slept.")
        self.assertIn("(: r1_implication (Implication (Member $x ferret) (And (Member (sk_sleep $x) sleep) (Agent (sk_sleep $x) $x) (Past (sk_sleep $x)))) (STV 1.0 0.9))", every)
        self.assertIn('(: q1_quantifierphrase (QuantifierPhrase ferret sleep "every") (STV 1.0 0.99))', every)
        self.assertTrue(next(st for st in stmts("Few ferrets slept.") if "Implication" in st).endswith("(STV 0.1 0.9))"))
        self.assertTrue(next(st for st in stmts("No ferret slept.") if "Implication" in st).endswith("(STV 0.0 0.9))"))
        bare = stmts("Ferrets sleep.")
        self.assertEqual(len(bare), 1)
        self.assertTrue(bare[0].endswith("(STV 0.9 0.9))") and "(Past" not in bare[0])
        indef = [a for a in atoms_of(stmts("Every student read a letter.")) if a.startswith("(Implication")]
        self.assertEqual(indef, ["(Implication (Member $x student) (And (Member (sk_read $x) read) (Agent (sk_read $x) $x) (Patient (sk_read $x) (sk_letter $x)) (Past (sk_read $x)) (Member (sk_letter $x) letter)))"])
        defin = atoms_of(stmts("Every student read the letter."))
        self.assertIn("(Member sk_letter_1 letter)", defin)
        self.assertTrue(any("(Patient (sk_read $x) sk_letter_1)" in a for a in defin))
        two = atoms_of(stmts("Every ferret feared every heron."))
        self.assertTrue(any(a.startswith("(Implication (And (Member $x ferret) (Member $y heron)) (And (Member (sk_fear $x $y) fear) (Experiencer (sk_fear $x $y) $x) (Stimulus (sk_fear $x $y) $y)") for a in two))
        neg = atoms_of(stmts("Ferrets do not sleep."))
        self.assertTrue(any(a.startswith("(Implication (Member $x ferret) (Not (And (Member (sk_sleep $x) sleep)") for a in neg))

    def test_when_clauses_are_case_insensitive(self):
        self.assertTrue(E.holds("factive == true", {"factive": True}))
        self.assertFalse(E.holds("factive == true", {"factive": False}))
        self.assertTrue(E.holds("head == might", {"head": "Might"}))
        self.assertTrue(E.holds("tense == past or aspect == perfect", {"tense": "present", "aspect": "perfect"}))

    def test_every_example_emits_deterministically(self):
        for tid, section, ex in all_examples():
            item = {"id": f"{tid}-{section}", "instances": ex["instances"]}
            a = E.emit(item, CATALOG)
            b = E.emit(json.loads(json.dumps(item)), CATALOG)
            self.assertEqual(a["statements"], b["statements"], (tid, ex["text"]))
            self.assertTrue(a["statements"], (tid, ex["text"]))

    def test_every_example_typechecks_strictly(self):
        records = []
        for tid, section, ex in all_examples():
            out = E.emit({"id": f"{tid}-{section}", "instances": ex["instances"]}, CATALOG)
            records.append({"id": f"{tid}:{ex['text']}", "statements": out["statements"],
                            "declarations": out["declarations"]})
        with tempfile.NamedTemporaryFile("w", suffix=".jsonl", delete=False) as fh:
            for r in records:
                fh.write(json.dumps(r) + "\n")
            path = fh.name
        report = path + ".report.json"
        try:
            T.main([path, "--no-infer", "--report", report])
            with open(report, encoding="utf-8") as fh:
                rep = json.load(fh)
        finally:
            for p in (path, report):
                if os.path.exists(p):
                    os.unlink(p)
        bad = [f for f in rep["findings"] if f["kind"] in ("type", "type-conflict", "parse-error")]
        self.assertEqual(bad, [], bad[:3])
        self.assertEqual(rep["passed"], rep["statements"])

    def test_negated_transfer_scopes_its_witness(self):
        ex = next(e for _, _, e in all_examples() if e["text"] == "Lamine did not hand Teodor an envelope.")
        out = E.emit({"id": "neg", "instances": ex["instances"]}, CATALOG)
        atoms = atoms_of(out["statements"])
        nots = [a for a in atoms if a.startswith("(Not ")]
        self.assertEqual(len(nots), 1, atoms)
        self.assertIn("(Member sk_envelope_1 envelope)", nots[0])      # the witness lives inside the Not
        self.assertIn("(Past sk_hand_1)", nots[0])                     # tense inside the scope
        self.assertFalse(any(a.startswith("(Member sk_envelope_1") for a in atoms))   # not at top level
        self.assertIn('(Name sk_lamine_1 "Lamine")', atoms)                 # names stay at top level

    def test_attachment_follows_its_head(self):
        """A location is rendered wherever its event is: flat at the top level, inside a negation's
        bundle, inside a generalization's rule; its statement is owned by the attachment instance."""
        def example(tid, text):
            t = CATALOG[tid]
            return next(e for s in ("shown", "held_out") for e in t["examples"][s] if e["text"] == text)
        flat = E.emit({"id": "f", "instances": example("location", "Yusra laughed in the barn.")["instances"]}, CATALOG)
        self.assertIn("(Location sk_laugh_1 sk_barn_1)", atoms_of(flat["statements"]))
        self.assertEqual([d["inst"] for d in flat["detail"] if d["term"].startswith("(Location")], ["l1"])
        neg = E.emit({"id": "n", "instances": example("location", "Teodor did not laugh in the barn.")["instances"]}, CATALOG)
        natoms = atoms_of(neg["statements"])
        self.assertEqual(sum(a.startswith("(Not (And") and "(Location sk_laugh_1 sk_barn_1)" in a for a in natoms), 1)
        self.assertFalse(any(a.startswith("(Location") for a in natoms))          # nothing leaks out of the negation
        self.assertIn("(Member sk_barn_1 barn)", natoms)                           # the definite place stays presupposed
        rule = E.emit({"id": "r", "instances": example("location", "Every ferret slept in the barn.")["instances"]}, CATALOG)
        ratoms = atoms_of(rule["statements"])
        self.assertTrue(any(a.startswith("(Implication") and "(Location (sk_sleep $x) sk_barn_1)" in a for a in ratoms))
        indef = [{"t": "range", "id": "q1", "kind": "ferret", "quantifier": "every", "predicate": "sleep"},
                 {"t": "witness", "id": "x1", "kind": "barn"},
                 {"t": "activity", "id": "v1", "verb": "sleep", "actor": "@q1", "tense": "past"},
                 {"t": "location", "id": "l1", "event": "@v1", "place": "@x1", "head": "Location", "preposition": "in"},
                 {"t": "generic", "id": "r1", "ranges": ["@q1"], "over": ["@v1"]}]
        iatoms = atoms_of(E.emit({"id": "i", "instances": indef}, CATALOG)["statements"])
        self.assertTrue(any("(Member (sk_barn $x) barn)" in a and "(Location (sk_sleep $x) (sk_barn $x))" in a for a in iatoms))
        with self.assertRaises(E.EmitError):                                        # an attachment needs its head
            E.emit({"id": "b", "instances": [{"t": "location", "id": "l1", "event": "laugh", "place": "barn",
                                              "head": "Location", "preposition": "in"}]}, CATALOG)

    def test_yaml_booleans_are_refused_where_words_belong(self):
        bad = [{"t": "witness", "id": "x1", "kind": "ledger", "definite": True},
               {"t": "witness", "id": "x2", "kind": "workbench", "definite": True},
               {"t": "locative", "id": "l1", "thing": "@x1", "place": "@x2", "head": True, "preposition": True, "tense": "present"}]
        with self.assertRaises(E.EmitError) as cm:
            E.emit({"id": "b", "instances": bad}, CATALOG)
        self.assertTrue(any("boolean where a word is expected" in p for p in cm.exception.args[0]))

    def test_time_attaches_names_are_constants_and_eventive_witnesses_are_events(self):
        def example(tid, text):
            t = CATALOG[tid]
            return next(e for s in ("shown", "held_out") for e in t["examples"][s] if e["text"] == text)
        deictic = E.emit({"id": "a", "instances": [dict(i) for i in example("time", "Yusra laughed yesterday.")["instances"]]}, CATALOG)
        datoms = atoms_of(deictic["statements"])
        self.assertIn("(Time sk_laugh_1 sk_time_1)", datoms)
        self.assertIn("(BeforeBy sk_time_1 sk_now_1 1 day)", datoms)                # a deictic is an offset from the anchor
        self.assertTrue({"(: sk_now_1 TimeTerm)", "(: day Class)"} <= set(deictic["declarations"]))
        dated = E.emit({"id": "d", "instances": [dict(i) for i in example("time", "Lamine baked bread today.")["instances"]],
                        "reference_time": "2026-10-18"}, CATALOG)
        self.assertTrue({"(BeforeBy sk_time_1 sk_now_1 0 day)", "(Day sk_now_1 18)", "(Weekday sk_now_1 sunday)"} <= set(atoms_of(dated["statements"])))
        named = E.emit({"id": "n", "instances": [dict(i) for i in example("time", "Ottoline sang at dawn.")["instances"]]}, CATALOG)
        self.assertIn("(Time sk_sing_1 dawn)", atoms_of(named["statements"]))        # a named time is its own constant
        self.assertIn("(: dawn TimeTerm)", named["declarations"])
        self.assertNotIn("(: sk_now_1 TimeTerm)", named["declarations"])             # no anchor conjured for a named time
        neg = E.emit({"id": "n", "instances": example("time", "Teodor did not arrive in 2019.")["instances"]}, CATALOG)
        natoms = atoms_of(neg["statements"])
        self.assertEqual(sum(a.startswith("(Not (And") and "(Time sk_arrive_1 sk_time_1)" in a and "(Year sk_time_1 2019)" in a for a in natoms), 1)
        self.assertFalse(any(a.startswith("(Time") or a.startswith("(Year") for a in natoms))
        audit = E.emit({"id": "e", "instances": example("time", "The audit was on Monday.")["instances"]}, CATALOG)
        aatoms = atoms_of(audit["statements"])
        self.assertIn("(Past sk_audit_1)", aatoms)
        self.assertIn("(Weekday sk_time_1 monday)", aatoms)
        self.assertTrue({"(: sk_audit_1 Entity)", "(: sk_audit_1 Event)"} <= set(audit["declarations"]))
        twice = [{"t": "named-entity", "id": "n1", "name": "Yusra"},
                 {"t": "activity", "id": "v1", "verb": "laugh", "actor": "@n1", "tense": "past"},
                 {"t": "activity", "id": "v2", "verb": "sing", "actor": "@n1", "tense": "past"},
                 {"t": "time", "id": "t1", "event": "@v1", "name": "yesterday"},
                 {"t": "time", "id": "t2", "event": "@v2", "name": "yesterday"}]
        tatoms = atoms_of(E.emit({"id": "t", "instances": twice}, CATALOG)["statements"])
        self.assertIn("(Time sk_laugh_1 yesterday)", tatoms)
        self.assertIn("(Time sk_sing_1 yesterday)", tatoms)                        # one constant, not yesterday_2

    def test_mentions_are_rigid_and_coref_links_are_flat(self):
        ex = next(e for e in CATALOG["coref"]["examples"]["held_out"] if e["text"] == "Yusra baked a loaf. She did not eat it.")
        out = E.emit({"id": "c", "instances": ex["instances"]}, CATALOG)
        atoms = atoms_of(out["statements"])
        self.assertIn("(Coref sk_she_1 sk_yusra_1)", atoms)
        self.assertIn("(Coref sk_it_1 sk_loaf_1)", atoms)
        self.assertIn("(Member sk_loaf_1 loaf)", atoms)                               # the loaf, mentioned by the link, stays flat
        self.assertEqual(sum(a.startswith("(Not (And (Member sk_eat_1 eat) (Agent sk_eat_1 sk_she_1) (Patient sk_eat_1 sk_it_1)") for a in atoms), 1)
        self.assertEqual(sum(a.startswith("(Not") for a in atoms), 1)
        strengths = {d["term"]: s for d, s in zip(out["detail"], out["statements"]) if d["term"].startswith("(Coref")}
        self.assertTrue(all("(STV 0.99 0.9)" in s for s in strengths.values()))        # certain -> 0.99
        two = next(e for e in CATALOG["coref"]["examples"]["held_out"] if e["text"] == "Teodor and Lamine arrived. He laughed.")
        two_out = E.emit({"id": "t", "instances": two["instances"]}, CATALOG)
        self.assertEqual(sum("(STV 0.5 0.9)" in s and "(Coref sk_he_1" in s for s in two_out["statements"]), 2)   # unsure -> 0.5 each

    def test_modal_scopes_over_the_clause(self):
        ex = next(e for _, _, e in all_examples() if e["text"] == "Lamine might lend Ottoline the trowel.")
        out = E.emit({"id": "mod", "instances": ex["instances"]}, CATALOG)
        atoms = atoms_of(out["statements"])
        might = [a for a in atoms if a.startswith("(Might ")]
        self.assertEqual(len(might), 1, atoms)
        self.assertNotIn("(Past", might[0])                            # present tense emits nothing
        self.assertNotIn("(Member sk_trowel_1 trowel)", might[0])      # a definite witness is presupposed: top level
        self.assertIn("(Member sk_trowel_1 trowel)", atoms)

    def test_present_emits_no_tense_and_progressive_emits_ongoing(self):
        ex = next(e for _, _, e in all_examples() if e["text"] == "Ottoline is sending the quilt.")
        atoms = atoms_of(E.emit({"id": "prog", "instances": ex["instances"]}, CATALOG)["statements"])
        self.assertIn("(Ongoing sk_send_1)", atoms)
        self.assertFalse(any(a.startswith("(Past ") or a.startswith("(Future ") for a in atoms))

    def test_degree_asserts_the_positive_only_where_the_text_does(self):
        """An intensifier keeps the property asserted beside its degree; an approximator or a
        comparison class leaves only the degree; both together record both and no positive; a
        property graded inside a noun phrase has no tense and still renders flat (the default of a
        slot that only ``when`` clauses mention is applied); a degree needs a word or a class."""
        def degree(**slots):
            inst = [{"t": "witness", "id": "x1", "kind": "ladder", "definite": True},
                    dict({"t": "degree", "id": "d1", "bearer": "@x1", "scale": "tall"}, **slots)]
            return E.emit({"id": "d", "instances": inst}, CATALOG)
        very = degree(level="very", tense="present")
        self.assertIn("(Member sk_ladder_1 tall)", atoms_of(very["statements"]))
        self.assertIn("(Degree sk_ladder_1 tall very)", atoms_of(very["statements"]))
        self.assertIn("(: very Level)", very["declarations"])
        almost = atoms_of(degree(level="almost", tense="past")["statements"])
        self.assertIn("(Past (Degree sk_ladder_1 tall almost))", almost)
        self.assertFalse(any("(Member sk_ladder_1 tall)" in a for a in almost))
        kind = atoms_of(degree(for_kind="stepladder", tense="present")["statements"])
        self.assertIn("(Degree sk_ladder_1 tall (forKind stepladder))", kind)
        self.assertFalse(any("(Member sk_ladder_1 tall)" in a for a in kind))
        both = atoms_of(degree(level="very", for_kind="stepladder", tense="present")["statements"])
        self.assertIn("(Degree sk_ladder_1 tall very)", both)
        self.assertIn("(Degree sk_ladder_1 tall (forKind stepladder))", both)
        self.assertFalse(any("(Member sk_ladder_1 tall)" in a for a in both))
        attributive = atoms_of(degree(level="very")["statements"])
        self.assertIn("(Member sk_ladder_1 tall)", attributive)
        self.assertIn("(Degree sk_ladder_1 tall very)", attributive)
        with self.assertRaises(E.EmitError) as cm:
            degree(tense="present")
        self.assertTrue(any("at least one of level, for_kind" in p for p in cm.exception.args[0]))

    def test_extent_attaches_to_its_event(self):
        inst = [{"t": "named-entity", "id": "n1", "name": "Lamine"},
                {"t": "motion", "id": "m1", "verb": "move", "mover": "@n1", "tense": "past"},
                {"t": "extent", "id": "a1", "event": "@m1", "level": "barely"},
                {"t": "negation", "id": "s1", "over": ["@m1"]}]
        out = E.emit({"id": "e", "instances": inst}, CATALOG)
        atoms = atoms_of(out["statements"])
        self.assertEqual(sum(a.startswith("(Not (And") and "(Extent sk_move_1 barely)" in a for a in atoms), 1)
        self.assertFalse(any(a.startswith("(Extent") for a in atoms))
        self.assertIn("(: barely Level)", out["declarations"])

    def test_malformed_instances_are_refused(self):
        bad = [{"t": "transfer", "id": "e1", "verb": "give", "giver": "@n9", "object": "x", "tense": "past"}]
        with self.assertRaises(E.EmitError) as cm:
            E.emit({"id": "bad", "instances": bad}, CATALOG)
        self.assertTrue(any("unknown instance @n9" in p for p in cm.exception.args[0]))
        bad2 = [{"t": "transfer", "id": "e1", "verb": "give", "giver": "bob", "object": "x", "tense": "sometime"}]
        with self.assertRaises(E.EmitError):
            E.emit({"id": "bad2", "instances": bad2}, CATALOG)


if __name__ == "__main__":
    unittest.main(verbosity=1)
