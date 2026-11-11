"""LOWERING: the emitter's records → one consumer's syntax.

The emitter (``tmpl.emit``) decides WHAT a parse states. Each statement is a RECORD — its label, its term (a tree
of heads, symbols, ``$`` variables, numbers and string literals), its truth value as numbers, and the template and
the instance that produced it — and the symbols' types are DATA (symbol → classes; a skolem function's stem, arity
and classes). This module decides HOW one consumer writes them. Two targets:

    pettachainer          our engine line (the branch semantic-parsing-hitl-updates): a statement is
                          ``(: <label> <term> (STV <strength> <confidence>))``, a symbol's type ``(: <symbol> <Type>)``,
                          a skolem function's ``(: <stem> (-> Atom … <Type>))``, terms as MeTTa s-expressions.

    pettachainer-master   upstream PeTTaChainer master, a parse's statements only. That engine takes a class as ONE
                          SYMBOL: it refuses a narrowed class under ``Member`` or ``Inheritance`` and a unary
                          ``(Member a)`` anywhere. So every ground narrowed class ``(Narrow N R)`` is written as one
                          class symbol (``class_symbol``: ``(Narrow report (Mod progress))`` → ``report__mod_progress``)
                          wherever it stands, and what the term said is kept beside the statements as DEFINITIONS, each
                          a statement of its own at the definitional truth value:

                              (: kind__<symbol> (Inheritance <symbol> N) (STV 1.0 0.99))      a kind of its noun
                              (: by_<k>__<symbol> (NarrowBy <symbol> <restriction>) (STV 1.0 0.99))   one per restriction

                          The restriction is the emitter's own term — ``(Mod progress)``, ``(Possession sk_town_1)``,
                          ``(Relation wife sk_berry_1)`` — except an adjective's unary ``(Member yellow)``, written
                          ``(Is yellow)``. A class is a kind of its noun by the catalog's own reading of a narrowed
                          class (a harbour pilot is a pilot), which the emitter states of each individual; upstream
                          reads ``Inheritance`` as that rule, so the noun's membership also follows from the narrowed
                          one. A narrowed class with a rule's variable inside it has no one symbol: it is left as
                          written and listed under ``kept`` (upstream refuses it under ``Member``). A QUERY is lowered
                          the same way; a narrowed class with a variable inside a query is asked through the
                          definitions instead (``query``). NOT lowered for this target: the background rules
                          (``tmpl.rules``: Equivalence as BiImplication in the conditional form, the rules'
                          no-information branch at confidence 0.001, the rules over a bound clause) and a band in a
                          question — each a later step of the same kind, never a branch inside the emitter: the
                          representation stays the emitter's, the spelling is the target's.

A CONSUMER'S OWN NAMES. The emitter's symbols belong to one text (``sk_brackenford_1``): whether two texts' Brackenfords
are one individual is the consumer's decision, never a matter of spelling here. A consumer that has made it — one symbol
for a name across its texts, a suffix that keeps two texts' witnesses apart — passes its names as ``symbols`` (symbol →
symbol). They are applied to the records BEFORE anything is written, so a class narrowed by a renamed individual is
named after the consumer's symbol: with ``{"sk_brackenford_1": "brackenford"}``, ``(Narrow report (Mod
sk_brackenford_1))`` is the class ``report__mod_brackenford``, the same in every text, and its definition reads
``(NarrowBy report__mod_brackenford (Mod brackenford))``. Renaming the symbols in the lowered TEXT instead cannot reach
inside a class symbol. A string literal and a number are no symbols and are never renamed.

WHAT UPSTREAM MASTER IS TOLD BEFORE IT LOADS A STATEMENT. That engine answers a question that nothing derives with a
prior of low confidence, and reads a rule backwards as weak evidence (a kind-of definition included: a cat as a farm
cat), unless the predicate asked for was declared positive-only (its ``set_positive_only_predicate``) BEFORE the
statements about it were loaded — declared afterwards it changes nothing. Two lists: ``predicates(target)``, once for
a knowledge base — every head of the substrate that states something of its arguments —, and the ``predicates`` of
each lowered text — its class symbols, which are predicates on that engine (``(Member x report)`` is ``(report x)``) —,
before that text's statements. With both declared, a question nothing derives gets no answer, and what the background
rules derive keeps our engine line's values (``tmpl.rules``, the same target).

    lower(emitted, target, symbols=None)   -> {"statements": [...], "declarations": [...]}; for pettachainer-master also
                                   "definitions" (each once, in order of first use), "classes" (symbol → the class term
                                   as written) and "kept"
    statement(record, target, symbols=None)   -> one statement's text
    class_symbol(term)          -> the one symbol of a ground narrowed class
    predicates(target)          -> the predicates a consumer declares positive-only for a knowledge base (upstream
                                   master); a lowered text's own are ``lower(...)["predicates"]``
    declarations(types, functions, target)
    leaves(term)                -> the term as an s-expression reader sees its text (numbers and string
                                   literals in their written form): for consumers that work on token trees
    query(pattern, target, symbols=None)   -> one query's text: for pettachainer ``(: $prf <pattern> $tv)``, the proof
                                   and the truth value left open (a question asks for both)
    question(asked, target, symbols=None)  -> a question (``tmpl.query.ask``) → {"queries": [one per reading],
                                   "definitions": [the statements its readings need beside the knowledge base]}
"""
from __future__ import annotations

