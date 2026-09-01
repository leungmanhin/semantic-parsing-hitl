"""G.2 — exclusion-by-disposition substrate gate (pre-flight for H).

Builds the MINING substrate manifest from the parse stores: which (id, run)
rows mining may canonicalize and mine. Two mechanical exclusion channels:

1. **Triage dispositions** (`triage/parse_failures.jsonl`, (id, run)-scoped):
   `review-defect`, `reparse-queued`, `excluded-deferred-gap`, and `open` rows
   exclude that parse; `reviewed-ok`, `adjudicated-ok`, `accepted-with-gap`,
   and `repaired-promoted-r90` do not.
2. **Validator severities** (G.1 `STRICT_SEVERITY`): any finding whose code
   maps to `error` (C1/C2/C3/C6/C7) excludes the row — the mechanical belt
   for records the sampled review never looked at.

Run precedence: among a record's rows at allowed prompt hashes, the HIGHEST
run wins (promoted repairs run 90 > D.4 re-parse run 40 > campaign run 2 >
run 1); precedence applies before exclusion, and an excluded winner does NOT
fall back to a superseded run (superseded parses left the substrate when
their successor landed).

Pair-awareness (Tier C): when one side of a `pairC-*` paraphrase pair is
excluded, the mate is annotated `pair_incomplete` — it still serves
non-pair miners, but the alignment channel loses the pair, and silently
losing pairs is exactly what the annotation exists to prevent.

Measurement corpora are EXEMPT by construction: this gate feeds mining only;
M1/M2/M5 harnesses read their own parse sets directly (M1 keeps its unstable
parses — instability is its measurand).

Deterministic; no clock. The hash composition of the included set is
reported — whether H mines a mixed-hash substrate (campaign f6448eac +
re-parse wave bb7c4b71) is an H-time decision this script surfaces, not one
it makes.

Usage:
  python substrate.py --store ../parses/tierB.parses.jsonl \
      --store ../parses/tierC_r40.parses.jsonl [--store ../parses/tierC.parses.jsonl] \
      --corpus ../corpora/tierB.jsonl --corpus ../corpora/tierC.jsonl \
      [--allowed-hash f6448eac --allowed-hash bb7c4b71] \
      [--out ../mining/mining_substrate.json]
"""

from __future__ import annotations

import argparse
import collections
import json
import os

from validator import STRICT_SEVERITY

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)

