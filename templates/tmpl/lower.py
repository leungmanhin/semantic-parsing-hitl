"""LOWERING: the emitter's records → one consumer's syntax.

The emitter (``tmpl.emit``) decides WHAT a parse states. Each statement is a RECORD — its label, its term (a tree
of heads, symbols, ``$`` variables, numbers and string literals), its truth value as numbers, and the template and
the instance that produced it — and the symbols' types are DATA (symbol → classes; a skolem function's stem, arity
and classes). This module decides HOW one consumer writes them. One target so far:

    pettachainer   our engine line (the branch semantic-parsing-hitl-updates): a statement is
                   ``(: <label> <term> (STV <strength> <confidence>))``, a symbol's type ``(: <symbol> <Type>)``,
                   a skolem function's ``(: <stem> (-> Atom … <Type>))``, terms as MeTTa s-expressions.

A second consumer — upstream PeTTaChainer master, for instance (a narrowed class as one opaque class symbol plus
side facts, Equivalence as BiImplication in the conditional form, the rules' no-information branch at confidence
0.001) — is a new TARGET here, never a branch inside the emitter: the representation stays the emitter's, the
spelling is the target's. The background rules (``tmpl.rules``) are lowered by target in the same way.

    lower(emitted, target)      -> {"statements": [...], "declarations": [...]}
    statement(record, target)   -> one statement's text
    declarations(types, functions, target)
    leaves(term)                -> the term as an s-expression reader sees its text (numbers and string
                                   literals in their written form): for consumers that work on token trees
    query(pattern, target)      -> one query's text: for pettachainer ``(: $prf <pattern> $tv)``, the proof and
                                   the truth value left open (a question asks for both)
    question(asked, target)     -> a question (``tmpl.query.ask``) → {"queries": [one per reading],
                                   "definitions": [the statements its readings need beside the knowledge base]}
"""
from __future__ import annotations

TARGETS = ("pettachainer",)


class Str(str):
    """A string literal (rendered with quotes)."""


def _check(target: str):
    if target not in TARGETS:
        raise ValueError(f"no lowering for target {target!r} (known: {', '.join(TARGETS)})")


def fmt_num(v) -> str:
    """Numbers as the corpus writes them: floats keep a decimal point (1.0), ints stay ints."""
    if isinstance(v, bool):
        return str(v).lower()
    return str(v)


def render(term) -> str:
    """A term as a MeTTa s-expression."""
    if isinstance(term, list):
        return "(" + " ".join(render(x) for x in term) + ")"
    if isinstance(term, Str):
        return '"' + term.replace("\\", "\\\\").replace('"', '\\"') + '"'
    if isinstance(term, (int, float)):
        return fmt_num(term)
    return str(term)


def leaves(term):
    """The term with every leaf in its written form — the tree an s-expression reader returns for ``render(term)``
    (a string literal keeps its quotes, a number is its text): what a consumer of statement texts saw."""
    if isinstance(term, list):
        return [leaves(x) for x in term]
    if isinstance(term, (Str, int, float, bool)):
        return render(term)
    return str(term)


def statement(record: dict, target: str = "pettachainer") -> str:
    """One statement record ``{"name", "term", "truth": [strength, confidence], …}`` in the target's syntax."""
    _check(target)
    s, c = record["truth"]
    return f"(: {record['name']} {render(record['term'])} (STV {fmt_num(s)} {fmt_num(c)}))"


def declarations(types: dict, functions: list, target: str = "pettachainer") -> list[str]:
    """The type declarations of a parse's symbols (``types``: symbol → classes, in the order given) and of its
    skolem functions (``functions``: ``{"stem", "arity", "classes"}``), in the target's syntax."""
    _check(target)
    lines = []
    for sym, classes in types.items():
        lines += [f"(: {sym} {c})" for c in classes]
    for f in functions:
        args = " ".join(["Atom"] * f["arity"])
        lines += [f"(: {f['stem']} (-> {args} {c}))" for c in f["classes"]]
    return lines


def lower(emitted: dict, target: str = "pettachainer") -> dict:
    """An emitter result (``records``, ``types``, ``functions``) in the target's syntax."""
    _check(target)
    return {"statements": [statement(r, target) for r in emitted["records"]],
            "declarations": declarations(emitted["types"], emitted["functions"], target)}


def query(pattern, target: str = "pettachainer") -> str:
    """A query pattern (a term with ``$`` variables) in the target's syntax: the proof and the truth value open."""
    _check(target)
    return f"(: $prf {render(pattern)} $tv)"


def question(asked: dict, target: str = "pettachainer") -> dict:
    """A question's readings (``tmpl.query.ask``) in the target's syntax: one query per reading, and the definitions
    the readings need beside the knowledge base (each once)."""
    _check(target)
    queries = [query(rd["pattern"], target) for rd in asked["readings"]]
    defs, seen = [], set()
    for rd in asked["readings"]:
        for d in rd["definitions"]:
            text = statement(d, target)
            if text not in seen:
                seen.add(text)
                defs.append(text)
    return {"queries": queries, "definitions": defs}
