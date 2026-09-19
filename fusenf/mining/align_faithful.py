"""FUSE-NF §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm (H, 2026-09-19; owner design 2026-09-18).

Paper §4.3.4 verbatim: "Given a set of sentence pairs known to be paraphrases (e.g. via asking an LLM to
rate if they are paraphrases or not?), we align their SENF graphs (via tree-edit or soft matching) and
record which subtrees and roles consistently map to each other. These alignments validate which
structural elements can be unified without semantic loss."

Pairs      = the labelled paraphrase pairs the corpora already hold: every equivalence class with >= 2
             members in the canonical store; PARAPHRASE pairs = pairs of same-polarity members (Tier C:
             the PAWS a/b pair; Tier A: base / mining / normalize variants), CONTROL pairs = a same-polarity
             member against a different-polarity member (Tier A only: participant swap, negation, antonym,
             quantity change, modality shift) — controls are a MEASUREMENT column, never a filter.
Alignment  = per pair, the exact maximum-common-subgraph alignment: over every injective renaming of the
             skolems of one graph onto the other's WITHIN each variable stream (e / x / f), maximise the
             number of IDENTICAL atoms (term + polarity), then the number of NEAR-identical atoms (same
             arity, the same variables in the same positions, a different head symbol or constant = one
             substitution), then the lexicographically first renaming; the count of renamings tying on
             the score is recorded (ambiguity). Above --cap renamings a greedy per-skolem assignment is
             used instead (soft matching; recorded per pair). Eligible atoms = the miner's (Implication
             and surface atoms excluded, MAX_REC_ATOMS cap).
Mappings   = recorded at the alignment's own granularity, per pair:
             UNIT -> UNIT: every instance of a §4.3.1 faithful unit on one side whose atoms are all
               matched maps to the canonical form of their images on the other side (the inventory's
               unit when the image is one, a raw subtree otherwise); identity when the two forms coincide;
             ROLE -> ROLE: for an aligned event centre and an aligned filler, the role head on one side
               against the head on the other (identity when equal; lost when the other side has no atom
               on that centre/filler);
             RESIDUE: an atom matched on neither side, keyed by its canonical form and the smallest unit
               instance around it whose other atoms are matched (the modifier-pruning case when
               consistent), with a flag saying whether its head occurs anywhere on the other side.
Consistency= support = number of distinct equivalence classes (never pairs: a Tier A class yields several
             pairs); PASS at support >= --floor (3, the inherited minimum support). Identity mappings are
             not candidates: they are summarised per unit (self / other / lost over the pairs the unit
             occurs in) — the paper's "validate" reading in the owner's sense.
Rules      = a consistent non-identity UNIT mapping renders as two implications into one provisional
             meta-node (the two subtrees "can be unified"); a ROLE mapping as the minority head rewriting
             to the majority head; a RESIDUE as the unit rewriting to itself without the atom (a prune).
             Naming and direction provisional; the gauntlet decides.

Outputs (in --out-dir; <stem> = align_faithful):
  <stem>.jsonl            every mapping (kind unit / role / residue / profile) with support, control support,
                          examples, pass
  <stem>_pairs.jsonl      one line per pair: the renaming, matched / near / unmatched atoms, quality [--intermediates]
  <stem>.metta            readable rendering: consistent non-identity unit mappings first, then role
                          mappings, then residue; PASS first inside each; never loaded
  <stem>.md               parameters, pair inventory, alignment quality, unit profiles, tables, Tier A scorecard

Usage:
  python align_faithful.py --corpus ../corpora/tierC.jsonl [--canonical canonical_substrate.jsonl] [--out-dir out_h]
  python align_faithful.py --corpus ../corpora/tierA.jsonl --corpus ../corpora/tierC.jsonl \\
      --units out_ecmp/patterns2_faithful.jsonl --canonical out_ecmp/canonical_iteme.jsonl --out-dir out_ecmp
"""
from __future__ import annotations

import argparse
import collections
import itertools
import json
import math
import os
import re
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(FUSENF, "harness"))
import canonicalize as C  # noqa: E402
from frequent_patterns2 import Enumerator, canonical_pattern2, load, RE_SKOLEM, MAX_REC_ATOMS  # noqa: E402
from patterns2_faithful import camel, parse_atom, render_query, variables  # noqa: E402
from ae_faithful import shape_parallel  # noqa: E402

PAPER = ("Given a set of sentence pairs known to be paraphrases (e.g. via asking an LLM to rate if they are "
         "paraphrases or not?), we align their SENF graphs (via tree-edit or soft matching) and record which "
         "subtrees and roles consistently map to each other. These alignments validate which structural "
         "elements can be unified without semantic loss.")
CLASS_LINKS = ("Member", "Inheritance", "GroupOf", "Name")
STOP = {"the", "a", "to", "of", "up", "off", "out", "down", "in", "on"}


# ----------------------------------------------------------------------------- inputs
def load_units(path):
    units = load(path)
    return {tuple(u["atoms"]): u for u in units}


