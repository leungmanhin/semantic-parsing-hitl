"""LIFTING a graph into typed variables under the KEY DIALS (§5.1, decision 5).

The MATCHING KEY of an atom is what the miner compares to decide sameness; everything else is EVIDENCE on the
candidate. The key is built from the content atoms — scope markers kept, skolem symbols turned into typed
variables named by first occurrence, class symbols kept (the lexicalized view) or variablized (the shape view)
— plus each statement's POLARITY BAND. The dials (``Key``)::

    polarity:  "three" (default: denied at 0 / graded / asserted at 1) · "two" (denied below 0.5) · "none"
               · a list of cut points
    tense:     "evidence" (default) · "key"        — the tense and aspect tags on events (Past, Ongoing …)
    habitual:  "evidence" (default) · "key"
    shape:     "lexicalized" (default) · "shape"   — class symbols kept or variablized
    surface:   always evidence (a name, a quantifier word)

A lifted atom is a string such as ``Theme:$e2|Agent($e1,$x1)|asserted``; a lifted graph lists them, the
variable map back to the sentence's symbols, and the evidence record.
"""
from __future__ import annotations

import re

from . import atoms as A

DEFAULT_KEY = {"polarity": "three", "tense": "evidence", "habitual": "evidence", "shape": "lexicalized"}
PREFIX = {"Event": "e", "Entity": "x", "TimeTerm": "t", "Instance": "i", "Class": "c", "Proposition": "p"}


def key_of(**overrides) -> dict:
    k = dict(DEFAULT_KEY)
    k.update({a: b for a, b in overrides.items() if b is not None})
    return k


def band(strength: float, dial) -> str | None:
    """The polarity band of a statement's strength under the dial; ``None`` when the dial is off."""
    if dial in (None, "none"):
        return None
    if dial == "two":
        return "denied" if strength < 0.5 else "asserted"
    if dial == "three":
        return "denied" if strength <= 0.05 else "asserted" if strength >= 0.95 else "graded"
    if isinstance(dial, (list, tuple)):
        cuts = sorted(float(x) for x in dial)
        for n, cut in enumerate(cuts):
            if strength < cut:
                return f"band{n}"
        return f"band{len(cuts)}"
    raise ValueError(f"unknown polarity dial {dial!r}")


class Lifter:
    """Names the variables of one graph by first occurrence, typed by the symbol's declarations or, failing
    those, by the argument position it fills."""

    def __init__(self, graph: dict, key: dict):
        self.graph, self.key = graph, key
        self.types = graph.get("types") or {}
        self.varmap: dict[str, str] = {}
        self.counts: dict[str, int] = {}
        self.classes: dict[str, str] = {}
        self.rules: dict[str, str] = {}
        self.positions: dict[str, set] = {}                 # a symbol or function term → the argument types it fills
        for a in graph["atoms"]:
            for x, ty in zip(a["args"], A.arg_types(a["head"], len(a["args"]))):
                k = _render(x) if isinstance(x, list) else x
                if isinstance(k, str) and (k.startswith("sk_") or k.startswith("$") or k.startswith("(")):
                    self.positions.setdefault(k, set()).update(ty.split("|"))

    def _type(self, sym: str, position_type: str) -> str:
        """Declared types first (an eventive witness is an Event); else the most specific type among every
        position the symbol fills in the graph; else the position at hand."""
        declared = set(self.types.get(sym) or [])
        if "Event" in declared:
            return "Event"
        for t in ("TimeTerm", "Entity", "Instance"):
            if t in declared:
                return t
        filled = self.positions.get(sym) or set(position_type.split("|"))
        for t in ("Event", "TimeTerm", "Entity", "Instance", "Class", "Proposition"):
            if t in filled:
                return t
        return "v"

    def variable(self, sym: str, position_type: str) -> str:
        if sym not in self.varmap:
            t = self._type(sym, position_type)
            p = PREFIX.get(t, "v")
            self.counts[p] = self.counts.get(p, 0) + 1
            self.varmap[sym] = f"${p}{self.counts[p]}"
        return self.varmap[sym]

    def class_symbol(self, sym: str) -> str:
        if self.key.get("shape") != "shape":
            return sym
        if sym not in self.classes:
            self.classes[sym] = f"$c{len(self.classes) + 1}"
        return self.classes[sym]

    def term(self, t, position_type: str = "?") -> str:
        """One argument lifted: a skolem symbol → its variable, a class → itself or a class variable, a
        number or a placeholder kept, a nested term (a Narrow, a skolem function) lifted inside."""
        if isinstance(t, list):
            if A.is_function_term(t):
                return self.variable(_render(t), position_type)
            head = t[0]
            types = A.arg_types(head, len(t) - 1)
            return "(" + head + " " + " ".join(self.term(a, ty) for a, ty in zip(t[1:], types)) + ")"
        if not isinstance(t, str):
            return str(t)
        if t.startswith("§") or t.startswith('"'):
            return t
        if A.is_variable(t) or t.startswith("sk_"):
            return self.variable(t, position_type)
        if "Class" in position_type:
            return self.class_symbol(t)
        try:
            float(t)
            return t
        except ValueError:
            pass
        declared = set(self.types.get(t) or [])
        if declared & {"Entity", "Event", "TimeTerm", "Instance"}:
            return self.variable(t, position_type)
        if "Class" in declared:
            return self.class_symbol(t)
        return t

    def scope(self, scope: list) -> str:
        parts = []
        for marker, anchor in scope:
            if isinstance(anchor, list) or (anchor and (anchor.startswith("sk_") or A.is_variable(anchor))):
                anchor = self.term(anchor, "Event")
            elif anchor and marker.startswith("Implication"):     # a rule's statement name → a rule index
                anchor = self.rules.setdefault(anchor, f"$r{len(self.rules) + 1}")
            parts.append(f"{marker}:{anchor}" if anchor else marker)
        return "/".join(parts)


