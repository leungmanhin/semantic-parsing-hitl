"""Unit tests for the FUSE-NF mechanical validator and record assembly.

Two obligations, per schema.md §5.1:

* a hand-built record that is clean under **every** check C1-C8, so the suite fails loudly
  if a check starts over-firing on a well-formed parse (over-firing is the dangerous failure
  mode here — it would quarantine exactly the novel constructions Tier B exists to surface);
* one deliberately-broken record per check, proving each check actually fires.

Plus the "never repair content" contract on `extract_atoms`: it strips a markdown fence, and
it does *not* close an unbalanced paren or insert a missing STV.

Run:  /home/manhin/Dev/.venv-dev/bin/python fusenf/harness/tests/test_validator.py
"""

from __future__ import annotations

import json
import os
import sys
import tempfile
import unittest

HARNESS = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FUSENF = os.path.dirname(HARNESS)
sys.path.insert(0, HARNESS)

import records as R  # noqa: E402
import validator as V  # noqa: E402

VOCAB = V.load_vocab(os.path.join(FUSENF, "specs", "vocabulary.json"))

ITEM = {
    "schema": "fusenf-corpus/1",
    "id": "tierA-000001",
    "source": "unit-test",
    "sentences": ["The archivist scanned the ledger."],
    "context": {"today": None, "domain": None, "prior": [], "notes": None},
    "equiv_class": None,
    "labels": {"family": "event-transitive"},
}
ITEM["input_sha256"] = R.input_sha256(ITEM)
CORPUS_INDEX = {ITEM["id"]: ITEM}

PROVENANCE = {
    "model": "claude-sonnet-5",
    "prompt_sha256": "a" * 64,
    "seeded_sha256": "b" * 64,
    "harness": "fusenf-harness/1",
    "batch": "unit-test",
    "date": "2026-07-28",
}

CLEAN_STATEMENTS = [
    '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
    '(: scan_agent (Agent sk_scan_1 sk_archivist_1) (STV 1.0 0.99))',
    '(: archivist_kind (Member sk_archivist_1 archivist) (STV 1.0 0.99))',
    '(: scan_patient (Patient sk_scan_1 sk_ledger_1) (STV 1.0 0.99))',
    '(: ledger_kind (Member sk_ledger_1 ledger) (STV 1.0 0.99))',
    '(: scan_past (Past sk_scan_1) (STV 1.0 0.99))',
    '(: ledger_fragile (Implication (Member $x ledger) '
    '(Member $x fragile)) (STV 0.9 0.9))',
]


def record_with(statements, **overrides) -> dict:
    record = R.build_record(ITEM, statements, overrides.pop("run", 1), PROVENANCE)
    record.update(overrides)
    return record


def codes(result: dict) -> set:
    return {f["code"] for f in result["findings"]}


def run_checks(statements, **overrides) -> dict:
    return V.validate(record_with(statements, **overrides), VOCAB, CORPUS_INDEX)


def details(result: dict, code: str) -> str:
    return " | ".join(f["detail"] for f in result["findings"] if f["code"] == code)


# ---------------------------------------------------------------------------


class TestCleanRecord(unittest.TestCase):
    """The record every check must leave alone."""

    def test_clean_record_passes_c1_to_c6_and_c8(self):
        result = run_checks(CLEAN_STATEMENTS)
        self.assertEqual(result["findings"], [], msg=json.dumps(result["findings"], indent=1))
        self.assertTrue(result["ok"])

    def test_clean_record_passes_c7(self):
        result = V.validate(record_with(CLEAN_STATEMENTS), VOCAB, CORPUS_INDEX, include_c7=True)
        self.assertEqual(result["findings"], [], msg=json.dumps(result["findings"], indent=1))

    def test_prompt_sanctioned_shapes_do_not_fire(self):
        """Patterns the goldens attest, which naive readings of C5/C6 would flag."""
        cases = {
            "status over a proposition": [
                '(: tom_nervous (Past (Member tom nervous)) (STV 1.0 0.99))',
            ],
            "compound action declared by Inheritance": [
                '(: rw_genus (Inheritance recycle_waste recycle) (STV 1.0 0.99))',
                '(: rw_obj (Patient recycle_waste waste) (STV 1.0 0.99))',
            ],
            "relation head in an argument slot": [
                '(: cousin_fact (Cousin wendy xavier) (STV 1.0 0.99))',
                '(: cousin_sym (Symmetric Cousin) (STV 1.0 0.99))',
            ],
            "skolem function head": [
                '(: hunt_rule (Implication (Member $x wolf) '
                '(And (Member (sk_hunt $x) hunt) (Agent (sk_hunt $x) $x))) (STV 1.0 0.9))',
            ],
            "lowercase property constructor": [
                '(: gulls_can_fly (Inheritance gull (can fly)) (STV 0.9 0.9))',
            ],
            "structured term argument": [
                '(: lease_end (Member sk_expire_1 expire) (STV 1.0 0.99))',
                '(: lease_time (Time sk_expire_1 (Year 2027)) (STV 1.0 0.99))',
            ],
        }
        for label, statements in cases.items():
            with self.subTest(label):
                result = run_checks(statements)
                self.assertEqual(result["findings"], [],
                                 msg=json.dumps(result["findings"], indent=1))