import hashlib
import json
import os
import re

TARGETS = ("pettachainer", "pettachainer-master")
MASTER = "pettachainer-master"
SUBSTRATE = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir, "atom-type-substrates.json")
#: The substrate kinds whose heads state something of their arguments (``predicates``): not the logical links (And,
#: Implication, Member …), the computations, the term constructors or the transport wrapper.
PREDICATE_KINDS = ("role", "relation", "temporal", "measure", "discourse", "scope", "lexicon", "particle",
                   "surface-record", "state", "derived")
DEFINITION_TRUTH = (1.0, 0.99)       # what a class term means: the substrate's dial for a definitional statement
_PLAIN = re.compile(r"[A-Za-z0-9]+(?:_[A-Za-z0-9]+)*")
_SYMBOL = re.compile(r"[^\s()\"$;][^\s()\";]*")      # what a consumer may name a symbol: one token, no variable


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


def predicates(target: str = "pettachainer", path: str = SUBSTRATE) -> list[str]:
    """The predicates a consumer declares positive-only for a knowledge base before it loads anything: for upstream
    master (``h.set_positive_only_predicate(name)`` for each) every head of the substrate that states something of
    its arguments — the roles, the relations, the time and measure heads, the discourse and scope heads, the lexicon,
    the surface records —, the coreference link and the two heads of a class's definitions (``NarrowBy``, ``Is``).
    Left out: negation and the other logical links (``Member`` and
    ``Inheritance`` are no predicates on that engine at all: there the class symbol is the predicate — each text's
    class symbols are the ``predicates`` of its lowering), the computations and the term constructors. Our engine
    line needs none: an empty list."""
    _check(target)
    if target != MASTER:
        return []
    with open(path, encoding="utf-8") as fh:
        heads = json.load(fh)["heads"]
    names = {h for h, e in heads.items() if (e.get("kind") in PREDICATE_KINDS and h != "Not") or h == "Coref"}
    return sorted(names | {"NarrowBy", "Is"})            # and the two heads the definitions of a class are written with


# ------------------------------------------------------------------ a consumer's own names for the symbols

def _resolved(term, symbols: dict):
    """The term under the consumer's names: each symbol leaf the mapping holds is replaced, a skolem function's stem
    included; a string literal and a number are no symbols."""
    if isinstance(term, list):
        return [_resolved(x, symbols) for x in term]
    if isinstance(term, str) and not isinstance(term, Str):
        return symbols.get(term, term)
    return term


def _check_symbols(symbols: dict | None) -> dict:
    for old, new in (symbols or {}).items():
        if not (isinstance(new, str) and not isinstance(new, Str) and _SYMBOL.fullmatch(new)):
            raise ValueError(f"symbols: {old!r} → {new!r} is no symbol (one token, no variable, no quotes or brackets)")
    return symbols or {}


def _named(emitted: dict, symbols: dict | None) -> dict:
    """An emitter result under the consumer's names for its symbols: the records' terms, the typed symbols (two
    symbols given one name share their classes) and the skolem functions' stems."""
    symbols = _check_symbols(symbols)
    if not symbols:
        return emitted
    types: dict = {}
    for sym, classes in emitted["types"].items():
        have = types.setdefault(symbols.get(sym, sym), [])
        have.extend(c for c in classes if c not in have)
    return {**emitted,
            "records": [{**r, "term": _resolved(r["term"], symbols)} for r in emitted["records"]],
            "types": types,
            "functions": [{**f, "stem": symbols.get(f["stem"], f["stem"])} for f in emitted["functions"]]}


# ------------------------------------------------------------------ upstream master: a class is one symbol

def _symbols(term):
    """The symbol leaves of a term (heads included), string literals and numbers left out."""
    if isinstance(term, list):
        for x in term:
            yield from _symbols(x)
    elif isinstance(term, str) and not isinstance(term, Str):
        yield term


