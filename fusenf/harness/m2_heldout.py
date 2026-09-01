"""FUSE-NF — held-out M2 measurement (the P4-tail / loop-2 numbers, scripted).

Distills the inline measurement used for ``eval/m2_heldout.md`` and the loop-2
validation-half re-measure (``eval/p3_loop2.md``) into a reusable, deterministic
script: per pair_kind (``paraphrase`` positives, ``control`` adversarial pairs)
it reports d_content mean/median, exact content_id matches, and the
positives-vs-controls AUC, for each canonical/consolidated view given.

An optional ``--split`` (``mining/out2/loop2_split.json``) restricts the
paraphrase column to its ``mine`` or ``validation`` classes (``--half``).

Usage:
  python m2_heldout.py --corpus ../corpora/tierC_361_1000.jsonl \\
      --view BEFORE=../canonical/tierC_heldout.canon.jsonl \\
      --view AFTER=../consolidated/tierC_heldout.cons.jsonl \\
      [--split ../mining/out2/loop2_split.json --half validation]
"""

from __future__ import annotations

import argparse
import collections
import json
import os
import statistics
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import canonicalize as C  # noqa: E402
import m2_convergence as M2  # noqa: E402


def column(by_id, meta, surface, classes):
    out = {}
    for kind in ("paraphrase", "control"):
        groups = collections.defaultdict(dict)
        for cid, r in by_id.items():
            m = meta.get(cid)
            if not m or m["labels"].get("pair_kind") != kind:
                continue
            if kind == "paraphrase" and classes is not None \
                    and m["equiv_class"] not in classes:
                continue
            groups[m["equiv_class"]][m["labels"]["side"]] = r
        rows = [M2.distances(g["a"], g["b"], surface)
                for g in groups.values() if "a" in g and "b" in g]
        d = [r["d_content"] for r in rows]
        out[kind] = {"n": len(rows), "mean": statistics.mean(d) if d else float("nan"),
                     "median": statistics.median(d) if d else float("nan"),
                     "exact": sum(1 for r in rows if r["content_eq"]), "ds": d}
    pos, ctl = out["paraphrase"]["ds"], out["control"]["ds"]
    wins = sum(1 for p in pos for c in ctl if p < c) \
        + 0.5 * sum(1 for p in pos for c in ctl if p == c)
    out["auc"] = wins / (len(pos) * len(ctl)) if pos and ctl else float("nan")
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--corpus", required=True)
    ap.add_argument("--view", action="append", required=True,
                    help="LABEL=path.jsonl; repeatable (BEFORE/AFTER columns)")
    ap.add_argument("--split", default=None, help="loop2_split.json")
    ap.add_argument("--half", choices=["mine", "validation"], default=None)
    args = ap.parse_args()

    meta = {r["id"]: r for r in M2.load(args.corpus)}
    surface = C.load_vocabulary()["surface_record"]
    classes = None
    if args.split and args.half:
        classes = set(json.load(open(args.split))[args.half])

    for spec in args.view:
        label, path = spec.split("=", 1)
        by_id = {r["id"]: r for r in M2.load(path)}
        o = column(by_id, meta, surface, classes)
        print(f"== {label} ({os.path.basename(path)})"
              + (f"  [paraphrase restricted to {args.half} half]" if classes else ""))
        for kind in ("paraphrase", "control"):
            k = o[kind]
            print(f"   {kind:10} n={k['n']:3}  d_content mean {k['mean']:.3f} "
                  f"median {k['median']:.3f}  exact {k['exact']}/{k['n']}")
        print(f"   AUC(paraphrase vs control) = {o['auc']:.4f}")


if __name__ == "__main__":
    main()