class TestC1(unittest.TestCase):
    """JSON conformance, run >= 1, input_sha256 agreement."""

    def test_missing_required_field(self):
        record = record_with(CLEAN_STATEMENTS)
        del record["parser"]
        result = V.validate(record, VOCAB, CORPUS_INDEX)
        self.assertIn("C1", codes(result))
        self.assertIn("missing required field 'parser'", details(result, "C1"))

    def test_run_below_one(self):
        record = record_with(CLEAN_STATEMENTS)
        record["run"] = 0
        result = V.validate(record, VOCAB, CORPUS_INDEX)
        self.assertIn("run must be >= 1", details(result, "C1"))

    def test_input_sha256_mismatch_with_corpus_item(self):
        record = record_with(CLEAN_STATEMENTS)
        record["input_sha256"] = "c" * 64
        result = V.validate(record, VOCAB, CORPUS_INDEX)
        self.assertIn("input drift", details(result, "C1"))

    def test_denormalized_sentences_drift(self):
        record = record_with(CLEAN_STATEMENTS)
        record["sentences"] = ["The archivist scanned the LEDGER."]
        result = V.validate(record, VOCAB, CORPUS_INDEX)
        self.assertIn("denormalized 'sentences' differs", details(result, "C1"))

    def test_wrong_type(self):
        record = record_with(CLEAN_STATEMENTS)
        record["statements"] = "(: a (Member x y) (STV 1.0 0.99))"
        result = V.validate(record, VOCAB, CORPUS_INDEX)
        self.assertIn("must be list", details(result, "C1"))


class TestC2(unittest.TestCase):
    """Balanced s-expressions, closed strings, no stray text."""

    def test_unbalanced_parens(self):
        result = run_checks(['(: unbal (Member sk_scan_1 scan) (STV 1.0 0.99)'])
        self.assertIn("C2", codes(result))
        self.assertIn('unclosed "("', details(result, "C2"))

    def test_extra_close_paren(self):
        result = run_checks(['(: extra (Member sk_scan_1 scan) (STV 1.0 0.99)))'])
        self.assertIn('unexpected ")"', details(result, "C2"))

    def test_unterminated_string_literal(self):
        result = run_checks(['(: name_open (Name alice "Alice) (STV 1.0 0.99))'])
        self.assertIn("unterminated string literal", details(result, "C2"))

    def test_stray_text_outside_the_outermost_parens(self):
        result = run_checks(['(: ok (Member sk_scan_1 scan) (STV 1.0 0.99)) ; and so on'])
        self.assertIn("stray text outside the outermost parens", details(result, "C2"))


