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

FAITHFUL gate (``--gate raw``, the default): MI >= threshold AND both supports <= ceiling —
the paper's two clauses. Raw MI is bounded by the entropy of the rarer feature, so it can
only be "very high" for common features, and common features reach it through loose
association; the ceiling on individual support is the paper's way of making a high MI
value mean tight co-occurrence, and the low end excludes itself (a rare pair can never
score high). Both values are anchored in corpus-relative terms: the threshold is the MI
of a perfect co-occurrence over ``--mi-anchor-records`` records (H(k/N); 7 by default,
the evidence-sufficiency judgement the paper leaves implicit), the ceiling is the
``--cap-percentile`` of unit support (97 by default: "moderate" = not among the most
common units). The .md carries a ceiling x threshold table with the median doc-Jaccard of
the passes, so the paper's claim can be checked; Jaccard is reported, never gated.

ADDITION (``--gate nmi``, outputs ``mi_additions_nmi.*``): normalised MI = MI / max(H(A),
H(B)) in [0, 1] (1 = identical record sets) reads tightness directly, so no ceiling is
applied; gate NMI >= --nmi. It admits the rare perfect pairs raw MI cannot reach and the
tight pairs just above the ceiling.

"Consolidation into a single feature" is rendered for every passing pair as the pack rule
it would become: the two units' variables are ALIGNED through the records they share
(each unit is matched in each shared record with the miner's own abstraction of record
atoms; the variable correspondence that holds in most shared records is taken, and the
record says in how many), the aligned conjunction is the merged feature, and the rule is
``(Implication (And <merged atoms>) (Mn<Name> <vars>))`` — naming provisional, the pack
vocabulary is fixed when candidates are built; a unit that is part of the other yields
the larger unit's own pack; units that never share a skolem in the shared records give a
co-occurrence conjunction with disjoint variables.

