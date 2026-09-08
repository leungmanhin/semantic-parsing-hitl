"""FUSE-NF §4.3.1 — the FAITHFUL view over the ``frequent_patterns2`` inventory (H, batch 2).

Paper §4.3.1 verbatim: "we enumerate all rooted subtrees up to a fixed size threshold in
each SENF graph and count how many sentences contain each pattern. Subtrees exceeding a
minimum support threshold reveal common semantic units — such as 'go to with two
participants' — that should be treated as single meta-nodes."

This script does NOT mine: it reads ``patterns2.jsonl`` (the inventory the miner wrote,
record of truth) and cuts out exactly the patterns that sentence describes:

  * constants verbatim (``n_lifted == 0``): a subtree of a graph keeps its constant
    leaves; the constant-lifted "shape stratum" is our addition (BATCH2_PLAN);
  * a ROOTED TREE: atoms are read as edges from their centre (first argument) to their
    other arguments, a unary atom is an attribute of its node; a pattern is a rooted
    subtree when exactly one node has no parent (the root) and every other node has
    exactly one parent — patterns that JOIN (a participant or a constant under two
    parents, e.g. two events sharing an Agent) are the miner's cross-star capability,
    an addition, and are counted but not listed;
  * size <= k atoms (the miner's ``--k``, the "fixed size threshold") and document
    support >= ``min_support`` (the "minimum support threshold") — both inherited from
    the run, disclosed, not re-applied.

Each unit carries ``closed``, computed WITHIN the faithful units: a unit is closed when
no larger faithful unit with exactly the same supporting records CONTAINS it (its atoms
embed into the larger unit's under an injective renaming of variables). Two different
units on the same records that do not contain each other are both closed. The miner's own ``dominated`` flag ranges over the full
inventory, lifted patterns and joins included, so it would mark units subsumed by an
addition — it is kept as ``miner_dominated`` for traceability only. Closed units are the
meta-node proposals, the subsumed ones the same evidence in smaller pieces
(``subsumed_by`` names the closed unit). Units of size 1 are subtrees by the letter and
stay in the JSONL and the counts, but they are NOT proposals (a one-atom pack is a rename):
the .metta renders proposals only (owner 2026-09-08). The proposed meta-node for a unit is
``(Mn<Name> <root> <other variables…>)`` with a batch-1 style readable name built from the
unit's heads and constants along the tree (Member / GroupOf contribute their constant,
roles their name, Ev / Fn for an event- or function-valued filler, Of<spec> for a filler
with atoms of its own, ``~NEG`` a Neg suffix); when two units would still share a name the
pattern id is appended. Naming is provisional (the pack vocabulary is fixed when candidates are built);
the pack rule would read ``(Implication (And <atoms>) (Mn<Name> <vars>))``.

Outputs (in --out-dir): ``patterns2_faithful.jsonl`` (one row per unit, full fields),
``patterns2_faithful.md`` (parameters, counts, top tables with one example sentence),
``patterns2_faithful.metta`` (readable rendering: every unit as a conjunctive query under a
provenance comment; closed units first, then subsumed; support-ranked). Deterministic;
no decision dates in the result files.

Usage:
  python patterns2_faithful.py [--patterns out_h/patterns2.jsonl] [--out-dir out_h]
      [--corpora ../corpora] [--top 30]
"""
from __future__ import annotations

import argparse
import collections
import glob
import itertools
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def parse_atom(atom):
    """'(Head a b …) [~NEG]' -> (head, [args], neg)"""
    neg = atom.endswith("~NEG")
    body = atom[: -len("~NEG")].strip() if neg else atom.strip()
    toks = body.strip("()").split()
    return toks[0], toks[1:], neg