class TestC3(unittest.TestCase):
    """Assertion shape, proof names, truth values."""

    def test_missing_stv(self):
        result = run_checks(['(: no_stv (Member sk_scan_1 scan))'])
        self.assertIn("C3", codes(result))
        self.assertIn("expected 3", details(result, "C3"))

    def test_confidence_one(self):
        result = run_checks(['(: conf_one (Member sk_scan_1 scan) (STV 1.0 1.0))'])
        self.assertIn("never confidence 1.0", details(result, "C3"))

    def test_strength_out_of_range(self):
        result = run_checks(['(: too_strong (Member sk_scan_1 scan) (STV 1.7 0.99))'])
        self.assertIn("outside [0,1]", details(result, "C3"))

    def test_non_snake_case_proof_name(self):
        result = run_checks(['(: ScanPast (Member sk_scan_1 scan) (STV 1.0 0.99))'])
        self.assertIn("is not snake_case", details(result, "C3"))

    def test_duplicate_proof_name(self):
        result = run_checks([
            '(: dup (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: dup (Past sk_scan_1) (STV 1.0 0.99))',
        ])
        self.assertIn("already used by statement 0", details(result, "C3"))

    def test_not_an_assertion(self):
        result = run_checks(['(Member sk_scan_1 scan)'])
        self.assertIn("not an assertion", details(result, "C3"))


class TestC4(unittest.TestCase):
    """Closed-class head + arity, keyed on (name, arity)."""

    def test_unknown_head(self):
        result = run_checks([
            '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: benef (Beneficiery sk_scan_1 sk_archivist_1) (STV 1.0 0.99))',
        ])
        self.assertIn("C4", codes(result))
        self.assertIn("unknown closed-class head 'Beneficiery'", details(result, "C4"))

    def test_wrong_arity(self):
        result = run_checks([
            '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: past_two (Past sk_scan_1 yesterday) (STV 1.0 0.99))',
        ])
        self.assertIn("arity 2, vocabulary declares [1]", details(result, "C4"))

    def test_operator_identity_is_name_and_arity(self):
        """`Yet` is a head collision: arity 1 is the NPI particle, arity 2 the connective."""
        both_senses = run_checks([
            '(: e1 (Member sk_arrive_1 arrive) (STV 1.0 0.99))',
            '(: e2 (Member sk_wait_1 wait) (STV 1.0 0.99))',
            '(: yet_particle (Yet sk_arrive_1) (STV 0.0 0.99))',
            '(: yet_connective (Yet sk_wait_1 sk_arrive_1) (STV 1.0 0.99))',
        ])
        self.assertEqual(both_senses["findings"], [])
        third = run_checks([
            '(: e1 (Member sk_arrive_1 arrive) (STV 1.0 0.99))',
            '(: yet_three (Yet sk_arrive_1 sk_arrive_1 sk_arrive_1) (STV 1.0 0.99))',
        ])
        self.assertIn("arity 3, vocabulary declares [1, 2]", details(third, "C4"))

    def test_open_class_heads_are_not_checked_by_name(self):
        result = run_checks(['(: carries (Carry mosquito malaria) (STV 1.0 0.99))'])
        self.assertEqual(result["findings"], [])


class TestC5(unittest.TestCase):
    """Casing."""

    def test_entity_term_not_lowercase(self):
        result = run_checks(['(: bad_case (Member SK_Scan_1 scan) (STV 1.0 0.99))'])
        self.assertIn("C5", codes(result))
        self.assertIn("is not lowercase snake_case", details(result, "C5"))

    def test_head_not_upper_camel(self):
        result = run_checks(['(: low_head (member sk_scan_1 scan) (STV 1.0 0.99))'])
        self.assertIn("is not UpperCamelCase", details(result, "C5"))

    def test_single_quoted_string_literal(self):
        result = run_checks(["(: sq (Name alice 'Alice') (STV 1.0 0.99))"])
        self.assertIn("must be double-quoted", details(result, "C5"))

    def test_malformed_variable(self):
        result = run_checks([
            '(: rule_bad (Implication (Member $1x ledger) '
            '(Member $1x fragile)) (STV 0.9 0.9))'
        ])
        self.assertIn("malformed variable", details(result, "C5"))


class TestC6(unittest.TestCase):
    """Structural sanity."""

    def test_role_on_undeclared_symbol(self):
        result = run_checks([
            '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: orphan (Agent sk_walk_9 sk_archivist_1) (STV 1.0 0.99))',
        ])
        self.assertIn("C6", codes(result))
        self.assertIn("no (Member sk_walk_9 <verb>)", details(result, "C6"))

    def test_status_on_undeclared_symbol(self):
        result = run_checks(['(: lonely_past (Past sk_scan_1) (STV 1.0 0.99))'])
        self.assertIn("no (Member sk_scan_1 <verb>)", details(result, "C6"))

    def test_free_variable_outside_an_implication(self):
        result = run_checks(['(: free (Member $x ledger) (STV 1.0 0.99))'])
        self.assertIn("free variable $x outside an Implication", details(result, "C6"))

    def test_conclusion_variable_not_bound_by_a_premise(self):
        result = run_checks([
            '(: unbound (Implication (Member $x ledger) '
            '(Member $y fragile)) (STV 0.9 0.9))'
        ])
        self.assertIn("not bound by the antecedent", details(result, "C6"))

    def test_role_on_a_literal(self):
        result = run_checks(['(: lit (Agent "Maria" sk_archivist_1) (STV 1.0 0.99))'])
        self.assertIn('attaches to the literal', details(result, "C6"))


