"""FUSE-NF §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm, read as a VALIDATION INSTRUMENT (rebuilt 2026-09-23).

Paper §4.3.4 verbatim: "Given a set of sentence pairs known to be paraphrases (e.g. via asking an LLM to
rate if they are paraphrases or not?), we align their SENF graphs (via tree-edit or soft matching) and
record which subtrees and roles consistently map to each other. These alignments validate which
structural elements can be unified without semantic loss."

READING (owner 2026-09-23; replaces the 2026-09-19 build, which keyed the record on the §4.3.1 unit
inventory). The deliverable is a table over structural elements — subtrees and roles — with their
behaviour under paraphrase: PRESERVED (matched identically), SUBSTITUTED by a specific other element, or
ONE-SIDED (present in one parse only), each with its support in distinct paraphrase classes and its
support among the control pairs. A substitution that recurs between sentences known to mean the same
and never between sentences known to differ is a LICENSED unification: the evidence that two forms can
be unified without semantic loss. The instrument emits evidence, never rules: turning a licensed
unification into a rewrite of the KB is build_candidates' job.

Pairs      = every equivalence class with >= 2 members in the canonical store: PARAPHRASE pairs = pairs
             of same-polarity members (Tier A: base / mining / normalize variants), CONTROL pairs = a
             same-polarity member against a different-polarity member (participant swap, negation,
             antonym, quantity change, modality shift, manner near-miss) — a measurement column, never
             a filter.
Alignment  = the edit script per pair: over every injective renaming of one graph's skolems onto the
             other's WITHIN each variable stream (e / x / f), maximise the IDENTICAL atoms (term +
             polarity), then the NEAR atoms (same arity, the same skolems in the same positions, a head or
             constant differs = one relabel), then the lexicographically first renaming; the number of
             renamings tying on the score is recorded (ambiguity). Above --cap renamings a greedy
             per-skolem assignment is used (recorded per pair). Eligible atoms = the miner's (Implication
             and surface atoms excluded, MAX_REC_ATOMS cap). Everything else is one-sided.
Regions    = the atoms outside the common part, grouped per side into connected regions: two atoms belong
             together when they share a node symbol the common part does not hold (a skolem, or a constant
             standing as a term's first argument); a symbol the common part does hold is an ANCHOR — where
             the region hangs — and never merges regions.
Substitutions = regions linked across the pair by relabels (near pairs), plus every same-side region hanging on
             the same anchors as a relabelled region (leftover material: a co-dependent edit is ONE substitution —
             make + decision ~ decide, big + very ~ huge, a converse's verb swap + role swaps). Recorded
             at two granularities: each FACTOR (one relabel, the two atoms alone, skolems abstracted) and
             the JOINT key (all atoms of the substitution on both sides, plus its anchors), so a factor's
             record says in which joint contexts it occurs and whether it is ever attested ALONE (the
             whole substitution = that one relabel) — the co-dependent-edit discipline: a factor never
             attested alone is promotable only with its joint.
One-sided  = regions with no relabel link: recorded as drops (present in one parse only), DIAGNOSTIC by
             default, with two flags per occurrence: REATTACH (the other side has a one-sided region on
             the same anchors sharing a head — the same material hung elsewhere) and HEAD ON OTHER SIDE
             (every head of the region occurs somewhere on the other side).
Roles      = for an aligned event centre and an aligned filler, the role head on one side against the head
             on the other (identity is counted in the element table; lost when the other side has no
             atom on that centre and filler).
Elements   = every atom pattern (skolems abstracted, constants verbatim) occurring on either side of a
             paraphrase pair: preserved / substituted(by) / one-sided, per class.
Consistency= support = number of distinct equivalence classes (never pairs); PASS at support >= --floor
             (3, the inherited minimum support); LICENSED = PASS with zero control support (control
             support of a key = classes where it occurs in a control pair but in none of that class's
             paraphrase pairs).

Outputs (in --out-dir; <stem> = align_faithful):
  <stem>.jsonl            every record: kind substitution-factor / substitution-joint / role / role-lost /
                          drop / element, with support, control support, verdicts, examples
  <stem>_pairs.jsonl      one line per pair: the two sentences, the renaming, the common subgraph, the
                          substitutions (regions, factors, leftovers), the one-sided regions; quality,
                          ambiguity                                                     [--intermediates]
  <stem>_pairs.md         the same, one readable block per pair (paraphrase pairs, then control pairs)
  <stem>.metta            readable rendering of the EVIDENCE — (Unifiable A B) for substitutions and
                          roles, (OneSided X) for drops — licensed first; never loaded, never a rule
  <stem>.md               parameters, pair inventory, element behaviour, substitutions, roles, drops,
                          Tier A scorecard

Usage:
  python align_faithful.py --corpus ../corpora/tierA.jsonl --canonical out_ecmp/canonical_iteme.jsonl --out-dir out_ecmp
"""
from __future__ import annotations

import argparse
import collections
import itertools
import json
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
from patterns2_faithful import render_query  # noqa: E402

PAPER = ("Given a set of sentence pairs known to be paraphrases (e.g. via asking an LLM to rate if they are "
         "paraphrases or not?), we align their SENF graphs (via tree-edit or soft matching) and record which "
         "subtrees and roles consistently map to each other. These alignments validate which structural "
         "elements can be unified without semantic loss.")
CLASS_LINKS = ("Member", "Inheritance", "GroupOf", "Name")
STOP = {"the", "a", "to", "of", "up", "off", "out", "down", "in", "on"}
PRIME = "'"        # display only: a variable B has and A has not, in the per-pair file
WRAP = "B"         # side tag of the second form inside a symmetric key
ANCHOR = "Anchor"  # anchor clause inside a joint / one-sided key
NEUTRAL_STV = (1.0, 0.99)


# ----------------------------------------------------------------------------- inputs
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
def _lin(t):
    return t if isinstance(t, str) else "(" + " ".join(_lin(x) for x in t) + ")"


class Graph:
    """One canonical record as the aligner sees it: eligible atoms, skolems per stream, node symbols."""

    def __init__(self, rec, operators, surface):
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
        self.heads = collections.Counter(self.parsed[i][0] for i in self.idxs)
        # node symbols: every skolem, plus every constant standing as the first argument of a term
        nodes = set()
        for i in self.idxs:
            nodes.update(m.group(0) for m in RE_SKOLEM.finditer(self.term[i]))
            stack = [self.parsed[i]]
            while stack:
                t = stack.pop()
                if isinstance(t, list):
                    if len(t) > 1 and isinstance(t[1], str) and not t[1].startswith('"'):
                        nodes.add(t[1])
                    stack.extend(x for x in t[1:] if isinstance(x, list))
        self.nodes = nodes
        self.syms = {i: self._symbols_of(i) for i in self.idxs}

    def _symbols_of(self, i):
        """the node symbols one atom touches (skolems anywhere in it, node constants anywhere in it)"""
        out = set(m.group(0) for m in RE_SKOLEM.finditer(self.term[i]))
        stack = [self.parsed[i]]
        while stack:
            t = stack.pop()
            for x in t[1:]:
                if isinstance(x, list):
                    stack.append(x)
                elif x in self.nodes:
                    out.add(x)
        return out

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


