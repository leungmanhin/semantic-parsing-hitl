"""FUSE-NF — vocabulary attestation sweep + re-pin (THE standard update procedure).

Run whenever the validator reports the vocabulary stale (its meta pins no longer match
`prompt.txt` / `seeded_rules.metta`). Mechanical fields are regenerated from the three
attestation sources pinned in `meta.attestation_sources` — the CURATED artifacts only
(regression goldens, e2e harness, seeded rules). NEVER point this script at parse output:
attested open-class heads are whitelisted for C4, and only curated sources are ground truth.

Report mode (default) prints what would change and everything needing human adjudication:
  * heads in the sources that are neither operators, deprecated, open-class nor skolem;
  * non-variadic operators attested at an arity outside their declared signature.
`--write` updates ONLY the mechanical fields — per-operator `attested` blocks, variadic
heads' attested arity lists, `open_class.attested_heads` / `skolem_function_heads`,
`declared_but_unattested`, and the meta pins (hashes, line/rule/statement counts, revision
note). Declared arities of non-variadic heads, classes, glosses, flags and everything
`_adjudicated` are human decisions and are never touched.

Usage (from fusenf/harness):
  python vocab_attest.py --date 2026-08-18 [--write]
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from records import is_number, is_variable, iter_terms, parse_sexp  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
ROOT = os.path.dirname(FUSENF)

SKOLEM_FN_RE = re.compile(r"^sk_[a-z0-9_]*$")
UPPER_CAMEL_RE = re.compile(r"^[A-Z][A-Za-z0-9]*$")

SOURCES = {
    "goldens": os.path.join(ROOT, "regression", "regression_cases.md"),
    "e2e": os.path.join(ROOT, "regression", "e2e_regression.py"),
    "seeded": os.path.join(ROOT, "seeded_rules.metta"),
}


def sha256(path: str) -> str:
    with open(path, "rb") as fh:
        return hashlib.sha256(fh.read()).hexdigest()


def extract_statements(text: str) -> list[str]:
    """Every balanced `(: …)` or `(Interpretation …)` s-expression in the text.

    Wrapper forms are scanned too — else the Interpretation head itself never
    appears in any extracted statement (the `(: ` scan grabs only its interior).
    A wrapper's inner assertion is still captured separately by the `(: ` scan;
    the resulting double-count of inner atoms is harmless for attestation.
    """
    out = []
    for marker in ("(: ", "(Interpretation "):
        out += _extract_marker(text, marker)
    return out


def _extract_marker(text: str, marker: str) -> list[str]:
    out = []
    i = 0
    while True:
        i = text.find(marker, i)
        if i < 0:
            break
        depth, j = 0, i
        while j < len(text):
            ch = text[j]
            if ch == "(":
                depth += 1
            elif ch == ")":
                depth -= 1
                if depth == 0:
                    break
            j += 1
        if depth == 0 and j > i:
            out.append(text[i:j + 1])
            i = j + 1
        else:
            break  # unbalanced tail — stop rather than loop
    return out


def collect(vocab: dict) -> tuple[dict, dict]:
    """{(head, arity): {source: count}} over all sources, engine arg-tuples excluded."""
    counts: dict = {}
    totals: dict = {}
    ops = vocab.get("operators") or {}

    def op_class(head: str, arity: int):
        op = ops.get(head)
        if not op:
            return None
        for sense in op.get("senses") or []:
            if sense.get("arity") == arity:
                return sense.get("class", op.get("class"))
        return op.get("class")

    for source, path in SOURCES.items():
        with open(path, "r", encoding="utf-8") as fh:
            text = fh.read()
        stmts = extract_statements(text)
        totals[source] = len(stmts)
        for stmt in stmts:
            tree = parse_sexp(stmt)
            node = tree["node"]
            if node is None:
                continue
            skip: set = set()
            for term in iter_terms(node):
                head = term[0] if term and isinstance(term[0], str) else None
                if head and head != ":" and not is_variable(head) \
                        and op_class(head, len(term) - 1) == "engine":
                    for arg in term[1:]:
                        if isinstance(arg, list):
                            skip.add(id(arg))
            for term in iter_terms(node):
                if id(term) in skip:
                    continue
                head = term[0] if term and isinstance(term[0], str) else None
                if head is None or is_variable(head) or is_number(head):
                    continue
                key = (head, len(term) - 1)
                counts.setdefault(key, {}).setdefault(source, 0)
                counts[key][source] += 1
    return counts, totals


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--vocab", default=os.path.join(FUSENF, "specs", "vocabulary.json"))
    ap.add_argument("--date", required=True)
    ap.add_argument("--write", action="store_true")
    args = ap.parse_args()

    with open(args.vocab, "r", encoding="utf-8") as fh:
        vocab = json.load(fh)
    ops = vocab["operators"]
    deprecated = vocab.get("deprecated_operators") or {}
    oc = vocab.setdefault("open_class", {})
    obliques = set(oc.get("oblique_prepositions") or [])

    counts, totals = collect(vocab)

    # --- fold (head, arity) observations into per-head buckets --------------
    by_head: dict = {}
    for (head, arity), srcs in counts.items():
        b = by_head.setdefault(head, {"arities": {}, "sources": set(), "n": 0})
        b["arities"][arity] = b["arities"].get(arity, 0) + sum(srcs.values())
        b["sources"] |= set(srcs)
        b["n"] += sum(srcs.values())

    unknown, arity_flags, deprecated_hits = [], [], []
    open_attested, skolem_heads = set(), set()
    for head, b in sorted(by_head.items()):
        if head == ":" or head in ops:
            if head != ":" and not ops[head].get("variadic"):
                declared = set(ops[head].get("arities") or [])
                for a in sorted(b["arities"]):
                    if a not in declared:
                        arity_flags.append(f"{head}: attested arity {a} not in declared {sorted(declared)}")
            continue
        if head in deprecated:
            deprecated_hits.append(f"{head} (n={b['n']}) — deprecated but still in a curated source")
            continue
        if SKOLEM_FN_RE.match(head):
            skolem_heads.add(head)
            continue
        if head in obliques or UPPER_CAMEL_RE.match(head):
            open_attested.add(head)
            if head not in obliques and head not in set(oc.get("attested_heads") or []):
                print(f"note: new open-class head {head!r} (n={b['n']}, {sorted(b['sources'])}) — curated source, auto-whitelisted on --write")
            continue
        unknown.append(f"{head!r} arities {sorted(b['arities'])} n={b['n']} {sorted(b['sources'])}")

    unattested = sorted(h for h in ops if h not in by_head and h != ":")

    print(f"sources: " + ", ".join(f"{s}={n} statements" for s, n in totals.items()))
    print(f"heads: {len(by_head)} distinct | operators attested: {len([h for h in by_head if h in ops])} | "
          f"open-class attested: {len(open_attested)} | skolem: {len(skolem_heads)}")
    for title, rows in (("UNKNOWN heads (adjudicate!)", unknown),
                        ("arity flags (adjudicate!)", arity_flags),
                        ("deprecated heads attested (migrate the source!)", deprecated_hits),
                        ("declared but unattested", unattested)):
        print(f"-- {title}: {len(rows)}")
        for r in rows:
            print("   " + str(r))

    if not args.write:
        print("\nreport-only; rerun with --write to update mechanical fields + re-pin")
        return

    # --- mechanical updates only ---------------------------------------------
    for head, entry in ops.items():
        b = by_head.get(head)
        if b:
            entry["attested"] = {
                "arities": {str(a): n for a, n in sorted(b["arities"].items())},
                "n": b["n"], "sources": sorted(b["sources"]),
            }
            if entry.get("variadic"):
                entry["arities"] = sorted(b["arities"])
        else:
            entry.pop("attested", None)
    oc["attested_heads"] = sorted(set(open_attested) - obliques)
    oc["skolem_function_heads"] = sorted(skolem_heads)
    vocab["declared_but_unattested"] = {
        "note": (vocab.get("declared_but_unattested") or {}).get(
            "note", "Declared in prompt.txt but exercised by no attestation source."),
        "heads": unattested,
    }
    meta = vocab["meta"]
    meta["prompt_sha256"] = sha256(os.path.join(ROOT, "prompt.txt"))
    meta["seeded_sha256"] = sha256(os.path.join(ROOT, "seeded_rules.metta"))
    with open(os.path.join(ROOT, "prompt.txt"), encoding="utf-8") as fh:
        meta["prompt_lines"] = sum(1 for _ in fh)
    meta["seeded_rules"] = totals["seeded"]
    meta["revised"] = args.date
    meta["revision_note"] = (
        f"mechanical attestation sweep by harness/vocab_attest.py: "
        f"goldens {totals['goldens']}, e2e {totals['e2e']}, seeded {totals['seeded']} statements; "
        f"attestation blocks, open-class/skolem lists and pins regenerated; "
        f"declared fields untouched."
    )
    meta.setdefault("maintenance", (
        "When validator.py reports the vocabulary STALE (pins != live prompt.txt/"
        "seeded_rules.metta): run harness/vocab_attest.py --date <today>, adjudicate any "
        "UNKNOWN heads or arity flags it prints (edit operators by hand — declared fields "
        "are human decisions), then rerun with --write to regenerate attestation fields and "
        "re-pin. Full two-extractor reconciliation (meta.method) is only needed when "
        "prompt.txt's operator sections materially change."))
    with open(args.vocab, "w", encoding="utf-8") as fh:
        json.dump(vocab, fh, indent=1)
        fh.write("\n")
    print(f"\n-> wrote {args.vocab} (pins {meta['prompt_sha256'][:12]}…/{meta['seeded_sha256'][:12]}…)")


if __name__ == "__main__":
    main()
