"""THE PAIR ALIGNER (§5.4, decision 2): the two sentences of a pair aligned atom to atom, with typed role constraints
and explicit correspondences between their individuals, then generalized (§5.1's typed anti-unification) into the
invariant CORE; what the core leaves out on either side is the RESIDUAL, read as edits.

A SIDE is one sentence. Its statements are taken on the RESOLVED VIEW (``tmpl.reason.view``: a certain coreference
link or a stated identity merges its two symbols), which is the guard "coreference inside a side resolved first": a
mention and its antecedent are one individual. The graph of those statements is lifted in the shape view with tense
and habituality in the key, so that an event's tense is part of what aligns (a hard constraint for a paraphrase).

THE ALIGNMENT is a correspondence φ between the individuals of the two sides (events, things, times, instances, rules
and a rule's own variables), TYPED (an event corresponds only to an event) and one-to-one, partial (an individual may
correspond to nothing); every correspondence it keeps is backed by an aligned atom that holds the two individuals. Two atoms align under φ when they have the same FRAME — the head, the argument skeleton and
the scope operators above them, each operator's anchor corresponding (the guard "same scope operator": an atom sealed
in a reported clause, under a modal or on a side of a rule aligns only with an atom under the same operator) — and φ
maps the individuals of one onto the individuals of the other, position by position. Negation is the one operator
aligned ACROSS, and only to be recorded as a flip. An aligned pair is

    exact     every class symbol the same;
    relabel   a class symbol differs (kid / child, cut / slice, little / young inside a Narrow class);
    flip      the polarity differs: one side's atom sits under one more negation, or its statement is denied where
              the other's is asserted (the aligned core flips polarity);
    band      the same polarity at another degree (asserted / graded).

The search is a beam over the individuals of the first side, the most connected first and a rule's own variables
after the rule's sentence-level individuals. An aligned pair weighs its kind's base (exact 1, any other 0.5; a flip or
band pair whose classes also differ, 0.25) plus one for each class symbol the two atoms share, so the same word on both
sides counts for more than a matching role structure around different words. Atoms with no individual (an operator's own
atom with placeholders) are not aligned. A WORD that stands where an individual stands — a bare plural or a mass noun as an
argument ("cutting onions": ``(Patient e onion)``), a time word — is a word of its atom like a class symbol, never one of
the corresponding individuals: "cutting onions" / "cutting tofu" is a relabel at ``Patient($e,·)``, and such an atom
aligns only with an atom that has a word at the same place.

THE CORE is the generalization of the exact and relabelled pairs (``generalize.Generalizer``): a constant where the
two sides agree, a class variable where they differ, a shared variable per corresponding pair of individuals.

THE RESIDUAL, read as EDITS (``edits``):

    class         a relabelled class symbol at its position (``Member($x,·)``, ``Member($x,(Narrow $c (Member ·)))``),
                  one per differing class symbol;
    substitution  atoms of BOTH sides that align with nothing and hang on the same corresponding individuals — a
                  role permutation with a verb change (give / receive), a structural rewrite (with a hat / has a
                  hat); a relabel on such an individual joins it (a converse's verb change and its role swaps are one
                  edit);
    drop          atoms of ONE side with no counterpart: that side says more (a modifier, a location);
    flip, band    the pairs of those kinds.

Everything here is pure Python on our side; the engine never runs here (``fusenf.mine.paraphrase`` asks it).
"""
from __future__ import annotations

import collections
import hashlib
import json
import re

from . import TEMPLATES  # noqa: F401  (puts templates/ on the path)
from . import atoms as A, generalize as G, lift as L, patterns as P
from tmpl import answers as ANS, reason as R, validate as V

KEY = L.key_of(polarity="three", tense="key", habitual="key", shape="shape")
LEX = L.key_of(polarity="three", tense="key", habitual="key", shape="lexicalized")
BASE = {"exact": 1.0, "relabel": 0.5, "flip": 0.5, "band": 0.5}
TYPE_ORDER = {"e": 0, "x": 1, "t": 2, "i": 3, "p": 4, "v": 5, "r": 6}
SIGN = {"asserted": 1, "graded": 1, "denied": -1}
VAR = P.VAR
RULE_TV = "(CTV (STV 1.0 0.99) (STV 0.0 0.0))"     # the seeded rules' convention: nothing follows from a failed premise


# --------------------------------------------------------------------------------------------------- the sides

TENSES = ("Past", "Future")


def _adjective_default(p, q) -> bool:
    """``(Member s (Narrow N (Member A)))`` → ``(Member s A)``."""
    return (isinstance(p, list) and len(p) == 3 and p[0] == "Member" and isinstance(p[2], list) and len(p[2]) == 3
            and p[2][0] == "Narrow" and isinstance(p[2][2], list) and len(p[2][2]) == 2 and p[2][2][0] == "Member"
            and isinstance(q, list) and len(q) == 3 and q[0] == "Member" and q[1] == p[1] and q[2] == p[2][2][1])


