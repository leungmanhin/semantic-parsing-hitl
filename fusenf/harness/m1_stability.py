"""M1 — parse stability (metrics.md M1).

Reads canonical records, groups by corpus id, and reports how often independent parses of the
SAME sentence land on the same canonical form. Mechanical variance attribution only: buckets a
program can decide objectively. Anything needing judgment lands in `unclassified` and is handed
to the agent reviewer — per the deterministic-first split (schema.md §5).

Usage:
  python m1_stability.py <canonical.jsonl> [--corpus <corpus.jsonl>] [--out <report.md>]
"""
import sys, json, argparse, itertools, collections, pathlib

sys.path.insert(0, str(pathlib.Path(__file__).parent))
from canonicalize import soft_jaccard  # noqa: E402

SK_PREFIX = ("e", "x", "f")  # canonical skolem stems produced by the canonicalizer


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def wildcard_atoms(canon):
    """Atom terms with every canonical skolem replaced by a single token.

    Agreement under this projection with a graph_id mismatch means the runs emitted the same
    atom multiset wired to different carriers (`attachment` in `attribute()`). It does NOT
    diagnose a canonicalizer bug — collapsing skolems erases exactly the wiring needed to tell
    a hashing fault from a real attachment difference.
    """
    import re
    out = []
    for a in canon.get("atoms", []):
        t = a["term"] if isinstance(a.get("term"), str) else str(a.get("term"))
        out.append(re.sub(r"\b(?:e|x|f)\d+\b", "SK", t))
    return sorted(out)


def head_of(term):
    t = term.strip()
    return t[1:].split()[0] if t.startswith("(") else t


