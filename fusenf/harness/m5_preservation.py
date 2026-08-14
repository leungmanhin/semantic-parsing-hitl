"""FUSE-NF M5 — chainer QA preservation (metrics.md M5), run under the PeTTaChainer env.

For N consolidated records (records the rewriter actually changed), instantiate a query
from the FAITHFUL record's own largest event star (its class atom + up to three role/status
atoms, canonical skolems -> variables) and run it against two fresh KBs:

    faithful KB      = seeded rules + validated mined bridges + the faithful statements
    consolidated KB  = seeded rules + validated mined bridges + the consolidated statements

The query is deliberately in FAITHFUL vocabulary: consolidation may have rewritten it away,
and the bridges are what must carry the question across. Reported per metrics.md:

    preservation  = answered-by-consolidated / answered-by-faithful   (hard gate 1.0)
    fabrication   = answered by consolidated but NOT by faithful       (hard gate 0)
    frozen deltas = per frozen head, total atom-count change across the corpus

A preservation miss is triaged: if the query binds after dropping the event-class conjunct,
the miss is attributed to the filed engine bug ``bug_conj_reuses_rule_premise`` (the class
atom doubles as the deriving bridge's premise), not to the rule set.

Usage (MUST run via `cd /home/manhin/Dev/PeTTaChainer && uv run python ...`):
  python m5_preservation.py --faithful ../canonical/tierA.canon.jsonl \
      --consolidated ../consolidated/tierA.cons.jsonl \
      --bridges ../rules/mined_bridges_wave1.metta --n 40
"""

from __future__ import annotations

import argparse
import collections
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from pettachainer import PeTTaChainer  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
SEEDED = os.path.join(FUSENF, os.pardir, "seeded_rules.metta")
STEPS = 400
RE_SK = re.compile(r"(?<![\w$])([exf])(\d+)(?![\w])")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def rule_lines(path):
    out = []
    for line in open(path, encoding="utf-8"):
        line = line.strip()
        if line and not line.startswith(";"):
            out.append(line)
    return out


def statements_of(rec):
    return ["(: %s %s (STV %s %s))" % (a["proof_name"], a["term"], a["stv"][0], a["stv"][1])
            for a in rec["atoms"]]


def build_query(rec):
    """Faithful-vocabulary conjunction from the record's largest event star."""
    stars = [(s, st) for s, st in rec["stars"].items()
             if st["kind"] == "event" and re.fullmatch(r"[exf]\d+", s)]
    if not stars:
        return None
    sym, star = max(stars, key=lambda kv: (len(kv[1]["atoms"]), kv[0]))
    atoms = [rec["atoms"][i]["term"] for i in star["atoms"]]
    cls = [a for a in atoms if a.startswith("(Member %s " % sym)]
    rest = [a for a in atoms if a not in cls]
    chosen = (cls[:1] + rest)[:4]
    if not chosen:
        return None

    names = {}
    def sub(m):
        tok = m.group(0)
        if tok not in names:
            names[tok] = "$%s%d" % (m.group(1), len(names))
        return names[tok]
    qs = [RE_SK.sub(sub, a) for a in chosen]
    return qs


def answers(kb_lines, statements, query_conj):
    h = PeTTaChainer()
    for l in kb_lines:
        h.add_atom(l)
    for s in statements:
        h.add_atom(s)
    q = query_conj[0] if len(query_conj) == 1 else "(And %s)" % " ".join(query_conj)
    return bool(h.query("(: $prf %s $tv)" % q, steps=STEPS, timeout_sec=0))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--faithful", required=True)
    ap.add_argument("--consolidated", required=True)
    ap.add_argument("--bridges", required=True)
    ap.add_argument("--n", type=int, default=40)
    args = ap.parse_args()

    faithful = {r["id"]: r for r in load(args.faithful)}
    cons = {r["id"]: r for r in load(args.consolidated)}
    changed = sorted(cid for cid, r in cons.items()
                     if r.get("consolidation", {}).get("source_graph_id") != r["graph_id"])
    picked = changed[:args.n]
    kb = rule_lines(SEEDED) + rule_lines(args.bridges)

    n_f = n_c = n_fab = 0
    engine_bug = []
    misses = []
    for cid in picked:
        q = build_query(faithful[cid])
        if not q:
            continue
        f_ans = answers(kb, statements_of(faithful[cid]), q)
        c_ans = answers(kb, statements_of(cons[cid]), q)
        if f_ans:
            n_f += 1
            if c_ans:
                n_c += 1
            else:
                if len(q) > 1 and answers(kb, statements_of(cons[cid]), q[1:]):
                    engine_bug.append(cid)
                else:
                    misses.append(cid)
        elif c_ans:
            n_fab += 1

    # frozen-head atom-count deltas across the whole corpus
    raw = json.load(open(os.path.join(FUSENF, "specs", "vocabulary.json"), encoding="utf-8"))
    frozen = {n for n, e in raw["operators"].items() if e.get("frozen")}
    delta = collections.Counter()
    for cid, fr in faithful.items():
        cr = cons.get(cid)
        if not cr:
            continue
        for rec, sign in ((fr, -1), (cr, +1)):
            for a in rec["atoms"]:
                head = a["term"].strip("()").split()[0]
                if head in frozen:
                    delta[head] += sign

    print(f"records probed: {len(picked)} (changed by consolidation)")
    print(f"answered by faithful: {n_f}")
    print(f"preservation: {n_c}/{n_f}"
          f"  (+{len(engine_bug)} attributable to bug_conj_reuses_rule_premise: {engine_bug})")
    print(f"unexplained misses: {misses or 'none'}")
    print(f"fabrication: {n_fab}")
    nz = {k: v for k, v in sorted(delta.items()) if v}
    print(f"frozen-head atom deltas (consolidated - faithful): {nz or 'none'}")


if __name__ == "__main__":
    main()