def _class_definition(p, q) -> bool:
    """A NARROWED CLASS's definition, ``(Implication BODY (Member $y (Narrow N R)))``, where BODY says of ``$y`` the
    class N (or a narrowed form of it) and what each restriction in R names: ``(PartOf journal)`` ← ``(PartOf $y
    journal)``, a modifier ← ``$y``'s membership of the class narrowed by it, ``(Relation wife berry)`` ← a wife state
    ``$y`` bears toward berry, ``(Event have Theme …)`` ← a having whose theme is ``$y``. Such a rule is true whatever
    the sentence says: it is what the class term means."""
    if not (isinstance(q, list) and len(q) == 3 and q[0] == "Member" and A.is_variable(q[1]) and isinstance(q[2], list)
            and len(q[2]) == 3 and q[2][0] == "Narrow"):
        return False
    y, cls, r = q[1], q[2][1], q[2][2]
    conj = [c for c in (p[1:] if isinstance(p, list) and p and p[0] == "And" else [p]) if isinstance(c, list) and c]
    pats = r[1:] if isinstance(r, list) and r and r[0] == "And" else [r]
    if not all(isinstance(pt, list) and pt for pt in pats):
        return False

    def shown(pt) -> bool:
        if pt[0] == "Relation" and len(pt) == 3:
            return any(c[0] == "Bearer" and len(c) == 3 and c[2] == y and A.is_variable(c[1]) and ["Member", c[1], pt[1]] in conj
                       and (["Theme", c[1], pt[2]] in conj or ["Bearer", c[1], pt[2]] in conj) for c in conj)
        if pt[0] == "Event" and len(pt) >= 3:
            return any(c[0] == pt[2] and len(c) == 3 and c[2] == y and A.is_variable(c[1]) and ["Member", c[1], pt[1]] in conj
                       for c in conj)
        if len(pt) != 2:
            return False
        return (pt[0] in ("Member", "Mod") and ["Member", y, ["Narrow", cls, pt]] in conj) or [pt[0], y, pt[1]] in conj
    base = (["Member", y, cls] in conj
            or any(len(c) == 3 and c[0] == "Member" and c[1] == y and isinstance(c[2], list) and c[2][:2] == ["Narrow", cls] for c in conj)
            or any(pt[0] == "Relation" and len(pt) == 3 and pt[1] == cls for pt in pats))
    return base and all(shown(pt) for pt in pats)


def implied_rule(term) -> str | None:
    """A rule the emitter adds beside a sentence's own facts, so that whoever has the facts has the rule: asking it of
    the other sentence would ask nothing the facts do not. Three kinds —

    ``distribution``       what is said of a group, said of each member: premised on ``(PartOf $x <group>)``, the group a
                           symbol or, inside another rule, a skolem term;
    ``adjective-default``  ``(Implication (Member s (Narrow N (Member A))) (Member s A))``, bare or with the same tense
                           around both sides;
    ``class-definition``   what makes a thing a member of a narrowed class (``_class_definition``).

    ``None`` for any other statement: a generic, a frequency, a conditional … is content."""
    if not (isinstance(term, list) and len(term) == 3 and term[0] == "Implication"):
        return None
    p, q = term[1], term[2]
    if isinstance(p, list) and len(p) == 3 and p[0] == "PartOf" and A.is_variable(p[1]) \
            and ((isinstance(p[2], str) and not A.is_variable(p[2])) or A.is_function_term(p[2])):
        return "distribution"
    if _adjective_default(p, q):
        return "adjective-default"
    if (isinstance(p, list) and isinstance(q, list) and len(p) == 2 and len(q) == 2 and p[0] == q[0] and p[0] in TENSES
            and _adjective_default(p[1], q[1])):
        return "adjective-default"
    if _class_definition(p, q):
        return "class-definition"
    return None


def _sub(t, canon: dict):
    if isinstance(t, list):
        return [_sub(x, canon) for x in t]
    return canon.get(t, t) if isinstance(t, str) else t


def resolve_graph(graph: dict, canon: dict) -> dict:
    """The graph on the resolved view: merged symbols replaced, a link that now joins a symbol to itself dropped, an
    atom stated twice kept once."""
    atoms, seen = [], set()
    for a in graph["atoms"]:
        b = dict(a)
        b["args"] = _sub(a["args"], canon)
        b["scope"] = [[m, _sub(anc, canon)] for m, anc in a["scope"]]
        if b["head"] in ("Coref", "Same") and len(b["args"]) == 2 and b["args"][0] == b["args"][1]:
            continue
        k = json.dumps([b["head"], b["args"], b["scope"], b["s"], b["kind"], b.get("tense")])
        if k in seen:
            continue
        seen.add(k)
        atoms.append(b)
    for i, a in enumerate(atoms):
        a["i"] = i
    types: dict[str, set] = {}
    for sym, ts in (graph.get("types") or {}).items():
        types.setdefault(canon.get(sym, sym), set()).update(ts)
    return {**graph, "atoms": atoms, "types": {k: sorted(v) for k, v in types.items()}}


