"""FUSE-NF wave 2 — §4.3.3 MI grouping + §4.3.5 linear autoencoder (degraded: 862 graphs).

Both methods run over the star-feature × sentence incidence matrix, where the feature
vocabulary is §4.3.1's mined pattern inventory (support >= 3). Per-record occurrence
counts are re-enumerated with EXACTLY the wave-1 abstraction (same helpers imported from
``frequent_stars``), so a feature here IS the wave-1 pattern, by construction.

§4.3.3 — pairwise MI over binary presence; **co-occurrence groups** (union-find over pairs
with doc-Jaccard >= --jaccard) are the meta-node candidates: features that fire together
are one semantic unit. Containment pairs (one pattern a sub-multiset of the other) are
tagged — a sub-pattern trivially co-occurs with its superset; the interesting members are
the non-contained ones.

§4.3.5 — the plan's "shallow AE" degrades deterministically to a LINEAR autoencoder =
truncated SVD of the binary matrix (numpy LAPACK; sign ambiguity cancels in cosines).
Feature embeddings = rows of V·S; **encoder-weight-tied features** = pairs with embedding
cosine >= --cos but doc-Jaccard <= --max-jacc: same contexts, never together —
interchangeability candidates that need NO paraphrase labels (this is what §4.3.4 cannot
see on unpaired Tier B/C text). Pairs whose two patterns differ in exactly one token
position also yield a symbol pair, cross-referenced against the gauntlet's validated
rules: corroboration vs novel.

Deterministic end to end. Outputs: out/mi_groups.jsonl, out/interchange.jsonl,
out/wave2_signals.jsonl, and a report.
"""

from __future__ import annotations

import argparse
import collections
import itertools
import json
import os
import re
import sys

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
MINING = os.path.dirname(HERE)
FUSENF = os.path.dirname(MINING)
sys.path.insert(0, MINING)
sys.path.insert(0, os.path.join(FUSENF, "harness"))

import canonicalize as C  # noqa: E402
import frequent_stars as FS  # noqa: E402


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def enumerate_record(rec, vocab, k, key_to_idx):
    """Per-record feature counts using the wave-1 enumeration verbatim."""
    counts = collections.Counter()
    catoms = rec["atoms"]
    parsed_heads = [C.parse_term(a["term"])[0] for a in catoms]
    surface = vocab["surface_record"]
    sat_class = {s: st.get("class") for s, st in rec["stars"].items()}
    for sym, star in sorted(rec["stars"].items()):
        if star["kind"] not in ("event", "entity") or not FS.RE_SKOLEM.fullmatch(sym):
            continue
        idxs = [i for i in star["atoms"] if parsed_heads[i] not in surface][:FS.MAX_STAR_ATOMS]
        stream = "event" if star["kind"] == "event" else "entity"
        for size in range(1, min(k, len(idxs)) + 1):
            for combo in itertools.combinations(idxs, size):
                ts = [(catoms[i]["term"], catoms[i]["stv"]) for i in combo]
                pat = FS.canonical_pattern(ts, sym, sat_class)
                fi = key_to_idx.get((stream, pat))
                if fi is not None:
                    counts[fi] += 1
    kind_idx = sorted(i for i, a in enumerate(catoms)
                      if not FS.RE_SKOLEM.search(a["term"])
                      and parsed_heads[i] != "Implication" and parsed_heads[i] not in surface)
    if kind_idx:
        connected = FS.kindlevel_components(kind_idx, catoms)
        for size in range(1, min(k, len(kind_idx)) + 1):
            for combo in itertools.combinations(kind_idx, size):
                if not connected(list(combo)):
                    continue
                ts = [(catoms[i]["term"], catoms[i]["stv"]) for i in combo]
                pat = FS.canonical_pattern(ts, "\x00none", sat_class)
                fi = key_to_idx.get(("kindlevel", pat))
                if fi is not None:
                    counts[fi] += 1
    return counts