def _render(t) -> str:
    return "(" + " ".join(_render(x) for x in t) + ")" if isinstance(t, list) else str(t)


_VAR = re.compile(r"\$([a-z]+)(\d+)")


def canonical(key: str) -> str:
    """A unit's key with its variables renamed by first appearance WITHIN the unit (per type prefix), so that
    the same atom gets the same key whatever symbols the sentence happened to name first."""
    seen: dict[str, str] = {}
    counts: dict[str, int] = {}

    def sub(m):
        v = m.group(0)
        if v not in seen:
            p = m.group(1)
            counts[p] = counts.get(p, 0) + 1
            seen[v] = f"${p}{counts[p]}"
        return seen[v]
    return _VAR.sub(sub, key)


def lift(graph: dict, key: dict | None = None) -> dict:
    """The lifted graph: ``atoms`` (the key strings, in a canonical order), ``units`` (the same with their
    source atom indices), ``varmap``, and ``evidence``."""
    key = key or DEFAULT_KEY
    L = Lifter(graph, key)
    units, evidence = [], {"tenses": {}, "habitual": [], "surface": [], "strengths": [], "confidences": [], "names": {}}
    for a in graph["atoms"]:
        kind = a["kind"]
        if kind == "surface":
            evidence["surface"].append(f"{a['head']}({', '.join(str(x) for x in a['args'])})")
            if a["head"] == "Name" and len(a["args"]) == 2:
                evidence["names"][str(a["args"][0])] = str(a["args"][1]).strip('"')
            continue
        if kind == "tense":
            ev = str(a["args"][0]) if a["args"] else ""
            evidence["tenses"].setdefault(ev, []).append(a["head"])
            if a["head"] == "Habitual":
                evidence["habitual"].append(ev)
            if key.get("tense") != "key" and not (a["head"] == "Habitual" and key.get("habitual") == "key"):
                continue
        types = A.arg_types(a["head"], len(a["args"]))
        args = [L.term(x, ty) for x, ty in zip(a["args"], types)]
        b = band(a["s"], key.get("polarity"))
        tense = a.get("tense")
        if tense:
            evidence["tenses"].setdefault(args[0] if args else "", []).append(tense)
        parts = [L.scope(a["scope"]), f"{a['head']}({','.join(args)})"]
        if b:
            parts.append(b)
        if tense and key.get("tense") == "key":
            parts.append(tense)
        k = "|".join(parts)
        units.append({"key": k, "unit": canonical(k), "i": a["i"], "kind": kind, "s": a["s"], "c": a["c"]})
        evidence["strengths"].append(a["s"])
        evidence["confidences"].append(a["c"])
    units.sort(key=lambda u: (u["key"], u["i"]))
    return {"id": graph["id"], "text": graph.get("text"), "dataset": graph.get("dataset"), "family": graph.get("family"),
            "role": graph.get("role"), "key": key, "atoms": [u["key"] for u in units], "units": units,
            "canonical": sorted({u["unit"] for u in units}),
            "varmap": L.varmap, "evidence": evidence}
