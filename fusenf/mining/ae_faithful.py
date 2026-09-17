"""FUSE-NF §4.3.5 Autoencoder Analysis — FAITHFUL arm (H, 2026-09-17; owner design 2026-09-16/17).

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
             single thread, fixed seed -> byte-identical re-runs.
Ties       = cosine between two units' ENCODER weight vectors (the columns of W, k-dimensional);
             gate cosine >= tau (dial); every pair at or above ``--record-floor`` is written to the
             JSONL with its co-occurrence relation as a FIELD (exclusive / overlapping / nested /
             same-records; part-of = structural containment) — never a filter. Seeds 1..S-1 retrain
             the same model; ``stable_at`` counts the seeds in which the pair also clears each tau.
Clusters   = agglomerative average linkage on the cosine distance of the weight vectors, cut at
             1 - tau — a rendering (the gate is pairwise).

Outputs (in --out-dir; <stem> = ae_faithful):
  ae_counts.csv                                 the count matrix, records x units   [--intermediates]
  <stem>_weights/k<k>_beta<b>_seed<s>.tsv       one encoder weight vector per unit  [--intermediates]
  clusters/clusters_ae_k<k>_beta<b>_<tau>.txt   clusters, members as MeTTa queries  [--intermediates]
  <stem>.jsonl  (adopted k, beta; seed 0)        the record: every pair >= floor with fields
  <stem>_dial/k<k>_beta<b>.jsonl                the same for the other (k, beta) points
  <stem>.metta  (adopted k, beta; gate = adopted tau)   readable rendering, PASS pairs grouped by relation
  <stem>_dial/k<k>_beta<b>.metta                (exclusive first) then near misses (--metta-near); every
                                                record shows its cosine, so the tau dial is the reader's;
                                                the .md carries the counts per tau; never loaded
  The plain shallow AE (beta 0) is its own twin run:  --bottleneck 32 --beta 0 --adopt-beta 0 --stem ae_faithful_plain
  <stem>.md                                     parameters, matrix facts, training table, dial table,
                                                top pairs with sentences, Tier A scorecard (--key)

Usage:
  python ae_faithful.py [--units out_h/patterns2_faithful.jsonl] [--canonical canonical_substrate.jsonl]
      [--out-dir out_h] [--bottleneck 16,32,64 --adopt-bottleneck 32] [--beta 0.5 --adopt-beta 0.5]
      [--cos 0.80,0.85,0.90,0.95 --adopt-cos 0.85] [--record-floor 0.5] [--seeds 5] [--epochs 2000]
      [--intermediates matrix,weights,clusters | none] [--key out_ecmp/tierA_slot_key.json]
"""
from __future__ import annotations

import argparse
import collections
import csv
import glob
import itertools
import json
import math
import os
import sys
import time

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(FUSENF, "harness"))
import canonicalize as C  # noqa: E402
from frequent_patterns2 import Enumerator, canonical_pattern2, load, MAX_REC_ATOMS  # noqa: E402
from patterns2_faithful import contains  # noqa: E402

PAPER = ("We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a "
         "low-dimensional bottleneck. Input features whose activations are tied together in the encoder "
         "weights indicate clusters of subtrees that serve interchangeable semantic functions — another "
         "source of consolidation rules.")


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
def train_ae(X, k, beta, rho, weight_decay, lr, epochs, seed, threads, log_every):
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
            curve.append((ep, round(float(recon.detach()), 4), round(float(loss.detach()), 4)))
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


def build_pairs(units, C0, Cs, norms, floor, taus, texts):
    F = len(units)
    iu, ju = np.triu_indices(F, k=1)
    keep = C0[iu, ju] >= floor - 1e-9
    rows = []
    for f, g in zip(iu[keep], ju[keep]):
        ua, ub = units[f], units[g]
        if (ua["support"], ub["query"]) < (ub["support"], ua["query"]):   # A = larger support (tie: query order)
            ua, ub, f, g = ub, ua, g, f
        rel, n_both = relation_of(ua["idset"], ub["idset"])
        part = bool(contains(ua["atoms"], ub["atoms"]) or contains(ub["atoms"], ua["atoms"]))
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
            "relation": rel, "part_of": part, "cosine": cos[0], "cosines": cos,
            "stable_at": {f"{t:.2f}": sum(1 for cv in cos if cv >= t - 1e-9) for t in taus},
            "norm_a": round(float(norms[f]), 4), "norm_b": round(float(norms[g]), 4),
            "examples": examples,
            "variant": "faithful", "gate": "cosine",
        })
    rows.sort(key=lambda r: (-r["cosine"], r["a"], r["b"]))
    return rows


