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
from role_fillers2 import compare_slots, cosine, is_wild, jsd, make_head_class, mass, render_slot, uniq  # noqa: E402
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
    ap.add_argument("--gate", choices=("cosine", "jsd"), default=None,
                    help="indistinguishability gate: cosine >= --cos, or JSD <= --jsd-max on the raw distributions. "
                         "Default: jsd for the faithful arm (owner 2026-09-05), cosine for the augmented arm")
    ap.add_argument("--jsd-max", type=float, default=0.3)
    ap.add_argument("--jsd-sensitivity", type=float, default=0.4,
                    help="faithful: also count signals at this looser JSD (dial-table column only)")
    ap.add_argument("--vocab", default=os.path.join(HERE, os.pardir, "specs", "vocabulary.json"))
    ap.add_argument("--exact-signals", default=None, help="exact-label signals for the side-by-side (default <out-dir>/rolefiller2_signals.jsonl)")
    ap.add_argument("--flips", default=None, help="flip_eligible.jsonl (default <out-dir>/flip_eligible.jsonl)")
    ap.add_argument("--corpora", default=os.path.join(HERE, os.pardir, "corpora"))
    ap.add_argument("--out-dir", default=os.path.join(HERE, "out_h"))
    ap.add_argument("--report", default=None, help="default <out-dir>/rolefillers2_compare.md")
    ap.add_argument("--key", default=None, help="tierA_slot_key.json: add the Tier A scorecard (item-E substrate)")
    ap.add_argument("--arm", choices=("faithful", "augmented"), default="augmented",
                    help="faithful = paper §4.3.2 as written: EVERY event-center head is a slot, raw "
                         "cluster distributions over the embedded fillers only (no weighting, names "
                         "included), cosine + JSD, plus the pooled role-level view; augmented = the "
                         "role/oblique slot set with the chosen weighting (our additions)")
    ap.add_argument("--min-pooled", type=int, default=20, help="faithful: min fillers for a pooled head")
    ap.add_argument("--clusters-dir", default=None,
                    help="write clusters_cosine_<cut>.txt (all clusters incl. singletons, ';; cluster #k' "
                         "blocks); default <out-dir>/clusters; '' disables")
    ap.add_argument("--metta-out", default=None,
                    help="readable MeTTa RENDERING of the results (never loaded); default "
                         "<out-dir>/rolefillers2_<arm>.metta; '' disables")
    args = ap.parse_args()
    args.exact_signals = args.exact_signals or os.path.join(args.out_dir, "rolefiller2_signals.jsonl")
    args.flips = args.flips or os.path.join(args.out_dir, "flip_eligible.jsonl")
    faithful = args.arm == "faithful"
    if faithful:
        args.weighting = "raw"
    default_gate = "jsd" if faithful else "cosine"
    if args.gate is None:
        args.gate = default_gate
    gtag = "" if args.gate == default_gate else f"_{args.gate}"   # the arm's default gate keeps the plain names
    args.report = args.report or os.path.join(
        args.out_dir, f"rolefillers2_faithful{gtag}.md" if faithful else f"rolefillers2_compare{gtag}.md")
    sig_prefix = f"rolefiller2_signals_faithful{gtag}_" if faithful else f"rolefiller2_signals_embed{gtag}_"
    if args.metta_out is None:
        args.metta_out = os.path.join(args.out_dir, f"rolefillers2_{args.arm}{gtag}.metta")
    if args.clusters_dir is None:
        args.clusters_dir = os.path.join(args.out_dir, "clusters")
    clusters_written = set()
    thresholds = [float(x) for x in args.cluster_cos.split(",")]
    modes = ("word", "subtree") if args.emb_mode == "both" else (args.emb_mode,)

    head_class = make_head_class(args.vocab)
    if faithful:   # every head on an event center is a predicate-slot
        _hc = head_class

        CLASS_LINKS = ("Member", "Inheritance", "GroupOf", "Name")   # classify the event, not slots

        def head_class(kind, head):   # noqa: F811
            if kind != "event" or head in CLASS_LINKS:
                return None
            return _hc(kind, head) or "other"
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

    if faithful:
        R = ["# §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm (paper as written)\n",
             "> \"For every predicate-slot (e.g. go to.Agent or Agent2), we collect the set of fillers across the corpus "
             "and embed them in a vector space (using word or subtree embeddings). Clustering these embeddings reveals "
             "when two slots share indistinguishable distributions of fillers, indicating they fulfill the same semantic "
             "role and can be merged.\" — FUSE-NF §4.3.2\n",
             "## Implementation parameters (doc-open choices, disclosed)\n",
             "| parameter | choice |\n|---|---|",
             "| predicate-slot | every argument head attached to an event center in the canonical graph (closed-class "
             "roles, preposition-named obliques, and the other heads — temporal, resultative, discourse); the class "
             "links Member / Inheritance classify the event and are not slots; entity-center heads reported separately |",
             "| fillers | every argument of such a head, across the corpus; texts per `embeddings.py` (class labels, "
             "surface names, constant symbols); un-embeddable fillers (untyped skolems, numbers, strings, structured "
             "terms) excluded from the distribution |",
             f"| embeddings | {args.emb_dir}: Qwen3-Embedding-8B, bf16, normalized; word texts (one per class label, "
             "1/m mass for a multi-label filler) and subtree texts (the label bag / plural form / name as one text) |",
             f"| clustering | agglomerative, average linkage on cosine distance, one tree cut at cluster cosine "
             f"{thresholds} (1.0 = one cluster per distinct text) |",
             f"| slot distribution | raw mass over clusters, no weighting; a slot enters comparison at n >= {args.min_n} "
             "embedded fillers; a head enters the pooled view at n >= %d |" % args.min_pooled,
             "| 'indistinguishable' | similarity, not a homogeneity test (slot sizes are far too small for one): "
             + (f"cosine >= {args.cos}" if args.gate == "cosine" else f"Jensen-Shannon divergence <= {args.jsd_max} (0 = identical, 1 = disjoint)")
             + " with >= 2 shared clusters; the other statistic is reported beside it |",
             "| slot pairs compared | all pairs of the same center kind; shown by bucket for reading only: same role / "
             "different class, same class / different role, different class and role |\n",
             f"- exact-label baseline on the same substrate (augmented arm, for reference only): {len(exact)} signals\n"]
    else:
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
            pooled = collections.defaultdict(collections.Counter)      # head -> cluster mass (event centers)
            n_embedded = n_excluded = 0
            for r, units in zip(occ, occ_units[m]):
                key = (r["center_kind"], r["center_class"], r["head"])
                if faithful and r["head"] in ("Member", "Inheritance", "GroupOf", "Name"):
                    continue   # class links classify the center; they are not argument slots
                for text, share in units:
                    u = unit_of.get(text, text)   # wildcard tokens stay themselves
                    if faithful and is_wild(u):
                        n_excluded += 1
                        continue   # faithful: only embedded fillers form the distribution
                    n_embedded += 1
                    if head_class(r["center_kind"], r["head"]) is not None:   # argument slots only
                        pooled[r["head"]][u] += share
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
                slots, "event", True, head_class, args.weighting, args.min_n, args.cos, examples_for,
                gate=args.gate, jsd_max=args.jsd_max)
            en_same_role, en_same_center, en_cross_both, en_raw = compare_slots(
                slots, "entity", False, head_class, args.weighting, args.min_n, args.cos, examples_for,
                gate=args.gate, jsd_max=args.jsd_max)
            sens = None
            if faithful and args.gate == "jsd" and args.jsd_sensitivity:
                s1, s2, s3, _ = compare_slots(slots, "event", True, head_class, "raw", args.min_n, args.cos,
                                              examples_for, gate="jsd", jsd_max=args.jsd_sensitivity)
                sens = (len(s1), len(s2), len(s3))

            def render_unit(u):
                if u.startswith("c") and u[1:].isdigit():
                    ms = members[int(u[1:])]
                    return "{" + ", ".join(ms[:4]) + (", …" if len(ms) > 4 else "") + "}"
                return u

            tag = f"{m}_{thr:.2f}"
            sig_path = os.path.join(args.out_dir, f"{sig_prefix}{tag}.jsonl")
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
                            "jsd": r["jsd"],
                            "examples_a": r["examples_a"], "examples_b": r["examples_b"],
                            "method": f"role-fillers2-4.3.2-embed/{m}@{thr}",
                            "gate": args.gate, "variant": args.arm,
                            "additions": [] if faithful else [f"{args.weighting} weighting", "role/oblique slot set",
                                                              "wildcard units kept for the support floor"],
                        }, ensure_ascii=False, sort_keys=True) + "\n")
                        n_sig += 1
            if args.clusters_dir and thr not in clusters_written:   # the tree is mode-independent
                os.makedirs(args.clusters_dir, exist_ok=True)
                alpha = {c: sorted(members[c], key=lambda t: (t.lower(), t)) for c in members}
                order = sorted(alpha, key=lambda c: (-len(alpha[c]), alpha[c][0].lower(), alpha[c][0]))
                with open(os.path.join(args.clusters_dir, f"clusters_cosine_{thr:.2f}.txt"), "w", encoding="utf-8") as fh:
                    fh.write(f";; {len(order)} clusters of {n_texts} texts at cluster cosine {thr:.2f} — agglomerative, "
                             f"average linkage on cosine distance ({os.path.basename(args.emb_dir)}); clusters by "
                             "size, members alphabetical; singletons included\n\n")
                    for k, c in enumerate(order, 1):
                        fh.write(f";; cluster #{k}\n" + "\n".join(alpha[c]) + "\n\n")
                clusters_written.add(thr)
            with open(os.path.join(args.out_dir, f"rolefiller2_clusters_{tag}.jsonl"), "w", encoding="utf-8") as fh:
                for c in sorted(members, key=lambda c: (-len(members[c]), c)):
                    if len(members[c]) > 1:
                        fh.write(json.dumps({"cluster": f"c{c}", "size": len(members[c]), "members": members[c]},
                                            ensure_ascii=False) + "\n")
            if tier_key:
                scorecard.append((f"{args.arm} {m} @ {thr:.2f} ({'JSD<=%.2f' % args.jsd_max if args.gate == 'jsd' else 'cos>=%.2f' % args.cos})",
                                  score_key(tier_key, sig_rows)))
            multi = sum(1 for c in members if len(members[c]) > 1)
            summary_rows.append((m, thr, n_clusters, multi, len(ev_same_role), len(ev_same_event), len(ev_cross_both),
                                 len(en_same_role) + len(en_same_center) + len(en_cross_both), ev_raw, en_raw, sens))
            # pooled role-level view (faithful "Agent2 ~ Agent" reading): every head pair
            pooled_pairs = []
            heads = sorted(h for h in pooled if sum(pooled[h].values()) >= args.min_pooled)
            for i, a in enumerate(heads):
                for b in heads[i + 1:]:
                    pooled_pairs.append({"a": a, "b": b, "n_a": mass(sum(pooled[a].values())),
                                         "n_b": mass(sum(pooled[b].values())),
                                         "cosine": round(cosine(pooled[a], pooled[b]), 3),
                                         "jsd": jsd(pooled[a], pooled[b]),
                                         "shared": [render_unit(u) for u in sorted(
                                             set(pooled[a]) & set(pooled[b]),
                                             key=lambda u: (-(pooled[a][u] + pooled[b][u]), u))[:3]]})
            pooled_pairs.sort(key=lambda r: (-r["cosine"], r["a"], r["b"]))
            compared = {k: v for k, v in slots.items() if sum(v.values()) >= args.min_n
                        and (head_class(k[0], k[2]) is not None or k[0] == "entity")}
            with open(os.path.join(args.out_dir, f"rolefiller2_slotdist_{args.arm}_{tag}.jsonl"), "w",
                      encoding="utf-8") as fh:
                for k in sorted(compared):
                    v = compared[k]
                    fh.write(json.dumps({
                        "slot": f"{k[1]}.{k[2]}", "center_kind": k[0], "center_class": k[1], "head": k[2],
                        "n": mass(sum(v.values())),
                        "clusters": [{"unit": u, "mass": mass(c), "members": members[int(u[1:])][:6]}
                                     if u.startswith("c") and u[1:].isdigit() else {"unit": u, "mass": mass(c)}
                                     for u, c in sorted(v.items(), key=lambda kv: (-kv[1], kv[0]))],
                        "variant": args.arm, "mode": m, "cluster_cos": thr,
                    }, ensure_ascii=False) + "\n")
            results[(m, thr)] = (ev_same_role, ev_same_event, ev_cross_both, role_dist, members,
                                 pooled_pairs, n_embedded, n_excluded, len(slots), compared, slot_examples)
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
        rows_sc = ([("exact label (augmented arm, cos>=%.2f)" % args.cos, score_key(tier_key, exact))] if exact else []) + scorecard
        for name, sc in rows_sc:
            R.append(f"| {name} | {sc['recall']} | {sc['recovered']} / {sc['expected']} | "
                     f"{', '.join(sc['control_lexical_hits']) or 'none'} | {len(sc['control_swap_hits'])} | "
                     f"{', '.join(sc['missed'])} |")
        R.append("")
    gate_txt = 'cosine >= %.2f' % args.cos if args.gate == 'cosine' else 'JSD <= %.2f' % args.jsd_max
    R.append(f"## Signals across the dial (gate: {gate_txt})\n")
    sens_col = any(row[-1] for row in summary_rows)
    R.append("| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw cosine criterion (event / entity) |"
             + (f" JSD <= {args.jsd_sensitivity:.2f} (sensitivity; event) |" if sens_col else "") + "\n|---|---|---|---|---|---|---|---|" + ("---|" if sens_col else ""))
    R.append(f"| exact label (augmented arm, cosine gate) | — | — | {sum(1 for r in exact if r['candidate']['subtype'] == 'cross-event')} "
             f"| {sum(1 for r in exact if r['candidate']['subtype'] == 'cross-role')} "
             f"| {sum(1 for r in exact if r['candidate']['subtype'] == 'cross-both')} "
             f"| {sum(1 for r in exact if r['candidate']['subtype'].startswith('cross-entity') or r['candidate']['subtype'] == 'cross-head')} | — |" + (" — |" if sens_col else ""))
    for m, thr, nc, multi, a, b, c, d, ev_raw, en_raw, sens in summary_rows:
        R.append(f"| {args.arm} {m} | {thr:.2f} | {nc} ({multi}) | {a} | {b} | {c} | {d} | {'+'.join(map(str, ev_raw))} / {'+'.join(map(str, en_raw))} |"
                 + (f" {'+'.join(map(str, sens))} |" if sens_col else ""))

    def sent(i):
        return corp.get(i, "")[:90]

    for m in modes:
        for thr in thresholds:
            ev_same_role, ev_same_event, ev_cross_both, role_dist, members, pooled_pairs, n_embedded, n_excluded, n_slots, _, _ = results[(m, thr)]
            R.append(f"\n## {'faithful' if faithful else 'embed'} {m} @ cluster cos {thr:.2f}\n")
            if faithful:
                R.append(f"_(inventory: {n_slots} slots; {n_embedded} embedded filler units "
                         f"({'one per label' if m == 'word' else 'one per filler'}); "
                         f"{n_excluded} un-embeddable occurrences excluded: untyped / number / string / term)_\n")
                R.append("### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)\n")
                R.append("| cosine | JSD | head A (n) | head B (n) | shared clusters |\n|---|---|---|---|---|")
                for r in pooled_pairs[:20]:
                    R.append(f"| {r['cosine']:.2f} | {r['jsd']} | {r['a']} ({r['n_a']}) | {r['b']} ({r['n_b']}) | {' '.join(r['shared'])} |")
            R.append("### cross-event (same role, different event class)\n")
            R.append("| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |\n|---|---|---|---|---|---|---|")
            for r in ev_same_role[:15]:
                R.append(f"| {r['cosine']:.2f} ({r['cosine_raw']:.2f}) | {r['jsd']} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                         f"| {' '.join(r['shared_rendered'][:3])} | {sent(r['examples_a'][0]) if r['examples_a'] else ''} "
                         f"| {sent(r['examples_b'][0]) if r['examples_b'] else ''} |")
            R.append("\n### cross-role (same event class, different role)\n")
            R.append("| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |\n|---|---|---|---|---|---|---|")
            for r in ev_same_event[:15]:
                R.append(f"| {r['cosine']:.2f} ({r['cosine_raw']:.2f}) | {r['jsd']} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                         f"| {' '.join(r['shared_rendered'][:3])} | {sent(r['examples_a'][0]) if r['examples_a'] else ''} "
                         f"| {sent(r['examples_b'][0]) if r['examples_b'] else ''} |")
            R.append("\n### cross-both (different class AND role — converses)\n")
            R.append("| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |\n|---|---|---|---|---|---|---|")
            for r in ev_cross_both[:15]:
                R.append(f"| {r['cosine']:.2f} ({r['cosine_raw']:.2f}) | {r['jsd']} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                         f"| {' '.join(r['shared_rendered'][:3])} | {sent(r['examples_a'][0]) if r['examples_a'] else ''} "
                         f"| {sent(r['examples_b'][0]) if r['examples_b'] else ''} |")
            if flips and not faithful:
                R.append("\n### #23 flip classes — Theme vs Patient in cluster space (entity fillers)\n")
                R.append("| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |\n|---|---|---|---|---|")
                for f in flips:
                    pa, pb = role_dist.get((f["event_class"], "Theme"), {}), role_dist.get((f["event_class"], "Patient"), {})
                    sh = [u for u in set(pa) & set(pb) if not is_wild(u)]
                    R.append(f"| {f['event_class']} | {f['theme_n']} / {f['patient_n']} | {cosine(pa, pb):.2f} | {jsd(pa, pb)} "
                             f"| {' '.join('{' + ', '.join(members[int(u[1:])][:3]) + '}' for u in sorted(sh)[:3])} |")
    open(args.report, "w", encoding="utf-8").write("\n".join(R) + "\n")
    print(f"-> {args.report}")
    if args.metta_out:
        write_metta(args.metta_out, args, modes, thresholds, results, n_texts, emb.shape[1])


