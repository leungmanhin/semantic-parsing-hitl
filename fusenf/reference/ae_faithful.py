"""FUSE-NF §4.3.5 Autoencoder Analysis — FAITHFUL arm (H; run #1 2026-09-17, run #2 2026-09-18; owner design 2026-09-16/17).

Paper §4.3.5 verbatim: "We vectorize each SENF graph by its feature counts and train a shallow
autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together
in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions
— another source of consolidation rules."

Features   = the §4.3.1 faithful rooted-subtree units (``patterns2_faithful.jsonl``), taken AS-IS:
             subsumed units and identical columns stay in (owner 2026-09-16: the faithful arm never
             pre-filters its input; dedup / closed-only / binary input / the Qwen3 prior are additions).
Counts     = matches of each unit per record (variable bindings), RECOUNTED with the miner's own
             enumerator + canonicaliser (frequent_patterns2: k atoms, MAX_REC_ATOMS, surface atoms
             excluded, constants verbatim) and VERIFIED against the inventory: every column sum must
             equal the unit's recorded occurrences and every non-zero row set its support set.
Model      = one hidden layer of k sigmoid units, linear output, TIED decoder (x_hat = h W + c);
             loss = mean over records of the squared reconstruction error summed over units
             + weight_decay * ||W||^2 + beta * sum_j KL(rho || mean activation of unit j)
             (beta 0 = the plain shallow autoencoder); full-batch Adam, fixed epochs, float32,
             fixed thread count, fixed seed -> byte-identical re-runs.
Ties       = cosine between two units' ENCODER weight vectors (the columns of W, k-dimensional).
Gate       = cosine >= tau AND both units ENTER the comparison: encoder-vector norm >= the norm floor
             (owner 2026-09-18; dial none / median / init — init = the initialisation norm
             a*sqrt(k/3), a = sqrt(6/(F+k)): training grew the vector beyond where it started).
             Every pair at or above ``--record-floor`` (seed 0) is written to the JSONL whatever the
             floor, with its co-occurrence relation as a FIELD (exclusive / overlapping / nested /
             same-records; part-of = structural containment) — never a filter. Seeds 1..S-1 retrain
             the same model; ``stable_at`` counts the seeds in which the pair also clears each tau.
Tie groups = COMPLETE-linkage clustering of the entering units' weight vectors cut at 1 - tau, so
             every pair inside a group passes the cosine gate (owner 2026-09-17); a partition — the
             pairwise record is the JSONL.

Outputs (in --out-dir; <stem> = ae_faithful):
  ae_counts.csv                                 the count matrix, records x units   [--intermediates]
  <stem>_weights/k<k>_beta<b>_seed<s>.tsv       one encoder weight vector per unit  [--intermediates]
  ties/ties_ae_k<k>_beta<b>_<tau>.txt           tie groups, members as MeTTa queries [--intermediates]
  <stem>.jsonl  (adopted k, beta; seed 0)        the record: every pair >= record floor, with fields
  <stem>_dial/k<k>_beta<b>.jsonl                the same for the other (k, beta) points
  <stem>.metta  (adopted k, beta; adopted gate)  readable rendering: SHAPE-PARALLEL EXCLUSIVE pairs first (the only
  <stem>_dial/k<k>_beta<b>.metta                ones rendered as a rule; owner 2026-09-18), then the other pairs by
                                                relation with 'rule: none'; every record shows its cosine and
                                                norms, so the tau / floor dials are the reader's; the
                                                .md carries the counts per tau and floor; never loaded
  <stem>.md                                     parameters, matrix facts, training table, dial table,
                                                top pairs with sentences, Tier A scorecard (--key)
  Twins with their own stem: the plain shallow AE (--bottleneck 32 --beta 0 --adopt-beta 0 --stem
  ae_faithful_plain) and the strong-sparsity point (--beta 2 --adopt-beta 2 --stem ae_faithful_beta2).

Usage:
  python ae_faithful.py [--units out_h/patterns2_faithful.jsonl] [--canonical canonical_substrate.jsonl]
      [--out-dir out_h] [--bottleneck 32,64,128 --adopt-bottleneck 32] [--beta 0.5 --adopt-beta 0.5]
      [--cos 0.80,0.85,0.90,0.95 --adopt-cos 0.85] [--norm-floor none,median,init --adopt-floor init]
      [--record-floor 0.8] [--seeds 5] [--epochs 10000] [--intermediates matrix,weights,ties | none]
      [--key out_ecmp/tierA_slot_key.json]
"""
from __future__ import annotations

import argparse
import collections
import csv
import glob
import json
import math
import os
import re
import sys
import time

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(FUSENF, "harness"))
import canonicalize as C  # noqa: E402
from frequent_patterns2 import Enumerator, canonical_pattern2, load, MAX_REC_ATOMS  # noqa: E402
from patterns2_faithful import contains, parse_atom  # noqa: E402
import itertools  # noqa: E402

PAPER = ("We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a "
         "low-dimensional bottleneck. Input features whose activations are tied together in the encoder "
         "weights indicate clusters of subtrees that serve interchangeable semantic functions — another "
         "source of consolidation rules.")
ORDER = ("exclusive", "overlapping", "nested", "same-records")
EPS = 1e-9


# ----------------------------------------------------------------------------- inputs
def load_records(path):
    records, seen = [], set()
    for r in load(path):
        if r["id"] in seen:
            continue
        seen.add(r["id"])
        records.append(r)
    return records


def load_units(path):
    units = load(path)
    for u in units:
        u["key"] = tuple(u["atoms"])
        u["idset"] = set(u["ids"])
    return units


