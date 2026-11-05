"""THE GENERALIZER (§5.1, decision 3): typed anti-unification over our atom lists.

Given several FRAGMENTS — the same number of atoms each, aligned position by position (a pattern's matches are
aligned by the pattern; §5.4 aligns the two sides of a paraphrase pair first) — the generalizer returns their
least general generalization:

- a CONSTANT where every fragment has the same class symbol;
- a VARIABLE elsewhere, and two positions get the SAME variable exactly when they hold the same symbol in every
  fragment — the variable stands for the tuple of symbols it replaces, so a link that one fragment lacks is a
  link the generalization does not have;
- individuals never become constants: ``sk_bike_1`` in two sentences is two bikes;
- TYPED: the fragments must agree on every atom's skeleton — the head, the scope markers, the polarity band and
  the type of each variable — or they do not generalize (``add`` returns False and changes nothing).

The output is an abstraction CANDIDATE, never a catalog template.

A fragment is read from the SHAPE lift of a sentence, where every individual and every class symbol is a typed
variable: the atom's skeleton is its structure, the symbols behind its variables are the leaves.

THE TWO TESTS that decision 3 asks of every output (``check``):

- RENAMING: rename every individual of the matched sentences and shuffle their atoms; the same atoms must give
  the same pattern and the same generalization.
- BROKEN LINK: in one match, replace one atom's occurrence of a shared individual by a fresh one; the atoms must
  stop matching the pattern and the generalization must split that variable in two.
"""
from __future__ import annotations

import copy
import random
import re

from . import atoms as A, lift as L, patterns as P

_SLOT = re.compile(r"\$([a-z]+)")


def fragment(sentence: "P.Sentence", local_atoms: list[int]) -> list[tuple]:
    """The atoms of a shape-lifted sentence as (skeleton, leaves): a leaf is (type prefix, the symbol)."""
    out = []
    for i in local_atoms:
        key = sentence.keys[i]
        out.append((P.skeleton(key), tuple((m.group(1), sentence.symbol.get(m.group(0), m.group(0))) for m in P.VAR.finditer(key))))
    return out


class Generalizer:
    """Anti-unification as a running fold: add fragments one at a time, read the generalization at any point.
    The state is small — per leaf position, the first symbol seen, whether every fragment repeated it, and the
    class of positions that held equal symbols in every fragment so far."""

    def __init__(self):
        self.skeletons: tuple | None = None
        self.fragments = 0
        self.prefix: list[str] = []
        self.first: list[str] = []
        self.same: list[bool] = []
        self.cls: list[int] = []

    def add(self, frag: list[tuple]) -> bool:
        skeletons = tuple(sk for sk, _ in frag)
        leaves = [leaf for _, ls in frag for leaf in ls]
        if self.skeletons is None:
            self.skeletons = skeletons
            self.prefix = [p for p, _ in leaves]
            self.first = [t for _, t in leaves]
            self.same = [True] * len(leaves)
            ids: dict = {}
            self.cls = [ids.setdefault(leaf, len(ids)) for leaf in leaves]
        elif skeletons != self.skeletons:
            return False
        else:
            ids = {}
            self.cls = [ids.setdefault((c, t), len(ids)) for c, (_, t) in zip(self.cls, leaves)]
            self.same = [s and t == f for s, f, (_, t) in zip(self.same, self.first, leaves)]
        self.fragments += 1
        return True

    def result(self) -> dict:
        """``pattern``: the generalization in canonical form; ``constants``: the class symbols every fragment
        shares; ``variables``: how many variables it has."""
        if self.skeletons is None:
            return {"fragments": 0, "atoms": [], "pattern": "", "constants": [], "variables": 0}
        names: dict[int, str] = {}
        counts: dict[str, int] = {}
        tokens, constants = [], []
        for p, f, same, c in zip(self.prefix, self.first, self.same, self.cls):
            if p == "c" and same:
                tokens.append(f)
                constants.append(f)
            else:
                if c not in names:
                    counts[p] = counts.get(p, 0) + 1
                    names[c] = f"${p}{counts[p]}"
                tokens.append(names[c])
        it = iter(tokens)
        atoms = [_SLOT.sub(lambda m: next(it), sk) for sk in self.skeletons]
        pattern = P.canon(atoms)[0]
        return {"fragments": self.fragments, "atoms": P.atoms_of(pattern), "pattern": pattern,
                "constants": sorted(set(constants)), "variables": len(names)}


def lgg(fragments: list[list[tuple]]) -> dict | None:
    """The generalization of aligned fragments; ``None`` when they do not share a skeleton."""
    g = Generalizer()
    for f in fragments:
        if not g.add(f):
            return None
    return g.result()


# ------------------------------------------------------------------------------------------------- the two tests

def _render(t) -> str:
    return "(" + " ".join(_render(x) for x in t) + ")" if isinstance(t, list) else str(t)