def is_word(prefix: str, sym: str) -> bool:
    """A WORD standing where an individual stands: a bare plural or a mass noun as an argument ("lifting barbells":
    ``(Patient sk_lift_1 barbell)``), a time word (``(Time e later)``). The lift gives it an individual's variable;
    for a pair it is a word at its position — two of them are compared by name, like any class symbol, and never made
    to correspond (weights are not barbells because both are lifted)."""
    return prefix not in ("c", "r") and not (sym.startswith("sk_") or sym.startswith("$") or sym.startswith("("))


class Side:
    """One sentence of a pair: ``statements`` on the resolved view (with ``canon``, the merged symbols), the resolved
    ``graph``, its two lifts, and ``atoms`` — the alignable atoms, each a dict::

        {"n": 0, "i": <graph atom>, "key": <shape key>, "lex": <lexicalized key>, "skeleton": ..., "frame": ...,
         "sign": 1 | -1, "band": "asserted" | "graded" | "denied", "leaves": [(prefix, symbol), ...],
         "inds": [leaf positions of individuals], "classes": [leaf positions of words: class symbols, and the words
         that stand where an individual stands (``is_word``)], "scope": <shape scope>,
         "implied": <the implied rule's kind when the atom sits in one>}
    """

    def __init__(self, graph: dict, statements: list[str] | None = None, canon: dict | None = None, rid: str | None = None):
        self.id = rid or graph.get("id")
        self.text = graph.get("text", "")
        self.statements = list(statements or [])
        self.canon = dict(canon or {})
        self.graph = graph
        self.implied = {}                                       # statement name → implied rule kind
        for st in self.statements:
            p = ANS.statement_parts(st)
            if p and isinstance(p[0], str):
                kind = implied_rule(p[1])
                if kind:
                    self.implied[p[0]] = kind
        self.shape = L.lift(graph, KEY)
        self.lex = L.lift(graph, LEX)
        sym = {v: s for s, v in self.shape["varmap"].items()}
        sym.update({v: s for s, v in (self.shape.get("rulemap") or {}).items()})
        sym.update({v: s for s, v in (self.shape.get("classmap") or {}).items()})
        self.symbol = sym
        lexkey = {u["i"]: u["key"] for u in self.lex["units"]}
        by_i = {a["i"]: a for a in graph["atoms"]}
        self.atoms: list[dict] = []
        seen: set[str] = set()
        for u in self.shape["units"]:
            key = u["key"]
            if key in seen:
                continue
            ga = by_i[u["i"]]
            if ga["head"] == "Implication" and ga["kind"] == "scope":
                continue                                        # a rule is its two sides' atoms (their anchor)
            leaves = [(m.group(1), sym.get(m.group(0), m.group(0))) for m in VAR.finditer(key)]
            standing = [k for k, (p, s) in enumerate(leaves) if is_word(p, s)]     # words where an individual stands
            inds = [k for k, (p, _) in enumerate(leaves) if p != "c" and k not in standing]
            if not inds:
                continue                                        # an operator's own atom with placeholders only
            seen.add(key)
            sk = P.skeleton(key).split("|")
            scope_markers = sk[0].split("/") if sk[0] else []
            nots = sum(1 for m in scope_markers if m == "Not")
            frame = "|".join(["/".join(m for m in scope_markers if m != "Not"), sk[1]] + sk[3:])
            if standing:                                        # a word there aligns only with a word there
                frame += "#" + ",".join(str(k) for k in standing)
            band = sk[2] if len(sk) > 2 else "asserted"
            self.atoms.append({"n": len(self.atoms), "i": u["i"], "key": key, "lex": lexkey.get(u["i"], key),
                               "skeleton": P.skeleton(key), "frame": frame, "band": band,
                               "sign": SIGN.get(band, 1) * (-1) ** nots, "leaves": leaves, "inds": inds,
                               "classes": [k for k, (p, _) in enumerate(leaves) if p == "c" or k in standing],
                               "scope": key.split("|", 1)[0], "name": ga.get("name"), "nots": nots,
                               "implied": self.implied.get(ga.get("name"))
                               if any(m.startswith("Implication") for m, _ in ga["scope"]) else None})

    @classmethod
    def of_record(cls, row: dict, catalog: dict, threshold: float = R.CERTAIN) -> "Side | None":
        """A side from a parsed row (``*.parsed.jsonl``): the emitter's statements, their resolved view, the graph."""
        reply = row.get("reply") or {}
        resp = reply.get("response")
        if not isinstance(resp, dict) or reply.get("error"):
            return None
        res = V.inspect(resp, catalog, text=row.get("text", ""))
        g = A.graph_of(row, catalog, inspected=res)
        if g is None:
            return None
        v = R.view(res["statements"], threshold)
        return cls(resolve_graph(g, v["canon"]), v["statements"], v["canon"], rid=row["id"])

    def individuals(self) -> dict[str, str]:
        """symbol → type prefix, for every individual an alignable atom holds."""
        out = {}
        for a in self.atoms:
            for k in a["inds"]:
                p, s = a["leaves"][k]
                out.setdefault(s, p)
        return out