EXCLUDING = {"review-defect", "reparse-queued", "excluded-deferred-gap", "open"}
INCLUDING = {"reviewed-ok", "adjudicated-ok", "accepted-with-gap", "repaired-promoted-r90"}


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--store", action="append", required=True)
    ap.add_argument("--corpus", action="append", default=[])
    ap.add_argument("--allowed-hash", action="append", default=None,
                    help="prompt_sha256 prefix; repeatable (default: f6448eac)")
    ap.add_argument("--out", default=os.path.join(FUSENF, "mining", "mining_substrate.json"))
    ap.add_argument("--metta-out", default=os.path.join(FUSENF, "mining", "mining_substrate.metta"),
                    help="readable MeTTa rendering of the included records (owner 2026-09-01); "
                         "'' disables")
    args = ap.parse_args()
    allowed = tuple(args.allowed_hash or ["f6448eac"])

    triage = {}
    for r in load(os.path.join(FUSENF, "triage", "parse_failures.jsonl")):
        triage[(r["id"], r.get("run"))] = r.get("disposition", "open")
    unknown = {d for d in triage.values()} - EXCLUDING - INCLUDING
    if unknown:
        raise SystemExit(f"REFUSED: unknown triage disposition(s) {sorted(unknown)} — "
                         f"extend the policy tables first, never guess.")

    sentences = {}
    pair_meta = {}
    for path in args.corpus:
        for r in load(path):
            if r.get("sentences"):
                sentences[r["id"]] = r["sentences"][0]
            ec = r.get("equiv_class") or ""
            if ec.startswith("pairC"):
                pair_meta[r["id"]] = (ec, (r.get("labels") or {}).get("side"))

    # candidate rows at allowed hashes; highest run wins per id
    best = {}
    for path in args.store:
        for r in load(path):
            h = (r.get("parser") or {}).get("prompt_sha256", "")
            if not h.startswith(allowed):
                continue
            key = r["id"]
            if key not in best or r.get("run", 0) > best[key]["run"]:
                best[key] = {"id": r["id"], "run": r.get("run", 0), "hash8": h[:8],
                             "findings": [f["code"] for f in
                                          (r.get("validation") or {}).get("findings", [])]}

    included, excluded = [], []
    for cid in sorted(best):
        row = best[cid]
        disp = triage.get((cid, row["run"]))
        err_codes = sorted({c for c in row["findings"]
                            if STRICT_SEVERITY.get(c) == "error"})
        if disp in EXCLUDING:
            excluded.append({"id": cid, "run": row["run"],
                             "reason": "disposition:%s" % disp})
        elif err_codes:
            excluded.append({"id": cid, "run": row["run"],
                             "reason": "validator:%s" % "+".join(err_codes)})
        else:
            included.append({"id": cid, "run": row["run"], "hash8": row["hash8"]})

    excluded_ids = {e["id"] for e in excluded}
    by_pair = collections.defaultdict(list)
    for cid, (ec, side) in pair_meta.items():
        if cid in best:
            by_pair[ec].append(cid)
    incomplete = []
    for row in included:
        pm = pair_meta.get(row["id"])
        if not pm:
            continue
        mates = [m for m in by_pair[pm[0]] if m != row["id"]]
        if any(m in excluded_ids for m in mates) or not mates:
            row["pair_incomplete"] = True
            incomplete.append(row["id"])

    comp = collections.Counter(r["hash8"] for r in included)
    reasons = collections.Counter(e["reason"] for e in excluded)
    out = {
        "allowed_hashes": list(allowed),
        "strict_severity": STRICT_SEVERITY,
        "included": included, "excluded": excluded,
        "pairs_incomplete": sorted(incomplete),
        "hash_composition": dict(sorted(comp.items())),
        "exclusion_reasons": dict(sorted(reasons.items())),
    }
    json.dump(out, open(args.out, "w", encoding="utf-8"), indent=1, sort_keys=True)
    print(f"-> {args.out}")

    if args.metta_out:
        wanted = {(r["id"], r["run"]): i for i, r in enumerate(included)}
        stmts = {}
        for path in args.store:
            for r in load(path):
                key = (r["id"], r.get("run", 0))
                if key in wanted:
                    stmts[key] = r.get("statements", [])
        missing = [k for k in wanted if k not in stmts]
        if missing:
            raise SystemExit(f"metta export: {len(missing)} included rows not found in stores "
                             f"(first: {missing[:3]}) — stores/manifest out of sync.")
        with open(args.metta_out, "w", encoding="utf-8") as fh:
            fh.write(";; FUSE-NF mining substrate — readable MeTTa RENDERING (never loaded:\n"
                     ";; statement names are record-scoped and collide across records).\n"
                     f";; Generated with {os.path.basename(args.out)}: "
                     f"{len(included)} records included / {len(excluded)} excluded; "
                     f"hash composition {dict(sorted(comp.items()))}; "
                     f"allowed hashes {list(allowed)}.\n\n")
            for row in included:
                key = (row["id"], row["run"])
                sent = sentences.get(row["id"])
                flag = "  [pair-incomplete]" if row.get("pair_incomplete") else ""
                fh.write(f";; {row['id']}  run {row['run']}  @{row['hash8']}{flag}\n")
                if sent:
                    fh.write(f";;   \"{sent}\"\n")
                for s in stmts[key]:
                    fh.write(s + "\n")
                fh.write("\n")
        n_stmts = sum(len(stmts[(r['id'], r['run'])]) for r in included)
        print(f"-> {args.metta_out}  ({len(included)} records, {n_stmts} statements)")
    print(f"included {len(included)}  excluded {len(excluded)}  "
          f"pair-incomplete {len(incomplete)}")
    print(f"hash composition: {dict(sorted(comp.items()))}")
    print(f"exclusion reasons: {dict(sorted(reasons.items()))}")


if __name__ == "__main__":
    main()
