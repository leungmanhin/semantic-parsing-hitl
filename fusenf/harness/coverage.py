"""FUSE-NF per-corpus coverage dashboard (#51 reshape, owner 2026-08-29).

One deterministic table answering: what is parsed, at which prompt hash, and what state
is each record in — under the five-state lifecycle (no repair branch):

    never-parsed | clean (unreviewed) | verified (review-yes / adjudicated-accept /
    triage-included) | flagged-open (review partial|no, unresolved) |
    defect-awaiting-reparse (triage-excluded)

Coverage of the CURRENT prompt over a corpus = % of records whose operative parse is at
the current hash AND verified. Operative parse per id = highest run at any hash
(substrate precedence). Evidence precedence per (id, run):
triage disposition > adjudication decision > review verdict > (validation findings only
never demote — they are report-only).

Usage:  python coverage.py [--out ../eval/coverage.md]
"""

from __future__ import annotations

import argparse
import glob
import hashlib
import json
import os
import re
from collections import Counter, defaultdict

import sys as _sys
_sys.path.insert(0, HERE) if False else None

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
ROOT = os.path.dirname(FUSENF)
import sys
sys.path.insert(0, HERE)
from validator import STRICT_SEVERITY  # noqa: E402

# corpus -> (roster jsonl, [parse store globs], role)
CORPORA = {
    "tierA":    ("tierA.jsonl",    ["tierA.parses.jsonl", "tierA_p1.parses.jsonl",
                                    "tierA_p2.parses.jsonl", "tierA_p3.parses.jsonl"], "M4 answer key (frozen batch-1)"),
    "tierB":    ("tierB.jsonl",    ["tierB.parses.jsonl"], "substrate"),
    "tierC":    ("tierC.jsonl",    ["tierC_p1.parses.jsonl", "tierC_p2.parses.jsonl",
                                    "tierC_p3.parses.jsonl", "tierC_r40.parses.jsonl",
                                    "tierC.parses.jsonl", "reparse30.parses.jsonl"], "substrate", (1, 360)),
    "tierC_heldout": ("tierC.jsonl",    ["tierC_heldout.parses.jsonl"], "measurement (M2 held-out)", (361, 1000)),
    "tierD":    ("tierD.jsonl",    ["tierD.parses.jsonl"], "measurement (M2)"),
    "fiction":  ("fiction.jsonl",  ["fiction.parses.jsonl"], "external consumer"),
    "fixpack":  ("fixpack.jsonl",  ["fixpack.parses.jsonl"], "validation"),
    "fixpack3": ("fixpack3.jsonl", ["fixpack3.parses.jsonl"], "validation"),
    "fixpack31": ("fixpack31.jsonl", ["fixpack31.parses.jsonl"], "validation"),
    "fixpack4": ("fixpack4.jsonl", ["fixpack4.parses.jsonl"], "validation"),
    "pilot":    ("pilot.jsonl",    ["pilot.parses.jsonl"], "validation (batch 1)"),
}

INCLUDING = {"reviewed-ok", "adjudicated-ok", "accepted-with-gap", "repaired-promoted-r90"}
EXCLUDING_PREFIXES = ("review-defect", "excluded-deferred-gap", "validator:")


def current_hash() -> str:
    with open(os.path.join(ROOT, "prompt.txt"), "rb") as fh:
        return hashlib.sha256(fh.read()).hexdigest()


def load_operative_parses():
    """(id -> (run, hash)) via highest-run precedence, plus per-store presence."""
    best = {}
    for stores in {s for spec in CORPORA.values() for s in spec[1]}:
        path = os.path.join(FUSENF, "parses", stores)
        if not os.path.exists(path):
            continue
        for ln in open(path):
            p = json.loads(ln)
            rid, run = p["id"], p.get("run", 1)
            h = p.get("parser", {}).get("prompt_sha256", "?")
            g1 = any(STRICT_SEVERITY.get(f.get("code")) == "error"
                     for f in p.get("validation", {}).get("findings", []))
            if rid not in best or run > best[rid][0]:
                best[rid] = (run, h, g1)
    return best


def load_triage():
    t = {}
    path = os.path.join(FUSENF, "triage", "parse_failures.jsonl")
    if os.path.exists(path):
        for ln in open(path):
            row = json.loads(ln)
            t[(row["id"], row.get("run", 1))] = row.get("disposition", "open")
    return t


def load_reviews():
    """(id, run) -> q1 verdict."""
    out = {}
    for f in glob.glob(os.path.join(FUSENF, "review", "*.review.json")):
        m = re.match(r"(.+)__run(\d+)\.review\.json$", os.path.basename(f))
        if not m:
            continue
        try:
            r = json.load(open(f))
        except Exception:
            continue
        out[(m.group(1), int(m.group(2)))] = r.get("q1_faithful", "?")
    return out