def zone(sym: str) -> int:
    """0 for a sentence-level individual, 1 for a rule's anchor or one of a rule's own variables (``$x@r``,
    ``(sk_f $x)@r``): the two never correspond to each other."""
    return 1 if ("@" in sym or not (sym.startswith("sk_") or sym.startswith("$"))) else 0


# ------------------------------------------------------------------------------------------------ the alignment

def _kind(a: dict, b: dict) -> tuple[str, list]:
    diffs = [(k, a["leaves"][k][1], b["leaves"][k][1]) for k in a["classes"] if a["leaves"][k][1] != b["leaves"][k][1]]
    if a["skeleton"] == b["skeleton"]:
        return ("exact" if not diffs else "relabel"), diffs
    return ("flip" if a["sign"] != b["sign"] else "band"), diffs


def _weight(kind: str, diffs: list, classes: int) -> float:
    """An aligned pair's weight: its kind's base, plus one for every class symbol the two atoms share — so that the
    same word on both sides (look / look) outweighs a matching role structure around different words (gather / look)."""
    return BASE[kind] / (2 if kind in ("flip", "band") and diffs else 1) + (classes - len(diffs))


def _rank(a: dict, b: dict) -> tuple:
    kind, diffs = _kind(a, b)
    return ({"exact": 0, "relabel": 1, "band": 2, "flip": 3}[kind], len(diffs))


def align(X: Side, Y: Side, beam: int = 64) -> dict:
    """The best correspondence of X's individuals onto Y's and the atom pairs it aligns. Returns::

        {"phi": {x symbol: y symbol}, "pairs": [[x atom n, y atom n, kind, diffs]], "unaligned": [[x atom ns], [y atom ns]],
         "score": s, "ties": <alignments as good that align other words>, "search": {"steps", "beam"}}
    """
    xa, ya = X.atoms, Y.atoms
    yindex: dict[tuple, list[int]] = collections.defaultdict(list)
    for b in ya:
        yindex[(b["frame"], tuple(b["leaves"][k][1] for k in b["inds"]))].append(b["n"])
    xind, yind = X.individuals(), Y.individuals()
    deg = collections.Counter(s for a in xa for s in {a["leaves"][k][1] for k in a["inds"]})

    def rule_of(s: str) -> str:
        return s.rsplit("@", 1)[1] if "@" in s else s

    # every ordering below reads the atoms' skeletons and words, never a symbol's name or the atoms' order, so that
    # renaming the individuals or shuffling the statements cannot change the search
    isig: dict[str, list] = collections.defaultdict(list)
    rsig: dict[str, list] = collections.defaultdict(list)
    for a in xa:
        words = tuple(a["leaves"][k][1] for k in a["classes"])
        for k in a["inds"]:
            sym = a["leaves"][k][1]
            isig[sym].append((a["frame"], k, words))
            if zone(sym):
                rsig[rule_of(sym)].append((a["frame"], words))
    isig = {k: repr(sorted(v)) for k, v in isig.items()}
    rsig = {k: repr(sorted(set(v))) for k, v in rsig.items()}
    order = sorted(xind, key=lambda s: (zone(s), rsig.get(rule_of(s), "") if zone(s) else "", 0 if (zone(s) and "@" not in s) else 1,
                                        -deg[s], TYPE_ORDER.get(xind[s], 9), isig[s]))
    pos = {s: k for k, s in enumerate(order)}
    completes: list[list[int]] = [[] for _ in order]
    for a in xa:
        completes[max(pos[a["leaves"][k][1]] for k in a["inds"])].append(a["n"])

    def signature(atoms) -> dict[str, set]:                     # an individual → the (frame, position) it fills
        sig: dict[str, set] = collections.defaultdict(set)
        for a in atoms:
            for k in a["inds"]:
                sig[a["leaves"][k][1]].add((a["frame"], k))
        return sig
    xsig, ysig = signature(xa), signature(ya)
    options_of = {s: [t for t in sorted(yind) if yind[t] == xind[s] and zone(t) == zone(s) and xsig[s] & ysig[t]] + [None]
                  for s in order}

    def words(atom) -> tuple:
        return tuple(atom["leaves"][k][1] for k in atom["classes"])

    def complete(state, step):
        """The atoms whose individuals are all decided at this step, matched to the other side's atoms with the same
        frame and the corresponding individuals: the heaviest pairs first (exact before relabel before band and flip),
        ties by the words, each atom of either side used once."""
        score, phi, used_y, used_atoms, pairs = state
        options = []
        for an in completes[step]:
            a = xa[an]
            img = []
            for k in a["inds"]:
                t = phi.get(a["leaves"][k][1])
                if t is None:
                    break
                img.append(t)
            else:
                for bn in yindex.get((a["frame"], tuple(img)), ()):
                    if bn not in used_atoms:
                        kind, diffs = _kind(a, ya[bn])
                        w = _weight(kind, diffs, len(a["classes"]))
                        options.append((-w, a["skeleton"], words(a), words(ya[bn]), an, bn, kind, tuple(diffs)))
        if not options:
            return state
        options.sort(key=lambda o: o[:4])
        new_used, new_pairs, taken = set(used_atoms), list(pairs), set()
        for negw, _, _, _, an, bn, kind, diffs in options:
            if an in taken or bn in new_used:
                continue
            taken.add(an)
            new_used.add(bn)
            new_pairs.append((an, bn, kind, diffs))
            score -= negw
        return (score, phi, used_y, frozenset(new_used), tuple(new_pairs))

    def lexsig(pairs) -> tuple:
        """Ties between equally good alignments are broken by the words they pair (the class symbols, in the
        skeleton's order), never by the symbols' names: renaming the individuals cannot change the choice."""
        return tuple(sorted((xa[an]["skeleton"], tuple(xa[an]["leaves"][k][1] for k in xa[an]["classes"]),
                             tuple(ya[bn]["leaves"][k][1] for k in ya[bn]["classes"]), kind) for an, bn, kind, _ in pairs))

    states = [(0.0, {}, frozenset(), frozenset(), ())]
    for step, s in enumerate(order):
        children = []
        for st in states:
            for t in options_of[s]:
                if t is not None and t in st[2]:
                    continue
                phi = dict(st[1])
                phi[s] = t
                children.append(complete((st[0], phi, st[2] | {t} if t else st[2], st[3], st[4]), step))
        children.sort(key=lambda c: (-c[0], lexsig(c[4])))
        states = children[:beam]
    if not states:
        states = [(0.0, {}, frozenset(), frozenset(), ())]
    states.sort(key=lambda c: (-c[0], lexsig(c[4])))
    best = states[0]
    top = [c for c in states if c[0] == best[0]]
    sigs = {frozenset((xa[an]["lex"], ya[bn]["lex"], kind) for an, bn, kind, _ in c[4]) for c in top}
    pairs = sorted(best[4])
    used_x = {an for an, _, _, _ in pairs}
    used_y = {bn for _, bn, _, _ in pairs}
    justified = {xa[an]["leaves"][k][1] for an in used_x for k in xa[an]["inds"]}
    return {"phi": {s: t for s, t in best[1].items() if t is not None and s in justified},   # an aligned atom backs each one
            "pairs": [[an, bn, kind, [list(d) for d in diffs]] for an, bn, kind, diffs in pairs],
            "unaligned": [[a["n"] for a in xa if a["n"] not in used_x], [b["n"] for b in ya if b["n"] not in used_y]],
            "score": best[0], "ties": len(sigs) - 1, "search": {"steps": len(order), "beam": beam}}


