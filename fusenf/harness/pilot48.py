"""#48 bounded pilot — reading-set stability on the Tier C ambiguous residue (owner-approved 2026-08-16).

The draft contract lives in ``attic/pilot48/ADDENDUM.md``; ``prompt.txt`` is UNTOUCHED — no
mid-batch contract change. The ``(Interpretation rK ...)`` wrapper is TRANSPORT syntax in
the parse output only: readings are split mechanically here, each reading is canonicalized
by the frozen canonicalizer as an ordinary record (shared statements + that reading's own),
and the record's pilot identity is the sha256 of its SORTED per-reading graph_ids — set
identity, so reading order and tag names cannot matter.

Hypothesis under test (the M1 plateau's ambiguous share): items that flip between runs
because the parser picks a different reading each time should become STABLE as reading
sets. Items unstable for other reasons (garble, 1–2-atom wobble) should stay unstable —
the pilot measures both.

  items             recompute never/flip from the four M1 rounds (must reproduce 9/18/33)
                    -> attic/pilot48/items.tsv  (id, class, v4_agree baseline)
  batches           load-balanced <=5-item batch files attic/pilot48/batches/p48-NN.txt (ID\\tTEXT)
  collect --run N   read attic/pilot48/raw/<ID>__run<N>.txt, split readings, canonicalize each
                    -> attic/pilot48/canon_run<N>.jsonl  (+ missing/malformed report)
  measure           2-run set-id agreement over the 51, split by class and emission
                    pattern, against the v4 single-reading baseline

Deterministic; no clock anywhere.
"""

from __future__ import annotations

import argparse
import collections
import hashlib
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import canonicalize as C  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
P48 = os.path.join(FUSENF, "attic", "pilot48")
ROUNDS = ["tierC_m1", "tierC_m1v2", "tierC_m1v3", "tierC_m1v4"]

RE_WRAP = re.compile(r"\A\(Interpretation\s+(r\d+)\s+(\(:.*\))\)\Z")
RE_STMT = re.compile(r"\A\(:\s")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def cmd_items(_args):
    agree = collections.defaultdict(list)
    for rd in ROUNDS:
        by_id = collections.defaultdict(dict)
        for r in load(os.path.join(FUSENF, "canonical", "%s.canon.jsonl" % rd)):
            by_id[r["id"]][r["run"]] = r["graph_id"]
        for cid, runs in by_id.items():
            vals = list(runs.values())
            agree[cid].append(len(vals) == 2 and vals[0] == vals[1])
    counts = collections.Counter()
    rows = []
    for cid, a in sorted(agree.items()):
        n = sum(a)
        cls = "always" if n == 4 else "never" if n == 0 else "flip"
        counts[cls] += 1
        if cls != "always":
            rows.append((cid, cls, int(a[3])))
    assert dict(counts) == {"always": 9, "never": 18, "flip": 33}, counts
    with open(os.path.join(P48, "items.tsv"), "w", encoding="utf-8") as fh:
        for cid, cls, v4 in rows:
            fh.write(f"{cid}\t{cls}\t{v4}\n")
    print(f"-> attic/pilot48/items.tsv  ({len(rows)} items: "
          f"{counts['never']} never + {counts['flip']} flip; "
          f"v4 baseline agree {sum(v for _, _, v in rows)}/{len(rows)})")


def read_items():
    return [l.strip().split("\t") for l in open(os.path.join(P48, "items.tsv"),
                                                encoding="utf-8") if l.strip()]


def cmd_batches(args):
    texts = {}
    for row in load(os.path.join(FUSENF, "corpora", "tierC.jsonl")):
        texts[row["id"]] = " ".join(row["sentences"])
    items = [(cid, texts[cid]) for cid, _, _ in read_items()]
    nb = (len(items) + args.size - 1) // args.size
    batches = [[] for _ in range(nb)]
    for cid, text in sorted(items, key=lambda kv: (-len(kv[1]), kv[0])):
        tgt = min((b for b in batches if len(b) < args.size),
                  key=lambda b: sum(len(t) for _, t in b))
        tgt.append((cid, text))
    os.makedirs(os.path.join(P48, "batches"), exist_ok=True)
    for i, b in enumerate(batches, 1):
        with open(os.path.join(P48, "batches", "p48-%02d.txt" % i), "w",
                  encoding="utf-8") as fh:
            for cid, text in sorted(b):
                fh.write(f"{cid}\t{text}\n")
    sizes = [(len(b), sum(len(t) for _, t in b)) for b in batches]
    print(f"-> {nb} batches: " + ", ".join(f"{n}i/{c}c" for n, c in sizes))


