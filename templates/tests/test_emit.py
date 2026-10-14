"""Tests for the generic emitter (tmpl/emit.py) over the catalog (templates/catalog/*.yaml).

* the catalog loads and passes its structural checks;
* the transfer template's illustrated example emits exactly the illustrated atoms and
  declarations;
* every example with instances emits, deterministically, and type-checks strictly (C9) with
  the emitter's own declarations;
* scope: a witness mentioned only inside a negated clause is rendered inside the Not;
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


class EmitTests(unittest.TestCase):
    def test_transfer_illustration_matches(self):
        ex = CATALOG["transfer"]["examples"]["shown"][0]
        out = E.emit({"id": "x", "instances": ex["instances"]}, CATALOG)
        self.assertEqual(sorted(atoms_of(out["statements"])), sorted(ex["emitted"]))
        want = set(ex["declarations"]) | {d.replace(" Entity)", " Instance)") for d in ex["declarations"] if " Entity)" in d} \
            | {d.replace(" Event)", " Instance)") for d in ex["declarations"] if " Event)" in d}
        self.assertEqual(set(out["declarations"]), want)

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
        self.assertIn('(Name lamine "Lamine")', atoms)                 # names stay at top level

    def test_modal_scopes_over_the_clause(self):
        ex = next(e for _, _, e in all_examples() if e["text"] == "Lamine might lend Ottoline the trowel.")
        out = E.emit({"id": "mod", "instances": ex["instances"]}, CATALOG)
        atoms = atoms_of(out["statements"])
        might = [a for a in atoms if a.startswith("(Might ")]
        self.assertEqual(len(might), 1, atoms)
        self.assertNotIn("(Past", might[0])                            # present tense emits nothing
        self.assertIn("(Member sk_trowel_1 trowel)", might[0])

    def test_present_emits_no_tense_and_progressive_emits_ongoing(self):
        ex = next(e for _, _, e in all_examples() if e["text"] == "Ottoline is sending the quilt.")
        atoms = atoms_of(E.emit({"id": "prog", "instances": ex["instances"]}, CATALOG)["statements"])
        self.assertIn("(Ongoing sk_send_1)", atoms)
        self.assertFalse(any(a.startswith("(Past ") or a.startswith("(Future ") for a in atoms))

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