def load_pairs(corpora, records):
    """paraphrase + control pairs from every equivalence class with >= 2 members in the canonical store"""
    meta, classes = {}, collections.defaultdict(list)
    for p in corpora:
        for r in load(p):
            if r["id"] in records and r.get("equiv_class"):
                meta[r["id"]] = r
                classes[r["equiv_class"]].append(r["id"])
    pairs = []
    for cls, ids in sorted(classes.items()):
        ids = sorted(ids)
        same = [i for i in ids if meta[i]["labels"].get("polarity", "same") == "same"]
        diff = [i for i in ids if meta[i]["labels"].get("polarity", "same") != "same"]
        for a, b in itertools.combinations(same, 2):
            pairs.append({"cls": cls, "a": a, "b": b, "kind": "paraphrase", "control_kind": None})
        for a in same:
            for b in diff:
                pairs.append({"cls": cls, "a": a, "b": b, "kind": "control",
                              "control_kind": meta[b]["labels"].get("control_kind")})
    return pairs, meta


# ----------------------------------------------------------------------------- graphs
class Graph:
    """One canonical record as the aligner sees it: eligible atoms, skolems per stream, unit instances."""

    def __init__(self, rec, operators, surface, units, k):
        self.id = rec["id"]
        en = Enumerator(rec, operators, surface, False)
        self.truncated = en.truncated
        self.idxs = list(en.idxs)
        self.term = {i: rec["atoms"][i]["term"] for i in self.idxs}
        self.stv = {i: tuple(rec["atoms"][i]["stv"]) for i in self.idxs}
        self.neg = {i: rec["atoms"][i]["stv"][0] < 0.5 for i in self.idxs}
        self.parsed = {i: C.parse_term(self.term[i]) for i in self.idxs}
        self.kind = {s: v["kind"] for s, v in rec["stars"].items()}
        sk = collections.defaultdict(set)
        for i in self.idxs:
            for m in RE_SKOLEM.finditer(self.term[i]):
                sk[m.group(1)].add(m.group(0))
        self.streams = {s: sorted(v, key=lambda t: (len(t), t)) for s, v in sk.items()}
        self.instances = []          # (unit key, frozenset of atom idxs)
        for combo in en.subsets(k):
            key = canonical_pattern2(en.terms_stvs(combo), ())
            if key in units:
                self.instances.append((key, frozenset(combo)))
        self.heads = collections.Counter(self.parsed[i][0] for i in self.idxs)

    def atom_string(self, i, m=None):
        """the atom as text (+ polarity); with a renaming m, skolems are renamed into the other side's names
        and an unmapped skolem is marked so it can never equal anything there"""
        t = self.term[i] if m is None else RE_SKOLEM.sub(lambda mm: m.get(mm.group(0), "?" + mm.group(0)), self.term[i])
        return t + (" ~NEG" if self.neg[i] else "")

    def skeleton(self, i, m=None):
        """(arity, ((position, variable) …)) — the variable positions of an atom (renamed under m); None when it has none"""
        t = self.parsed[i]
        args = t[1:]
        vs = tuple((p, a if m is None else m.get(a, "?" + a)) for p, a in enumerate(args)
                   if isinstance(a, str) and RE_SKOLEM.fullmatch(a))
        return (len(args), vs) if vs else None

    def is_role_atom(self, i):
        t = self.parsed[i]
        return (len(t) == 3 and t[0] not in CLASS_LINKS and isinstance(t[1], str)
                and self.kind.get(t[1]) == "event")

    def key_of(self, idxs):
        return canonical_pattern2([(self.term[i], self.stv[i]) for i in sorted(idxs)], ())


# ----------------------------------------------------------------------------- alignment
def score_mapping(ga, gb, m):
    """m: partial injection a-skolem -> b-skolem. Returns (n_identical, n_near, matched, near, rest_a, rest_b)."""
    b_index = collections.defaultdict(list)
    for j in gb.idxs:
        b_index[gb.atom_string(j)].append(j)
    used = set()
    matched = []
    rest_a = []
    for i in ga.idxs:
        s = ga.atom_string(i, m)
        cands = [j for j in b_index.get(s, ()) if j not in used]
        if cands:
            used.add(cands[0])
            matched.append((i, cands[0]))
        else:
            rest_a.append(i)
    rest_b = [j for j in gb.idxs if j not in used]
    near = []
    by_skel = collections.defaultdict(list)
    for j in rest_b:
        sk = gb.skeleton(j)
        if sk:
            by_skel[sk].append(j)
    still_a = []
    for i in rest_a:
        sk = ga.skeleton(i, m)
        cands = [j for j in by_skel.get(sk, ()) if j not in used] if sk else []
        if cands:
            head = ga.parsed[i][0]
            cands.sort(key=lambda j: (gb.parsed[j][0] != head, j))
            used.add(cands[0])
            near.append((i, cands[0]))
        else:
            still_a.append(i)
    rest_b = [j for j in gb.idxs if j not in used]
    return len(matched), len(near), matched, near, still_a, rest_b


def enumerate_mappings(ga, gb):
    """every injective renaming a -> b within each stream (the smaller side maps into the larger)"""
    streams = sorted(set(ga.streams) | set(gb.streams))
    per_stream = []
    for s in streams:
        A, B = ga.streams.get(s, []), gb.streams.get(s, [])
        if len(A) <= len(B):
            per_stream.append([dict(zip(A, perm)) for perm in itertools.permutations(B, len(A))])
        else:
            per_stream.append([dict(zip(perm, B)) for perm in itertools.permutations(A, len(B))])
    total = 1
    for opts in per_stream:
        total *= max(1, len(opts))
    return per_stream, total


