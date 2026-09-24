"""Tier split of §4.3.3 faithful passes on a mixed-tier substrate (owner 2026-09-23/24): for every passing pair, the
records that carry BOTH units (the co-occurrence the MI measures) split by tier, and the distinct sentences behind
them (near-duplicate designed variants share every subtree by construction). A reading, never a filter.

Usage:
  python tier_split_mi.py --dir out_tier_ab --tiers tierA,tierB --out out_tier_ab/mi_tier_split.md
"""
from __future__ import annotations

import argparse
import collections
import json
import os


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dir", required=True)
    ap.add_argument("--stem", default="mi_faithful")
    ap.add_argument("--tiers", default="tierA,tierB")
    ap.add_argument("--out", required=True)
    ap.add_argument("--top", type=int, default=25)
    args = ap.parse_args()
    ta, tb = args.tiers.split(",")
    units = {u["pattern_id"]: u for u in load(os.path.join(args.dir, "patterns2_faithful.jsonl"))}
    rows = load(os.path.join(args.dir, f"{args.stem}.jsonl"))
    passes = [r for r in rows if r["pass"]]

    def split(r):
        sh = set(units[r["a"]]["ids"]) & set(units[r["b"]]["ids"])
        t = collections.Counter(i.split("-")[0] for i in sh)
        bucket = f"{ta}-only" if set(t) == {ta} else (f"{tb}-only" if set(t) == {tb} else "cross")
        return bucket, dict(t)
    R = [f"# §4.3.3 faithful passes on `{os.path.basename(os.path.abspath(args.dir))}` — tier split ({ta} added to {tb})\n",
         "Per passing pair, the records carrying both units by tier, with the distinct-sentence count the record already holds. A reading of the miner's record ids, never a filter.\n",
         "| bucket | passes | genuine (not part-of) |\n|---|---|---|"]
    bk, bkg = collections.Counter(), collections.Counter()
    tab = []
    for r in passes:
        b, t = split(r)
        bk[b] += 1
        if not r["contained"]:
            bkg[b] += 1
        tab.append((b, r, t))
    for b in (f"{ta}-only", f"{tb}-only", "cross"):
        R.append(f"| {b} | {bk.get(b, 0)} | {bkg.get(b, 0)} |")
    R.append(f"| total | {len(passes)} | {sum(bkg.values())} |\n")
    for b in (f"{tb}-only", "cross", f"{ta}-only"):
        R.append(f"## {b} genuine passes (by MI)\n")
        R.append("| MI | Jaccard | n A / B / both | distinct | shared by tier | A | B |\n|---|---|---|---|---|---|---|")
        for bb, r, t in sorted([x for x in tab if x[0] == b and not x[1]["contained"]], key=lambda x: -x[1]["mi_bits"])[:args.top]:
            R.append(f"| {r['mi_bits']:.4f} | {r['jaccard']:.2f} | {r['n_a']} / {r['n_b']} / {r['n_both']} | {r['n_distinct_shared']} | "
                     f"{' '.join(f'{k} {v}' for k, v in sorted(t.items()))} | `{r['query_a']}` | `{r['query_b']}` |")
        R.append("")
    open(args.out, "w", encoding="utf-8").write("\n".join(R) + "\n")
    print(f"-> {args.out}: {len(passes)} passes; genuine by bucket {dict(bkg)}")


if __name__ == "__main__":
    main()