def tree_info(atoms):
    """Rooted-tree test. Returns (root, root_kind, depth, n_nodes) or None (a join / cycle)."""
    parents = collections.defaultdict(set)
    nodes = set()
    children = collections.defaultdict(list)
    for a in atoms:
        _, args, _ = parse_atom(a)
        nodes.update(args)
        for ch in args[1:]:
            parents[ch].add(args[0])
            children[args[0]].append(ch)
    roots = [n for n in nodes if n not in parents]
    if len(roots) != 1 or any(len(p) > 1 for p in parents.values()):
        return None
    root = roots[0]
    depth = {root: 0}
    stack = [root]
    while stack:
        n = stack.pop()
        for ch in children[n]:
            if ch in depth:
                return None
            depth[ch] = depth[n] + 1
            stack.append(ch)
    if len(depth) != len(nodes):
        return None
    kind = ("event" if root.startswith("$e") else "entity" if root.startswith("$x")
            else "function" if root.startswith("$f") else "constant")
    return root, kind, max(depth.values()), len(nodes)


def contains(big, small):
    """small's atoms all occur in big's under one injective renaming of small's variables"""
    B = [parse_atom(a) for a in big]
    Sm = [parse_atom(a) for a in small]
    vs = sorted({t for _, args, _ in Sm for t in args if t.startswith("$")})
    vb = sorted({t for _, args, _ in B for t in args if t.startswith("$")})
    if len(vs) > len(vb):
        return False
    bset = {(h, tuple(args), n) for h, args, n in B}
    for perm in itertools.permutations(vb, len(vs)):
        m = dict(zip(vs, perm))
        if all((h, tuple(m.get(t, t) for t in args), n) in bset for h, args, n in Sm):
            return True
    return False


def variables(atoms):
    seen = []
    for a in atoms:
        for t in re.findall(r"\$[a-z]+\d+", a):
            if t not in seen:
                seen.append(t)
    return seen


def camel(tok):
    return "".join(w[:1].upper() + w[1:] for w in re.split(r"[_\-\s]+", tok.strip('"<>')) if w)


def meta_name(atoms):
    """Batch-1 style readable name, built along the tree: the root's atoms in atom order,
    Member / GroupOf / Inheritance contribute their constant, roles their name; an argument
    that is an event / function variable adds Ev / Fn; an argument that has atoms of its own
    (a deeper subtree) adds Of<its spec>; ~NEG adds Neg. Root-level tokens are joined with
    '_' and the tokens inside a nested spec with '-' (owner 2026-09-08), so
    `MnHolder_Have_Theme` is three root-level tokens, `MnAgentOfPerson_Past_Patient` reads
    "Agent (a person), Past, Patient", and `MnBeforeEvOfAgent_Past` (Past on the root event)
    differs from `MnBeforeEvOfAgent-Past` (Past inside the Before filler)."""
    parsed = [parse_atom(a) for a in atoms]
    by_centre = collections.defaultdict(list)
    for head, args, neg in parsed:
        by_centre[args[0]].append((head, args, neg))
    root = tree_info(atoms)[0]

    def spec(node, sep):
        toks = []
        for head, args, neg in by_centre[node]:
            consts = [t for t in args[1:] if not t.startswith("$")]
            if head in ("Member", "GroupOf", "Inheritance") and consts:
                tok = ("" if head == "Member" else head) + "".join(camel(c) for c in consts)
            else:
                tok = head + "".join(camel(c) for c in consts)
            for arg in args[1:]:
                if arg.startswith("$e"):
                    tok += "Ev"
                elif arg.startswith("$f"):
                    tok += "Fn"
                if arg in by_centre:
                    tok += "Of" + spec(arg, "-")
            toks.append(tok + ("Neg" if neg else ""))
        return sep.join(toks)

    return "Mn" + spec(root, "_")


def meta_node(name, root, atoms):
    vs = [root] + sorted(v for v in variables(atoms) if v != root)
    return f"({name} {' '.join(vs)})"