def score_key(key, rows, tau):
    """Tier A: an expected / control lemma pair is linked when a PASS pair's units mention the two lemmas."""
    def lemmas(q):
        return set(m for m in __import__("re").findall(r"\(Member \$e\d+ ([a-z][a-z0-9_]*)\)", q))
    linked = set()
    for r in rows:
        if r["cosine"] < tau - 1e-9:
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


def write_clusters(path, W, units, tau, label):
    from scipy.cluster.hierarchy import fcluster, linkage
    from scipy.spatial.distance import pdist
    norms = np.linalg.norm(W, axis=0)
    Wn = (W / np.where(norms > 0, norms, 1.0)).T.astype(np.float64)
    if tau >= 1.0:
        lab = np.arange(len(units))
    else:
        tree = linkage(pdist(Wn, metric="cosine"), method="average")
        lab = fcluster(tree, t=1.0 - tau, criterion="distance")
    members = collections.defaultdict(list)
    for f, cl in enumerate(lab):
        members[int(cl)].append(units[f]["query"])
    groups = sorted((sorted(ms, key=lambda q: (q.lower(), q)) for ms in members.values()),
                    key=lambda ms: (-len(ms), ms[0].lower(), ms[0]))
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(f";; {len(groups)} clusters of {len(units)} units at cosine {tau:.2f} — agglomerative, average linkage on "
                 f"the cosine distance of the encoder weight vectors ({label}); clusters by size, members by query; "
                 "singletons included\n\n")
        for n, ms in enumerate(groups, 1):
            fh.write(f";; cluster #{n}\n" + "\n".join(ms) + "\n\n")
    return len(groups)


def write_jsonl(path, rows, k, beta, adopt_tau):
    with open(path, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(dict(r, **{"pass": r["cosine"] >= adopt_tau - 1e-9,
                                           "method": f"autoencoder-4.3.5/k{k}_beta{beta:g}"}),
                                ensure_ascii=False, sort_keys=True) + "\n")


ORDER = ("exclusive", "overlapping", "nested", "same-records")