def one_token_symbol_pair(atoms_a, atoms_b):
    if len(atoms_a) != len(atoms_b):
        return None
    diffs = []
    for x, y in zip(atoms_a, atoms_b):
        if x != y:
            tx, ty = re.findall(r"[^\s()]+", x), re.findall(r"[^\s()]+", y)
            if len(tx) != len(ty):
                return None
            d = [i for i in range(len(tx)) if tx[i] != ty[i]]
            if len(d) != 1:
                return None
            a, b = tx[d[0]], ty[d[0]]
            if a.startswith("$") and b.startswith("$") and ":" in a and ":" in b \
                    and a.split(":")[0] == b.split(":")[0]:
                diffs.append(tuple(sorted((a.split(":", 1)[1], b.split(":", 1)[1]))))
            elif not a.startswith(("$", "<")) and not b.startswith(("$", "<")):
                diffs.append(tuple(sorted((a, b))))
            else:
                return None
    return diffs[0] if len(set(diffs)) == 1 else None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical", nargs="+")
    ap.add_argument("--patterns", default=os.path.join(MINING, "out", "stars.jsonl"))
    ap.add_argument("--validated", default=os.path.join(FUSENF, "rules", "validated.jsonl"))
    ap.add_argument("--k", type=int, default=4)
    ap.add_argument("--svd-k", type=int, default=64)
    ap.add_argument("--jaccard", type=float, default=0.6, help="co-occurrence group threshold")
    ap.add_argument("--cos", type=float, default=0.8, help="AE embedding cosine threshold")
    ap.add_argument("--max-jacc", type=float, default=0.1, help="max co-occurrence for interchange")
    ap.add_argument("--min-docs", type=int, default=4)
    ap.add_argument("--report", default=os.path.join(FUSENF, "eval", "wave2.md"))
    args = ap.parse_args()

    pats = load(args.patterns)
    key_to_idx, feats = {}, []
    for p in pats:
        key_to_idx[(p["mode"], tuple(p["atoms"]))] = len(feats)
        feats.append(p)
    vocab = C.load_vocabulary()

    ids, rows = [], []
    seen = set()
    for path in args.canonical:
        for rec in load(path):
            if rec["id"] in seen:
                continue
            seen.add(rec["id"])
            ids.append(rec["id"])
            rows.append(enumerate_record(rec, vocab, args.k, key_to_idx))
    N, F = len(ids), len(feats)
    X = np.zeros((N, F), dtype=np.float32)
    for r, counts in enumerate(rows):
        for fi, c in counts.items():
            X[r, fi] = c
    B = (X > 0)
    docs = [frozenset(np.nonzero(B[:, f])[0].tolist()) for f in range(F)]
    keep = [f for f in range(F) if len(docs[f]) >= args.min_docs]

    # ---- §4.3.3 MI + co-occurrence groups ---------------------------------
    def mi(i, j):
        a, b = docs[i], docs[j]
        n11 = len(a & b)
        out = 0.0
        for nij, ni, nj in ((n11, len(a), len(b)),
                            (len(a) - n11, len(a), N - len(b)),
                            (len(b) - n11, N - len(a), len(b)),
                            (N - len(a) - len(b) + n11, N - len(a), N - len(b))):
            if nij > 0 and ni > 0 and nj > 0:
                out += (nij / N) * np.log2(nij * N / (ni * nj))
        return out

    parent = list(range(F))
    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x
    pair_stats = {}
    for ii, i in enumerate(keep):
        for j in keep[ii + 1:]:
            inter = len(docs[i] & docs[j])
            if not inter:
                continue
            jac = inter / len(docs[i] | docs[j])
            if jac >= args.jaccard:
                pair_stats[(i, j)] = (jac, mi(i, j))
                parent[find(i)] = find(j)
    groups = collections.defaultdict(list)
    for f in keep:
        if find(f) != f or any(find(g) == f for g in keep if g != f):
            groups[find(f)].append(f)
    mi_rows = []
    for root, members in sorted(groups.items()):
        if len(members) < 2:
            continue
        members = sorted(members, key=lambda f: (-len(docs[f]), f))
        sets = [collections.Counter(feats[f]["atoms"]) for f in members]
        contained = sum(1 for a, b in itertools.combinations(range(len(members)), 2)
                        if not (sets[a] - sets[b]) or not (sets[b] - sets[a]))
        mi_rows.append({
            "group_id": "mg%03d" % (len(mi_rows) + 1),
            "size": len(members),
            "support": len(docs[members[0]]),
            "members": [{"pattern_id": feats[f]["pattern_id"], "mode": feats[f]["mode"],
                         "atoms": feats[f]["atoms"], "docs": len(docs[f])} for f in members],
            "containment_pairs": contained,
            "pure_containment": contained == len(members) * (len(members) - 1) // 2,
        })
    mi_rows.sort(key=lambda g: (-g["support"], g["group_id"]))

    # ---- §4.3.5 linear AE (truncated SVD) ---------------------------------
    Xb = B.astype(np.float32)
    kdim = min(args.svd_k, min(N, F) - 1)
    U, S, Vt = np.linalg.svd(Xb, full_matrices=False)
    emb = (Vt[:kdim].T * S[:kdim])          # F × k feature embeddings
    norm = np.linalg.norm(emb, axis=1)
    inter_rows = []
    val_pairs = set()
    for v in load(args.validated):
        if v.get("kind") == "lexical-collapse":
            m = re.findall(r"\(Member \$\w+ ([a-z][a-z0-9_]*)\)", v["lhs"][0] + " " + v["rhs"][0])
            if len(m) == 2:
                val_pairs.add(tuple(sorted(m)))
    for ii, i in enumerate(keep):
        if norm[i] == 0:
            continue
        for j in keep[ii + 1:]:
            if norm[j] == 0 or feats[i]["mode"] != feats[j]["mode"]:
                continue
            inter = len(docs[i] & docs[j])
            jac = inter / len(docs[i] | docs[j])
            if jac > args.max_jacc:
                continue
            cos = float(emb[i] @ emb[j] / (norm[i] * norm[j]))
            if cos < args.cos:
                continue
            sp = one_token_symbol_pair(feats[i]["atoms"], feats[j]["atoms"])
            inter_rows.append({
                "a": feats[i]["pattern_id"], "b": feats[j]["pattern_id"],
                "atoms_a": feats[i]["atoms"], "atoms_b": feats[j]["atoms"],
                "cosine": round(cos, 3), "doc_jaccard": round(jac, 3),
                "docs_a": len(docs[i]), "docs_b": len(docs[j]),
                "symbol_pair": list(sp) if sp else None,
                "corroborates_validated": bool(sp and sp in val_pairs),
            })
    inter_rows.sort(key=lambda r: (-r["cosine"], r["a"], r["b"]))

    out_dir = os.path.join(MINING, "out")
    with open(os.path.join(out_dir, "mi_groups.jsonl"), "w", encoding="utf-8") as fh:
        for g in mi_rows:
            fh.write(json.dumps(g, ensure_ascii=False, sort_keys=True) + "\n")
    with open(os.path.join(out_dir, "interchange.jsonl"), "w", encoding="utf-8") as fh:
        for r in inter_rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    n_sig = 0
    with open(os.path.join(out_dir, "wave2_signals.jsonl"), "w", encoding="utf-8") as fh:
        for g in mi_rows:
            if g["pure_containment"]:
                continue
            n_sig += 1
            fh.write(json.dumps({
                "candidate": {"group_id": g["group_id"],
                              "members": [m["pattern_id"] for m in g["members"]]},
                "confidence": round(g["support"] / (g["support"] + 10.0), 3),
                "kind": "subtree-collapse", "support": g["support"],
                "method": "mi-grouping-4.3.3"}, sort_keys=True) + "\n")
        for r in inter_rows:
            n_sig += 1
            fh.write(json.dumps({
                "candidate": {"a": r["a"], "b": r["b"], "symbol_pair": r["symbol_pair"]},
                "confidence": r["cosine"], "kind": "lexical-collapse",
                "support": min(r["docs_a"], r["docs_b"]),
                "corroborates_validated": r["corroborates_validated"],
                "method": "autoencoder-4.3.5"}, sort_keys=True) + "\n")

    novel = [r for r in inter_rows if r["symbol_pair"] and not r["corroborates_validated"]]
    corro = [r for r in inter_rows if r["corroborates_validated"]]
    L = ["# Wave 2 — §4.3.3 MI grouping + §4.3.5 linear AE (degraded: %d graphs)\n" % N]
    L.append(f"- matrix: {N} records × {F} wave-1 features ({len(keep)} with docs>={args.min_docs})")
    L.append(f"- MI co-occurrence groups (jaccard>={args.jaccard}): {len(mi_rows)} "
             f"({sum(1 for g in mi_rows if not g['pure_containment'])} non-pure-containment)")
    L.append(f"- AE interchange pairs (cos>={args.cos}, jacc<={args.max_jacc}): {len(inter_rows)}"
             f" — {len(corro)} corroborate validated rules, {len(novel)} novel symbol pairs\n")
    L.append("## Top MI groups (meta-node candidates)\n")
    L.append("| support | size | containment | members |\n|---|---|---|---|")
    for g in mi_rows[:15]:
        mm = "<br>".join("`%s` %s" % (m["pattern_id"], " + ".join(m["atoms"])[:90])
                         for m in g["members"][:4])
        L.append(f"| {g['support']} | {g['size']} | "
                 f"{'pure' if g['pure_containment'] else 'MIXED'} | {mm} |")
    L.append("\n## AE interchangeability — corroborations of validated rules\n")
    L.append("| cos | jacc | pair | symbol pair |\n|---|---|---|---|")
    for r in corro[:15]:
        L.append(f"| {r['cosine']:.2f} | {r['doc_jaccard']:.2f} | {r['a']}~{r['b']} "
                 f"| {'/'.join(r['symbol_pair'])} |")
    L.append("\n## AE interchangeability — novel candidates (no wave-1 rule)\n")
    L.append("| cos | jacc | docs | atoms A | atoms B | symbol pair |\n|---|---|---|---|---|---|")
    for r in novel[:20]:
        L.append(f"| {r['cosine']:.2f} | {r['doc_jaccard']:.2f} | {r['docs_a']}/{r['docs_b']} "
                 f"| {' + '.join(r['atoms_a'])[:60]} | {' + '.join(r['atoms_b'])[:60]} "
                 f"| {'/'.join(r['symbol_pair']) if r['symbol_pair'] else '—'} |")
    text = "\n".join(L) + "\n"
    open(args.report, "w", encoding="utf-8").write(text)
    print(f"-> {args.report}")
    print(f"matrix {N}x{F}  mi-groups {len(mi_rows)}  interchange {len(inter_rows)} "
          f"(corroborate {len(corro)}, novel {len(novel)})  signals {n_sig}")


if __name__ == "__main__":
    main()
