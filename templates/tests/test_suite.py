"""Tests for the suite runner (tmpl/suite.py).

* the label-independent comparison: relabelled and reordered instances are the same emission;
  a changed slot value is not, and the diff names the leaf and its kind; two witnesses of one
  stem with swapped roles are shape-equal but not the same;
* the catalog-wide checks on the real catalog (no findings, the pending targets listed) and on
  doctored catalogs (unclaimed, claim-conflict, overlap, held-out leak, stale gap, unknown code);
* scoring: every outcome class from synthetic parser replies;
* collect + score end to end against a fake parse script (no LLM): resumable, all pass, the
  report and the scores file are written.

Run from ``templates/``: ``python tests/test_suite.py``
"""
from __future__ import annotations

import argparse
import copy
import json
import os
import shutil
import sys
import tempfile
import textwrap
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import catalog as CAT, emit as E, suite as S, typecheck as T  # noqa: E402

CATALOG = CAT.load()
HEADS = T.load_substrate()["heads"]


def case(tid, section, text):
    return next(c for c in S.cases_of(CATALOG, tid, (section,)) if c["text"] == text)


def pending_targets(catalog=CATALOG) -> set:
    """The abstain targets no template covers yet, derived from the catalog itself."""
    out = set()
    for t in catalog.values():
        for section in ("shown", "held_out"):
            for ex in (t.get("examples") or {}).get(section) or []:
                target = (ex.get("expected") or {}).get("template")
                if ex.get("category") == "abstain" and target and target not in catalog:
                    out.add(target)
    return out


def units(instances, catalog=CATALOG):
    return S.units_of(E.emit({"id": "u", "instances": instances}, catalog)["statements"])


def reply(instances=None, unmapped=None, issues=None):
    return {"response": {"id": "x", "instances": instances or [], "unmapped": unmapped or [], "issues": issues or []},
            "usage": {"input": 10, "output": 5, "thinking": None, "total": 15}, "run": 1, "model": "fake", "effort": "low"}


class MatchTests(unittest.TestCase):
    def setUp(self):
        self.neg = case("transfer", "held_out", "Lamine did not hand Teodor an envelope.")

    def test_relabelled_and_reordered_instances_are_the_same(self):
        relabel = {"n1": "a", "n2": "b", "x1": "w", "e1": "ev", "s1": "sc"}

        def rl(v):
            if isinstance(v, list):
                return [rl(x) for x in v]
            return "@" + relabel[v[1:]] if isinstance(v, str) and v.startswith("@") else v

        insts = [{k: (relabel[v] if k == "id" else rl(v)) for k, v in r.items()} for r in self.neg["instances"]]
        insts = [insts[2], insts[1], insts[0], insts[4], insts[3]]
        self.assertTrue(S.same(units(self.neg["instances"]), units(insts)))

    def test_changed_slot_is_not_the_same_and_the_diff_names_it(self):
        insts = copy.deepcopy(self.neg["instances"])
        insts[3]["tense"] = "present"
        a, b = units(self.neg["instances"]), units(insts)
        self.assertFalse(S.same(a, b))
        d = S.diff(a, b, HEADS)
        self.assertEqual(d["only_expected"], ["Not/And/(Past sk_hand_*)"])
        self.assertEqual(d["only_parse"], [])
        self.assertEqual(d["kinds"], ["temporal"])
        self.assertFalse(d["shape"])

    def test_swapped_witness_identity_is_shape_equal_but_not_the_same(self):
        a = [{"t": "witness", "id": "x1", "class": "clerk"}, {"t": "witness", "id": "x2", "class": "clerk", "definite": True},
             {"t": "transfer", "id": "e1", "verb": "hand", "giver": "@x1", "recipient": "@x2", "object": "@x1", "tense": "past"}]
        b = copy.deepcopy(a)
        b[2]["object"] = "@x2"
        ua, ub = units(a), units(b)
        self.assertFalse(S.same(ua, ub))
        self.assertTrue(S.diff(ua, ub, HEADS)["shape"])

    def test_different_stems_never_unify(self):
        a = [{"t": "witness", "id": "x1", "class": "quilt"}]
        b = [{"t": "witness", "id": "x1", "class": "thermos"}]
        self.assertFalse(S.same(units(a), units(b)))


