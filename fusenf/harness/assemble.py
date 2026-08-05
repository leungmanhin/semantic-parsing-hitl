"""FUSE-NF — assemble raw parser-agent output into faithful parse records.

    corpora/<tier>.jsonl + raw/<id>__run<N>.txt
        -> parses/<tier>.parses.jsonl        (append-only, schema.md §3)
        -> triage/parse_failures.jsonl       (schema.md §6, one entry per flagged record)

Deterministic end to end: every provenance value (model, prompt/seeded hashes, harness
version, batch, date) is a CLI argument. Nothing here reads a clock, and re-running over the
same inputs produces byte-identical records.

Report-only (schema.md §5.1): a record with findings is still written to the parses file and
*also* queued in triage. Nothing is quarantined until the pilot distribution says what
should be.

Example:

    /home/manhin/Dev/.venv-dev/bin/python assemble.py \\
        --corpus ../corpora/pilot.jsonl --raw-dir ../raw \\
        --model claude-sonnet-5 --date 2026-07-28 \\
        --prompt-sha256 $(sha256sum ../../prompt.txt | cut -d' ' -f1) \\
        --seeded-sha256 $(sha256sum ../../seeded_rules.metta | cut -d' ' -f1)
"""

from __future__ import annotations

import argparse
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import records as R  # noqa: E402
import validator as V  # noqa: E402
import impl_syntax as IMPL  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)

DEFAULT_VOCAB = os.path.join(FUSENF, "specs", "vocabulary.json")
DEFAULT_RAW = os.path.join(FUSENF, "raw")
DEFAULT_PARSES = os.path.join(FUSENF, "parses")
DEFAULT_TRIAGE = os.path.join(FUSENF, "triage", "parse_failures.jsonl")

RAW_NAME_RE = re.compile(r"^(?P<id>.+)__run(?P<run>\d+)\.txt$")


def discover_runs(raw_dir: str, item_id: str) -> list[int]:
    """Runs present on disk for one item, ascending. Directory order is never trusted."""
    if not os.path.isdir(raw_dir):
        return []
    runs = []
    for name in sorted(os.listdir(raw_dir)):
        m = RAW_NAME_RE.match(name)
        if m and m.group("id") == item_id:
            runs.append(int(m.group("run")))
    return sorted(runs)