# ----------------------------------------------------------------------------- alignment (the edit script)
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


# ----------------------------------------------------------------------------- regions, substitutions, one-sided
def _components(g, idxs, common_syms):
    """connected components of the atoms idxs: two atoms connect when they share a node symbol OUTSIDE the common
    part (a symbol the common part holds is an anchor: recorded, never merging). [(atom idxs, anchors)] in atom order."""
    parent = {i: i for i in idxs}

    def find(i):
        while parent[i] != i:
            parent[i] = parent[parent[i]]
            i = parent[i]
        return i
    by_conn = collections.defaultdict(list)
    for i in idxs:
        for s in sorted(g.syms[i] - common_syms):
            by_conn[s].append(i)
    for members in by_conn.values():
        for i in members[1:]:
            parent[find(i)] = find(members[0])
    groups = collections.defaultdict(list)
    for i in idxs:
        groups[find(i)].append(i)
    out = [(sorted(mem), set().union(*(g.syms[i] for i in mem)) & common_syms) for mem in groups.values()]
    out.sort(key=lambda c: c[0][0])
    return out


def decompose(ga, gb, al):
    """the record's reading of one alignment: substitutions (regions linked by relabels) and one-sided regions"""
    m = al["mapping"]
    inv = {b: a for a, b in m.items()}
    ident_a = {i for i, _ in al["identical"]}
    ident_b = {j for _, j in al["identical"]}
    common_a = set().union(*(ga.syms[i] for i in ident_a)) if ident_a else set()
    common_b = set().union(*(gb.syms[j] for j in ident_b)) if ident_b else set()
    comps_a = _components(ga, [i for i in ga.idxs if i not in ident_a], common_a)
    comps_b = _components(gb, [j for j in gb.idxs if j not in ident_b], common_b)
    na = len(comps_a)
    comp_of_a = {i: k for k, (mem, _) in enumerate(comps_a) for i in mem}
    comp_of_b = {j: na + k for k, (mem, _) in enumerate(comps_b) for j in mem}
    parent = list(range(na + len(comps_b)))

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x
    for i, j in al["near"]:
        parent[find(comp_of_a[i])] = find(comp_of_b[j])
    # a same-side region hanging on the same anchors as a relabelled region joins its substitution as leftover
    # material, so a co-dependent edit is ONE substitution (make + decision ~ decide; big + very ~ huge; the
    # converse's verb swap + role swaps). Regions with no relabel anywhere on their anchors stay one-sided.
    seeds = {comp_of_a[i] for i, _ in al["near"]} | {comp_of_b[j] for _, j in al["near"]}

    def is_linked(k):
        r = find(k)
        return any(find(x) == r for x in seeds)
    by_anchor = collections.defaultdict(list)
    for k, (_, anc) in enumerate(comps_a):
        for sym in anc:
            by_anchor[("a", sym)].append(k)
    for k, (_, anc) in enumerate(comps_b):
        for sym in anc:
            by_anchor[("b", sym)].append(na + k)
    anchor_groups = sorted(by_anchor.items())
    changed = True
    while changed:
        changed = False
        for _, members in anchor_groups:
            if any(is_linked(k) for k in members):
                r0 = find(members[0])
                for k in members[1:]:
                    r = find(k)
                    if r != r0:
                        parent[r] = r0
                        changed = True
    roots = collections.defaultdict(lambda: {"a": [], "b": []})
    for k, c in enumerate(comps_a):
        roots[find(k)]["a"].append(c)
    for k, c in enumerate(comps_b):
        roots[find(na + k)]["b"].append(c)
    near_a = {i for i, _ in al["near"]}
    near_b = {j for _, j in al["near"]}

    def to_a(sym):   # a B-side anchor is a common symbol, hence mapped
        return inv.get(sym, sym)
    subs, singles = [], []
    for r, sides in roots.items():
        if sides["a"] and sides["b"]:
            in_a = sorted(i for mem, _ in sides["a"] for i in mem)
            in_b = sorted(j for mem, _ in sides["b"] for j in mem)
            anchors = set().union(*(anc for _, anc in sides["a"])) | {to_a(s) for _, anc in sides["b"] for s in anc}
            subs.append({"a_regions": sides["a"], "b_regions": sides["b"], "atoms_a": in_a, "atoms_b": in_b,
                         "factors": sorted((i, j) for i, j in al["near"] if i in set(in_a)),
                         "leftover_a": [i for i in in_a if i not in near_a],
                         "leftover_b": [j for j in in_b if j not in near_b],
                         "anchors_a": sorted(anchors)})
        else:
            for mem, anc in sides["a"]:
                singles.append({"side": "a", "atoms": mem, "anchors": sorted(anc), "anchors_a": sorted(anc)})
            for mem, anc in sides["b"]:
                singles.append({"side": "b", "atoms": mem, "anchors": sorted(anc), "anchors_a": sorted(to_a(s) for s in anc)})
    subs.sort(key=lambda s: s["atoms_a"][0])
    singles.sort(key=lambda s: (s["side"], s["atoms"][0]))
    # one-sided diagnostics: reattachment (same anchors on the other side, a shared head) and head presence
    for s in singles:
        g, other = (ga, gb) if s["side"] == "a" else (gb, ga)
        heads = {g.parsed[i][0] for i in s["atoms"]}
        s["head_on_other_side"] = all(h in other.heads for h in heads)
        s["reattach"] = any(o["side"] != s["side"] and o["anchors_a"] == s["anchors_a"] and s["anchors_a"]
                            and heads & {other.parsed[i][0] for i in o["atoms"]} for o in singles)
    return subs, singles


# ----------------------------------------------------------------------------- keys
def canon(terms_stvs):
    return canonical_pattern2(list(terms_stvs), ())


def fresh_names(g_to, tokens):
    """names for the other side's skolems that have no image on g_to: the next free index of the stream"""
    used = {s: {int(t[1:]) for t in toks} for s, toks in g_to.streams.items()}
    out = {}
    for tok in sorted(tokens, key=lambda t: (t[0], int(t[1:]))):
        s = tok[0]
        nxt = (max(used[s]) + 1) if used.get(s) else 0
        out[tok] = f"{s}{nxt}"
        used.setdefault(s, set()).add(nxt)
    return out


def renamer(g_from, g_to, m):
    """term text in g_from's names -> g_to's names; skolems of g_from without an image get fresh g_to names"""
    extra = [t for s in sorted(g_from.streams) for t in g_from.streams[s] if t not in m]
    full = dict(m)
    full.update(fresh_names(g_to, extra))
    return lambda s: RE_SKOLEM.sub(lambda mm: full.get(mm.group(0), mm.group(0)), s), full


def side_key(bare, wrapped, anchors):
    """canonical key of (bare atoms, wrapped atoms, anchors) all in one namespace"""
    terms = list(bare) + [(f"({WRAP} {t})", stv) for t, stv in wrapped]
    terms += [(f"({ANCHOR} {a})", NEUTRAL_STV) for a in sorted(anchors)]
    return canon(terms)


