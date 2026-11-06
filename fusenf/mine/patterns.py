"""THE BINDING-AWARE MINER (§5.1, decisions 1, 2 and 4): connected patterns of a few atoms that share typed
variables, enumerated inside each sentence's lifted atoms and counted by FAMILY.

A PATTERN is a set of lifted atoms in which the variables carry the binding::

    |Agent($e1,$x1)|asserted & |Patient($e2,$x1)|asserted

says that one thing is the agent of one event and the patient of another: the shared ``$x1`` is the constraint.
Distinct variables stand for distinct things, so the reflexive case (``$x1`` in both roles of one event) is a
pattern of its own. Two atoms are CONNECTED when they share a variable naming an individual, an event, a time, an
instance or a rule; a class variable of the shape view constrains (the same class twice) but never connects. A
pattern is written in a CANONICAL form — its atoms ordered and its variables renamed by first appearance — so
the same structure gets the same string in every sentence, whatever the sentence named first.

SUPPORT is counted in families of the mining share (``support_role``); the sentences, the embeddings (atom sets)
and the families of the other shares are reported beside it. Growth is level-wise: a pattern of k + 1 atoms is
built only on a frequent pattern of k atoms. Nothing is lost by that — every connected part of a frequent
pattern is at least as frequent — and the enumeration stays small.

The constraints are PARAMETERS, recorded on every candidate (``DEFAULT``): the size of a pattern, the support
threshold and the share it is counted on, the number of free variables, the relation types left out, and a cap
on the embeddings of one sentence at one size (a run reports every sentence that reached it).

The two LEVELS coexist (decision 4): the lexicalized view keeps the class symbols (``take``, ``bike``), the shape
view turns them into class variables. ``Corpus`` holds both lifts of every sentence; ``fusenf.mine.subtree``
turns the miner's matches into candidate records and links the two levels.
"""
from __future__ import annotations

import collections
import itertools
import re

from . import lift as L

VAR = re.compile(r"\$([a-z]+)(\d+)")
SEP = " & "
TYPES = {"e": "Event", "x": "Entity", "t": "TimeTerm", "i": "Instance", "c": "Class", "p": "Proposition", "r": "Rule", "v": "Any"}
VIEWS = ("lexicalized", "shape")
DEFAULT = {
    "min_atoms": 2, "max_atoms": 5,     # the size of a pattern, in atoms
    "min_families": 3,                   # the support threshold …
    "support_role": "mine",              # … counted on the families of this share; the others are reported beside it
    "max_variables": None,               # free variables in a pattern (None: no limit)
    "exclude_heads": [],                 # relation types kept out of every pattern
    "max_embeddings": 200000,            # per sentence and size: growth stops there and the run names the sentence —
    #                                      a capped sentence's counts are a lower bound and depend on its atom order
    "derived_rule_templates": ["distribution"],   # templates whose rule the emitter derives from other instances' atoms
    #                                      (the distribution's rule says of each member what is said of the group):
    #                                      a candidate that uses such a rule is labelled, never dropped
}
_PLAIN_CLASS = re.compile(r"^\|Member\((\$[a-z]+\d+),([^(),$\"§]+)\)\|asserted$")


def params_of(**overrides) -> dict:
    p = dict(DEFAULT)
    p.update({k: v for k, v in overrides.items() if v is not None})
    return p


def skeleton(key: str) -> str:
    """An atom with its variables reduced to their types: ``|Agent($e,$x)|asserted``."""
    return VAR.sub(lambda m: "$" + m.group(1), key)


def variables(key: str) -> list[str]:
    """The variables of an atom or a pattern, once each, in order of first appearance."""
    out: dict[str, None] = {}
    for m in VAR.finditer(key):
        out.setdefault(m.group(0))
    return list(out)


def head_of(key: str) -> str:
    return key.split("|", 2)[1].split("(", 1)[0]


# ---------------------------------------------------------------------------------------------- canonical form

_MEMO: dict[tuple, tuple] = {}


