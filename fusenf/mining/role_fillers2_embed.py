"""FUSE-NF §4.3.2 — the paper-faithful EMBEDDING mode (H, 2026-09-03; owner protocol).

Paper §4.3.2: "collect the set of fillers across the corpus and embed them in a vector
space (using word or subtree embeddings). Clustering these embeddings reveals when two
slots share indistinguishable distributions of fillers, indicating they fulfill the same
semantic role and can be merged."

Pipeline: ``valuations_occ.jsonl`` (one row per filler occurrence) -> each occurrence's
text(s) exactly as ``embeddings.py`` rendered them (``word``: one text per label with
1/m mass; ``subtree``: the label bag / plural form / surface name as one text) -> the
cached Qwen3 matrix -> agglomerative clustering (average linkage, cosine distance; one
linkage tree, cut at each ``--cluster-cos`` threshold) -> every slot becomes a mass
distribution over CLUSTERS -> the same comparison as the exact-label method
(``role_fillers2.compare_slots``: role-conditional PPMI, >=2 shared informative units,
cosine >= ``--cos``). Threshold 1.0 = one cluster per distinct text = the exact-label
method up to text rendering — the two methods are one similarity with a dial.

Also: the #23 flip classes' Theme-vs-Patient distributions compared in cluster space
("indistinguishable" = high cosine) at every threshold.

Outputs (in --out-dir): ``rolefiller2_signals_embed_<mode>_<cos>.jsonl`` per threshold,
``rolefiller2_clusters_<mode>_<cos>.jsonl`` (cluster members), and the comparison
report ``rolefillers2_compare.md`` (exact-label vs embed across the dial, top signals
with witness sentences, flips in cluster space). Deterministic given the cached matrix.

Usage:
  python role_fillers2_embed.py [--emb-dir out_h/embeddings] [--emb-mode word|subtree|both]
      [--cluster-cos 0.80,0.85,0.90,1.0] [--min-n 3] [--cos 0.5] [--weighting ppmi]
"""

from __future__ import annotations

import argparse
import collections
import glob
import json
import math
import os
import sys

import numpy as np
from scipy.cluster.hierarchy import fcluster, linkage
from scipy.spatial.distance import pdist

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from embeddings import occ_texts, surface_names  # noqa: E402
from role_fillers2 import compare_slots, cosine, is_wild, make_head_class, mass, uniq  # noqa: E402
from tierA_slot_key import score as score_key  # noqa: E402


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def load_matrix(emb_dir, mode="union"):
    emb = np.load(os.path.join(emb_dir, f"emb_{mode}.npy"))
    idx = {r["text"]: r["i"] for r in load(os.path.join(emb_dir, f"index_{mode}.jsonl"))}
    return emb, idx


def cluster_tree(emb):
    """average-linkage tree over cosine distance (one tree, cut per threshold)"""
    return linkage(pdist(emb.astype(np.float64), metric="cosine"), method="average")


def cut(tree, n, cos_thr):
    """cluster id per row; cos 1.0 -> identical embeddings only (distinct texts)"""
    if cos_thr >= 1.0:
        return np.arange(n)   # each text its own cluster
    return fcluster(tree, t=1.0 - cos_thr, criterion="distance")


