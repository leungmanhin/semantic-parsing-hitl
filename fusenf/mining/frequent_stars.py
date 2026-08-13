"""FUSE-NF §4.3.1 — frequent stars / sub-stars (wave 1).

Enumerates connected sub-stars up to ``--k`` atoms over the canonicalizer's star
decomposition, counts DOCUMENT support (distinct corpus ids), thresholds at
``--min-support``, and emits the candidate vocabulary the rest of §4.3 composes
over: patterns file + typed subtree-collapse signals (PLAN.md §6) + a report.

(The plan's file layout names this ``m1_stars.py``; renamed — ``m1``/``m2`` are
metric names in eval/, and a second m1 would be a landmine.)

Two enumeration modes, disjoint by construction:

* **skolem-centered** — every event/entity star whose center is a canonical
  skolem (``e0``/``x0``). All of a star's atoms mention its center, so every
  subset is connected. The center becomes ``$C``; satellite skolems become
  stream-typed wildcards carrying the satellite's class when the canonicalizer
  assigned one (``$x0:pie``) — that is what makes a light-verb unit
  ("(Member $C take) (Theme $C $x0:walk)") minable without multi-star joins.
* **kind-level** — atoms mentioning NO skolem ("(Inheritance swan white)")
  never enter a skolem star; they are mined as connected subsets (connectivity
  = shared symbol) of each record's skolem-free atoms, keyed by the atoms
  alone (no center).

Abstraction, applied identically everywhere: numbers -> ``<num>``, string
literals -> ``<str>``, and an atom whose strength is below 0.5 carries a
``~NEG`` marker — a strength-0 denial must never pool with its positive twin
(Tier A's negative controls exist to catch exactly that). Constants stay
verbatim: lexical identity is the point; shape-level mining is a later
granularity. Satellite numbering is exact-canonical (minimum over per-stream
permutations), so the same sub-star never splits on renaming accidents.

Deterministic end to end: sorted iteration, no clock, no randomness; rerunning
on the same inputs is byte-identical. Mixed canon versions are refused.

Usage:
  python frequent_stars.py ../canonical/tierA.canon.jsonl [more.canon.jsonl ...] \
      [--k 4] [--min-support 3] [--out-dir out] [--report ../eval/stars_wave1.md]
"""

from __future__ import annotations

import argparse
import collections
import itertools
import json
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir, "harness"))
import canonicalize as C  # noqa: E402

RE_SKOLEM = re.compile(r"(?<![\w$])([exf])(\d+)(?![\w])")
RE_NUM = re.compile(r"(?<![\w$])[+-]?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?(?![\w])")
RE_STR = re.compile(r'"[^"]*"')
MAX_STAR_ATOMS = 20          # per-star cap before subset enumeration (deterministic prefix)
MAX_ASSIGNMENTS = 5040       # cap on per-stream permutation products; beyond -> first-appearance

TIER_RE = re.compile(r"^(tier[A-Z]|pilot|probe)")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def tier_of(cid):
    m = TIER_RE.match(cid)
    return m.group(1) if m else "?"


def abstract_atom(term, stv, center, sat_names):
    """One atom -> pattern text. ``sat_names``: satellite skolem token -> wildcard."""
    def sub(m):
        tok = m.group(0)
        if tok == center:
            return "$C"
        return sat_names.get(tok, tok)
    text = RE_SKOLEM.sub(sub, term)
    text = RE_STR.sub("<str>", text)
    text = RE_NUM.sub("<num>", text)
    if stv[0] < 0.5:
        text += " ~NEG"
    return text


def canonical_pattern(terms_stvs, center, sat_class):
    """Exact-minimal abstraction of one atom subset.

    Satellite wildcard numbering is chosen as the assignment (per stream,
    product across streams) whose sorted rendering is lexicographically
    smallest — the subset's identity can never depend on which satellite the
    canonicalizer happened to call x0.
    """
    sats = collections.OrderedDict()
    for term, _ in terms_stvs:
        for m in RE_SKOLEM.finditer(term):
            tok = m.group(0)
            if tok != center and tok not in sats:
                sats[tok] = m.group(1)
    by_stream = collections.defaultdict(list)
    for tok, stream in sats.items():
        by_stream[stream].append(tok)

    def render(assign):
        names = {}
        for tok, stream in sats.items():
            suffix = ":" + sat_class[tok] if sat_class.get(tok) else ""
            names[tok] = "$%s%d%s" % (stream, assign[tok], suffix)
        return tuple(sorted(abstract_atom(t, s, center, names) for t, s in terms_stvs))

    n_assignments = 1
    for toks in by_stream.values():
        for i in range(2, len(toks) + 1):
            n_assignments *= i
    if n_assignments > MAX_ASSIGNMENTS:
        assign = {}
        for stream in sorted(by_stream):
            for i, tok in enumerate(by_stream[stream]):
                assign[tok] = i
        return render(assign)

    best = None
    streams = sorted(by_stream)
    perm_sets = [list(itertools.permutations(range(len(by_stream[s])))) for s in streams]
    for combo in itertools.product(*perm_sets):
        assign = {}
        for s_i, stream in enumerate(streams):
            for pos, tok in enumerate(by_stream[stream]):
                assign[tok] = combo[s_i][pos]
        cand = render(assign)
        if best is None or cand < best:
            best = cand
    return best if best is not None else tuple(sorted(
        abstract_atom(t, s, center, {}) for t, s in terms_stvs))


