"""Tier A answer key for §4.3.2 slot-merge signals (H comparison protocol, 2026-09-03).

Tier A (corpora/tierA.jsonl) is designed: every equiv_class holds a base sentence, its
same-polarity paraphrase variants (``mining`` = lexical / converse rewrites, ``normalize``
= structural) and ``control`` variants that must NOT merge (participant-swap, antonym,
manner-near-miss, negation, modality-shift, quantity-change). Event lemmas per record
come from the canonical stars (kind ``event``).

Key:
* ``expected``  lemma pairs (base lemma, variant lemma) a variant introduces
                (buy~purchase, buy~acquire, buy~sell the converse, repair~fix, …) —
                recovered when ANY slot-merge signal (any subtype) links the two classes;
* ``control_lexical``  lemma pairs an antonym / manner-near-miss control introduces
                (repair~break, repair~damage) — a same-role or cross-both signal between
                them is a control hit;
* ``control_swap``  classes with a participant-swap control — a cross-role signal
                between that class's Agent and its object role is a control hit.

``score(key, signals)`` -> recall over expected pairs + control hits, with the hits.
Usage: python tierA_slot_key.py [--out out_ecmp/tierA_slot_key.json] [--score <signals.jsonl>]
"""

from __future__ import annotations

import argparse
import collections
import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def build_key(corpus_path, canon_path):
    events = {}
    for rec in load(canon_path):
        events[rec["id"]] = sorted({st["class"] for st in rec["stars"].values()
                                    if st["kind"] == "event" and st.get("class")})
    by = collections.defaultdict(list)
    for r in load(corpus_path):
        by[r["equiv_class"]].append(r)
    expected, control_lex, control_swap = {}, {}, {}
    for cls, grp in sorted(by.items()):
        base = [r for r in grp if r["labels"]["variant_kind"] == "base"]
        if not base:
            continue
        base_ev = set(events.get(base[0]["id"], []))
        for r in grp:
            lab = r["labels"]
            new = [e for e in events.get(r["id"], []) if e not in base_ev]
            for b in sorted(base_ev):
                for e in new:
                    pair = tuple(sorted((b, e)))
                    if lab["variant_kind"] in ("mining", "normalize") and lab["polarity"] == "same":
                        expected.setdefault(pair, []).append(r["id"])
                    elif lab["control_kind"] in ("antonym", "manner-near-miss"):
                        control_lex.setdefault(pair, []).append(r["id"])
            if lab["control_kind"] == "participant-swap":
                for b in sorted(base_ev):
                    control_swap.setdefault(b, []).append(r["id"])
    return {"expected": {"|".join(p): ids for p, ids in sorted(expected.items())},
            "control_lexical": {"|".join(p): ids for p, ids in sorted(control_lex.items())},
            "control_swap": dict(sorted(control_swap.items()))}


def score(key, signals):
    """signals: rows with candidate.slot_a/slot_b/subtype -> {recall, hits, control_hits}"""
    links = collections.defaultdict(set)     # lemma pair -> subtypes linking them
    role_pairs = collections.defaultdict(set)   # class -> {(role_a, role_b)} cross-role
    for s in signals:
        c = s["candidate"]
        ca, ra = c["slot_a"].rsplit(".", 1)
        cb, rb = c["slot_b"].rsplit(".", 1)
        if ca != cb:
            links[tuple(sorted((ca, cb)))].add(c["subtype"])
        else:
            role_pairs[ca].add(tuple(sorted((ra, rb))))
    hits = {p: sorted(links[tuple(p.split("|"))]) for p in key["expected"] if tuple(p.split("|")) in links}
    ctl_lex = {p: sorted(links[tuple(p.split("|"))]) for p in key["control_lexical"]
               if links.get(tuple(p.split("|")), set()) & {"cross-event", "cross-both"}}
    ctl_swap = {c: sorted(role_pairs[c]) for c in key["control_swap"]
                if any("Agent" in rp and (set(rp) & {"Theme", "Patient"}) for rp in role_pairs.get(c, ()))}
    n_exp = len(key["expected"])
    return {"expected": n_exp, "recovered": len(hits), "recall": round(len(hits) / n_exp, 3) if n_exp else None,
            "hits": hits, "missed": sorted(p for p in key["expected"] if p not in hits),
            "control_lexical_hits": ctl_lex, "control_swap_hits": ctl_swap,
            "control_hits": len(ctl_lex) + len(ctl_swap)}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--corpus", default=os.path.join(FUSENF, "corpora", "tierA.jsonl"))
    ap.add_argument("--canonical", default=os.path.join(FUSENF, "canonical", "tierA.canon.jsonl"))
    ap.add_argument("--out", default=os.path.join(HERE, "out_ecmp", "tierA_slot_key.json"))
    ap.add_argument("--score", default=None, help="a signals .jsonl to score against the key")
    args = ap.parse_args()
    key = build_key(args.corpus, args.canonical)
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    json.dump(key, open(args.out, "w"), indent=1, sort_keys=True)
    print(f"-> {args.out}: {len(key['expected'])} expected lemma pairs, "
          f"{len(key['control_lexical'])} lexical control pairs, {len(key['control_swap'])} swap-control classes")
    if args.score:
        sc = score(key, load(args.score))
        print(json.dumps({k: v for k, v in sc.items() if k not in ("hits", "missed")}, indent=1))
        print("hits:", sc["hits"])
        print("missed:", sc["missed"])


if __name__ == "__main__":
    main()
