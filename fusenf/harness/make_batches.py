"""Write 5-item load-balanced dispatch batches (DISPATCH.md ops: longer items to smaller
batches) as tab-separated ``<ID>\\t<SENTENCE>`` files — the format every brief expects.

    python make_batches.py --corpus ../corpora/fiction3.jsonl --prefix f3 \\
        --out-dir ../batches/parse [--ids ids.txt] [--size 5]

``--ids`` restricts to the listed record ids (one per line) — e.g. the flagged subset for
an adjudication wave. Deterministic: items sorted by sentence length (desc), each placed in
the least-loaded batch that holds no record of the same ``equiv_class`` (the fiction
manifests' dispatch constraint: one sentence per source item per batch; also keeps a
paraphrase pair's two sides apart). Fails loudly if the constraint cannot be met.
"""
from __future__ import annotations

import argparse
import json
import math
import os


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--corpus", required=True)
    ap.add_argument("--prefix", required=True)
    ap.add_argument("--out-dir", required=True)
    ap.add_argument("--ids", default=None, help="file of record ids to include (default: all)")
    ap.add_argument("--size", type=int, default=5)
    ap.add_argument("--context-dir", default=None,
                    help="records whose context.prior is non-empty get a THIRD column naming "
                         "<context-dir>/<ID>.ctx.txt (the prior atoms, one per line, verbatim) — "
                         "the CONTEXT: block of prompt.txt's input form (QA task stream, 2026-09-20)")
    args = ap.parse_args()

    keep = None
    if args.ids:
        keep = {l.strip() for l in open(args.ids) if l.strip()}
    items = []
    for ln in open(args.corpus, encoding="utf-8"):
        r = json.loads(ln)
        if keep is not None and r["id"] not in keep:
            continue
        # TEXT = every sentence of the record on one line (single-sentence records unchanged;
        # passage records = the whole episode, translated together per prompt.txt "Input")
        text = " ".join(x.strip() for x in r["sentences"])
        prior = (r.get("context") or {}).get("prior") or []
        if prior and args.context_dir:
            os.makedirs(args.context_dir, exist_ok=True)
            ctx_path = os.path.abspath(os.path.join(args.context_dir, f"{r['id']}.ctx.txt"))
            with open(ctx_path, "w", encoding="utf-8") as fh:
                fh.write("\n".join(prior) + "\n")
            text = f"{text}\t{ctx_path}"
        elif prior:
            raise SystemExit(f"{r['id']} carries context.prior but no --context-dir was given")
        items.append((r["id"], text, r.get("equiv_class")))
    if keep is not None and len(items) != len(keep):
        missing = sorted(keep - {i for i, _, _ in items})
        raise SystemExit(f"{len(missing)} ids not in corpus (first: {missing[:3]})")
    n_batches = math.ceil(len(items) / args.size)
    order = sorted(items, key=lambda t: (-len(t[1].split("\t")[0]), t[0]))
    bins = [[] for _ in range(n_batches)]
    classes = [set() for _ in range(n_batches)]
    for rid, sent, ec in order:
        cands = [b for b in range(n_batches)
                 if len(bins[b]) < args.size and (ec is None or ec not in classes[b])]
        if not cands:
            raise SystemExit(f"cannot place {rid} (equiv_class {ec!r}) — raise --size or batches")
        b = min(cands, key=lambda b: (len(bins[b]), sum(len(s.split("\t")[0]) for _, s, _ in bins[b]), b))
        bins[b].append((rid, sent, ec))
        if ec is not None:
            classes[b].add(ec)
    os.makedirs(args.out_dir, exist_ok=True)
    for b, rows in enumerate(bins, 1):
        rows.sort()
        path = os.path.join(args.out_dir, f"{args.prefix}-{b:02d}.txt")
        with open(path, "w", encoding="utf-8") as fh:
            for rid, sent, _ in rows:
                fh.write(f"{rid}\t{sent}\n")
    print(f"{len(items)} items -> {n_batches} batches {args.prefix}-01..{n_batches:02d} in {args.out_dir}")


if __name__ == "__main__":
    main()