def build_counts(records, units, k):
    """N x F integer matrix of unit matches per record, with the miner's own enumeration."""
    vocab = C.load_vocabulary()
    surface = vocab["surface_record"]
    raw = json.load(open(os.path.join(FUSENF, "specs", "vocabulary.json"), encoding="utf-8"))
    operators = set(raw["operators"]) | set(raw.get("deprecated_operators", {}))
    index = {u["key"]: j for j, u in enumerate(units)}
    X = np.zeros((len(records), len(units)), dtype=np.int32)
    truncated = 0
    for i, rec in enumerate(records):
        en = Enumerator(rec, operators, surface, False)
        truncated += en.truncated
        for combo in en.subsets(k):
            j = index.get(canonical_pattern2(en.terms_stvs(combo), ()))
            if j is not None:
                X[i, j] += 1
    return X, truncated


def verify_counts(X, records, units):
    ids = [r["id"] for r in records]
    bad = []
    for j, u in enumerate(units):
        col = X[:, j]
        if int(col.sum()) != u["occurrences"]:
            bad.append(f"{u['pattern_id']}: column sum {int(col.sum())} != occurrences {u['occurrences']}")
        rows = {ids[i] for i in np.nonzero(col)[0]}
        if rows != u["idset"]:
            bad.append(f"{u['pattern_id']}: non-zero rows {len(rows)} != support set {len(u['idset'])}")
    if bad:
        raise SystemExit("count matrix does not reproduce the inventory:\n  " + "\n  ".join(bad[:10]))


# ----------------------------------------------------------------------------- model
def init_norm(k, F):
    """expected column norm at initialisation: k entries uniform(-a, a), a = sqrt(6/(F+k))"""
    return math.sqrt(6.0 / (F + k)) * math.sqrt(k / 3.0)