def attribute(a, b, vocab_roles):
    """Mechanically classify one disagreeing pair. Returns a bucket name."""
    # `tv-only` FIRST. `shape_id` hashes the terms alone, so shape equality means the terms are
    # identical and a graph_id difference can only be truth values. The wildcard test below cannot
    # see truth values at all, so with the checks the other way round every tv-only pair was
    # reported as a canonicalizer BUG -- which is what the Tier C run's lone `canonicalizer` pair
    # turned out to be (tierC-000147: identical terms, "mainly" read as 0.9 vs 1.0).
    if a.get("shape_id") == b.get("shape_id"):
        return "tv-only"
    # Wildcard-equal but graph-different is NOT decidable as a canonicalizer bug from here:
    # collapsing skolems erases the wiring, so this projection cannot tell "isomorphic graphs
    # hashed apart" (a real canonicalizer bug) from "the same atoms attached to different
    # carriers" (a real semantic difference -- tierC-000111: `(Ordinal e0 1 give)` vs
    # `(Ordinal x1 1 give)`, both exactly canonicalized). An earlier version flagged this case
    # as `canonicalizer -- MUST BE 0` and produced only false alarms. Canonicalizer health is
    # the unit suite's job (permutation invariance + idempotence in test_canonicalize); here the
    # pair is bucketed as what it observably is: an attachment difference.
    if wildcard_atoms(a) == wildcard_atoms(b):
        return "attachment"
    # MULTISETS, not sets: wildcarding collapses distinct skolems onto identical strings, so a
    # record often carries duplicate wildcard atoms. Under set() a strict multiset superset (one
    # run = the other plus extra copies of atoms it already has) diffs to nothing on both sides
    # and fell through to `unclassified`; Counters keep the copies countable.
    ca, cb = collections.Counter(wildcard_atoms(a)), collections.Counter(wildcard_atoms(b))
    only_a, only_b = ca - cb, cb - ca
    if bool(only_a) != bool(only_b):
        return "optional-atom"                      # one is a strict (multiset) superset
    na, nb = sum(ca.values()), sum(cb.values())
    if na == nb and sum(only_a.values()) == sum(only_b.values()) and only_a:
        ha = collections.Counter(head_of(t) for t in only_a.elements())
        hb = collections.Counter(head_of(t) for t in only_b.elements())
        if ha != hb and all(h in vocab_roles for h in (ha | hb)):
            return "role-choice"
    if abs(na - nb) >= 2:
        return "decomposition-depth"
    return "unclassified"                            # -> agent reviewer


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical")
    ap.add_argument("--corpus")
    ap.add_argument("--vocab", default=str(pathlib.Path(__file__).parent.parent / "specs" / "vocabulary.json"))
    ap.add_argument("--out")
    args = ap.parse_args()

    canon = load(args.canonical)
    families = {}
    if args.corpus:
        families = {r["id"]: r.get("labels", {}).get("family", "?") for r in load(args.corpus)}
    vocab = json.load(open(args.vocab, encoding="utf-8"))
    roles = {n for n, r in vocab["operators"].items() if r.get("class") == "role"}

    by_id = collections.defaultdict(list)
    for c in canon:
        by_id[c["id"]].append(c)

    rows, buckets, mismatch_sims = [], collections.Counter(), []
    for cid, runs in sorted(by_id.items()):
        if len(runs) < 2:
            continue
        pairs = list(itertools.combinations(runs, 2))
        agree = [p for p in pairs if p[0]["graph_id"] == p[1]["graph_id"]]
        shape = [p for p in pairs if p[0].get("shape_id") == p[1].get("shape_id")]
        counts = collections.Counter(r["graph_id"] for r in runs)
        for a, b in pairs:
            if a["graph_id"] != b["graph_id"]:
                buckets[attribute(a, b, roles)] += 1
                try:
                    mismatch_sims.append(soft_jaccard(a, b))
                except Exception:
                    pass
        rows.append({
            "id": cid, "family": families.get(cid, "?"), "runs": len(runs),
            "pairwise": len(agree) / len(pairs),
            "shape_pairwise": len(shape) / len(pairs),
            "unanimous": len(counts) == 1,
            "modal_share": max(counts.values()) / len(runs),
        })

    if not rows:
        print("no items with >=2 runs"); return

    n = len(rows)
    agg = {
        "items": n,
        "pairwise_agreement": sum(r["pairwise"] for r in rows) / n,
        "shape_agreement": sum(r["shape_pairwise"] for r in rows) / n,
        "unanimity": sum(r["unanimous"] for r in rows) / n,
        "modal_share": sum(r["modal_share"] for r in rows) / n,
        "soft_jaccard_mismatch": (sum(mismatch_sims) / len(mismatch_sims)) if mismatch_sims else None,
    }
    pa = agg["pairwise_agreement"]
    decision = ("parse corpora ONCE per item" if pa >= 0.80 else
                "MAJORITY-OF-3 required for corpus records" if pa >= 0.60 else
                "STOP — fix the prompt before P2 scales")
    ambiguous = 0.70 <= pa <= 0.90

    by_fam = collections.defaultdict(list)
    for r in rows:
        by_fam[r["family"]].append(r["pairwise"])

    L = []
    L.append("# M1 — Parse stability (pilot)\n")
    L.append(f"- items: **{n}**, runs/item: {rows[0]['runs']}")
    for k in ("pairwise_agreement", "shape_agreement", "unanimity", "modal_share"):
        L.append(f"- `{k}`: **{agg[k]:.3f}**")
    if agg["soft_jaccard_mismatch"] is not None:
        L.append(f"- `soft_jaccard_mismatch`: **{agg['soft_jaccard_mismatch']:.3f}** "
                 f"(over {len(mismatch_sims)} disagreeing pairs)")
    L.append(f"\n**Decision rule (metrics.md M1): {decision}**")
    L.append(f"\nExpansion trigger (pairwise in [0.70, 0.90] -> expand to 60x5): "
             f"**{'TRIGGERED' if ambiguous else 'not triggered'}**\n")

    L.append("## Variance attribution (mechanical)\n")
    L.append("| bucket | pairs |\n|---|---|")
    for b, c in buckets.most_common():
        L.append(f"| `{b}` | {c} |")
    if buckets.get("unclassified"):
        L.append(f"\n> `unclassified` ({buckets['unclassified']}) needs the agent reviewer — these "
                 "are the semantic buckets (genuine ambiguity vs a convention gap) that no program "
                 "can separate.")

    L.append("\n## Per-family (lowest first — anything < 0.50 goes to the prompt loop before P2)\n")
    L.append("| family | items | pairwise |\n|---|---|---|")
    for fam, vals in sorted(by_fam.items(), key=lambda kv: sum(kv[1]) / len(kv[1])):
        L.append(f"| {fam} | {len(vals)} | {sum(vals)/len(vals):.3f} |")

    L.append("\n## Per-item\n")
    L.append("| id | family | pairwise | unanimous | modal |\n|---|---|---|---|---|")
    for r in sorted(rows, key=lambda r: r["pairwise"]):
        L.append(f"| {r['id']} | {r['family']} | {r['pairwise']:.2f} | "
                 f"{'yes' if r['unanimous'] else 'no'} | {r['modal_share']:.2f} |")

    text = "\n".join(L) + "\n"
    if args.out:
        pathlib.Path(args.out).write_text(text, encoding="utf-8")
        print(f"-> {args.out}")
    print(text)


if __name__ == "__main__":
    main()