def align(ga, gb, cap):
    per_stream, total = enumerate_mappings(ga, gb)
    best, best_key, n_best, method = None, None, 0, "exact"
    if total <= cap:
        for combo in itertools.product(*[opts or [{}] for opts in per_stream]):
            m = {}
            for d in combo:
                m.update(d)
            n_id, n_near, *_ = score_mapping(ga, gb, m)
            key = (n_id, n_near)
            if best is None or key > best_key:
                best, best_key, n_best = m, key, 1
            elif key == best_key:
                n_best += 1
                if sorted(m.items()) < sorted(best.items()):
                    best = m
    else:
        method = "greedy"
        m = {}
        while True:
            base = score_mapping(ga, gb, m)[0]
            gain, pick = 0, None
            for s in sorted(set(ga.streams) | set(gb.streams)):
                for a in ga.streams.get(s, []):
                    if a in m:
                        continue
                    for b in gb.streams.get(s, []):
                        if b in m.values():
                            continue
                        g = score_mapping(ga, gb, dict(m, **{a: b}))[0] - base
                        if g > gain or (g == gain and gain > 0 and (a, b) < pick):
                            gain, pick = g, (a, b)
            if pick is None or gain <= 0:
                break
            m[pick[0]] = pick[1]
        best, n_best = m, 1
    n_id, n_near, matched, near, rest_a, rest_b = score_mapping(ga, gb, best)
    n = max(len(ga.idxs), len(gb.idxs)) or 1
    return {"mapping": best, "method": method, "renamings": total, "ambiguous": n_best,
            "identical": matched, "near": near, "rest_a": rest_a, "rest_b": rest_b,
            "quality": round(n_id / n, 4), "n_a": len(ga.idxs), "n_b": len(gb.idxs)}


# ----------------------------------------------------------------------------- mappings from one alignment
def unit_mappings(ga, gb, al, units):
    """{(key_x, key_y) unordered: identity flag} + per-unit outcome on this pair + residue records"""
    image = dict(al["identical"] + al["near"])
    preimage = {j: i for i, j in image.items()}
    out = {}
    outcome = collections.defaultdict(set)      # unit key -> {"self", "other", "lost"}
    for side, g, other, img in (("a", ga, gb, image), ("b", gb, ga, preimage)):
        for key, idxs in g.instances:
            if all(i in img for i in idxs):
                target = other.key_of([img[i] for i in idxs])
                pair = tuple(sorted((key, target)))
                out[pair] = (key == target)
                outcome[key].add("self" if key == target else "other")
            else:
                outcome[key].add("lost")
    return out, outcome


def role_mappings(ga, gb, al):
    """unordered (R, R') pairs over aligned centre + filler; (R, None) when the other side has no atom there"""
    m = al["mapping"]
    inv = {b: a for a, b in m.items()}
    out = set()
    for g, other, mp in ((ga, gb, m), (gb, ga, inv)):
        other_atoms = collections.defaultdict(list)
        for j in other.idxs:
            t = other.parsed[j]
            if other.is_role_atom(j):
                other_atoms[(t[1], t[2] if isinstance(t[2], str) else other.term[j])].append(t[0])
        for i in g.idxs:
            if not g.is_role_atom(i):
                continue
            t = g.parsed[i]
            e, x = t[1], t[2]
            if e not in mp:
                continue
            xx = mp.get(x, x) if isinstance(x, str) else g.term[i]
            if isinstance(x, str) and RE_SKOLEM.fullmatch(x) and x not in mp:
                continue
            heads = other_atoms.get((mp[e], xx), [])
            if heads:
                for h in heads:
                    out.add(tuple(sorted((t[0], h))))
            else:
                out.add((t[0], None))
    return out


def residue_records(ga, gb, al):
    """unmatched atoms: (context unit key or None, atom key) with the other-side-has-head flag"""
    image = dict(al["identical"] + al["near"])
    preimage = {j: i for i, j in image.items()}
    out = []
    for g, other, img, rest in ((ga, gb, image, al["rest_a"]), (gb, ga, preimage, al["rest_b"])):
        for i in rest:
            akey = g.key_of([i])
            ctx = None
            best = None
            for key, idxs in g.instances:
                if i in idxs and len(idxs) > 1 and all(j in img for j in idxs if j != i):
                    if best is None or len(idxs) < best:
                        best, ctx = len(idxs), key
            head = g.parsed[i][0]
            out.append((ctx, akey, head in other.heads))
    return out


# ----------------------------------------------------------------------------- rendering helpers
def root_of(atoms):
    vs = variables(list(atoms))
    if not vs:
        return None
    firsts = collections.Counter(parse_atom(a)[1][0] for a in atoms if parse_atom(a)[1] and parse_atom(a)[1][0].startswith("$"))
    return max(vs, key=lambda v: (firsts.get(v, 0), -vs.index(v))) if firsts else vs[0]


def query_of(key):
    return render_query(list(key))