class TestC7(unittest.TestCase):
    """Chainer smoke test.

    C7 is a backstop, not an independent check: probing found no statement the chainer
    rejects that C2/C3/C4 accept — every rejection it produced (unbalanced parens, a
    mis-cased `Stv`, trailing text) is already flagged by a text-level check. It earns its
    place by catching whatever those checks have not thought of yet.
    """

    @classmethod
    def setUpClass(cls):
        try:
            cls.chainer = V._load_chainer()
        except Exception as exc:  # pragma: no cover - environment guard
            raise unittest.SkipTest(f"PeTTaChainer unavailable: {exc}")

    def test_chainer_rejects_a_malformed_truth_value(self):
        statements = [
            '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: bad_tv (Past sk_scan_1) (Stv 1.0 0.99))',
        ]
        result = V.validate(record_with(statements), VOCAB, CORPUS_INDEX,
                            include_c7=True, chainer_cls=self.chainer)
        self.assertIn("C7", codes(result))
        self.assertIn("chainer rejected the statement", details(result, "C7"))

    def test_chainer_accepts_the_clean_record(self):
        self.assertEqual(V.smoke_test(CLEAN_STATEMENTS, chainer_cls=self.chainer), [])

    def test_c7_is_off_unless_asked(self):
        statements = ['(: bad_tv (Member sk_scan_1 scan) (Stv 1.0 0.99))']
        self.assertNotIn("C7", codes(run_checks(statements)))


class TestC8(unittest.TestCase):
    """Duplicate expressions under different proof names."""

    def test_duplicate_expression(self):
        result = run_checks([
            '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: arch_scan_again (Member sk_scan_1 scan) (STV 1.0 0.99))',
        ])
        self.assertIn("C8", codes(result))
        self.assertIn("already asserted by statement 0", details(result, "C8"))

    def test_duplicate_expression_with_differing_truth_values(self):
        result = run_checks([
            '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: arch_scan_again (Member sk_scan_1 scan) (STV 0.0 0.99))',
        ])
        self.assertIn("truth values differ", details(result, "C8"))

    def test_whitespace_variation_still_counts_as_duplicate(self):
        result = run_checks([
            '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: arch_scan_again  (Member  sk_scan_1   scan) (STV 1.0 0.99))',
        ])
        self.assertIn("C8", codes(result))


# ---------------------------------------------------------------------------
# extract_atoms — strips wrappers, never repairs content
# ---------------------------------------------------------------------------