def core(X: Side, Y: Side, al: dict) -> dict:
    """The generalization of the exact and relabelled pairs: ``pattern`` (canonical), ``constants``, ``variables``,
    ``atoms`` (how many)."""
    pairs = [(an, bn) for an, bn, kind, _ in al["pairs"] if kind in ("exact", "relabel")]
    if not pairs:
        return {"pattern": "", "constants": [], "variables": 0, "atoms": 0}
    def leaves(atom):                                            # a word where an individual stands generalizes as a class
        return tuple(("c", s) if k in atom["classes"] else (p, s) for k, (p, s) in enumerate(atom["leaves"]))
    g = G.Generalizer()
    ok = g.add([(X.atoms[an]["skeleton"], leaves(X.atoms[an])) for an, _ in pairs]) and \
        g.add([(Y.atoms[bn]["skeleton"], leaves(Y.atoms[bn])) for _, bn in pairs])
    if not ok:                                                   # never: an exact or relabelled pair shares its skeleton
        raise AssertionError("aligned pairs with different skeletons")
    res = g.result()
    return {"pattern": res["pattern"], "constants": res["constants"], "variables": res["variables"], "atoms": len(pairs)}


# --------------------------------------------------------------------------------------------- the residual edits

_HEAD = re.compile(r"^([^(]+)\((.*)\)$", re.S)


def _split_args(s: str) -> list[str]:
    """The top-level, comma-separated arguments of a lifted body's argument list (nested terms use spaces)."""
    out, depth, cur, in_str = [], 0, [], False
    for i, ch in enumerate(s):
        if ch == '"' and (i == 0 or s[i - 1] != "\\"):
            in_str = not in_str
        if not in_str:
            if ch == "(":
                depth += 1
            elif ch == ")":
                depth -= 1
            elif ch == "," and depth == 0:
                out.append("".join(cur))
                cur = []
                continue
        cur.append(ch)
    if cur:
        out.append("".join(cur))
    return out


def metta_of_body(body: str) -> str:
    """``Member($x1,(Narrow girl (Member little)))`` → ``(Member $x1 (Narrow girl (Member little)))``."""
    m = _HEAD.match(body)
    if not m:
        return body
    return "(" + " ".join([m.group(1)] + _split_args(m.group(2))) + ")"