def triage_entry(record: dict, result: dict, date: str) -> dict:
    """schema.md §6. `errors`/`warnings` stay empty while the validator is report-only."""
    return {
        "id": record.get("id"),
        "run": record.get("run"),
        "date": date,
        "sentences": record.get("sentences"),
        "statements": record.get("statements"),
        "errors": [f for f in result["findings"] if f["severity"] == "error"],
        "warnings": [f for f in result["findings"] if f["severity"] == "warn"],
        "findings": result["findings"],
        "codes": sorted({f["code"] for f in result["findings"]}),
        "disposition": "open",
        "resolution": None,
    }


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(
        description="Assemble raw parser output into faithful parse records.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    ap.add_argument("--corpus", required=True, help="corpus JSONL (fusenf/corpora/<tier>.jsonl)")
    ap.add_argument("--raw-dir", default=DEFAULT_RAW, help="directory of <id>__run<N>.txt files")
    ap.add_argument("--tier", default=None, help="output stem; defaults to the corpus file stem")
    ap.add_argument("--runs", default="auto",
                    help="'auto' (every run file present) or a comma-separated list, e.g. 1,2,3")
    ap.add_argument("--out-dir", default=DEFAULT_PARSES)
    ap.add_argument("--triage", default=DEFAULT_TRIAGE)
    ap.add_argument("--vocab", default=DEFAULT_VOCAB)

    ap.add_argument("--model", required=True, help="concrete model id resolved at parse time")
    ap.add_argument("--prompt-sha256", required=True)
    ap.add_argument("--seeded-sha256", required=True)
    ap.add_argument("--harness", default=R.HARNESS_VERSION)
    ap.add_argument("--batch", default=None)
    ap.add_argument("--date", required=True, help="YYYY-MM-DD — passed in, never read off a clock")

    ap.add_argument("--no-c7", action="store_true", help="skip the chainer smoke test (slow)")
    ap.add_argument("--strict", action="store_true", help="map codes to error/warn severities")
    ap.add_argument("--dry-run", action="store_true", help="validate and report, write nothing")
    args = ap.parse_args(argv)

    tier = args.tier or os.path.splitext(os.path.basename(args.corpus))[0]
    parses_path = os.path.join(args.out_dir, f"{tier}.parses.jsonl")

    items = R.read_jsonl(args.corpus)
    if not items:
        print(f"no corpus items in {args.corpus}")
        return 1
    vocab = V.load_vocab(args.vocab)
    corpus_index = {item["id"]: item for item in items if item.get("id")}
    existing = {R.record_key(rec) for rec in R.read_jsonl(parses_path)}

    provenance = {
        "model": args.model,
        "prompt_sha256": args.prompt_sha256,
        "seeded_sha256": args.seeded_sha256,
        "harness": args.harness,
        "batch": args.batch,
        "date": args.date,
    }

    if args.runs.strip() == "auto":
        wanted = None
    else:
        wanted = [int(r) for r in args.runs.replace(" ", "").split(",") if r]

    built: list[tuple[dict, dict]] = []  # (record, result) — result filled in after C7
    missing: list[str] = []
    skipped: list[tuple[str, int]] = []
    for item in items:
        item_id = item.get("id")
        runs = discover_runs(args.raw_dir, item_id) if wanted is None else wanted
        if not runs:
            missing.append(f"{item_id} (no raw file)")
            continue
        for run in runs:
            path = R.raw_path(args.raw_dir, item_id, run)
            if not os.path.exists(path):
                missing.append(os.path.basename(path))
                continue
            if (item_id, run) in existing:
                skipped.append((item_id, run))
                continue
            with open(path, "r", encoding="utf-8") as fh:
                raw_text = fh.read()
            statements, strip_log = R.extract_atoms(raw_text)
            # PeTTaChainer cfe25f9 dropped the (Premises ...)/(Conclusions ...) implication
            # wrappers. Normalize HERE rather than rewriting raw/: those files are the provenance
            # record of what a given model emitted under a given prompt_sha256, and editing them
            # would falsify that. The converter is idempotent, so parses from before and after the
            # prompt migration assemble to the same shape.
            statements, n_converted = zip(*(IMPL.convert(s) for s in statements)) \
                if statements else ((), ())
            statements = list(statements)
            record = R.build_record(item, statements, run, provenance)
            record["extraction"] = {
                "raw_file": os.path.basename(path),
                "strip_log": strip_log,
                "impl_syntax_converted": sum(n_converted),
            }
            built.append((record, None))

    # A raw file whose id is in no corpus item is almost always a typo'd filename.
    orphans = sorted(
        name for name in (os.listdir(args.raw_dir) if os.path.isdir(args.raw_dir) else [])
        if RAW_NAME_RE.match(name) and RAW_NAME_RE.match(name).group("id") not in corpus_index
    )

    if not built:
        print(f"nothing to assemble: {len(missing)} missing raw file(s), "
              f"{len(skipped)} already present in {parses_path}")
        for name in missing[:10]:
            print(f"  missing: {name}")
        # Everything already assembled is a no-op, not a failure; nothing at all is a mistake.
        return 0 if skipped else 1

    # C1-C6 + C8 per record; C7 batched — one chainer class load for the whole file.
    chainer_cls = None if args.no_c7 else V._load_chainer()
    finished: list[tuple[dict, dict]] = []
    for record, _ in built:
        result = V.validate(record, vocab, corpus_index, include_c7=not args.no_c7,
                            strict=args.strict, chainer_cls=chainer_cls)
        R.attach_validation(record, V.validation_block(result))
        finished.append((record, result))

    triage = [triage_entry(rec, res, args.date) for rec, res in finished if not res["ok"]]

    if not args.dry_run:
        R.write_jsonl(parses_path, [rec for rec, _ in finished])
        if triage:
            R.write_jsonl(args.triage, triage, allow_duplicate_keys=True)

    # ---- summary -----------------------------------------------------------
    by_code = {code: 0 for code in V.CHECKS}
    for _, result in finished:
        for finding in result["findings"]:
            by_code[finding["code"]] += 1
    statements_total = sum(len(rec["statements"]) for rec, _ in finished)
    stripped_total = sum(len(rec["extraction"]["strip_log"]) for rec, _ in finished)
    clean = sum(1 for _, result in finished if result["ok"])

    print(f"corpus      {args.corpus}  ({len(items)} items)")
    print(f"raw         {args.raw_dir}"
          f"  ({len(built)} file(s) read, {len(missing)} missing, {len(skipped)} already assembled)")
    print(f"records     {len(finished)}  ({statements_total} statements, "
          f"{stripped_total} wrapper line(s) stripped)")
    print(f"validation  {clean} clean, {len(finished) - clean} with findings"
          f"{'' if not args.no_c7 else '   [C7 skipped]'}"
          f"{'   [strict]' if args.strict else '   [report-only]'}")
    print("  by code:  " + ", ".join(f"{c}={by_code[c]}" for c in V.CHECKS))
    for record, result in finished:
        if not result["ok"]:
            codes = ", ".join(sorted({f["code"] for f in result["findings"]}))
            print(f"  {record['id']} run {record['run']}: "
                  f"{len(result['findings'])} finding(s) [{codes}]")
            for finding in result["findings"][:5]:
                where = "" if finding["statement_index"] is None else f"stmt {finding['statement_index']}: "
                print(f"      {finding['code']} {where}{finding['detail']}")
    for name in missing[:10]:
        print(f"  missing: {name}")
    if len(missing) > 10:
        print(f"  … and {len(missing) - 10} more missing")
    for name in orphans[:10]:
        print(f"  orphan raw file (id not in the corpus): {name}")
    if args.dry_run:
        print("dry run — nothing written")
    else:
        print(f"wrote       {parses_path}")
        if triage:
            print(f"triage      {args.triage}  ({len(triage)} entry/entries)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