def jsd(pa, pb):
    """Jensen-Shannon divergence (base 2) between two mass dicts"""
    keys = set(pa) | set(pb)
    sa, sb = sum(pa.values()), sum(pb.values())
    if not sa or not sb:
        return None
    d = 0.0
    for k in keys:
        a, b = pa.get(k, 0) / sa, pb.get(k, 0) / sb
        m = (a + b) / 2
        if a:
            d += 0.5 * a * math.log2(a / m)
        if b:
            d += 0.5 * b * math.log2(b / m)
    return round(d, 3)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--occ", default=os.path.join(HERE, "out_h", "valuations_occ.jsonl"))
    ap.add_argument("--canonical", default=os.path.join(HERE, "canonical_substrate.jsonl"))
    ap.add_argument("--emb-dir", default=os.path.join(HERE, "out_h", "embeddings"))
    ap.add_argument("--emb-mode", choices=("word", "subtree", "both"), default="both")
    ap.add_argument("--cluster-cos", default="0.80,0.85,0.90,1.0")
    ap.add_argument("--min-n", type=int, default=3)
    ap.add_argument("--cos", type=float, default=0.5)
    ap.add_argument("--weighting", choices=("raw", "ppmi"), default="ppmi")
    ap.add_argument("--vocab", default=os.path.join(HERE, os.pardir, "specs", "vocabulary.json"))
    ap.add_argument("--exact-signals", default=None, help="exact-label signals for the side-by-side (default <out-dir>/rolefiller2_signals.jsonl)")
    ap.add_argument("--flips", default=None, help="flip_eligible.jsonl (default <out-dir>/flip_eligible.jsonl)")
    ap.add_argument("--corpora", default=os.path.join(HERE, os.pardir, "corpora"))
    ap.add_argument("--out-dir", default=os.path.join(HERE, "out_h"))
    ap.add_argument("--report", default=None, help="default <out-dir>/rolefillers2_compare.md")
    ap.add_argument("--key", default=None, help="tierA_slot_key.json: add the Tier A scorecard (item-E substrate)")
    args = ap.parse_args()
    args.exact_signals = args.exact_signals or os.path.join(args.out_dir, "rolefiller2_signals.jsonl")
    args.flips = args.flips or os.path.join(args.out_dir, "flip_eligible.jsonl")
    args.report = args.report or os.path.join(args.out_dir, "rolefillers2_compare.md")
    thresholds = [float(x) for x in args.cluster_cos.split(",")]
    modes = ("word", "subtree") if args.emb_mode == "both" else (args.emb_mode,)

    head_class = make_head_class(args.vocab)
    names, nouns = surface_names(args.canonical)
    occ = load(args.occ)
    emb, idx = load_matrix(args.emb_dir)
    n_texts = emb.shape[0]
    tree = cluster_tree(emb)

    # occurrence -> [(text, share)] per mode; wildcards keep their token (mass, weight 0)
    occ_units = {m: [] for m in modes}
    missing = collections.Counter()
    for r in occ:
        t = occ_texts(r, names, nouns)
        for m in modes:
            if t is None:
                occ_units[m].append([(r["filler"], 1.0)])
                continue
            units = t["word"] if m == "word" else [(t["subtree"][0], 1.0, t["subtree"][1])]
            out = []
            for text, share, _ in units:
                if text in idx:
                    out.append((text, share))
                else:
                    missing[text] += 1
                    out.append((r["filler"], share))
            occ_units[m].append(out)
    if missing:
        print(f"WARNING: {len(missing)} texts missing from the embedding cache (treated as wildcards): "
              f"{list(missing)[:8]}")

    tier_key = json.load(open(args.key)) if args.key else None
    scorecard = []
    corp = {}
    for p in glob.glob(os.path.join(args.corpora, "*.jsonl")):
        for r in load(p):
            corp[r["id"]] = " ".join(r["sentences"])
    exact = load(args.exact_signals) if os.path.exists(args.exact_signals) else []
    flips = load(args.flips) if os.path.exists(args.flips) else []
    text_freq = collections.Counter()
    for m in modes:
        for units in occ_units[m]:
            for text, share in units:
                text_freq[text] += share

    R = ["# §4.3.2 exact-label vs embedding clusters — the dial (H, 2026-09-03)\n",
         f"- embeddings: {args.emb_dir} ({n_texts} texts, dim {emb.shape[1]}); clustering = average linkage on cosine "
         f"distance, cut at cluster-cosine {thresholds} (1.0 = distinct texts = the exact-label method up to rendering)",
         f"- comparison: {args.weighting} weighting, >=2 shared informative units, cosine>={args.cos}, slot n>={args.min_n} "
         f"(identical to the exact-label run); occurrence texts per embeddings.py (modes {', '.join(modes)})",
         f"- exact-label baseline: {len(exact)} signals "
         f"({dict(collections.Counter(r['candidate']['subtype'] for r in exact))})\n"]
    summary_rows = []
    results = {}
    for m in modes:
        for thr in thresholds:
            cid = cut(tree, n_texts, thr)
            n_clusters = len(set(cid.tolist()))
            members = collections.defaultdict(list)
            for text, i in idx.items():
                members[int(cid[i])].append(text)
            for c in members:
                members[c].sort(key=lambda t: (-text_freq[t], t))
            unit_of = {text: f"c{int(cid[i])}" for text, i in idx.items()}

            slots = collections.defaultdict(collections.Counter)
            slot_examples = collections.defaultdict(lambda: collections.defaultdict(list))
            role_dist = collections.defaultdict(collections.Counter)   # (class, role) entity fillers
            for r, units in zip(occ, occ_units[m]):
                key = (r["center_kind"], r["center_class"], r["head"])
                for text, share in units:
                    u = unit_of.get(text, text)   # wildcard tokens stay themselves
                    slots[key][u] += share
                    ex = slot_examples[key][u]
                    if r["id"] not in ex and len(ex) < 6:
                        ex.append(r["id"])
                    if r["center_kind"] == "event" and r["filler_kind"] in ("entity", "constant") \
                            and r["head"] in ("Theme", "Patient"):
                        role_dist[(r["center_class"], r["head"])][u] += share

            def examples_for(key, prefer=(), avoid=()):
                exs = slot_examples[key]
                ids = [i for u in sorted(prefer) for i in exs.get(u, [])]
                ids += [i for u in sorted(exs) for i in exs[u]]
                ids = uniq(ids)
                return ([i for i in ids if i not in avoid] + [i for i in ids if i in avoid])[:2]

            ev_same_role, ev_same_event, ev_cross_both, ev_raw = compare_slots(
                slots, "event", True, head_class, args.weighting, args.min_n, args.cos, examples_for)
            en_same_role, en_same_center, en_cross_both, en_raw = compare_slots(
                slots, "entity", False, head_class, args.weighting, args.min_n, args.cos, examples_for)

            def render_unit(u):
                if u.startswith("c") and u[1:].isdigit():
                    ms = members[int(u[1:])]
                    return "{" + ", ".join(ms[:4]) + (", …" if len(ms) > 4 else "") + "}"
                return u

            tag = f"{m}_{thr:.2f}"
            sig_path = os.path.join(args.out_dir, f"rolefiller2_signals_embed_{tag}.jsonl")
            n_sig = 0
            sig_rows = []
            with open(sig_path, "w", encoding="utf-8") as fh:
                for sub, kind, rows in (("cross-event", "event", ev_same_role), ("cross-role", "event", ev_same_event),
                                        ("cross-both", "event", ev_cross_both),
                                        ("cross-entity-class", "entity", en_same_role), ("cross-head", "entity", en_same_center),
                                        ("cross-entity-both", "entity", en_cross_both)):
                    for r in rows:
                        r["shared_rendered"] = [render_unit(u) for u in r["shared_fillers"]]
                        sig_rows.append({"candidate": {"slot_a": r["slot_a"], "slot_b": r["slot_b"], "subtype": sub}})
                        fh.write(json.dumps({
                            "candidate": {"slot_a": r["slot_a"], "slot_b": r["slot_b"], "subtype": sub, "center_kind": kind},
                            "confidence": r["cosine"], "cosine_raw": r["cosine_raw"], "weighting": args.weighting,
                            "kind": "slot-merge", "support": min(r["n_a"], r["n_b"]),
                            "shared_clusters": r["shared_fillers"], "shared_rendered": r["shared_rendered"],
                            "examples_a": r["examples_a"], "examples_b": r["examples_b"],
                            "method": f"role-fillers2-4.3.2-embed/{m}@{thr}",
                        }, ensure_ascii=False, sort_keys=True) + "\n")
                        n_sig += 1
            with open(os.path.join(args.out_dir, f"rolefiller2_clusters_{tag}.jsonl"), "w", encoding="utf-8") as fh:
                for c in sorted(members, key=lambda c: (-len(members[c]), c)):
                    if len(members[c]) > 1:
                        fh.write(json.dumps({"cluster": f"c{c}", "size": len(members[c]), "members": members[c]},
                                            ensure_ascii=False) + "\n")
            if tier_key:
                scorecard.append((f"embed {m} @ {thr:.2f}", score_key(tier_key, sig_rows)))
            multi = sum(1 for c in members if len(members[c]) > 1)
            summary_rows.append((m, thr, n_clusters, multi, len(ev_same_role), len(ev_same_event), len(ev_cross_both),
                                 len(en_same_role) + len(en_same_center) + len(en_cross_both), ev_raw, en_raw))
            results[(m, thr)] = (ev_same_role, ev_same_event, ev_cross_both, role_dist, members)
            print(f"{tag}: {n_clusters} clusters ({multi} non-singleton)  signals {n_sig} "
                  f"(cross-event {len(ev_same_role)}, cross-role {len(ev_same_event)}, cross-both {len(ev_cross_both)}, "
                  f"entity {len(en_same_role) + len(en_same_center) + len(en_cross_both)})")

    if tier_key:
        R.append("## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)\n")
        R.append("- recall = expected lemma pairs (paraphrase variants: buy~purchase, buy~sell the converse, …) linked by ANY "
                 "signal; lexical control hits = antonym / near-miss pairs linked by a same-role or cross-both signal (must be 0); "
                 "swap-control hits = classes whose participant-swap control produced an Agent~object cross-role signal "
                 "(informational: the swapped sentence IS role wobble by design)\n")
        R.append("| method | recall | recovered / expected | lexical control hits | swap-control hits | missed |\n|---|---|---|---|---|---|")
        rows_sc = ([("exact label", score_key(tier_key, exact))] if exact else []) + scorecard
        for name, sc in rows_sc:
            R.append(f"| {name} | {sc['recall']} | {sc['recovered']} / {sc['expected']} | "
                     f"{', '.join(sc['control_lexical_hits']) or 'none'} | {len(sc['control_swap_hits'])} | "
                     f"{', '.join(sc['missed'])} |")
        R.append("")
    R.append("## Signals across the dial\n")
    R.append("| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw criterion (event / entity) |\n|---|---|---|---|---|---|---|---|")
    R.append(f"| exact label | — | — | {sum(1 for r in exact if r['candidate']['subtype'] == 'cross-event')} "
             f"| {sum(1 for r in exact if r['candidate']['subtype'] == 'cross-role')} "
             f"| {sum(1 for r in exact if r['candidate']['subtype'] == 'cross-both')} "
             f"| {sum(1 for r in exact if r['candidate']['subtype'].startswith('cross-entity') or r['candidate']['subtype'] == 'cross-head')} | — |")
    for m, thr, nc, multi, a, b, c, d, ev_raw, en_raw in summary_rows:
        R.append(f"| embed {m} | {thr:.2f} | {nc} ({multi}) | {a} | {b} | {c} | {d} | {'+'.join(map(str, ev_raw))} / {'+'.join(map(str, en_raw))} |")

    def sent(i):
        return corp.get(i, "")[:90]

    for m in modes:
        for thr in thresholds:
            ev_same_role, ev_same_event, ev_cross_both, role_dist, members = results[(m, thr)]
            R.append(f"\n## embed {m} @ cluster cos {thr:.2f}\n")
            R.append("### cross-event (same role, different event class)\n")
            R.append("| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |\n|---|---|---|---|---|---|")
            for r in ev_same_role[:15]:
                R.append(f"| {r['cosine']:.2f} ({r['cosine_raw']:.2f}) | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                         f"| {' '.join(r['shared_rendered'][:3])} | {sent(r['examples_a'][0]) if r['examples_a'] else ''} "
                         f"| {sent(r['examples_b'][0]) if r['examples_b'] else ''} |")
            R.append("\n### cross-role (same event class, different role)\n")
            R.append("| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |\n|---|---|---|---|---|---|")
            for r in ev_same_event[:15]:
                R.append(f"| {r['cosine']:.2f} ({r['cosine_raw']:.2f}) | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                         f"| {' '.join(r['shared_rendered'][:3])} | {sent(r['examples_a'][0]) if r['examples_a'] else ''} "
                         f"| {sent(r['examples_b'][0]) if r['examples_b'] else ''} |")
            R.append("\n### cross-both (different class AND role — converses)\n")
            R.append("| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |\n|---|---|---|---|---|---|")
            for r in ev_cross_both[:15]:
                R.append(f"| {r['cosine']:.2f} ({r['cosine_raw']:.2f}) | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                         f"| {' '.join(r['shared_rendered'][:3])} | {sent(r['examples_a'][0]) if r['examples_a'] else ''} "
                         f"| {sent(r['examples_b'][0]) if r['examples_b'] else ''} |")
            if flips:
                R.append("\n### #23 flip classes — Theme vs Patient in cluster space (entity fillers)\n")
                R.append("| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |\n|---|---|---|---|---|")
                for f in flips:
                    pa, pb = role_dist.get((f["event_class"], "Theme"), {}), role_dist.get((f["event_class"], "Patient"), {})
                    sh = [u for u in set(pa) & set(pb) if not is_wild(u)]
                    R.append(f"| {f['event_class']} | {f['theme_n']} / {f['patient_n']} | {cosine(pa, pb):.2f} | {jsd(pa, pb)} "
                             f"| {' '.join('{' + ', '.join(members[int(u[1:])][:3]) + '}' for u in sorted(sh)[:3])} |")
    open(args.report, "w", encoding="utf-8").write("\n".join(R) + "\n")
    print(f"-> {args.report}")


if __name__ == "__main__":
    main()
