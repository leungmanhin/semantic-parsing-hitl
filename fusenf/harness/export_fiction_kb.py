"""Consumer KB export — semantic-chemistry fiction world (owner side quest 2).

Rebuilds `world_rules_parses.json` for the consumer: the source `world_rules.json`
items verbatim, plus per-item mirrored objects
  stmts  {rule: [statement…], texts: [[statement…]…]}   — from the selected parse run
  review {rule: reviewObj|null, texts: […]}              — from review/<id>__run<R>.review.json
  census {rule: flag, texts: [flag…]}                    — deterministic unfireable-rule census

Census (deterministic, no judgment): an `Implication` whose ANTECEDENT contains a
`(sk_… …)` function term can never fire → "unfireable-rule: sk-function-in-premise";
else an antecedent `sk_…` CONSTANT not asserted in any non-rule statement of the same
record → "unfireable-rule: unasserted-sk-constant-in-premise"; else "ok". One flag per
sentence (function-term flag wins). Nested Implications (e.g. sealed) are scanned too —
a sealed rule is inert regardless, but the census reports premise health uniformly.

The `review` objects self-describe their vintage (`"run": N`) — a v2 export may carry
run-1 reviews beside run-2 stmts/census; the consumer reads the run fields.

Usage:
  python export_fiction_kb.py --run 2 --review-run 1 --out <path>
  python export_fiction_kb.py --run 1 --review-run 1 --out /tmp/check.json   # v1 repro
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
sys.path.insert(0, HERE)
from records import parse_sexp, iter_terms, iter_tokens  # noqa: E402

SOURCE = "/home/manhin/Dev/semantic-chemistry/experiments/expt2-fiction-world/world_rules.json"
CORPUS = os.path.join(FUSENF, "corpora", "fiction.jsonl")
PARSES = os.path.join(FUSENF, "parses", "fiction.parses.jsonl")
REVIEW_DIR = os.path.join(FUSENF, "review")

SK_RE = re.compile(r"^sk_[A-Za-z0-9_]+$")


def statement_body(stmt: str):
    """The asserted pattern of a `(: name <pattern> <tv>)` statement, parsed."""
    r = parse_sexp(stmt)
    t = r["node"] if isinstance(r, dict) else r
    if isinstance(t, list) and len(t) == 4 and t[0] == ":":
        return t[2]
    return t


def sk_constants(term) -> set:
    out = set()
    for tok in iter_tokens(term):
        if isinstance(tok, str) and SK_RE.match(tok):
            out.add(tok)
    return out


def has_sk_function(term) -> bool:
    for node in iter_terms(term):
        if isinstance(node, list) and node and isinstance(node[0], str) and SK_RE.match(node[0]):
            return True
    return False


def census_flag(statements: list[str]) -> str:
    bodies = []
    for s in statements:
        try:
            bodies.append(statement_body(s))
        except Exception:
            continue
    asserted = set()
    for b in bodies:
        for node in iter_terms(b):
            if isinstance(node, list) and node and node[0] == "Implication":
                break
        else:
            asserted |= sk_constants(b)
    worst = "ok"
    for b in bodies:
        for node in iter_terms(b):
            if isinstance(node, list) and len(node) == 3 and node[0] == "Implication":
                premise = node[1]
                if has_sk_function(premise):
                    return "unfireable-rule: sk-function-in-premise"
                if sk_constants(premise) - asserted:
                    worst = "unfireable-rule: unasserted-sk-constant-in-premise"
    return worst


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--run", type=int, required=True, help="parse run for stmts + census")
    ap.add_argument("--review-run", type=int, default=1, help="review vintage to carry (objects mode)")
    ap.add_argument("--review-mode", choices=("objects", "advice"), default="objects",
                    help="objects = raw review JSON per sentence; advice = one rewrite-advice "
                         "string per sentence from --advice-dir (owner schema change 2026-08-29)")
    ap.add_argument("--advice-dir", default=os.path.join(FUSENF, "advice"),
                    help="directory of R<nn>__advice.json files (advice mode)")
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    items = json.load(open(SOURCE))
    corpus = [json.loads(l) for l in open(CORPUS)]
    by_source = {}
    for r in corpus:
        by_source[r["source_id"]] = r["id"]

    parses = {}
    for ln in open(PARSES):
        p = json.loads(ln)
        if p.get("run") == args.run:
            parses[p["id"]] = p["statements"]

    def review_of(rid):
        path = os.path.join(REVIEW_DIR, f"{rid}__run{args.review_run}.review.json")
        return json.load(open(path)) if os.path.exists(path) else None

    def advice_of(item):
        rnn = f"R{int(item['id'][1:]):02d}"
        path = os.path.join(args.advice_dir, f"{rnn}__advice.json")
        a = json.load(open(path))
        if not (isinstance(a.get("rule"), str) and isinstance(a.get("texts"), list)
                and len(a["texts"]) == len(item["texts"])
                and all(isinstance(t, str) and t.strip() for t in a["texts"])
                and a["rule"].strip()):
            raise SystemExit(f"malformed advice file {path}")
        return {"rule": a["rule"], "texts": list(a["texts"])}

    out, missing = [], []
    for item in items:
        stmts = {"rule": None, "texts": []}
        review = {"rule": None, "texts": []}
        census = {"rule": None, "texts": []}
        fields = [("rule", "rule")] + [(f"t{k}", "texts") for k in range(1, len(item["texts"]) + 1)]
        for field, slot in fields:
            rid = by_source.get(f"{item['id']}/{field}")
            st = parses.get(rid)
            if st is None:
                missing.append(f"{item['id']}/{field} ({rid})")
                st = []
            flag = census_flag(st)
            rv = review_of(rid)
            if slot == "rule":
                stmts["rule"], review["rule"], census["rule"] = st, rv, flag
            else:
                stmts["texts"].append(st)
                review["texts"].append(rv)
                census["texts"].append(flag)
        if args.review_mode == "advice":
            review = advice_of(item)
        out.append({**item, "stmts": stmts, "review": review, "census": census})

    if missing:
        raise SystemExit("missing parses for: " + ", ".join(missing))
    json.dump(out, open(args.out, "w", encoding="utf-8"), indent=1, ensure_ascii=False)
    n_ok = sum((1 if it["census"]["rule"] == "ok" else 0) + sum(1 for c in it["census"]["texts"] if c == "ok")
               for it in out)
    print(f"-> {args.out}  ({len(out)} items, run {args.run} stmts, review run {args.review_run}; census ok {n_ok}/138)")


if __name__ == "__main__":
    main()