class CheckTests(unittest.TestCase):
    def test_real_catalog_has_no_findings_and_lists_pending_targets(self):
        checks = S.catalog_checks(CATALOG)
        self.assertEqual(checks["findings"], [])
        expected = pending_targets()
        self.assertEqual(set(checks["pending"]), expected)       # empty once every target is claimed
        self.assertGreater(checks["examples"], 10)

    MIRROR_TEXT = "Zed took the zither from Quill."

    def _with_mirror(self, claim_instances=None):
        """A doctored catalog: transfer abstains on a sentence to a fake template `mirror`,
        which claims it with `claim_instances` when given."""
        cat = copy.deepcopy(CATALOG)
        mirror = copy.deepcopy(cat["transfer"])
        mirror["id"] = "mirror"
        mirror["examples"] = {"shown": [], "held_out": []}
        cat["transfer"]["examples"]["held_out"].append(
            {"category": "abstain", "text": self.MIRROR_TEXT, "expected": {"abstain": True, "template": "mirror"}})
        if claim_instances:
            mirror["examples"]["held_out"].append({"category": "positive", "text": self.MIRROR_TEXT, "instances": claim_instances})
        cat["mirror"] = mirror
        return cat

    def test_existing_target_must_claim_the_sentence(self):
        kinds = [f["kind"] for f in S.catalog_checks(self._with_mirror(), freshness=False)["findings"]]
        self.assertEqual(kinds, ["unclaimed"])

    def test_claim_that_fires_the_abstaining_template_conflicts(self):
        insts = [{"t": "named-entity", "id": "n1", "name": "Zed"}, {"t": "witness", "id": "x1", "class": "zither", "definite": True},
                 {"t": "named-entity", "id": "n2", "name": "Quill"},
                 {"t": "transfer", "id": "e1", "verb": "take", "giver": "@n2", "recipient": "@n1", "object": "@x1", "tense": "past"}]
        kinds = [f["kind"] for f in S.catalog_checks(self._with_mirror(insts), freshness=False)["findings"]]
        self.assertEqual(kinds, ["claim-conflict"])

    def test_overlap_and_shared(self):
        pos = case("transfer", "held_out", "Lamine handed Teodor an envelope.")
        cat = copy.deepcopy(CATALOG)
        other = copy.deepcopy(cat["transfer"])
        other["id"] = "other"
        other["examples"] = {"shown": [], "held_out": [{"category": "positive", "text": pos["text"], "instances": pos["instances"]}]}
        cat["other"] = other
        checks = S.catalog_checks(cat, freshness=False)
        self.assertEqual([f["kind"] for f in checks["findings"]], [])
        self.assertIn(["other", "transfer"], [sh["templates"] for sh in checks["shared"]])   # beside the catalog's own compositions
        insts = copy.deepcopy(pos["instances"])
        insts[3]["tense"] = "future"
        other["examples"]["held_out"][0]["instances"] = insts
        kinds = [f["kind"] for f in S.catalog_checks(cat, freshness=False)["findings"]]
        self.assertEqual(kinds, ["overlap"])

    def test_held_out_leak_stale_gap_and_unknown_code(self):
        cat = copy.deepcopy(CATALOG)
        shown0 = cat["transfer"]["examples"]["shown"][0]
        cat["witness"]["examples"]["held_out"].append({"category": "positive", "text": shown0["text"], "instances": shown0["instances"]})
        cat["transfer"]["examples"]["held_out"].append({"category": "abstain", "text": shown0["text"],
                                                        "expected": {"abstain": True, "gap": "G99", "span": "x"}})
        kinds = sorted(f["kind"] for f in S.catalog_checks(cat, freshness=False)["findings"])
        self.assertEqual(kinds, ["held-out-leak", "held-out-leak", "stale-gap", "unknown-gap-code"])   # both added examples leak