class TestExtractAtoms(unittest.TestCase):

    def test_strips_markdown_fence_and_commentary(self):
        raw = (
            "Here are the atoms for the sentence:\n"
            "\n"
            "```metta\n"
            "(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))\n"
            "(: scan_past (Past sk_scan_1) (STV 1.0 0.99))\n"
            "```\n"
            "\n"
            "Let me know if you want the query too.\n"
        )
        statements, strip_log = R.extract_atoms(raw)
        self.assertEqual(statements, [
            '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: scan_past (Past sk_scan_1) (STV 1.0 0.99))',
        ])
        self.assertTrue(any("fence" in entry for entry in strip_log))
        self.assertTrue(any("commentary" in entry for entry in strip_log))
        self.assertTrue(any("blank line" in entry for entry in strip_log))

    def test_strips_a_leading_item_number_and_bullet(self):
        raw = ("1. (: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))\n"
               "- (: scan_past (Past sk_scan_1) (STV 1.0 0.99))\n")
        statements, strip_log = R.extract_atoms(raw)
        self.assertEqual(statements, [
            '(: arch_scan (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: scan_past (Past sk_scan_1) (STV 1.0 0.99))',
        ])
        self.assertTrue(any("item-number" in entry for entry in strip_log))
        self.assertTrue(any("bullet" in entry for entry in strip_log))

    def test_does_not_repair_an_unbalanced_paren(self):
        broken = '(: unbal (Member sk_scan_1 scan) (STV 1.0 0.99)'
        statements, _ = R.extract_atoms("```\n" + broken + "\n```\n")
        self.assertEqual(statements, [broken])  # verbatim — not closed, not dropped
        self.assertIn("C2", codes(run_checks(statements)))

    def test_does_not_insert_a_missing_stv(self):
        broken = '(: no_stv (Member sk_scan_1 scan))'
        statements, _ = R.extract_atoms(broken + "\n")
        self.assertEqual(statements, [broken])  # verbatim — no STV invented
        self.assertIn("C3", codes(run_checks(statements)))

    def test_does_not_invent_a_proof_name_or_alter_a_head(self):
        raw = "(Member sk_scan_1 scan)\n(: bad_head (Membr sk_scan_1 scan) (STV 1.0 0.99))\n"
        statements, _ = R.extract_atoms(raw)
        self.assertEqual(statements, [
            '(Member sk_scan_1 scan)',
            '(: bad_head (Membr sk_scan_1 scan) (STV 1.0 0.99))',
        ])
        found = codes(run_checks(statements))
        self.assertIn("C3", found)  # the un-named assertion
        self.assertIn("C4", found)  # the misspelled head

    def test_joins_a_hard_wrapped_statement(self):
        raw = ("(: ledger_fragile (Implication (Member $x ledger)\n"
               "   (Member $x fragile)) (STV 0.9 0.9))\n")
        statements, strip_log = R.extract_atoms(raw)
        self.assertEqual(statements, [
            '(: ledger_fragile (Implication (Member $x ledger) '
            '(Member $x fragile)) (STV 0.9 0.9))'
        ])
        self.assertTrue(any("joined-continuation" in entry for entry in strip_log))

    def test_does_not_weld_a_truncated_statement_to_the_next_assertion(self):
        raw = ("(: truncated (Member sk_scan_1 scan) (STV 1.0 0.99)\n"
               "(: scan_past (Past sk_scan_1) (STV 1.0 0.99))\n")
        statements, _ = R.extract_atoms(raw)
        self.assertEqual(statements, [
            '(: truncated (Member sk_scan_1 scan) (STV 1.0 0.99)',
            '(: scan_past (Past sk_scan_1) (STV 1.0 0.99))',
        ])

    def test_string_literal_parens_are_not_miscounted(self):
        raw = '(: alice_name (Name alice "Smith (née Roy)") (STV 1.0 0.99))\n'
        statements, _ = R.extract_atoms(raw)
        self.assertEqual(statements, [raw.strip()])
        self.assertEqual(V.parse_sexp(statements[0])["errors"], [])

    def test_empty_input(self):
        self.assertEqual(R.extract_atoms(""), ([], []))


# ---------------------------------------------------------------------------
# record assembly and IO
# ---------------------------------------------------------------------------