def write_metta(path, args, rows, units, k, beta, tau, is_main, facts, stats, n_seeds):
    F = len(units)
    n_pairs = F * (F - 1) // 2
    passes = [r for r in rows if r["cosine"] >= tau - 1e-9]
    passes.sort(key=lambda r: (ORDER.index(r["relation"]), -r["cosine"], r["a"], r["b"]))
    near = [r for r in rows if tau - args.metta_near - 1e-9 <= r["cosine"] < tau - 1e-9]
    cnt = collections.Counter(r["relation"] for r in passes)
    stem = os.path.splitext(os.path.basename(path))[0]
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(";; FUSE-NF §4.3.5 Autoencoder Analysis — FAITHFUL arm — readable MeTTa RENDERING\n"
                 ";; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is\n"
                 f";;   {args.stem}.jsonl (adopted k / beta) and {args.stem}_dial/k<k>_beta<b>.jsonl   (every pair with cosine >= {args.record_floor})\n"
                 f";;   {args.stem}_weights/k<k>_beta<b>_seed<s>.tsv   (one encoder weight vector per unit)\n;;\n")
        if is_main:
            fh.write(f";; BLOCK: bottleneck {k}, sparsity beta {beta:g}, gate cosine >= {tau:.2f} — the adopted setting. The other "
                     f"bottlenecks of the dial:\n;;   {args.stem}_dial/k<k>_beta<b>.metta   (the cosine dial needs no extra files: every record shows\n"
                     ";;   its cosine, and the .md counts the passes per threshold)\n;;\n")
        else:
            fh.write(f";; BLOCK: bottleneck {k}, sparsity beta {beta:g}, gate cosine >= {tau:.2f} — one point of the dial; the adopted "
                     f"setting (k {args.adopt_bottleneck}, beta {args.adopt_beta:g}, cosine {args.adopt_cos:.2f}) is\n"
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
                 f";;                   this block: reconstruction {stats['recon']} per record, R^2 {stats['r2']}, mean activation {stats['mean_activation']}\n"
                 f";;   ties            cosine between the two units' encoder weight vectors (the columns of W, {k}-dimensional);\n"
                 f";;                   gate cosine >= {tau:.2f} (dial {', '.join(f'{t:.2f}' for t in args.cos_list)}); recording floor {args.record_floor}\n"
                 f";;   co-occurrence   from the units' record sets: exclusive (no shared record) / overlapping / nested / same-records;\n"
                 ";;                   part-of = one unit's atoms embed in the other's (§4.3.1 containment) — a FIELD, never a filter\n"
                 ";;   clusters        average linkage on the cosine distance of the weight vectors, cut at 1 - tau (rendering only)\n;;\n"
                 ";; RECORD FORMAT (every record is one pair, with its gate verdict)\n"
                 ";;   ;; [relation(, part-of)]  A ~ B   cosine <seed 0> (seeds <n>/<S> >= tau)   records <A> / <B> / <shared>   norms <A> / <B>   gate: PASS|FAIL\n"
                 ";;   ;;   A: <query A>   e.g. <witness record ids>\n"
                 ";;   ;;   B: <query B>\n"
                 ";;   (Implication <B> <A>)\n"
                 ";;     = the consolidation as the rule it would become: the minority unit (smaller support) rewrites to the majority\n"
                 ";;     unit; variables as each unit's own canonical naming (an exclusive pair shares no record, so no alignment\n"
                 ";;     is observable); naming and direction provisional, the gauntlet decides. Rendered for PASS and FAIL alike.\n"
                 ";; A is the unit with the larger support (tie: query order). PASS pairs grouped by relation — EXCLUSIVE first (the\n"
                 ";; paper's interchangeability reading: the two units never share a record), then OVERLAPPING, NESTED and SAME-RECORDS\n"
                 ";; (co-occurrence: these restate §4.3.3 / §4.3.1 and are corroboration, not new rules) — each group by cosine;\n"
                 + (f";; then the near misses (cosine within {args.metta_near:g} below the gate).\n" if args.metta_near > 0 else
                    ";; near misses are in the JSONL (every pair at or above the recording floor).\n"))
        fh.write(f"\n;; ==================== TIED PAIRS: {len(passes)} pass the gate — exclusive {cnt['exclusive']}, overlapping "
                 f"{cnt['overlapping']}, nested {cnt['nested']}, same-records {cnt['same-records']}"
                 + (f"; + {len(near)} near misses listed" if near else "")
                 + f" — among the {n_pairs} pairs of {F} units; {len(rows)} pairs recorded in the JSONL ====================\n")
        for r in passes + near:
            ok = r["cosine"] >= tau - 1e-9
            tag = r["relation"] + (", part-of" if r["part_of"] else "")
            fh.write(f"\n;; [{tag}]  {r['a']} ~ {r['b']}   cosine {r['cosine']:.4f} (seeds {r['stable_at'][f'{tau:.2f}']}/{n_seeds} >= {tau:.2f})"
                     f"   records {r['n_a']} / {r['n_b']} / {r['n_both']}   norms {r['norm_a']:.2f} / {r['norm_b']:.2f}   gate: {'PASS' if ok else 'FAIL'}\n")
            fh.write(f";;   A: {r['query_a']}   e.g. {' '.join(r['examples'])}\n;;   B: {r['query_b']}\n"
                     f"(Implication {r['query_b']} {r['query_a']})\n")


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
    ap.add_argument("--bottleneck", default="16,32,64", help="bottleneck dial")
    ap.add_argument("--adopt-bottleneck", type=int, default=32)
    ap.add_argument("--beta", default="0.5", help="sparsity weight(s); 0 = the plain shallow AE (run it as the twin: "
                                                   "--bottleneck 32 --beta 0 --adopt-beta 0 --stem ae_faithful_plain)")
    ap.add_argument("--adopt-beta", type=float, default=0.5)
    ap.add_argument("--rho", type=float, default=0.1, help="sparsity target activation")
    ap.add_argument("--weight-decay", type=float, default=1e-4)
    ap.add_argument("--lr", type=float, default=0.01)
    ap.add_argument("--epochs", type=int, default=2000)
    ap.add_argument("--seeds", type=int, default=5, help="seed 0 adopted; seeds 1..S-1 for the stability count")
    ap.add_argument("--threads", type=int, default=8, help="torch CPU threads (re-runs are byte-identical for a fixed count)")
    ap.add_argument("--cos", default="0.80,0.85,0.90,0.95", help="cosine gate dial")
    ap.add_argument("--adopt-cos", type=float, default=0.85)
    ap.add_argument("--record-floor", type=float, default=0.8, help="pairs at or above this cosine (seed 0) enter the JSONL "
                                                                     "(default = the lowest gate on the cosine dial)")
    ap.add_argument("--metta-near", type=float, default=0.0, help="FAIL pairs listed in the rendering: cosine within this below the gate (0 = passes only)")
    ap.add_argument("--intermediates", default="matrix,weights,clusters",
                    help="comma list of matrix,weights,clusters — or 'none'")
    ap.add_argument("--top", type=int, default=25, help="pairs shown with sentences in the .md")
    args = ap.parse_args()
    args.cos_list = [float(x) for x in args.cos.split(",")]
    ks = [int(x) for x in args.bottleneck.split(",")]
    betas = [float(x) for x in args.beta.split(",")]
    inter = set() if args.intermediates.strip() == "none" else {s.strip() for s in args.intermediates.split(",") if s.strip()}
    if args.adopt_bottleneck not in ks or all(abs(args.adopt_beta - b) > 1e-12 for b in betas) \
            or all(abs(args.adopt_cos - t) > 1e-9 for t in args.cos_list):
        raise SystemExit("the adopted bottleneck / beta / cosine must be on their dials")

    t0 = time.time()
    units = load_units(args.units)
    records = load_records(args.canonical)
    X, truncated = build_counts(records, units, args.k)
    verify_counts(X, records, units)
    facts = {"units_file": os.path.relpath(args.units, HERE), "canonical_file": os.path.relpath(args.canonical, HERE),
             "n_records": len(records), "n_units": len(units), "nonzero": int((X > 0).sum()),
             "repeats": int(X.sum() - (X > 0).sum()), "truncated": truncated,
             "max_count": int(X.max()), "mean_units_per_record": round(float((X > 0).sum(1).mean()), 2)}
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
    cdir = os.path.join(args.out_dir, "clusters")
    ddir = os.path.join(args.out_dir, f"{args.stem}_dial")
    os.makedirs(ddir, exist_ok=True)
    if "weights" in inter:
        os.makedirs(wdir, exist_ok=True)
    if "clusters" in inter:
        os.makedirs(cdir, exist_ok=True)

    results = {}
    training = []
    for k in ks:
        for beta in betas:
            Ws, stats0 = [], None
            for s in range(args.seeds):
                t1 = time.time()
                W, st = train_ae(X, k, beta, args.rho, args.weight_decay, args.lr, args.epochs, s, args.threads,
                                 log_every=max(1, args.epochs // 4))
                Ws.append(W)
                training.append((k, beta, s, st, round(time.time() - t1, 1)))
                if s == 0:
                    stats0 = st
                if "weights" in inter:
                    write_weights(os.path.join(wdir, f"k{k}_beta{beta:g}_seed{s}.tsv"), W, units)
                print(f"k {k} beta {beta:g} seed {s}: recon {st['recon']} R2 {st['r2']} act {st['mean_activation']} "
                      f"({time.time() - t1:.1f}s)" + (f"  curve {st['curve']}" if s == 0 else ""))
            Cs, norms = [], None
            for W in Ws:
                Cm, nm = cosine_matrix(W)
                Cs.append(Cm)
                if norms is None:
                    norms = nm
            rows = build_pairs(units, Cs[0], Cs, norms, args.record_floor, args.cos_list, texts)
            is_adopted = (k == args.adopt_bottleneck and abs(beta - args.adopt_beta) < 1e-12)
            jpath = os.path.join(args.out_dir, f"{args.stem}.jsonl") if is_adopted else os.path.join(ddir, f"k{k}_beta{beta:g}.jsonl")
            write_jsonl(jpath, rows, k, beta, args.adopt_cos)
            mpath = os.path.join(args.out_dir, f"{args.stem}.metta") if is_adopted else os.path.join(ddir, f"k{k}_beta{beta:g}.metta")
            write_metta(mpath, args, rows, units, k, beta, args.adopt_cos, is_adopted, facts, stats0, args.seeds)
            norm_median = float(np.median(norms))
            for tau in args.cos_list:
                n_cl = None
                if "clusters" in inter:
                    n_cl = write_clusters(os.path.join(cdir, f"clusters_ae_k{k}_beta{beta:g}_{tau:.2f}.txt"), Ws[0], units, tau,
                                          f"bottleneck {k}, beta {beta:g}, seed 0")
                passes = [r for r in rows if r["cosine"] >= tau - 1e-9]
                results[(k, beta, tau)] = {
                    "pass": len(passes), "by_relation": dict(collections.Counter(r["relation"] for r in passes)),
                    "part_of": sum(1 for r in passes if r["part_of"]),
                    "stable_all": sum(1 for r in passes if r["stable_at"][f"{tau:.2f}"] == args.seeds),
                    "low_norm": sum(1 for r in passes if min(r["norm_a"], r["norm_b"]) < norm_median),
                    "shared_mi": sum(1 for r in passes if frozenset((r["a"], r["b"])) in mi_pass),
                    "clusters": n_cl, "recorded": len(rows),
                    "scorecard": score_key(key, rows, tau) if key else None,
                    "norm_min": round(float(norms.min()), 3), "norm_median": round(float(np.median(norms)), 3),
                }
            results[(k, beta)] = rows
            print(f"k {k} beta {beta:g}: {len(rows)} pairs >= {args.record_floor}; pass at "
                  + ", ".join(f"{t:.2f}: {results[(k, beta, t)]['pass']}" for t in args.cos_list))

    # ---- markdown report ----
    R = ["# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)\n", f"> \"{PAPER}\" — FUSE-NF §4.3.5\n",
         "## Implementation parameters (doc-open choices, disclosed)\n", "| parameter | choice |\n|---|---|",
         f"| features | the {facts['n_units']} rooted-subtree units of the §4.3.1 faithful view (`{facts['units_file']}`), taken as-is: "
         "subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |",
         f"| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator "
         f"(k = {args.k}, {MAX_REC_ATOMS} eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |",
         f"| autoencoder | one hidden layer of k sigmoid units (dial {ks}, adopted {args.adopt_bottleneck}), linear output, tied decoder x_hat = h W + c; "
         "W uniform(±sqrt(6/(F+k))), b = 0, c = column means |",
         f"| loss | mean over records of the squared reconstruction error summed over units + {args.weight_decay:g}·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), "
         f"rho {args.rho:g}, beta dial {betas} (0 = plain shallow AE), adopted {args.adopt_beta:g} |",
         f"| training | full batch, Adam lr {args.lr:g}, {args.epochs} epochs, float32, {args.threads} thread(s); seed 0 adopted, seeds 0..{args.seeds - 1} for stability |",
         f"| ties | cosine between two units' encoder weight vectors (columns of W); gate cosine ≥ tau, dial {args.cos_list}, adopted {args.adopt_cos:.2f}; "
         f"recording floor {args.record_floor} |",
         "| co-occurrence | field per pair from the units' record sets: exclusive / overlapping / nested / same-records; part-of = §4.3.1 containment — never a filter |",
         "| clusters | average linkage on the cosine distance of the weight vectors, cut at 1 − tau (rendering only; the gate is pairwise) |",
         f"| renderings | one .metta per bottleneck at the adopted gate (passes grouped by relation, exclusive first); the cosine dial is read off the records; "
         f"the plain shallow AE (beta 0) is the twin run `{args.stem}_plain.*` when present |\n",
         "## Count matrix\n",
         f"- {facts['n_records']} records × {facts['n_units']} units; {facts['nonzero']} non-zero cells ({facts['mean_units_per_record']} units per record on average); "
         f"{facts['repeats']} repeat matches beyond the first (max count {facts['max_count']}); {facts['truncated']} record(s) truncated at {MAX_REC_ATOMS} atoms by the miner's cap; "
         "column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly\n",
         "## Training\n", "| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at 25 / 50 / 75 / 100 % of the epochs |\n|---|---|---|---|---|---|---|---|"]
    for k, beta, s, st, secs in training:
        R.append(f"| {k} | {beta:g} | {s} | {st['recon']} | {st['r2']} | {st['mean_activation']} | {st['active_units_per_record']} | "
                 f"{' / '.join(str(c[1]) for c in st['curve'])} |")
    R.append("\n## Tied pairs across the dial\n")
    R.append("| k | beta | cosine ≥ | pass | exclusive | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | smaller side below the median norm | clusters | weight norm min / median |"
             + (" Tier A recall | control hits |" if key else "") + "\n|---|---|---|---|---|---|---|---|---|---|---|---|---|---|" + ("---|---|" if key else ""))
    for k in ks:
        for beta in betas:
            for tau in args.cos_list:
                r = results[(k, beta, tau)]
                br = r["by_relation"]
                R.append(f"| {k} | {beta:g} | {tau:.2f} | {r['pass']} | {br.get('exclusive', 0)} | {br.get('overlapping', 0)} | {br.get('nested', 0)} | "
                         f"{br.get('same-records', 0)} | {r['part_of']} | {r['shared_mi']} | {r['stable_all']} | {r['low_norm']} | {r['clusters'] if r['clusters'] is not None else '—'} | "
                         f"{r['norm_min']} / {r['norm_median']} |"
                         + (f" {r['scorecard']['recall']} | {', '.join(r['scorecard']['control_hits']) or 'none'} |" if key else ""))
    rows = results[(args.adopt_bottleneck, args.adopt_beta)]
    passes = [r for r in rows if r["cosine"] >= args.adopt_cos - 1e-9]
    def sent(i):
        return texts.get(i, "")[:90]

    def table(title, rs):
        R.append(f"\n## Adopted block: k {args.adopt_bottleneck}, beta {args.adopt_beta:g}, cosine ≥ {args.adopt_cos:.2f} — {title}\n")
        R.append("| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |\n|---|---|---|---|---|---|---|---|---|")
        for r in rs[:args.top]:
            ea = r["examples"][0] if r["examples"] else ""
            eb = (r["examples"][0] if r["n_both"] else (r["examples"][2] if len(r["examples"]) > 2 else ""))
            R.append(f"| {r['cosine']:.3f} | {r['stable_at'][f'{args.adopt_cos:.2f}']}/{args.seeds} | {r['relation']}{' (part-of)' if r['part_of'] else ''} | "
                     f"{r['norm_a']:.2f} / {r['norm_b']:.2f} | `{r['query_a']}` ({r['n_a']}) | `{r['query_b']}` ({r['n_b']}) | {r['n_both']} | {sent(ea)} | {sent(eb)} |")
    table(f"top {args.top} EXCLUSIVE passes (the paper's interchangeability reading)", [r for r in passes if r["relation"] == "exclusive"])
    table(f"top {args.top} co-occurrence passes (overlapping / nested / same-records)", [r for r in passes if r["relation"] != "exclusive"])
    if key:
        sc = results[(args.adopt_bottleneck, args.adopt_beta, args.adopt_cos)]["scorecard"]
        R.append("\n## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)\n")
        R.append("- an expected lemma pair counts as recovered when a PASS pair's two units mention the two lemmas as `(Member $e lemma)` atoms; "
                 "lexical control pairs (antonyms / near-misses) linked the same way are control hits\n")
        R.append(f"- adopted block: recall {sc['recall']}; recovered: {', '.join(sc['recovered']) or 'none'}; missed: {', '.join(sc['missed']) or 'none'}; "
                 f"control hits: {', '.join(sc['control_hits']) or 'none'}\n")
    rpath = os.path.join(args.out_dir, f"{args.stem}.md")
    open(rpath, "w", encoding="utf-8").write("\n".join(R) + "\n")
    print(f"-> {rpath}\n-> {os.path.join(args.out_dir, args.stem + '.metta')} (+ dial blocks in {ddir}/)  total {time.time() - t0:.0f}s")


if __name__ == "__main__":
    main()