def unit_meta(key_a, key_b, sub):
    """provisional meta-node name for a unified pair: the shared heads + the two alternatives"""
    A, B = list(key_a), list(key_b)
    shared = [a for a in A if a in B]
    toks = [camel(parse_atom(a)[0]) for a in shared]
    if sub:
        alt_a, alt_b = sub
        def tok(atom):
            h, args, _ = parse_atom(atom)
            consts = [c for c in args if not c.startswith("$")]
            return camel(consts[-1]) if consts else camel(h)
        toks.append(tok(alt_a) + "Or" + tok(alt_b))
    else:
        toks.append("Or" + "".join(camel(parse_atom(b)[0]) for b in B if b not in A)[:24])
    return "Mn" + "_".join(toks)


# ----------------------------------------------------------------------------- main
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--corpus", action="append", required=True, help="corpus jsonl with equiv_class + labels (repeatable)")
    ap.add_argument("--canonical", default=os.path.join(HERE, "canonical_substrate.jsonl"))
    ap.add_argument("--units", default=os.path.join(HERE, "out_h", "patterns2_faithful.jsonl"))
    ap.add_argument("--out-dir", default=os.path.join(HERE, "out_h"))
    ap.add_argument("--stem", default="align_faithful")
    ap.add_argument("--k", type=int, default=4, help="atoms per unit (the miner's k)")
    ap.add_argument("--floor", type=int, default=3, help="min distinct classes for a mapping to PASS")
    ap.add_argument("--cap", type=int, default=5040, help="max renamings searched exactly; beyond it the greedy assignment")
    ap.add_argument("--intermediates", default="alignments", help="'alignments' writes <stem>_pairs.jsonl; 'none'")
    ap.add_argument("--top", type=int, default=30)
    args = ap.parse_args()
    t0 = time.time()
    vocab = C.load_vocabulary()
    surface = vocab["surface_record"]
    raw = json.load(open(os.path.join(FUSENF, "specs", "vocabulary.json"), encoding="utf-8"))
    operators = set(raw["operators"]) | set(raw.get("deprecated_operators", {}))
    units = load_units(args.units)
    records = {r["id"]: r for r in load(args.canonical)}
    pairs, meta = load_pairs(args.corpus, records)
    texts = {i: " ".join(m["sentences"]) for i, m in meta.items()}
    n_par = sum(1 for p in pairs if p["kind"] == "paraphrase")
    n_ctl = len(pairs) - n_par
    graphs = {}
    for p in pairs:
        for i in (p["a"], p["b"]):
            if i not in graphs:
                graphs[i] = Graph(records[i], operators, surface, units, args.k)
    print(f"{len(pairs)} pairs ({n_par} paraphrase, {n_ctl} control) over {len(graphs)} records; "
          f"{sum(len(g.instances) for g in graphs.values())} unit instances ({time.time() - t0:.1f}s)")

    # ---- align every pair ----
    unit_map = collections.defaultdict(lambda: {"support": set(), "control": set(), "examples": [], "identity": None})
    profile = collections.defaultdict(lambda: {"self": set(), "other": set(), "lost": set()})
    role_map = collections.defaultdict(lambda: {"support": set(), "control": set(), "examples": []})
    residue = collections.defaultdict(lambda: {"support": set(), "control": set(), "examples": [], "head_on_other_side": 0, "n": 0})
    pair_rows = []
    for p in pairs:
        ga, gb = graphs[p["a"]], graphs[p["b"]]
        al = align(ga, gb, args.cap)
        bucket = "support" if p["kind"] == "paraphrase" else "control"
        um, outcome = unit_mappings(ga, gb, al, units)
        for pair_key, ident in um.items():
            e = unit_map[pair_key]
            e[bucket].add(p["cls"])
            e["identity"] = ident
            if len(e["examples"]) < 3 and p["kind"] == "paraphrase":
                e["examples"].append([p["cls"], p["a"], p["b"]])
        if p["kind"] == "paraphrase":
            for key, outs in outcome.items():
                o = "self" if "self" in outs else ("other" if "other" in outs else "lost")
                profile[key][o].add(p["cls"])
        for rk in role_mappings(ga, gb, al):
            e = role_map[rk]
            e[bucket].add(p["cls"])
            if len(e["examples"]) < 3 and p["kind"] == "paraphrase":
                e["examples"].append([p["cls"], p["a"], p["b"]])
        for ctx, akey, other_has in residue_records(ga, gb, al):
            e = residue[(ctx, akey)]
            e[bucket].add(p["cls"])
            e["n"] += 1
            e["head_on_other_side"] += int(other_has)
            if len(e["examples"]) < 3 and p["kind"] == "paraphrase":
                e["examples"].append([p["cls"], p["a"], p["b"]])
        pair_rows.append({
            "cls": p["cls"], "a": p["a"], "b": p["b"], "kind": p["kind"], "control_kind": p["control_kind"],
            "mapping": al["mapping"], "method": al["method"], "renamings": al["renamings"], "ambiguous": al["ambiguous"],
            "n_a": al["n_a"], "n_b": al["n_b"], "identical": len(al["identical"]), "near": len(al["near"]),
            "quality": al["quality"], "identical_parse": al["quality"] == 1.0 and al["n_a"] == al["n_b"],
            "near_atoms": [[ga.atom_string(i, al["mapping"]), gb.atom_string(j)] for i, j in al["near"]],
            "unmatched_a": [ga.atom_string(i) for i in al["rest_a"]],
            "unmatched_b": [gb.atom_string(j) for j in al["rest_b"]],
            "truncated": ga.truncated or gb.truncated,
        })
    print(f"aligned {len(pairs)} pairs ({time.time() - t0:.1f}s): exact {sum(1 for r in pair_rows if r['method'] == 'exact')}, "
          f"ambiguous {sum(1 for r in pair_rows if r['ambiguous'] > 1)}, identical parses "
          f"{sum(1 for r in pair_rows if r['kind'] == 'paraphrase' and r['identical_parse'])}/{n_par}")

    # ---- records ----
    def unit_name(key):
        u = units.get(key)
        return u["pattern_id"] if u else "raw"

    def sup(e):
        return len(e["support"])

    def ctl(e):   # classes where the mapping occurs in a control pair but in none of the class's paraphrase pairs
        return len(e["control"] - e["support"])

    recs = []
    for (ka, kb), e in unit_map.items():
        if e["identity"]:
            continue
        # A = the more frequent side (larger inventory support; raw = 0), B rewrites into the shared meta-node with it
        sa = units.get(ka, {}).get("support", 0)
        sb = units.get(kb, {}).get("support", 0)
        A, B = (ka, kb) if (sa, query_of(ka)) >= (sb, query_of(kb)) else (kb, ka)
        par, atom_a, atom_b = shape_parallel(list(A), list(B))
        recs.append({"kind": "unit", "a": unit_name(A), "b": unit_name(B), "query_a": query_of(A), "query_b": query_of(B),
                     "support_a": sa, "support_b": sb, "support": sup(e), "control_support": ctl(e),
                     "classes": sorted(e["support"]), "examples": e["examples"], "pass": sup(e) >= args.floor,
                     "parallel": par, "substitution": f"{atom_b} -> {atom_a}" if par else None,
                     "meta": unit_meta(A, B, (atom_a, atom_b) if par else None), "variant": "faithful"})
    role_count = collections.Counter()
    for g in graphs.values():
        for i in g.idxs:
            if g.is_role_atom(i):
                role_count[g.parsed[i][0]] += 1
    for (ra, rb), e in role_map.items():
        if rb is None:
            recs.append({"kind": "role-lost", "a": ra, "b": None, "support": sup(e), "control_support": ctl(e),
                         "examples": e["examples"], "pass": sup(e) >= args.floor, "variant": "faithful"})
            continue
        if ra == rb:
            recs.append({"kind": "role-identity", "a": ra, "b": rb, "support": sup(e), "control_support": ctl(e),
                         "examples": e["examples"][:1], "pass": None, "variant": "faithful"})
            continue
        maj, mnr = (ra, rb) if (role_count[ra], ra) >= (role_count[rb], rb) else (rb, ra)
        recs.append({"kind": "role", "a": maj, "b": mnr, "support": sup(e), "control_support": ctl(e), "classes": sorted(e["support"]),
                     "examples": e["examples"], "pass": sup(e) >= args.floor, "occurrences": [role_count[maj], role_count[mnr]],
                     "variant": "faithful"})
    for (ctx, akey), e in residue.items():
        recs.append({"kind": "residue", "atom": query_of(akey), "context": query_of(ctx) if ctx else None,
                     "context_unit": unit_name(ctx) if ctx else None,
                     "support": sup(e), "control_support": ctl(e), "occurrences": e["n"],
                     "head_on_other_side": e["head_on_other_side"], "examples": e["examples"],
                     "pass": sup(e) >= args.floor, "variant": "faithful"})
    for key, o in profile.items():
        recs.append({"kind": "profile", "unit": unit_name(key), "query": query_of(key), "self": len(o["self"]),
                     "other": len(o["other"]), "lost": len(o["lost"]), "variant": "faithful"})
    order = {"unit": 0, "role": 1, "role-lost": 2, "residue": 3, "role-identity": 4, "profile": 5}
    recs.sort(key=lambda r: (order[r["kind"]], -(r.get("support") or 0), json.dumps(r, sort_keys=True)))
    os.makedirs(args.out_dir, exist_ok=True)
    with open(os.path.join(args.out_dir, f"{args.stem}.jsonl"), "w", encoding="utf-8") as fh:
        for r in recs:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    if "alignments" in args.intermediates:
        with open(os.path.join(args.out_dir, f"{args.stem}_pairs.jsonl"), "w", encoding="utf-8") as fh:
            for r in pair_rows:
                fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    # ---- Tier A scorecard (when the corpora carry target_rule labels) ----
    targets = collections.defaultdict(set)
    for i, m in meta.items():
        tr = m["labels"].get("target_rule")
        if tr:
            targets[tr].add(m["equiv_class"])
    scorecard = None
    if targets:
        word = lambda w, text: re.search(r"(?<![\w])" + re.escape(w) + r"(?![\w])", text)
        umaps = [r for r in recs if r["kind"] == "unit" and r["support"] >= 1]   # paraphrase-supported mappings only
        rows_sc, alt_rows = [], []
        for tr in sorted(targets):
            if tr.startswith("alt:"):
                ecs = targets[tr]
                ps = [r for r in pair_rows if r["kind"] == "paraphrase" and r["cls"] in ecs
                      and all(meta[i]["labels"].get("target_rule") in (None, tr) for i in (r["a"], r["b"]))]
                alt_rows.append((tr, len(ps), sum(1 for r in ps if r["identical_parse"])))
                continue
            x, y = tr.split("<-") if "<-" in tr else tr.split("~")
            parts = [p for p in y.split("_") if p not in STOP]
            hit = None
            for r in umaps:
                for u, v in ((r["query_a"], r["query_b"]), (r["query_b"], r["query_a"])):
                    if word(x, u) and (word(y, v) or all(word(p, v) for p in parts)):
                        hit = r
                        break
                if hit:
                    break
            if hit is None:   # provenance fallback (batch 1): a mapping supported by >= 2 of the target's own classes that mentions one lemma
                for r in umaps:
                    if len(set(r["classes"]) & targets[tr]) >= 2 and (word(x, r["query_a"] + " " + r["query_b"])
                                                                      or any(word(p, r["query_a"] + " " + r["query_b"]) for p in parts)):
                        hit = dict(r, provenance=True)
                        break
            rows_sc.append((tr, len(targets[tr]), hit))
        n_rec = sum(1 for _, _, h in rows_sc if h)
        scorecard = {"recall": f"{n_rec}/{len(rows_sc)}", "rows": rows_sc, "alt": alt_rows,
                     "recovered_with_control_support": sum(1 for _, _, h in rows_sc if h and h["control_support"])}

    # ---- markdown ----
    n_id = sum(1 for r in pair_rows if r["kind"] == "paraphrase" and r["identical_parse"])
    qs = sorted(r["quality"] for r in pair_rows if r["kind"] == "paraphrase")
    R = ["# §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm (paper as written)\n", f"> \"{PAPER}\" — FUSE-NF §4.3.4\n",
         "## Implementation parameters (doc-open choices, disclosed)\n", "| parameter | choice |\n|---|---|",
         f"| pairs | every equivalence class with ≥ 2 members in `{os.path.relpath(args.canonical, HERE)}` from {', '.join(os.path.relpath(c, HERE) for c in args.corpus)}: "
         f"paraphrase pairs = same-polarity members ({n_par}), control pairs = same × different polarity ({n_ctl}); control support of a mapping = classes where it occurs in a control pair but in none of the class's paraphrase pairs (every control is paired with every same-polarity member, so a class's own lexical swap also appears in its control pairs) — a measurement column, never a filter |",
         f"| alignment | exact maximum-common-subgraph: over every injective skolem renaming within each stream (e / x / f) maximise identical atoms (term + polarity), "
         f"then near-identical atoms (same arity, same variables in the same positions, one head or constant differs), then the first renaming; greedy assignment above {args.cap} renamings; "
         f"eligible atoms = the miner's ({MAX_REC_ATOMS} cap, Implication and surface atoms excluded) |",
         f"| subtrees | the §4.3.1 faithful units (`{os.path.relpath(args.units, HERE)}`, k = {args.k}) instantiated on each side; a unit maps to the canonical form of its atoms' images (raw when not in the inventory) |",
         "| roles | binary heads on an aligned event centre, class links excluded, matched by aligned centre + filler |",
         "| residue | an atom matched on neither side, keyed by its canonical form and the smallest unit instance around it whose other atoms are matched; `head_on_other_side` = attachment slack rather than a true add/drop |",
         f"| consistency | support = distinct equivalence classes; PASS at ≥ {args.floor} (the inherited minimum support); identity mappings summarised per unit (self / other / lost) |",
         "| rules | unit mapping → two implications into a provisional meta-node (`Mn…`); role mapping → minority head rewrites to majority; residue → the context unit rewrites to itself without the atom |\n",
         "## Pair inventory and alignment quality\n",
         f"- {n_par} paraphrase pairs, {n_ctl} control pairs, {len(graphs)} records; {sum(1 for r in pair_rows if r['method'] == 'greedy')} pairs aligned greedily; "
         f"{sum(1 for r in pair_rows if r['ambiguous'] > 1)} pairs with a tie between renamings (the first taken); {sum(1 for r in pair_rows if r['truncated'])} pairs touching a truncated record",
         f"- paraphrase pairs with identical canonical graphs: {n_id} ({n_id / max(1, n_par):.0%}); alignment quality (identical atoms / larger side) median {qs[len(qs) // 2] if qs else 0}, "
         f"quartiles {qs[len(qs) // 4] if qs else 0} / {qs[3 * len(qs) // 4] if qs else 0}; pairs below 0.5: {sum(1 for q in qs if q < 0.5)}\n"]
    def ex(e):
        return " ".join(e[0][1:]) if e else ""
    def sent(i):
        return texts.get(i, "")[:80]
    um = [r for r in recs if r["kind"] == "unit"]
    R.append(f"## Unit mappings (non-identity): {len(um)} recorded, {sum(1 for r in um if r['pass'])} pass, {sum(1 for r in um if r['parallel'])} shape-parallel\n")
    R.append("| support | control | parallel | A (support) | B (support) | example pair | A sentence | B sentence |\n|---|---|---|---|---|---|---|---|")
    for r in um[:args.top]:
        e = r["examples"][0] if r["examples"] else None
        R.append(f"| {r['support']} | {r['control_support']} | {'yes' if r['parallel'] else ''} | `{r['query_a']}` ({r['support_a']}) | `{r['query_b']}` ({r['support_b']}) | "
                 f"{ex(r['examples'])} | {sent(e[1]) if e else ''} | {sent(e[2]) if e else ''} |")
    rm = [r for r in recs if r["kind"] == "role"]
    rl = [r for r in recs if r["kind"] == "role-lost"]
    ri = [r for r in recs if r["kind"] == "role-identity"]
    R.append(f"\n## Role mappings: {len(rm)} non-identity recorded ({sum(1 for r in rm if r['pass'])} pass), {len(rl)} role-lost records, {len(ri)} identity heads\n")
    R.append("| support | control | majority head (occ) | minority head (occ) | example pair |\n|---|---|---|---|---|")
    for r in rm[:args.top]:
        R.append(f"| {r['support']} | {r['control_support']} | {r['a']} ({r['occurrences'][0]}) | {r['b']} ({r['occurrences'][1]}) | {ex(r['examples'])} |")
    R.append("\n| support | control | role lost (no atom on the aligned centre + filler) |\n|---|---|---|")
    for r in rl[:15]:
        R.append(f"| {r['support']} | {r['control_support']} | {r['a']} |")
    rs = [r for r in recs if r["kind"] == "residue"]
    R.append(f"\n## Residue (atoms matched on neither side): {len(rs)} recorded, {sum(1 for r in rs if r['pass'])} pass\n")
    R.append("| support | control | occurrences | head on other side | atom | context unit | example pair |\n|---|---|---|---|---|---|---|")
    for r in rs[:args.top]:
        R.append(f"| {r['support']} | {r['control_support']} | {r['occurrences']} | {r['head_on_other_side']} | `{r['atom']}` | {('`' + r['context'] + '`') if r['context'] else '—'} | {ex(r['examples'])} |")
    pf = [r for r in recs if r["kind"] == "profile"]
    R.append(f"\n## Unit profiles over the paraphrase pairs: {len(pf)} units occurring; "
             f"{sum(1 for r in pf if r['other'] or r['lost'])} ever mapped elsewhere or lost, {sum(1 for r in pf if not r['other'] and not r['lost'])} always mapped to themselves\n")
    R.append("| self | other | lost | unit |\n|---|---|---|---|")
    for r in sorted(pf, key=lambda r: (-(r["other"] + r["lost"]), -r["self"], r["query"]))[:args.top]:
        R.append(f"| {r['self']} | {r['other']} | {r['lost']} | `{r['query']}` |")
    if scorecard:
        R.append(f"\n## Tier A scorecard (key = the corpora's target_rule labels)\n")
        R.append(f"- lexical / converse targets recovered by a non-identity unit mapping mentioning both lemmas: **{scorecard['recall']}** "
                 f"({scorecard['recovered_with_control_support']} of them by a mapping that also has control support)\n")
        R.append("| target | classes | recovered by |\n|---|---|---|")
        for tr, n, h in scorecard["rows"]:
            R.append(f"| {tr} | {n} | {('`' + h['query_a'] + '` ~ `' + h['query_b'] + '` (support ' + str(h['support']) + ', control ' + str(h['control_support']) + (', provenance' if h.get('provenance') else '') + ')') if h else '**MISS**'} |")
        R.append("\n| alt target (expects identical parses) | pairs | identical |\n|---|---|---|")
        for tr, n, ident in scorecard["alt"]:
            R.append(f"| {tr} | {n} | {ident} |")
    open(os.path.join(args.out_dir, f"{args.stem}.md"), "w", encoding="utf-8").write("\n".join(R) + "\n")

    # ---- metta ----
    key_of_pid = {u["pattern_id"]: k for k, u in units.items()}
    with open(os.path.join(args.out_dir, f"{args.stem}.metta"), "w", encoding="utf-8") as fh:
        fh.write(";; FUSE-NF §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm — readable MeTTa RENDERING\n"
                 ";; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is\n"
                 f";;   {args.stem}.jsonl   (every mapping: unit / role / residue / profile, with support, control support, examples)\n"
                 f";;   {args.stem}_pairs.jsonl   (one line per pair: the renaming, matched / near / unmatched atoms, quality)\n;;\n"
                 ";; PARAMETERS (choices the paper leaves open; disclosed)\n"
                 f";;   pairs           {n_par} paraphrase pairs + {n_ctl} control pairs from {', '.join(os.path.relpath(c, HERE) for c in args.corpus)}; control support of a\n"
                 ";;                   mapping = classes where it occurs in a control pair but in none of the class's paraphrase pairs (a measurement column)\n"
                 f";;                   over {os.path.relpath(args.canonical, HERE)}; {n_id} paraphrase pairs parse identically\n"
                 ";;   alignment       exact maximum-common-subgraph: every injective skolem renaming within each stream, maximising identical\n"
                 ";;                   atoms then near-identical atoms (one head or constant differs), first renaming on a tie;\n"
                 f";;                   greedy assignment above {args.cap} renamings ({sum(1 for r in pair_rows if r['method'] == 'greedy')} pairs)\n"
                 f";;   subtrees        the {len(units)} §4.3.1 faithful units instantiated on each side (k = {args.k})\n"
                 ";;   roles           binary heads on an aligned event centre (class links excluded), matched by aligned centre + filler\n"
                 ";;   residue         atoms matched on neither side, keyed by canonical form + the smallest unit instance around them\n"
                 f";;   consistency     support = distinct equivalence classes; PASS at >= {args.floor}\n;;\n"
                 ";; RECORD FORMAT\n"
                 ";;   ;; [unit(, shape-parallel)]  A ~ B   support <classes> (control <classes>)   gate: PASS|FAIL\n"
                 ";;   ;;   A: <query A>   e.g. <class a b>      B: <query B>      substitution: <atom of B> -> <atom of A>\n"
                 ";;   (Implication <A> (Mn… vars))  (Implication <B> (Mn… vars))     = the two subtrees unified under one provisional meta-node\n"
                 ";;   ;; [role]  <majority> ~ <minority>   support …   gate: …      (Implication (<minority> $e $x) (<majority> $e $x))\n"
                 ";;   ;; [residue]  <atom> in <context unit>   support … occurrences … head on other side …   gate: …\n"
                 ";;   (Implication <context unit> <context unit without the atom>)   = the modifier-pruning rule it would become\n"
                 ";; Unit mappings first (PASS, then FAIL, by support), then role mappings, then residue; identity mappings are\n"
                 ";; summarised per unit in the .md and the JSONL (kind 'profile'). Naming and direction provisional, the gauntlet decides.\n")
        fh.write(f"\n;; ==================== UNIT MAPPINGS: {sum(1 for r in um if r['pass'])} pass of {len(um)} non-identity mappings ({sum(1 for r in um if r['parallel'])} shape-parallel) ====================\n")
        for r in sorted(um, key=lambda r: (not r["pass"], -r["support"], r["query_a"], r["query_b"])):
            tag = "unit" + (", shape-parallel" if r["parallel"] else "")
            fh.write(f"\n;; [{tag}]  {r['a']} ~ {r['b']}   support {r['support']} (control {r['control_support']})   gate: {'PASS' if r['pass'] else 'FAIL'}\n"
                     f";;   A: {r['query_a']}   e.g. {ex(r['examples'])}\n;;   B: {r['query_b']}\n"
                     + (f";;   substitution: {r['substitution']}\n" if r["substitution"] else ""))
            va = variables([r["query_a"]])
            vb = variables([r["query_b"]])
            node_a = f"({r['meta']} {' '.join(va)})" if va else f"({r['meta']})"
            node_b = f"({r['meta']} {' '.join(vb)})" if vb else f"({r['meta']})"
            fh.write(f"(Implication {r['query_a']} {node_a})\n(Implication {r['query_b']} {node_b})\n")
        fh.write(f"\n;; ==================== ROLE MAPPINGS: {sum(1 for r in rm if r['pass'])} pass of {len(rm)} non-identity; {len(rl)} lost-role records ====================\n")
        for r in sorted(rm, key=lambda r: (not r["pass"], -r["support"], r["a"], r["b"])):
            fh.write(f"\n;; [role]  {r['a']} ~ {r['b']}   support {r['support']} (control {r['control_support']})   occurrences {r['occurrences'][0]} / {r['occurrences'][1]}   gate: {'PASS' if r['pass'] else 'FAIL'}   e.g. {ex(r['examples'])}\n"
                     f"(Implication ({r['b']} $e $x) ({r['a']} $e $x))\n")
        for r in sorted(rl, key=lambda r: (not r["pass"], -r["support"], r["a"])):
            fh.write(f"\n;; [role-lost]  {r['a']} ~ none   support {r['support']} (control {r['control_support']})   gate: {'PASS' if r['pass'] else 'FAIL'}   e.g. {ex(r['examples'])}\n"
                     ";;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)\n")
        fh.write(f"\n;; ==================== RESIDUE: {sum(1 for r in rs if r['pass'])} pass of {len(rs)} records ====================\n")
        for r in sorted(rs, key=lambda r: (not r["pass"], -r["support"], r["atom"], r["context"] or "")):
            fh.write(f"\n;; [residue]  {r['atom']}" + (f" in {r['context']}" if r["context"] else "") +
                     f"   support {r['support']} (control {r['control_support']})   occurrences {r['occurrences']}   head on other side {r['head_on_other_side']}   gate: {'PASS' if r['pass'] else 'FAIL'}   e.g. {ex(r['examples'])}\n")
            if r["context"]:
                ctx = list(key_of_pid[r["context_unit"]]) if r["context_unit"] in key_of_pid else None
                if ctx:
                    rest = [a for a in ctx if a != r["atom"]]
                    fh.write(f"(Implication {r['context']} {render_query(rest)})\n")
                else:
                    fh.write(";;   rule: none — the context is not an inventory unit\n")
            else:
                fh.write(";;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)\n")
    print(f"-> {os.path.join(args.out_dir, args.stem)}.{{jsonl,md,metta}}: {len(um)} unit mappings ({sum(1 for r in um if r['pass'])} pass), "
          f"{len(rm)} role mappings ({sum(1 for r in rm if r['pass'])} pass), {len(rs)} residue ({sum(1 for r in rs if r['pass'])} pass)"
          + (f"; Tier A recall {scorecard['recall']}" if scorecard else "") + f"  total {time.time() - t0:.0f}s")


if __name__ == "__main__":
    main()