def train_ae(X, k, beta, rho, weight_decay, lr, epochs, seed, threads, checkpoints):
    """Shallow tied autoencoder; returns (W [k x F] float32, stats)."""
    import torch
    torch.set_num_threads(threads)
    torch.use_deterministic_algorithms(True)
    torch.manual_seed(seed)
    N, F = X.shape
    x = torch.tensor(X, dtype=torch.float32)
    col_mean = x.mean(0)
    sst = float(((x - col_mean) ** 2).sum())
    a = math.sqrt(6.0 / (F + k))
    W = torch.nn.Parameter(torch.empty(k, F).uniform_(-a, a))
    b = torch.nn.Parameter(torch.zeros(k))
    c = torch.nn.Parameter(col_mean.clone())
    opt = torch.optim.Adam([W, b, c], lr=lr)
    log_every = max(1, epochs // checkpoints)
    curve = []
    for ep in range(1, epochs + 1):
        opt.zero_grad()
        h = torch.sigmoid(x @ W.t() + b)
        xhat = h @ W + c
        recon = ((xhat - x) ** 2).sum(1).mean()
        loss = recon + weight_decay * (W ** 2).sum()
        if beta > 0:
            rho_hat = h.mean(0).clamp(1e-6, 1 - 1e-6)
            kl = (rho * torch.log(rho / rho_hat) + (1 - rho) * torch.log((1 - rho) / (1 - rho_hat))).sum()
            loss = loss + beta * kl
        loss.backward()
        opt.step()
        if ep % log_every == 0 or ep == epochs:
            curve.append((ep, round(float(recon.detach()), 4)))
    with torch.no_grad():
        h = torch.sigmoid(x @ W.t() + b)
        xhat = h @ W + c
        sse = float(((xhat - x) ** 2).sum())
        stats = {"recon": round(float(((xhat - x) ** 2).sum(1).mean()), 4),
                 "r2": round(1 - sse / sst, 4), "mean_activation": round(float(h.mean()), 4),
                 "active_units_per_record": round(float((h > 0.5).float().sum(1).mean()), 2),
                 "curve": curve}
    return W.detach().numpy().astype(np.float32), stats


def cosine_matrix(W):
    """W: k x F -> (F x F cosine between columns, column norms)."""
    norms = np.linalg.norm(W, axis=0)
    Wn = W / np.where(norms > 0, norms, 1.0)
    return (Wn.T @ Wn).astype(np.float32), norms


# ----------------------------------------------------------------------------- pairs
def relation_of(A, B):
    both = A & B
    if not both:
        return "exclusive", 0
    if A == B:
        return "same-records", len(both)
    if A < B or B < A:
        return "nested", len(both)
    return "overlapping", len(both)


def shape_parallel(A, B):
    """Owner 2026-09-18: two units are SHAPE-PARALLEL when they have the same number of atoms and, under some
    bijective renaming of B's variables onto A's WITHIN each variable stream (an entity variable never becomes an
    event variable; fix 2026-09-19), all atoms but one coincide, the two differing atoms having the
    same arity with the same variables in the same positions — i.e. they differ only in a head symbol or a
    constant (Theme -> Patient; swim -> play). Returns (True, atom_of_A, atom_of_B) or (False, None, None)."""
    if len(A) != len(B):
        return False, None, None
    PA = [(a, parse_atom(a)) for a in A]
    PB = [(b, parse_atom(b)) for b in B]
    va = sorted({t for _, (_, args, _) in PA for t in args if t.startswith("$")})
    vb = sorted({t for _, (_, args, _) in PB for t in args if t.startswith("$")})
    streams = sorted({t[1] for t in va} | {t[1] for t in vb})           # $e / $x / $f: a renaming stays within a stream
    by_a = {st: [t for t in va if t[1] == st] for st in streams}
    by_b = {st: [t for t in vb if t[1] == st] for st in streams}
    if any(len(by_a[st]) != len(by_b[st]) for st in streams):
        return False, None, None
    aset = {(h, tuple(args), n): orig for orig, (h, args, n) in PA}
    for combo in itertools.product(*(itertools.permutations(by_a[st]) for st in streams)):
        m = {t: p for st, perm in zip(streams, combo) for t, p in zip(by_b[st], perm)}
        bset = {(h, tuple(m.get(t, t) for t in args), n): orig for orig, (h, args, n) in PB}
        da = set(aset) - set(bset)
        db = set(bset) - set(aset)
        if len(da) == 1 and len(db) == 1:
            (ha, argsa, na), (hb, argsb, nb) = next(iter(da)), next(iter(db))
            if len(argsa) == len(argsb) and all(x == y for x, y in zip(argsa, argsb) if x.startswith("$") or y.startswith("$")):
                return True, aset[(ha, argsa, na)], bset[(hb, argsb, nb)]
    return False, None, None


def build_pairs(units, C0, Cs, norms, floor, taus, texts):
    F = len(units)
    iu, ju = np.triu_indices(F, k=1)
    keep = C0[iu, ju] >= floor - EPS
    rows = []
    for f, g in zip(iu[keep], ju[keep]):
        ua, ub = units[f], units[g]
        if (ua["support"], ub["query"]) < (ub["support"], ua["query"]):   # A = larger support (tie: query order)
            ua, ub, f, g = ub, ua, g, f
        rel, n_both = relation_of(ua["idset"], ub["idset"])
        part = bool(contains(ua["atoms"], ub["atoms"]) or contains(ub["atoms"], ua["atoms"]))
        par, atom_a, atom_b = shape_parallel(ua["atoms"], ub["atoms"])
        cos = [round(float(Cm[f, g]), 4) for Cm in Cs]
        shared = sorted(ua["idset"] & ub["idset"])
        if shared:
            examples = shared[:3]
            n_distinct = len({texts.get(i, i) for i in shared})
        else:
            examples = sorted(ua["idset"])[:2] + sorted(ub["idset"])[:2]
            n_distinct = 0
        rows.append({
            "a": ua["pattern_id"], "b": ub["pattern_id"], "query_a": ua["query"], "query_b": ub["query"],
            "n_a": ua["support"], "n_b": ub["support"], "n_both": n_both, "n_distinct_shared": n_distinct,
            "relation": rel, "part_of": part, "parallel": par,
            "substitution": f"{atom_b} -> {atom_a}" if par else None,
            "cosine": cos[0], "cosines": cos,
            "stable_at": {f"{t:.2f}": sum(1 for cv in cos if cv >= t - EPS) for t in taus},
            "norm_a": round(float(norms[f]), 4), "norm_b": round(float(norms[g]), 4),
            "examples": examples, "variant": "faithful", "gate": "cosine+norm-floor",
        })
    rows.sort(key=lambda r: (-r["cosine"], r["a"], r["b"]))
    return rows


def passes(r, tau, fv):
    return r["cosine"] >= tau - EPS and min(r["norm_a"], r["norm_b"]) >= fv - EPS


def floor_values(kind_list, k, F, norms):
    out = {}
    for kind in kind_list:
        if kind == "none":
            out[kind] = 0.0
        elif kind == "median":
            out[kind] = float(np.median(norms))
        elif kind == "init":
            out[kind] = init_norm(k, F)
        else:
            out[kind] = float(kind)
    return out


def score_key(key, rows, tau, fv):
    """Tier A: an expected / control lemma pair is linked when a PASS pair's units mention the two lemmas."""
    def lemmas(q):
        return set(re.findall(r"\(Member \$e\d+ ([a-z][a-z0-9_]*)\)", q))
    linked = set()
    for r in rows:
        if not passes(r, tau, fv):
            continue
        la, lb = lemmas(r["query_a"]), lemmas(r["query_b"])
        for x in la:
            for y in lb:
                if x != y:
                    linked.add("|".join(sorted((x, y))))
    exp = sorted(key["expected"])
    rec = [p for p in exp if p in linked]
    ctrl = [p for p in sorted(key["control_lexical"]) if p in linked]
    return {"recall": f"{len(rec)}/{len(exp)}", "recovered": rec, "missed": [p for p in exp if p not in linked],
            "control_hits": ctrl}


# ----------------------------------------------------------------------------- writers
def write_counts_csv(path, X, records, units):
    with open(path, "w", encoding="utf-8", newline="") as fh:
        w = csv.writer(fh)
        w.writerow(["record"] + [u["pattern_id"] for u in units])
        for i, rec in enumerate(records):
            w.writerow([rec["id"]] + [int(v) for v in X[i]])


def write_weights(path, W, units):
    k = W.shape[0]
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("pattern_id\t" + "\t".join(f"w{j}" for j in range(k)) + "\tquery\n")
        for f, u in enumerate(units):
            fh.write(u["pattern_id"] + "\t" + "\t".join(f"{v:.5f}" for v in W[:, f]) + "\t" + u["query"] + "\n")


def write_ties(path, W, units, tau, fv, floor_kind, label):
    """Tie groups: COMPLETE-linkage clustering of the ENTERING units' encoder weight vectors cut at 1 - tau,
    so every pair inside a group passes the cosine gate (owner 2026-09-17). A partition: a unit sits in one
    group, and a passing pair whose other companions conflict falls across groups — the JSONL is the record."""
    from scipy.cluster.hierarchy import fcluster, linkage
    from scipy.spatial.distance import pdist
    norms = np.linalg.norm(W, axis=0)
    enter = [f for f in range(len(units)) if norms[f] >= fv - EPS]
    below = sorted((units[f]["query"] for f in range(len(units)) if norms[f] < fv - EPS), key=lambda q: (q.lower(), q))
    Wn = (W[:, enter] / np.where(norms[enter] > 0, norms[enter], 1.0)).T.astype(np.float64)
    if tau >= 1.0 or len(enter) < 2:
        lab = np.arange(len(enter))
    else:
        d = pdist(Wn, metric="cosine")
        d = np.where(np.isnan(d), 1.0, d)
        lab = fcluster(linkage(d, method="complete"), t=1.0 - tau, criterion="distance")
    members = collections.defaultdict(list)
    for pos, cl in enumerate(lab):
        members[int(cl)].append(units[enter[pos]]["query"])
    groups = sorted((sorted(ms, key=lambda q: (q.lower(), q)) for ms in members.values() if len(ms) > 1),
                    key=lambda ms: (-len(ms), ms[0].lower(), ms[0]))
    untied = sorted((ms[0] for ms in members.values() if len(ms) == 1), key=lambda q: (q.lower(), q))
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(f";; {len(groups)} tie groups (size >= 2) covering {len(enter) - len(untied)} of the {len(enter)} entering units "
                 f"({len(units)} in all) at cosine >= {tau:.2f}, norm floor {floor_kind} {fv:.3f} — complete linkage on the cosine\n"
                 f";; distance of the encoder weight vectors ({label}): every pair inside a group passes the gate; a partition, so a\n"
                 ";; unit sits in one group and a passing pair whose other companions conflict falls across groups (the pairwise\n"
                 f";; record is the JSONL); groups by size, members by query; then the {len(untied)} untied entering units and the\n"
                 f";; {len(below)} units below the floor\n\n")
        for n, ms in enumerate(groups, 1):
            fh.write(f";; tie #{n} (size {len(ms)})\n" + "\n".join(ms) + "\n\n")
        fh.write(f";; untied entering units ({len(untied)})\n" + "\n".join(untied) + "\n\n")
        fh.write(f";; units below the norm floor ({len(below)})\n" + "\n".join(below) + "\n")
    return len(groups), len(untied), len(below)


def write_jsonl(path, rows, k, beta, tau, fv):
    with open(path, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(dict(r, **{"pass": passes(r, tau, fv),
                                           "enters": min(r["norm_a"], r["norm_b"]) >= fv - EPS,
                                           "pass_no_floor": r["cosine"] >= tau - EPS,
                                           "method": f"autoencoder-4.3.5/k{k}_beta{beta:g}"}),
                                ensure_ascii=False, sort_keys=True) + "\n")


def write_metta(path, args, rows, units, k, beta, tau, fvals, fkind, is_main, facts, stats, n_seeds):
    F = len(units)
    fv = fvals[fkind]
    n_pairs = F * (F - 1) // 2
    ps = [r for r in rows if passes(r, tau, fv)]

    def rank(r):   # shape-parallel exclusive pairs first (the only ones that render as a rule), then the rest by relation
        return 0 if r["relation"] == "exclusive" and r["parallel"] else 1 + ORDER.index(r["relation"])
    ps.sort(key=lambda r: (rank(r), -r["cosine"], r["a"], r["b"]))
    below = sum(1 for r in rows if r["cosine"] >= tau - EPS and not passes(r, tau, fv))
    near = [r for r in rows if passes(r, tau - args.metta_near, fv) and not passes(r, tau, fv)] if args.metta_near > 0 else []
    cnt = collections.Counter(r["relation"] for r in ps)
    n_par = sum(1 for r in ps if r["relation"] == "exclusive" and r["parallel"])
    n_enter = facts["entering"][(k, beta)][fkind]
    fl = " / ".join(f"{kd} {v:.3f}" for kd, v in fvals.items())
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(";; FUSE-NF §4.3.5 Autoencoder Analysis — FAITHFUL arm — readable MeTTa RENDERING\n"
                 ";; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is\n"
                 f";;   {args.stem}.jsonl (adopted k / beta) and {args.stem}_dial/k<k>_beta<b>.jsonl   (every pair with cosine >= {args.record_floor}, whatever the floor)\n"
                 f";;   {args.stem}_weights/k<k>_beta<b>_seed<s>.tsv   (one encoder weight vector per unit)\n;;\n")
        if is_main:
            fh.write(f";; BLOCK: bottleneck {k}, sparsity beta {beta:g}, gate cosine >= {tau:.2f} with norm floor {fkind} — the adopted setting. The other "
                     f"bottlenecks of the dial:\n;;   {args.stem}_dial/k<k>_beta<b>.metta   (the cosine and floor dials need no extra files: every record shows\n"
                     ";;   its cosine and norms, and the .md counts the passes per threshold and floor)\n;;\n")
        else:
            fh.write(f";; BLOCK: bottleneck {k}, sparsity beta {beta:g}, gate cosine >= {tau:.2f} with norm floor {fkind} — one point of the dial; the adopted "
                     f"setting (k {args.adopt_bottleneck}, beta {args.adopt_beta:g}, cosine {args.adopt_cos:.2f}, floor {args.adopt_floor}) is\n"
                     f";;   ../{args.stem}.metta\n;;\n")
        fh.write(";; PARAMETERS (choices the paper leaves open; disclosed)\n"
                 f";;   units           {facts['units_file']}: {F} rooted-subtree units of the §4.3.1 faithful view, taken as-is\n"
                 ";;                   (subsumed units and identical columns included — the faithful arm never pre-filters)\n"
                 f";;   records         {facts['canonical_file']}: {facts['n_records']} records\n"
                 f";;   vectorisation   count of each unit's matches (variable bindings) per record, recounted with the miner's enumerator\n"
                 f";;                   (k = {args.k} atoms, {MAX_REC_ATOMS} eligible atoms per record, surface atoms excluded, constants verbatim)\n"
                 f";;                   and verified against the inventory (column sums = occurrences, non-zero rows = support sets);\n"
                 f";;                   raw counts, no scaling: {facts['nonzero']} non-zero cells, {facts['repeats']} repeat matches beyond the first\n"
                 f";;   autoencoder     one hidden layer of {k} sigmoid units, linear output, tied decoder x_hat = h W + c;\n"
                 ";;                   init W uniform(+-sqrt(6/(F+k))), b = 0, c = the column means\n"
                 f";;   loss            mean over records of the squared reconstruction error summed over units + {args.weight_decay:g} ||W||^2\n"
                 f";;                   + beta {beta:g} * sum_j KL(rho {args.rho:g} || mean activation of hidden unit j)   (beta 0 = the plain shallow AE)\n"
                 f";;   training        full batch, Adam lr {args.lr:g}, {args.epochs} epochs, float32, {args.threads} thread(s), seed 0 adopted;\n"
                 f";;                   seeds 0..{n_seeds - 1} retrain the same model for the stability count\n"
                 f";;                   this block: reconstruction {stats['recon']} per record, R^2 {stats['r2']}, mean activation {stats['mean_activation']};\n"
                 f";;                   reconstruction at each tenth of the epochs: {' / '.join(str(c[1]) for c in stats['curve'])}\n"
                 f";;   ties            cosine between the two units' encoder weight vectors (the columns of W, {k}-dimensional);\n"
                 f";;                   gate cosine >= {tau:.2f} (dial {', '.join(f'{t:.2f}' for t in args.cos_list)}); recording floor {args.record_floor}\n"
                 f";;   norm floor      a unit ENTERS the comparison at encoder-vector norm >= {fv:.3f} ({fkind}); dial {fl};\n"
                 ";;                   init = the initialisation norm a*sqrt(k/3), a = sqrt(6/(F+k)) — training grew the vector beyond where it\n"
                 f";;                   started; median = the median unit norm; {n_enter} of {F} units enter under this block's floor\n"
                 f";;   co-occurrence   from the units' record sets: exclusive (no shared record) / overlapping / nested / same-records;\n"
                 ";;                   part-of = one unit's atoms embed in the other's (§4.3.1 containment) — a FIELD, never a filter\n"
                 ";;   tie groups      complete linkage on the cosine distance of the entering units' weight vectors, cut at 1 - tau: every\n"
                 ";;                   pair inside a group passes the gate; a partition (a unit sits in one group) — the pairwise record is the JSONL\n;;\n"
                 ";; RECORD FORMAT (every record is one pair, with its gate verdict)\n"
                 ";;   ;; [relation(, part-of)]  A ~ B   cosine <seed 0> (seeds <n>/<S> >= tau)   records <A> / <B> / <shared>   norms <A> / <B>   gate: PASS|FAIL\n"
                 ";;   ;;   A: <query A>   e.g. <witness record ids>\n"
                 ";;   ;;   B: <query B>\n"
                 ";;   ;;   substitution: <atom of B> -> <atom of A>      (shape-parallel exclusive pairs only)\n"
                 ";;   (Implication <B> <A>)                               (shape-parallel exclusive pairs only)\n"
                 ";;     = the consolidation as the rule it would become: the minority unit (smaller support) rewrites to the majority\n"
                 ";;     unit. Rendered ONLY for an EXCLUSIVE pair that is SHAPE-PARALLEL (owner 2026-09-18): same number of atoms and,\n"
                 ";;     under a renaming of variables, all atoms but one coincide, the differing atom differing only in its head symbol\n"
                 ";;     or a constant — so the two sides' variables line up by construction (an exclusive pair shares no record, so no\n"
                 ";;     alignment is observable otherwise). Every other pair carries ';;   rule: none' with the reason: an exclusive pair\n"
                 ";;     that is not shape-parallel records shared sentence context, not a rewrite; a co-occurring pair (overlapping /\n"
                 ";;     nested / same-records) corroborates §4.3.3 / §4.3.1, and a whole implying its part is a tautology.\n"
                 ";;     Naming and direction provisional, the gauntlet decides.\n"
                 ";; A is the unit with the larger support (tie: query order). PASS pairs in this order — SHAPE-PARALLEL EXCLUSIVE first (the\n"
                 ";; rules), then the other EXCLUSIVE pairs (the paper's interchangeability reading: the two units never share a record),\n"
                 ";; then OVERLAPPING, NESTED and SAME-RECORDS (co-occurrence: corroboration, not new rules) — each group by cosine;\n"
                 + (f";; then the near misses (cosine within {args.metta_near:g} below the gate).\n" if args.metta_near > 0 else
                    ";; near misses and the pairs above the cosine gate with a side below the floor are in the JSONL only.\n"))
        fh.write(f"\n;; ==================== TIED PAIRS: {len(ps)} pass the gate — exclusive {cnt['exclusive']} (shape-parallel {n_par} = the rules), overlapping "
                 f"{cnt['overlapping']}, nested {cnt['nested']}, same-records {cnt['same-records']}"
                 + (f"; + {len(near)} near misses listed" if near else "")
                 + f" — among the {n_pairs} pairs of {F} units ({n_enter} entering); {below} pairs above the cosine gate have a side below "
                 f"the floor; {len(rows)} pairs recorded in the JSONL ====================\n")
        for r in ps + near:
            ok = passes(r, tau, fv)
            tag = r["relation"] + (", shape-parallel" if r["parallel"] else "") + (", part-of" if r["part_of"] else "")
            fh.write(f"\n;; [{tag}]  {r['a']} ~ {r['b']}   cosine {r['cosine']:.4f} (seeds {r['stable_at'][f'{tau:.2f}']}/{n_seeds} >= {tau:.2f})"
                     f"   records {r['n_a']} / {r['n_b']} / {r['n_both']}   norms {r['norm_a']:.2f} / {r['norm_b']:.2f}   gate: {'PASS' if ok else 'FAIL'}\n")
            fh.write(f";;   A: {r['query_a']}   e.g. {' '.join(r['examples'])}\n;;   B: {r['query_b']}\n")
            if r["relation"] == "exclusive" and r["parallel"]:
                fh.write(f";;   substitution: {r['substitution']}\n(Implication {r['query_b']} {r['query_a']})\n")
            elif r["relation"] == "exclusive":
                fh.write(";;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite\n")
            else:
                fh.write(f";;   rule: none — the units co-occur ({r['relation']}): the pair corroborates §4.3.3 / §4.3.1; a whole implying "
                         "its part is a tautology\n")


# ----------------------------------------------------------------------------- main
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--units", default=os.path.join(HERE, "out_h", "patterns2_faithful.jsonl"))
    ap.add_argument("--canonical", default=os.path.join(HERE, "canonical_substrate.jsonl"))
    ap.add_argument("--out-dir", default=os.path.join(HERE, "out_h"))
    ap.add_argument("--stem", default="ae_faithful")
    ap.add_argument("--corpora", default=os.path.join(FUSENF, "corpora"), help="sentence texts for the report")
    ap.add_argument("--key", default=None, help="tierA_slot_key.json: Tier A scorecard (item-E substrate)")
    ap.add_argument("--k", type=int, default=4, help="atoms per pattern in the enumeration (the miner's k)")
    ap.add_argument("--bottleneck", default="32,64,128", help="bottleneck dial")
    ap.add_argument("--adopt-bottleneck", type=int, default=32)
    ap.add_argument("--beta", default="0.5", help="sparsity weight(s); twins: --beta 0 --adopt-beta 0 --stem ae_faithful_plain, "
                                                   "--beta 2 --adopt-beta 2 --stem ae_faithful_beta2")
    ap.add_argument("--adopt-beta", type=float, default=0.5)
    ap.add_argument("--rho", type=float, default=0.1, help="sparsity target activation")
    ap.add_argument("--weight-decay", type=float, default=1e-4)
    ap.add_argument("--lr", type=float, default=0.01)
    ap.add_argument("--epochs", type=int, default=10000)
    ap.add_argument("--checkpoints", type=int, default=10, help="loss-curve points reported")
    ap.add_argument("--seeds", type=int, default=5, help="seed 0 adopted; seeds 1..S-1 for the stability count")
    ap.add_argument("--threads", type=int, default=8, help="torch CPU threads (re-runs are byte-identical for a fixed count)")
    ap.add_argument("--cos", default="0.80,0.85,0.90,0.95", help="cosine gate dial")
    ap.add_argument("--adopt-cos", type=float, default=0.85)
    ap.add_argument("--norm-floor", default="none,median,init",
                    help="norm-floor dial: none | median | init | a number (encoder-vector norm a unit needs to enter)")
    ap.add_argument("--adopt-floor", default="init")
    ap.add_argument("--record-floor", type=float, default=0.8, help="pairs at or above this cosine (seed 0) enter the JSONL "
                                                                     "(default = the lowest gate on the cosine dial)")
    ap.add_argument("--metta-near", type=float, default=0.0, help="FAIL pairs listed in the rendering: cosine within this below the gate (0 = passes only)")
    ap.add_argument("--intermediates", default="matrix,weights,ties",
                    help="comma list of matrix,weights,ties — or 'none'")
    ap.add_argument("--top", type=int, default=25, help="pairs shown with sentences in the .md")
    args = ap.parse_args()
    args.cos_list = [float(x) for x in args.cos.split(",")]
    args.floor_list = [x.strip() for x in args.norm_floor.split(",") if x.strip()]
    ks = [int(x) for x in args.bottleneck.split(",")]
    betas = [float(x) for x in args.beta.split(",")]
    inter = set() if args.intermediates.strip() == "none" else {s.strip() for s in args.intermediates.split(",") if s.strip()}
    if args.adopt_bottleneck not in ks or all(abs(args.adopt_beta - b) > 1e-12 for b in betas) \
            or all(abs(args.adopt_cos - t) > EPS for t in args.cos_list) or args.adopt_floor not in args.floor_list:
        raise SystemExit("the adopted bottleneck / beta / cosine / floor must be on their dials")

    t0 = time.time()
    units = load_units(args.units)
    records = load_records(args.canonical)
    F = len(units)
    X, truncated = build_counts(records, units, args.k)
    verify_counts(X, records, units)
    facts = {"units_file": os.path.relpath(args.units, HERE), "canonical_file": os.path.relpath(args.canonical, HERE),
             "n_records": len(records), "n_units": F, "nonzero": int((X > 0).sum()),
             "repeats": int(X.sum() - (X > 0).sum()), "truncated": truncated,
             "max_count": int(X.max()), "mean_units_per_record": round(float((X > 0).sum(1).mean()), 2),
             "entering": {}}
    print(f"count matrix {X.shape}: {facts['nonzero']} non-zero cells, {facts['repeats']} repeats, verified against the "
          f"inventory ({time.time() - t0:.1f}s)")
    os.makedirs(args.out_dir, exist_ok=True)
    if "matrix" in inter:
        write_counts_csv(os.path.join(args.out_dir, "ae_counts.csv"), X, records, units)
        print(f"-> {os.path.join(args.out_dir, 'ae_counts.csv')}")

    texts = {}
    for p in sorted(glob.glob(os.path.join(args.corpora, "*.jsonl"))):
        for r in load(p):
            texts[r["id"]] = " ".join(r["sentences"])
    key = json.load(open(args.key, encoding="utf-8")) if args.key else None
    mi_path = os.path.join(args.out_dir, "mi_faithful.jsonl")   # §4.3.3 faithful passes, for the overlap count
    mi_pass = {frozenset((r["a"], r["b"])) for r in load(mi_path) if r.get("pass")} if os.path.exists(mi_path) else set()

    wdir = os.path.join(args.out_dir, f"{args.stem}_weights")
    tdir = os.path.join(args.out_dir, "ties")
    ddir = os.path.join(args.out_dir, f"{args.stem}_dial")
    if len(ks) * len(betas) > 1:
        os.makedirs(ddir, exist_ok=True)
    if "weights" in inter:
        os.makedirs(wdir, exist_ok=True)
    if "ties" in inter:
        os.makedirs(tdir, exist_ok=True)

    results, training, floors_of = {}, [], {}
    for k in ks:
        for beta in betas:
            Ws, stats0 = [], None
            for s in range(args.seeds):
                t1 = time.time()
                W, st = train_ae(X, k, beta, args.rho, args.weight_decay, args.lr, args.epochs, s, args.threads, args.checkpoints)
                Ws.append(W)
                training.append((k, beta, s, st))
                if s == 0:
                    stats0 = st
                if "weights" in inter:
                    write_weights(os.path.join(wdir, f"k{k}_beta{beta:g}_seed{s}.tsv"), W, units)
                print(f"k {k} beta {beta:g} seed {s}: recon {st['recon']} R2 {st['r2']} act {st['mean_activation']} "
                      f"({time.time() - t1:.1f}s)" + (f"  curve {[c[1] for c in st['curve']]}" if s == 0 else ""))
            Cs, norms = [], None
            for W in Ws:
                Cm, nm = cosine_matrix(W)
                Cs.append(Cm)
                if norms is None:
                    norms = nm
            fvals = floor_values(args.floor_list, k, F, norms)
            floors_of[(k, beta)] = fvals
            facts["entering"][(k, beta)] = {kd: int((norms >= v - EPS).sum()) for kd, v in fvals.items()}
            rows = build_pairs(units, Cs[0], Cs, norms, args.record_floor, args.cos_list, texts)
            is_adopted = (k == args.adopt_bottleneck and abs(beta - args.adopt_beta) < 1e-12)
            fv_adopt = fvals[args.adopt_floor]
            jpath = os.path.join(args.out_dir, f"{args.stem}.jsonl") if is_adopted else os.path.join(ddir, f"k{k}_beta{beta:g}.jsonl")
            write_jsonl(jpath, rows, k, beta, args.adopt_cos, fv_adopt)
            mpath = os.path.join(args.out_dir, f"{args.stem}.metta") if is_adopted else os.path.join(ddir, f"k{k}_beta{beta:g}.metta")
            write_metta(mpath, args, rows, units, k, beta, args.adopt_cos, fvals, args.adopt_floor, is_adopted, facts, stats0, args.seeds)
            for tau in args.cos_list:
                n_ties = None
                if "ties" in inter:
                    n_ties = write_ties(os.path.join(tdir, f"ties_ae_k{k}_beta{beta:g}_{tau:.2f}.txt"), Ws[0], units, tau,
                                        fv_adopt, args.adopt_floor, f"bottleneck {k}, beta {beta:g}, seed 0")
                ps = [r for r in rows if passes(r, tau, fv_adopt)]
                results[(k, beta, tau)] = {
                    "pass": len(ps), "by_relation": dict(collections.Counter(r["relation"] for r in ps)),
                    "part_of": sum(1 for r in ps if r["part_of"]),
                    "parallel": sum(1 for r in ps if r["relation"] == "exclusive" and r["parallel"]),
                    "shared_mi": sum(1 for r in ps if frozenset((r["a"], r["b"])) in mi_pass),
                    "stable_all": sum(1 for r in ps if r["stable_at"][f"{tau:.2f}"] == args.seeds),
                    "pass_by_floor": {kd: sum(1 for r in rows if passes(r, tau, v)) for kd, v in fvals.items()},
                    "excl_by_floor": {kd: sum(1 for r in rows if passes(r, tau, v) and r["relation"] == "exclusive") for kd, v in fvals.items()},
                    "ties": n_ties, "recorded": len(rows),
                    "scorecard": score_key(key, rows, tau, fv_adopt) if key else None,
                }
            results[(k, beta)] = rows
            print(f"k {k} beta {beta:g}: {len(rows)} pairs >= {args.record_floor}; floors {', '.join(f'{kd} {v:.3f} ({facts['entering'][(k, beta)][kd]} enter)' for kd, v in fvals.items())}; "
                  "pass at " + ", ".join(f"{t:.2f}: {results[(k, beta, t)]['pass']}" for t in args.cos_list) + f" (floor {args.adopt_floor})")

    # ---- markdown report ----
    fl_txt = ", ".join(args.floor_list)
    R = ["# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)\n", f"> \"{PAPER}\" — FUSE-NF §4.3.5\n",
         "## Implementation parameters (doc-open choices, disclosed)\n", "| parameter | choice |\n|---|---|",
         f"| features | the {F} rooted-subtree units of the §4.3.1 faithful view (`{facts['units_file']}`), taken as-is: "
         "subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |",
         f"| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator "
         f"(k = {args.k}, {MAX_REC_ATOMS} eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |",
         f"| autoencoder | one hidden layer of k sigmoid units (dial {ks}, adopted {args.adopt_bottleneck}), linear output, tied decoder x_hat = h W + c; "
         "W uniform(±sqrt(6/(F+k))), b = 0, c = column means |",
         f"| loss | mean over records of the squared reconstruction error summed over units + {args.weight_decay:g}·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), "
         f"rho {args.rho:g}, beta {betas} (adopted {args.adopt_beta:g}; the plain AE beta 0 and beta 2 are twin runs `{args.stem}_plain.*` / `{args.stem}_beta2.*` when present) |",
         f"| training | full batch, Adam lr {args.lr:g}, {args.epochs} epochs, float32, {args.threads} thread(s); seed 0 adopted, seeds 0..{args.seeds - 1} for stability |",
         f"| ties | cosine between two units' encoder weight vectors (columns of W); gate cosine ≥ tau, dial {args.cos_list}, adopted {args.adopt_cos:.2f}; "
         f"recording floor {args.record_floor} |",
         f"| norm floor | a unit enters the comparison when its encoder-vector norm is at least the floor; dial {fl_txt}, adopted {args.adopt_floor} "
         "(init = the initialisation norm a·sqrt(k/3), a = sqrt(6/(F+k)): training grew the vector beyond where it started; median = the median unit norm) |",
         "| co-occurrence | field per pair from the units' record sets: exclusive / overlapping / nested / same-records; part-of = §4.3.1 containment — never a filter |",
         "| tie groups | complete linkage on the cosine distance of the entering units' weight vectors, cut at 1 − tau: every pair inside a group passes the gate; a partition (the pairwise record is the JSONL) |",
         "| renderings | one .metta per bottleneck at the adopted gate (passes grouped by relation, exclusive first); the cosine and floor dials are read off the records |\n",
         "## Count matrix\n",
         f"- {facts['n_records']} records × {F} units; {facts['nonzero']} non-zero cells ({facts['mean_units_per_record']} units per record on average); "
         f"{facts['repeats']} repeat matches beyond the first (max count {facts['max_count']}); {facts['truncated']} record(s) truncated at {MAX_REC_ATOMS} atoms by the miner's cap; "
         "column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly\n",
         "## Training\n", "| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |\n|---|---|---|---|---|---|---|---|"]
    for k, beta, s, st in training:
        R.append(f"| {k} | {beta:g} | {s} | {st['recon']} | {st['r2']} | {st['mean_activation']} | {st['active_units_per_record']} | "
                 f"{' / '.join(str(c[1]) for c in st['curve'])} |")
    R.append("\n## Norm floors and entering units\n")
    R.append("| k | beta | " + " | ".join(f"floor {kd} (units entering)" for kd in args.floor_list) + " |\n|---|---|" + "---|" * len(args.floor_list))
    for k in ks:
        for beta in betas:
            R.append(f"| {k} | {beta:g} | " + " | ".join(f"{floors_of[(k, beta)][kd]:.3f} ({facts['entering'][(k, beta)][kd]})" for kd in args.floor_list) + " |")
    R.append(f"\n## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `{args.adopt_floor}`)\n")
    R.append("| k | beta | cosine ≥ | pass | exclusive (shape-parallel) | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | "
             + " | ".join(f"pass / exclusive at floor {kd}" for kd in args.floor_list) + " |"
             + (" Tier A recall | control hits |" if key else "") + "\n|---|---|---|---|---|---|---|---|---|---|---|---|" + "---|" * len(args.floor_list) + ("---|---|" if key else ""))
    for k in ks:
        for beta in betas:
            for tau in args.cos_list:
                r = results[(k, beta, tau)]
                br = r["by_relation"]
                R.append(f"| {k} | {beta:g} | {tau:.2f} | {r['pass']} | {br.get('exclusive', 0)} ({r['parallel']}) | {br.get('overlapping', 0)} | {br.get('nested', 0)} | "
                         f"{br.get('same-records', 0)} | {r['part_of']} | {r['shared_mi']} | {r['stable_all']} | "
                         f"{f'{r['ties'][0]} ({r['ties'][1]} / {r['ties'][2]})' if r['ties'] is not None else '—'} | "
                         + " | ".join(f"{r['pass_by_floor'][kd]} / {r['excl_by_floor'][kd]}" for kd in args.floor_list) + " |"
                         + (f" {r['scorecard']['recall']} | {', '.join(r['scorecard']['control_hits']) or 'none'} |" if key else ""))
    rows = results[(args.adopt_bottleneck, args.adopt_beta)]
    fv_adopt = floors_of[(args.adopt_bottleneck, args.adopt_beta)][args.adopt_floor]
    ps = [r for r in rows if passes(r, args.adopt_cos, fv_adopt)]

    def sent(i):
        return texts.get(i, "")[:90]

    def table(title, rs):
        R.append(f"\n## Adopted block: k {args.adopt_bottleneck}, beta {args.adopt_beta:g}, cosine ≥ {args.adopt_cos:.2f}, floor {args.adopt_floor} — {title}\n")
        R.append("| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |\n|---|---|---|---|---|---|---|---|---|")
        for r in rs[:args.top]:
            ea = r["examples"][0] if r["examples"] else ""
            eb = (r["examples"][0] if r["n_both"] else (r["examples"][2] if len(r["examples"]) > 2 else ""))
            R.append(f"| {r['cosine']:.3f} | {r['stable_at'][f'{args.adopt_cos:.2f}']}/{args.seeds} | {r['relation']}{' (shape-parallel)' if r['parallel'] else ''}{' (part-of)' if r['part_of'] else ''} | "
                     f"{r['norm_a']:.2f} / {r['norm_b']:.2f} | `{r['query_a']}` ({r['n_a']}) | `{r['query_b']}` ({r['n_b']}) | {r['n_both']} | {sent(ea)} | {sent(eb)} |")
    table(f"top {args.top} EXCLUSIVE passes (the paper's interchangeability reading; shape-parallel ones are the rules)",
          sorted([r for r in ps if r["relation"] == "exclusive"], key=lambda r: (not r["parallel"], -r["cosine"], r["a"], r["b"])))
    table(f"top {args.top} co-occurrence passes (overlapping / nested / same-records)", [r for r in ps if r["relation"] != "exclusive"])
    if key:
        sc = results[(args.adopt_bottleneck, args.adopt_beta, args.adopt_cos)]["scorecard"]
        R.append("\n## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)\n")
        R.append("- an expected lemma pair counts as recovered when a PASS pair's two units mention the two lemmas as `(Member $e lemma)` atoms; "
                 "lexical control pairs (antonyms / near-misses) linked the same way are control hits\n")
        R.append(f"- adopted block: recall {sc['recall']}; recovered: {', '.join(sc['recovered']) or 'none'}; missed: {', '.join(sc['missed']) or 'none'}; "
                 f"control hits: {', '.join(sc['control_hits']) or 'none'}\n")
    rpath = os.path.join(args.out_dir, f"{args.stem}.md")
    open(rpath, "w", encoding="utf-8").write("\n".join(R) + "\n")
    print(f"-> {rpath}\n-> {os.path.join(args.out_dir, args.stem + '.metta')}"
          + (f" (+ dial blocks in {ddir}/)" if len(ks) * len(betas) > 1 else "") + f"  total {time.time() - t0:.0f}s")


if __name__ == "__main__":
    main()