def _body(key: str) -> str:
    return key.split("|")[1]




def class_rule(atom: dict, k: int, a_class: str, b_class: str) -> tuple[str, str]:
    """One class correspondence at one position, read off a relabelled atom's shape key ``k``-th leaf: the POSITION
    (the atom's body with ``·`` at that leaf, the other classes ``$c``, the individuals their types) and the RULE that
    rewrites ``a_class`` into ``b_class`` there — the individuals as the rule's variables, every other class a class
    variable, the seeded rules' truth value. A word that stands where an individual stands is a class here like any
    other: ``Patient($e,·)`` for "cutting onions" / "cutting tofu"."""
    key = atom["key"]
    shift = len(VAR.findall(key.split("|", 1)[0]))              # the scope's anchors come first among the leaves
    kb = k - shift
    body = _body(key)
    words = {j - shift for j in atom["classes"]}

    def render(which: str | None) -> str:
        leaf = [-1]
        names: dict[str, str] = {}

        def sub(m):
            leaf[0] += 1
            v, p = m.group(0), m.group(1)
            if leaf[0] == kb:
                return "·" if which is None else which
            word = leaf[0] in words
            if which is None:
                return "$c" if word else "$" + p
            if v not in names:
                stem = "$k" if word else "$v"
                names[v] = f"{stem}{sum(1 for n in names.values() if n.startswith(stem)) + 1}"
            return names[v]
        return VAR.sub(sub, body)

    return render(None), f"(: RULE (Implication {metta_of_body(render(a_class))} {metta_of_body(render(b_class))}) {RULE_TV})"


def _lexsym(side: Side) -> dict:
    out = {v: s for s, v in side.lex["varmap"].items()}
    out.update({v: s for s, v in (side.lex.get("rulemap") or {}).items()})
    return out


def _joint_keys(items: list[tuple[str, dict, Side, dict]]) -> str:
    """The canonical string of tagged atoms from both sides, their individuals named by the joint ``node`` maps
    (an individual of either side that corresponds is ONE node): ``items`` = (tag, atom, side, node map). A word that
    stands where an individual stands is written as itself, as in the rule made from the same atoms."""
    names: dict = {}
    counts: collections.Counter = collections.Counter()
    keys = []
    for tag, atom, side, node in items:
        sym = _lexsym(side)

        def sub(m):
            v = m.group(0)
            if is_word(m.group(1), sym.get(v, v)):
                return sym[v]
            n = node.get(sym.get(v, v), ("?", v))
            if n not in names:
                counts[m.group(1)] += 1
                names[n] = f"${m.group(1)}{100 + counts[m.group(1)]}"
            return names[n]
        keys.append(tag + VAR.sub(sub, atom["lex"]))
    return P.canon(keys)[0] if keys else ""


def _term(t, mapping: dict):
    if isinstance(t, list):
        return [_term(x, mapping) for x in t]
    return mapping.get(t, t) if isinstance(t, str) else t


MAX_SIDE = 4      # a substitution with more atoms on a side gets no rule: too specific to recur, costly to search


def _compatible(a, b) -> bool:
    """Can the two terms unify, a variable or a skolem term of a candidate rule matching anything?"""
    if isinstance(a, str) and (A.is_variable(a)) or isinstance(b, str) and A.is_variable(b):
        return True
    if isinstance(a, list) and a and isinstance(a[0], str) and a[0].startswith("sk_p54_"):
        return True
    if isinstance(b, list) and b and isinstance(b[0], str) and b[0].startswith("sk_p54_"):
        return True
    if isinstance(a, list) and isinstance(b, list):
        return len(a) == len(b) and all(_compatible(x, y) for x, y in zip(a, b))
    return a == b


def self_feeding(premise: list, consequent: list) -> bool:
    """A rule whose consequent can satisfy every atom of its own premise again: backward chaining on it never ends
    (each new skolem term asks for another). ``(Agent $1 $2) (Near $3 $4) (Theme $1 $5) → (Agent (sk $…) $5) (Near $1 $2)
    (Theme $1 (sk $…)) …`` feeds itself; give → receive does not (its premise asks for a giving)."""
    return all(any(p[0] == q[0] and _compatible(p, q) for q in consequent) for p in premise)