def rename_graph(graph: dict, seed: int = 0) -> tuple[dict, dict]:
    """A copy of a graph with every individual renamed — skolem symbols, a rule's variables, the heads of skolem
    function terms, the names of rule statements — and its atoms in another order. Returns the copy and the map
    old atom index → new atom index. Class symbols, heads and truth values are untouched."""
    rng = random.Random(f"{seed}:{graph['id']}")
    names: dict[str, str] = {}

    def fresh(tok: str) -> str:
        if tok not in names:
            names[tok] = (f"$q{len(names)}" if tok.startswith("$") else f"sk_n{len(names)}")
        return names[tok]

    def term(t):
        if isinstance(t, list):
            return [fresh(t[0]) if i == 0 and A.is_function_term(t) else term(x) for i, x in enumerate(t)]
        if isinstance(t, str) and (t.startswith("sk_") or t.startswith("$")):
            return fresh(t)
        return t

    stmt: dict[str, str] = {}
    atoms = []
    for a in graph["atoms"]:
        b = dict(a)
        b["name"] = stmt.setdefault(a.get("name") or "", f"st{len(stmt)}")
        b["args"] = [term(x) for x in a["args"]]
        b["scope"] = [[m, stmt.setdefault(anc, f"st{len(stmt)}") if m.startswith("Implication") and isinstance(anc, str) and anc else term(anc)]
                      for m, anc in a["scope"]]
        atoms.append(b)
    order = list(range(len(atoms)))
    rng.shuffle(order)
    moved = {}
    out_atoms = []
    for new_i, old_i in enumerate(order):
        b = atoms[old_i]
        moved[b["i"]] = new_i
        b["i"] = new_i
        out_atoms.append(b)
    types = {names.get(k, k): v for k, v in (graph.get("types") or {}).items()}
    return {**graph, "atoms": out_atoms, "types": types}, moved


def break_link(graph: dict, atom_index: int, symbol: str, type_name: str | None = None) -> dict | None:
    """A copy of a graph in which ONE atom's occurrences of an individual (a symbol, a rule variable, a skolem
    function term as written, or a rule's statement name) are replaced by a fresh individual of the same type —
    its declared types, or ``type_name`` when the individual had none (a rule's variable is typed by the
    positions it fills, and the fresh one fills a single position). ``None`` when the atom does not hold it."""
    g = copy.deepcopy(graph)
    atom = next((a for a in g["atoms"] if a["i"] == atom_index), None)
    if atom is None:
        return None
    symbol = symbol.split("@", 1)[0]                          # a rule's variable is keyed ``$x@rule``: the token is ``$x``
    fresh = []

    def term(t):
        if isinstance(t, list):
            if A.is_function_term(t):
                if _render(t) == symbol:
                    fresh.append([t[0] + "_broken"] + t[1:])
                    return fresh[-1]
                return t
            return [t[0]] + [term(x) for x in t[1:]]
        if t == symbol:
            fresh.append(t + "_broken")
            return fresh[-1]
        return t

    atom["args"] = [term(x) for x in atom["args"]]
    atom["scope"] = [[m, term(anc)] for m, anc in atom["scope"]]
    if not fresh:
        return None
    types = g.setdefault("types", {})
    declared = types.get(symbol) or ([type_name] if type_name in ("Event", "Entity", "TimeTerm", "Instance") else None)
    if declared:
        types[_render(fresh[0])] = list(declared)
    return g


def check(cand: dict, corpus: "P.Corpus", renamed: "P.Corpus", moved: list[dict], view: str, max_matches: int = 6) -> dict:
    """The two tests on one candidate, run on its sample matches. ``renamed`` is the corpus with every graph
    renamed and shuffled (``rename_graph``), ``moved`` its atom index maps."""
    pattern = P.SEP.join(cand["pattern"]["atoms"])
    sample = cand["matches"][:max_matches]
    orig, ren, same = [], [], 0
    for m in sample:
        n = corpus.index[m["id"]]
        sh = corpus.sentences["shape"][n]
        orig.append(fragment(sh, [sh.local[g] for g in m["atoms"]]))
        new_atoms = [moved[n][g] for g in m["atoms"]]
        rv, rsh = renamed.sentences[view][n], renamed.sentences["shape"][n]
        try:
            same += P.canon([rv.keys[rv.local[g]] for g in new_atoms])[0] == pattern
            ren.append(fragment(rsh, [rsh.local[g] for g in new_atoms]))
        except KeyError:
            pass
    base = lgg(orig)
    again = lgg(ren) if len(ren) == len(orig) else None
    renaming = {"matches": len(sample), "same_pattern": same,
                "same_generalization": bool(base and again and base["pattern"] == again["pattern"])}
    renaming["pass"] = bool(sample) and same == len(sample) and renaming["same_generalization"]

    links = cand["pattern"]["labels"]["links"]
    split = retyped = 0
    if sample:
        m = sample[0]
        n = corpus.index[m["id"]]
        atoms = cand["pattern"]["atoms"]
        for v in links:
            k = max(i for i, a in enumerate(atoms) if v in P.variables(a))      # the last atom that holds the variable
            g = break_link(corpus.graphs[n], m["atoms"][k], m["bindings"].get(v, ""), cand["pattern"]["variables"].get(v))
            if g is None:
                continue
            bv = P.Sentence(n, L.lift(g, {**corpus.key, "shape": view}))
            bs = P.Sentence(n, L.lift(g, {**corpus.key, "shape": "shape"}))
            try:
                unmatched = P.canon([bv.keys[bv.local[x]] for x in m["atoms"]])[0] != pattern
                broken = lgg([fragment(bs, [bs.local[x] for x in m["atoms"]])] + orig[1:])
            except KeyError:
                continue
            if broken is None:                                   # the fresh individual took another type: no common skeleton
                retyped += unmatched
                split += unmatched
            elif unmatched and base and (broken["variables"] == base["variables"] + 1 or
                                         (v[1] == "r" and broken["variables"] > base["variables"])):
                split += 1                                      # one variable more; a rule's anchor takes the rule's own variables along
    broken_link = {"links": len(links), "split": split, "retyped": retyped, "pass": bool(links) and split == len(links)}
    return {"renaming": renaming, "broken_link": broken_link}