class TestRecords(unittest.TestCase):

    def test_input_sha256_matches_the_corpus_builder_formula(self):
        payload = {"sentences": ITEM["sentences"], "context": ITEM["context"]}
        import hashlib
        expected = hashlib.sha256(
            json.dumps(payload, sort_keys=True, separators=(",", ":"),
                       ensure_ascii=False).encode()
        ).hexdigest()
        self.assertEqual(R.input_sha256(ITEM), expected)

    def test_build_record_shape(self):
        record = R.build_record(ITEM, CLEAN_STATEMENTS, 2, PROVENANCE)
        self.assertEqual(record["schema"], "fusenf-parse/1")
        self.assertEqual(record["run"], 2)
        self.assertEqual(record["sentences"], ITEM["sentences"])
        self.assertEqual(record["input_sha256"], ITEM["input_sha256"])
        self.assertEqual(record["parser"]["model"], PROVENANCE["model"])
        self.assertNotIn("validation", record)  # written once, by the validator

    def test_build_record_rejects_missing_provenance_and_bad_run(self):
        with self.assertRaises(ValueError):
            R.build_record(ITEM, CLEAN_STATEMENTS, 1, {"model": "m"})
        with self.assertRaises(ValueError):
            R.build_record(ITEM, CLEAN_STATEMENTS, 0, PROVENANCE)

    def test_build_record_does_not_alias_the_corpus_item(self):
        record = R.build_record(ITEM, CLEAN_STATEMENTS, 1, PROVENANCE)
        record["sentences"].append("mutated")
        record["context"]["prior"].append("mutated")
        self.assertEqual(ITEM["sentences"], ["The archivist scanned the ledger."])
        self.assertEqual(ITEM["context"]["prior"], [])

    def test_validation_is_written_once(self):
        record = R.build_record(ITEM, CLEAN_STATEMENTS, 1, PROVENANCE)
        R.attach_validation(record, {"ok": True, "errors": [], "warnings": [], "findings": []})
        with self.assertRaises(ValueError):
            R.attach_validation(record, {"ok": False, "errors": [], "warnings": [], "findings": []})

    def test_write_jsonl_appends_and_refuses_to_rewrite_a_key(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "pilot.parses.jsonl")
            first = R.build_record(ITEM, CLEAN_STATEMENTS, 1, PROVENANCE)
            second = R.build_record(ITEM, CLEAN_STATEMENTS, 2, PROVENANCE)
            R.write_jsonl(path, [first])
            R.write_jsonl(path, [second])
            self.assertEqual(len(R.read_jsonl(path)), 2)
            with self.assertRaises(ValueError):
                R.write_jsonl(path, [first])
            self.assertEqual(len(R.read_jsonl(path)), 2)  # nothing was appended

    def test_validate_file_summarizes(self):
        with tempfile.TemporaryDirectory() as tmp:
            corpus = os.path.join(tmp, "unit.jsonl")
            parses = os.path.join(tmp, "unit.parses.jsonl")
            R.write_jsonl(corpus, [ITEM], allow_duplicate_keys=True)
            clean = R.build_record(ITEM, CLEAN_STATEMENTS, 1, PROVENANCE)
            dirty = R.build_record(ITEM, ['(: dirty (Membr sk_1 scan) (STV 1.0 1.0))'],
                                   2, PROVENANCE)
            R.write_jsonl(parses, [clean, dirty])
            summary = V.validate_file(parses, os.path.join(FUSENF, "specs", "vocabulary.json"),
                                      corpus, run_c7=False)
            self.assertEqual(summary["records"], 2)
            self.assertEqual(summary["ok_records"], 1)
            self.assertEqual(summary["by_record"][0]["ok"], True)
            self.assertFalse(summary["by_record"][1]["ok"])
            self.assertGreaterEqual(summary["by_code"]["C4"], 1)
            self.assertGreaterEqual(summary["by_code"]["C3"], 1)
            self.assertIn("2 record(s)", V.format_summary(summary))


class TestDeterminism(unittest.TestCase):

    def test_validate_is_byte_stable(self):
        statements = CLEAN_STATEMENTS + [
            '(: orphan (Agent sk_walk_9 sk_archivist_1) (STV 1.0 0.99))',
            '(: dup_expr (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: BadName (Beneficiery sk_scan_1 sk_archivist_1) (STV 1.0 1.0))',
        ]
        runs = [json.dumps(run_checks(statements), sort_keys=True) for _ in range(3)]
        self.assertEqual(len(set(runs)), 1)

    def test_findings_are_ordered_by_statement_then_code(self):
        result = run_checks([
            '(: dup (Member sk_scan_1 scan) (STV 1.0 0.99))',
            '(: dup (Beneficiery sk_scan_1 sk_archivist_1) (STV 1.0 1.0))',
        ])
        order = [(f["statement_index"], f["code"]) for f in result["findings"]]
        self.assertEqual(order, sorted(order, key=lambda p: (p[0], V.CHECKS.index(p[1]))))

    def test_build_record_is_reproducible(self):
        a = json.dumps(R.build_record(ITEM, CLEAN_STATEMENTS, 1, PROVENANCE), sort_keys=True)
        b = json.dumps(R.build_record(ITEM, CLEAN_STATEMENTS, 1, PROVENANCE), sort_keys=True)
        self.assertEqual(a, b)


if __name__ == "__main__":
    unittest.main(verbosity=2)