def sym_key(ga, gb, m, atoms_a, atoms_b, anchors_a=(), with_anchors=False):
    """symmetric key of (A atoms, B atoms): the smaller of the two orientations, so it does not depend on which
    parse was called A. Returns (key, orientation): 'ab' = A bare / B wrapped, 'ba' the reverse."""
    inv = {b: a for a, b in m.items()}
    ren_ba, _ = renamer(gb, ga, inv)
    ren_ab, _ = renamer(ga, gb, m)
    ta = [(ga.term[i], ga.stv[i]) for i in atoms_a]
    tb = [(gb.term[j], gb.stv[j]) for j in atoms_b]
    anc_a = list(anchors_a) if with_anchors else []
    anc_b = [m.get(s, s) for s in anc_a]
    k1 = side_key(ta, [(ren_ba(t), s) for t, s in tb], anc_a)
    k2 = side_key(tb, [(ren_ab(t), s) for t, s in ta], anc_b)
    return (k1, "ab") if k1 <= k2 else (k2, "ba")


def one_key(g, atoms, anchors):
    return side_key([(g.term[i], g.stv[i]) for i in atoms], [], anchors)


def split_key(key):
    """a symmetric / one-sided key -> (form 1 clauses, form 2 clauses, anchors)"""
    f1, f2, anc = [], [], []
    for cl in key:
        neg = cl.endswith(" ~NEG")
        body = cl[:-5] if neg else cl
        if body.startswith(f"({WRAP} "):
            f2.append(body[len(WRAP) + 2:-1] + (" ~NEG" if neg else ""))
        elif body.startswith(f"({ANCHOR} "):
            anc.append(body[len(ANCHOR) + 2:-1])
        else:
            f1.append(cl)
    return f1, f2, anc


def forms_of(key):
    f1, f2, anc = split_key(key)
    return render_query(f1) if f1 else "", render_query(f2) if f2 else "", anc


def elem_key(g, i):
    return canon([(g.term[i], g.stv[i])])[0]


# ----------------------------------------------------------------------------- roles
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


# ----------------------------------------------------------------------------- per-pair view (the intermediate)
def _slots(g, i, ren):
    t = g.parsed[i]
    return (t[0], [ren(_lin(x)) for x in t[1:]], g.neg[i])


def _differs(sa, sb):
    out = []
    if sa[0] != sb[0]:
        out.append(f"head {sa[0]}->{sb[0]}")
    for k, (x, y) in enumerate(zip(sa[1], sb[1])):
        if x != y:
            out.append(f"arg{k} {x}->{y}")
    if len(sa[1]) != len(sb[1]):
        out.append(f"arity {len(sa[1])}->{len(sb[1])}")
    if sa[2] != sb[2]:
        out.append("polarity")
    return out


def pair_view(ga, gb, al, subs, singles, keys):
    """one pair for the reader: everything in A's variable names; a B-only variable carries a prime"""
    inv = {b: a for a, b in al["mapping"].items()}

    def ren_b(s):
        return RE_SKOLEM.sub(lambda mm: inv.get(mm.group(0), mm.group(0) + PRIME), s)

    def atom_b(j):
        return ren_b(gb.term[j]) + (" ~NEG" if gb.neg[j] else "")
    ident_a = {i for i, _ in al["identical"]}
    out_subs = []
    for s, k in zip(subs, keys["joint"]):
        out_subs.append({
            "anchors": s["anchors_a"],
            "a": [[ga.atom_string(i) for i in mem] for mem, _ in s["a_regions"]],
            "b": [[atom_b(j) for j in mem] for mem, _ in s["b_regions"]],
            "factors": [{"a": ga.atom_string(i), "b": atom_b(j),
                         "differs": _differs(_slots(ga, i, lambda x: x), _slots(gb, j, ren_b)),
                         "key": " ~ ".join(forms_of(fk)[:2])}
                        for (i, j), fk in zip(s["factors"], keys["factors"][keys["joint"].index(k)])],
            "a_only": [ga.atom_string(i) for i in s["leftover_a"]],
            "b_only": [atom_b(j) for j in s["leftover_b"]],
            "joint_key": (" ~ ".join(forms_of(k)[:2]) + (" @" + ",".join(forms_of(k)[2]) if forms_of(k)[2] else "")) if k else None,
        })
    one_a = [{"atoms": [ga.atom_string(i) for i in s["atoms"]], "anchors": s["anchors_a"],
              "reattach": s["reattach"], "head_on_other_side": s["head_on_other_side"]}
             for s in singles if s["side"] == "a"]
    one_b = [{"atoms": [atom_b(j) for j in s["atoms"]], "anchors": s["anchors_a"],
              "reattach": s["reattach"], "head_on_other_side": s["head_on_other_side"]}
             for s in singles if s["side"] == "b"]
    return {"common": [ga.atom_string(i) for i in ga.idxs if i in ident_a], "substitutions": out_subs,
            "one_sided_a": one_a, "one_sided_b": one_b,
            "factors": sum(len(s["factors"]) for s in subs),
            "leftover": sum(len(s["leftover_a"]) + len(s["leftover_b"]) for s in subs),
            "one_sided_atoms": sum(len(s["atoms"]) for s in singles)}