Per pair the JSONL also records ``contained`` (one unit's atoms embed in the other's under
a variable renaming — the pair restates §4.3.1 subsumption) and ``n_distinct_shared`` (how
many distinct sentences, by corpus equiv_class or text, stand behind the shared records:
near-duplicate records share every subtree, a corpus artefact). Grouping across pairs
(batch 1's union-find) and conditional MI are further additions, not implemented here.

Outputs (in --out-dir; stem ``mi_faithful`` for the raw gate, ``mi_additions_nmi`` for the
NMI gate): ``<stem>.jsonl`` (every pair at the recording floor with all statistics,
verdict, alignment and rule), ``<stem>.md`` (parameters, calibration table, dial, passes,
near misses under and over the ceiling), ``<stem>.metta`` (readable rendering, no decision
dates: every pass as one uniform record ending in its Implication). Deterministic.

Usage:
  python mi_faithful.py [--units out_h/patterns2_faithful.jsonl] [--canonical canonical_substrate.jsonl]
      [--out-dir out_h] [--gate raw|nmi] [--mi-anchor-records 7] [--cap-percentile 97] [--nmi 0.8]
"""
from __future__ import annotations

import argparse
import collections
import glob
import json
import math
import os
import re
import sys

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from frequent_patterns2 import RE_NUM, RE_SKOLEM, RE_STR  # noqa: E402
from patterns2_faithful import camel, contains, meta_name, parse_atom, tree_info, variables  # noqa: E402

RE_VAR = re.compile(r"\$[exf]\d+")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def entropy(p):
    p = np.clip(p, 1e-15, 1 - 1e-15)
    return -(p * np.log2(p) + (1 - p) * np.log2(1 - p))


# ---------------------------------------------------------------- matching in records
def abstract_record(rec):
    """A record's flat top-level atoms in the miner's abstraction: skolems e0/x0/f0 -> $e0/$x0/$f0
    (the record's own numbering), strings -> <str>, numbers -> <num>, ' ~NEG' when strength < 0.5."""
    out = []
    for a in rec["atoms"]:
        term = a["term"].strip()
        if term.count("(") != 1:          # nested / wrapped terms never match a unit
            continue
        t = RE_SKOLEM.sub(lambda m: f"${m.group(1)}{m.group(2)}", term)
        t = RE_STR.sub("<str>", t)
        t = RE_NUM.sub("<num>", t)
        if a["stv"][0] < 0.5:
            t += " ~NEG"
        out.append(parse_atom(t))
    return out


def match(unit_atoms, rec_atoms):
    """All bindings {unit var -> record token} under which every unit atom is a distinct record
    atom (heads, constants and the ~NEG marker equal; variables injective)."""
    U = [parse_atom(a) for a in unit_atoms]
    results = []

    def go(i, bind, used):
        if i == len(U):
            results.append(dict(bind))
            return
        h, args, neg = U[i]
        for j, (rh, rargs, rneg) in enumerate(rec_atoms):
            if j in used or rh != h or rneg != neg or len(rargs) != len(args):
                continue
            b = dict(bind)
            ok = True
            for ua, ra in zip(args, rargs):
                if ua.startswith("$"):
                    if ua in b:
                        if b[ua] != ra:
                            ok = False
                            break
                    elif ra in b.values() or ua[1] != ra[1:2]:   # injective; same stream ($e -> $e…)
                        ok = False
                        break
                    else:
                        b[ua] = ra
                elif ua != ra:
                    ok = False
                    break
            if ok:
                go(i + 1, b, used | {j})

    go(0, {}, frozenset())
    uniq = []
    for r in results:
        if r not in uniq:
            uniq.append(r)
    return uniq


def align(ua, ub, shared_recs):
    """The variable correspondence A-var -> B-var that holds in most shared records.
    Returns (mapping, holds_in, total)."""
    votes = collections.Counter()
    for rec in shared_recs:
        atoms = abstract_record(rec)
        found = set()
        for ba in match(ua["atoms"], atoms):
            for bb in match(ub["atoms"], atoms):
                corr = tuple(sorted((va, vb) for va, ta in ba.items() for vb, tb in bb.items()
                                    if ta == tb and ta.startswith("$")))
                found.add(corr)
        for corr in found:
            votes[corr] += 1
    if not votes:
        return {}, 0, len(shared_recs)
    best, cnt = max(votes.items(), key=lambda kv: (kv[1], len(kv[0]), kv[0]))
    return dict(best), cnt, len(shared_recs)


def merge(ua, ub, mapping):
    """A's atoms plus B's atoms with B's variables renamed into A's namespace (aligned ones by
    the mapping, the rest fresh); returns the sorted, de-duplicated atom list."""
    ren = {vb: va for va, vb in mapping.items()}
    used = collections.defaultdict(set)
    for v in variables(ua["atoms"]) + list(ren.values()):
        used[v[1]].add(int(v[2:]))
    for v in variables(ub["atoms"]):
        if v not in ren:
            k = 0
            while k in used[v[1]]:
                k += 1
            used[v[1]].add(k)
            ren[v] = f"${v[1]}{k}"
    atoms = set(ua["atoms"])
    for a in ub["atoms"]:
        atoms.add(RE_VAR.sub(lambda m: ren[m.group(0)], a))
    return sorted(atoms)


def flat_name(atoms):
    parts = []
    for a in atoms:
        head, args, neg = parse_atom(a)
        consts = [t for t in args if not t.startswith("$")]
        tok = ("" if head == "Member" and consts else head) + "".join(camel(c) for c in consts)
        tok += "".join("Ev" if t.startswith("$e") else "Fn" for t in args[1:] if t.startswith(("$e", "$f")))
        parts.append(tok + ("Neg" if neg else ""))
    return "Mn" + "_".join(parts)


def rule_for(atoms):
    """(name, vars) for the merged feature: tree naming when it is a rooted tree, flat otherwise."""
    t = tree_info(atoms)
    if t:
        root = t[0]
        return meta_name(atoms), [root] + sorted(v for v in variables(atoms) if v != root)
    return flat_name(atoms), sorted(variables(atoms))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--units", default=os.path.join(HERE, "out_h", "patterns2_faithful.jsonl"))
    ap.add_argument("--canonical", default=os.path.join(HERE, "canonical_substrate.jsonl"))
    ap.add_argument("--out-dir", default=None, help="default: the directory of --units")
    ap.add_argument("--corpora", default=os.path.join(HERE, os.pardir, "corpora"))
    ap.add_argument("--gate", choices=("raw", "nmi"), default="raw",
                    help="raw = the faithful gate (raw MI >= threshold AND both supports <= ceiling); nmi = the addition")
    ap.add_argument("--mi-anchor-records", type=int, default=7,
                    help="raw gate: the threshold is the MI of a perfect co-occurrence over this many records (H(k/N))")
    ap.add_argument("--mi", type=float, default=None, help="raw gate: override the threshold in bits")
    ap.add_argument("--mi-sensitivity-records", type=int, default=5, help="raw gate: the near-miss value, same anchoring")
    ap.add_argument("--mi-floor-records", type=int, default=3, help="raw gate: recording floor, same anchoring")
    ap.add_argument("--mi-dial", default="0.10,0.05,0.04,0.03,0.02,0.015,0.01")
    ap.add_argument("--cap-dial", default="0.10,0.05,0.03,0.02,0.01")
    ap.add_argument("--cap-percentile", type=float, default=97.0,
                    help="'moderate individual support': ceiling = this percentile of unit support")
    ap.add_argument("--support-cap-frac", type=float, default=None,
                    help="override: ceiling as a fraction of the records (0 = off); the nmi gate uses no ceiling")
    ap.add_argument("--nmi", type=float, default=0.8, help="nmi gate: normalised MI at or above this passes")
    ap.add_argument("--nmi-sensitivity", type=float, default=0.7)
    ap.add_argument("--nmi-floor", type=float, default=0.3)
    ap.add_argument("--dial", default="0.5,0.6,0.7,0.8,0.9,1.0", help="nmi gate dial")
    ap.add_argument("--top", type=int, default=30)
    args = ap.parse_args()
    raw = args.gate == "raw"
    stem = "mi_faithful" if raw else "mi_additions_nmi"
    out_dir = args.out_dir or os.path.dirname(os.path.abspath(args.units))
    units = load(args.units)
    uid = {u["pattern_id"]: u for u in units}
    recs = {r["id"]: r for r in load(args.canonical)}
    N = len(recs)
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
        cap, args.support_cap_frac = N, 0.0
    elif args.support_cap_frac is not None:
        cap = int(math.floor(args.support_cap_frac * N)) if args.support_cap_frac > 0 else N
    else:
        cap = int(math.floor(np.percentile(n, args.cap_percentile)))
        args.support_cap_frac = cap / N

    def h_records(k):
        return float(entropy(np.array(k / N)))
    if raw:
        gate_val = args.mi if args.mi is not None else round(h_records(args.mi_anchor_records), 4)
        sens_val, floor_val = round(h_records(args.mi_sensitivity_records), 4), round(h_records(args.mi_floor_records), 4)
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
    STAT = MI if raw else NMI
    ia, ib = np.triu_indices(F, 1)
    n_pairs, n_cooc = len(ia), int((both[ia, ib] > 0).sum())

    # ---- recorded pairs ----
    rows = []
    for t in np.where(STAT[ia, ib] >= floor_val - 1e-12)[0]:
        a, b = int(ia[t]), int(ib[t])
        ua, ub = units[a], units[b]
        if ua["support"] < ub["support"] or (ua["support"] == ub["support"] and ua["pattern_id"] > ub["pattern_id"]):
            a, b, ua, ub = b, a, ub, ua      # A = the larger-support unit
        shared = sorted(set(ua["ids"]) & set(ub["ids"]))
        stat = float(STAT[a, b])
        moderate = n[a] <= cap and n[b] <= cap
        rows.append({
            "a": ua["pattern_id"], "b": ub["pattern_id"], "query_a": ua["query"], "query_b": ub["query"],
            "n_a": int(n[a]), "n_b": int(n[b]), "n_both": len(shared),
            "n_distinct_shared": min(len({eqc.get(i, i) for i in shared}), len({corp.get(i, "") for i in shared})),
            "mi_bits": round(float(MI[a, b]), 6), "nmi": round(float(NMI[a, b]), 4), "jaccard": round(float(JAC[a, b]), 4),
            "contained": bool(contains(ua["atoms"], ub["atoms"]) or contains(ub["atoms"], ua["atoms"])),
            "moderate_support": bool(moderate), "gate": args.gate,
            "pass": bool(stat >= gate_val - 1e-12 and moderate),
            "sensitivity_pass": bool(stat >= sens_val - 1e-12 and moderate),
            "over_ceiling": bool(stat >= gate_val - 1e-12 and not moderate),
            "examples": shared[:3], "variant": "faithful" if raw else "addition:nmi",
        })
    rows.sort(key=lambda r: ((-r["mi_bits"], -r["jaccard"]) if raw else (-r["nmi"], -r["mi_bits"])) + (r["a"], r["b"]))
    passes = [r for r in rows if r["pass"]]
    near = [r for r in rows if r["sensitivity_pass"] and not r["pass"]]
    above = [r for r in rows if r["over_ceiling"]]

    # ---- alignment + rule for every pass ----
    by_name = collections.defaultdict(set)      # name -> distinct merged features carrying it
    for r in passes:
        ua, ub = uid[r["a"]], uid[r["b"]]
        shared = sorted(set(ua["ids"]) & set(ub["ids"]))
        mapping, holds, total = align(ua, ub, [recs[i] for i in shared if i in recs])
        merged = merge(ua, ub, mapping)
        name, vs = rule_for(merged)
        r.update({"alignment": {va: vb for va, vb in sorted(mapping.items())}, "alignment_holds_in": holds,
                  "alignment_of": total, "merged_atoms": merged, "meta_name": name, "meta_vars": vs})
        by_name[name].add(tuple(merged))
    for r in passes:      # the same merged feature from several pairs keeps one name; different features get a suffix
        if len(by_name[r["meta_name"]]) > 1:
            k = sorted(by_name[r["meta_name"]]).index(tuple(r["merged_atoms"])) + 1
            r["meta_name"] = f"{r['meta_name']}_{k}"
        r["implication"] = (f"(Implication {'(And ' + ' '.join(r['merged_atoms']) + ')' if len(r['merged_atoms']) > 1 else r['merged_atoms'][0]} "
                            f"({r['meta_name']}{(' ' + ' '.join(r['meta_vars'])) if r['meta_vars'] else ''}))")
    p_jsonl = os.path.join(out_dir, f"{stem}.jsonl")
    with open(p_jsonl, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    # ---- dial + calibration ----
    stat_all, jac_all = STAT[ia, ib], JAC[ia, ib]
    mod_all = (n[ia] <= cap) & (n[ib] <= cap)
    dial_rows = [(cut, int((stat_all >= cut - 1e-12).sum()), int(((stat_all >= cut - 1e-12) & mod_all).sum()),
                  sum(1 for r in rows if r["moderate_support"] and r["contained"] and (r["mi_bits"] if raw else r["nmi"]) >= cut - 1e-12))
                 for cut in dial]
    calib = []
    if raw:
        for cf in cap_dial:
            c_ = int(math.floor(cf * N))
            sel_c = (n[ia] <= c_) & (n[ib] <= c_)
            line = []
            for cut in dial:
                s_ = np.where(sel_c & (stat_all >= cut - 1e-12))[0]
                line.append((cut, int(len(s_)), float(np.median(jac_all[s_])) if len(s_) else 0.0,
                             float((jac_all[s_] >= 0.8).mean()) if len(s_) else 0.0))
            calib.append((cf, c_, line))

    params = [
        ("features", f"the {F} faithful §4.3.1 units of {os.path.basename(args.units)} (rooted subtrees, constants verbatim, "
                     "support >= 3, single-atom units included: they are subtrees)"),
        ("matrix", f"binary presence, {N} records x {F} units, from each unit's supporting ids "
                   f"({N - len(rec_ids)} records carry no unit and are all-zero rows); {n_pairs} pairs, {n_cooc} with any co-occurrence"),
        ("MI", "exact pairwise mutual information of the two binary presence variables, in bits, raw"),
        ("'very high MI'", (f"raw MI >= {gate_val} bits = the MI of a perfect co-occurrence over {args.mi_anchor_records} of the {N} records "
                            f"(the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for {n_pairs} "
                            f"pairs is ~{math.log(n_pairs / 0.05) / (2 * N * math.log(2)):.4f} bits); near-miss value {sens_val} "
                            f"(= {args.mi_sensitivity_records} records); pairs recorded from {floor_val} (= {args.mi_floor_records} records); "
                            f"dial {dial}") if raw else
                           (f"ADDITION: normalised MI = MI / max(H(A), H(B)) in [0, 1] (1 = identical record sets); gate NMI >= {args.nmi}; "
                            f"near-miss value {args.nmi_sensitivity}; pairs recorded from {args.nmi_floor}; dial {dial}")),
        ("'moderate individual support'", (f"both units' support <= {cap} records = the {args.cap_percentile:g}th percentile of unit support "
                                           f"({args.support_cap_frac:.1%} of the records; percentiles 50/90/95/99 = "
                                           f"{'/'.join(str(int(x)) for x in np.percentile(n, [50, 90, 95, 99]))}); the floor of 3 is "
                                           "inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself"
                                           if raw and args.support_cap_frac > 0 else
                                           "no ceiling: the normalisation reads tightness directly; the floor of 3 inherited from the units is "
                                           "the only support condition")),
        ("calibration", ("the ceiling x threshold table checks the paper's claim (median doc-Jaccard of the passes); the claim alone "
                         "would also accept a lower threshold where perfectly co-occurring support-3..5 pairs (near-duplicate records) "
                         "dominate — the record-count anchor on the threshold is what keeps them out" if raw else
                         "NMI is our reading of 'very high' (support-free); it belongs to the additions arm")),
        ("'almost always co-occur'", "the paper's consequence, shown as the doc-Jaccard column (not gated)"),
        ("shared records", "n_both = records containing both units; the distinct-sentence count beside it (by corpus equiv_class or "
                           "text) exposes near-duplicate records, which share every subtree by construction"),
        ("part-of", "when one unit's atoms embed in the other's (a variable renaming), the pair restates §4.3.1 subsumption and its "
                    "rule is the larger unit's own pack; flagged in the record, not gated"),
        ("consolidation", "for every pass: the two units' variables are aligned through the shared records (each unit matched in "
                          "each record under the miner's abstraction; the correspondence holding in most records is taken and the "
                          "count shown), the aligned conjunction is the merged feature, and the rule is (Implication (And <merged>) "
                          "(Mn<Name> <vars>)) — naming provisional; units that never share a skolem give a co-occurrence conjunction "
                          "with disjoint variables"),
    ]

    def sent(i):
        return corp.get(i, "")[:100]

    def note(r):
        parts = []
        if r["contained"]:
            parts.append("B is part of A: the rule is A's own pack")
        if r.get("alignment_of") is not None and not r["alignment"] and not r["contained"]:
            parts.append("no shared skolem: co-occurrence conjunction")
        if r["n_distinct_shared"] < r["n_both"]:
            parts.append(f"{r['n_both'] - r['n_distinct_shared']} of the shared records duplicate another")
        return "; ".join(parts)

    L = [("# §4.3.3 Mutual-Information Grouping — FAITHFUL arm (paper as written)\n" if raw else
          "# §4.3.3 Mutual-Information Grouping — ADDITION: normalised-MI gate\n"),
         "> \"We could construct a binary feature matrix indicating which subtrees occur in which sentences, then compute "
         "pairwise mutual information between features. Pairs with very high MI but moderate individual support almost "
         "always co-occur, so they are excellent candidates for consolidation into a single feature.\" — FUSE-NF §4.3.3\n",
         "## Implementation parameters (choices the paper leaves open; disclosed)\n", "| parameter | choice |\n|---|---|"]
    L += [f"| {a} | {b} |" for a, b in params]
    if raw:
        L += ["", "## Calibration: ceiling x threshold (cell = passes / median Jaccard / share with Jaccard >= 0.8)\n",
              "| ceiling | " + " | ".join(f"MI >= {cut}" for cut in dial) + " |", "|---|" + "---|" * len(dial)]
        for cf, c_, line in calib:
            L.append(f"| {cf:.0%} ({c_}) | " + " | ".join(f"{k} / {mj:.2f} / {sh:.0%}" if k else "0" for cut, k, mj, sh in line) + " |")
    L += ["", (f"## The dial at the adopted ceiling ({cap} records)\n" if raw else "## The dial\n"),
          f"| {stat_name} >= | all pairs | within the ceiling | of which part-of pairs |\n|---|---|---|---|"]
    L += [f"| {cut} | {tot} | {mod} | {c} |" for cut, tot, mod, c in dial_rows]
    n_cont = sum(1 for r in passes if r["contained"])
    L += ["", f"- at the gate ({stat_name} >= {gate_val}{f', both supports <= {cap}' if args.support_cap_frac > 0 else ''}): "
          f"**{len(passes)} pairs pass** ({n_cont} part-of pairs, {len(passes) - n_cont} genuine); {len(near)} near misses under the "
          f"ceiling at {stat_name} >= {sens_val}; {len(above)} pairs at or above the threshold but over the ceiling", ""]

    def table(title, seq, k, with_rule=False):
        L.append(f"## {title}\n")
        L.append(f"| {'MI bits' if raw else 'NMI'} | Jaccard | records A / B / shared (distinct) | A | B | note | e.g. |"
                 + (" merged rule |" if with_rule else "") + "\n|---|---|---|---|---|---|---|" + ("---|" if with_rule else ""))
        for r in seq[:k]:
            L.append((f"| {r['mi_bits']:.4f} | " if raw else f"| {r['nmi']:.2f} | ")
                     + f"{r['jaccard']:.2f} | {r['n_a']} / {r['n_b']} / {r['n_both']} ({r['n_distinct_shared']}) | `{r['query_a']}` | `{r['query_b']}` "
                     + f"| {note(r)} | {r['examples'][0] if r['examples'] else ''}: {sent(r['examples'][0]) if r['examples'] else ''} |"
                     + (f" `{r['implication']}` |" if with_rule else ""))
        L.append("")

    table(f"Passes (by {stat_name})", passes, args.top, with_rule=True)
    table(f"Near misses under the ceiling ({stat_name} >= {sens_val}, below the gate)", near, min(args.top, 15))
    if args.support_cap_frac > 0:
        table(f"At or above the threshold but over the ceiling (support > {cap}; the paper's clause excludes them)",
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
                 + ";; Never loaded: a unit is a conjunctive query over variables, not an assertion, and the Implication is the\n"
                 ";; pack rule the pair WOULD become (naming provisional; the candidate stage fixes the pack vocabulary and the\n"
                 ";; gauntlet decides). The record of truth is\n"
                 f";;   {stem}.jsonl          (every pair at the recording floor: statistics, verdict, alignment, rule)\n"
                 ";;   patterns2_faithful.jsonl   (the units and their supporting records = the binary matrix)\n;;\n"
                 ";; PARAMETERS (choices the paper leaves open; disclosed)\n")
        for a, b in params:
            fh.write(f";;   {a:<30s} {b}\n")
        fh.write(";;\n;; RECORD FORMAT (every record is one passing pair)\n"
                 ";;   ;; [genuine|part-of]  A ~ B   records <of A> / <of B> / <shared> (<distinct sentences among the shared>)   gate: PASS\n"
                 + (";;   ;;   MI: <bits>   Jaccard: <shared / either>   e.g. <shared record ids>\n" if raw else
                    ";;   ;;   NMI: <MI / max entropy>   MI: <bits>   Jaccard: <shared / either>   e.g. <shared record ids>\n")
                 + ";;   ;;   A: <query A>\n;;   ;;   B: <query B>\n"
                 ";;   ;;   alignment: <A var = B var …> (holds in <k> of <shared> records)   <note>\n"
                 ";;   (Implication (And <merged atoms>) (Mn<Name> <vars>))\n"
                 ";; A is the unit with the larger support. GENUINE passes come first (neither unit is part of the other: the rule\n"
                 ";; is new to this method), then the PART-OF passes (B's atoms embed in A's: the pair restates §4.3.1 subsumption\n"
                 ";; and the rule is A's own pack); each group sorted by the gate statistic. Near misses are in the .md and the JSONL.\n"
                 ";; Notes: 'B is part of A' = the pair restates §4.3.1 subsumption and the rule is A's own pack;\n"
                 ";; 'no shared skolem' = the units co-occur in the same sentences without touching = a co-occurrence conjunction.\n"
                 ";; Several pairs can yield the SAME merged feature (the same rule); a numeric suffix marks different features that\n"
                 ";; would share a name.\n")
        fh.write(f"\n;; ==================== PASSES: {len(passes)} pairs — {len(passes) - n_cont} genuine first, then {n_cont} part-of ====================\n")
        for r in [r for r in passes if not r["contained"]] + [r for r in passes if r["contained"]]:
            al = " ".join(f"{va}={vb}" for va, vb in r["alignment"].items()) or "—"
            nt = note(r)
            fh.write(f"\n;; [{'part-of' if r['contained'] else 'genuine'}]  {r['a']} ~ {r['b']}   records {r['n_a']} / {r['n_b']} / {r['n_both']} ({r['n_distinct_shared']} distinct)   gate: PASS\n"
                     + (f";;   MI: {r['mi_bits']:.4f}   Jaccard: {r['jaccard']:.2f}" if raw else
                        f";;   NMI: {r['nmi']:.3f}   MI: {r['mi_bits']:.4f}   Jaccard: {r['jaccard']:.2f}")
                     + f"   e.g. {' '.join(r['examples'])}\n"
                     f";;   A: {r['query_a']}\n;;   B: {r['query_b']}\n"
                     f";;   alignment: {al} (holds in {r['alignment_holds_in']} of {r['alignment_of']} records)" + (f"   {nt}" if nt else "") + "\n"
                     f"{r['implication']}\n")
    print(f"{os.path.basename(args.units)} [{args.gate}]: {F} units x {N} records -> {n_pairs} pairs ({n_cooc} co-occurring); "
          f"recorded {len(rows)} at {stat_name} >= {floor_val}; gate {stat_name} >= {gate_val}"
          f"{' + support <= %d' % cap if args.support_cap_frac > 0 else ''}: {len(passes)} pass ({n_cont} part-of), "
          f"{len(near)} near misses under the ceiling, {len(above)} over the ceiling; "
          f"alignment holds in all shared records for {sum(1 for r in passes if r['alignment_holds_in'] == r['alignment_of'])} passes, "
          f"no shared skolem for {sum(1 for r in passes if not r['alignment'])}")
    print(f"-> {p_jsonl}\n-> {p_md}\n-> {p_metta}")


if __name__ == "__main__":
    main()
