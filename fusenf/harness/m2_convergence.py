"""M2 — paraphrase convergence, the "before" column (metrics.md M2).

The full M2 is a P4 before/after-consolidation comparison. This tool computes everything in its
report that exists BEFORE any consolidation rules: the per-pair distance
``d = 1 - soft_jaccard(A, B)`` under the full (graph) and content projections, exact-hash match
rates, and a bootstrap CI over pairs. Three modes share one distance implementation so the
numbers are comparable by construction:

  --pairs     corpus equiv_class pairs (both sides parsed)      -> d_pos
  --same-id   the two runs of each item in an M1 canonical file -> the parse-noise floor
  --cross N   N seeded random cross-class pairs                 -> an easy separation reference
              (NOT the pre-registered control arm - PAWS controls are adversarial lookalikes;
              this is only a sanity reference until arm 2 is parsed)

Pair records are deduped by pair signature (the frozenset of the two members' input_sha256):
the Tier C corpus has 500 equiv_classes but only 495 distinct sentence pairs.

Usage:
  python m2_convergence.py --corpus ../corpora/tierC.jsonl --pairs A.canon.jsonl [B ...]
  python m2_convergence.py --same-id M1.canon.jsonl
  python m2_convergence.py --corpus ../corpora/tierC.jsonl --cross 500 A.canon.jsonl [B ...]
"""
import sys, json, argparse, collections, random, pathlib

sys.path.insert(0, str(pathlib.Path(__file__).parent))
import canonicalize as C  # noqa: E402


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def content_view(canon, surface_heads):
    """A copy of the record whose surface-record atoms (Name, ...) are dropped.

    graph_id is cleared so soft_jaccard's early-exit cannot fire on the full-record hash;
    content_id stands in for it (equal content_id => distance 0 by definition)."""
    atoms = [a for a in canon.get("atoms", [])
             if C.parse_term(a["term"])[0] not in surface_heads]
    out = dict(canon)
    out["atoms"] = atoms
    out["graph_id"] = canon.get("content_id")
    return out


def distances(a, b, surface_heads):
    return {
        "graph_eq": a["graph_id"] == b["graph_id"],
        "shape_eq": a.get("shape_id") == b.get("shape_id"),
        "content_eq": a.get("content_id") == b.get("content_id"),
        "d_graph": 1.0 - C.soft_jaccard(a, b),
        "d_content": 1.0 - C.soft_jaccard(content_view(a, surface_heads),
                                          content_view(b, surface_heads)),
    }


def bootstrap_ci(values, n=1000, seed=7):
    if not values:
        return (float("nan"),) * 2
    rng = random.Random(seed)
    means = sorted(sum(rng.choices(values, k=len(values))) / len(values) for _ in range(n))
    return means[int(0.025 * n)], means[int(0.975 * n)]


def summarize(rows, label):
    n = len(rows)
    if not n:
        print(f"{label}: no pairs")
        return None
    dg = [r["d_graph"] for r in rows]
    dc = [r["d_content"] for r in rows]
    lo_g, hi_g = bootstrap_ci(dg)
    lo_c, hi_c = bootstrap_ci(dc)
    out = {
        "label": label, "pairs": n,
        "d_graph_mean": sum(dg) / n, "d_graph_ci": (lo_g, hi_g),
        "d_graph_median": sorted(dg)[n // 2],
        "d_content_mean": sum(dc) / n, "d_content_ci": (lo_c, hi_c),
        "d_content_median": sorted(dc)[n // 2],
        "graph_exact": sum(r["graph_eq"] for r in rows) / n,
        "content_exact": sum(r["content_eq"] for r in rows) / n,
    }
    print(f"\n== {label}  ({n} pairs) ==")
    print(f"  d_graph    mean {out['d_graph_mean']:.3f}  (95% CI {lo_g:.3f}-{hi_g:.3f})"
          f"  median {out['d_graph_median']:.3f}")
    print(f"  d_content  mean {out['d_content_mean']:.3f}  (95% CI {lo_c:.3f}-{hi_c:.3f})"
          f"  median {out['d_content_median']:.3f}")
    print(f"  exact match: graph_id {out['graph_exact']:.3f}   content_id {out['content_exact']:.3f}")
    # coarse histogram of d_content, the projection the paper leads with
    edges = [0.0, 0.05, 0.15, 0.3, 0.5, 0.75, 1.0001]
    hist = collections.Counter()
    for v in dc:
        for i in range(len(edges) - 1):
            if edges[i] <= v < edges[i + 1]:
                hist[i] += 1
                break
    bars = "  ".join(f"[{edges[i]:.2f},{edges[i+1]:.2f}) {hist.get(i,0)}" for i in range(len(edges) - 1))
    print(f"  d_content histogram: {bars}")
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical", nargs="+", help="canonical JSONL file(s)")
    ap.add_argument("--corpus", help="corpus JSONL with equiv_class/side labels (pairs & cross modes)")
    ap.add_argument("--pairs", action="store_true", help="equiv_class pair mode (d_pos)")
    ap.add_argument("--same-id", action="store_true", help="2-runs-per-item mode (noise floor)")
    ap.add_argument("--cross", type=int, default=0, help="N random cross-class pairs (reference)")
    ap.add_argument("--seed", type=int, default=11)
    args = ap.parse_args()

    vocab = C.load_vocabulary()
    surface = vocab["surface_record"]

    canon = [c for p in args.canonical for c in load(p)]
    by_id = collections.defaultdict(list)
    for c in canon:
        by_id[c["id"]].append(c)

    if args.same_id:
        rows = []
        for cid, runs in sorted(by_id.items()):
            runs = sorted(runs, key=lambda r: r.get("run", 0))
            for a, b in zip(runs, runs[1:]):
                rows.append(distances(a, b, surface))
        summarize(rows, f"same-sentence noise floor ({pathlib.Path(args.canonical[0]).name})")

    if args.pairs or args.cross:
        if not args.corpus:
            ap.error("--pairs/--cross need --corpus")
        meta = {r["id"]: r for r in load(args.corpus)}

    if args.pairs:
        groups = collections.defaultdict(dict)
        for cid in by_id:
            m = meta.get(cid)
            if not m or m.get("labels", {}).get("pair_kind") != "paraphrase":
                continue
            groups[m["equiv_class"]][m["labels"]["side"]] = by_id[cid][0]
        seen_sig, rows, dup = set(), [], 0
        for ec in sorted(groups):
            g = groups[ec]
            if "a" not in g or "b" not in g:
                continue
            sig = frozenset((meta[g["a"]["id"]]["input_sha256"], meta[g["b"]["id"]]["input_sha256"]))
            if sig in seen_sig:
                dup += 1
                continue
            seen_sig.add(sig)
            rows.append(distances(g["a"], g["b"], surface))
        if dup:
            print(f"(deduped {dup} repeated sentence pair(s) by pair signature)")
        summarize(rows, "paraphrase pairs (d_pos, before consolidation)")

    if args.cross:
        ids = sorted(cid for cid in by_id if cid in meta)
        rng = random.Random(args.seed)
        rows, tries = [], 0
        while len(rows) < args.cross and tries < args.cross * 20:
            tries += 1
            x, y = rng.sample(ids, 2)
            if meta[x]["equiv_class"] == meta[y]["equiv_class"]:
                continue
            rows.append(distances(by_id[x][0], by_id[y][0], surface))
        summarize(rows, f"random cross-class reference (n={len(rows)}, seed={args.seed})")


if __name__ == "__main__":
    main()