def canon(keys: list[str]) -> tuple[str, tuple[int, ...]]:
    """The canonical pattern of a set of atoms and the order that yields it (indices into ``keys``).

    The atoms are first sorted by a colour that no renaming can change (the skeleton, refined twice by where each
    variable occurs); atoms the colour cannot tell apart are tried in every order, and the smallest renamed
    string wins. Two atom sets get the same string exactly when one is a renaming of the other."""
    n = len(keys)
    perm = sorted(range(n), key=keys.__getitem__)
    ks = tuple(keys[i] for i in perm)
    hit = _MEMO.get(ks)
    if hit is None:
        if len(_MEMO) > 400000:
            _MEMO.clear()
        hit = _MEMO[ks] = _canon(ks)
    pattern, order = hit
    return pattern, tuple(perm[i] for i in order)


def _canon(ks: tuple) -> tuple[str, tuple[int, ...]]:
    n = len(ks)
    if n == 1:
        return L.canonical(ks[0]), (0,)
    sk = [skeleton(k) for k in ks]
    vs = [[m.group(0) for m in VAR.finditer(k)] for k in ks]
    colour = list(sk)
    for _ in range(2):
        seen: dict[str, list] = {}
        for i, lst in enumerate(vs):
            for pos, v in enumerate(lst):
                seen.setdefault(v, []).append((colour[i], pos))
        sig = {v: tuple(sorted(s)) for v, s in seen.items()}
        colour = [repr((sk[i], [sig[v] for v in vs[i]])) for i in range(n)]
    idx = sorted(range(n), key=colour.__getitem__)
    groups = [list(g) for _, g in itertools.groupby(idx, key=colour.__getitem__)]
    best, best_order = None, None
    for combo in itertools.product(*[itertools.permutations(g) for g in groups]):
        order = tuple(i for g in combo for i in g)
        s = L.canonical(SEP.join(ks[i] for i in order))
        if best is None or s < best:
            best, best_order = s, order
    return best, best_order


def atoms_of(pattern: str) -> list[str]:
    return pattern.split(SEP)


def bindings(ordered_keys: list[str]) -> dict[str, str]:
    """Sentence variable → pattern variable, for a sentence's atoms listed in the pattern's order."""
    out: dict[str, str] = {}
    counts: dict[str, int] = {}
    for m in VAR.finditer(SEP.join(ordered_keys)):
        v = m.group(0)
        if v not in out:
            p = m.group(1)
            counts[p] = counts.get(p, 0) + 1
            out[v] = f"${p}{counts[p]}"
    return out


def labels(atoms: list[str]) -> dict:
    """What kind of structure a pattern is. ``links``: the variables two or more atoms share. ``view``: "tree"
    when a rooted-subtree miner could express it — nothing shared between two events, no cycle among the
    individuals — and "join" otherwise (the cross-event bindings the tree view cannot state). ``cross_event``:
    what is an argument of two different events — a thing, a time, or an event itself (two events during a
    third); ``cyclic``: the atoms' arguments close a loop; ``in_rule`` / ``sealed``: how many atoms sit on a side
    of a rule, or under another operator (a reported clause, a negation)."""
    occ: dict[str, set] = {}
    for i, a in enumerate(atoms):
        for v in variables(a):
            occ.setdefault(v, set()).add(i)
    links = sorted(v for v, s in occ.items() if len(s) >= 2 and v[1] != "c")
    own = {}                                                    # an atom's own event: an event variable as its first argument
    args: dict[str, set] = {}                                   # a variable → the atoms it is an ARGUMENT of
    for i, a in enumerate(atoms):
        body = a.split("|", 2)[1]
        first = body.split("(", 1)[1].split(",", 1)[0].rstrip(")")
        if first.startswith("$e"):
            own[i] = first
        for v in variables(body):
            args.setdefault(v, set()).add(i)
    cross = sorted(v for v, s in args.items() if v[1] != "c" and len({own[i] for i in s if i in own and own[i] != v}) >= 2)
    inc = [(i, v) for i, a in enumerate(atoms) for v in variables(a.split("|", 2)[1]) if v[1] != "c"]   # arguments only:
    #                                 a scope anchor (the clause an atom sits in, a rule's side) is structure, not a cycle
    nodes = {("a", i) for i, _ in inc} | {("v", v) for _, v in inc}
    parent = {x: x for x in nodes}

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x
    for i, v in inc:
        parent[find(("a", i))] = find(("v", v))
    components = len({find(x) for x in nodes})
    cyclic = len(inc) - len(nodes) + components > 0
    scopes = [a.split("|", 1)[0] for a in atoms]
    return {"links": links, "class_links": sorted(v for v, s in occ.items() if len(s) >= 2 and v[1] == "c"),
            "events": sum(1 for v in occ if v[1] == "e"), "cross_event": cross, "cyclic": cyclic,
            "view": "join" if cross or cyclic else "tree",
            "in_rule": sum(1 for sc in scopes if "Implication:" in sc),                 # atoms on a side of a rule
            "sealed": sum(1 for sc in scopes if sc and "Implication:" not in sc)}       # atoms under another operator