def restrictions(restriction) -> list:
    """The restrictions of a narrowed class ``(Narrow N R)`` — R itself, or the parts of ``(And R1 R2 …)`` — in their
    canonical order: sorted by their text. The emitter writes them so already; under a consumer's own names
    (``symbols``) the order is taken again, since ``brackenford`` does not sort where ``sk_brackenford_1`` did."""
    parts = list(restriction[1:]) if isinstance(restriction, list) and restriction and restriction[0] == "And" else [restriction]
    return sorted(parts, key=render)


def _hash(term) -> str:
    return hashlib.md5(render(term).encode("utf-8")).hexdigest()[:8]


def class_symbol(term) -> str:
    """The one symbol that stands for a ground narrowed class ``(Narrow N R)`` on upstream master: the class's noun,
    then each restriction as its head and its word, joined by double underscores::

        (Narrow report (Mod progress))                  ->  report__mod_progress
        (Narrow bike (Member yellow))                   ->  bike__member_yellow
        (Narrow report (And (Mod hive) (Mod progress))) ->  report__mod_hive__mod_progress
        (Narrow wife (Relation wife sk_berry_1))        ->  sk_wife__relation_<hash>

    The restrictions come in a CANONICAL order: sorted by their text — an adjective's ``(Member …)`` before a noun's
    ``(Mod …)``, each alphabetical — whatever order the words had in the sentence and whatever the individuals in
    them are called, so one class has one symbol. A restriction that is more than a head and one plain symbol is named by
    its head and a hash of its text: the definitions beside the statements say what it is. A class that names an
    individual of its text (``(Mod sk_pc3_1)``) belongs to that text: its symbol starts with ``sk_``, as every symbol
    the emitter mints for a text does, so that whatever keeps the symbols of two texts apart keeps the two classes
    apart; under a consumer's own name for that individual (``symbols``) the class is named after it instead. The
    same term always gets the same symbol, and no lemma is spelled with a double underscore, so a class never collides
    with a word."""
    noun, parts = term[1], []
    parts.append(noun if isinstance(noun, str) and _PLAIN.fullmatch(noun) else "class_" + _hash(noun))
    for r in restrictions(term[2]):
        head = r[0].lower() if isinstance(r, list) and r and isinstance(r[0], str) and r[0].isalnum() else "by"
        if isinstance(r, list) and len(r) == 2 and isinstance(r[1], str) and not isinstance(r[1], Str) and _PLAIN.fullmatch(r[1]):
            parts.append(f"{head}_{r[1]}")
        else:
            parts.append(f"{head}_{_hash(r)}")
    name = "__".join(parts)
    return "sk_" + name if any(x.startswith("sk_") for x in _symbols(term)) else name


class _Classes:
    """The narrowed classes met while lowering for upstream master: the ground ones under their one symbol."""

    def __init__(self):
        self.terms: dict[str, list] = {}       # symbol -> the class term as the emitter wrote it
        self.lowered: dict[str, list] = {}     # symbol -> the same term, the classes inside it already symbols
        self.kept: list[str] = []              # narrowed classes left as written: a rule's variable inside

    def term(self, term):
        """The term with every ground narrowed class replaced by its symbol, the innermost first."""
        if not isinstance(term, list):
            return term
        low = [self.term(x) for x in term]
        if not (low and low[0] == "Narrow" and len(low) == 3):
            return low
        if any(x.startswith("$") for x in _symbols(low)):
            text = render(term)
            if text not in self.kept:
                self.kept.append(text)
            return low
        sym = class_symbol(low)
        self.terms.setdefault(sym, term)
        self.lowered.setdefault(sym, low)
        return sym


def _unary_member(term):
    """An adjective's restriction ``(Member a)`` as ``(Is a)``: upstream reads every ``Member`` as two-place."""
    if not isinstance(term, list):
        return term
    if len(term) == 2 and term[0] == "Member":
        return ["Is", _unary_member(term[1])]
    return [_unary_member(x) for x in term]


def _definitions(classes: _Classes) -> list[dict]:
    """What the interned classes' terms said, as statement records (the module doc)."""
    out = []
    for sym, low in classes.lowered.items():
        if isinstance(low[1], str) and not isinstance(low[1], Str):
            out.append({"name": f"kind__{sym}", "term": ["Inheritance", sym, low[1]], "truth": list(DEFINITION_TRUTH),
                        "owner": "lowering", "inst": None})
        for k, r in enumerate(restrictions(low[2]), 1):
            out.append({"name": f"by_{k}__{sym}", "term": ["NarrowBy", sym, _unary_member(r)],
                        "truth": list(DEFINITION_TRUTH), "owner": "lowering", "inst": None})
    return out


