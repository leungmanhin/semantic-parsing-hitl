"""Assemble a TIER-FILTERED mining substrate from existing canonical stores (owner 2026-09-23: explore what the §4.3
methods yield on Tier A + B and on Tier B alone, beside the H substrate, which stays untouched).

Each ``--source PATH:TIER`` takes every record of PATH whose id starts with TIER (e.g. ``canonical_substrate.jsonl:tierB``
= the G.2-gated H rows of Tier B; ``out_ecmp/canonical_iteme.jsonl:tierA`` = the 402 item-E rows of Tier A, the frozen
batch-1 answer key, NOT passed through the substrate gate — exactly as item-E used them). Records are written sorted by
id to ``<out-dir>/canonical_substrate.jsonl``; ``<out-dir>/MANIFEST.json`` records the sources (sha16, records taken,
runs), the canon version (mixed versions are refused), the prompt-hash composition per tier (from the H substrate manifest
for gated rows, from the parse store for the rest) and the output's sha256. Deterministic; no clock (date passed in).

Usage:
  python tier_substrate.py --source canonical_substrate.jsonl:tierB --source out_ecmp/canonical_iteme.jsonl:tierA \\
      --out-dir out_tier_ab --date 2026-09-23 --note "..."
"""
from __future__ import annotations

import argparse
import collections
import hashlib
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)


def sha16(path):
    return hashlib.sha256(open(path, "rb").read()).hexdigest()[:16]


def hash_composition(tier, rows):
    """prompt-hash composition of the taken rows: the H substrate manifest for gated tiers, else the parse store"""
    ms_path = os.path.join(HERE, "mining_substrate.json")
    keyed = {(r["id"], r["run"]): r for r in rows}
    out = collections.Counter()
    if os.path.exists(ms_path):
        for row in json.load(open(ms_path, encoding="utf-8"))["included"]:
            if (row["id"], row["run"]) in keyed:
                out[row["hash8"]] += 1
    if sum(out.values()) == len(rows):
        return dict(out), "mining_substrate.json"
    store = os.path.join(FUSENF, "parses", f"{tier}.parses.jsonl")
    out = collections.Counter()
    if os.path.exists(store):
        for ln in open(store, encoding="utf-8"):
            p = json.loads(ln)
            if (p["id"], p.get("run")) in keyed:
                h = next((str(v) for k, v in p.items() if re.search(r"sha|hash", k) and isinstance(v, str) and re.fullmatch(r"[0-9a-f]{8,64}", v)), None)
                out[(h or "unknown")[:8]] += 1
    return dict(out), (f"parses/{tier}.parses.jsonl" if out else "unknown")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", action="append", required=True, help="PATH:TIER (repeatable)")
    ap.add_argument("--out-dir", required=True)
    ap.add_argument("--date", required=True)
    ap.add_argument("--note", default="")
    args = ap.parse_args()
    records, sources, versions = [], [], set()
    for spec in args.source:
        path, tier = spec.rsplit(":", 1)
        rows = [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]
        taken = [r for r in rows if r["id"].startswith(tier)]
        if not taken:
            raise SystemExit(f"{path}: no record with id prefix {tier}")
        versions.update(r.get("canon_version") for r in taken)
        comp, comp_src = hash_composition(tier, taken)
        sources.append({"path": os.path.relpath(path, HERE), "sha16": sha16(path), "tier": tier, "records_in_file": len(rows),
                        "records_taken": len(taken), "runs": dict(sorted(collections.Counter(r["run"] for r in taken).items())),
                        "hash_composition": comp, "hash_source": comp_src})
        records.extend(taken)
    if len(versions) != 1:
        raise SystemExit(f"mixed canon versions {versions}")
    ids = [r["id"] for r in records]
    if len(set(ids)) != len(ids):
        raise SystemExit("duplicate record ids across sources")
    records.sort(key=lambda r: r["id"])
    os.makedirs(args.out_dir, exist_ok=True)
    out = os.path.join(args.out_dir, "canonical_substrate.jsonl")
    with open(out, "w", encoding="utf-8") as fh:
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    manifest = {"built": args.date, "note": args.note, "canon_version": versions.pop(), "sources": sources,
                "records": len(records), "per_tier": dict(sorted(collections.Counter(r["id"].split("-")[0] for r in records).items())),
                "atoms": sum(len(r["atoms"]) for r in records), "canonical_jsonl": os.path.relpath(out, HERE),
                "canonical_jsonl_sha16": sha16(out), "methods": {}}
    json.dump(manifest, open(os.path.join(args.out_dir, "MANIFEST.json"), "w", encoding="utf-8"), indent=1, ensure_ascii=False)
    print(f"-> {out}: {len(records)} records {manifest['per_tier']}, {manifest['atoms']} atoms, sha16 {manifest['canonical_jsonl_sha16']}")


if __name__ == "__main__":
    main()
