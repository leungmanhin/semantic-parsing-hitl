"""``python -m fusenf.mine <command>`` from the repo root.

    lift     --parsed FILE [FILE …] --run NAME [--polarity three|two|none|0.25,0.75] [--tense evidence|key]
             [--shape lexicalized|shape] [--limit N]
             → fusenf/runs/NAME/graphs.jsonl, lifted.jsonl, presence.jsonl, summary.md

    patterns --run NAME [--min-families 3] [--min-atoms 2] [--max-atoms 5] [--max-variables N]
             [--exclude-heads A,B] [--support-role mine] [--keep 12] [--tests full|sample|none] [--summary-only]
             → fusenf/runs/NAME/patterns.lexicalized.jsonl, patterns.shape.jsonl, patterns.report.json, patterns.md
             (§5.1: connected patterns with shared typed variables, their generalization and the two tests;
             the key dials are those of the run's lift)

    paraphrase --run NAME [--step align|engine1|classify|engine2|admit|engine3|evaluate|all] [--parsed FILE …]
             [--engine-python PY] [--workers 4] [--beam 64] [--steps 400] [--min-sole-families 2] [--limit N]
             → fusenf/runs/NAME/paraphrase/ (pairs, sentences, each engine round's jobs and results, candidates),
               fusenf/runs/NAME/paraphrase.md, paraphrase.report.json
             (§5.4: the labelled pairs aligned, classified by the chainer, their residuals as invariance candidates
             with the boundary check, and the evaluation share's verdicts before and after; the engine steps run with
             the chainer environment's python, ``--engine-python`` or the variable PETTACHAINER_PYTHON)
"""
from __future__ import annotations

import argparse
import collections
import json
import os
import sys
import time

from . import RUNS, atoms as A, lift as L, tables as TB


def cmd_lift(args) -> int:
    from tmpl import catalog as CAT, coverage as C
    catalog = CAT.load()
    polarity = args.polarity
    if polarity and "," in polarity:
        polarity = [float(x) for x in polarity.split(",")]
    key = L.key_of(polarity=polarity, tense=args.tense, habitual=args.habitual, shape=args.shape)
    t0 = time.time()
    rows = []
    for p in args.parsed:
        rows += [json.loads(l) for l in open(p, encoding="utf-8") if l.strip()]
    rows = C.latest(rows)
    graphs, skipped = [], collections.Counter()
    for r in rows:
        g = A.graph_of(r, catalog)
        if g is None:
            skipped["no graph (failed reply, empty or malformed)"] += 1
            continue
        graphs.append(g)
        if args.limit and len(graphs) >= args.limit:
            break
    lifted = [L.lift(g, key) for g in graphs]
    out = os.path.join(RUNS, args.run)
    A.write_graphs(graphs, os.path.join(out, "graphs.jsonl"))
    A.write_graphs(lifted, os.path.join(out, "lifted.jsonl"))
    table = TB.presence(lifted)
    rows_out = TB.write_table(table, os.path.join(out, "presence.jsonl"))
    fams = TB.families_of(lifted)
    n_atoms = sum(len(g["atoms"]) for g in graphs)
    n_units = sum(len(g["atoms"]) for g in lifted)
    by_ds = collections.Counter(g.get("dataset") for g in graphs)
    by_role = collections.Counter((g.get("dataset"), g.get("role")) for g in graphs)
    kinds = collections.Counter(a["kind"] for g in graphs for a in g["atoms"])
    scoped = sum(1 for g in graphs for a in g["atoms"] if a["scope"])
    top = rows_out[:25]
    lines = [f"# Lift run `{args.run}` — {time.strftime('%Y-%m-%d %H:%M')}", "",
             f"key: {json.dumps(key)}", f"inputs: {', '.join(os.path.relpath(p, os.path.dirname(RUNS)) for p in args.parsed)}", "",
             f"- sentences with a graph: {len(graphs)} (skipped {sum(skipped.values())}: {dict(skipped)})",
             f"- families: {len(fams)} · by dataset: {dict(by_ds)} · by dataset and role: { {f'{d}/{r}': n for (d, r), n in by_role.items()} }",
             f"- atoms: {n_atoms} ({dict(kinds)}); inside a scope: {scoped}",
             f"- units in the key (content atoms lifted): {n_units} · distinct: {len(table)} · present in ≥ 2 families: {sum(1 for r in table.values() if len(r['families']) >= 2)}",
             f"- time: {time.time() - t0:.1f} s", "", "## The 25 most widespread units (families)", "",
             "| families | sentences | unit |", "|---|---|---|"]
    lines += [f"| {r['families']} | {r['sentences']} | `{r['unit']}` |" for r in top]
    with open(os.path.join(out, "summary.md"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines) + "\n")
    print("\n".join(lines[4:10]))
    print(f"→ {os.path.relpath(out, os.getcwd())}/ (graphs.jsonl, lifted.jsonl, presence.jsonl, summary.md)")
    return 0


