"""M1 — dump the disagreeing pairs behind a stability number, one block per pair.

`m1_stability.py` says how often two parses of the same sentence agree and mechanically buckets
the ones that don't. It deliberately stops there: whether a disagreement is genuine ambiguity or
a convention gap is a judgment call, and per the deterministic-first split (schema.md §5) that
goes to an agent reviewer. This script prepares that reviewer's input — the sentence, the two
canonical forms, and the term-level diff — so no judgment is spent on data wrangling.

Diffs are over WILDCARD terms (canonical skolems collapsed to `SK`), which is the same projection
`m1_stability.attribute` buckets on. A pair that diffs to nothing here but still disagrees on
`graph_id` differs only in skolem naming or atom order.

Usage:
  python m1_disagreements.py <canonical.jsonl> --corpus <corpus.jsonl> \
      [--bucket unclassified] [--out <dump.md>] [--jsonl <dump.jsonl>]
"""
import sys, json, argparse, itertools, collections, pathlib

sys.path.insert(0, str(pathlib.Path(__file__).parent))
import m1_stability as M1  # noqa: E402


def wildcard_map(canon):
    """wildcard term -> list of concrete terms, so a diff can show what it collapsed."""
    out = collections.defaultdict(list)
    for w, a in zip(M1.wildcard_atoms(canon), sorted(canon.get("atoms", []),
                                                     key=lambda a: str(a.get("term")))):
        out[w].append(a)
    return out


def pair_diff(a, b):
    wa, wb = collections.Counter(M1.wildcard_atoms(a)), collections.Counter(M1.wildcard_atoms(b))
    return sorted((wa - wb).elements()), sorted((wb - wa).elements())


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical")
    ap.add_argument("--corpus")
    ap.add_argument("--vocab", default=str(pathlib.Path(__file__).parent.parent
                                           / "specs" / "vocabulary.json"))
    ap.add_argument("--bucket", default=None,
                    help="only dump pairs in this bucket (default: all disagreeing pairs)")
    ap.add_argument("--out", help="markdown dump for the agent reviewer")
    ap.add_argument("--jsonl", help="machine-readable dump, one object per pair")
    args = ap.parse_args()

    canon = M1.load(args.canonical)
    sentences = {}
    if args.corpus:
        for r in M1.load(args.corpus):
            s = r.get("sentences") or r.get("text") or r.get("sentence")
            sentences[r["id"]] = " ".join(s) if isinstance(s, list) else s
    vocab = json.load(open(args.vocab, encoding="utf-8"))
    roles = {n for n, r in vocab["operators"].items() if r.get("class") == "role"}

    by_id = collections.defaultdict(list)
    for c in canon:
        by_id[c["id"]].append(c)

    pairs = []
    for cid, runs in sorted(by_id.items()):
        for a, b in itertools.combinations(sorted(runs, key=lambda r: r.get("run", 0)), 2):
            if a["graph_id"] == b["graph_id"]:
                continue
            bucket = M1.attribute(a, b, roles)
            if args.bucket and bucket != args.bucket:
                continue
            only_a, only_b = pair_diff(a, b)
            pairs.append({
                "id": cid, "runs": [a.get("run"), b.get("run")], "bucket": bucket,
                "sentence": sentences.get(cid),
                "n_atoms": [len(a["atoms"]), len(b["atoms"])],
                "shape_same": a.get("shape_id") == b.get("shape_id"),
                "content_same": a.get("content_id") == b.get("content_id"),
                "only_a": only_a, "only_b": only_b,
                "terms_a": M1.wildcard_atoms(a), "terms_b": M1.wildcard_atoms(b),
            })

    L = [f"# M1 disagreements — `{pathlib.Path(args.canonical).name}`"
         f"{f' (bucket `{args.bucket}`)' if args.bucket else ''}\n",
         f"{len(pairs)} pair(s). Diffs are over wildcard terms — canonical skolems shown as `SK`,"
         " so anything left is a real structural or lexical difference.\n"]
    for i, p in enumerate(pairs, 1):
        L.append(f"\n---\n\n## {i}. {p['id']}  (runs {p['runs'][0]} vs {p['runs'][1]})\n")
        L.append(f"> {p['sentence']}\n")
        L.append(f"- atoms: {p['n_atoms'][0]} vs {p['n_atoms'][1]}"
                 f"   shape_id same: {'yes' if p['shape_same'] else 'no'}"
                 f"   content_id same: {'yes' if p['content_same'] else 'no'}")
        L.append(f"\n**only in run {p['runs'][0]}** ({len(p['only_a'])})\n```")
        L.extend(p["only_a"] or ["(nothing)"])
        L.append("```")
        L.append(f"\n**only in run {p['runs'][1]}** ({len(p['only_b'])})\n```")
        L.extend(p["only_b"] or ["(nothing)"])
        L.append("```")

    text = "\n".join(L) + "\n"
    if args.out:
        pathlib.Path(args.out).write_text(text, encoding="utf-8")
        print(f"-> {args.out}")
    if args.jsonl:
        with open(args.jsonl, "w", encoding="utf-8") as fh:
            for p in pairs:
                fh.write(json.dumps(p, ensure_ascii=False) + "\n")
        print(f"-> {args.jsonl}")
    if not (args.out or args.jsonl):
        print(text)
    else:
        print(f"{len(pairs)} pair(s)"
              + (f" in bucket `{args.bucket}`" if args.bucket else ""))


if __name__ == "__main__":
    main()
