"""FUSE-NF §4.3.3 — Mutual-Information Grouping: the FAITHFUL arm, and the NMI ADDITION (H, batch 2).

Paper §4.3.3 verbatim: "construct a binary feature matrix indicating which subtrees occur
in which sentences, then compute pairwise mutual information between features. Pairs
with very high MI but moderate individual support almost always co-occur, so they are
excellent candidates for consolidation into a single feature."

Applied over the faithful §4.3.1 units (``patterns2_faithful.jsonl``: rooted subtrees,
constants verbatim, support >= 3, size <= k — single-atom units included, they are
subtrees):

  * matrix    binary presence, records x units, straight from each unit's supporting ids
              (records carrying no unit are all-zero rows and count in N);
  * MI        exact pairwise mutual information of the two binary presence variables, in
              bits, for every pair — the paper's statistic, used RAW.

FAITHFUL gate (``--gate raw``, the default): MI >= --mi AND both supports <= the ceiling
--support-cap-frac x N — the paper's two clauses. Raw MI is bounded by the entropy of the
rarer feature, so it can only be "very high" for common features, and common features
reach it through loose association; the ceiling on individual support is the paper's way
of making a high MI value mean tight co-occurrence, and the low end excludes itself (a
rare pair can never score high). Both values are calibrated on the paper's own claim: the
adopted point is the largest-yield (ceiling, threshold) at which the typical passing pair
does "almost always co-occur" (median doc-Jaccard >= 0.8); the .md shows the full
ceiling x threshold table so the choice is auditable. The adopted threshold, 0.03 bits,
is the MI of a perfect co-occurrence over 7 records and ~3x the Bonferroni-significant
level for a million pairs (0.0093 bits); the adopted ceiling, 1% of the records, is the
97th percentile of unit support. Jaccard is reported as the paper's consequence, not gated.

ADDITION (``--gate nmi``, outputs ``mi_additions_nmi.*``): normalised MI = MI / max(H(A),
H(B)) in [0, 1] (1 = identical record sets) reads tightness directly, so the support
ceiling is dropped; gate NMI >= --nmi. It admits the rare perfect pairs raw MI cannot
reach (support-3 families) and the tight pairs just above the ceiling.

Containment is tagged, not gated: a sub-unit always co-occurs with its super-unit, so a
CONTAINED pair restates §4.3.1's subsumption; the paper's new information is in the
non-contained pairs — SAME-RECORDS (identical support sets: two different subtrees that
are one feature) and OVERLAPPING (very high MI short of identity). Same-records pairs are
rendered as FAMILIES (all units on one support set; every pair inside is a same-records
pair), labelled `paraphrase` when the family's distinct sentences (by corpus equiv_class
or text) number fewer than the unit floor of 3, or when at least half of its records
duplicate another one — near-duplicate sentences share every subtree, a corpus artefact;
`n_distinct_sentences` is the family's real support — or `distinct` otherwise (distinct
sentences that merely share the units). Grouping ACROSS support sets (batch 1's union-find) and conditional MI are
further additions, not implemented here.

Outputs (in --out-dir; stem ``mi_faithful`` for the raw gate, ``mi_additions_nmi`` for the
NMI gate): ``<stem>.jsonl`` (every pair at the recording floor with all statistics, bucket
and verdict; the unit id lists are the matrix's record of truth), ``<stem>_families.jsonl``
(one row per same-records family among the passes), ``<stem>.md`` (parameters, the
calibration table, families, top tables with one example sentence, near misses under and
over the ceiling), ``<stem>.metta`` (readable rendering, no decision dates: overlapping
passes as pair records, same-records families as family records, contained passes one
line each; near misses live in the .md and the JSONL). Deterministic; no randomness.

Usage:
  python mi_faithful.py [--units out_h/patterns2_faithful.jsonl] [--canonical canonical_substrate.jsonl]
      [--out-dir out_h] [--gate raw|nmi] [--mi 0.03] [--mi-sensitivity 0.02] [--mi-floor 0.01]
      [--support-cap-frac 0.01] [--nmi 0.8] [--nmi-sensitivity 0.7] [--nmi-floor 0.3]
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

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from patterns2_faithful import contains  # noqa: E402


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def entropy(p):
    p = np.clip(p, 1e-15, 1 - 1e-15)
    return -(p * np.log2(p) + (1 - p) * np.log2(1 - p))


def fmt(x, nd=3):
    return f"{x:.{nd}f}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--units", default=os.path.join(HERE, "out_h", "patterns2_faithful.jsonl"))
    ap.add_argument("--canonical", default=os.path.join(HERE, "canonical_substrate.jsonl"))
    ap.add_argument("--out-dir", default=None, help="default: the directory of --units")
    ap.add_argument("--corpora", default=os.path.join(HERE, os.pardir, "corpora"))
    ap.add_argument("--gate", choices=("raw", "nmi"), default="raw",
                    help="raw = the faithful gate (raw MI >= --mi AND both supports <= the ceiling); nmi = the addition "
                         "(normalised MI >= --nmi, no ceiling); outputs mi_faithful.* / mi_additions_nmi.*")
    ap.add_argument("--mi-anchor-records", type=int, default=7,
                    help="raw gate: the threshold is the MI of a perfect co-occurrence over this many records (H(k/N)); "
                         "the evidence-sufficiency anchor the paper leaves implicit")
    ap.add_argument("--mi", type=float, default=None, help="raw gate: override the threshold in bits")
    ap.add_argument("--mi-sensitivity-records", type=int, default=5, help="raw gate: the near-miss value, same anchoring")
    ap.add_argument("--mi-floor-records", type=int, default=3, help="raw gate: recording floor, same anchoring (3 = the unit floor)")
    ap.add_argument("--cap-percentile", type=float, default=97.0,
                    help="'moderate individual support': the ceiling is this percentile of unit support (units above it are "
                         "the common ones); --support-cap-frac overrides it as a fraction of the records")
    ap.add_argument("--mi-dial", default="0.10,0.05,0.04,0.03,0.02,0.015,0.01")
    ap.add_argument("--cap-dial", default="0.10,0.05,0.03,0.02,0.01")
    ap.add_argument("--support-cap-frac", type=float, default=None,
                    help="override: both units' support <= this fraction of the records (0 = off); the nmi gate uses no ceiling")
    ap.add_argument("--nmi", type=float, default=0.8, help="nmi gate: normalised MI at or above this passes")
    ap.add_argument("--nmi-sensitivity", type=float, default=0.7, help="nmi gate: looser value for the near misses")
    ap.add_argument("--nmi-floor", type=float, default=0.3, help="nmi gate: pairs below this are not recorded")
    ap.add_argument("--dial", default="0.5,0.6,0.7,0.8,0.9,1.0", help="nmi gate dial")
    ap.add_argument("--top", type=int, default=30)
    args = ap.parse_args()
    raw = args.gate == "raw"
    stem = "mi_faithful" if raw else "mi_additions_nmi"
    out_dir = args.out_dir or os.path.dirname(os.path.abspath(args.units))
    units = load(args.units)
    N = sum(1 for l in open(args.canonical, encoding="utf-8") if l.strip())
    dial = [float(x) for x in (args.mi_dial if raw else args.dial).split(",")]
    cap_dial = [float(x) for x in args.cap_dial.split(",")]
    stat_name = "MI" if raw else "NMI"
    corp, eqc = {}, {}
    for p in sorted(glob.glob(os.path.join(args.corpora, "*.jsonl"))):
        for r in load(p):
            corp[r["id"]] = " ".join(r.get("sentences", []))
            eqc[r["id"]] = r.get("equiv_class") or r["id"]

    # ---- matrix + pairwise statistics ----
    rec_ids = sorted({i for u in units for i in u["ids"]})
    ridx = {i: k for k, i in enumerate(rec_ids)}
    F = len(units)
    X = np.zeros((len(rec_ids), F), dtype=np.float64)
    for j, u in enumerate(units):
        for i in u["ids"]:
            X[ridx[i], j] = 1.0
    n = X.sum(0)
    if not raw:
        cap = N
        args.support_cap_frac = 0.0
    elif args.support_cap_frac is not None:
        cap = int(math.floor(args.support_cap_frac * N)) if args.support_cap_frac > 0 else N
    else:
        cap = int(math.floor(np.percentile(n, args.cap_percentile)))
        args.support_cap_frac = cap / N
    def h_records(k):
        return float(entropy(np.array(k / N)))
    if raw:
        gate_val = args.mi if args.mi is not None else round(h_records(args.mi_anchor_records), 4)
        sens_val = round(h_records(args.mi_sensitivity_records), 4)
        floor_val = round(h_records(args.mi_floor_records), 4)
    else:
        gate_val, sens_val, floor_val = args.nmi, args.nmi_sensitivity, args.nmi_floor
    both = X.T @ X
    p = n / N
    p11 = both / N
    p10 = p[:, None] - p11
    p01 = p[None, :] - p11
    p00 = 1.0 - p11 - p10 - p01

    def term(a, b):
        with np.errstate(divide="ignore", invalid="ignore"):
            return np.where(a > 0, a * np.log2(np.where(a > 0, a, 1) / np.where(b > 0, b, 1)), 0.0)

    MI = (term(p11, p[:, None] * p[None, :]) + term(p10, p[:, None] * (1 - p)[None, :])
          + term(p01, (1 - p)[:, None] * p[None, :]) + term(p00, (1 - p)[:, None] * (1 - p)[None, :]))
    h = entropy(p)
    NMI = MI / np.maximum(h[:, None], h[None, :])
    union = n[:, None] + n[None, :] - both
    JAC = np.where(union > 0, both / np.where(union > 0, union, 1), 0.0)
    ia, ib = np.triu_indices(F, 1)
    n_pairs = len(ia)
    n_cooc = int((both[ia, ib] > 0).sum())

    STAT = MI if raw else NMI
    keep = np.where(STAT[ia, ib] >= floor_val - 1e-12)[0]
    rows = []
    for t in keep:
        a, b = int(ia[t]), int(ib[t])
        ua, ub = units[a], units[b]
        if ua["support"] < ub["support"] or (ua["support"] == ub["support"] and ua["pattern_id"] > ub["pattern_id"]):
            a, b, ua, ub = b, a, ub, ua      # A = the larger-support unit
        same = int(both[a, b]) == int(n[a]) == int(n[b])
        a_in_b = contains(ub["atoms"], ua["atoms"])
        b_in_a = contains(ua["atoms"], ub["atoms"])
        bucket = "contained" if (a_in_b or b_in_a) else ("same records" if same else "overlapping")
        nmi = float(NMI[a, b])
        stat = float(STAT[a, b])
        moderate = n[a] <= cap and n[b] <= cap
        rows.append({
            "a": ua["pattern_id"], "b": ub["pattern_id"], "query_a": ua["query"], "query_b": ub["query"],
            "size_a": ua["size"], "size_b": ub["size"],
            "n_a": int(n[a]), "n_b": int(n[b]), "n_both": int(both[a, b]),
            "mi_bits": round(float(MI[a, b]), 6), "nmi": round(nmi, 4), "jaccard": round(float(JAC[a, b]), 4),
            "bucket": bucket, "moderate_support": bool(moderate), "gate": args.gate,
            "pass": bool(stat >= gate_val - 1e-12 and moderate),
            "sensitivity_pass": bool(stat >= sens_val - 1e-12 and moderate),
            "over_ceiling": bool(stat >= gate_val - 1e-12 and not moderate),
            "examples": sorted(set(ua["ids"]) & set(ub["ids"]))[:3],
            "variant": "faithful",
        })
    rows.sort(key=lambda r: ((-r["mi_bits"], -r["jaccard"]) if raw else (-r["nmi"], -r["mi_bits"])) + (r["a"], r["b"]))
    p_jsonl = os.path.join(out_dir, f"{stem}.jsonl")
    with open(p_jsonl, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    # ---- dial table ----
    stat_all = STAT[ia, ib]
    jac_all = JAC[ia, ib]
    dial_rows = []
    for cut in dial:
        selm = [r for r in rows if r["moderate_support"] and (r["mi_bits"] if raw else r["nmi"]) >= cut - 1e-12]
        c = collections.Counter(r["bucket"] for r in selm)
        mod_all = (n[ia] <= cap) & (n[ib] <= cap)
        dial_rows.append((cut, int((stat_all >= cut - 1e-12).sum()), int(((stat_all >= cut - 1e-12) & mod_all).sum()),
                          c["contained"], c["same records"], c["overlapping"]))
    calib = []      # raw gate: ceiling x threshold -> passes, not contained, median Jaccard, share >= 0.8
    if raw:
        cont_cache = {(r["a"], r["b"]): r["bucket"] == "contained" for r in rows}
        for cf in cap_dial:
            c_ = int(math.floor(cf * N))
            sel_c = (n[ia] <= c_) & (n[ib] <= c_)
            line = []
            for cut in dial:
                s_ = np.where(sel_c & (stat_all >= cut - 1e-12))[0]
                if len(s_) == 0:
                    line.append((cut, 0, 0, 0.0, 0.0))
                    continue
                nc = sum(1 for t in s_ if not cont_cache.get((units[max(ia[t], ib[t], key=lambda k: (n[k], -k))]["pattern_id"],
                                                                 units[min(ia[t], ib[t], key=lambda k: (n[k], -k))]["pattern_id"]), False))
                line.append((cut, int(len(s_)), nc, float(np.median(jac_all[s_])), float((jac_all[s_] >= 0.8).mean())))
            calib.append((cf, c_, line))
    passes = [r for r in rows if r["pass"]]
    new_pass = [r for r in passes if r["bucket"] != "contained"]
    over = [r for r in new_pass if r["bucket"] == "overlapping"]
    near = [r for r in rows if r["sensitivity_pass"] and not r["pass"] and r["bucket"] != "contained"]
    above = [r for r in rows if r["over_ceiling"] and r["bucket"] != "contained"]
    uid = {u["pattern_id"]: u for u in units}
    fam = collections.defaultdict(set)
    for r in new_pass:
        if r["bucket"] == "same records":
            fam[tuple(sorted(uid[r["a"]]["ids"]))].update((r["a"], r["b"]))
    families = []
    for recs, members in fam.items():
        texts = [corp.get(i, "") for i in recs]
        n_distinct = min(len({eqc.get(i, i) for i in recs}), len(set(texts)))   # distinct sentences behind the records
        paraphrase = n_distinct < 3 or 2 * n_distinct <= len(recs)   # real support below the unit floor, or mostly duplicates
        members = sorted(members, key=lambda pid: (-uid[pid]["size"], pid))
        families.append({"records": list(recs), "n_records": len(recs), "n_distinct_sentences": n_distinct,
                         "kind": "paraphrase" if paraphrase else "distinct",
                         "members": members, "n_members": len(members),
                         "n_pairs": sum(1 for r in new_pass if r["bucket"] == "same records" and tuple(sorted(uid[r["a"]]["ids"])) == recs),
                         "queries": [uid[m]["query"] for m in members], "variant": "faithful"})
    families.sort(key=lambda f: (-f["n_members"], f["records"]))
    p_fam = os.path.join(out_dir, f"{stem}_families.jsonl")
    with open(p_fam, "w", encoding="utf-8") as fh:
        for f in families:
            fh.write(json.dumps(f, ensure_ascii=False, sort_keys=True) + "\n")
    n_par = sum(1 for f in families if f["kind"] == "paraphrase")

    params = [
        ("features", f"the {F} faithful §4.3.1 units of {os.path.basename(args.units)} (rooted subtrees, constants verbatim, "
                     "support >= 3, single-atom units included: they are subtrees)"),
        ("matrix", f"binary presence, {N} records x {F} units, from each unit's supporting ids "
                   f"({N - len(rec_ids)} records carry no unit and are all-zero rows); {n_pairs} pairs, {n_cooc} with any co-occurrence"),
        ("MI", "exact pairwise mutual information of the two binary presence variables, in bits"),
        ("'very high MI'", (f"raw MI >= {gate_val} bits = the MI of a perfect co-occurrence over {args.mi_anchor_records} of the {N} records "
                            f"(the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for {n_pairs} "
                            f"pairs is ~{math.log(n_pairs / 0.05) / (2 * N * math.log(2)):.4f} bits); near-miss value {sens_val} "
                            f"(= {args.mi_sensitivity_records} records); pairs recorded from {floor_val} (= {args.mi_floor_records} records); "
                            f"dial {dial}") if raw else
                           (f"ADDITION: normalised MI = MI / max(H(A), H(B)) in [0, 1] (1 = identical record sets); gate NMI >= {args.nmi}; "
                            f"sensitivity value {args.nmi_sensitivity}; pairs recorded from {args.nmi_floor}; dial {dial}")),
        ("'moderate individual support'", (f"both units' support <= {cap} records = the {args.cap_percentile:g}th percentile of unit support "
                                           f"({args.support_cap_frac:.1%} of the records; percentiles 50/90/95/99 = "
                                           f"{'/'.join(str(int(x)) for x in np.percentile(n, [50, 90, 95, 99]))}); "
                                           "the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low "
                                           "end excludes itself" if raw and args.support_cap_frac > 0 else
                                           "no ceiling: the normalisation reads tightness directly; the floor of 3 inherited from the units is "
                                           "the only support condition")),
        ("calibration", ("the ceiling x threshold table below checks the paper's claim (median doc-Jaccard of the passes); the claim "
                         "alone would also accept a lower threshold where perfectly co-occurring support-3..5 pairs (paraphrase "
                         "families) dominate — the record-count anchor on the threshold is what keeps them out" if raw else
                         "NMI is our reading of 'very high' (support-free); it belongs to the additions arm")),
        ("'almost always co-occur'", "the paper's consequence, shown as the doc-Jaccard column (not gated)"),
        ("containment", "tagged, not gated: a CONTAINED pair (one unit's atoms embed in the other's under a variable renaming) "
                        "restates §4.3.1 subsumption; SAME RECORDS = identical support sets, not contained; OVERLAPPING = the rest"),
        ("families", "same-records passes rendered per support set (every pair inside has NMI 1); `paraphrase` when the distinct "
                     "sentences (by corpus equiv_class or text) are fewer than the unit floor of 3 or at least half the records duplicate "
                     "another (near-duplicates share every subtree), `distinct` otherwise; n_distinct_sentences = the family's real support"),
        ("consolidation", "a passing non-contained pair is a proposal to treat the two subtrees as one feature (their conjunction); "
                          "grouping across support sets and conditional MI are additions"),
    ]

    def sent(i):
        return corp.get(i, "")[:100]

    L = [("# §4.3.3 Mutual-Information Grouping — FAITHFUL arm (paper as written)\n" if raw else
          "# §4.3.3 Mutual-Information Grouping — ADDITION: normalised-MI gate\n"),
         "> \"We could construct a binary feature matrix indicating which subtrees occur in which sentences, then compute "
         "pairwise mutual information between features. Pairs with very high MI but moderate individual support almost "
         "always co-occur, so they are excellent candidates for consolidation into a single feature.\" — FUSE-NF §4.3.3\n",
         "## Implementation parameters (choices the paper leaves open; disclosed)\n", "| parameter | choice |\n|---|---|"]
    L += [f"| {a} | {b} |" for a, b in params]
    if raw:
        L += ["", "## Calibration: ceiling x threshold (cell = passes / not contained / median Jaccard / share with Jaccard >= 0.8)\n",
              "| ceiling | " + " | ".join(f"MI >= {cut}" for cut in dial) + " |", "|---|" + "---|" * len(dial)]
        for cf, c_, line in calib:
            L.append(f"| {cf:.0%} ({c_}) | " + " | ".join(f"{k} / {nc} / {mj:.2f} / {sh:.0%}" if k else "0" for cut, k, nc, mj, sh in line) + " |")
    L += ["", f"## The dial at the adopted ceiling ({args.support_cap_frac:.0%} = {cap} records)\n" if raw and args.support_cap_frac > 0 else "## The dial\n",
          f"| {stat_name} >= | all pairs | within the ceiling | contained | same records | overlapping |\n|---|---|---|---|---|---|"]
    L += [f"| {cut} | {tot} | {mod} | {c} | {s} | {o} |" for cut, tot, mod, c, s, o in dial_rows]
    L += ["", f"- at the gate ({stat_name} >= {gate_val}{f', both supports <= {cap}' if args.support_cap_frac > 0 else ''}): **{len(passes)} pairs pass**, {len(new_pass)} of them not contained "
          f"({sum(1 for r in new_pass if r['bucket'] == 'same records')} same records = **{len(families)} families** "
          f"({n_par} paraphrase, {len(families) - n_par} distinct), **{len(over)} overlapping**); {len(near)} non-contained near misses at "
          f"{stat_name} >= {sens_val} under the ceiling; {len(above)} non-contained pairs at or above the gate but OVER the ceiling", ""]
    L.append("## Same-records families (all units on one support set; kind = paraphrase | distinct)\n")
    L.append("| units | pairs | records (distinct sentences) | kind | e.g. | members (first 3) |\n|---|---|---|---|---|---|")
    for f in families[:args.top]:
        L.append(f"| {f['n_members']} | {f['n_pairs']} | {f['n_records']} ({f['n_distinct_sentences']} distinct; {', '.join(f['records'][:3])}{'…' if f['n_records'] > 3 else ''}) | {f['kind']} "
                 f"| {sent(f['records'][0])} | {' • '.join('`' + q + '`' for q in f['queries'][:3])} |")
    L.append("")

    def table(title, seq, k):
        L.append(f"## {title}\n")
        L.append(f"| {'MI bits' if raw else 'NMI'} | Jaccard | n A / B / both | bucket | A | B | e.g. |\n|---|---|---|---|---|---|---|")
        for r in seq[:k]:
            L.append(f"| {r['mi_bits']:.4f} | " if raw else f"| {r['nmi']:.2f} | ")
            L[-1] += (f"{r['jaccard']:.2f} | {r['n_a']} / {r['n_b']} / {r['n_both']} | {r['bucket']} "
                     f"| `{r['query_a']}` | `{r['query_b']}` | {r['examples'][0] if r['examples'] else ''}: "
                     f"{sent(r['examples'][0]) if r['examples'] else ''} |")
        L.append("")

    table(f"Overlapping passes — two subtrees short of identical records that are one feature (by {stat_name})", over, args.top)
    table(f"Non-contained near misses under the ceiling ({stat_name} >= {sens_val}, below the gate)", near, min(args.top, 15))
    if args.support_cap_frac > 0:
        table(f"Non-contained pairs at or above the gate but OVER the ceiling (support > {cap}; the paper's clause excludes them)",
              sorted(above, key=lambda r: (-r["mi_bits"], r["a"], r["b"])), min(args.top, 15))
    table("Highest raw MI overall (the generic features: high raw MI, loose association)",
          sorted(rows, key=lambda r: (-r["mi_bits"], r["a"], r["b"])), 10)
    p_md = os.path.join(out_dir, f"{stem}.md")
    open(p_md, "w", encoding="utf-8").write("\n".join(L) + "\n")

    # ---- metta ----
    p_metta = os.path.join(out_dir, f"{stem}.metta")
    with open(p_metta, "w", encoding="utf-8") as fh:
        fh.write((";; FUSE-NF §4.3.3 Mutual-Information Grouping — FAITHFUL arm — readable MeTTa RENDERING\n" if raw else
                  ";; FUSE-NF §4.3.3 Mutual-Information Grouping — ADDITION (normalised-MI gate) — readable MeTTa RENDERING\n")
                 + ";; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is\n"
                 f";;   {stem}.jsonl          (every pair at the recording floor, with its statistics, bucket and verdict)\n"
                 ";;   patterns2_faithful.jsonl   (the units and their supporting records = the binary matrix)\n;;\n"
                 ";; PARAMETERS (choices the paper leaves open; disclosed)\n")
        for a, b in params:
            fh.write(f";;   {a:<30s} {b}\n")
        fh.write(";;\n;; RECORD FORMATS\n"
                 ";;   pair record (OVERLAPPING PASSES): two units that are one feature, short of identical records\n"
                 ";;     ;; [overlapping]  A ~ B   n <records of A> / <of B> / <both>   gate: PASS\n")
        fh.write(";;     ;;   MI: <bits>   Jaccard: <both / either>   e.g. <shared record ids>\n" if raw else
                 ";;     ;;   NMI: <MI / max entropy>   MI: <bits>   Jaccard: <both / either>   e.g. <shared record ids>\n")
        fh.write(";;     <query A>\n;;     <query B>\n"
                 ";;   family record (SAME-RECORDS FAMILIES): every unit on one support set; each pair inside has NMI 1\n"
                 ";;     ;; [family: paraphrase|distinct]  <m> units, <p> pairs, on <n> records (<d> distinct sentences): <ids>   gate: PASS\n"
                 ";;     <query of each member, one per line>\n"
                 f";; A is the unit with the larger support. Sections sorted by {stat_name} desc (pairs) and by size (families);\n"
                 ";; CONTAINED PASSES restate §4.3.1 subsumption and take one line each; near misses are in the .md and the JSONL.\n")
        fh.write(f"\n;; ==================== OVERLAPPING PASSES: {len(over)} pairs ====================\n")
        for r in over:
            stats = (f";;   MI: {r['mi_bits']:.4f}   Jaccard: {r['jaccard']:.2f}" if raw else
                     f";;   NMI: {r['nmi']:.3f}   MI: {r['mi_bits']:.4f}   Jaccard: {r['jaccard']:.2f}")
            fh.write(f"\n;; [{r['bucket']}]  {r['a']} ~ {r['b']}   n {r['n_a']} / {r['n_b']} / {r['n_both']}   gate: PASS\n"
                     f"{stats}   e.g. {' '.join(r['examples'])}\n{r['query_a']}\n{r['query_b']}\n")
        fh.write(f"\n;; ==================== SAME-RECORDS FAMILIES: {len(families)} families ({n_par} paraphrase, "
                 f"{len(families) - n_par} distinct) = {sum(f['n_pairs'] for f in families)} pairs ====================\n")
        for f in families:
            fh.write(f"\n;; [family: {f['kind']}]  {f['n_members']} units, {f['n_pairs']} pairs, on {f['n_records']} records "
                     f"({f['n_distinct_sentences']} distinct sentences): {' '.join(f['records'])}   gate: PASS\n" + "\n".join(f["queries"]) + "\n")
        cont = [r for r in passes if r["bucket"] == "contained"]
        fh.write(f"\n;; ==================== CONTAINED PASSES: {len(cont)} pairs (§4.3.1 subsumption restated; one line each) ====================\n")
        for r in cont:
            fh.write(f";; {r['a']} ⊇ {r['b']}   n {r['n_a']} / {r['n_b']} / {r['n_both']}   {stat_name} {r['mi_bits'] if raw else r['nmi']:.3f}   {r['query_a']}   ⊇   {r['query_b']}\n")
    print(f"{os.path.basename(args.units)} [{args.gate}]: {F} units x {N} records -> {n_pairs} pairs ({n_cooc} co-occurring); recorded {len(rows)} "
          f"at {stat_name} >= {floor_val}; gate {stat_name} >= {gate_val}{' + support <= %d' % cap if args.support_cap_frac > 0 else ''}: {len(passes)} pass, {len(new_pass)} not contained "
          f"({sum(1 for r in new_pass if r['bucket'] == 'same records')} same records, {sum(1 for r in new_pass if r['bucket'] == 'overlapping')} overlapping), "
          f"{len(near)} near misses under the ceiling, {len(above)} over the ceiling")
    print(f"   same-records families: {len(families)} ({n_par} paraphrase, {len(families) - n_par} distinct)")
    print(f"-> {p_jsonl}\n-> {p_fam}\n-> {p_md}\n-> {p_metta}")


if __name__ == "__main__":
    main()