def cmd_patterns(args) -> int:
    from . import freq_pattern as S, patterns as P
    out = os.path.join(RUNS, args.run)
    if args.summary_only:
        S.resummarize(args.run)
        print(f"→ {os.path.relpath(out, os.getcwd())}/patterns.md written again from the run's files")
        return 0
    key = None
    lifted = os.path.join(out, "lifted.jsonl")
    if os.path.exists(lifted):                                # the dials the run was lifted with
        with open(lifted, encoding="utf-8") as fh:
            first = fh.readline()
        key = (json.loads(first).get("key") if first.strip() else None)
    params = P.params_of(min_families=args.min_families, min_atoms=args.min_atoms, max_atoms=args.max_atoms,
                         max_variables=args.max_variables, support_role=args.support_role, max_embeddings=args.max_embeddings,
                         exclude_heads=[h for h in (args.exclude_heads or "").split(",") if h] or None)
    print(f"patterns of run `{args.run}` — parameters {json.dumps(params)}")
    res = S.run(args.run, params, key, keep=args.keep, tests=args.tests)
    for view in P.VIEWS:
        rep = res["views"][view]["report"]
        sizes = ", ".join(f"{lv['size']} atoms: {lv['frequent']:,}" for lv in rep["levels"])
        capped = sorted({s for lv in rep["levels"] for s in lv["capped_sentences"]})
        print(f"- {view}: {len(res['views'][view]['records']):,} candidates ({sizes})" + (f"; CAPPED sentences: {len(capped)}" if capped else ""))
    print(f"→ {os.path.relpath(out, os.getcwd())}/ (patterns.lexicalized.jsonl, patterns.shape.jsonl, patterns.md) in {res['seconds']['total']} s")
    return 0


def cmd_paraphrase(args) -> int:
    from . import paraphrase as PA
    return PA.main(args)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="python -m fusenf.mine", description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("lift", help="graphs, lifted keys and the presence table of parsed files")
    p.add_argument("--parsed", nargs="+", required=True)
    p.add_argument("--run", required=True, help="the run's folder name under fusenf/runs/")
    p.add_argument("--polarity", default=None, help="three (default) | two | none | cut points a,b,…")
    p.add_argument("--tense", default=None, choices=("evidence", "key"))
    p.add_argument("--habitual", default=None, choices=("evidence", "key"))
    p.add_argument("--shape", default=None, choices=("lexicalized", "shape"))
    p.add_argument("--limit", type=int, default=None)
    q = sub.add_parser("patterns", help="§5.1: connected patterns of a lifted run, generalized and tested")
    q.add_argument("--run", required=True, help="the run's folder name under fusenf/runs/ (its graphs.jsonl is read)")
    q.add_argument("--min-families", type=int, default=None, help="support threshold in families of the support share (default 3)")
    q.add_argument("--min-atoms", type=int, default=None)
    q.add_argument("--max-atoms", type=int, default=None, help="the largest pattern, in atoms (default 5)")
    q.add_argument("--max-variables", type=int, default=None, help="free variables in a pattern (default: no limit)")
    q.add_argument("--exclude-heads", default=None, help="relation types kept out of patterns, comma-separated")
    q.add_argument("--support-role", default=None, help="the share whose families decide frequency (default mine)")
    q.add_argument("--max-embeddings", type=int, default=None, help="cap on one sentence's atom sets at one size (default 200000)")
    q.add_argument("--keep", type=int, default=12, help="sample matches kept on a candidate")
    q.add_argument("--tests", default="full", choices=("full", "sample", "none"))
    q.add_argument("--summary-only", action="store_true", help="write patterns.md again from the run's files, without mining")
    r = sub.add_parser("paraphrase", help="§5.4: the labelled pairs aligned and classified by the chainer, invariance candidates")
    r.add_argument("--run", required=True, help="the run's folder name under fusenf/runs/")
    r.add_argument("--step", default="all", choices=("align", "engine1", "classify", "engine2", "admit", "engine3", "evaluate", "all"))
    r.add_argument("--parsed", nargs="+", default=None, help="parsed files (default: the inputs of the run's lift)")
    r.add_argument("--engine-python", default=os.environ.get("PETTACHAINER_PYTHON"), help="the chainer environment's python")
    r.add_argument("--workers", type=int, default=4)
    r.add_argument("--beam", type=int, default=None, help="the alignment search's width (default 64)")
    r.add_argument("--steps", type=int, default=None, help="the engine's steps per query (default 400)")
    r.add_argument("--min-sole-families", type=int, default=None, help="admission: sole support in this many families (default 2)")
    r.add_argument("--limit", type=int, default=None, help="the first N pairs only (a trial)")
    args = ap.parse_args(argv)
    return {"lift": cmd_lift, "patterns": cmd_patterns, "paraphrase": cmd_paraphrase}[args.cmd](args)


if __name__ == "__main__":
    sys.exit(main())
