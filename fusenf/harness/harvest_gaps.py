"""Harvest coverage-gap strings from review + adjudication outputs and route them into families.

Inputs (per chunk ids file): review/<id>__run<N>.review.json (q2_gaps -> source `rv-gap`, q1_issues of
records adjudicated defect are NOT harvested — the adjudicator's defect_summary is), and
adjudication/<id>__run<N>.<tag>.adj.json (gaps_confirmed -> `aj-conf`, new_gaps -> `aj-new`,
defect_summary of `defect` rulings -> `aj-defect`).

Families: a JSON table {family: regex} (default eval/fp5_families.json); a string routes to EVERY
family whose regex matches (counts are relative mass, as in the FP4 routing) and to `_unrouted`
when none does. Deterministic; re-running is byte-identical.

Outputs: --out-json (family -> [[id, source, string], ...], plus `_unrouted`) and --out-md
(counts per family x source, top examples, the unrouted list for eyeballing).

Usage:
  python harvest_gaps.py --ids batches/parse/lore_chunk1_ids.txt --ids ... --run 1 --tag opus \
      --families eval/fp5_families.json --out-json eval/fp5_gap_routing.json --out-md eval/fp5_gap_harvest.md
"""
from __future__ import annotations
import argparse, collections, json, os, re

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.normpath(os.path.join(HERE, os.pardir))


def s(x):
    return x if isinstance(x, str) else json.dumps(x, ensure_ascii=False, sort_keys=True)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--ids", action="append", required=True, help="ids file(s); label = file stem")
    ap.add_argument("--run", type=int, default=1)
    ap.add_argument("--tag", default="opus")
    ap.add_argument("--review-dir", default=os.path.join(FUSENF, "review"))
    ap.add_argument("--adj-dir", default=os.path.join(FUSENF, "adjudication"))
    ap.add_argument("--families", required=True)
    ap.add_argument("--out-json", required=True)
    ap.add_argument("--out-md", required=True)
    ap.add_argument("--examples", type=int, default=6)
    args = ap.parse_args()

    fams = json.load(open(args.families, encoding="utf-8"))
    fams = {k: re.compile(v, re.I) for k, v in fams.items() if not k.startswith("_")}
    rows = []  # (id, chunk, source, string)
    n_rec = n_adj = 0
    for path in args.ids:
        chunk = os.path.splitext(os.path.basename(path))[0]
        for i in [l.strip() for l in open(path, encoding="utf-8") if l.strip()]:
            rp = os.path.join(args.review_dir, f"{i}__run{args.run}.review.json")
            if os.path.exists(rp):
                n_rec += 1
                r = json.load(open(rp, encoding="utf-8"))
                for g in r.get("q2_gaps") or []:
                    rows.append((i, chunk, "rv-gap", s(g)))
            apth = os.path.join(args.adj_dir, f"{i}__run{args.run}.{args.tag}.adj.json")
            if os.path.exists(apth):
                n_adj += 1
                a = json.load(open(apth, encoding="utf-8"))
                for g in a.get("gaps_confirmed") or []:
                    rows.append((i, chunk, "aj-conf", s(g)))
                for g in a.get("new_gaps") or []:
                    rows.append((i, chunk, "aj-new", s(g)))
                if a.get("decision") == "defect" and a.get("defect_summary"):
                    rows.append((i, chunk, "aj-defect", s(a["defect_summary"])))
    routing = collections.OrderedDict((k, []) for k in fams)
    routing["_unrouted"] = []
    per = collections.defaultdict(collections.Counter)
    for i, chunk, src, text in rows:
        hit = [k for k, rx in fams.items() if rx.search(text)]
        for k in hit or ["_unrouted"]:
            routing[k].append([i, src, text])
            per[k][src] += 1
            per[k]["chunk:" + chunk] += 1
    os.makedirs(os.path.dirname(os.path.abspath(args.out_json)), exist_ok=True)
    with open(args.out_json, "w", encoding="utf-8") as fh:
        json.dump(routing, fh, ensure_ascii=False, indent=1)
    srcs = ["rv-gap", "aj-conf", "aj-new", "aj-defect"]
    chunks = [os.path.splitext(os.path.basename(p))[0] for p in args.ids]
    lines = [f"# Gap harvest — {len(rows)} strings from {n_rec} reviewed / {n_adj} adjudicated records "
             f"({', '.join(chunks)}); run {args.run}, tag {args.tag}",
             "", "Counts are RELATIVE MASS: a string routes to every family whose pattern matches "
             "(and to `_unrouted` when none does); the same gap is often filed at review and again at adjudication.", "",
             "| family | total | " + " | ".join(srcs) + " | " + " | ".join(chunks) + " |",
             "|---|---|" + "---|" * (len(srcs) + len(chunks))]
    order = sorted(routing, key=lambda k: (k == "_unrouted", -len(routing[k])))
    for k in order:
        c = per[k]
        lines.append(f"| {k} | {len(routing[k])} | " + " | ".join(str(c[x]) for x in srcs) + " | "
                     + " | ".join(str(c['chunk:' + ch]) for ch in chunks) + " |")
    by_src = collections.Counter(r[2] for r in rows)
    lines += ["", "Source totals: " + ", ".join(f"{k} {by_src[k]}" for k in srcs), ""]
    for k in order:
        if k == "_unrouted":
            continue
        lines += [f"## {k} ({len(routing[k])})", ""]
        seen = set()
        for i, src, text in routing[k]:
            key = text[:80]
            if key in seen:
                continue
            seen.add(key)
            lines.append(f"- `{i}` [{src}] {text[:300]}")
            if len(seen) >= args.examples:
                break
        lines.append("")
    lines += [f"## _unrouted ({len(routing['_unrouted'])}) — eyeball and extend the families table", ""]
    for i, src, text in routing["_unrouted"]:
        lines.append(f"- `{i}` [{src}] {text[:300]}")
    with open(args.out_md, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines) + "\n")
    print(f"{len(rows)} strings from {n_rec} reviewed / {n_adj} adjudicated records; "
          f"{len(routing['_unrouted'])} unrouted -> {args.out_json}, {args.out_md}")


if __name__ == "__main__":
    main()