def _rule_of(lhs: list[tuple[dict, Side, dict]], rhs: list[tuple[dict, Side, dict]], salt: str) -> str | None:
    """An executable rule for a substitution: the left side's atoms as the premise, the right side's as the
    consequent; the corresponding individuals and the left side's own as the rule's variables, the right side's own
    as skolem terms of those (an individual only the consequent names is a new one). ``None`` unless every atom is a
    sentence-level, asserted predication, each side holds at most ``MAX_SIDE`` atoms, and the rule cannot feed
    itself (``self_feeding``)."""
    if len(lhs) > MAX_SIDE or len(rhs) > MAX_SIDE:
        return None
    var: dict = {}
    for atom, side, node in lhs:
        ga = side.graph["atoms"][atom["i"]]
        if atom["scope"] or atom["band"] != "asserted" or ga.get("tense"):
            return None
        for s in _symbols(ga["args"]):
            n = node.get(s)
            if n is not None and n not in var:
                var[n] = f"$v{len(var) + 1}"
    left_vars = sorted(var.values(), key=lambda v: int(v[2:]))
    new: dict = {}
    for atom, side, node in rhs:
        ga = side.graph["atoms"][atom["i"]]
        if atom["scope"] or atom["band"] != "asserted" or ga.get("tense"):
            return None
        for s in _symbols(ga["args"]):
            n = node.get(s)
            if n is not None and n not in var and n not in new:
                new[n] = f"sk_p54_{salt}_{len(new) + 1}"

    def terms(group):
        out = []
        for atom, side, node in group:
            ga = side.graph["atoms"][atom["i"]]
            m = {}
            for s in _symbols(ga["args"]):
                n = node.get(s)
                if n in var:
                    m[s] = var[n]
                elif n in new:
                    m[s] = [new[n]] + left_vars if left_vars else new[n]
            out.append([ga["head"]] + _term(ga["args"], m))
        return out
    premise, consequent = terms(lhs), terms(rhs)
    if self_feeding(premise, consequent):
        return None

    def conj(ts):
        return ts[0] if len(ts) == 1 else ["And"] + ts
    return f"(: RULE {ANS.render(['Implication', conj(premise), conj(consequent)])} {RULE_TV})"


def _symbols(args) -> list[str]:
    out = []
    for a in args:
        if isinstance(a, list):
            out += _symbols(a)
        elif isinstance(a, str) and (a.startswith("sk_") or A.is_variable(a)):
            out.append(a)
    return out


def edits(X: Side, Y: Side, al: dict) -> dict:
    """The residual of an alignment as edits (module doc), each with its canonical key and, when it can run, its rule
    in the direction X → Y (``rule``) and Y → X (``reverse_rule``)::

        {"classes":       [{"x", "y", "a", "b", "position", "rule", "reverse_rule", "scope", "implied", "executable"}],
         "substitutions": [{"x": [x atom ns], "y": [y atom ns], "relabels": [[xn, yn]], "anchors", "key", "reverse_key",
                            "rule", "reverse_rule", "executable"}],
         "drops":         [{"side": "x" | "y", "atoms": [...], "anchors": [...], "key"}],
         "flips": [[xn, yn]], "bands": [[xn, yn]]}
    """
    phi = al["phi"]
    inv = {t: s for s, t in phi.items()}
    xnode = {s: ("a", s) if s in phi else ("x", s) for s in X.individuals()}
    ynode = {t: ("a", inv[t]) if t in inv else ("y", t) for t in Y.individuals()}
    xa, ya = X.atoms, Y.atoms
    out = {"classes": [], "substitutions": [], "drops": [], "flips": [], "bands": []}

    # regions: unaligned atoms of one side, joined through that side's own (non-corresponding) individuals
    regions = []
    for tag, side, nodes, unaligned in (("x", X, xnode, al["unaligned"][0]), ("y", Y, ynode, al["unaligned"][1])):
        parent = {n: n for n in unaligned}

        def find(n):
            while parent[n] != n:
                parent[n] = parent[parent[n]]
                n = parent[n]
            return n
        owner: dict = {}
        for n in unaligned:
            for k in side.atoms[n]["inds"]:
                node = nodes[side.atoms[n]["leaves"][k][1]]
                if node[0] != "a":
                    if node in owner:
                        parent[find(n)] = find(owner[node])
                    else:
                        owner[node] = n
        groups: dict = collections.defaultdict(list)
        for n in unaligned:
            groups[find(n)].append(n)
        for members in groups.values():
            anchors = sorted({nodes[side.atoms[n]["leaves"][k][1]][1] for n in members for k in side.atoms[n]["inds"]
                              if nodes[side.atoms[n]["leaves"][k][1]][0] == "a"})
            regions.append({"side": tag, "atoms": sorted(members), "anchors": anchors})
    touched = collections.defaultdict(set)
    for r in regions:
        for s in r["anchors"]:
            touched[s].add(r["side"])
    contested = {s for s, sides in touched.items() if len(sides) == 2}
    rp = list(range(len(regions)))

    def rfind(i):
        while rp[i] != i:
            rp[i] = rp[rp[i]]
            i = rp[i]
        return i
    by_anchor: dict = {}
    for i, r in enumerate(regions):
        for s in r["anchors"]:
            if s in contested:
                if s in by_anchor:
                    rp[rfind(i)] = rfind(by_anchor[s])
                else:
                    by_anchor[s] = i
    comps: dict = collections.defaultdict(list)
    for i in range(len(regions)):
        comps[rfind(i)].append(regions[i])

    relabels = [(an, bn, diffs) for an, bn, kind, diffs in al["pairs"] if kind == "relabel"]
    absorbed: set = set()
    for members in comps.values():
        sides = {r["side"] for r in members}
        if len(sides) == 1:
            for r in members:
                side, nodes = (X, xnode) if r["side"] == "x" else (Y, ynode)
                key = _joint_keys([("D:", side.atoms[n], side, nodes) for n in r["atoms"]])
                out["drops"].append({"side": r["side"], "atoms": r["atoms"], "anchors": r["anchors"], "key": key})
            continue
        anchors = sorted({s for r in members for s in r["anchors"] if s in contested})
        xs = sorted(n for r in members if r["side"] == "x" for n in r["atoms"])
        ys = sorted(n for r in members if r["side"] == "y" for n in r["atoms"])
        joined = []
        for an, bn, diffs in relabels:                       # an event's class change joins the roles on that event
            a = xa[an]
            own = a["leaves"][a["inds"][0]]
            if own[0] == "e" and own[1] in anchors:
                joined.append([an, bn])
                absorbed.add((an, bn))
        lhs = [(xa[n], X, xnode) for n in xs] + [(xa[an], X, xnode) for an, _ in joined]
        rhs = [(ya[n], Y, ynode) for n in ys] + [(ya[bn], Y, ynode) for _, bn in joined]
        key = _joint_keys([("L:", a, s, nd) for a, s, nd in lhs] + [("R:", a, s, nd) for a, s, nd in rhs])
        rkey = _joint_keys([("L:", a, s, nd) for a, s, nd in rhs] + [("R:", a, s, nd) for a, s, nd in lhs])
        salt = hashlib.md5(key.encode("utf-8")).hexdigest()[:8]
        rsalt = hashlib.md5(rkey.encode("utf-8")).hexdigest()[:8]
        rule, rrule = _rule_of(lhs, rhs, salt), _rule_of(rhs, lhs, rsalt)
        out["substitutions"].append({"x": xs, "y": ys, "relabels": joined, "anchors": anchors, "key": key, "reverse_key": rkey,
                                     "rule": rule, "reverse_rule": rrule, "executable": bool(rule and rrule)})
    for an, bn, diffs in relabels:
        if (an, bn) in absorbed:
            continue
        a, b = xa[an], ya[bn]
        for k, ca, cb in diffs:
            position, rule = class_rule(a, k, ca, cb)
            _, rrule = class_rule(b, k, cb, ca)
            executable = not a["scope"] and not b["scope"] and a["implied"] is None and b["implied"] is None
            out["classes"].append({"x": an, "y": bn, "a": ca, "b": cb, "position": position, "rule": rule, "reverse_rule": rrule,
                                   "scope": a["scope"], "implied": a["implied"] or b["implied"], "executable": executable})
    for an, bn, kind, _ in al["pairs"]:
        if kind == "flip":
            out["flips"].append([an, bn])
        elif kind == "band":
            out["bands"].append([an, bn])
    return out