def render_query(atoms):
    return atoms[0] if len(atoms) == 1 else "(And " + " ".join(atoms) + ")"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--patterns", default=os.path.join(HERE, "out_h", "patterns2.jsonl"))
    ap.add_argument("--out-dir", default=None, help="default: the directory of --patterns")
    ap.add_argument("--canonical", default=os.path.join(HERE, "canonical_substrate.jsonl"),
                    help="the substrate the inventory was mined from (record count for the header)")
    ap.add_argument("--corpora", default=os.path.join(HERE, os.pardir, "corpora"))
    ap.add_argument("--top", type=int, default=30, help="rows per table in the .md")
    args = ap.parse_args()
    out_dir = args.out_dir or os.path.dirname(os.path.abspath(args.patterns))
    rows = load(args.patterns)
    n_docs = sum(1 for l in open(args.canonical, encoding="utf-8") if l.strip())
    n_covered = len({i for r in rows for i in r["ids"]})
    k = max(r["size"] for r in rows)
    min_support = min(r["support"] for r in rows)

    corp = {}
    for p in sorted(glob.glob(os.path.join(args.corpora, "*.jsonl"))):
        for r in load(p):
            corp[r["id"]] = " ".join(r.get("sentences", []))

    units, joins = [], []
    n_lifted = sum(1 for r in rows if r["n_lifted"] > 0)
    for r in rows:
        if r["n_lifted"] > 0:
            continue
        t = tree_info(r["atoms"])
        if t is None:
            joins.append(r)
            continue
        root, kind, depth, n_nodes = t
        units.append({
            "pattern_id": r["pattern_id"], "atoms": r["atoms"], "query": render_query(r["atoms"]),
            "support": r["support"], "occurrences": r["occurrences"], "size": r["size"],
            "root": root, "root_kind": kind, "depth": depth, "nodes": n_nodes,
            "miner_dominated": bool(r.get("dominated", False)), "miner_mode": r["mode"],
            "proposal": r["size"] >= 2, "meta_name": meta_name(r["atoms"]) if r["size"] >= 2 else None,
            "examples": r["examples"][:3], "tiers": r["tiers"], "per_tier": r["per_tier"],
            "ids": r["ids"], "variant": "faithful",
        })
    units.sort(key=lambda u: (-u["support"], u["pattern_id"]))
    joins.sort(key=lambda r: (-r["support"], r["pattern_id"]))
    names = collections.Counter(u["meta_name"] for u in units if u["proposal"])
    n_collide = 0
    for u in units:
        if not u["proposal"]:
            u["meta_node"] = None
            continue
        if names[u["meta_name"]] > 1:
            u["meta_name"] = f"{u['meta_name']}_{u['pattern_id']}"
            n_collide += 1
        u["meta_node"] = meta_node(u["meta_name"], u["root"], u["atoms"])
    by_set = collections.defaultdict(list)          # closure within the faithful units
    for u in units:
        by_set[frozenset(u["ids"])].append(u)
    for group in by_set.values():
        group.sort(key=lambda u: (-u["size"], u["pattern_id"]))
        for u in group:
            covers = [v for v in group if v["size"] > u["size"] and contains(v["atoms"], u["atoms"])]
            u["closed"] = not covers
            u["subsumed_by"] = covers[0]["pattern_id"] if covers else None   # the largest cover

    # ---- jsonl ----
    p_jsonl = os.path.join(out_dir, "patterns2_faithful.jsonl")
    with open(p_jsonl, "w", encoding="utf-8") as fh:
        for u in units:
            fh.write(json.dumps(u, ensure_ascii=False, sort_keys=True) + "\n")

    closed = [u for u in units if u["closed"]]
    by = lambda key, seq: dict(sorted(collections.Counter(key(u) for u in seq).items(), key=lambda kv: str(kv[0])))
    params = [
        ("substrate", f"{os.path.basename(args.canonical)} ({n_docs} records; {n_covered} carry at least one pattern) — "
                      f"{os.path.basename(args.patterns)}: {len(rows)} patterns, the miner's inventory; this view mines nothing"),
        ("size threshold", f"k = {k} atoms per pattern (the miner's --k)"),
        ("minimum support", f"{min_support} records (document support; occurrences reported beside it)"),
        ("pattern language", "skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; "
                             "<num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded"),
        ("rooted subtree", "atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); "
                           "exactly one node without a parent (the root), every other node with exactly one parent; "
                           "joins (a node under two parents) are excluded"),
        ("constants verbatim", f"n_lifted = 0 only; the {n_lifted} constant-lifted (shape-stratum) patterns are an addition"),
        ("closure", "closed = no larger faithful unit with exactly the same supporting records contains it (its atoms embed "
                    "under a renaming of variables); two different units on the same records are both closed; computed "
                    "within this view (the miner's own flag ranges over the full inventory, lifted patterns and joins "
                    "included, and is kept as miner_dominated); closed units are the meta-node proposals, subsumed units "
                    "the same evidence in fewer atoms (subsumed_by names the covering unit)"),
        ("meta-node", "(Mn<Name> <root> <other variables>) for units of size >= 2 — Name = the unit's heads and constants in atom "
                      "order along the tree (Member / GroupOf give their constant, roles their name, Ev / Fn for an event- or "
                      "function-valued filler, Of<spec> for a filler with atoms of its own, ~NEG a Neg suffix; root tokens joined with "
                      "'_', tokens inside a nested spec with '-'), the pattern id appended "
                      f"when two units would share a name ({n_collide} here); provisional; pack rule = (Implication (And <atoms>) (Mn<Name> …))"),
        ("single-atom units", "subtrees by the letter, kept in the JSONL and the counts; not proposals (a one-atom pack is a rename), "
                              "so not rendered in the .metta"),
    ]

    # ---- md ----
    L = ["# §4.3.1 Frequent Subtree Mining — FAITHFUL view (paper as written)\n",
         "> \"Here we enumerate all rooted subtrees up to a fixed size threshold in each SENF graph and count how many "
         "sentences contain each pattern. Subtrees exceeding a minimum support threshold reveal common semantic units — "
         "such as 'go to with two participants' — that should be treated as single meta-nodes.\" — FUSE-NF §4.3.1\n",
         "## Implementation parameters (choices the paper leaves open; disclosed)\n",
         "| parameter | choice |\n|---|---|"]
    L += [f"| {a} | {b} |" for a, b in params]
    L += ["", "## Counts\n",
          f"- patterns in the inventory: {len(rows)}; constants-verbatim: {len(units) + len(joins)}; "
          f"**rooted-subtree units: {len(units)}** ({len(closed)} closed, {len(units) - len(closed)} subsumed); "
          f"joins excluded: {len(joins)}; constant-lifted excluded: {n_lifted}",
          f"- units by root kind: {by(lambda u: u['root_kind'], units)}; by depth: {by(lambda u: u['depth'], units)}; "
          f"by size: {by(lambda u: u['size'], units)}",
          f"- closed units by size: {by(lambda u: u['size'], closed)}; proposals (closed, size >= 2): "
          f"{sum(1 for u in closed if u['size'] >= 2)}; of these at support >= 10 (a descriptive cut, not a threshold): "
          f"{sum(1 for u in closed if u['support'] >= 10 and u['size'] >= 2)}; single-atom units (not proposals): "
          f"{sum(1 for u in units if u['size'] == 1)}",
          ""]

    def sent(i):
        return corp.get(i, "")[:100]

    def table(title, seq, n):
        L.append(f"## {title}\n")
        L.append("| support (occ) | size | root | depth | unit | e.g. |\n|---|---|---|---|---|---|")
        for u in seq[:n]:
            L.append(f"| {u['support']} ({u['occurrences']}) | {u['size']} | {u['root_kind']} | {u['depth']} | "
                     f"`{u['query']}` | {u['examples'][0]}: {sent(u['examples'][0])} |")
        L.append("")

    table(f"Top closed units by support (size >= 2) — the meta-node proposals", [u for u in closed if u["size"] >= 2], args.top)
    table("Top closed units rooted at an entity (size >= 2)", [u for u in closed if u["size"] >= 2 and u["root_kind"] == "entity"], min(args.top, 15))
    table("Top closed units of depth >= 2 (a participant with its own links)", [u for u in closed if u["depth"] >= 2], min(args.top, 15))
    table("Largest closed units (size = k)", [u for u in closed if u["size"] == k], min(args.top, 15))
    L.append(f"## Excluded joins (constants verbatim, not a rooted tree) — top by support ({len(joins)} total; an addition, not listed in the .metta)\n")
    L.append("| support (occ) | size | pattern | e.g. |\n|---|---|---|---|")
    for r in joins[:15]:
        L.append(f"| {r['support']} ({r['occurrences']}) | {r['size']} | `{render_query(r['atoms'])}` | {r['examples'][0]}: {sent(r['examples'][0])} |")
    L.append("")
    p_md = os.path.join(out_dir, "patterns2_faithful.md")
    open(p_md, "w", encoding="utf-8").write("\n".join(L) + "\n")

    # ---- metta ----
    p_metta = os.path.join(out_dir, "patterns2_faithful.metta")
    with open(p_metta, "w", encoding="utf-8") as fh:
        fh.write(";; FUSE-NF §4.3.1 Frequent Subtree Mining — FAITHFUL view — readable MeTTa RENDERING\n"
                 ";; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is\n"
                 ";;   patterns2_faithful.jsonl  (every unit with its fields and supporting record ids)\n"
                 ";;   patterns2.jsonl           (the miner's full inventory this view is cut from)\n;;\n"
                 ";; PARAMETERS (choices the paper leaves open; disclosed)\n")
        for a, b in params:
            fh.write(f";;   {a:<19s} {b}\n")
        fh.write(";;\n;; RECORD FORMAT (every record is one unit = one rooted subtree)\n"
                 ";;   ;; <pattern id>  support <records> (occ <matches>)  size <atoms>  root <variable> (<kind>)  depth <d>\n"
                 ";;   ;;   e.g. <up to three supporting record ids>\n"
                 ";;   ;;   meta-node: (Mn<Name> <root> <other variables>)\n"
                 ";;   <the unit as a conjunctive query>\n"
                 ";; Sections: CLOSED UNITS (the meta-node proposals) then SUBSUMED UNITS (a larger unit on the same records\n"
                 ";; contains them); each sorted by support desc, then pattern id. Single-atom units are not rendered.\n")
        for title, seq in (("CLOSED UNITS", [u for u in closed if u["size"] >= 2]),
                           ("SUBSUMED UNITS", [u for u in units if not u["closed"] and u["size"] >= 2])):
            fh.write(f"\n;; ==================== {title}: {len(seq)} of {len(units)} rooted-subtree units "
                     f"(k = {k}, support >= {min_support} of {n_docs} records) ====================\n")
            for u in seq:
                fh.write(f"\n;; {u['pattern_id']}  support {u['support']} (occ {u['occurrences']})  size {u['size']}  "
                         f"root {u['root']} ({u['root_kind']})  depth {u['depth']}"
                         + ("" if u["closed"] else f"  subsumed by {u['subsumed_by']}") + "\n"
                         f";;   e.g. {' '.join(u['examples'])}\n"
                         f";;   meta-node: {u['meta_node']}\n{u['query']}\n")
    print(f"{os.path.basename(args.patterns)}: {len(rows)} patterns -> {len(units)} rooted-subtree units "
          f"({len(closed)} closed; {sum(1 for u in closed if u['size'] >= 2)} proposals, {n_collide} name collisions), "
          f"{len(joins)} joins excluded, {n_lifted} lifted excluded")
    print(f"-> {p_jsonl}\n-> {p_md}\n-> {p_metta}")


if __name__ == "__main__":
    main()
