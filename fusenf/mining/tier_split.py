"""Tier-split reading of a §4.3.1 faithful view mined on a MIXED-TIER substrate (owner 2026-09-23: Tier A + B beside
Tier B alone). The miner already records per-tier document support on every pattern (``per_tier``); this script only
summarises it and compares two views — never a filter, a reading.

Buckets (per unit, over its supporting records): A-only (all support from one tier, the first named), B-only, cross.
Comparison with ``--compare`` (the single-tier view): a proposal of the mixed view is NEW (its pattern key is absent from
the single-tier inventory: it reaches the floor only with the added tier), SHARED (a proposal in both; support delta shown),
or DEMOTED (present in the single-tier view as a proposal but not a proposal in the mixed view — closure lost to a larger
unit the added tier supports); single-tier proposals absent from the mixed view are listed as LOST (cannot happen when the
single-tier substrate is a subset, so their count is a sanity check).

Usage:
  python tier_split.py --units out_tier_ab/patterns2_faithful.jsonl --compare out_tier_b/patterns2_faithful.jsonl \\
      --tiers tierA,tierB --out out_tier_ab/patterns2_tier_split.md
"""
from __future__ import annotations

import argparse
import collections
import glob
import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--units", required=True)
    ap.add_argument("--compare", default=None)
    ap.add_argument("--tiers", default="tierA,tierB", help="first = the added tier, second = the base tier")
    ap.add_argument("--corpora", default=os.path.join(HERE, os.pardir, "corpora"))
    ap.add_argument("--out", required=True)
    ap.add_argument("--top", type=int, default=25)
    args = ap.parse_args()
    ta, tb = args.tiers.split(",")
    units = load(args.units)
    comp = {tuple(u["atoms"]): u for u in load(args.compare)} if args.compare else None
    sent = {}
    for p in sorted(glob.glob(os.path.join(args.corpora, "*.jsonl"))):
        for r in load(p):
            sent[r["id"]] = " ".join(r["sentences"])

    def bucket(u):
        pt = u.get("per_tier") or {}
        a, b = pt.get(ta, 0), pt.get(tb, 0)
        return f"{ta}-only" if a and not b else (f"{tb}-only" if b and not a else "cross")

    def ex(u, tier=None):
        ids = [i for i in u["ids"] if (tier is None or i.startswith(tier))]
        return sent.get(ids[0], "")[:90] if ids else ""

    for u in units:
        u["tier_bucket"] = bucket(u)
        u["share_added"] = round((u.get("per_tier") or {}).get(ta, 0) / max(1, u["support"]), 2)
    props = [u for u in units if u.get("proposal")]
    R = [f"# §4.3.1 faithful units on `{os.path.basename(os.path.dirname(os.path.abspath(args.units)))}` — tier split ({ta} added to {tb})\n",
         "A reading of the miner's own `per_tier` field: where each unit's document support comes from. Never a filter.\n",
         "## Buckets\n", "| bucket | units (all sizes) | proposals (closed, size ≥ 2) |\n|---|---|---|"]
    for bk in (f"{ta}-only", f"{tb}-only", "cross"):
        R.append(f"| {bk} | {sum(1 for u in units if u['tier_bucket'] == bk)} | {sum(1 for u in props if u['tier_bucket'] == bk)} |")
    R.append(f"| total | {len(units)} | {len(props)} |")
    R.append(f"\n## Proposals supported by {ta} only ({sum(1 for u in props if u['tier_bucket'] == f'{ta}-only')}): the designed alternations, and candidates for the older-prompt caveat\n")
    R.append(f"| support | size | unit | example ({ta}) |\n|---|---|---|---|")
    for u in sorted([u for u in props if u["tier_bucket"] == f"{ta}-only"], key=lambda u: (-u["support"], u["pattern_id"]))[:args.top]:
        R.append(f"| {u['support']} | {u['size']} | `{u['query']}` | {ex(u, ta)} |")
    R.append(f"\n## Cross-tier proposals ({sum(1 for u in props if u['tier_bucket'] == 'cross')}): support from both tiers (share from {ta} shown)\n")
    R.append(f"| support | {ta} / {tb} | share {ta} | size | unit | example ({tb}) |\n|---|---|---|---|---|---|")
    for u in sorted([u for u in props if u["tier_bucket"] == "cross"], key=lambda u: (-u["support"], u["pattern_id"]))[:args.top]:
        pt = u["per_tier"]
        R.append(f"| {u['support']} | {pt.get(ta, 0)} / {pt.get(tb, 0)} | {u['share_added']} | {u['size']} | `{u['query']}` | {ex(u, tb)} |")
    if comp is not None:
        cprops = {k: u for k, u in comp.items() if u.get("proposal")}
        new = [u for u in props if tuple(u["atoms"]) not in comp]
        shared = [u for u in props if tuple(u["atoms"]) in cprops]
        demoted = [u for k, u in cprops.items() if k in {tuple(x["atoms"]) for x in units} and not next(x for x in units if tuple(x["atoms"]) == k).get("proposal")]
        lost = [u for k, u in cprops.items() if k not in {tuple(x["atoms"]) for x in units}]
        R.append(f"\n## Against `{os.path.basename(os.path.dirname(os.path.abspath(args.compare)))}` ({len(cprops)} proposals there)\n")
        R.append(f"- NEW proposals (pattern absent from the single-tier inventory — reach the floor only with {ta}): {len(new)}: "
                 f"{sum(1 for u in new if u['tier_bucket'] == f'{ta}-only')} {ta}-only, {sum(1 for u in new if u['tier_bucket'] == 'cross')} cross")
        R.append(f"- SHARED proposals (a proposal in both): {len(shared)}; support unchanged for {sum(1 for u in shared if u['support'] == cprops[tuple(u['atoms'])]['support'])}, raised by {ta} for the rest")
        R.append(f"- DEMOTED (a proposal in the single-tier view, present but not a proposal in the mixed view — closure lost to a larger unit): {len(demoted)}")
        R.append(f"- LOST (single-tier proposals absent from the mixed inventory; must be 0 when the single tier is a subset): {len(lost)}\n")
        R.append(f"### NEW cross-tier proposals (support from both tiers, absent from {tb} alone)\n")
        R.append(f"| support | {ta} / {tb} | size | unit | example ({tb}) |\n|---|---|---|---|---|")
        for u in sorted([u for u in new if u["tier_bucket"] == "cross"], key=lambda u: (-u["support"], u["pattern_id"]))[:args.top]:
            pt = u["per_tier"]
            R.append(f"| {u['support']} | {pt.get(ta, 0)} / {pt.get(tb, 0)} | {u['size']} | `{u['query']}` | {ex(u, tb)} |")
        R.append(f"\n### DEMOTED proposals (were proposals on {tb} alone)\n")
        R.append("| support there | size | unit | now subsumed by |\n|---|---|---|---|")
        for u in sorted(demoted, key=lambda u: (-u["support"], u["pattern_id"]))[:args.top]:
            now = next(x for x in units if tuple(x["atoms"]) == tuple(u["atoms"]))
            R.append(f"| {u['support']} | {u['size']} | `{u['query']}` | {now.get('subsumed_by') or ('not closed' if not now.get('closed') else '—')} |")
    open(args.out, "w", encoding="utf-8").write("\n".join(R) + "\n")
    print(f"-> {args.out}: {len(units)} units, {len(props)} proposals; buckets " +
          ", ".join(f"{bk} {sum(1 for u in props if u['tier_bucket'] == bk)}" for bk in (f"{ta}-only", f"{tb}-only", "cross")))


if __name__ == "__main__":
    main()