def core_flip(X: Side, Y: Side, al: dict) -> bool:
    """THE ALIGNED CORE FLIPS POLARITY: some negated statement of one side has every atom under its negation aligned,
    word for word, with an atom of the other side that is not negated (a flip pair with no differing class), and no
    flip pair differs in a word. "A deer isn't jumping over the fence" / "A deer is jumping over a fence" flips; "A man
    is not playing a guitar" / "A man is playing a flute" does not (the guitar is not the flute)."""
    flips = [(an, bn, diffs) for an, bn, kind, diffs in al["pairs"] if kind == "flip"]
    if not flips or any(diffs for _, _, diffs in flips):
        return False
    flipped = {("x", an) for an, _, _ in flips} | {("y", bn) for _, bn, _ in flips}
    for tag, side, n in [("x", X, an) for an, _, _ in flips] + [("y", Y, bn) for _, bn, _ in flips]:
        a = side.atoms[n]
        if a["nots"] % 2 == 0:
            continue                                            # the other side's atom of the pair is the negated one
        negated = [b["n"] for b in side.atoms if b["name"] == a["name"] and b["nots"] % 2 == 1]
        if all((tag, m) in flipped for m in negated):
            return True
    return False


def summary(X: Side, Y: Side, al: dict, ed: dict) -> dict:
    """A readable digest of one pair's alignment (lexicalized keys)."""
    xa, ya = X.atoms, Y.atoms
    return {"pairs": collections.Counter(kind for _, _, kind, _ in al["pairs"]),
            "aligned": [[xa[an]["lex"], ya[bn]["lex"], kind] for an, bn, kind, _ in al["pairs"]],
            "x_only": [xa[n]["lex"] for n in al["unaligned"][0]], "y_only": [ya[n]["lex"] for n in al["unaligned"][1]],
            "classes": [(c["a"], c["b"], c["position"]) for c in ed["classes"]],
            "substitutions": [s["key"] for s in ed["substitutions"]], "drops": [(d["side"], d["key"]) for d in ed["drops"]]}
