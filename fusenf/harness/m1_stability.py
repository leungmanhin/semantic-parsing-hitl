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

    If two parses agree under this projection but disagree on graph_id, the difference is pure
    skolem naming or atom order — which canonicalization is supposed to erase. That is a
    canonicalizer BUG, and the count must be zero.
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
    if wildcard_atoms(a) == wildcard_atoms(b):
        return "canonicalizer"                      # must be 0
    if a.get("shape_id") == b.get("shape_id"):
        return "tv-only"
    ta = {x["term"] if isinstance(x.get("term"), str) else str(x.get("term")) for x in a["atoms"]}
    tb = {x["term"] if isinstance(x.get("term"), str) else str(x.get("term")) for x in b["atoms"]}
    wa, wb = set(wildcard_atoms(a)), set(wildcard_atoms(b))
    if wa < wb or wb < wa:
        return "optional-atom"                      # one is a strict superset of the other
    if len(wa) == len(wb):
        only_a, only_b = wa - wb, wb - wa
        if len(only_a) == len(only_b) and only_a:
            ha = collections.Counter(head_of(t) for t in only_a)
            hb = collections.Counter(head_of(t) for t in only_b)
            if ha != hb and all(h in vocab_roles for h in (ha | hb)):
                return "role-choice"
    if abs(len(wa) - len(wb)) >= 2:
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
        flag = "  **<-- MUST BE 0**" if b == "canonicalizer" else ""
        L.append(f"| `{b}` | {c}{flag} |")
    if buckets.get("canonicalizer"):
        L.append("\n> **BLOCKER:** `canonicalizer` is non-zero — differences that canonicalization "
                 "is supposed to erase are surviving into `graph_id`. Fix before P2 (metrics.md M1).")
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