def kindlevel_components(atoms_idx, catoms):
    """Connected subsets (shared symbol) of a record's skolem-free atoms."""
    syms = {}
    for i in atoms_idx:
        syms[i] = set(re.findall(r"(?<![\w$<\"])[a-z][a-z0-9_]*(?![\w])",
                                 RE_STR.sub("", catoms[i]["term"])))
    def connected(subset):
        if len(subset) == 1:
            return True
        remaining = set(subset)
        frontier = [subset[0]]
        remaining.discard(subset[0])
        while frontier:
            cur = frontier.pop()
            linked = [j for j in list(remaining) if syms[cur] & syms[j]]
            for j in linked:
                remaining.discard(j)
                frontier.append(j)
        return not remaining
    return connected


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical", nargs="+")
    ap.add_argument("--k", type=int, default=4, help="max atoms per sub-star (plan: start k=4)")
    ap.add_argument("--min-support", type=int, default=3,
                    help="min DOCUMENT support (Tier A engineers >=3 instances per rule)")
    ap.add_argument("--out-dir", default=os.path.join(os.path.dirname(os.path.abspath(__file__)), "out"))
    ap.add_argument("--report", default=None)
    ap.add_argument("--keep-surface", action="store_true",
                    help="keep surface-record atoms (Name, ...) in stars")
    args = ap.parse_args()

    vocab = C.load_vocabulary()
    surface = vocab["surface_record"]

    records, seen_ids, dup = [], set(), 0
    versions = set()
    for path in args.canonical:
        for r in load(path):
            versions.add(r.get("schema"))
            if r["id"] in seen_ids:
                dup += 1
                continue
            seen_ids.add(r["id"])
            records.append(r)
    if len(versions) > 1:
        raise SystemExit(f"REFUSED: mixed canon versions {sorted(versions)} — regenerate first.")

    # pattern key -> aggregate
    agg = {}
    truncated_stars = 0

    def feed(key, mode, cid, terms_stvs):
        entry = agg.get(key)
        if entry is None:
            entry = agg[key] = {
                "mode": mode, "atoms": list(key[1]), "size": len(key[1]),
                "ids": set(), "occurrences": 0, "s_sum": 0.0, "c_sum": 0.0, "n_tv": 0,
            }
        entry["ids"].add(cid)
        entry["occurrences"] += 1
        for _, stv in terms_stvs:
            entry["s_sum"] += stv[0]
            entry["c_sum"] += stv[1]
            entry["n_tv"] += 1

    for rec in records:
        cid = rec["id"]
        catoms = rec["atoms"]
        parsed_heads = [C.parse_term(a["term"])[0] for a in catoms]
        sat_class = {sym: st.get("class") for sym, st in rec["stars"].items()}

        for sym, star in sorted(rec["stars"].items()):
            if star["kind"] not in ("event", "entity") or not RE_SKOLEM.fullmatch(sym):
                continue
            idxs = [i for i in star["atoms"]
                    if args.keep_surface or parsed_heads[i] not in surface]
            if len(idxs) > MAX_STAR_ATOMS:
                truncated_stars += 1
                idxs = idxs[:MAX_STAR_ATOMS]
            stream = "event" if star["kind"] == "event" else "entity"
            for size in range(1, min(args.k, len(idxs)) + 1):
                for combo in itertools.combinations(idxs, size):
                    ts = [(catoms[i]["term"], catoms[i]["stv"]) for i in combo]
                    pat = canonical_pattern(ts, sym, sat_class)
                    feed((stream, pat), stream, cid, ts)

        kind_idx = sorted(
            i for i, a in enumerate(catoms)
            if not RE_SKOLEM.search(a["term"])
            and parsed_heads[i] != "Implication"
            and (args.keep_surface or parsed_heads[i] not in surface)
        )
        if kind_idx:
            connected = kindlevel_components(kind_idx, catoms)
            for size in range(1, min(args.k, len(kind_idx)) + 1):
                for combo in itertools.combinations(kind_idx, size):
                    if not connected(list(combo)):
                        continue
                    ts = [(catoms[i]["term"], catoms[i]["stv"]) for i in combo]
                    pat = canonical_pattern(ts, "\x00none", sat_class)
                    feed(("kindlevel", pat), "kindlevel", cid, ts)

    # threshold + dominated flag (same doc-support set as a strictly larger same-mode pattern)
    kept = {k: v for k, v in agg.items() if len(v["ids"]) >= args.min_support}
    by_support_set = collections.defaultdict(list)
    for k, v in kept.items():
        by_support_set[(v["mode"], frozenset(v["ids"]))].append(k)
    for (_, _), keys in by_support_set.items():
        if len(keys) < 2:
            continue
        max_size = max(kept[k]["size"] for k in keys)
        for k in keys:
            if kept[k]["size"] < max_size:
                kept[k]["dominated"] = True

    rows = []
    for k, v in kept.items():
        tiers = sorted({tier_of(i) for i in v["ids"]})
        support = len(v["ids"])
        rows.append({
            "mode": v["mode"], "size": v["size"], "atoms": v["atoms"],
            "support": support, "occurrences": v["occurrences"],
            "tiers": tiers,
            "per_tier": {t: sum(1 for i in v["ids"] if tier_of(i) == t) for t in tiers},
            "lexicalized": any(re.search(r"(?<![\w$<\"])[a-z][a-z0-9_]*", RE_STR.sub("", a))
                               for a in v["atoms"]),
            "dominated": v.get("dominated", False),
            "mean_s": round(v["s_sum"] / v["n_tv"], 4),
            "mean_c": round(v["c_sum"] / v["n_tv"], 4),
            "examples": sorted(v["ids"])[:3],
        })
    rows.sort(key=lambda r: (-r["support"], r["mode"], -r["size"], r["atoms"]))
    for n, r in enumerate(rows, 1):
        r["pattern_id"] = "st%05d" % n

    os.makedirs(args.out_dir, exist_ok=True)
    pat_path = os.path.join(args.out_dir, "stars.jsonl")
    with open(pat_path, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    # typed signals (PLAN.md §6): multi-atom, lexicalized, non-dominated -> subtree-collapse
    sig_path = os.path.join(args.out_dir, "stars_signals.jsonl")
    n_sig = 0
    with open(sig_path, "w", encoding="utf-8") as fh:
        for r in rows:
            if r["size"] < 2 or not r["lexicalized"] or r["dominated"]:
                continue
            n_sig += 1
            fh.write(json.dumps({
                "candidate": {"pattern_id": r["pattern_id"], "atoms": r["atoms"],
                              "mode": r["mode"]},
                # monotone support squash, NOT a calibrated probability — consensus
                # scoring (P4) normalizes across methods.
                "confidence": round(r["support"] / (r["support"] + 10.0), 3),
                "kind": "subtree-collapse",
                "support": r["support"], "tiers": r["tiers"],
                "examples": r["examples"], "method": "frequent-stars-4.3.1",
            }, ensure_ascii=False, sort_keys=True) + "\n")

    # ---- summary / report ---------------------------------------------------
    n_lex = sum(1 for r in rows if r["lexicalized"] and r["size"] >= 2 and not r["dominated"])
    cross = [r for r in rows if len(r["tiers"]) >= 2 and r["lexicalized"] and r["size"] >= 2]
    L = []
    L.append("# §4.3.1 frequent stars — wave 1\n")
    L.append(f"- inputs: {', '.join(os.path.basename(p) for p in args.canonical)}"
             f"  ({len(records)} records, {dup} duplicate ids skipped, canon {sorted(versions)[0]})")
    L.append(f"- params: k={args.k}, min_support={args.min_support}"
             f"{', surface kept' if args.keep_surface else ' (surface-record atoms dropped)'}"
             f"{f', {truncated_stars} oversized star(s) truncated' if truncated_stars else ''}")
    L.append(f"- patterns >= support: **{len(rows)}**  |  signals (multi-atom, lexicalized, "
             f"non-dominated): **{n_sig}**  |  cross-tier among those: **{len(cross)}**\n")

    def table(title, sel, n=25):
        L.append(f"## {title}\n")
        L.append("| support | tiers | mean s | atoms |\n|---|---|---|---|")
        for r in sel[:n]:
            atoms = "<br>".join("`%s`" % a for a in r["atoms"])
            L.append(f"| {r['support']} ({r['occurrences']}×) | {'+'.join(r['tiers'])} "
                     f"| {r['mean_s']:.2f} | {atoms} |")
        L.append("")

    table("Top lexicalized multi-atom units (collapse candidates)",
          [r for r in rows if r["lexicalized"] and r["size"] >= 2 and not r["dominated"]])
    table("Top kind-level units",
          [r for r in rows if r["mode"] == "kindlevel" and r["size"] >= 2 and not r["dominated"]])
    table("Cross-tier units (appear in >=2 tiers)", cross, 15)
    table("Structural shells (features for wave 2, NOT collapse candidates)",
          [r for r in rows if not r["lexicalized"]], 10)

    text = "\n".join(L) + "\n"
    if args.report:
        with open(args.report, "w", encoding="utf-8") as fh:
            fh.write(text)
        print(f"-> {args.report}")
    print(f"-> {pat_path}  ({len(rows)} patterns)")
    print(f"-> {sig_path}  ({n_sig} signals)")
    print(f"records {len(records)}  patterns {len(rows)}  signals {n_sig}  cross-tier {len(cross)}")


if __name__ == "__main__":
    main()