# ------------------------------------------------------------------------------------------------ the corpus

class Sentence:
    """One sentence in one view: its atoms' keys (duplicates dropped), their units, the graph atom each came
    from, the connecting variables of each, and the atoms each such variable touches."""
    __slots__ = ("n", "id", "family", "dataset", "role", "text", "keys", "units", "src", "local", "conn", "by_var", "symbol")

    def __init__(self, n: int, lifted: dict, exclude: frozenset = frozenset()):
        self.n, self.id, self.family = n, lifted["id"], lifted.get("family") or lifted["id"]
        self.dataset, self.role, self.text = lifted.get("dataset"), lifted.get("role"), lifted.get("text")
        self.keys, self.units, self.src = [], [], []
        seen: dict[str, int] = {}
        self.local: dict[int, int] = {}                                    # graph atom → local atom (a duplicate → the one kept)
        for u in lifted["units"]:
            if exclude and head_of(u["key"]) in exclude:
                continue
            if u["key"] not in seen:
                seen[u["key"]] = len(self.keys)
                self.keys.append(u["key"])
                self.units.append(u["unit"])
                self.src.append(u["i"])
            self.local[u["i"]] = seen[u["key"]]
        self.conn = [frozenset(m.group(0) for m in VAR.finditer(k) if m.group(1) != "c") for k in self.keys]
        self.by_var: dict[str, list[int]] = {}
        for i, vs in enumerate(self.conn):
            for v in vs:
                self.by_var.setdefault(v, []).append(i)
        self.symbol = {v: s for s, v in lifted["varmap"].items()}             # variable → the sentence's symbol
        self.symbol.update({v: s for s, v in (lifted.get("rulemap") or {}).items()})
        self.symbol.update({v: s for s, v in (lifted.get("classmap") or {}).items()})


class Corpus:
    """The graphs of a run with both lifts and, per sentence, what the evidence needs by SYMBOL (so it reads the
    same in either view): the plain classes of each individual, its name, an event's tense tags."""

    def __init__(self, graphs: list[dict], key: dict | None = None, exclude_heads=()):
        key = dict(key or L.DEFAULT_KEY)
        self.key = key
        order = sorted(range(len(graphs)), key=lambda i: (graphs[i].get("family") or graphs[i]["id"], graphs[i]["id"]))
        self.graphs = [graphs[i] for i in order]                          # by family: support is counted in one sweep
        self.lifted = {v: [L.lift(g, {**key, "shape": v}) for g in self.graphs] for v in VIEWS}
        ex = frozenset(exclude_heads or ())
        self.sentences = {v: [Sentence(n, lg, ex) for n, lg in enumerate(self.lifted[v])] for v in VIEWS}
        self.index = {g["id"]: n for n, g in enumerate(self.graphs)}
        self.classes, self.names, self.tenses, self.atom_tenses = [], [], [], []
        for n, lg in enumerate(self.lifted["lexicalized"]):
            sym = self.sentences["lexicalized"][n].symbol
            cls: dict[str, list] = {}
            for k in lg["atoms"]:
                m = _PLAIN_CLASS.match(k)
                if m and m.group(1) in sym:
                    cls.setdefault(sym[m.group(1)], []).append(m.group(2))
            self.classes.append(cls)
            self.names.append(lg["evidence"].get("names") or {})
            self.tenses.append(lg["evidence"].get("tenses") or {})
            self.atom_tenses.append(lg["evidence"].get("atom_tenses") or {})

    def shape_of(self, n: int, graph_atoms: list[int]) -> str | None:
        """The shape pattern of a set of graph atoms of sentence ``n``."""
        s = self.sentences["shape"][n]
        try:
            return canon([s.keys[s.local[g]] for g in graph_atoms])[0]
        except KeyError:
            return None


