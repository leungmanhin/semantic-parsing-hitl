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
        slots = {"level": {"type": "lemma", "class": "Level"}, "for_class": {"type": "lemma", "class": "Class"},
                 "tense": {"type": "enum", "values": ["past", "present"]}, "definite": {"type": "bool"}}
        self.assertEqual(CAT.check_when("not for_class and level != almost and tense == past or definite == true", slots), [])
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
        self.assertTrue(all(st.endswith("(STV 0.9 0.7))") for st in stmts("Ferrets are curious.")))   # bare: no proportion stated
        quant = stmts("All ferrets are curious.")
        self.assertIn("(: k1_inheritance (Inheritance ferret curious) (STV 1.0 0.9))", quant)
        self.assertFalse(any("QuantifierPhrase" in st for st in quant))       # the word stays in the instance record
        neg = stmts("Ferrets are not rodents.")
        self.assertEqual(len(neg), 1)
        self.assertTrue(neg[0].startswith("(: s1_not (Not (Inheritance ferret rodent))") and neg[0].endswith("(STV 1.0 0.99))"))
        self.assertTrue(stmts("Ferrets sleep.")[0].endswith("(STV 0.9 0.7))"))                        # a bare generic rule
        self.assertTrue(stmts("Most students laugh.")[0].endswith("(STV 0.9 0.9))"))                  # an explicit quantifier

    def test_scope_atoms_inherit_the_truth_value_of_their_content(self):
        """A negation or a modal over one statement carries that statement's truth value (the
        operand's dial survives the operator); over an event bundle, or over several statements,
        the default stands."""
        empirical = [{"t": "class-statement", "id": "k1", "subject": "ferret", "predicate": "curious", "form": "adjective",
                      "definitional": False, "tense": "present"}, {"t": "negation", "id": "s1", "over": ["@k1"]}]
        self.assertEqual(E.emit({"id": "t", "instances": empirical}, CATALOG)["statements"],
                         ["(: s1_not (Not (Inheritance ferret curious)) (STV 0.9 0.7))"])
        most = [dict(empirical[0], quantifier="most"), empirical[1]]
        out = E.emit({"id": "t", "instances": most}, CATALOG)["statements"]
        self.assertEqual(out, ["(: s1_not (Not (Inheritance ferret curious)) (STV 0.9 0.9))"])   # no companion atom
        modal = [{"t": "class-property", "id": "k1", "subject": "newt", "property": "endangered", "tense": "present"},
                 {"t": "modal", "id": "s1", "over": ["@k1"], "head": "Might", "surface": "might"}]
        self.assertEqual(E.emit({"id": "t", "instances": modal}, CATALOG)["statements"],
                         ["(: s1_might (Might (ClassProperty newt endangered)) (STV 1.0 0.9))"])
        nested = empirical + [{"t": "modal", "id": "s2", "over": ["@s1"], "head": "Might", "surface": "might"}]
        self.assertTrue(E.emit({"id": "t", "instances": nested}, CATALOG)["statements"][0].endswith("(STV 0.9 0.7))"))
        event = [{"t": "named-entity", "id": "n1", "name": "Yusra"},
                 {"t": "activity", "id": "v1", "verb": "laugh", "actor": "@n1", "tense": "past"},
                 {"t": "negation", "id": "s1", "over": ["@v1"]}]
        self.assertTrue(E.emit({"id": "t", "instances": event}, CATALOG)["statements"][-1].endswith("(STV 1.0 0.99))"))

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
        self.assertFalse(any("QuantifierPhrase" in st for st in every))       # the word stays in the range instance
        self.assertTrue(next(st for st in stmts("Few ferrets slept.") if "Implication" in st).endswith("(STV 0.1 0.9))"))
        self.assertTrue(next(st for st in stmts("No ferret slept.") if "Implication" in st).endswith("(STV 0.0 0.9))"))
        bare = stmts("Ferrets sleep.")
        self.assertEqual(len(bare), 1)
        self.assertTrue(bare[0].endswith("(STV 0.9 0.7))") and "(Past" not in bare[0])          # a bare generic: confidence 0.7
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
        lists = {"symmetric": ["married", "cousin"]}                      # a list of the template's lexicon
        self.assertTrue(E.holds("relation in symmetric", {"relation": "married"}, lists))
        self.assertFalse(E.holds("relation in symmetric", {"relation": "depend"}, lists))
        self.assertTrue(E.holds("relation not in symmetric", {"relation": "depend"}, lists))
        self.assertFalse(E.holds("relation in symmetric", {"relation": "married"}))         # no lexicon: no membership

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
        indef = [{"t": "range", "id": "q1", "class": "ferret", "quantifier": "every", "predicate": "sleep"},
                 {"t": "witness", "id": "x1", "class": "barn"},
                 {"t": "activity", "id": "v1", "verb": "sleep", "actor": "@q1", "tense": "past"},
                 {"t": "location", "id": "l1", "event": "@v1", "place": "@x1", "head": "Location", "preposition": "in"},
                 {"t": "generic", "id": "r1", "ranges": ["@q1"], "over": ["@v1"]}]
        iatoms = atoms_of(E.emit({"id": "i", "instances": indef}, CATALOG)["statements"])
        self.assertTrue(any("(Member (sk_barn $x) barn)" in a and "(Location (sk_sleep $x) (sk_barn $x))" in a for a in iatoms))
        with self.assertRaises(E.EmitError):                                        # an attachment needs its head
            E.emit({"id": "b", "instances": [{"t": "location", "id": "l1", "event": "laugh", "place": "barn",
                                              "head": "Location", "preposition": "in"}]}, CATALOG)

    def test_yaml_booleans_are_refused_where_words_belong(self):
        bad = [{"t": "witness", "id": "x1", "class": "ledger", "definite": True},
               {"t": "witness", "id": "x2", "class": "workbench", "definite": True},
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

    def test_a_prospective_aspect_marks_the_event_upcoming(self):
        """about_to / due_to on a predication emit (Prospective e) beside the clause's tense: none
        for a present matrix, Past for a past one; a simple aspect emits no mark."""
        out = E.emit({"id": "p", "instances": [{"t": "named-entity", "id": "n1", "name": "Yusra"},
                                                {"t": "motion", "id": "m1", "verb": "leave", "mover": "@n1", "tense": "present", "aspect": "about_to"}]}, CATALOG)
        atoms = atoms_of(out["statements"])
        self.assertIn("(Prospective sk_leave_1)", atoms)
        self.assertFalse(any(a.startswith("(Past ") or a.startswith("(Future ") for a in atoms))
        out = E.emit({"id": "p", "instances": [{"t": "named-entity", "id": "n1", "name": "Lamine"},
                                                {"t": "activity", "id": "v1", "verb": "sing", "actor": "@n1", "tense": "past", "aspect": "due_to"}]}, CATALOG)
        atoms = atoms_of(out["statements"])
        self.assertIn("(Prospective sk_sing_1)", atoms)
        self.assertIn("(Past sk_sing_1)", atoms)
        out = E.emit({"id": "p", "instances": [{"t": "named-entity", "id": "n1", "name": "Lamine"},
                                                {"t": "activity", "id": "v1", "verb": "sing", "actor": "@n1", "tense": "past"}]}, CATALOG)
        self.assertFalse(any("Prospective" in a for a in atoms_of(out["statements"])))

    def test_degree_asserts_the_positive_only_where_the_text_does(self):
        """An intensifier keeps the property asserted beside its degree; an approximator or a
        comparison class leaves only the degree; both together record both and no positive; a
        property graded inside a noun phrase has no tense and still renders flat (the default of a
        slot that only ``when`` clauses mention is applied); a degree needs a word or a class."""
        def degree(**slots):
            inst = [{"t": "witness", "id": "x1", "class": "ladder", "definite": True},
                    dict({"t": "degree", "id": "d1", "bearer": "@x1", "scale": "tall"}, **slots)]
            return E.emit({"id": "d", "instances": inst}, CATALOG)
        very = degree(level="very", tense="present")
        self.assertIn("(Member sk_ladder_1 tall)", atoms_of(very["statements"]))
        self.assertIn("(Degree sk_ladder_1 tall very)", atoms_of(very["statements"]))
        self.assertIn("(: very Level)", very["declarations"])
        almost = atoms_of(degree(level="almost", tense="past")["statements"])
        self.assertIn("(Past (Degree sk_ladder_1 tall almost))", almost)
        self.assertFalse(any("(Member sk_ladder_1 tall)" in a for a in almost))
        kind = atoms_of(degree(for_class="stepladder", tense="present")["statements"])
        self.assertIn("(Degree sk_ladder_1 tall (forClass stepladder))", kind)
        self.assertFalse(any("(Member sk_ladder_1 tall)" in a for a in kind))
        both = atoms_of(degree(level="very", for_class="stepladder", tense="present")["statements"])
        self.assertIn("(Degree sk_ladder_1 tall very)", both)
        self.assertIn("(Degree sk_ladder_1 tall (forClass stepladder))", both)
        self.assertFalse(any("(Member sk_ladder_1 tall)" in a for a in both))
        attributive = atoms_of(degree(level="very")["statements"])
        self.assertIn("(Member sk_ladder_1 tall)", attributive)
        self.assertIn("(Degree sk_ladder_1 tall very)", attributive)
        with self.assertRaises(E.EmitError) as cm:
            degree(tense="present")
        self.assertTrue(any("at least one of level, for_class" in p for p in cm.exception.args[0]))

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

    def test_imperative_seals_the_command_and_nests_a_negation(self):
        """A directive seals the commanded clause tenseless and actorless; a negative imperative is
        the directive over the negation; a vocative's name stays at the top level while its Agent
        role is sealed; an indefinite object lives only inside the directive."""
        inst = [{"t": "named-entity", "id": "n1", "name": "Lamine"},
                {"t": "witness", "id": "x1", "class": "ladder"},
                {"t": "motion", "id": "m1", "verb": "bring", "mover": "@n1", "moved": "@x1", "tense": "present"},
                {"t": "negation", "id": "s1", "over": ["@m1"]},
                {"t": "imperative", "id": "s2", "over": ["@s1"]}]
        atoms = atoms_of(E.emit({"id": "i", "instances": inst}, CATALOG)["statements"])
        self.assertIn('(Name sk_lamine_1 "Lamine")', atoms)
        sealed = [a for a in atoms if a.startswith("(Directive (Not (And")]
        self.assertEqual(len(sealed), 1)
        self.assertIn("(Agent sk_bring_1 sk_lamine_1)", sealed[0])
        self.assertIn("(Member sk_ladder_1 ladder)", sealed[0])
        self.assertFalse(any(a.startswith("(Member sk_ladder_1") or a.startswith("(Not") or "Past" in a for a in atoms))

    def test_complement_verbs_seal_and_mark_their_implication(self):
        """A control verb seals its complement as the Theme and asserts nothing about it; the
        verb's implication is a marker on the matrix event (Entails / Precludes) for the
        background rules, and the marker sits inside a negation over the matrix clause."""
        def control(verb, implication, negated=False):
            inst = [{"t": "named-entity", "id": "n1", "name": "Lamine"},
                    {"t": "witness", "id": "x1", "class": "shed", "definite": True},
                    {"t": "change-of-state", "id": "c1", "verb": "open", "agent": "@n1", "undergoer": "@x1", "tense": "present"},
                    {"t": "control", "id": "e1", "verb": verb, "subject": "@n1", "complement": ["@c1"],
                     "implication": implication, "tense": "past"}]
            if negated:
                inst.append({"t": "negation", "id": "s1", "over": ["@e1"]})
            return atoms_of(E.emit({"id": "c", "instances": inst}, CATALOG)["statements"])
        sealed = "(Theme sk_try_1 (And (Member sk_open_1 open) (Agent sk_open_1 sk_lamine_1) (Patient sk_open_1 sk_shed_1)))"
        none = control("try", "none")
        self.assertIn(sealed, none)
        self.assertFalse(any(a.startswith(("(Member sk_open_1", "(Entails", "(Precludes", "(Not")) for a in none))
        positive = control("manage", "positive")
        self.assertIn("(Entails sk_manage_1)", positive)
        self.assertFalse(any(a.startswith(("(Member sk_open_1", "(Not")) for a in positive))     # nothing flat: the rule derives it
        negative = control("fail", "negative")
        self.assertIn("(Precludes sk_fail_1)", negative)
        self.assertFalse(any(a.startswith(("(Member sk_open_1", "(Not")) for a in negative))
        denied = control("manage", "positive", negated=True)
        self.assertFalse(any(a.startswith("(Entails") for a in denied))                         # the marker is inside the Not
        self.assertEqual(sum(a.startswith("(Not (And (Member sk_manage_1 manage)") and "(Entails sk_manage_1)" in a for a in denied), 1)
        self.assertIn("(Member sk_shed_1 shed)", denied)                                          # the definite shed stays presupposed

    def test_links_relate_event_symbols_and_a_purpose_seals_its_aim(self):
        """A link is one top-level atom over the two clauses' event symbols, whatever scope a clause
        sits in; a purpose seals the aim as one term, its indefinite inside, nothing asserted."""
        inst = [{"t": "named-entity", "id": "n1", "name": "Lamine"},
                {"t": "witness", "id": "x1", "class": "ferret", "definite": True},
                {"t": "activity", "id": "v1", "verb": "sing", "actor": "@n1", "tense": "past"},
                {"t": "activity", "id": "v2", "verb": "sleep", "actor": "@x1", "tense": "past"},
                {"t": "negation", "id": "s1", "over": ["@v2"]},
                {"t": "link", "id": "k1", "head": "Because", "main": "@v2", "sub": "@v1"}]
        atoms = atoms_of(E.emit({"id": "l", "instances": inst}, CATALOG)["statements"])
        self.assertIn("(Because sk_sleep_1 sk_sing_1)", atoms)
        self.assertEqual(sum(a.startswith("(Not (And (Member sk_sleep_1 sleep)") for a in atoms), 1)
        self.assertIn("(Past sk_sing_1)", atoms)
        aim = [{"t": "named-entity", "id": "n1", "name": "Lamine"},
               {"t": "witness", "id": "x1", "class": "spindle"},
               {"t": "activity", "id": "v1", "verb": "work", "actor": "@n1", "tense": "past"},
               {"t": "acquisition", "id": "e1", "verb": "buy", "acquirer": "@n1", "object": "@x1", "tense": "present"},
               {"t": "purpose", "id": "k1", "head": "To", "action": "@v1", "aim": ["@e1"]}]
        out = E.emit({"id": "p", "instances": aim}, CATALOG)
        patoms = atoms_of(out["statements"])
        sealed = [a for a in patoms if a.startswith("(To sk_work_1 (And")]
        self.assertEqual(len(sealed), 1)
        self.assertIn("(Member sk_spindle_1 spindle)", sealed[0])
        self.assertFalse(any(a.startswith(("(Member sk_buy_1", "(Member sk_spindle_1", "(Theme sk_buy_1")) for a in patoms))
        self.assertIn("(Past sk_work_1)", patoms)
        with self.assertRaises(E.EmitError):                                          # a link needs two event endpoints
            E.emit({"id": "b", "instances": [{"t": "link", "id": "k1", "head": "Because", "main": "sleep", "sub": "@v9"}]}, CATALOG)

    def test_an_attachment_is_never_listed_in_a_scope(self):
        """A manner, a location or a purpose follows its head into a negation or a modal; listing
        it in the scope's ``over`` is refused (it would render twice)."""
        inst = [{"t": "named-entity", "id": "n1", "name": "Lamine"},
                {"t": "activity", "id": "v1", "verb": "work", "actor": "@n1", "tense": "present"},
                {"t": "manner", "id": "a1", "event": "@v1", "manner": "hard"},
                {"t": "modal", "id": "s1", "over": ["@v1", "@a1"], "head": "Might", "surface": "might"}]
        with self.assertRaises(E.EmitError) as cm:
            E.emit({"id": "a", "instances": inst}, CATALOG)
        self.assertTrue(any("an attachment" in p for p in cm.exception.args[0]))
        inst[-1]["over"] = ["@v1"]
        atoms = atoms_of(E.emit({"id": "a", "instances": inst}, CATALOG)["statements"])
        self.assertEqual(sum(a.count("(Manner sk_work_1 hard)") for a in atoms), 1)

    def test_a_referents_attachment_follows_it_into_a_scope(self):
        """A postmodifier on an indefinite does not anchor the indefinite at the top level: the
        noun phrase is bound inside the negation that mentions it, its phrase rendered with it;
        an oblique's indefinite object is bound inside the scope of the oblique's event."""
        book = [{"t": "named-entity", "id": "n1", "name": "Yusra"},
                {"t": "witness", "id": "x1", "class": "book"},
                {"t": "postmodifier", "id": "a1", "noun": "@x1", "head": "About", "object": "ferret"},
                {"t": "activity", "id": "v1", "verb": "read", "actor": "@n1", "patient": "@x1", "tense": "past"},
                {"t": "negation", "id": "s1", "over": ["@v1"]}]
        atoms = atoms_of(E.emit({"id": "b", "instances": book}, CATALOG)["statements"])
        self.assertFalse(any(a.startswith(("(Member sk_book_1", "(About sk_book_1")) for a in atoms))
        self.assertEqual(sum(a.startswith("(Not (And") and "(About sk_book_1 ferret)" in a and "(Member sk_book_1 book)" in a for a in atoms), 1)
        audit = [{"t": "named-entity", "id": "n1", "name": "Yusra"},
                 {"t": "witness", "id": "x1", "class": "audit"},
                 {"t": "activity", "id": "v1", "verb": "talk", "actor": "@n1", "tense": "past"},
                 {"t": "oblique", "id": "a1", "event": "@v1", "head": "About", "object": "@x1"},
                 {"t": "negation", "id": "s1", "over": ["@v1"]}]
        atoms = atoms_of(E.emit({"id": "o", "instances": audit}, CATALOG)["statements"])
        self.assertEqual(sum(a.startswith("(Not (And") and "(About sk_talk_1 sk_audit_1)" in a and "(Member sk_audit_1 audit)" in a for a in atoms), 1)
        self.assertFalse(any(a.startswith("(Member sk_audit_1") for a in atoms))

    def test_kind_level_claims(self):
        """A kind-level property is one opaque ClassProperty atom, a restricted one a ConditionalProperty
        atom with the restriction (a referent or a lemma), wrapped by tense; a member-level property
        under a condition is a rule whose premises are the kind and the condition predication over
        the range, with a quantifier word setting the strength beside its companion; a generic
        takes the same condition."""
        out = E.emit({"id": "t", "instances": [
            {"t": "class-property", "id": "k1", "subject": "heron", "property": "widespread", "tense": "present"}]}, CATALOG)
        self.assertEqual(out["statements"], ["(: k1_classproperty (ClassProperty heron widespread) (STV 1.0 0.9))"])
        out = E.emit({"id": "t", "instances": [
            {"t": "named-entity", "id": "n1", "name": "Norfolk"},
            {"t": "class-property", "id": "k1", "subject": "crane", "property": "common", "restriction": "@n1", "tense": "past"}]}, CATALOG)
        self.assertEqual(atoms_of(out["statements"]), ['(Name sk_norfolk_1 "Norfolk")', "(Past (ConditionalProperty crane common sk_norfolk_1))"])
        out = E.emit({"id": "t", "instances": [
            {"t": "class-property", "id": "k1", "subject": "crane", "property": "rare", "restriction": "winter", "tense": "present"}]}, CATALOG)
        self.assertEqual(atoms_of(out["statements"]), ["(ConditionalProperty crane rare winter)"])
        self.assertIn("(: winter Class)", out["declarations"])
        rule = [{"t": "range", "id": "q1", "class": "alloy", "quantifier": "all", "predicate": "brittle"},
                {"t": "copular", "id": "c1", "subject": "@q1", "predicate": "brittle", "form": "adjective", "tense": "present"},
                {"t": "copular", "id": "c2", "subject": "@q1", "predicate": "cold", "form": "adjective", "tense": "present"},
                {"t": "conditional-property", "id": "r1", "ranges": ["@q1"], "condition": ["@c2"], "over": ["@c1"]}]
        out = E.emit({"id": "t", "instances": rule}, CATALOG)
        self.assertEqual(out["statements"][0],
            "(: r1_implication (Implication (And (Member $x alloy) (Member $x cold)) (Member $x brittle)) (STV 1.0 0.9))")
        self.assertEqual(len(out["statements"]), 2)                                    # + the rule over the condition's state
        self.assertIn("(Holds $s (Member $x cold))", out["statements"][1])
        denied = rule[:3] + [{"t": "negation", "id": "s1", "over": ["@c1"]},
                             {"t": "conditional-property", "id": "r1", "ranges": ["@q1"], "condition": ["@c2"], "over": ["@s1"]}]
        out = E.emit({"id": "t", "instances": denied}, CATALOG)
        self.assertIn("(Implication (And (Member $x alloy) (Member $x cold)) (Not (Member $x brittle)))", atoms_of(out["statements"]))
        two = rule[:3] + [{"t": "copular", "id": "c3", "subject": "@q1", "predicate": "dry", "form": "adjective", "tense": "present"},
                          {"t": "conditional-property", "id": "r1", "ranges": ["@q1"], "condition": ["@c2", "@c3"], "over": ["@c1"]}]
        out = E.emit({"id": "t", "instances": two}, CATALOG)                      # a shape's conjunction absorbs the bundles
        self.assertIn("(Implication (And (Member $x alloy) (Member $x cold) (Member $x dry)) (Member $x brittle))", atoms_of(out["statements"]))
        out = E.emit({"id": "t", "instances": [
            {"t": "range", "id": "q1", "class": "ferret"},
            {"t": "activity", "id": "v1", "verb": "bite", "actor": "@q1", "tense": "present"},
            {"t": "copular", "id": "c1", "subject": "@q1", "predicate": "cornered", "form": "adjective", "tense": "present"},
            {"t": "generic", "id": "r1", "ranges": ["@q1"], "condition": ["@c1"], "over": ["@v1"]}]}, CATALOG)
        self.assertEqual(atoms_of(out["statements"])[0],
                         "(Implication (And (Member $x ferret) (Member $x cornered)) (And (Member (sk_bite $x) bite) (Agent (sk_bite $x) $x)))")
        self.assertEqual(len(out["statements"]), 2)                                    # + the rule over the condition's state

    def test_focus_is_a_top_level_atom_and_negation_targets_the_focus_or_the_prejacent(self):
        """A focus particle is one top-level atom over the clause's event; "not only" negates the
        focus instance and leaves the prejacent asserted (a predication is never pulled into a scope
        by the atom that names it); "only … not" negates the clause with the atom outside; a
        verb-phrase focus names the verb lemma."""
        base = [{"t": "named-entity", "id": "n1", "name": "Yusra"},
                {"t": "activity", "id": "v1", "verb": "laugh", "actor": "@n1", "tense": "past"}]
        only = base + [{"t": "focus", "id": "f1", "head": "Only", "filler": "@n1", "event": "@v1", "surface": "only"}]
        atoms = atoms_of(E.emit({"id": "t", "instances": only}, CATALOG)["statements"])
        self.assertIn("(Only sk_yusra_1 sk_laugh_1)", atoms)
        self.assertIn("(Agent sk_laugh_1 sk_yusra_1)", atoms)
        notonly = only + [{"t": "negation", "id": "s1", "over": ["@f1"]}]
        atoms = atoms_of(E.emit({"id": "t", "instances": notonly}, CATALOG)["statements"])
        self.assertIn("(Not (Only sk_yusra_1 sk_laugh_1))", atoms)
        self.assertIn("(Past sk_laugh_1)", atoms)                                        # the prejacent stays asserted
        self.assertFalse(any(a.startswith("(Not (And") for a in atoms))
        onlynot = only + [{"t": "negation", "id": "s1", "over": ["@v1"]}]
        atoms = atoms_of(E.emit({"id": "t", "instances": onlynot}, CATALOG)["statements"])
        self.assertIn("(Only sk_yusra_1 sk_laugh_1)", atoms)                             # outside the denial
        self.assertTrue(any(a.startswith("(Not (And (Member sk_laugh_1 laugh)") for a in atoms))
        vp = base + [{"t": "focus", "id": "f1", "head": "Even", "filler": "laugh", "event": "@v1", "surface": "even"}]
        out = E.emit({"id": "t", "instances": vp}, CATALOG)
        self.assertIn("(Even laugh sk_laugh_1)", atoms_of(out["statements"]))
        self.assertIn("(: laugh Class)", out["declarations"])

    def test_a_norm_under_a_frequency_rule_seals_the_act_with_its_time(self):
        """A frequency whose ``over`` names a norm renders the rule's consequent as the norm over
        the act, with the within shape (the episode's time) inside the sealed act; the truth
        value is the norm's force and confidence; a plain frequency and a negation over a
        frequency are unchanged."""
        out = E.emit({"id": "n", "instances": [
            {"t": "named-entity", "id": "n1", "name": "Lamine"}, {"t": "witness", "id": "x1", "class": "shed", "definite": True},
            {"t": "activity", "id": "v1", "verb": "lock", "actor": "@n1", "patient": "@x1", "tense": "present"},
            {"t": "norm", "id": "s1", "over": ["@v1"], "kind": "obligation", "weak": True, "word": "should"},
            {"t": "range", "id": "q1", "class": "night", "quantifier": "every"},
            {"t": "frequency", "id": "f1", "occasion": ["@q1"], "over": ["@s1"], "every": 1, "word": "every night"}]}, CATALOG)
        rule = next(st for st in out["statements"] if "(Implication " in st)
        self.assertIn("(Implication (Member $x night) (Obligated (And (Member (sk_lock $x) lock) (Agent (sk_lock $x) sk_lamine_1) (Patient (sk_lock $x) sk_shed_1) (Time (sk_lock $x) $x))))", rule)
        self.assertTrue(rule.endswith("(STV 0.7 0.99))"), rule)                      # a weak norm's force, a norm's confidence
        self.assertNotIn("(Time", rule.split("(Obligated")[0])                        # the time sits inside the sealed act
        plain = E.emit({"id": "p", "instances": [
            {"t": "named-entity", "id": "n1", "name": "Yusra"}, {"t": "activity", "id": "v1", "verb": "swim", "actor": "@n1", "tense": "present"},
            {"t": "range", "id": "q1", "class": "morning", "quantifier": "every"},
            {"t": "frequency", "id": "f1", "occasion": ["@q1"], "over": ["@v1"], "every": 1, "word": "every morning"}]}, CATALOG)
        self.assertTrue(any(st.endswith("(Time (sk_swim $x) $x))) (STV 1.0 0.9))") for st in plain["statements"]), plain["statements"])

    def test_an_anchored_copular_clause_mints_the_state_of_the_fact_holding(self):
        """A copular or locative predication is a flat atom; when a time, a place, a duration, a
        relation, a link or a focus names it, the emitter mints the state of that fact holding
        (Holds state P) with the clause's tense on the state, and the attachment hangs on the
        state; a plain clause mints nothing; under negation the state and its attachment stay
        inside the bundle."""
        plain = E.emit({"id": "p", "instances": [{"t": "witness", "id": "x1", "class": "ladder", "definite": True},
                                                 {"t": "copular", "id": "c1", "subject": "@x1", "predicate": "crooked", "form": "adjective", "tense": "past"}]}, CATALOG)
        self.assertFalse(any("Holds" in st or "sk_crooked" in st for st in plain["statements"]), plain["statements"])
        anchored = E.emit({"id": "a", "instances": [{"t": "witness", "id": "x1", "class": "ladder", "definite": True},
                                                    {"t": "copular", "id": "c1", "subject": "@x1", "predicate": "crooked", "form": "adjective", "tense": "past"},
                                                    {"t": "time", "id": "t1", "weekday": "monday"},
                                                    {"t": "time-relation", "id": "r1", "event": "@c1", "reference": "@t1", "head": "End", "word": "until"}]}, CATALOG)
        terms = [T.split_statement(st)[1] for st in anchored["statements"]]
        self.assertIn(["Past", ["Member", "sk_ladder_1", "crooked"]], terms)                    # the flat atom stays the assertion
        self.assertIn(["Holds", "sk_crooked_1", ["Member", "sk_ladder_1", "crooked"]], terms)   # the state of the fact holding
        self.assertIn(["Past", "sk_crooked_1"], terms)                                           # its tense, as an event's
        self.assertIn(["End", "sk_crooked_1", "sk_time_1"], terms)                               # the relation on the state
        self.assertIn("(: sk_crooked_1 Event)", anchored["declarations"])
        denied = E.emit({"id": "d", "instances": [{"t": "witness", "id": "x1", "class": "ladder", "definite": True},
                                                  {"t": "copular", "id": "c1", "subject": "@x1", "predicate": "crooked", "form": "adjective", "tense": "past"},
                                                  {"t": "time", "id": "t1", "event": "@c1", "deictic": "yesterday", "anchor": "@now"},
                                                  {"t": "negation", "id": "s1", "over": ["@c1"]}]}, CATALOG)
        nots = [st for st in denied["statements"] if "(Not " in st]
        self.assertEqual(len(nots), 1, denied["statements"])
        self.assertIn("(Holds sk_crooked_1 (Member sk_ladder_1 crooked))", nots[0])              # the state inside the denial
        self.assertIn("(Time sk_crooked_1 sk_time_1)", nots[0])

    def test_anchored_graded_compared_classed_part_and_measured_clauses_mint_their_states(self):
        """The degree, comparative, class-statement, part-whole and measure predications mint the
        state of the fact holding on demand like the copular: nothing for a plain clause; when
        anchored, one state per predication with a Holds atom for each atom the text asserts
        (the degree's property and its degree; the degree alone under an approximator), the
        clause's tense on the state and the attachment on it."""
        def emitted(instances):
            r = E.emit({"id": "a", "instances": instances}, CATALOG)
            return [T.split_statement(st)[1] for st in r["statements"]], r
        barn = {"t": "witness", "id": "x1", "class": "barn", "definite": True}
        very_cold = {"t": "degree", "id": "d1", "bearer": "@x1", "scale": "cold", "level": "very", "tense": "past"}
        terms, r = emitted([barn, very_cold])
        self.assertFalse(any("Holds" in st or "sk_cold" in st for st in r["statements"]), r["statements"])   # a plain clause: no state
        terms, r = emitted([barn, very_cold, {"t": "time", "id": "t1", "event": "@d1", "deictic": "yesterday", "anchor": "@now"}])
        self.assertIn(["Past", ["Member", "sk_barn_1", "cold"]], terms)                              # the flat atoms stay
        self.assertIn(["Past", ["Degree", "sk_barn_1", "cold", "very"]], terms)
        self.assertIn(["Holds", "sk_cold_1", ["Member", "sk_barn_1", "cold"]], terms)                # one state, a Holds per asserted atom
        self.assertIn(["Holds", "sk_cold_1", ["Degree", "sk_barn_1", "cold", "very"]], terms)
        self.assertEqual(sum(1 for t in terms if t[0] == "Holds"), 2)
        self.assertIn(["Past", "sk_cold_1"], terms)                                                   # its tense, as an event's
        self.assertIn(["Time", "sk_cold_1", "sk_time_1"], terms)                                      # the time on the state
        self.assertIn("(: sk_cold_1 Event)", r["declarations"])
        terms, r = emitted([{"t": "witness", "id": "x1", "class": "thermos", "definite": True},
                            {"t": "degree", "id": "d1", "bearer": "@x1", "scale": "full", "level": "almost", "tense": "past"},
                            {"t": "time", "id": "t1", "hour": 12},
                            {"t": "time-relation", "id": "r1", "event": "@d1", "reference": "@t1", "head": "End", "word": "until"}])
        self.assertEqual([t for t in terms if t[0] == "Holds"],
                         [["Holds", "sk_full_1", ["Degree", "sk_thermos_1", "full", "almost"]]])    # an approximator: the degree alone
        self.assertIn(["End", "sk_full_1", "sk_time_1"], terms)
        terms, r = emitted([{"t": "named-entity", "id": "n1", "name": "Yusra"}, {"t": "named-entity", "id": "n2", "name": "Lamine"},
                            {"t": "comparative", "id": "c1", "subject": "@n1", "standard": "@n2", "scale": "tall", "relation": "less", "tense": "past"},
                            {"t": "time", "id": "t1", "year": 2019},
                            {"t": "time-relation", "id": "r1", "event": "@c1", "reference": "@t1", "head": "End", "word": "until"}])
        self.assertIn(["Holds", "sk_tall_1", ["More", "tall", "sk_lamine_1", "sk_yusra_1"]], terms)  # less: the pair swapped as in the flat atom
        self.assertIn(["Past", "sk_tall_1"], terms)
        self.assertIn(["End", "sk_tall_1", "sk_time_1"], terms)
        terms, r = emitted([{"t": "class-statement", "id": "k1", "subject": "heron", "predicate": "patient", "form": "adjective", "definitional": False, "tense": "present"},
                            {"t": "focus", "id": "f1", "head": "Only", "filler": "heron", "event": "@k1", "surface": "only"}])
        self.assertIn(["Holds", "sk_patient_1", ["Inheritance", "heron", "patient"]], terms)        # a class statement's state
        self.assertIn(["Only", "heron", "sk_patient_1"], terms)                                      # the particle on it, the class the filler
        self.assertNotIn(["Past", "sk_patient_1"], terms)
        terms, r = emitted([{"t": "named-entity", "id": "n1", "name": "Teodor"}, {"t": "witness", "id": "x1", "class": "guild", "definite": True},
                            {"t": "part-whole", "id": "w1", "part": "@n1", "whole": "@x1", "word": "member of", "tense": "past"},
                            {"t": "measure", "id": "m1", "event": "@w1", "head": "Measure", "dimension": "duration", "magnitude": 10, "unit": "year"}])
        self.assertIn(["Holds", "sk_part_1", ["PartOf", "sk_teodor_1", "sk_guild_1"]], terms)        # a part relation's state
        self.assertTrue(any("(Measure sk_part_1 duration 10 year)" in st for st in r["statements"]), r["statements"])
        terms, r = emitted([{"t": "named-entity", "id": "n1", "name": "Teodor"}, {"t": "witness", "id": "x1", "class": "sack", "definite": True},
                            {"t": "activity", "id": "v1", "verb": "rest", "actor": "@n1", "tense": "past"},
                            {"t": "measure", "id": "m1", "bearer": "@x1", "head": "Measure", "dimension": "weight", "magnitude": 40, "unit": "kilogram", "tense": "past"},
                            {"t": "link", "id": "k1", "head": "Because", "main": "@v1", "sub": "@m1"}])
        self.assertTrue(any("(Holds sk_weight_1 (Measure sk_sack_1 weight 40 kilogram))" in st for st in r["statements"]), r["statements"])
        self.assertIn(["Because", "sk_rest_1", "sk_weight_1"], terms)                                # the measure's state as the cause

    def test_a_stative_condition_yields_a_state_rule_beside_the_flat_one(self):
        """A rule whose condition is a stative predication (a copular, a locative …) is emitted
        twice: between the flat atoms, as before, and over the condition's STATE — the Holds
        binder as the variable, the consequence's state or event a skolem function of the rule's
        variables, placed During it; an eventive condition has no state rule; several conditions
        bind several states; a scoped consequence keeps the state and its During inside the
        operator."""
        def rules_of(instances):
            r = E.emit({"id": "a", "instances": instances}, CATALOG)
            return [st for st in r["statements"] if "Implication" in st], r
        rules, r = rules_of([{"t": "witness", "id": "x1", "class": "barn", "definite": True}, {"t": "witness", "id": "x2", "class": "door", "definite": True},
                             {"t": "copular", "id": "c1", "subject": "@x1", "predicate": "cold", "form": "adjective", "tense": "present"},
                             {"t": "copular", "id": "c2", "subject": "@x2", "predicate": "open", "form": "adjective", "tense": "present"},
                             {"t": "conditional", "id": "r1", "condition": ["@c2"], "over": ["@c1"], "word": "when"}])
        self.assertEqual(len(rules), 2, rules)
        self.assertIn("(Implication (Member sk_door_1 open) (Member sk_barn_1 cold))", rules[0])              # the flat rule, as before
        self.assertIn("(Implication (Holds $s (Member sk_door_1 open)) (And (Holds (sk_cold $s) (Member sk_barn_1 cold)) (During (sk_cold $s) $s)))", rules[1])
        self.assertIn("(: sk_cold (-> Atom Event))", r["declarations"])
        self.assertFalse(any("sk_cold_1" in st for st in r["statements"]))                                   # no state minted outside the rule
        rules, r = rules_of([{"t": "range", "id": "q1", "class": "heron"}, {"t": "witness", "id": "x1", "class": "weather", "definite": True},
                             {"t": "copular", "id": "c1", "subject": "@q1", "predicate": "patient", "form": "adjective", "tense": "present"},
                             {"t": "copular", "id": "c2", "subject": "@x1", "predicate": "sunny", "form": "adjective", "tense": "present"},
                             {"t": "conditional", "id": "r1", "ranges": ["@q1"], "condition": ["@c2"], "over": ["@c1"], "generic": True}])
        self.assertIn("(Implication (And (Member $x heron) (Holds $s (Member sk_weather_1 sunny))) (And (Holds (sk_patient $x $s) (Member $x patient)) (During (sk_patient $x $s) $s)))", rules[1])
        rules, r = rules_of([{"t": "range", "id": "q1", "class": "clay"},
                             {"t": "copular", "id": "c1", "subject": "@q1", "predicate": "soft", "form": "adjective", "tense": "present"},
                             {"t": "copular", "id": "c2", "subject": "@q1", "predicate": "wet", "form": "adjective", "tense": "present"},
                             {"t": "conditional-property", "id": "r1", "ranges": ["@q1"], "condition": ["@c2"], "over": ["@c1"]}])
        self.assertIn("(Implication (And (Member $x clay) (Holds $s (Member $x wet))) (And (Holds (sk_soft $x $s) (Member $x soft)) (During (sk_soft $x $s) $s)))", rules[1])
        rules, r = rules_of([{"t": "range", "id": "q1", "class": "ferret"},
                             {"t": "copular", "id": "c2", "subject": "@q1", "predicate": "cornered", "form": "adjective", "tense": "present"},
                             {"t": "activity", "id": "v1", "verb": "bite", "actor": "@q1", "tense": "present"},
                             {"t": "generic", "id": "r1", "ranges": ["@q1"], "condition": ["@c2"], "over": ["@v1"]}])
        self.assertIn("(Implication (And (Member $x ferret) (Holds $s (Member $x cornered))) (And (Member (sk_bite $x $s) bite) (Agent (sk_bite $x $s) $x) (During (sk_bite $x $s) $s)))", rules[1])
        rules, r = rules_of([{"t": "named-entity", "id": "n1", "name": "Teodor"}, {"t": "named-entity", "id": "n2", "name": "Ottoline"},
                             {"t": "motion", "id": "m1", "verb": "arrive", "mover": "@n1", "tense": "present"},
                             {"t": "motion", "id": "m2", "verb": "leave", "mover": "@n2", "tense": "present"},
                             {"t": "conditional", "id": "r1", "condition": ["@m1"], "over": ["@m2"]}])
        self.assertEqual(len(rules), 1, rules)                                                                # an eventive condition: no state rule
        rules, r = rules_of([{"t": "range", "id": "q1", "class": "heron"},
                             {"t": "copular", "id": "c1", "subject": "@q1", "predicate": "patient", "form": "adjective", "tense": "present"},
                             {"t": "copular", "id": "c2", "subject": "@q1", "predicate": "healthy", "form": "adjective", "tense": "present"},
                             {"t": "copular", "id": "c3", "subject": "@q1", "predicate": "warm", "form": "adjective", "tense": "present"},
                             {"t": "conditional-property", "id": "r1", "ranges": ["@q1"], "condition": ["@c2", "@c3"], "over": ["@c1"]}])
        self.assertIn("(Holds $s (Member $x healthy)) (Holds $s2 (Member $x warm))", rules[1])               # two conditions, two states
        self.assertIn("(During (sk_patient $x $s $s2) $s) (During (sk_patient $x $s $s2) $s2)", rules[1])
        rules, r = rules_of([{"t": "range", "id": "q1", "class": "clay"},
                             {"t": "copular", "id": "c1", "subject": "@q1", "predicate": "soft", "form": "adjective", "tense": "present"},
                             {"t": "copular", "id": "c2", "subject": "@q1", "predicate": "dry", "form": "adjective", "tense": "present"},
                             {"t": "negation", "id": "s1", "over": ["@c1"]},
                             {"t": "conditional-property", "id": "r1", "ranges": ["@q1"], "condition": ["@c2"], "over": ["@s1"]}])
        self.assertIn("(Not (And (Holds (sk_soft $x $s) (Member $x soft)) (During (sk_soft $x $s) $s)))", rules[1])   # the denial keeps the state inside

    def test_a_narrowed_class_is_a_comparison_class_named_by_its_description(self):
        """A superlative or an ordinal whose noun phrase narrows its class (a place, an author or a
        whole listed in `within`; the witness's props or possessor; the predicative `props`)
        compares within a COMPARISON CLASS: a term built from the description, the same in two
        texts that say the same, a pronoun possessor replaced by its certain antecedent, defined by
        one rule per text; nothing narrowed, the class itself and no rule; an instance in `within`
        that says nothing of the subject is refused."""
        def run(insts, iid="a"):
            return atoms_of(E.emit({"id": iid, "instances": insts}, CATALOG)["statements"])
        def town(name):
            return [{"t": "named-entity", "id": "n1", "name": name}, {"t": "named-entity", "id": "n2", "name": "Calderwick"},
                    {"t": "locative", "id": "l1", "thing": "@n1", "place": "@n2", "head": "LocatedIn", "preposition": "in", "tense": "present"}]
        def rank(n, sid="s1", kind="ordinal", scale="tall", subject="@n1"):
            r = {"t": "superlative", "id": sid, "subject": subject, "scale": scale, "class": "weaver", "kind": kind,
                 "predicative": True, "tense": "present", "within": ["@l1"]}
            return dict(r, rank=n) if kind == "ordinal" else r
        term = "(Narrow weaver (LocatedIn sk_calderwick_1))"
        rule = f"(Implication (And (Member $y weaver) (LocatedIn $y sk_calderwick_1)) (Member $y {term}))"
        one, two = run(town("Bram") + [rank(2)]), run(town("Ines") + [rank(3)], "b")
        self.assertIn(f"(Ordinal sk_bram_1 2 tall {term})", one)
        self.assertIn(f"(Ordinal sk_ines_1 3 tall {term})", two)            # another text: the same term
        self.assertIn(rule, one)
        self.assertIn(rule, two)                                               # and the same defining rule
        both = run(town("Bram") + [rank(None, "s1", "most"), rank(None, "s2", "most", "old")])
        self.assertIn(f"(Most tall sk_bram_1 {term})", both)
        self.assertIn(f"(Most old sk_bram_1 {term})", both)
        self.assertEqual(sum(a.startswith("(Implication") for a in both), 1)   # one class, one definition
        pron = run([{"t": "named-entity", "id": "n1", "name": "Ottoline"}, {"t": "mention", "id": "m1", "word": "her"},
                    {"t": "coref", "id": "k1", "mention": "@m1", "antecedent": "@n1", "certainty": "certain"},
                    {"t": "witness", "id": "x1", "class": "album", "possessor": "@m1"},
                    {"t": "superlative", "id": "s1", "subject": "@x1", "scale": "album", "class": "album", "kind": "ordinal", "rank": 2}])
        album = "(Narrow album (Possession sk_ottoline_1))"
        self.assertIn(f"(Ordinal sk_album_1 2 {album} {album})", pron)         # a counted ordinal: the ordering is the class
        self.assertIn("(Possession sk_album_1 sk_her_1)", pron)                # the parse's own atom keeps the mention
        bare = run([{"t": "named-entity", "id": "n1", "name": "Bram"},
                    {"t": "superlative", "id": "s1", "subject": "@n1", "scale": "tall", "class": "weaver", "kind": "most", "predicative": True, "tense": "present"}])
        self.assertIn("(Most tall sk_bram_1 weaver)", bare)
        self.assertFalse(any("Implication" in a or "Narrow" in a for a in bare))
        with self.assertRaises(E.EmitError):                                   # within names an atom about someone else
            E.emit({"id": "c", "instances": town("Bram") + [{"t": "named-entity", "id": "n3", "name": "Ines"},
                                                           rank(2, subject="@n3")]}, CATALOG)

    def test_a_relation_and_a_dated_period_narrow_the_comparison_class(self):
        """The relatum of a relational class noun narrows the class as (Relation mayor X), its rule
        testing the relation state alone (no class atom on the member); a dated period narrows it
        as (Within (Century 17)), with no rule — no atom of a member shows a period — and the
        subject's membership stated instead; a symmetric relation's other bearer is the relatum."""
        def run(insts):
            return atoms_of(E.emit({"id": "a", "instances": insts}, CATALOG)["statements"])
        mayor = run([{"t": "named-entity", "id": "n1", "name": "Bram"}, {"t": "named-entity", "id": "n2", "name": "Calderwick"},
                     {"t": "stative-relation", "id": "p1", "relation": "mayor", "subject": "@n1", "object": "@n2", "preposition": "of", "tense": "past"},
                     {"t": "superlative", "id": "s1", "subject": "@n1", "scale": "mayor", "class": "mayor", "kind": "ordinal", "rank": 1,
                      "predicative": True, "tense": "past", "within": ["@p1"]}])
        term = "(Narrow mayor (Relation mayor sk_calderwick_1))"
        self.assertIn(f"(Past (Ordinal sk_bram_1 1 {term} {term}))", mayor)
        self.assertIn(f"(Implication (And (Member $s mayor) (Bearer $s $y) (Theme $s sk_calderwick_1)) (Member $y {term}))", mayor)
        period = run([{"t": "named-entity", "id": "n1", "name": "Bram"}, {"t": "time", "id": "t1", "century": 17},
                      {"t": "superlative", "id": "s1", "subject": "@n1", "scale": "fine", "class": "glazier", "kind": "most",
                       "predicative": True, "tense": "past", "within": ["@t1"]}])
        term = "(Narrow glazier (Within (Century 17)))"
        self.assertIn(f"(Past (Most fine sk_bram_1 {term}))", period)
        self.assertIn(f"(Member sk_bram_1 {term})", period)                 # stated: no rule could show it
        self.assertFalse(any(a.startswith("(Implication") for a in period))
        cousin = run([{"t": "named-entity", "id": "n1", "name": "Bram"}, {"t": "named-entity", "id": "n2", "name": "Ines"},
                      {"t": "stative-relation", "id": "p1", "relation": "cousin", "subject": "@n1", "object": "@n2", "tense": "present"},
                      {"t": "superlative", "id": "s1", "subject": "@n1", "scale": "old", "class": "cousin", "kind": "most",
                       "predicative": True, "tense": "present", "within": ["@p1"]}])
        self.assertIn("(Implication (And (Member $s cousin) (Bearer $s $y) (Bearer $s sk_ines_1)) "
                      "(Member $y (Narrow cousin (Relation cousin sk_ines_1))))", cousin)   # symmetric: the other bearer
        with self.assertRaises(E.EmitError):                                   # a time that names no period
            E.emit({"id": "b", "instances": [{"t": "named-entity", "id": "n1", "name": "Bram"}, {"t": "time", "id": "t1", "hour": 12},
                                             {"t": "superlative", "id": "s1", "subject": "@n1", "scale": "fine", "class": "glazier", "kind": "most",
                                              "predicative": True, "tense": "past", "within": ["@t1"]}]}, CATALOG)

    def test_an_alias_and_a_relative_clause_on_a_generic_subject(self):
        """An alias is a second Name of the same individual, its words never declared as a symbol;
        a relative clause on a generic subject is the rule's condition, its event a variable and an
        indefinite inside it a variable too, while a stative condition keeps its form."""
        r = E.emit({"id": "a", "instances": [{"t": "named-entity", "id": "n1", "name": "Ines", "aliases": ["Nell", "Nella"]}]}, CATALOG)
        atoms = atoms_of(r["statements"])
        self.assertIn('(Name sk_ines_1 "Ines")', atoms)
        self.assertIn('(Name sk_ines_1 "Nell")', atoms)
        self.assertIn('(Name sk_ines_1 "Nella")', atoms)
        self.assertFalse(any("Nell" in d for d in r["declarations"]))
        rule = atoms_of(E.emit({"id": "b", "instances": [
            {"t": "range", "id": "q1", "class": "potter", "quantifier": "every"}, {"t": "witness", "id": "x1", "class": "wheel"},
            {"t": "possession", "id": "e1", "verb": "own", "holder": "@q1", "possessed": "@x1", "tense": "present"},
            {"t": "activity", "id": "v1", "verb": "sing", "actor": "@q1", "tense": "present"},
            {"t": "generic", "id": "r1", "ranges": ["@q1"], "condition": ["@e1"], "over": ["@v1"]}]}, CATALOG)["statements"])
        self.assertEqual(rule, ["(Implication (And (Member $x potter) (Member $e own) (Holder $e $x) (Theme $e $y) (Member $y wheel)) "
                                "(And (Member (sk_sing $x $e) sing) (Agent (sk_sing $x $e) $x)))"])

    def test_a_relative_clause_narrows_the_comparison_class(self):
        """A relative clause listed in `within` narrows the class by what it says: a copular one by
        its property, an eventive one as (Event verb Role (Role2 filler) …) — an indefinite filler as
        (Some class) and a variable of that class in the rule, the clause's tense left out — so two
        texts saying the same give the same term."""
        def run(name, tense="present"):
            return atoms_of(E.emit({"id": name, "instances": [
                {"t": "named-entity", "id": "n1", "name": name}, {"t": "witness", "id": "x1", "class": "wheel"},
                {"t": "possession", "id": "e1", "verb": "own", "holder": "@n1", "possessed": "@x1", "tense": tense},
                {"t": "superlative", "id": "s1", "subject": "@n1", "scale": "old", "class": "potter", "kind": "most",
                 "predicative": True, "tense": "present", "within": ["@e1"]}]}, CATALOG)["statements"])
        term = "(Narrow potter (Event own Holder (Theme (Some wheel))))"
        one, two = run("Bram"), run("Ines", "past")
        self.assertIn(f"(Most old sk_bram_1 {term})", one)
        self.assertIn(f"(Most old sk_ines_1 {term})", two)                 # another text, another tense: the same class
        self.assertIn(f"(Implication (And (Member $y potter) (Member $e own) (Holder $e $y) (Theme $e $z1_1) (Member $z1_1 wheel)) "
                      f"(Member $y {term}))", one)
        self.assertIn("(Theme sk_own_1 sk_wheel_1)", one)                    # the clause itself stays asserted
        lamp = atoms_of(E.emit({"id": "c", "instances": [
            {"t": "witness", "id": "x1", "class": "lamp", "definite": True},
            {"t": "copular", "id": "c1", "subject": "@x1", "predicate": "broken", "form": "adjective", "tense": "past"},
            {"t": "superlative", "id": "s1", "subject": "@x1", "scale": "cheap", "class": "lamp", "kind": "most", "within": ["@c1"]}]},
            CATALOG)["statements"])
        self.assertIn("(Most cheap sk_lamp_1 (Narrow lamp (Member broken)))", lamp)

    def test_a_noun_before_a_noun_narrows_the_class_and_keeps_its_head(self):
        """A noun, a name or a year before the head narrows the head's class — (Narrow pilot (Mod
        harbour)), a name as its symbol, a year by its description — and a predicated class keeps its
        head beside it (a harbour pilot is a pilot), under the clause's tense; a class a rule or a
        class statement is ABOUT is the narrowed class alone; two modifiers sit in a fixed order."""
        def atoms(insts):
            return atoms_of(E.emit({"id": "m", "instances": insts}, CATALOG)["statements"])
        pilot = "(Narrow pilot (Mod harbour))"
        was = atoms([{"t": "named-entity", "id": "n1", "name": "Bram"},
                     {"t": "copular", "id": "c1", "subject": "@n1", "predicate": "pilot", "form": "noun", "tense": "past",
                      "mods": ["harbour"]}])
        self.assertIn(f"(Past (Member sk_bram_1 {pilot}))", was)
        self.assertIn("(Past (Member sk_bram_1 pilot))", was)                  # the head beside, under the same tense
        named = atoms([{"t": "named-entity", "id": "n1", "name": "Calderwick"},
                       {"t": "time", "id": "t1", "century": 18},
                       {"t": "witness", "id": "x1", "class": "quilt", "mods": ["@n1", "@t1", "wool"]}])
        self.assertIn("(Member sk_quilt_1 (Narrow quilt (And (Mod (Century 18)) (Mod sk_calderwick_1) (Mod wool))))", named)
        self.assertIn("(Member sk_quilt_1 quilt)", named)
        rule = atoms([{"t": "range", "id": "q1", "class": "pilot", "mods": ["harbour"]},
                      {"t": "copular", "id": "c1", "subject": "@q1", "predicate": "careful", "form": "adjective", "tense": "present"},
                      {"t": "generic", "id": "r1", "ranges": ["@q1"], "over": ["@c1"]}])
        self.assertIn(f"(Implication (Member $x {pilot}) (Member $x careful))", rule)    # about harbour pilots only
        cls = atoms([{"t": "class-statement", "id": "c1", "subject": "cat", "subject_mods": ["farm"], "predicate": "dog",
                      "predicate_mods": ["herding"], "form": "noun", "definitional": True, "tense": "present"}])
        self.assertEqual(sorted(cls), ["(Inheritance (Narrow cat (Mod farm)) (Narrow dog (Mod herding)))",
                                       "(Inheritance (Narrow cat (Mod farm)) dog)"])  # never the plain cat
        under = atoms([{"t": "named-entity", "id": "n1", "name": "Ines"}, {"t": "witness", "id": "x1", "class": "net", "mods": ["fishing"]},
                       {"t": "activity", "id": "v1", "verb": "mend", "actor": "@n1", "patient": "@x1", "tense": "past"},
                       {"t": "negation", "id": "s1", "over": ["@v1"]}])
        self.assertTrue(any("(Member sk_net_1 (Narrow net (Mod fishing)))" in a and a.startswith("(Not") for a in under))
        for bad, why in [([{"t": "witness", "id": "x1", "class": "net", "mods": ["@x2"]},
                           {"t": "witness", "id": "x2", "class": "boat"}], "a noun is its lemma"),
                         ([{"t": "named-entity", "id": "n1", "name": "Bram", "mods": ["harbour"]}], "which is empty"),
                         ([{"t": "time", "id": "t1", "deictic": "yesterday"},
                           {"t": "witness", "id": "x1", "class": "paper", "mods": ["@t1"]}], "a time with no")]:
            with self.assertRaises(E.EmitError) as cm:
                E.emit({"id": "bad", "instances": bad}, CATALOG)
            self.assertTrue(any(why in p for p in cm.exception.args[0]), cm.exception.args[0])

    def test_a_modified_class_noun_narrows_the_comparison_class(self):
        """The witness's mods narrow a superlative's comparison class with its other restrictions
        — the rule shows them through the member's own narrowed class —; a class narrowed by its
        nouns alone is the comparison class itself: no rule, no stated membership beyond the
        noun's own; the predicative form's mods do the same, its membership with the head."""
        def atoms(insts):
            return atoms_of(E.emit({"id": "s", "instances": insts}, CATALOG)["statements"])
        both = atoms([{"t": "named-entity", "id": "n1", "name": "Lamine"},
                      {"t": "witness", "id": "x1", "class": "record", "possessor": "@n1", "mods": ["jazz"]},
                      {"t": "superlative", "id": "s1", "subject": "@x1", "scale": "record", "class": "record", "kind": "ordinal", "rank": 2}])
        cls = "(Narrow record (And (Mod jazz) (Possession sk_lamine_1)))"
        self.assertIn(f"(Ordinal sk_record_1 2 {cls} {cls})", both)
        self.assertIn(f"(Implication (And (Member $y (Narrow record (Mod jazz))) (Possession $y sk_lamine_1)) (Member $y {cls}))", both)
        alone = atoms([{"t": "named-entity", "id": "n1", "name": "The Gull"},
                       {"t": "superlative", "id": "s1", "subject": "@n1", "scale": "old", "class": "boat", "mods": ["fishing"],
                        "kind": "most", "predicative": True, "tense": "present"}])
        self.assertEqual(sorted(alone), sorted(['(Name sk_the_gull_1 "The Gull")', "(Most old sk_the_gull_1 (Narrow boat (Mod fishing)))",
                                                "(Member sk_the_gull_1 boat)", "(Member sk_the_gull_1 (Narrow boat (Mod fishing)))"]))

    def test_a_kind_word_is_the_class_s_membership_and_between_takes_two(self):
        """A kind-of phrase states the kind a property of the class as a whole and the class a
        subclass of the of-phrase's class (kind, type and sort state no kind); a bare-lemma object's adjectives and nouns
        narrow it, its head beside; Between takes its second object only with that head; a second
        object on another head is refused."""
        def atoms(insts):
            return atoms_of(E.emit({"id": "k", "instances": insts}, CATALOG)["statements"])
        self.assertEqual(sorted(atoms([{"t": "class-statement", "id": "c1", "subject": "kestrel", "predicate": "falcon", "kind": "species",
                                        "form": "noun", "definitional": True, "tense": "past"}])),
                         ["(Past (ClassProperty kestrel species))", "(Past (Inheritance kestrel falcon))"])
        self.assertEqual(atoms([{"t": "class-statement", "id": "c1", "subject": "ristretto", "predicate": "espresso", "kind": "kind",
                                 "form": "noun", "definitional": True, "tense": "present"}]), ["(Inheritance ristretto espresso)"])
        of = atoms([{"t": "named-entity", "id": "n1", "name": "Velloria"},
                    {"t": "postmodifier", "id": "a1", "noun": "@n1", "head": "Of", "object": "fern", "object_props": ["tall"], "object_mods": ["tree"]}])
        self.assertIn("(Of sk_velloria_1 (Narrow fern (And (Member tall) (Mod tree))))", of)
        self.assertIn("(Of sk_velloria_1 fern)", of)
        two = atoms([{"t": "named-entity", "id": "n1", "name": "Ines"}, {"t": "named-entity", "id": "n2", "name": "Corvin"},
                     {"t": "witness", "id": "x1", "class": "quarrel", "definite": True},
                     {"t": "postmodifier", "id": "a1", "noun": "@x1", "head": "Between", "object": "@n1", "object2": "@n2"}])
        self.assertIn("(Between sk_quarrel_1 sk_ines_1 sk_corvin_1)", two)
        one = atoms([{"t": "group", "id": "g1", "class": "pillow", "definite": True}, {"t": "witness", "id": "x1", "class": "cat", "definite": True},
                     {"t": "activity", "id": "v1", "verb": "sleep", "actor": "@x1", "tense": "past"},
                     {"t": "location", "id": "l1", "event": "@v1", "place": "@g1", "head": "Between", "preposition": "between"}])
        self.assertIn("(Between sk_sleep_1 sk_group_1)", one)                   # one object: the two-place form
        for bad, why in [([{"t": "named-entity", "id": "n1", "name": "Ines"}, {"t": "named-entity", "id": "n2", "name": "Corvin"},
                           {"t": "witness", "id": "x1", "class": "letter"},
                           {"t": "postmodifier", "id": "a1", "noun": "@x1", "head": "From", "object": "@n1", "object2": "@n2"}], "only when"),
                         ([{"t": "named-entity", "id": "n1", "name": "Ines"}, {"t": "witness", "id": "x1", "class": "letter"},
                           {"t": "postmodifier", "id": "a1", "noun": "@x1", "head": "From", "object": "@n1", "object_mods": ["harbour"]}],
                          "a referent's words go on its own instance")]:
            with self.assertRaises(E.EmitError) as cm:
                E.emit({"id": "bad", "instances": bad}, CATALOG)
            self.assertTrue(any(why in p for p in cm.exception.args[0]), cm.exception.args[0])

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