def write_pairs_md(path, pair_rows, args, corpora):
    par = [r for r in pair_rows if r["kind"] == "paraphrase"]
    ctl = [r for r in pair_rows if r["kind"] != "paraphrase"]

    def stats(rows):
        return {"pairs": len(rows), "identical": sum(1 for r in rows if r["identical_parse"]),
                "common": sum(len(r["common"]) for r in rows), "near": sum(r["near"] for r in rows),
                "subs": sum(len(r["substitutions"]) for r in rows), "leftover": sum(r["leftover"] for r in rows),
                "one_sided": sum(r["one_sided_atoms"] for r in rows),
                "one_sided_regions": sum(len(r["one_sided_a"]) + len(r["one_sided_b"]) for r in rows),
                "reattach": sum(1 for r in rows for x in r["one_sided_a"] + r["one_sided_b"] if x["reattach"]),
                "clean": sum(1 for r in rows if not r["one_sided_a"] and not r["one_sided_b"])}

    def sg(subgraphs):
        return " ".join("{" + " ".join(s) + "}" for s in subgraphs) if subgraphs else "—"

    def one(xs):
        return " ".join("{" + " ".join(x["atoms"]) + "}" + (f"@{','.join(x['anchors'])}" if x["anchors"] else "")
                        + (" ↔" if x["reattach"] else "") for x in xs) if xs else "—"

    def block(r):
        head = (f"### {r['cls']} · {r['a']} ↔ {r['b']}" + (f" · control: {r['control_kind']}" if r["kind"] != "paraphrase" else "")
                + f" · quality {r['quality']:.2f} · common {len(r['common'])} · {len(r['substitutions'])} substitution(s) / {r['factors']} factor(s)"
                f" · leftover {r['leftover']} · one-sided A {len(r['one_sided_a'])} region(s), B {len(r['one_sided_b'])}"
                + (" · IDENTICAL PARSES" if r["identical_parse"] else "")
                + (f" · {r['ambiguous']} renamings tied" if r["ambiguous"] > 1 else "") + (" · greedy" if r["method"] != "exact" else ""))
        L = [head, "", f"A: {r['text_a']}", f"B: {r['text_b']}", "", "```",
             "renaming a->b  " + " ".join(f"{k}->{v}" for k, v in sorted(r["mapping"].items())),
             "common         " + (" ".join(r["common"]) if r["common"] else "—")]
        for n, s in enumerate(r["substitutions"], 1):
            L.append(f"substitution {n} anchors {' '.join(s['anchors']) if s['anchors'] else '—'}" + (f"   joint key: {s['joint_key']}" if s["joint_key"] else ""))
            L.append(f"  A            {sg(s['a'])}")
            L.append(f"  B            {sg(s['b'])}")
            for f in s["factors"]:
                L.append(f"  factor       {f['a']} ~ {f['b']}   [{'; '.join(f['differs']) or 'equal'}]")
            if s["a_only"]:
                L.append(f"  A only       {' '.join(s['a_only'])}")
            if s["b_only"]:
                L.append(f"  B only       {' '.join(s['b_only'])}")
        L.append("one-sided A    " + one(r["one_sided_a"]))
        L.append("one-sided B    " + one(r["one_sided_b"]))
        L += ["```", ""]
        return L

    def summary(s):
        return (f"- {s['pairs']} pairs, {s['identical']} with identical parses, {s['clean']} with no one-sided region; "
                f"{s['subs']} substitutions holding {s['near']} factors (relabels)\n"
                f"- atoms: {s['common']} common; {s['near']} relabelled; {s['leftover']} left over inside substitutions (A only / B only); "
                f"{s['one_sided']} one-sided in {s['one_sided_regions']} regions, {s['reattach']} of those regions flagged as re-attachments (↔)")
    R = ["# §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm (validation instrument) — per-pair intermediate\n",
         f"One block per pair from `{os.path.relpath(args.canonical, HERE)}` over {', '.join(os.path.relpath(c, HERE) for c in corpora)}: "
         "the two sentences, the COMMON subgraph (the atoms the aligner matched identically under its skolem renaming), the SUBSTITUTIONS "
         "(regions of differing material linked across the pair by relabels, with their factors and leftovers) and the ONE-SIDED regions. "
         f"The record is `{args.stem}_pairs.jsonl` (same content, one JSON object per pair); the instrument's tables are `{args.stem}.jsonl / .md / .metta`.\n",
         "## How to read a block\n",
         "- Every atom is written in A's variable names; B's atoms are renamed through the alignment's `renaming a->b` (read it backwards); a variable "
         "B has and A has not carries a prime (`x2'`). `~NEG` marks a negative-polarity atom. Only the aligner's eligible atoms appear "
         "(Implication and surface atoms excluded).",
         "- `common` = the atoms matched identically: the maximum common subgraph the method found (its `identical` count).",
         "- The atoms outside the common part are grouped into REGIONS per side: two atoms belong together when they share a node symbol that "
         "the common part does not hold (a skolem, or a constant standing as a term's first argument, e.g. a compound kind); a symbol the "
         "common part does hold is an ANCHOR — where the region hangs — and never merges regions. Regions are written `{atom atom …}`.",
         "- A `substitution` = regions of A and of B linked by relabels, plus every same-side region hanging on the same anchors as a relabelled "
         "region: each `factor` is one of the method's near matches (same arity, the same skolems in the same positions, a head or constant "
         "substituted), `[…]` listing exactly what differs. `A only` / `B only` = atoms inside the substitution with no relabel partner (the "
         "leftover material of a co-dependent edit: make + decision ~ decide, big + very ~ huge). The `joint key` is "
         "the record's key for the whole substitution (both forms with anchors as `@`), shown when the substitution holds more than one factor "
         "or a leftover; a lone relabel is recorded as its factor only.",
         "- `one-sided A` / `one-sided B` = regions with no relabel link at all, written `{…}@anchors`; `↔` marks a region whose other side "
         "holds a one-sided region on the same anchors sharing a head (the same material hung elsewhere: attachment slack rather than a drop).\n",
         "## Totals — paraphrase pairs\n", summary(stats(par)), ""]
    if ctl:
        R += ["## Totals — control pairs (same-polarity member × different-polarity member; a measurement column)\n", summary(stats(ctl)), ""]
    R.append("## Paraphrase pairs\n")
    for r in par:
        R += block(r)
    if ctl:
        R.append("## Control pairs\n")
        for r in ctl:
            R += block(r)
    open(path, "w", encoding="utf-8").write("\n".join(R) + "\n")