class ScoreTests(unittest.TestCase):
    def setUp(self):
        self.pos = case("transfer", "held_out", "Lamine handed Teodor an envelope.")
        self.abst_gap = case("transfer", "held_out", "Lamine paid Yusra a visit.")
        # a case whose target no template covers, whatever the catalog grows into
        self.abst_pending = dict(case("transfer", "held_out", "Yusra gave up."),
                                 expected={"abstain": True, "template": "never-written"})

    def score(self, c, rec):
        return S.score_record(c, rec, CATALOG, HEADS, None)

    def test_positive_exact_passes(self):
        relabelled = [dict(r, id=r["id"] + "9") for r in self.pos["instances"]]
        for r in relabelled:
            for k, v in r.items():
                if isinstance(v, str) and v.startswith("@"):
                    r[k] = v + "9"
        row = self.score(self.pos, reply(relabelled))
        self.assertTrue(row["pass"], row)
        self.assertTrue(row["exact"] and row["fired_template"])
        self.assertEqual(row["fired"], {"named-entity": 2, "witness": 1, "transfer": 1})

    def test_positive_with_wrong_slot_fails_with_diff(self):
        insts = copy.deepcopy(self.pos["instances"])
        insts[3]["giver"], insts[3]["recipient"] = insts[3]["recipient"], insts[3]["giver"]
        row = self.score(self.pos, reply(insts))
        self.assertFalse(row["pass"])
        self.assertEqual(row["diff"]["kinds"], ["role"])
        self.assertIn("atoms differ", row["reasons"])

    def test_positive_with_unmapped_or_no_fire_fails(self):
        row = self.score(self.pos, reply(self.pos["instances"], unmapped=[{"span": "an envelope", "code": "G00"}]))
        self.assertFalse(row["pass"])
        self.assertIn("unmapped spans in a covered sentence", row["reasons"])
        row = self.score(self.pos, reply(self.pos["instances"][:3]))
        self.assertFalse(row["pass"])
        self.assertIn("transfer did not fire", row["reasons"])

    def test_malformed_no_json_and_failed(self):
        bad = [dict(r) for r in self.pos["instances"]]
        del bad[3]["tense"]
        row = self.score(self.pos, reply(bad))
        self.assertEqual(row["status"], "malformed")
        self.assertFalse(row["pass"])
        row = self.score(self.pos, {"response": None, "error": "the reply is not valid JSON: x", "run": 1})
        self.assertEqual(row["status"], "no_json")
        row = self.score(self.pos, {"response": None, "error": "request failed: HTTP 500", "run": 1})
        self.assertEqual(row["status"], "failed")

    def test_abstain_outcomes(self):
        names = [{"t": "named-entity", "id": "n1", "name": "Lamine"}, {"t": "named-entity", "id": "n2", "name": "Yusra"}]
        row = self.score(self.abst_gap, reply(names, unmapped=[{"span": "paid Yusra a visit", "code": "G00"}]))
        self.assertEqual(row["outcome"], "gap_reported")
        self.assertTrue(row["pass"] and row["span_match"])
        row = self.score(self.abst_gap, reply(names, unmapped=[{"span": "paid Yusra a visit", "code": "G02"}]))
        self.assertEqual(row["outcome"], "unmapped_other_code")
        self.assertFalse(row["pass"])
        row = self.score(self.abst_gap, reply(names))
        self.assertEqual(row["outcome"], "silent_drop")
        fire = names + [{"t": "witness", "id": "x1", "class": "visit"},
                        {"t": "transfer", "id": "e1", "verb": "pay", "giver": "@n1", "recipient": "@n2", "object": "@x1", "tense": "past"}]
        row = self.score(self.abst_gap, reply(fire))
        self.assertEqual(row["outcome"], "false_fire")
        self.assertFalse(row["pass"])
        row = self.score(self.abst_pending, reply(names[:1], unmapped=[{"span": "gave up", "code": "G00"}]))
        self.assertEqual(row["outcome"], "pending_unmapped")
        self.assertTrue(row["pass"])
        stray = names[:1] + [{"t": "witness", "id": "x1", "class": "quilt", "definite": True}]
        row = self.score(self.abst_pending, reply(stray, unmapped=[{"span": "gave up", "code": "G00"}]))
        self.assertEqual(row["outcome"], "pending_unmapped")
        self.assertFalse(row["pass"])                                     # a witness from unmapped words is a lint
        self.assertTrue(any(r.startswith("graph lints: dangling-referent") for r in row["reasons"]))

    def test_expected_unmapped_on_a_firing_case(self):
        c = case("acquisition", "held_out", "Ottoline bought the quilt for forty euros.")
        row = self.score(c, reply(c["instances"], unmapped=[{"span": "for forty euros", "code": "G00"}]))
        self.assertTrue(row["pass"], row["reasons"])
        row = self.score(c, reply(c["instances"]))
        self.assertFalse(row["pass"])
        self.assertIn("unmapped spans differ from the expected ones", row["reasons"])
        row = self.score(c, reply(c["instances"], unmapped=[{"span": "for forty euros", "code": "G02"}]))
        self.assertFalse(row["pass"])
        row = self.score(c, reply(c["instances"], unmapped=[{"span": "for forty euros", "code": "G00"}, {"span": "Ottoline", "code": "G00"}]))
        self.assertFalse(row["pass"])

    def test_null_slots_are_stripped_and_counted(self):
        insts = copy.deepcopy(self.pos["instances"])
        insts[3]["aspect"] = None
        row = self.score(self.pos, reply(insts))
        self.assertTrue(row["pass"])
        self.assertEqual(row["null_slots"], 1)


