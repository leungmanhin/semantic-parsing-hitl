"""Tier split of §4.3.5 faithful pairs on a mixed-tier substrate (owner 2026-09-24): for every passing pair of the adopted
point, the records of each unit by tier (a tie between two units is learned from the columns' co-variation over records,
so where each unit lives is the evidence), the pair's co-occurrence relation, and whether it is one of the shape-parallel
exclusive pairs the rendering turns into a rule. A reading, never a filter.

Usage:
  python tier_split_ae.py --dir out_tier_ab --stem ae_faithful --tiers tierA,tierB --out out_tier_ab/ae_tier_split.md
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
    ap.add_argument("--stem", default="ae_faithful")
    ap.add_argument("--tiers", default="tierA,tierB")
    ap.add_argument("--out", required=True)
    ap.add_argument("--top", type=int, default=25)
    args = ap.parse_args()
    ta, tb = args.tiers.split(",")
    units = {u["pattern_id"]: u for u in load(os.path.join(args.dir, "patterns2_faithful.jsonl"))}
    rows = load(os.path.join(args.dir, f"{args.stem}.jsonl"))
    passes = [r for r in rows if r["pass"]]

    def tiers_of(pid):
        return collections.Counter(i.split("-")[0] for i in units[pid]["ids"])

    def bucket(r):
        t = set(tiers_of(r["a"])) | set(tiers_of(r["b"]))
        return f"{ta}-only" if t == {ta} else (f"{tb}-only" if t == {tb} else "cross")

    def fmt(c):
        return " ".join(f"{k} {v}" for k, v in sorted(c.items()))
    bk, bk_rel, bk_par = collections.Counter(), collections.Counter(), collections.Counter()
    for r in passes:
        b = bucket(r)
        bk[b] += 1
        bk_rel[(b, r["relation"])] += 1
        if r.get("parallel") and r["relation"] == "exclusive":
            bk_par[b] += 1
    R = [f"# §4.3.5 faithful pairs on `{os.path.basename(os.path.abspath(args.dir))}` — tier split ({ta} added to {tb}; {args.stem}, adopted point)\n",
         "Per passing pair (cosine gate + norm floor at the adopted point): the records of each unit by tier, the co-occurrence relation, and whether the pair is "
         "shape-parallel and exclusive (the only pairs rendered as a rule). A reading of the record, never a filter.\n",
         "| bucket (tiers of the two units' records) | passes | of which shape-parallel exclusive (rule-rendered) | exclusive | overlapping | nested | same-records |\n|---|---|---|---|---|---|---|"]
    for b in (f"{ta}-only", f"{tb}-only", "cross"):
        R.append(f"| {b} | {bk.get(b, 0)} | {bk_par.get(b, 0)} | " + " | ".join(str(bk_rel.get((b, rel), 0)) for rel in ("exclusive", "overlapping", "nested", "same-records")) + " |")
    R.append(f"| total | {len(passes)} | {sum(bk_par.values())} | " + " | ".join(str(sum(v for (b, rel), v in bk_rel.items() if rel == x)) for x in ("exclusive", "overlapping", "nested", "same-records")) + " |\n")
    R.append("## Shape-parallel exclusive pairs (rule-rendered), by cosine\n")
    R.append("| cosine | stable (seeds at 0.85) | bucket | A records | B records | A | B | substitution |\n|---|---|---|---|---|---|---|---|")
    for r in sorted([r for r in passes if r.get("parallel") and r["relation"] == "exclusive"], key=lambda r: (-r["cosine"], r["a"], r["b"]))[:args.top]:
        R.append(f"| {r['cosine']:.3f} | {r['stable_at'].get('0.85', '')} | {bucket(r)} | {fmt(tiers_of(r['a']))} | {fmt(tiers_of(r['b']))} | `{r['query_a']}` | `{r['query_b']}` | {r.get('substitution') or ''} |")
    for rel in ("exclusive", "overlapping", "nested", "same-records"):
        sel = sorted([r for r in passes if r["relation"] == rel and not (r.get("parallel") and rel == "exclusive")], key=lambda r: (-r["cosine"], r["a"], r["b"]))
        R.append(f"\n## Other {rel} passes ({len(sel)}), by cosine\n")
        R.append("| cosine | bucket | A records | B records | shared | A | B |\n|---|---|---|---|---|---|---|")
        for r in sel[:args.top]:
            R.append(f"| {r['cosine']:.3f} | {bucket(r)} | {fmt(tiers_of(r['a']))} | {fmt(tiers_of(r['b']))} | {r['n_both']} | `{r['query_a']}` | `{r['query_b']}` |")
    open(args.out, "w", encoding="utf-8").write("\n".join(R) + "\n")
    print(f"-> {args.out}: {len(passes)} passes; buckets {dict(bk)}; shape-parallel exclusive {dict(bk_par)}")


if __name__ == "__main__":
    main()
