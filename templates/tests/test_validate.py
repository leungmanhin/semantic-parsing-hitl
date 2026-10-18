"""Tests for the post-parse validator (tmpl/validate.py) and its two callers.

* contract: a reply that is not an object, instances that are not a list, null slots stripped
  and counted;
* instances: the emitter's checks surface as findings and stop the record (missing required
  slot, a filler pointing at a scope instance, a scope cycle, an empty required refs list);
* lints: dangling referent (suppressed when something is unmapped), bare predication, empty
  optional scope;
* C9 through ``validate``: the live transfer example validates clean; a well-formed but
  ill-typed emission is reported (skipped without ``petta``);
* the parse script: ``semantic-parse.py`` run with a fake provider validates its reply,
  prints the summary, stores the validation in the run record, honours ``--atoms`` and
  ``--no-validate``, and exits 3 on findings.

Run from ``templates/``: ``python tests/test_validate.py``
"""
from __future__ import annotations

import contextlib
import copy
import importlib.util
import io
import json
import os
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
REPO = os.path.abspath(os.path.join(TEMPLATES, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import catalog as CAT, validate as V  # noqa: E402

try:
    import petta  # noqa: F401

    HAVE_PETTA = True
except Exception:  # pragma: no cover
    HAVE_PETTA = False

CATALOG = CAT.load()
EXAMPLE = CATALOG["transfer"]["examples"]["shown"][0]


def reply(instances, unmapped=None, issues=None, **extra):
    return {"id": "x", "instances": instances, "unmapped": unmapped or [], "issues": issues or [], **extra}


def kinds(res):
    return sorted(f["kind"] for f in res["findings"])


class ContractTests(unittest.TestCase):
    def test_not_an_object(self):
        res = V.inspect("just text", CATALOG)
        self.assertEqual(res["status"], "not-an-object")
        self.assertEqual(kinds(res), ["contract"])

    def test_instances_not_a_list(self):
        res = V.inspect({"instances": {"t": "witness"}}, CATALOG)
        self.assertEqual(res["status"], "malformed")
        self.assertEqual(kinds(res), ["contract"])

    def test_null_slots_stripped_and_non_object_entries_reported(self):
        insts = copy.deepcopy(EXAMPLE["instances"])
        insts[3]["aspect"] = None
        res = V.inspect(reply(insts + ["stray"], unmapped=["not a record"]), CATALOG)
        self.assertEqual(res["status"], "ok")
        self.assertEqual(res["null_slots"], 1)
        self.assertEqual(kinds(res), ["contract", "contract"])
        self.assertEqual(len(res["statements"]), 8)


class InstanceTests(unittest.TestCase):
    def test_missing_required_slot(self):
        insts = copy.deepcopy(EXAMPLE["instances"])
        del insts[3]["tense"]
        res = V.inspect(reply(insts), CATALOG)
        self.assertEqual(res["status"], "malformed")
        self.assertTrue(any("missing required slot tense" in f["detail"] for f in res["findings"]))
        self.assertIsNone(res["statements"])

    def test_filler_pointing_at_a_scope_instance(self):
        insts = copy.deepcopy(EXAMPLE["instances"]) + [{"t": "negation", "id": "s1", "over": ["@e1"]}]
        insts[3]["object"] = "@s1"
        res = V.inspect(reply(insts), CATALOG)
        self.assertEqual(res["status"], "malformed")
        self.assertTrue(any("mints no symbol" in f["detail"] for f in res["findings"]), res["findings"])

    def test_scope_cycle_and_empty_required_refs(self):
        insts = copy.deepcopy(EXAMPLE["instances"]) + [{"t": "negation", "id": "s1", "over": ["@s2"]},
                                                      {"t": "modal", "id": "s2", "over": ["@s1"], "head": "Might"}]
        res = V.inspect(reply(insts), CATALOG)
        self.assertEqual(res["status"], "malformed")
        self.assertTrue(any(f["detail"].startswith("scope cycle: ") for f in res["findings"]), res["findings"])
        insts = copy.deepcopy(EXAMPLE["instances"]) + [{"t": "negation", "id": "s1", "over": []}]
        res = V.inspect(reply(insts), CATALOG)
        self.assertEqual(res["status"], "malformed")
        self.assertTrue(any("missing required slot over" in f["detail"] for f in res["findings"]))

    def test_refs_must_hold_references(self):
        insts = copy.deepcopy(EXAMPLE["instances"]) + [{"t": "negation", "id": "s1", "over": "@e1"}]
        res = V.inspect(reply(insts), CATALOG)
        self.assertEqual(res["status"], "malformed")
        self.assertTrue(any("must be a list of references" in f["detail"] for f in res["findings"]))


class LintTests(unittest.TestCase):
    def test_dangling_name_only_when_nothing_is_unmapped_but_a_witness_always(self):
        names = [{"t": "named-entity", "id": "n1", "name": "Yusra"}]
        res = V.inspect(reply(names), CATALOG)
        self.assertEqual(res["status"], "ok")
        self.assertEqual(kinds(res), ["dangling-referent"])
        gap = [{"span": "gave up", "code": "G00"}]
        res = V.inspect(reply(names, unmapped=gap), CATALOG)
        self.assertEqual(kinds(res), [])
        with_witness = names + [{"t": "witness", "id": "x1", "kind": "quilt", "definite": True}]
        res = V.inspect(reply(with_witness, unmapped=[{"span": "wants to send the quilt", "code": "G00"}]), CATALOG)
        self.assertEqual(kinds(res), ["dangling-referent"])
        self.assertIn("witness x1", res["findings"][0]["detail"])

    def test_clean_parse_has_no_lints(self):
        res = V.inspect(reply(EXAMPLE["instances"]), CATALOG)
        self.assertEqual(res["status"], "ok")
        self.assertEqual(kinds(res), [])
        self.assertEqual(res["fired"], {"named-entity": 2, "witness": 1, "transfer": 1})

    def test_bare_predication_and_empty_optional_scope(self):
        cat = copy.deepcopy(CATALOG)
        t = copy.deepcopy(cat["transfer"])
        t["id"] = "weather"
        t["slots"] = {k: dict(v, required=False) for k, v in t["slots"].items()}
        t["slots"]["id"]["required"] = True
        t["slots"]["verb"]["required"] = True
        t["slots"]["tense"]["required"] = True
        cat["weather"] = t
        cat["negation"] = copy.deepcopy(cat["negation"])
        cat["negation"]["slots"]["over"]["required"] = False
        insts = [{"t": "weather", "id": "e1", "verb": "rain", "tense": "past"}, {"t": "negation", "id": "s1", "over": []}]
        res = V.inspect(reply(insts), cat)
        self.assertEqual(res["status"], "ok")
        self.assertEqual(kinds(res), ["bare-predication", "empty-scope"])


@unittest.skipUnless(HAVE_PETTA, "petta package not importable")
class TypecheckTests(unittest.TestCase):
    def test_live_example_validates_clean(self):
        res = V.validate(reply(EXAMPLE["instances"]), CATALOG)
        self.assertEqual(res["status"], "ok")
        self.assertEqual(res["typecheck"], "ran")
        self.assertEqual(res["findings"], [])
        self.assertIn("C9 8/8", V.summary(res))

    def test_ill_typed_emission_is_reported(self):
        records = [{"statements": ["(: s1 (Agent sk_teodor_1 sk_give_1) (STV 1.0 0.99))"],
                    "declarations": ["(: sk_teodor_1 Entity)", "(: sk_teodor_1 Instance)", "(: sk_give_1 Event)", "(: sk_give_1 Instance)"]},
                   {"statements": ["(: s1 (Agent sk_give_1 sk_teodor_1) (STV 1.0 0.99))"],
                    "declarations": ["(: sk_teodor_1 Entity)", "(: sk_teodor_1 Instance)", "(: sk_give_1 Event)", "(: sk_give_1 Instance)"]}]
        typed = V.typecheck_records(records)
        self.assertEqual(sorted(typed), [0])
        self.assertEqual(typed[0][0]["kind"], "type")


FAKE_REPLY = {"id": "item", "instances": EXAMPLE["instances"], "unmapped": [], "issues": []}


def load_script():
    spec = importlib.util.spec_from_file_location("semantic_parse_under_test", os.path.join(REPO, "semantic-parse.py"))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


class ScriptTests(unittest.TestCase):
    def run_script(self, reply_obj, *argv):
        mod = load_script()

        class Fake:
            name = "google"
            default_model = "fake-1"

            def __init__(self, args):
                pass

            def complete(self, system, user, model):
                r = mod.Reply(json.dumps(reply_obj), {"input": 1, "output": 1, "thinking": None, "total": 2}, {})
                return r

        mod.PROVIDERS["google"] = Fake
        out, err = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            rc = mod.main(["Teodor gave Yusra a thermos.", *argv])
        return rc, out.getvalue(), err.getvalue()

    def test_valid_reply_is_validated_and_recorded(self):
        with tempfile.TemporaryDirectory() as d:
            rec_path = os.path.join(d, "run.json")
            rc, out, err = self.run_script(FAKE_REPLY, "--out", rec_path, "--atoms")
            self.assertEqual(rc, 0, err)
            self.assertIn("validation ok · 8 statements", err)
            self.assertIn("; statements", out)
            self.assertIn("(Agent sk_give_1 sk_teodor_1)", out)
            with open(rec_path, encoding="utf-8") as fh:
                rec = json.load(fh)
            self.assertEqual(rec["validation"]["status"], "ok")
            self.assertEqual(len(rec["validation"]["statements"]), 8)
            self.assertEqual(rec["validation"]["findings"], [])

    def test_findings_give_exit_3_and_no_validate_skips(self):
        bad = copy.deepcopy(FAKE_REPLY)
        del bad["instances"][3]["tense"]
        rc, out, err = self.run_script(bad)
        self.assertEqual(rc, 3)
        self.assertIn("validation malformed", err)
        self.assertIn("missing required slot tense", err)
        rc, out, err = self.run_script(bad, "--no-validate")
        self.assertEqual(rc, 0)
        self.assertNotIn("validation", err)


if __name__ == "__main__":
    unittest.main(verbosity=1)