FAKE_SCRIPT = textwrap.dedent('''
    import json, os, sys
    sys.path.insert(0, %r)
    from tmpl import catalog as CAT
    CATALOG = CAT.load()
    class ProviderError(Exception):
        pass
    class Fake:
        default_model = "fake-1"
    PROVIDERS = {"google": Fake, "openai": Fake, "anthropic": Fake}
    def add_provider_args(ap):
        ap.add_argument("--provider", default="google"); ap.add_argument("--model", default=None)
        ap.add_argument("--effort", default="low"); ap.add_argument("--prompt", default=%r)
        ap.add_argument("--temperature", type=float, default=0.0)
    CALLS = %r
    def parse_sentence(text, args, item_id="item"):
        with open(CALLS, "a") as fh:
            fh.write(text + "\\n")
        if args.dry_run:
            return {"request": {"url": "fake", "body": {"text": text}}}
        matches = [ex for t in CATALOG.values() for section in ("shown", "held_out")
                   for ex in (t.get("examples") or {}).get(section) or [] if ex["text"] == text]
        if not matches:
            raise ProviderError("unknown sentence")
        ex = next((m for m in matches if m.get("instances")), matches[0])   # a claim beats an abstain
        if ex.get("instances"):
            resp = {"id": item_id, "instances": ex["instances"], "unmapped": ex.get("unmapped") or [], "issues": []}
        else:
            exp = ex["expected"]
            resp = {"id": item_id, "instances": [], "issues": [],
                    "unmapped": [{"span": exp.get("span") or text, "code": exp.get("gap") or "G00"}]}
        return {"provider": "google", "model": "fake-1", "effort": "low", "temperature": 0.0,
                "prompt_sha256": "0", "item": {"id": item_id, "text": text},
                "usage": {"input": 100, "output": 20, "thinking": 7 if "might" in text else None, "total": 127},
                "raw_text": json.dumps(resp), "response": resp}
''')


class EndToEndTests(unittest.TestCase):
    def setUp(self):
        self.dir = tempfile.mkdtemp()
        self.calls = os.path.join(self.dir, "calls.txt")
        self.script = os.path.join(self.dir, "fake-parse.py")
        with open(self.script, "w", encoding="utf-8") as fh:
            fh.write(FAKE_SCRIPT % (TEMPLATES, os.path.join(TEMPLATES, "generated", "PROMPT_CATALOG.txt"), self.calls))
        self.raw = os.path.join(self.dir, "raw")
        self.out = os.path.join(self.dir, "out")

    def tearDown(self):
        shutil.rmtree(self.dir, ignore_errors=True)

    def collect(self, *extra):
        import io
        import contextlib
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            rc = S.main(["collect", "--template", "transfer", "--runs", "2", "--raw-dir", self.raw,
                         "--parse-script", self.script, *extra])
        return rc, buf.getvalue()

    def test_collect_is_resumable_and_score_passes(self):
        n_cases = len(S.cases_of(CATALOG, "transfer"))
        rc, out = self.collect()
        self.assertEqual(rc, 0, out)
        self.assertEqual(len(os.listdir(os.path.join(self.raw, "transfer"))), 2 * n_cases)
        with open(self.calls) as fh:
            self.assertEqual(len(fh.read().splitlines()), 2 * n_cases)
        rc, out = self.collect()
        self.assertIn("planned 0 calls", out)
        with open(self.calls) as fh:
            self.assertEqual(len(fh.read().splitlines()), 2 * n_cases)   # nothing re-requested
        import io
        import contextlib
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            rc = S.main(["score", "--template", "transfer", "--raw-dir", self.raw, "--out-dir", self.out])
        self.assertEqual(rc, 0, buf.getvalue())
        with open(os.path.join(self.out, "summary.json"), encoding="utf-8") as fh:
            summary = json.load(fh)
        s = summary["templates"]["transfer"]["held_out"]
        self.assertEqual(s["pass"], s["records"])
        self.assertEqual(s["selection"]["false_fires"], 0)
        self.assertEqual(s["fill"]["rate"], 1.0)
        self.assertEqual(s["stability"]["pairwise_agreement"], 1.0)
        self.assertEqual(s["usage"]["calls"], 2 * n_cases)
        self.assertEqual(s["usage"]["thinking_calls"], 2)          # the fake thinks on "might"
        self.assertEqual(s["stale_prompt"], 0)
        self.assertEqual(set(summary["checks"]["pending"]), pending_targets())
        with open(os.path.join(self.out, "REPORT.md"), encoding="utf-8") as fh:
            report = fh.read()
        self.assertIn("## transfer — held_out", report)
        self.assertIn("Mismatches: none", report)
        with open(os.path.join(self.out, "transfer.scores.jsonl"), encoding="utf-8") as fh:
            rows = [json.loads(ln) for ln in fh]
        self.assertEqual(len(rows), 2 * n_cases)
        if summary["typecheck"] == "ran":
            self.assertTrue(all(r.get("typed") for r in rows if r.get("statements")))

    def test_dry_run_calls_nothing_and_limit_only_filter(self):
        rc, out = self.collect("--dry-run")
        self.assertEqual(rc, 0)
        self.assertFalse(os.path.exists(self.raw))
        rc, out = self.collect("--only", "gave up", "--limit", "1")
        self.assertIn("planned 1 calls", out)
        self.assertEqual(len(os.listdir(os.path.join(self.raw, "transfer"))), 1)


if __name__ == "__main__":
    unittest.main(verbosity=1)
