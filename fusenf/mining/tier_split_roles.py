"""Tier / control split of §4.3.2 faithful slot-pair signals mined on a mixed-tier substrate (owner 2026-09-23).

For every passing slot pair of a signals file, the occurrences behind each slot (from ``valuations_occ.jsonl``: rows with
the slot's centre class and head) are split by TIER (record id prefix) and, for Tier A, by the record's designed role:
same-polarity variant (a paraphrase) or a CONTROL (participant-swap, negation, antonym, quantity-change, modality-shift,
manner-near-miss, from the corpus labels). A slot pair whose two slots share fillers only because a participant-swap
control put the same nouns in both roles is a designed artefact, not a merge licence; the ``swap_share`` column makes
that visible. A reading, never a filter; the signals files are untouched.

Usage:
  python tier_split_roles.py --dir out_tier_ab --block word_0.85 --tiers tierA,tierB --out out_tier_ab/rolefillers2_tier_split.md
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
    ap.add_argument("--dir", required=True)
    ap.add_argument("--block", default="word_0.85", help="<mode>_<cut> of the main block")
    ap.add_argument("--gate", default="", help="'' = the arm's default gate (jsd); 'cosine' = the reference twin")
    ap.add_argument("--tiers", default="tierA,tierB")
    ap.add_argument("--corpora", default=os.path.join(HERE, os.pardir, "corpora"))
    ap.add_argument("--out", required=True)
    ap.add_argument("--summary", default=None, help="optional JSON summary path")
    args = ap.parse_args()
    ta, tb = args.tiers.split(",")
    gtag = f"_{args.gate}" if args.gate else ""
    labels, sent = {}, {}
    for p in sorted(glob.glob(os.path.join(args.corpora, "*.jsonl"))):
        for r in load(p):
            labels[r["id"]] = r.get("labels") or {}
            sent[r["id"]] = " ".join(r["sentences"])

    def role_of(rid):
        lb = labels.get(rid, {})
        if not rid.startswith(ta):
            return "natural"
        return "paraphrase" if lb.get("polarity", "same") == "same" else (lb.get("control_kind") or "control")
    occ = collections.defaultdict(list)
    for r in load(os.path.join(args.dir, "valuations_occ.jsonl")):
        occ[f"{r['center_class']}.{r['head']}"].append(r["id"])

    def split(slot):
        ids = occ.get(slot, [])
        tiers = collections.Counter(i.split("-")[0] for i in ids)
        roles = collections.Counter(role_of(i) for i in ids)
        return len(ids), tiers, roles
    blocks = sorted(glob.glob(os.path.join(args.dir, f"rolefiller2_signals_faithful{gtag}_*.jsonl")))
    main_path = os.path.join(args.dir, f"rolefiller2_signals_faithful{gtag}_{args.block}.jsonl")
    rows = load(main_path) if os.path.exists(main_path) else []
    R = [f"# §4.3.2 faithful slot pairs on `{os.path.basename(os.path.abspath(args.dir))}` — tier / control split (block {args.block}{gtag or ' (jsd)'})\n",
         "Per passing slot pair: the occurrences behind each slot by tier, and for Tier A by designed role (paraphrase variant vs control kind). "
         "`swap_share` = share of the two slots' occurrences that come from participant-swap controls (the same nouns placed in both roles by design). "
         "A reading of the signals files, never a filter.\n"]
    summ = {"block": args.block + gtag, "signals": len(rows), "buckets": collections.Counter(), "swap_role_pairs": 0, "control_touched": 0, "per_block": {}}
    R.append("## Buckets over the passing pairs\n")
    table = []
    for r in rows:
        c = r["candidate"]
        na, ta_t, ta_r = split(c["slot_a"])
        nb, tb_t, tb_r = split(c["slot_b"])
        tiers = collections.Counter(ta_t) + collections.Counter(tb_t)
        roles = collections.Counter(ta_r) + collections.Counter(tb_r)
        tot = max(1, na + nb)
        bucket = (f"{ta}-only" if tiers.get(ta) and not tiers.get(tb) else (f"{tb}-only" if tiers.get(tb) and not tiers.get(ta) else "cross"))
        swap = roles.get("participant-swap", 0) / tot
        ctl = sum(v for k, v in roles.items() if k not in ("natural", "paraphrase")) / tot
        summ["buckets"][bucket] += 1
        summ["swap_role_pairs"] += int(c["subtype"] in ("cross-role", "cross-entity-role") and swap > 0)
        summ["control_touched"] += int(ctl > 0)
        table.append((c["subtype"], c["slot_a"], c["slot_b"], r["support"], r.get("jsd"), bucket, dict(tiers), dict(roles), round(swap, 2), round(ctl, 2),
                      sent.get((r.get("examples_a") or [""])[0], "")[:70]))
    R.append("| bucket | pairs |\n|---|---|")
    for bk in (f"{ta}-only", f"{tb}-only", "cross"):
        R.append(f"| {bk} | {summ['buckets'].get(bk, 0)} |")
    R.append(f"| total | {len(rows)} |\n")
    R.append(f"- same-class / different-role pairs with any participant-swap occurrences (`swap_role_pairs`: the swap controls put the same nouns in both roles, which is what makes the two slots indistinguishable): {summ['swap_role_pairs']} of {sum(1 for t in table if t[0].startswith('cross-role'))}; pairs touched by any control variant: {summ['control_touched']}\n")
    R.append("## Passing pairs\n")
    R.append("| subtype | slot A | slot B | n | JSD | bucket | occurrences by tier | by designed role | swap_share | control_share | example |\n|---|---|---|---|---|---|---|---|---|---|---|")
    for t in sorted(table, key=lambda t: (t[0], -t[8], t[1], t[2])):
        R.append("| " + " | ".join(str(x) if not isinstance(x, dict) else " ".join(f"{k} {v}" for k, v in sorted(x.items())) for x in t) + " |")
    R.append("\n## All blocks (signals per block; swap_role_pairs; control-touched)\n")
    R.append("| block | signals | swap_role_pairs | control-touched |\n|---|---|---|---|")
    for p in blocks:
        b = os.path.basename(p)[len(f"rolefiller2_signals_faithful{gtag}_"):-len(".jsonl")]
        rs = load(p)
        sd = ct = 0
        for r in rs:
            c = r["candidate"]
            na, _, ra = split(c["slot_a"]); nb, _, rb = split(c["slot_b"])
            roles = collections.Counter(ra) + collections.Counter(rb); tot = max(1, na + nb)
            sd += int(c["subtype"] in ("cross-role", "cross-entity-role") and roles.get("participant-swap", 0) > 0)
            ct += int(sum(v for k, v in roles.items() if k not in ("natural", "paraphrase")) > 0)
        summ["per_block"][b] = {"signals": len(rs), "swap_role_pairs": sd, "control_touched": ct}
        R.append(f"| {b} | {len(rs)} | {sd} | {ct} |")
    open(args.out, "w", encoding="utf-8").write("\n".join(R) + "\n")
    summ["buckets"] = dict(summ["buckets"])
    if args.summary:
        json.dump(summ, open(args.summary, "w", encoding="utf-8"), indent=1)
    print(f"-> {args.out}: {len(rows)} passing pairs in {args.block}{gtag}; buckets {summ['buckets']}; swap_role_pairs {summ['swap_role_pairs']}, control-touched {summ['control_touched']}")


if __name__ == "__main__":
    main()
