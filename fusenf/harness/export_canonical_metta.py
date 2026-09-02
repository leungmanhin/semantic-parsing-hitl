"""Readable MeTTa rendering of the CANONICALIZED mining substrate (owner 2026-09-01).

Joins `mining/mining_substrate.json` (the gate's included (id, run) selection) to the
canonical stores and renders each record's canonical atoms with provenance + identity
hashes. RENDERING ONLY — canonical entity names (e0, x0, …) and proof names are
record-scoped and collide across records; never load this file as one KB.

Refuses mixed canon_version (per PIPELINE: analyses hold canon version uniform).
Hard-fails if any included row is missing from the canonical stores (sync check —
re-run canonicalize.py on the stale store).

Usage:  python export_canonical_metta.py [--out ../mining/canonical_substrate.metta]
"""

from __future__ import annotations

import argparse
import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)

CANON_STORES = ["tierB", "tierC_p1", "tierC_p2", "tierC_p3", "tierC_r40", "tierC"]
CORPORA = ["tierB.jsonl", "tierC.jsonl"]


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--manifest", default=os.path.join(FUSENF, "mining", "mining_substrate.json"))
    ap.add_argument("--out", default=os.path.join(FUSENF, "mining", "canonical_substrate.metta"))
    ap.add_argument("--jsonl-out", default=os.path.join(FUSENF, "mining", "canonical_substrate.jsonl"),
                    help="the SAME included rows as canonical JSONL, manifest order — the one input\n"
                         "every H miner reads (H, 2026-09-02); '' disables")
    args = ap.parse_args()

    man = json.load(open(args.manifest))
    included = man["included"]
    wanted = {(r["id"], r["run"]) for r in included}

    canon = {}
    versions = set()
    for s in CANON_STORES:
        path = os.path.join(FUSENF, "canonical", f"{s}.canon.jsonl")
        if not os.path.exists(path):
            continue
        for ln in open(path):
            c = json.loads(ln)
            key = (c["id"], c.get("run", 0))
            if key in wanted:
                canon[key] = c
                versions.add(c.get("canon_version"))

    missing = sorted(k for k in wanted if k not in canon)
    if missing:
        raise SystemExit(f"{len(missing)} included rows missing from canonical stores "
                         f"(first: {missing[:3]}) — re-run canonicalize.py.")
    if len(versions) > 1:
        raise SystemExit(f"REFUSED: mixed canon versions {sorted(versions)}.")

    sentences = {}
    for f in CORPORA:
        for ln in open(os.path.join(FUSENF, "corpora", f)):
            r = json.loads(ln)
            if r.get("sentences"):
                sentences[r["id"]] = r["sentences"][0]

    if args.jsonl_out:
        with open(args.jsonl_out, "w", encoding="utf-8") as jf:
            for row in included:
                jf.write(json.dumps(canon[(row["id"], row["run"])], ensure_ascii=False, sort_keys=True) + "\n")
        print(f"-> {args.jsonl_out}  ({len(included)} canonical rows, manifest order)")
    n_atoms = 0
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write(";; FUSE-NF canonicalized mining substrate — readable MeTTa RENDERING\n"
                 ";; (never loaded: canonical entity/proof names are record-scoped).\n"
                 f";; canon_version {sorted(versions)[0]}; {len(included)} records; "
                 f"hash composition {man['hash_composition']}; "
                 f"allowed hashes {man['allowed_hashes']}.\n\n")
        for row in included:
            key = (row["id"], row["run"])
            c = canon[key]
            flag = "  [pair-incomplete]" if row.get("pair_incomplete") else ""
            fh.write(f";; {row['id']}  run {row['run']}  @{row['hash8']}{flag}\n")
            sent = sentences.get(row["id"])
            if sent:
                fh.write(f";;   \"{sent}\"\n")
            fh.write(f";;   graph_id {c['graph_id'][:16]}  content_id {c['content_id'][:16]}"
                     f"  shape_id {c['shape_id'][:16]}\n")
            for a in c["atoms"]:
                s, conf = a["stv"]
                fh.write(f"(: {a['proof_name']} {a['term']} (STV {s} {conf}))\n")
                n_atoms += 1
            fh.write("\n")
    print(f"-> {args.out}  ({len(included)} records, {n_atoms} canonical atoms, "
          f"canon_version {sorted(versions)[0]})")


if __name__ == "__main__":
    main()