# -------------------------------------------------------------------------------------------------- the miner

def mine(sents: list[Sentence], params: dict, sink=None) -> dict:
    """Level-wise growth over the sentences (sorted by family). ``sink.match(pattern, size, sentence, atoms,
    embeddings)`` is called once per frequent pattern and sentence, with the sentence's first embedding in the
    pattern's atom order (local atom indices) and the number of embeddings there. Returns the run's counts."""
    role, minfam = params["support_role"], params["min_families"]
    cap, maxvars = params["max_embeddings"], params["max_variables"]
    unit_fams: dict[str, set] = collections.defaultdict(set)
    for s in sents:
        if s.role == role:
            for u in set(s.units):
                unit_fams[u].add(s.family)
    frequent_units = {u for u, f in unit_fams.items() if len(f) >= minfam}
    current = [{(i,) for i in range(len(s.keys)) if s.conn[i] and s.units[i] in frequent_units} for s in sents]
    report = {"sentences": len(sents), "units": len(unit_fams), "frequent_units": len(frequent_units), "levels": [],
              "unit_families": {u: len(f) for u, f in unit_fams.items() if len(f) >= minfam}}
    for size in range(2, params["max_atoms"] + 1):
        ids: dict[str, int] = {}
        names: list[str] = []
        count: list[int] = []
        last: list = []
        per, total, capped, largest = [], 0, [], 0
        for s, cur in zip(sents, current):
            new: dict[tuple, tuple] = {}
            if cur:
                allowed = {i for e in cur for i in e}
                full = False
                for emb in sorted(cur):
                    cand = set()
                    for i in emb:
                        for v in s.conn[i]:
                            cand.update(s.by_var[v])
                    for j in sorted(cand):
                        if j in emb or j not in allowed:
                            continue
                        e2 = tuple(sorted(emb + (j,)))
                        if e2 in new:
                            continue
                        if len(new) >= cap:
                            full = True
                            break
                        keys = [s.keys[i] for i in e2]
                        if maxvars is not None and len({m.group(0) for k in keys for m in VAR.finditer(k)}) > maxvars:
                            continue
                        p, order = canon(keys)
                        pid = ids.get(p)
                        if pid is None:
                            pid = ids[p] = len(names)
                            names.append(p)
                            count.append(0)
                            last.append(None)
                        new[e2] = (pid, order)
                    if full:
                        capped.append(s.id)
                        break
            total += len(new)
            largest = max(largest, len(new))
            if s.role == role:
                for pid in {pid for pid, _ in new.values()}:
                    if last[pid] != s.family:               # sentences come sorted by family
                        last[pid] = s.family
                        count[pid] += 1
            per.append(new)
        frequent = {pid for pid, n in enumerate(count) if n >= minfam}
        current, kept = [], 0
        for s, new in zip(sents, per):
            keep = set()
            first: dict[int, tuple] = {}
            n_emb: dict[int, int] = collections.Counter()
            for e2 in sorted(new):
                pid, order = new[e2]
                if pid in frequent:
                    keep.add(e2)
                    n_emb[pid] += 1
                    if pid not in first:
                        first[pid] = tuple(e2[k] for k in order)
            kept += len(keep)
            current.append(keep)
            if sink is not None and size >= params["min_atoms"]:
                for pid, ordered in first.items():
                    sink.match(names[pid], size, s, ordered, n_emb[pid])
        report["levels"].append({"size": size, "embeddings": total, "patterns": len(names), "frequent": len(frequent),
                                 "embeddings_kept": kept, "largest_sentence": largest, "capped_sentences": capped})
        if not frequent:
            break
    return report