def write_metta(path, args, modes, thresholds, results, n_texts, dim):
    """Readable MeTTa RENDERING of the §4.3.2 clustering results (never loaded; the JSONL
    files are the record of truth). Per mode and cut: the pooled role-level pairs (two bare
    head queries under a cosine / JSD comment), the slot pairs (two slot queries under the
    signal comment), and every compared slot with its filler distribution over clusters as
    comments (cluster id, mass, member texts)."""
    faithful = args.arm == "faithful"

    def ren(u, members):
        if u.startswith("c") and u[1:].isdigit():
            ms = members[int(u[1:])]
            return "{" + ", ".join(ms[:4]) + (", …" if len(ms) > 4 else "") + "}"
        return u

    n_written = 0
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(f";; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — {args.arm.upper()} arm — readable MeTTa\n"
                 ";; RENDERING (never loaded: a slot is a conjunctive query over variables, not an assertion).\n"
                 f";; embeddings {args.emb_dir} ({n_texts} texts, dim {dim}); average-linkage clustering on cosine\n"
                 f";; distance cut at cluster cosine {thresholds}; texts {', '.join(modes)}; distributions = "
                 f"{'raw mass over clusters' if faithful else args.weighting + ' weighting'}.\n"
                 ";; A slot renders as (And (Member $e0 <class>) (<Head> $e0 $x1)) — $x1 stands for any filler; the\n"
                 ";; slot's distribution follows in comments: cluster id, mass, member texts. A pooled head renders\n"
                 ";; as (<Head> $e $x). A signal = two slot queries under a comment with cosine, JSD, shared clusters\n"
                 ";; and witness records. rolefiller2_slotdist_*.jsonl / rolefiller2_signals_*.jsonl are the record.\n")
        for m in modes:
            for thr in thresholds:
                (ev_same_role, ev_same_event, ev_cross_both, _, members, pooled_pairs, n_embedded, n_excluded,
                 n_slots, compared, _) = results[(m, thr)]
                tag = f"{m} @ cluster cos {thr:.2f}"
                fh.write(f"\n;; ==================== {tag}: pooled role level ({len(pooled_pairs)} head pairs) ====================\n")
                for r in pooled_pairs:
                    fh.write(f"\n;; {r['a']} ~ {r['b']}  cosine {r['cosine']:.2f}  JSD {r['jsd']}  n {r['n_a']} / {r['n_b']}"
                             f"  shared: {' '.join(r['shared'])}\n({r['a']} $e $x)\n({r['b']} $e $x)\n")
                n_sig = len(ev_same_role) + len(ev_same_event) + len(ev_cross_both)
                fh.write(f"\n;; ==================== {tag}: slot pairs ({n_sig} event-center signals) ====================\n")
                for sub, rows in (("same role, different class", ev_same_role),
                                  ("same class, different role", ev_same_event),
                                  ("different class and role", ev_cross_both)):
                    for r in rows:
                        fh.write(f"\n;; [{sub}]  {r['slot_a']} ~ {r['slot_b']}  cosine {r['cosine']:.2f}  JSD {r['jsd']}"
                                 f"  n {r['n_a']} / {r['n_b']}  shared: {' '.join(r['shared_rendered'][:4])}\n"
                                 f";;   A e.g. {' '.join(r['examples_a'])}   B e.g. {' '.join(r['examples_b'])}\n")
                        fh.write(render_slot("event", r["class_a"], r["role_a"]) + "\n")
                        fh.write(render_slot("event", r["class_b"], r["role_b"]) + "\n")
                fh.write(f"\n;; ==================== {tag}: compared slots with their distributions "
                         f"({len(compared)} slots, n >= {args.min_n}) ====================\n")
                for k in sorted(compared, key=lambda k: (-sum(compared[k].values()), k)):
                    v = compared[k]
                    fh.write(f"\n;; ---- slot {k[1]}.{k[2]}  [{k[0]} center]  n {mass(sum(v.values()))}  clusters {len(v)}\n")
                    fh.write(render_slot(k[0], k[1], k[2]) + "\n")
                    for u, c in sorted(v.items(), key=lambda kv: (-kv[1], kv[0])):
                        fh.write(f";;   {u:>7}  mass {mass(c)}  {ren(u, members)}\n")
                    n_written += 1
    print(f"-> {path}  ({n_written} slot renderings over {len(modes) * len(thresholds)} cuts)")


if __name__ == "__main__":
    main()