def load_adjudications():
    """(id, run) -> decision (accept | repair/defect); any tag."""
    out = {}
    for f in glob.glob(os.path.join(FUSENF, "adjudication", "*.adj.json")):
        m = re.match(r"(.+)__run(\d+)\.\w+\.adj\.json$", os.path.basename(f))
        if not m:
            continue
        try:
            a = json.load(open(f))
        except Exception:
            continue
        out[(m.group(1), int(m.group(2)))] = a.get("decision", "?")
    return out


def classify(rid, best, triage, reviews, adj):
    if rid not in best:
        return None, None, "never-parsed"
    run, h, g1 = best[rid]
    key = (rid, run)
    disp = triage.get(key)
    if disp:
        if disp in INCLUDING:
            return run, h, "verified"
        if disp.startswith(EXCLUDING_PREFIXES):
            return run, h, "defect-awaiting-reparse"
        return run, h, "flagged-open"  # open / anything unresolved
    if g1:
        # G.1 mechanical belt: error-class validator finding excludes even untriaged rows
        return run, h, "defect-awaiting-reparse"
    d = adj.get(key)
    if d == "accept":
        return run, h, "verified"
    if d in ("repair", "defect"):
        return run, h, "defect-awaiting-reparse"
    q1 = reviews.get(key)
    if q1 == "yes":
        return run, h, "verified"
    if q1 in ("partial", "no"):
        return run, h, "flagged-open"
    return run, h, "clean-unreviewed"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(FUSENF, "eval", "coverage.md"))
    args = ap.parse_args()

    cur = current_hash()
    best = load_operative_parses()
    triage = load_triage()
    reviews = load_reviews()
    adj = load_adjudications()

    lines = [f"# Coverage dashboard — current prompt `{cur[:8]}`",
             "",
             "State vocabulary (#51 reshape): never-parsed / clean-unreviewed / verified "
             "(review-yes, adjudicated-accept, or triage-included) / flagged-open / "
             "defect-awaiting-reparse. Operative parse per id = highest run. "
             "**cur-coverage = verified AND at the current hash.** The substrate gate is "
             "EXCLUSION-based: clean-unreviewed records are substrate-eligible (sampled-review "
             "policy); substrate-elig = total − defect − flagged-open − never-parsed − G.1-belted (error-class validator structure, e.g. free variables, excludes a row from MINING mechanically even when review/adjudication accepted it semantically).",
             "",
             "| corpus | role | total | @cur hash | cur-coverage | verified (any hash) | "
             "clean-unrev | flagged-open | defect-awaiting | never-parsed | substrate-elig | hash mix (operative) |",
             "|---|---|---|---|---|---|---|---|---|---|---|---|"]
    for name, spec in CORPORA.items():
        roster, _stores, role = spec[0], spec[1], spec[2]
        id_range = spec[3] if len(spec) > 3 else None
        rpath = os.path.join(FUSENF, "corpora", roster)
        if not os.path.exists(rpath):
            continue
        ids = [json.loads(l)["id"] for l in open(rpath)]
        if id_range:
            lo, hi = id_range
            ids = [i for i in ids if lo <= int(i.rsplit("-", 1)[1]) <= hi]
        states = Counter()
        at_cur = ver_cur = 0
        hashes = Counter()
        g1_belted = 0
        for rid in ids:
            run, h, st = classify(rid, best, triage, reviews, adj)
            states[st] += 1
            if rid in best and best[rid][2] and st in ("verified", "clean-unreviewed"):
                g1_belted += 1  # G.1: error-class structure excludes from mining regardless of review
            if h is not None:
                hashes[h[:8]] += 1
                if h == cur:
                    at_cur += 1
                    if st == "verified":
                        ver_cur += 1
        n = len(ids)
        hmix = " ".join(f"{k}×{v}" for k, v in hashes.most_common())
        elig = (f"{n - states['defect-awaiting-reparse'] - states['flagged-open'] - states['never-parsed'] - g1_belted}"
                + (f" (−{g1_belted} G.1)" if g1_belted else "")
                if role.startswith("substrate") else "—")
        lines.append(
            f"| {name} | {role} | {n} | {at_cur} | {ver_cur} ({100*ver_cur/n:.0f}%) | "
            f"{states['verified']} | {states['clean-unreviewed']} | {states['flagged-open']} | "
            f"{states['defect-awaiting-reparse']} | {states['never-parsed']} | {elig} | {hmix} |")
    out = "\n".join(lines) + "\n"
    open(args.out, "w").write(out)
    print(out)
    print(f"-> {args.out}")


if __name__ == "__main__":
    main()
