"""Build the per-item ADVICE work files (``R<nn>.json``) the Opus advisers read.

One file per consumer source item: ``{"id", "rule", "texts", "fields": [...]}`` where
``rule`` is CONTEXT ONLY (never parsed) and ``fields`` has one entry per TEXT sentence:
``{field, corpus_id, sentence, parse, census, review, adjudication}`` — the current parse
(selected run), the deterministic fireability census (export_fiction_kb.census_flag), the
blind review verdict, and the adjudication verdict when one exists (any tag; ``fable`` is
the production tier). Schema matches the 2026-09-01 hand-built v2 work files exactly.

    python build_advice_work.py --corpus ../corpora/fiction3.jsonl \\
        --parses ../parses/fiction3.parses.jsonl --run 1 \\
        --source-json <world_rules.json> --out-dir ../consumer/semantic-chemistry/advice3_work
"""
from __future__ import annotations

import argparse
import glob
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
sys.path.insert(0, HERE)
from export_fiction_kb import census_flag  # noqa: E402


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--corpus", required=True)
    ap.add_argument("--parses", required=True)
    ap.add_argument("--run", type=int, required=True)
    ap.add_argument("--source-json", required=True)
    ap.add_argument("--review-run", type=int, default=1)
    ap.add_argument("--out-dir", required=True)
    args = ap.parse_args()

    items = json.load(open(args.source_json))
    by_source = {}
    for ln in open(args.corpus, encoding="utf-8"):
        r = json.loads(ln)
        by_source[r["source_id"]] = r["id"]
    parses = {}
    for ln in open(args.parses, encoding="utf-8"):
        p = json.loads(ln)
        if p.get("run") == args.run:
            parses[p["id"]] = p["statements"]

    def load_opt(path):
        return json.load(open(path, encoding="utf-8")) if os.path.exists(path) else None

    def adjudication_of(rid):
        paths = sorted(glob.glob(os.path.join(FUSENF, "adjudication",
                                              f"{rid}__run{args.run}.*.adj.json")))
        fable = [p for p in paths if p.endswith(".fable.adj.json")]
        return load_opt((fable or paths)[0]) if paths else None

    os.makedirs(args.out_dir, exist_ok=True)
    n_files = n_fields = n_adj = 0
    missing = []
    for item in items:
        rnn = f"R{int(item['id'][1:]):02d}"
        fields = []
        for k, sentence in enumerate(item["texts"], 1):
            rid = by_source.get(f"{item['id']}/t{k}")
            st = parses.get(rid)
            if rid is None or st is None:
                missing.append(f"{item['id']}/t{k}")
                continue
            adj = adjudication_of(rid)
            n_adj += 1 if adj else 0
            fields.append({
                "field": f"t{k}", "corpus_id": rid, "sentence": sentence,
                "parse": st, "census": census_flag(st),
                "review": load_opt(os.path.join(FUSENF, "review",
                                                f"{rid}__run{args.review_run}.review.json")),
                "adjudication": adj,
            })
        n_fields += len(fields)
        with open(os.path.join(args.out_dir, f"{rnn}.json"), "w", encoding="utf-8") as fh:
            json.dump({"id": item["id"], "rule": item.get("rule"), "texts": item["texts"],
                       "fields": fields}, fh, indent=1, ensure_ascii=False)
        n_files += 1
    if missing:
        raise SystemExit("missing parses for: " + ", ".join(missing))
    print(f"-> {args.out_dir}: {n_files} work files, {n_fields} text fields, "
          f"{n_adj} with adjudication")


if __name__ == "__main__":
    main()