def split_readings(lines):
    """Raw statement lines -> (readings dict tag->full statement list, n_shared).

    A reading = shared statements + its wrapped statements. No wrapper anywhere
    -> the whole record is one reading tagged r0."""
    shared, wrapped = [], collections.defaultdict(list)
    bad = []
    for ln in lines:
        m = RE_WRAP.match(ln)
        if m:
            wrapped[m.group(1)].append(m.group(2))
        elif RE_STMT.match(ln):
            shared.append(ln)
        else:
            bad.append(ln)
    if not wrapped:
        return ({"r0": shared} if shared else {}), len(shared), bad
    return ({tag: shared + stmts for tag, stmts in sorted(wrapped.items())},
            len(shared), bad)


def cmd_collect(args):
    vocab = C.load_vocabulary()
    items = read_items()
    rows, missing, malformed = [], [], []
    for cid, cls, _ in items:
        path = os.path.join(P48, "raw", f"{cid}__run{args.run}.txt")
        if not os.path.exists(path):
            missing.append(cid)
            continue
        lines = [l.strip() for l in open(path, encoding="utf-8") if l.strip()]
        readings, n_shared, bad = split_readings(lines)
        if bad or not readings:
            malformed.append((cid, bad[:2] or ["<empty>"]))
            continue
        gids, natoms = {}, {}
        for tag, stmts in readings.items():
            rec = C.canonicalize({"id": f"{cid}#{tag}", "run": f"p48r{args.run}",
                                  "statements": stmts}, vocab=vocab)
            gids[tag] = rec["graph_id"]
            natoms[tag] = len(rec["atoms"])
        set_id = "sha256:" + hashlib.sha256(
            "|".join(sorted(gids.values())).encode()).hexdigest()
        rows.append({"id": cid, "class": cls, "run": args.run,
                     "n_readings": len(readings), "n_shared": n_shared,
                     "reading_gids": dict(sorted(gids.items())),
                     "reading_atoms": dict(sorted(natoms.items())),
                     "set_id": set_id})
    out = os.path.join(P48, f"canon_run{args.run}.jsonl")
    with open(out, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    multi = sum(1 for r in rows if r["n_readings"] > 1)
    print(f"-> {out}  ({len(rows)} records, {multi} multi-reading)")
    print(f"missing: {missing or 'none'}")
    print(f"malformed: {malformed or 'none'}")


def cmd_measure(_args):
    r1 = {r["id"]: r for r in load(os.path.join(P48, "canon_run1.jsonl"))}
    r2 = {r["id"]: r for r in load(os.path.join(P48, "canon_run2.jsonl"))}
    items = read_items()
    both = [cid for cid, _, _ in items if cid in r1 and cid in r2]
    agree = {cid: r1[cid]["set_id"] == r2[cid]["set_id"] for cid in both}

    def frac(ids):
        return (sum(agree[c] for c in ids), len(ids))

    by_class = collections.defaultdict(list)
    v4base = {}
    for cid, cls, v4 in items:
        if cid in agree:
            by_class[cls].append(cid)
            v4base[cid] = int(v4)
    a, n = frac(both)
    print(f"reading-SET stability (2 runs): {a}/{n} = {a/n:.3f}")
    print(f"  v4 single-reading baseline on the same items: "
          f"{sum(v4base.values())}/{len(v4base)} = {sum(v4base.values())/len(v4base):.3f}")
    for cls in ("never", "flip"):
        ca, cn = frac(by_class[cls])
        cb = sum(v4base[c] for c in by_class[cls])
        print(f"  {cls:5}: set-stable {ca}/{cn} = {ca/cn:.3f}   (v4 baseline {cb}/{cn})")

    pat = collections.Counter()
    for cid in both:
        m1, m2 = r1[cid]["n_readings"] > 1, r2[cid]["n_readings"] > 1
        key = ("multi/multi" if m1 and m2 else
               "single/single" if not m1 and not m2 else "mixed")
        pat[(key, agree[cid])] += 1
    print("emission pattern x set-agreement:")
    for (key, ag), cnt in sorted(pat.items()):
        print(f"  {key:13} {'agree   ' if ag else 'disagree'} {cnt}")
    dist = collections.Counter()
    for src in (r1, r2):
        for r in src.values():
            dist[r["n_readings"]] += 1
    print(f"reading-count distribution (both runs): {dict(sorted(dist.items()))}")
    interesting = sorted(cid for cid in both
                         if agree[cid] and r1[cid]["n_readings"] > 1)
    print(f"stable multi-reading items (the #48 payoff cases): {interesting or 'none'}")


def main():
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("items")
    b = sub.add_parser("batches")
    b.add_argument("--size", type=int, default=5)
    c = sub.add_parser("collect")
    c.add_argument("--run", type=int, required=True)
    sub.add_parser("measure")
    args = ap.parse_args()
    {"items": cmd_items, "batches": cmd_batches,
     "collect": cmd_collect, "measure": cmd_measure}[args.cmd](args)


if __name__ == "__main__":
    main()