def _text(name: str, term, truth) -> str:
    s, c = truth
    return f"(: {name} {render(term)} (STV {fmt_num(s)} {fmt_num(c)}))"


def statement(record: dict, target: str = "pettachainer", symbols: dict | None = None) -> str:
    """One statement record ``{"name", "term", "truth": [strength, confidence], …}`` in the target's syntax (for
    upstream master the narrowed classes as symbols; their definitions come with ``lower``), under the consumer's
    names for its symbols when given."""
    _check(target)
    term = _resolved(record["term"], _check_symbols(symbols))
    term = _Classes().term(term) if target == MASTER else term
    return _text(record["name"], term, record["truth"])


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


def lower(emitted: dict, target: str = "pettachainer", symbols: dict | None = None) -> dict:
    """An emitter result (``records``, ``types``, ``functions``) in the target's syntax, under the consumer's names
    for its symbols when ``symbols`` is given (applied first: the module doc). For upstream master the result also
    holds ``definitions`` — the side facts of the narrowed classes, each once, to be loaded with the statements (a
    class that several texts use states the same definition in each) — ``classes`` (symbol → the class term as
    written), ``kept`` (the narrowed classes left as written) and ``predicates`` (the text's class symbols, to be
    declared positive-only before its statements are loaded: the module doc)."""
    _check(target)
    emitted = _named(emitted, symbols)
    if target == MASTER:
        classes = _Classes()
        statements = [_text(r["name"], classes.term(r["term"]), r["truth"]) for r in emitted["records"]]
        types = dict(emitted["types"])
        for sym in classes.terms:
            types.setdefault(sym, ["Class"])
        return {"statements": statements,
                "definitions": [_text(d["name"], d["term"], d["truth"]) for d in _definitions(classes)],
                "declarations": declarations(types, emitted["functions"], target),
                "classes": {sym: render(term) for sym, term in classes.terms.items()},
                "kept": list(classes.kept),
                "predicates": sorted(sym for sym, kinds in types.items() if "Class" in kinds)}
    return {"statements": [statement(r, target) for r in emitted["records"]],
            "declarations": declarations(emitted["types"], emitted["functions"], target)}


def _through_definitions(term, taken: set, conjuncts: list):
    """A narrowed class with a variable inside (``(Narrow report (Mod $m))``) cannot be one symbol: in a query it
    becomes a class variable, asked through the definitions — a kind of the noun, narrowed by each restriction."""
    if not isinstance(term, list):
        return term
    low = [_through_definitions(x, taken, conjuncts) for x in term]
    if not (low and low[0] == "Narrow" and len(low) == 3):
        return low
    k = 1
    while f"$class_{k}" in taken:
        k += 1
    var = f"$class_{k}"
    taken.add(var)
    conjuncts.append(["Inheritance", var, low[1]])
    conjuncts.extend(["NarrowBy", var, _unary_member(r)] for r in restrictions(low[2]))
    return var


def query(pattern, target: str = "pettachainer", symbols: dict | None = None) -> str:
    """A query pattern (a term with ``$`` variables) in the target's syntax: the proof and the truth value open. For
    upstream master a ground narrowed class is its symbol, and one with a variable inside is asked through the
    definitions: ``(Member $x (Narrow report (Mod $m)))`` → ``(And (Member $x $class_1) (Inheritance $class_1 report)
    (NarrowBy $class_1 (Mod $m)))``. ``symbols``: the consumer's names, as in ``lower``."""
    _check(target)
    pattern = _resolved(pattern, _check_symbols(symbols))
    if target == MASTER:
        low = _Classes().term(pattern)
        conjuncts: list = []
        low = _through_definitions(low, set(_symbols(low)), conjuncts)
        if conjuncts:
            low = (low if isinstance(low, list) and low and low[0] == "And" else ["And", low]) + conjuncts
        return f"(: $prf {render(low)} $tv)"
    return f"(: $prf {render(pattern)} $tv)"


def question(asked: dict, target: str = "pettachainer", symbols: dict | None = None) -> dict:
    """A question's readings (``tmpl.query.ask``) in the target's syntax: one query per reading, and the definitions
    the readings need beside the knowledge base (each once). ``symbols``: the consumer's names, as in ``lower``."""
    _check(target)
    queries = [query(rd["pattern"], target, symbols) for rd in asked["readings"]]
    defs, seen = [], set()
    for rd in asked["readings"]:
        for d in rd["definitions"]:
            text = statement(d, target, symbols)
            if text not in seen:
                seen.add(text)
                defs.append(text)
    return {"queries": queries, "definitions": defs}