# ----------------------------------------------------------------------------- main
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--corpus", action="append", required=True, help="corpus jsonl with equiv_class + labels (repeatable)")
    ap.add_argument("--canonical", default=os.path.join(HERE, "out_ecmp", "canonical_iteme.jsonl"))
    ap.add_argument("--out-dir", default=os.path.join(HERE, "out_ecmp"))
    ap.add_argument("--stem", default="align_faithful")
    ap.add_argument("--floor", type=int, default=3, help="min distinct classes for a record to PASS")
    ap.add_argument("--cap", type=int, default=5040, help="max renamings searched exactly; beyond it the greedy assignment")
    ap.add_argument("--intermediates", default="alignments", help="'alignments' writes <stem>_pairs.{jsonl,md}; 'none'")
    ap.add_argument("--top", type=int, default=30)
    args = ap.parse_args()
    t0 = time.time()
    vocab = C.load_vocabulary()
    surface = vocab["surface_record"]
    raw = json.load(open(os.path.join(FUSENF, "specs", "vocabulary.json"), encoding="utf-8"))
    operators = set(raw["operators"]) | set(raw.get("deprecated_operators", {}))
    records = {r["id"]: r for r in load(args.canonical)}
    pairs, meta = load_pairs(args.corpus, records)
    texts = {i: " ".join(m["sentences"]) for i, m in meta.items()}
    n_par = sum(1 for p in pairs if p["kind"] == "paraphrase")
    n_ctl = len(pairs) - n_par
    graphs = {}
    for p in pairs:
        for i in (p["a"], p["b"]):
            if i not in graphs:
                graphs[i] = Graph(records[i], operators, surface)
    print(f"{len(pairs)} pairs ({n_par} paraphrase, {n_ctl} control) over {len(graphs)} records ({time.time() - t0:.1f}s)")

    # ---- per pair: align, decompose, key, observe ----
    def fresh():
        return {"support": set(), "control": set(), "examples": []}
    factor = collections.defaultdict(lambda: dict(fresh(), alone=set(), joints=collections.defaultdict(set)))
    joint = collections.defaultdict(lambda: dict(fresh(), factors=set(), n_atoms=None, n_factors=None))
    drop = collections.defaultdict(lambda: dict(fresh(), n=0, reattach=0, head_on_other_side=0, n_atoms=None))
    role_map = collections.defaultdict(fresh)
    elem = collections.defaultdict(lambda: {"observed": set(), "preserved": set(),
                                            "substituted": collections.defaultdict(set), "one_sided": set(), "n": 0})
    pair_rows = []

    def note(e, p):
        e[("support" if p["kind"] == "paraphrase" else "control")].add(p["cls"])
        if p["kind"] == "paraphrase" and len(e["examples"]) < 3:
            e["examples"].append([p["cls"], p["a"], p["b"]])

    for p in pairs:
        ga, gb = graphs[p["a"]], graphs[p["b"]]
        al = align(ga, gb, args.cap)
        subs, singles = decompose(ga, gb, al)
        m = al["mapping"]
        jkeys, fkeys_all = [], []
        for s in subs:
            fkeys = []
            for i, j in s["factors"]:
                fk, _ = sym_key(ga, gb, m, [i], [j])
                fkeys.append(fk)
            recorded_joint = len(s["factors"]) > 1 or s["leftover_a"] or s["leftover_b"]
            jk = sym_key(ga, gb, m, s["atoms_a"], s["atoms_b"], s["anchors_a"], with_anchors=True)[0] if recorded_joint else None
            for fk in fkeys:
                e = factor[fk]
                note(e, p)
                if p["kind"] == "paraphrase":
                    if not recorded_joint:
                        e["alone"].add(p["cls"])
                    else:
                        e["joints"][jk].add(p["cls"])
            if jk:
                e = joint[jk]
                note(e, p)
                e["factors"].update(fkeys)
                e["n_atoms"] = [len(s["atoms_a"]), len(s["atoms_b"])]
                e["n_factors"] = len(s["factors"])
            jkeys.append(jk)
            fkeys_all.append(fkeys)
        for s in singles:
            g = ga if s["side"] == "a" else gb
            dk = one_key(g, s["atoms"], s["anchors"])
            e = drop[dk]
            note(e, p)
            e["n"] += 1
            e["reattach"] += int(s["reattach"])
            e["head_on_other_side"] += int(s["head_on_other_side"])
            e["n_atoms"] = len(s["atoms"])
        for rk in role_mappings(ga, gb, al):
            note(role_map[rk], p)
        if p["kind"] == "paraphrase":
            ident_a = {i for i, _ in al["identical"]}
            ident_b = {j for _, j in al["identical"]}
            near_a = dict(al["near"])
            near_b = {j: i for i, j in al["near"]}
            for g, ident, near, other in ((ga, ident_a, near_a, gb), (gb, ident_b, near_b, ga)):
                for i in g.idxs:
                    ek = elem_key(g, i)
                    e = elem[ek]
                    e["observed"].add(p["cls"])
                    e["n"] += 1
                    if i in ident:
                        e["preserved"].add(p["cls"])
                    elif i in near:
                        e["substituted"][elem_key(other, near[i])].add(p["cls"])
                    else:
                        e["one_sided"].add(p["cls"])
        row = {"cls": p["cls"], "a": p["a"], "b": p["b"], "kind": p["kind"], "control_kind": p["control_kind"],
               "mapping": m, "method": al["method"], "renamings": al["renamings"], "ambiguous": al["ambiguous"],
               "n_a": al["n_a"], "n_b": al["n_b"], "identical": len(al["identical"]), "near": len(al["near"]),
               "quality": al["quality"], "identical_parse": al["quality"] == 1.0 and al["n_a"] == al["n_b"],
               "truncated": ga.truncated or gb.truncated, "text_a": texts.get(p["a"], ""), "text_b": texts.get(p["b"], "")}
        row.update(pair_view(ga, gb, al, subs, singles, {"joint": jkeys, "factors": fkeys_all}))
        pair_rows.append(row)
    print(f"aligned {len(pairs)} pairs ({time.time() - t0:.1f}s): exact {sum(1 for r in pair_rows if r['method'] == 'exact')}, "
          f"ambiguous {sum(1 for r in pair_rows if r['ambiguous'] > 1)}, identical parses "
          f"{sum(1 for r in pair_rows if r['kind'] == 'paraphrase' and r['identical_parse'])}/{n_par}")

    # ---- records ----
    def sup(e):
        return len(e["support"])

    def ctl(e):   # classes where the key occurs in a control pair but in none of the class's paraphrase pairs
        return len(e["control"] - e["support"])

    def verdicts(e):
        ok = sup(e) >= args.floor
        return {"support": sup(e), "control_support": ctl(e), "classes": sorted(e["support"]),
                "control_classes": sorted(e["control"] - e["support"]), "pass": ok, "licensed": ok and ctl(e) == 0,
                "examples": e["examples"], "variant": "faithful"}
    def gate_of(v, alone=None):
        if not v["pass"]:
            return "FAIL"
        if v["control_support"]:
            return "CONTESTED"
        return "JOINT-ONLY" if alone == 0 else "LICENSED"
    recs = []
    for fk, e in factor.items():
        f1, f2, _ = forms_of(fk)
        v = verdicts(e)
        v["licensed"] = v["licensed"] and len(e["alone"]) > 0   # a factor never attested alone is promotable only with its joint
        recs.append(dict(v, kind="substitution-factor", a=f1, b=f2, key=list(fk), gate=gate_of(v, len(e["alone"])),
                         alone=len(e["alone"]), joint_contexts=len(e["joints"]),
                         occurrences=[len(elem[f1]["observed"]) if f1 in elem else 0, len(elem[f2]["observed"]) if f2 in elem else 0]))
    for jk, e in joint.items():
        f1, f2, anc = forms_of(jk)
        fs = sorted(e["factors"])
        v = verdicts(e)
        recs.append(dict(v, kind="substitution-joint", a=f1, b=f2, anchors=anc, key=list(jk), gate=gate_of(v),
                         factors=[" ~ ".join(forms_of(f)[:2]) for f in fs], n_factors=e["n_factors"], n_atoms=e["n_atoms"],
                         co_dependent=all(len(factor[f]["alone"]) == 0 for f in fs)))
    role_count = collections.Counter()
    for g in graphs.values():
        for i in g.idxs:
            if g.is_role_atom(i):
                role_count[g.parsed[i][0]] += 1
    for (ra, rb), e in role_map.items():
        if rb is None:
            v = verdicts(e)
            recs.append(dict(v, kind="role-lost", a=ra, b=None, licensed=None, gate="PASS" if v["pass"] else "FAIL"))
        elif ra != rb:
            maj, mnr = (ra, rb) if (role_count[ra], ra) >= (role_count[rb], rb) else (rb, ra)
            v = verdicts(e)
            recs.append(dict(v, kind="role", a=maj, b=mnr, occurrences=[role_count[maj], role_count[mnr]], gate=gate_of(v)))
    for dk, e in drop.items():
        f1, _, anc = forms_of(dk)
        v = verdicts(e)
        recs.append(dict(v, kind="drop", atoms=f1, anchors=anc, key=list(dk), licensed=None, gate="PASS" if v["pass"] else "FAIL",
                         occurrences=e["n"], reattach=e["reattach"], head_on_other_side=e["head_on_other_side"], n_atoms=e["n_atoms"]))
    for ek, e in elem.items():
        subst = sorted(((len(v), k) for k, v in e["substituted"].items()), key=lambda t: (-t[0], t[1]))
        recs.append({"kind": "element", "atom": ek, "observed": len(e["observed"]), "occurrences": e["n"],
                     "preserved": len(e["preserved"]), "substituted": sum(n for n, _ in subst),
                     "one_sided": len(e["one_sided"]), "partners": [[k, n] for n, k in subst[:5]],
                     "stability": round(len(e["preserved"]) / max(1, len(e["observed"])), 3), "variant": "faithful"})
    order = {"substitution-factor": 0, "substitution-joint": 1, "role": 2, "role-lost": 3, "drop": 4, "element": 5}
    grank = {"LICENSED": 0, "JOINT-ONLY": 1, "CONTESTED": 2, "PASS": 2, "FAIL": 3}
    recs.sort(key=lambda r: (order[r["kind"]], grank.get(r.get("gate"), 4), -(r.get("support") or 0),
                             -(r.get("observed") or 0), json.dumps(r, sort_keys=True)))
    os.makedirs(args.out_dir, exist_ok=True)
    with open(os.path.join(args.out_dir, f"{args.stem}.jsonl"), "w", encoding="utf-8") as fh:
        for r in recs:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    if "alignments" in args.intermediates:
        with open(os.path.join(args.out_dir, f"{args.stem}_pairs.jsonl"), "w", encoding="utf-8") as fh:
            for r in pair_rows:
                fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
        write_pairs_md(os.path.join(args.out_dir, f"{args.stem}_pairs.md"), pair_rows, args, args.corpus)

    # ---- Tier A scorecard (when the corpora carry target_rule labels) ----
    targets = collections.defaultdict(set)
    for i, mm in meta.items():
        tr = mm["labels"].get("target_rule")
        if tr:
            targets[tr].add(mm["equiv_class"])
    scorecard = None
    if targets:
        word = lambda w, text: re.search(r"(?<![\w])" + re.escape(w) + r"(?![\w])", text)
        smaps = [r for r in recs if r["kind"].startswith("substitution") and r["support"] >= 1]
        rows_sc, alt_rows = [], []
        for tr in sorted(targets):
            if tr.startswith("alt:"):
                ecs = targets[tr]
                ps = [r for r in pair_rows if r["kind"] == "paraphrase" and r["cls"] in ecs
                      and all(meta[i]["labels"].get("target_rule") in (None, tr) for i in (r["a"], r["b"]))]
                alt_rows.append((tr, len(ps), sum(1 for r in ps if r["identical_parse"])))
                continue
            x, y = tr.split("<-") if "<-" in tr else tr.split("~")
            parts = [q for q in y.split("_") if q not in STOP]
            hit = None
            for r in smaps:
                for u, v in ((r["a"], r["b"]), (r["b"], r["a"])):
                    if word(x, u) and (word(y, v) or all(word(q, v) for q in parts)):
                        hit = r
                        break
                if hit:
                    break
            if hit is None:   # provenance fallback (batch 1): a record supported by >= 2 of the target's own classes that mentions one lemma
                for r in smaps:
                    both = r["a"] + " " + r["b"]
                    if len(set(r["classes"]) & targets[tr]) >= 2 and (word(x, both) or any(word(q, both) for q in parts)):
                        hit = dict(r, provenance=True)
                        break
            rows_sc.append((tr, len(targets[tr]), hit))
        n_rec = sum(1 for _, _, h in rows_sc if h)
        by_gate = collections.Counter(h["gate"] for _, _, h in rows_sc if h)
        scorecard = {"recall": f"{n_rec}/{len(rows_sc)}", "rows": rows_sc, "alt": alt_rows, "by_gate": dict(by_gate)}

    # ---- markdown ----
    par_rows = [r for r in pair_rows if r["kind"] == "paraphrase"]
    n_id = sum(1 for r in par_rows if r["identical_parse"])
    qs = sorted(r["quality"] for r in par_rows)
    fac = [r for r in recs if r["kind"] == "substitution-factor"]
    jnt = [r for r in recs if r["kind"] == "substitution-joint"]
    rol = [r for r in recs if r["kind"] == "role"]
    rlo = [r for r in recs if r["kind"] == "role-lost"]
    drp = [r for r in recs if r["kind"] == "drop"]
    els = [r for r in recs if r["kind"] == "element"]

    def ex(e):
        return " ".join(e[0][1:]) if e else ""

    def sent(i):
        return texts.get(i, "")[:80]

    R = ["# §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm, read as a validation instrument\n", f"> \"{PAPER}\" — FUSE-NF §4.3.4\n",
         "**Reading.** The deliverable is a table over structural elements — subtrees and roles — with their behaviour under paraphrase: "
         "preserved, substituted by a specific other element, or one-sided; each substitution with its support in distinct paraphrase classes "
         "and its support among the control pairs. A substitution that recurs between sentences known to mean the same and never between "
         "sentences known to differ is a LICENSED unification: the evidence that two forms can be unified without semantic loss. The "
         "instrument emits evidence, never rules; a licensed unification becomes a rewrite only in `build_candidates`.\n",
         "## Implementation parameters (doc-open choices, disclosed)\n", "| parameter | choice |\n|---|---|",
         f"| pairs | every equivalence class with ≥ 2 members in `{os.path.relpath(args.canonical, HERE)}` from {', '.join(os.path.relpath(c, HERE) for c in args.corpus)}: "
         f"paraphrase pairs = same-polarity members ({n_par}), control pairs = same × different polarity ({n_ctl}); control support of a key = classes where it occurs in a control pair but in none of the class's paraphrase pairs — a measurement column, never a filter |",
         f"| alignment | the edit script: over every injective skolem renaming within each stream (e / x / f) maximise identical atoms (term + polarity), then near atoms "
         f"(same arity, same skolems in the same positions, one head or constant differs = a relabel), then the first renaming; greedy assignment above {args.cap} renamings; "
         f"eligible atoms = the miner's ({MAX_REC_ATOMS} cap, Implication and surface atoms excluded); everything else is one-sided |",
         "| regions | the atoms outside the common part, grouped per side by shared node symbols the common part does not hold (skolems, or constants standing as a term's first argument); symbols the common part holds are anchors and never merge |",
         "| substitutions | regions linked across the pair by relabels, plus every same-side region hanging on the same anchors as a relabelled region (a co-dependent edit is one substitution); recorded as each FACTOR (one relabel, the two atoms alone) and, when a substitution holds more than one factor or a leftover, as the JOINT key (all atoms of both sides + anchors); a factor's record counts the classes where it is attested ALONE and the joint contexts it occurs in; a factor never attested alone is gated JOINT-ONLY; a joint whose factors are never attested alone is `co_dependent` |",
         "| one-sided | regions with no relabel link (drops): diagnostic by default, keyed by their atoms + anchors, with per-occurrence flags `reattach` (the other side has a one-sided region on the same anchors sharing a head) and `head_on_other_side` |",
         "| roles | binary heads on an aligned event centre (class links excluded), matched by aligned centre + filler; lost when the other side has no atom there |",
         "| elements | every atom pattern (skolems abstracted, constants verbatim, strings/numbers masked) on either side of a paraphrase pair: preserved / substituted(by) / one-sided per class; `stability` = preserved classes / observed classes |",
         f"| consistency | support = distinct equivalence classes; PASS at ≥ {args.floor}; LICENSED = PASS with zero control support (a factor: attested alone at least once, else JOINT-ONLY) |",
         "| rules | none — evidence only: `(Unifiable A B)` / `(OneSided X)` in the .metta rendering, consumed by `build_candidates` |\n",
         "## Pair inventory and alignment quality\n",
         f"- {n_par} paraphrase pairs, {n_ctl} control pairs, {len(graphs)} records; {sum(1 for r in pair_rows if r['method'] == 'greedy')} pairs aligned greedily; "
         f"{sum(1 for r in pair_rows if r['ambiguous'] > 1)} pairs with a tie between renamings (the first taken); {sum(1 for r in pair_rows if r['truncated'])} pairs touching a truncated record",
         f"- paraphrase pairs with identical canonical graphs: {n_id} ({n_id / max(1, n_par):.0%}); alignment quality (identical atoms / larger side) median {qs[len(qs) // 2] if qs else 0}, "
         f"quartiles {qs[len(qs) // 4] if qs else 0} / {qs[3 * len(qs) // 4] if qs else 0}; pairs below 0.5: {sum(1 for q in qs if q < 0.5)}",
         f"- paraphrase pairs: {sum(len(r['substitutions']) for r in par_rows)} substitutions holding {sum(r['near'] for r in par_rows)} factors; "
         f"{sum(r['leftover'] for r in par_rows)} atoms left over inside substitutions; {sum(r['one_sided_atoms'] for r in par_rows)} one-sided atoms in "
         f"{sum(len(r['one_sided_a']) + len(r['one_sided_b']) for r in par_rows)} regions; {sum(1 for r in par_rows if not r['one_sided_a'] and not r['one_sided_b'])} pairs with no one-sided region\n"]
    R.append(f"## Element behaviour under paraphrase: {len(els)} atom patterns observed; {sum(1 for r in els if r['stability'] == 1.0)} always preserved, "
             f"{sum(1 for r in els if r['substituted'])} substituted at least once, {sum(1 for r in els if r['one_sided'])} one-sided at least once\n")
    R.append("| observed | preserved | substituted | one-sided | stability | element | substituted by (classes) |\n|---|---|---|---|---|---|---|")
    for r in sorted(els, key=lambda r: (-(r["substituted"] + r["one_sided"]), -r["observed"], r["atom"]))[:args.top]:
        R.append(f"| {r['observed']} | {r['preserved']} | {r['substituted']} | {r['one_sided']} | {r['stability']} | `{r['atom']}` | "
                 + ", ".join(f"`{k}` {n}" for k, n in r["partners"][:3]) + " |")
    R.append(f"\n## Substitutions — factors: {len(fac)} recorded, {sum(1 for r in fac if r['pass'])} pass, {sum(1 for r in fac if r['licensed'])} licensed (pass, zero control support, attested alone), "
             f"{sum(1 for r in fac if r['gate'] == 'JOINT-ONLY')} joint-only (pass, zero control support, never attested alone), {sum(1 for r in fac if r['gate'] == 'CONTESTED')} contested (pass with control support)\n")
    R.append("| gate | support | control | alone | joint ctx | occurrences A / B | A | B | example pair | A sentence | B sentence |\n|---|---|---|---|---|---|---|---|---|---|---|")
    for r in fac[:args.top]:
        e = r["examples"][0] if r["examples"] else None
        R.append(f"| {r['gate']} | {r['support']} | {r['control_support']} | {r['alone']} | {r['joint_contexts']} | {r['occurrences'][0]} / {r['occurrences'][1]} | `{r['a']}` | `{r['b']}` | "
                 f"{ex(r['examples'])} | {sent(e[1]) if e else ''} | {sent(e[2]) if e else ''} |")
    R.append(f"\n## Substitutions — joint keys: {len(jnt)} recorded, {sum(1 for r in jnt if r['pass'])} pass, {sum(1 for r in jnt if r['licensed'])} licensed, {sum(1 for r in jnt if r['co_dependent'])} co-dependent (no factor ever attested alone)\n")
    R.append("| gate | support | control | factors | co-dep | anchors | A | B | example pair |\n|---|---|---|---|---|---|---|---|---|")
    for r in jnt[:args.top]:
        R.append(f"| {r['gate']} | {r['support']} | {r['control_support']} | {r['n_factors']} | {'yes' if r['co_dependent'] else ''} | {' '.join(r['anchors'])} | `{r['a']}` | `{r['b']}` | {ex(r['examples'])} |")
    R.append(f"\n## Roles: {len(rol)} non-identity mappings recorded ({sum(1 for r in rol if r['pass'])} pass, {sum(1 for r in rol if r['licensed'])} licensed), {len(rlo)} role-lost records\n")
    R.append("| support | control | majority head (occ) | minority head (occ) | example pair |\n|---|---|---|---|---|")
    for r in rol[:args.top]:
        R.append(f"| {r['support']} | {r['control_support']} | {r['a']} ({r['occurrences'][0]}) | {r['b']} ({r['occurrences'][1]}) | {ex(r['examples'])} |")
    R.append("\n| support | control | role lost (no atom on the aligned centre + filler) |\n|---|---|---|")
    for r in rlo[:15]:
        R.append(f"| {r['support']} | {r['control_support']} | {r['a']} |")
    R.append(f"\n## One-sided regions (drops, diagnostic): {len(drp)} recorded, {sum(1 for r in drp if r['pass'])} pass; "
             f"{sum(r['reattach'] for r in drp)} of {sum(r['occurrences'] for r in drp)} occurrences flagged as re-attachments\n")
    R.append("| support | control | occurrences | reattach | head on other side | atoms | anchors | example pair |\n|---|---|---|---|---|---|---|---|")
    for r in drp[:args.top]:
        R.append(f"| {r['support']} | {r['control_support']} | {r['occurrences']} | {r['reattach']} | {r['head_on_other_side']} | `{r['atoms']}` | {' '.join(r['anchors']) or '—'} | {ex(r['examples'])} |")
    if scorecard:
        R.append(f"\n## Tier A scorecard (key = the corpora's target_rule labels)\n")
        R.append(f"- lexical / converse targets recovered by a substitution record mentioning both lemmas: **{scorecard['recall']}** "
                 f"(by gate: " + ", ".join(f"{g} {scorecard['by_gate'].get(g, 0)}" for g in ("LICENSED", "JOINT-ONLY", "CONTESTED", "FAIL")) + "; FAIL = below the floor)\n")
        R.append("| target | classes | recovered by |\n|---|---|---|")
        for tr, n, h in scorecard["rows"]:
            R.append(f"| {tr} | {n} | {('`' + h['a'] + '` ~ `' + h['b'] + '` (' + h['kind'].split('-')[1] + ', support ' + str(h['support']) + ', control ' + str(h['control_support']) + (', provenance' if h.get('provenance') else '') + ')') if h else '**MISS**'} |")
        R.append("\n| alt target (expects identical parses) | pairs | identical |\n|---|---|---|")
        for tr, n, ident in scorecard["alt"]:
            R.append(f"| {tr} | {n} | {ident} |")
    open(os.path.join(args.out_dir, f"{args.stem}.md"), "w", encoding="utf-8").write("\n".join(R) + "\n")

    # ---- metta (evidence rendering) ----
    with open(os.path.join(args.out_dir, f"{args.stem}.metta"), "w", encoding="utf-8") as fh:
        fh.write(";; FUSE-NF §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm (validation instrument) — readable MeTTa RENDERING\n"
                 ";; EVIDENCE, never loaded and never a rule: (Unifiable A B) says the two forms recur between sentences known to mean\n"
                 ";; the same (support = distinct paraphrase classes) and how often between sentences known to differ (control);\n"
                 ";; (OneSided X) says a region occurs in one parse only. Turning a licensed unification into a rewrite of the KB is\n"
                 ";; build_candidates' job. The record of truth is\n"
                 f";;   {args.stem}.jsonl   (every record: substitution-factor / substitution-joint / role / role-lost / drop / element)\n"
                 f";;   {args.stem}_pairs.jsonl   (one line per pair: the renaming, common subgraph, substitutions, one-sided regions)\n;;\n"
                 ";; PARAMETERS (choices the paper leaves open; disclosed)\n"
                 f";;   pairs           {n_par} paraphrase pairs + {n_ctl} control pairs from {', '.join(os.path.relpath(c, HERE) for c in args.corpus)}; control support of a\n"
                 ";;                   key = classes where it occurs in a control pair but in none of the class's paraphrase pairs (a measurement column)\n"
                 f";;                   over {os.path.relpath(args.canonical, HERE)}; {n_id} paraphrase pairs parse identically\n"
                 ";;   alignment       the edit script: every injective skolem renaming within each stream, maximising identical atoms then\n"
                 f";;                   near atoms (one relabel), first renaming on a tie; greedy assignment above {args.cap} renamings ({sum(1 for r in pair_rows if r['method'] == 'greedy')} pairs)\n"
                 ";;   regions         atoms outside the common part grouped by shared node symbols the common part does not hold; anchors never merge\n"
                 ";;   substitutions   regions linked by relabels + same-side regions on the same anchors (a co-dependent edit is one substitution);\n"
                 ";;                   recorded as each FACTOR (one relabel) and as the JOINT key (both sides + anchors)\n"
                 ";;   one-sided       regions with no relabel link; diagnostic; reattach / head-on-other-side flags per occurrence\n"
                 f";;   consistency     support = distinct equivalence classes; PASS at >= {args.floor}; LICENSED = PASS with zero control support\n;;\n"
                 ";; RECORD FORMAT\n"
                 ";;   ;; [factor|joint|role]  support <classes> (control <classes>) [alone <classes>] [co-dependent]   gate: LICENSED|JOINT-ONLY|CONTESTED|FAIL   e.g. <class a b>\n"
                 ";;   gate LICENSED = pass, zero control support, (a factor) attested alone at least once; JOINT-ONLY = a factor never attested alone,\n"
                 ";;   licensed only inside its joint; CONTESTED = pass with control support\n"
                 ";;   (Unifiable <form A> <form B>)            ; joint keys carry their anchors in the comment\n"
                 ";;   ;; [one-sided]  support … occurrences … reattach … head on other side …   gate: PASS|FAIL\n"
                 ";;   (OneSided <atoms>)\n"
                 ";; Licensed first inside each section, then joint-only, then contested, then the rest by support.\n")

        def gate(r):
            return r["gate"]

        gate_rank = {"LICENSED": 0, "JOINT-ONLY": 1, "CONTESTED": 2, "FAIL": 3}

        def key_sort(r):
            return (gate_rank[r["gate"]], -r["support"], r["a"], r.get("b") or "")
        fh.write(f"\n;; ==================== SUBSTITUTIONS — FACTORS: {sum(1 for r in fac if r['licensed'])} licensed / {sum(1 for r in fac if r['pass'])} pass of {len(fac)} ====================\n")
        for r in sorted(fac, key=key_sort):
            fh.write(f"\n;; [factor]  support {r['support']} (control {r['control_support']})  alone {r['alone']}  joint contexts {r['joint_contexts']}   gate: {gate(r)}   e.g. {ex(r['examples'])}\n"
                     f"(Unifiable {r['a']} {r['b']})\n")
        fh.write(f"\n;; ==================== SUBSTITUTIONS — JOINT KEYS: {sum(1 for r in jnt if r['licensed'])} licensed / {sum(1 for r in jnt if r['pass'])} pass of {len(jnt)} ====================\n")
        for r in sorted(jnt, key=key_sort):
            fh.write(f"\n;; [joint]  support {r['support']} (control {r['control_support']})  factors {r['n_factors']}{'  co-dependent' if r['co_dependent'] else ''}  anchors {' '.join(r['anchors']) or '—'}   gate: {gate(r)}   e.g. {ex(r['examples'])}\n"
                     f"(Unifiable {r['a']} {r['b']})\n")
        fh.write(f"\n;; ==================== ROLES: {sum(1 for r in rol if r['licensed'])} licensed / {sum(1 for r in rol if r['pass'])} pass of {len(rol)}; {len(rlo)} lost-role records ====================\n")
        for r in sorted(rol, key=key_sort):
            fh.write(f"\n;; [role]  {r['a']} ~ {r['b']}   support {r['support']} (control {r['control_support']})   occurrences {r['occurrences'][0]} / {r['occurrences'][1]}   gate: {gate(r)}   e.g. {ex(r['examples'])}\n"
                     f"(Unifiable ({r['b']} $e $x) ({r['a']} $e $x))\n")
        for r in sorted(rlo, key=lambda r: (not r["pass"], -r["support"], r["a"])):
            fh.write(f"\n;; [role-lost]  {r['a']} ~ none   support {r['support']} (control {r['control_support']})   gate: {'PASS' if r['pass'] else 'FAIL'}   e.g. {ex(r['examples'])}\n"
                     ";;   the other side has no atom on the aligned centre and filler (see the one-sided records)\n")
        fh.write(f"\n;; ==================== ONE-SIDED (diagnostic): {sum(1 for r in drp if r['pass'])} pass of {len(drp)} ====================\n")
        for r in sorted(drp, key=lambda r: (not r["pass"], -r["support"], r["atoms"])):
            fh.write(f"\n;; [one-sided]  support {r['support']} (control {r['control_support']})   occurrences {r['occurrences']}   reattach {r['reattach']}   head on other side {r['head_on_other_side']}   anchors {' '.join(r['anchors']) or '—'}   gate: {'PASS' if r['pass'] else 'FAIL'}   e.g. {ex(r['examples'])}\n"
                     f"(OneSided {r['atoms']})\n")
    print(f"-> {os.path.join(args.out_dir, args.stem)}.{{jsonl,md,metta}}: factors {len(fac)} ({sum(1 for r in fac if r['pass'])} pass, {sum(1 for r in fac if r['licensed'])} licensed), "
          f"joints {len(jnt)} ({sum(1 for r in jnt if r['pass'])} pass), roles {len(rol)} ({sum(1 for r in rol if r['pass'])} pass), drops {len(drp)} ({sum(1 for r in drp if r['pass'])} pass), "
          f"elements {len(els)}" + (f"; Tier A recall {scorecard['recall']}" if scorecard else "") + f"  total {time.time() - t0:.0f}s")


if __name__ == "__main__":
    main()
