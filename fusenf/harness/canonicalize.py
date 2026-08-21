"""FUSE-NF deterministic canonicalizer (``fusenf-canon/4``).

Implements ``specs/canonicalization.md``.  Turns a faithful parse record
(``specs/schema.md`` §3) into a canonical record with three identity hashes.

Determinism is absolute here:

* no ``hash()`` (salted per process) — only :mod:`hashlib`;
* no iteration over ``set``/``dict`` in an order that reaches the output;
* no clock, no randomness, no locale-dependent comparison.

Algorithm.  §4.5a says to build the simple version first — sort the atoms with
skolems held as a single wildcard token, name skolems by order of first
occurrence, re-sort — and to escalate only when a §7 test fails.  Both
escalations were forced by an actual failure, and only those two:

* **§4.1 colour refinement**, forced by **§7.1 (order invariance)**.  The simple
  version fails on **17 of the 256 golden bundles** in
  ``regression/regression_cases.md``, on near-symmetries such as two ``(Agent _ _)``
  atoms in one bundle ("the sergeant made the recruits kneel"): all four skolems
  mask to the same token, the stable sort falls back to emission order, and the
  identity moves.  Refinement puts each skolem's refined colour in the mask, so
  only structurally indistinguishable skolems still collide.  With refinement
  the corpus sweep is 0/256.
* **§4.3 individualization + branch-and-keep-minimum**, forced by **§7.5
  (symmetry)**.  Refinement alone leaves genuine automorphisms unordered, and
  first-occurrence naming pairs correlated automorphic classes *inconsistently*
  whenever the atom linking them sorts after the atoms introducing them — "two
  dogs were chased" (``Patient`` sorts after ``Member``) yields two different
  ``graph_id``s across its 720 orderings.  ("Two dogs barked" does not, because
  ``(Agent e x)`` introduces both members at once — which is why the easy
  symmetry fixture alone would have hidden this.)  No golden bundle currently
  exhibits a true automorphism, so §4.3 is not yet load-bearing on the corpus;
  it is load-bearing on §7.5, and "two dogs barked" is a Tier-A sentence.

STV bucketing (§4.6) is written and tested but **off**: ``graph_id`` uses exact
truth values.  Flip :data:`BUCKET_TV_IN_HASHES` (or pass ``bucket_tv=True``) to
switch it on.
"""

from __future__ import annotations

import hashlib
import json
import os
import re

CANON_VERSION = "fusenf-canon/4"  # /2: And-conjuncts canonically ordered, and the skolem
# renaming derived from the sorted term rather than emission order (M1 v4, 2026-07-29)
# /3: PeTTaChainer cfe25f9 dropped the (Premises ...)/(Conclusions ...) implication wrappers, so
# ``And`` is the only commutative head left. This changes every hash — regenerate all canonical
# files; do not compare a /3 graph_id against a /2 one. (2026-08-04)
# /4: whitespace inside STRING LITERALS is normalized at tokenization (runs collapse to one
# space, no space before , ; : . ! ? % ' ) ] or after ( [ ). Tokenized corpus text (PAWS writes
# "City , LA") made two verbatim-faithful parses hash apart on spacing alone — mechanical
# variance, so it is erased here per the deterministic-first split, not legislated in the
# prompt. Every hash changes (the version is part of the payload) — regenerate all canonical
# files; do not compare a /4 graph_id against a /3 one. (2026-08-07)

#: §4.6 — identity uses exact truth values until M1 reports ``tv-only`` jitter.
BUCKET_TV_IN_HASHES = False

#: §4.3 — largest automorphic colour class still resolved exactly by
#: branch-and-keep-minimum.  Above this, fall back and set ``exact: false``.
SYMMETRY_K = 6

#: §4.3 — budget for that search, in refinement calls, before falling back.
SEARCH_BUDGET = 4000

_HERE = os.path.dirname(os.path.abspath(__file__))
_VOCAB_PATH = os.path.join(_HERE, os.pardir, "specs", "vocabulary.json")

# Wildcard tokens.  Control characters so they can never collide with a real
# symbol, and so byte-wise order stays stable.
_WILD_SKOLEM = "\x01"
_WILD_FN_HEAD = "\x02"
_WILD_VAR = "\x03"
_UNMATCHED = "\x04"

#: /4 — string-literal interior whitespace (see the CANON_VERSION note).
_RE_STR_WS_RUN = re.compile(r"\s+")
_RE_STR_WS_BEFORE = re.compile(r" ([,;:.!?%')\]])")
_RE_STR_WS_AFTER = re.compile(r"([(\[]) ")

_RE_CANON_SKOLEM = re.compile(r"[ex][0-9]+\Z")
_RE_CANON_FN = re.compile(r"f[0-9]+\Z")
_RE_NUMBER = re.compile(r"[+-]?(?:[0-9]+\.?[0-9]*|\.[0-9]+)(?:[eE][+-]?[0-9]+)?\Z")


# --------------------------------------------------------------------------
# vocabulary
# --------------------------------------------------------------------------

_VOCAB_CACHE = {}


def load_vocabulary(path=None):
    """Load and cache ``vocabulary.json``.  Returns the parsed dict."""
    key = os.path.abspath(path or _VOCAB_PATH)
    if key not in _VOCAB_CACHE:
        with open(key, "r", encoding="utf-8") as fh:
            raw = json.load(fh)
        _VOCAB_CACHE[key] = _index_vocabulary(raw)
    return _VOCAB_CACHE[key]


def _index_vocabulary(raw):
    """Build ``(name, arity)``-keyed lookups.  Operator identity is (name, arity)."""
    opaque = set()
    role_status = set()
    known = set()
    surface = set()
    for name, entry in sorted(raw.get("operators", {}).items()):
        arities = entry.get("arities") or []
        senses = {s.get("arity"): s for s in entry.get("senses", []) or []}
        for arity in arities:
            sense = senses.get(arity, entry)
            known.add((name, arity))
            if sense.get("opaque", entry.get("opaque", False)):
                opaque.add((name, arity))
            if sense.get("class", entry.get("class")) in ("role", "status"):
                role_status.add((name, arity))
            if sense.get("class", entry.get("class")) == "surface-record":
                surface.add(name)
        if entry.get("variadic"):
            # A variadic head keeps its flags at every arity.
            for arity in range(0, 32):
                known.add((name, arity))
                if entry.get("opaque"):
                    opaque.add((name, arity))
                if entry.get("class") in ("role", "status"):
                    role_status.add((name, arity))
    return {
        "raw": raw,
        "opaque": frozenset(opaque),
        "role_status": frozenset(role_status),
        "known": frozenset(known),
        "surface_record": frozenset(surface),
    }


def _is_opaque(vocab, head, arity):
    """Opaque heads are single nodes for star decomposition (§5).

    An **unknown** head is treated as opaque: the prompt's opaque roster
    includes open-class kind-level relations (``(Carry mosquito malaria)``),
    which by construction cannot be enumerated in ``vocabulary.json``.  Not
    decomposing what we do not recognise is the safe default.
    """
    if (head, arity) in vocab["known"]:
        return (head, arity) in vocab["opaque"]
    return True


# --------------------------------------------------------------------------
# s-expression reader
# --------------------------------------------------------------------------


def _normalize_string_ws(lit):
    """/4 — normalize whitespace INSIDE a string literal (``lit`` includes its quotes).

    Tokenized corpus text arrives with detached punctuation ("City , LA"); one parse copies it
    verbatim, another de-tokenizes, and both are faithful. Collapse runs to a single space, trim,
    and drop the space next to punctuation so the two hash together. Escape sequences pass
    through untouched (the regexes only ever remove literal whitespace characters).
    """
    inner = _RE_STR_WS_RUN.sub(" ", lit[1:-1]).strip()
    inner = _RE_STR_WS_BEFORE.sub(r"\1", inner)
    inner = _RE_STR_WS_AFTER.sub(r"\1", inner)
    return '"' + inner + '"'


def _tokenize(text):
    toks = []
    i, n = 0, len(text)
    while i < n:
        c = text[i]
        if c in " \t\r\n\f\v":
            i += 1
            continue
        if c == ";":  # comment to end of line
            while i < n and text[i] != "\n":
                i += 1
            continue
        if c in "()":
            toks.append(c)
            i += 1
            continue
        if c == '"':
            j = i + 1
            buf = ['"']
            closed = False
            while j < n:
                ch = text[j]
                if ch == "\\":
                    if j + 1 >= n:
                        raise ValueError("dangling escape inside string literal")
                    buf.append(ch)
                    buf.append(text[j + 1])
                    j += 2
                    continue
                buf.append(ch)
                j += 1
                if ch == '"':
                    closed = True
                    break
            if not closed:
                raise ValueError("unterminated string literal")
            toks.append(_normalize_string_ws("".join(buf)))
            i = j
            continue
        j = i
        while j < n and text[j] not in " \t\r\n\f\v()\";":
            j += 1
        toks.append(text[i:j])
        i = j
    return toks


def _read(toks, pos):
    if pos >= len(toks):
        raise ValueError("unexpected end of expression")
    tok = toks[pos]
    if tok == ")":
        raise ValueError("unexpected ')'")
    if tok != "(":
        return tok, pos + 1
    pos += 1
    items = []
    while True:
        if pos >= len(toks):
            raise ValueError("unbalanced parentheses")
        if toks[pos] == ")":
            if not items:
                raise ValueError("empty expression '()'")
            if not isinstance(items[0], str):
                raise ValueError("expression head must be a symbol")
            return items, pos + 1
        item, pos = _read(toks, pos)
        items.append(item)


def parse_term(text):
    """Parse a bare s-expression (no ``(: … )`` wrapper) into a nested list."""
    toks = _tokenize(text)
    if not toks:
        raise ValueError("empty expression")
    expr, pos = _read(toks, 0)
    if pos != len(toks):
        raise ValueError("stray text after the outermost expression")
    return expr


def _check_term(term):
    if isinstance(term, str):
        return
    if not term:
        raise ValueError("empty expression '()'")
    if not isinstance(term[0], str):
        raise ValueError("expression head must be a symbol")
    for arg in term[1:]:
        _check_term(arg)


def parse_statement(s):
    """``'(: name <expr> (STV a b))'`` -> ``{'proof_name', 'term', 'stv'}``.

    ``term`` is a nested list of leaf tokens (string literals keep their
    quotes, numbers stay verbatim so linearization round-trips exactly).
    ``stv`` is a ``(strength, confidence)`` float pair.

    Raises :class:`ValueError` on malformed input.  Range checks on the truth
    value (C3: ``s, c in [0,1]``, ``c != 1.0``) belong to the validator, not
    here — the canonicalizer must be able to canonicalize a record the
    validator has flagged.
    """
    if not isinstance(s, str):
        raise ValueError("statement must be a string")
    toks = _tokenize(s)
    if not toks:
        raise ValueError("empty statement")
    expr, pos = _read(toks, 0)
    if pos != len(toks):
        raise ValueError("stray text after the outermost expression")
    if not isinstance(expr, list):
        raise ValueError("statement is not an s-expression")
    if len(expr) != 4 or expr[0] != ":":
        raise ValueError("expected (: <proof-name> <expr> (STV <s> <c>))")
    _, name, term, stv = expr
    if not isinstance(name, str):
        raise ValueError("proof name must be a symbol")
    if not isinstance(term, list):
        raise ValueError("statement content must be an s-expression")
    _check_term(term)
    if not isinstance(stv, list) or len(stv) != 3 or stv[0] != "STV":
        raise ValueError("expected (STV <s> <c>)")
    try:
        strength = float(stv[1])
        confidence = float(stv[2])
    except (TypeError, ValueError):
        raise ValueError("STV values must be numbers")
    return {"proof_name": name, "term": term, "stv": (strength, confidence)}


def linearize_term(term):
    """§4.5: ``term(sym) = sym``; ``term((h a1 … an)) = "(" h " " … ")"``."""
    if isinstance(term, str):
        return term
    return "(" + " ".join(linearize_term(x) for x in term) + ")"


# --------------------------------------------------------------------------
# symbol classification
# --------------------------------------------------------------------------


def _is_skolem_leaf(tok):
    return tok.startswith("sk_") or bool(_RE_CANON_SKOLEM.match(tok))


def _is_fn_head(tok):
    return tok.startswith("sk_") or bool(_RE_CANON_FN.match(tok))


def symbol_role(tok):
    """``'variable' | 'string' | 'number' | 'skolem' | 'constant'``."""
    if tok.startswith("$"):
        return "variable"
    if tok.startswith('"'):
        return "string"
    if _is_skolem_leaf(tok):
        return "skolem"
    if _RE_NUMBER.match(tok):
        return "number"
    return "constant"


# --------------------------------------------------------------------------
# masking, walking, substitution
# --------------------------------------------------------------------------


def _mask(term, mask_vars, colour=None):
    """Linearize with skolems (and optionally variables) held as a wildcard.

    With ``colour`` supplied (§4.1), the wildcard carries the symbol's refined
    colour, so only genuinely indistinguishable skolems still collide.  Without
    it (§4.5a), every skolem masks to the same token.
    """
    if isinstance(term, str):
        if _is_skolem_leaf(term):
            if colour is None:
                return _WILD_SKOLEM
            return _WILD_SKOLEM + colour[("leaf", term)]
        if mask_vars and term.startswith("$"):
            return _WILD_VAR
        return term
    head = term[0]
    if _is_fn_head(head):
        head = _WILD_FN_HEAD if colour is None else _WILD_FN_HEAD + colour[("head", head)]
    elif mask_vars and head.startswith("$"):
        # a variable can head a term: (Compute == ($x $y) -> false)
        head = _WILD_VAR
    return "(" + " ".join([head] + [_mask(x, mask_vars, colour) for x in term[1:]]) + ")"


def _walk(term, out):
    """Depth-first pre-order: head first, then arguments left to right."""
    if isinstance(term, str):
        out.append(("leaf", term))
        return
    out.append(("head", term[0]))
    for arg in term[1:]:
        _walk(arg, out)


def _substitute(term, leaf_map, head_map):
    """Simultaneous substitution — never a textual replace."""
    if isinstance(term, str):
        return leaf_map.get(term, term)
    head = head_map.get(term[0], term[0])
    return [head] + [_substitute(x, leaf_map, head_map) for x in term[1:]]


# --------------------------------------------------------------------------
# §4.1 colour refinement (1-WL over the atom hypergraph)
# --------------------------------------------------------------------------


def _h(*parts):
    return hashlib.sha256("\x00".join(parts).encode("utf-8")).hexdigest()[:32]


def _occurrences(term):
    """Every symbol occurrence in an atom as ``(key, path)``.

    ``path`` is the argument index sequence (§4.1) so nesting depth
    discriminates; a skolem-function head is recorded at ``path + (-1,)``.
    The atom's own head is not a symbol — it enters the signature separately.
    """
    out = []

    def rec(node, path):
        if isinstance(node, str):
            out.append((("leaf", node), tuple(path)))
            return
        if _is_fn_head(node[0]):
            out.append((("head", node[0]), tuple(path + [-1])))
        for k, arg in enumerate(node[1:]):
            rec(arg, path + [k])

    if _is_fn_head(term[0]):
        # not a valid atom head, but keep every fn head coloured so the mask
        # can never look up a symbol that refinement never saw
        out.append((("head", term[0]), (-1,)))
    for k, arg in enumerate(term[1:]):
        rec(arg, [k])
    return out


def _initial_colour(key):
    kind, tok = key
    if kind == "head":
        return _h("F")  # skolem function head — indistinguishable at start
    if symbol_role(tok) == "skolem":
        return _h("S")  # NOT seeded with the parser-chosen sk_<verb>_<n> stem
    return _h("C", tok)  # constants, numbers, strings, canonicalized variables


def _termcolour(node, colour):
    """``termcolour(sym) = colour(sym)``; ``termcolour((h a1…an)) = H(h, n, …)``.

    A skolem-function head contributes its *colour*, never its stem.
    """
    if isinstance(node, str):
        return colour[("leaf", node)]
    head = node[0]
    hc = colour[("head", head)] if _is_fn_head(head) else _h("H", head)
    return _h(hc, str(len(node) - 1), *[_termcolour(x, colour) for x in node[1:]])


def _partition(colour):
    groups = {}
    for key in sorted(colour):
        groups.setdefault(colour[key], []).append(key)
    return tuple(sorted(tuple(v) for v in groups.values()))


def _refine_from(terms, occurrences, colour):
    """Iterate 1-WL from ``colour`` until the partition stops refining."""
    if not colour:
        return {}, 0
    keys = sorted(colour)
    rounds = 0
    for _ in range(len(keys)):
        sig = {key: [] for key in keys}
        for term, occ in zip(terms, occurrences):
            argcolours = tuple(_termcolour(a, colour) for a in term[1:])
            head, arity = term[0], len(term) - 1
            for key, path in occ:
                sig[key].append((head, arity, path, argcolours))
        new = {}
        for key in keys:
            entries = sorted(repr(e) for e in sig[key])
            new[key] = _h(colour[key], *entries)
        rounds += 1
        stable = _partition(new) == _partition(colour)
        colour = new
        if stable:
            break
    return colour, rounds


def refine_colours(terms):
    """§4.1 — refine until the partition is stable.  Returns ``(colour, rounds)``.

    Truth values deliberately do not participate: structure alone determines
    the labelling, so TV jitter can never change the renaming.
    """
    occurrences = [_occurrences(t) for t in terms]
    colour = {}
    for occ in occurrences:
        for key, _ in occ:
            if key not in colour:
                colour[key] = _initial_colour(key)
    return _refine_from(terms, occurrences, colour)


def _degenerate_classes(colour):
    """Refined colour classes holding more than one skolem (§4.3)."""
    classes = {}
    for key in sorted(colour):
        if key[0] == "head" or symbol_role(key[1]) == "skolem":
            classes.setdefault(colour[key], []).append(key)
    return [members for _, members in sorted(classes.items()) if len(members) > 1]


# --------------------------------------------------------------------------
# STV
# --------------------------------------------------------------------------

STRENGTH_BANDS = (
    ("zero", 0.0, 0.1),
    ("low", 0.1, 0.5),
    ("mid", 0.5, 0.8),
    ("high", 0.8, 0.97),
    ("full", 0.97, 1.0),
)

CONFIDENCE_BANDS = (
    ("weak", 0.0, 0.5),
    ("emp", 0.5, 0.95),
    ("def", 0.95, 1.0),
)


def _band(value, bands, what):
    if not (0.0 <= value <= 1.0):
        raise ValueError("%s must lie in [0, 1], got %r" % (what, value))
    for name, lo, hi in bands[:-1]:
        if lo <= value < hi:
            return name
    return bands[-1][0]


def bucket_stv(strength, confidence):
    """§4.6 — ``(s, c)`` -> ``(strength_band, confidence_band)``.

    Written and unit-tested, but **not used by the hashes** unless
    :data:`BUCKET_TV_IN_HASHES` is true / ``bucket_tv=True`` is passed.
    """
    return (
        _band(float(strength), STRENGTH_BANDS, "strength"),
        _band(float(confidence), CONFIDENCE_BANDS, "confidence"),
    )


def _fmt_number(value):
    """Shortest round-tripping decimal; ``0.90`` and ``0.9`` render identically."""
    return repr(float(value))


def _stv_field(stv, bucket_tv):
    if bucket_tv:
        s, c = bucket_stv(stv[0], stv[1])
        return "(STV %s %s)" % (s, c)
    return "(STV %s %s)" % (_fmt_number(stv[0]), _fmt_number(stv[1]))


def _tv_sort_key(stv, bucket_tv):
    if bucket_tv:
        return bucket_stv(stv[0], stv[1])
    return (float(stv[0]), float(stv[1]))


# --------------------------------------------------------------------------
# §4.4 rules — rule-local variable namespace
# --------------------------------------------------------------------------


# Heads whose arguments are an unordered conjunction: two parses that differ only
# in their order denote the same thing and must hash identically.  ``And`` earns its
# place because the engine's bundle matching is order-insensitive (the 2026-07-09
# fix to bug_and_query_order_sensitivity), so conjunct order carries no meaning
# anywhere in the pipeline.  ``Or`` / ``Xor`` are deliberately NOT here: they are
# opaque heads the chainer matches verbatim, so their argument order is still
# operationally load-bearing and reordering it would hide a real difference.
COMMUTATIVE_HEADS = ("And",)


def _sort_conjuncts(term, keyfn):
    """Sort the arguments of the unordered-conjunction heads (``COMMUTATIVE_HEADS``)."""
    if isinstance(term, str):
        return term
    head = term[0]
    args = [_sort_conjuncts(a, keyfn) for a in term[1:]]
    if head in COMMUTATIVE_HEADS:
        args = sorted(args, key=keyfn)
    return [head] + args


def _rename_rule_variables(term):
    """§4.4 — rename an ``Implication``'s variables to ``$v0, $v1, …``.

    The order is fixed by the rule's own canonical conjunct order with every
    skolem and variable masked, so it is independent of both emission order and
    the enclosing record's symbol names.
    """
    if isinstance(term, str) or term[0] != "Implication":
        return term
    ordered = _sort_conjuncts(term, lambda a: _mask(a, mask_vars=True))
    seen = []
    walked = []
    _walk(ordered, walked)
    for _kind, tok in walked:
        # a variable may appear as a leaf or as a term head — both are the
        # same variable: (Compute == ($x $y) -> false)
        if tok.startswith("$") and tok not in seen:
            seen.append(tok)
    var_map = {tok: "$v%d" % i for i, tok in enumerate(seen)}
    return _substitute(ordered, var_map, var_map)


# --------------------------------------------------------------------------
# canonicalization
# --------------------------------------------------------------------------


def _statements_of(record):
    """Accept a parse record (``statements``) or a canonical record (``atoms``)."""
    if record.get("statements") is not None:
        return list(record["statements"])
    if record.get("atoms") is not None:
        out = []
        for i, atom in enumerate(record["atoms"]):
            stv = atom.get("stv", [1.0, 0.99])
            out.append(
                "(: %s %s (STV %s %s))"
                % (
                    atom.get("proof_name") or ("a%d" % i),
                    atom["term"],
                    _fmt_number(stv[0]),
                    _fmt_number(stv[1]),
                )
            )
        return out
    raise ValueError("record has neither 'statements' nor 'atoms'")


def _classify_events(atoms, vocab):
    """Event skolem = first argument of a role or status atom (§4.2).

    ``Member`` to a verb class cannot be checked mechanically (no verb list),
    so the role/status test carries it.  This is a readability split only: the
    ``e``/``x`` streams are disjoint by construction, so identity does not
    depend on the classification being semantically perfect — only on it being
    a deterministic function of the graph, which it is.
    """
    events = set()
    for atom in atoms:
        term = atom["term"]
        arity = len(term) - 1
        if (term[0], arity) not in vocab["role_status"]:
            continue
        if arity >= 1 and isinstance(term[1], str) and _is_skolem_leaf(term[1]):
            events.add(term[1])
    return events


def _rename_skolems(atoms, events, colour, bucket_tv):
    """§4.2 — order the atoms by their colour-masked form, then name the skolems
    by order of first occurrence in that order.

    With a discrete colouring this is fully determined.  With a degenerate one
    the stable sort falls back to emission order, which is why §4.3 wraps this
    in a branch-and-keep-minimum rather than trusting it.
    """
    keys = [
        (
            _mask(a["term"], mask_vars=False, colour=colour),
            _tv_sort_key(a["stv"], bucket_tv),
        )
        for a in atoms
    ]
    order = sorted(range(len(atoms)), key=lambda i: keys[i])

    leaf_map, head_map = {}, {}
    n_event = n_entity = n_fn = 0
    for idx in order:
        walked = []
        # Walk the conjunct-sorted term, not the emitted one: inside a single
        # ``And`` bundle the walk order IS the emission order, so naming skolems
        # straight off it would make the renaming depend on where the parser
        # happened to put (Past …).  The sort key masks skolems to their colour,
        # so it cannot depend on the names being assigned here.
        _walk(
            _sort_conjuncts(
                atoms[idx]["term"],
                lambda t: linearize_term(_mask(t, mask_vars=False, colour=colour)),
            ),
            walked,
        )
        for kind, tok in walked:
            if kind == "head" and _is_fn_head(tok):
                if tok not in head_map:
                    head_map[tok] = "f%d" % n_fn
                    n_fn += 1
            elif kind == "leaf" and _is_skolem_leaf(tok):
                if tok not in leaf_map:
                    if tok in events:
                        leaf_map[tok] = "e%d" % n_event
                        n_event += 1
                    else:
                        leaf_map[tok] = "x%d" % n_entity
                        n_entity += 1
    return leaf_map, head_map


def _build_catoms(atoms, leaf_map, head_map, vocab, bucket_tv):
    """Apply the renaming, sort conjuncts, total-order the atoms (§4.5)."""
    catoms = []
    for atom in atoms:
        term = _sort_conjuncts(
            _substitute(atom["term"], leaf_map, head_map), linearize_term
        )
        catoms.append(
            {
                "parsed": term,
                "term": linearize_term(term),
                "stv": atom["stv"],
                "proof_name": atom["proof_name"],
                "opaque": _is_opaque(vocab, term[0], len(term) - 1),
            }
        )
    catoms.sort(key=lambda a: (a["term"], _tv_sort_key(a["stv"], bucket_tv)))
    return catoms


def _canonical_labelling(atoms, terms, occurrences, events, colour, vocab, bucket_tv):
    """§4.3 — individualization + branch-and-keep-minimum.

    A refined colour class holding several skolems is a genuine automorphism
    ("two dogs barked"): refinement cannot order it, and any tiebreak on input
    order would destroy isomorphism-invariance.  So: individualize each
    candidate in turn, re-refine, recurse, linearize — and keep the
    lexicographically smallest linearization.  Deterministic and exact.

    Classes larger than :data:`SYMMETRY_K` (or a search that exceeds
    :data:`SEARCH_BUDGET`) fall back to the plain colour-order labelling and
    report ``exact: false``.
    """
    budget = [SEARCH_BUDGET]

    def plain(colouring):
        leaf_map, head_map = _rename_skolems(atoms, events, colouring, bucket_tv)
        catoms = _build_catoms(atoms, leaf_map, head_map, vocab, bucket_tv)
        text = _project(catoms, "graph", vocab, bucket_tv)
        return text, leaf_map, head_map, catoms

    def search(colouring):
        degenerate = _degenerate_classes(colouring)
        if not degenerate:
            return plain(colouring), True
        if max(len(m) for m in degenerate) > SYMMETRY_K or budget[0] <= 0:
            return plain(colouring), False
        # isomorphism-invariant target cell: smallest, then lowest colour
        target = min(degenerate, key=lambda m: (len(m), colouring[m[0]]))
        best, best_exact = None, True
        for member in sorted(target):
            budget[0] -= 1
            forked = dict(colouring)
            forked[member] = _h("IND", colouring[member])
            forked, _ = _refine_from(terms, occurrences, forked)
            candidate, ok = search(forked)
            best_exact = best_exact and ok
            if best is None or candidate[0] < best[0]:
                best = candidate
        return best, best_exact

    (text, leaf_map, head_map, catoms), exact = search(colour)
    return leaf_map, head_map, catoms, text, exact


def _atom_symbols(term, opaque):
    """Symbols an atom mentions, for star membership (§5).

    An opaque atom is a single node, so only its **top-level** arguments link
    it into stars; nothing inside is reachable.  A transparent atom links
    through its structured terms too, since a structured term is part of its
    parent atom.
    """
    out = []

    def rec(node, depth):
        if isinstance(node, str):
            if symbol_role(node) in ("skolem", "constant"):
                out.append(node)
            return
        if _is_fn_head(node[0]):
            out.append(node[0])
        if opaque and depth >= 1:
            return
        for arg in node[1:]:
            rec(arg, depth + 1)

    for arg in term[1:]:
        rec(arg, 1)
    # de-duplicate, preserving first-occurrence order
    seen, uniq = set(), []
    for tok in out:
        if tok not in seen:
            seen.add(tok)
            uniq.append(tok)
    return uniq


def _build_stars(catoms, vocab):
    """§5 — star per skolem / constant, plus one star per ``Implication``."""
    members = {}
    for i, atom in enumerate(catoms):
        term = atom["parsed"]
        for sym in _atom_symbols(term, atom["opaque"]):
            members.setdefault(sym, []).append(i)

    events = set()
    for atom in catoms:
        term = atom["parsed"]
        if (term[0], len(term) - 1) in vocab["role_status"]:
            if len(term) > 1 and isinstance(term[1], str) and _is_skolem_leaf(term[1]):
                events.add(term[1])

    stars = {}
    for sym in sorted(members):
        idxs = members[sym]
        klass = None
        for i in idxs:
            term = catoms[i]["parsed"]
            if (
                term[0] in ("Member", "Inheritance")
                and len(term) == 3
                and term[1] == sym
                and isinstance(term[2], str)
            ):
                klass = term[2]
                break
        if _RE_CANON_FN.match(sym) or sym.startswith("sk_"):
            kind = "function"
        elif symbol_role(sym) == "skolem":
            kind = "event" if sym in events else "entity"
        else:
            kind = "entity"
        stars[sym] = {"kind": kind, "class": klass, "atoms": idxs}

    for i, atom in enumerate(catoms):
        if atom["parsed"][0] == "Implication":
            digest = hashlib.sha256(atom["term"].encode("utf-8")).hexdigest()[:16]
            stars["rule:" + digest] = {"kind": "rule", "class": None, "atoms": [i]}
    return stars


def _project(catoms, projection, vocab, bucket_tv):
    lines = []
    for atom in catoms:
        head = atom["parsed"][0]
        if projection == "content" and head in vocab["surface_record"]:
            continue
        if projection == "shape":
            lines.append(atom["term"])
        else:
            lines.append(atom["term"] + " " + _stv_field(atom["stv"], bucket_tv))
    return "\n".join(lines)


def _hash(projection, text):
    payload = "%s\n%s\n%s" % (CANON_VERSION, projection, text)
    return "sha256:" + hashlib.sha256(payload.encode("utf-8")).hexdigest()


def _canonical_json(obj):
    return json.dumps(obj, sort_keys=True, ensure_ascii=False, separators=(",", ":"))


def view_entry(parse_record, canon):
    """The 3-field readable projection of one record: sentence / before / after.

    A VIEW, not an identity artifact: nothing downstream may read it. ``before``
    is the faithful statements verbatim; ``after`` renders each canonical atom
    back in assertion shape, in linearization order — proof names are provenance
    (identity ignores them) but they are what lets a reader align the two lists.
    """
    if canon.get("multi_reading"):
        after = []
        for r in canon.get("readings") or []:
            after.append("[reading %s]" % r["tag"])
            after += ["(: %s %s (STV %s %s))" % (a.get("proof_name") or "_",
                                                 a["term"], a["stv"][0], a["stv"][1])
                      for a in r["atoms"]]
    else:
        after = ["(: %s %s (STV %s %s))" % (a.get("proof_name") or "_",
                                            a["term"], a["stv"][0], a["stv"][1])
                 for a in canon["atoms"]]
    return {
        "sentence": " ".join(parse_record.get("sentences") or []),
        "before": list(parse_record.get("statements") or []),
        "after": after,
    }


def view_path_for(canon_path):
    base = str(canon_path)
    if base.endswith(".canon.jsonl"):
        base = base[: -len(".canon.jsonl")]
    return base + ".view.json"


def write_view(view, path):
    with open(path, "w", encoding="utf-8") as fh:
        json.dump(view, fh, indent=4, ensure_ascii=False)
        fh.write("\n")


#: `(Interpretation rN (: ...))` transport wrapper (prompt.txt "Multiple live readings",
#: adopted batch-2 item B, 2026-08-21). Split BEFORE canonicalization: each reading =
#: shared statements + that tag's inner statements, canonicalized as an ordinary record.
RE_INTERP = re.compile(r"^\(Interpretation\s+(r\d+)\s+(\(.*\))\)$")
#: set-identity payload marker — structurally distinct from any atom-level payload
MRSET_PAYLOAD = "MRSET/1"


def split_readings(statements):
    """(shared, {tag: [inner statements]}) — or None when no wrapper is present."""
    shared, tagged, found = [], {}, False
    for s in statements:
        m = RE_INTERP.match(s.strip())
        if m:
            found = True
            tagged.setdefault(m.group(1), []).append(m.group(2))
        else:
            shared.append(s)
    return (shared, tagged) if found else None


def _set_hash(ids):
    payload = "%s\n%s\n%s" % (CANON_VERSION, MRSET_PAYLOAD, "\n".join(sorted(ids)))
    return "sha256:" + hashlib.sha256(payload.encode("utf-8")).hexdigest()


def _canonicalize_multireading(record, shared, tagged, bucket_tv, vocab):
    readings = []
    for tag in sorted(tagged):
        sub = dict(record)
        sub["statements"] = list(shared) + tagged[tag]
        sub.pop("atoms", None)
        sub.pop("readings", None)
        c = canonicalize(sub, bucket_tv=bucket_tv, vocab=vocab)
        readings.append({
            "tag": tag, "graph_id": c["graph_id"], "shape_id": c["shape_id"],
            "content_id": c["content_id"], "atoms": c["atoms"],
            "linearization": c["linearization"], "renaming": c["renaming"],
            "stars": c["stars"], "exact": c["exact"], "stats": c["stats"],
        })
    return {
        "schema": CANON_VERSION,
        "id": record.get("id"),
        "run": record.get("run"),
        "parse_input_sha256": hashlib.sha256(
            _canonical_json(record).encode("utf-8")
        ).hexdigest(),
        "canon_version": CANON_VERSION,
        "multi_reading": True,
        "readings": readings,
        # top-level identity = the READING SET: sorted per-reading ids hashed under a
        # distinct payload. Tag names and reading order cannot affect it.
        "graph_id": _set_hash([r["graph_id"] for r in readings]),
        "shape_id": _set_hash([r["shape_id"] for r in readings]),
        "content_id": _set_hash([r["content_id"] for r in readings]),
        # empty atom/star views: miners iterate these and therefore skip the record
        # (multi-reading mining semantics is deliberately out of scope — see spec §4.8)
        "atoms": [],
        "linearization": "",
        "renaming": {},
        "stars": {},
        "exact": all(r["exact"] for r in readings),
        "stats": {"readings": len(readings),
                  "atoms": sum(len(r["atoms"]) for r in readings)},
    }


def canonicalize(record, bucket_tv=None, vocab=None):
    """Parse record (``schema.md`` §3) -> canonical record (``canonicalization.md`` §1).

    Also accepts a canonical record as input, which is what makes §7's
    idempotence test expressible: the canonical skolem names ``e0``/``x0``/``f0``
    are recognised as skolems and re-canonicalize to themselves.

    ``exact`` — ``False`` when some refined colour class holds more than one
    skolem, i.e. the graph has a genuine automorphism ("two dogs barked") that
    refinement cannot order.  The output is still deterministic and still
    agrees across emission orders (§7.5); ``exact`` records that the procedure
    cannot *certify* it, which is §4.3's job.  ``stats.symmetric_classes`` and
    ``stats.max_symmetric_class`` say how far past ``SYMMETRY_K`` such a record
    is, so §4.3's ≤K/>K split can be applied later without re-deriving it.

    Free variables outside an ``Implication`` are a C6 validator error; they
    are left untouched here (treated as opaque constants).
    """
    if bucket_tv is None:
        bucket_tv = BUCKET_TV_IN_HASHES
    if vocab is None:
        vocab = load_vocabulary()

    if record.get("multi_reading") and record.get("readings"):
        # idempotence for multi-reading canonical records: re-canonicalize each
        # reading (its atoms are already canonical -> fixed point), re-hash the set
        readings = []
        for r in record["readings"]:
            c = canonicalize({"id": record.get("id"), "run": record.get("run"),
                              "atoms": r["atoms"]}, bucket_tv=bucket_tv, vocab=vocab)
            readings.append(dict(r, graph_id=c["graph_id"], shape_id=c["shape_id"],
                                 content_id=c["content_id"], atoms=c["atoms"],
                                 linearization=c["linearization"], renaming=c["renaming"],
                                 stars=c["stars"], exact=c["exact"], stats=c["stats"]))
        out = dict(record)
        out["readings"] = readings
        out["graph_id"] = _set_hash([r["graph_id"] for r in readings])
        out["shape_id"] = _set_hash([r["shape_id"] for r in readings])
        out["content_id"] = _set_hash([r["content_id"] for r in readings])
        out["exact"] = all(r["exact"] for r in readings)
        return out

    statements = _statements_of(record)
    split = split_readings(statements)
    if split is not None:
        return _canonicalize_multireading(record, split[0], split[1], bucket_tv, vocab)

    atoms = [parse_statement(s) for s in statements]

    # 1. rule-local variable namespaces (§4.4)
    for atom in atoms:
        atom["term"] = _rename_rule_variables(atom["term"])

    # 2. colour refinement (§4.1) + individualization (§4.3), then renaming (§4.2)
    terms = [a["term"] for a in atoms]
    occurrences = [_occurrences(t) for t in terms]
    initial = {}
    for occ in occurrences:
        for key, _ in occ:
            if key not in initial:
                initial[key] = _initial_colour(key)
    colour, refine_rounds = _refine_from(terms, occurrences, initial)
    degenerate = _degenerate_classes(colour)
    events = _classify_events(atoms, vocab)

    # 3. renaming + total order (§4.2, §4.5)
    leaf_map, head_map, catoms, graph_text, exact = _canonical_labelling(
        atoms, terms, occurrences, events, colour, vocab, bucket_tv
    )

    # 4. projections and hashes (§4.7)
    shape_text = _project(catoms, "shape", vocab, bucket_tv)
    content_text = _project(catoms, "content", vocab, bucket_tv)

    constants = set()
    for atom in catoms:
        walked = []
        _walk(atom["parsed"], walked)
        for kind, tok in walked:
            if kind == "leaf" and symbol_role(tok) == "constant":
                constants.add(tok)

    renaming = {}
    renaming.update(leaf_map)
    renaming.update(head_map)

    out = {
        "schema": CANON_VERSION,
        "id": record.get("id"),
        "run": record.get("run"),
        "parse_input_sha256": hashlib.sha256(
            _canonical_json(record).encode("utf-8")
        ).hexdigest(),
        "canon_version": CANON_VERSION,
        "atoms": [
            {
                "term": a["term"],
                "stv": [a["stv"][0], a["stv"][1]],
                "bucket": list(bucket_stv(a["stv"][0], a["stv"][1])),
                "proof_name": a["proof_name"],
                "opaque": a["opaque"],
            }
            for a in catoms
        ],
        "linearization": graph_text,
        "graph_id": _hash("graph", graph_text),
        "shape_id": _hash("shape", shape_text),
        "content_id": _hash("content", content_text),
        "renaming": {k: renaming[k] for k in sorted(renaming)},
        "stars": _build_stars(catoms, vocab),
        "exact": exact,
        "stats": {
            "atoms": len(catoms),
            "skolems": len(renaming),
            "constants": len(constants),
            "refine_rounds": refine_rounds,
            "symmetric_classes": len(degenerate),
            "max_symmetric_class": max([len(m) for m in degenerate] or [0]),
            "bucketed_tv": bool(bucket_tv),
        },
    }
    return out


# --------------------------------------------------------------------------
# §6 graph distance
# --------------------------------------------------------------------------


def _hungarian(cost):
    """Exact min-cost assignment (Jonker-Volgenant / Kuhn-Munkres, O(n^3)).

    ``cost`` is a rectangular matrix with ``rows <= cols``.  Returns
    ``assign[row] = col``.  Tie resolution follows index order, so the result
    is a deterministic function of the matrix.
    """
    n = len(cost)
    if n == 0:
        return []
    m = len(cost[0])
    inf = float("inf")
    u = [0.0] * (n + 1)
    v = [0.0] * (m + 1)
    p = [0] * (m + 1)
    way = [0] * (m + 1)
    for i in range(1, n + 1):
        p[0] = i
        j0 = 0
        minv = [inf] * (m + 1)
        used = [False] * (m + 1)
        while True:
            used[j0] = True
            i0 = p[j0]
            delta = inf
            j1 = -1
            for j in range(1, m + 1):
                if used[j]:
                    continue
                cur = cost[i0 - 1][j - 1] - u[i0] - v[j]
                if cur < minv[j]:
                    minv[j] = cur
                    way[j] = j0
                if minv[j] < delta:
                    delta = minv[j]
                    j1 = j
            for j in range(0, m + 1):
                if used[j]:
                    u[p[j]] += delta
                    v[j] -= delta
                else:
                    minv[j] -= delta
            j0 = j1
            if p[j0] == 0:
                break
        while j0:
            j1 = way[j0]
            p[j0] = p[j1]
            j0 = j1
    assign = [-1] * n
    for j in range(1, m + 1):
        if p[j]:
            assign[p[j] - 1] = j - 1
    return assign


def _skolem_inventory(catoms):
    """Ordered skolem leaves / function heads of a canonical record."""
    leaves, heads = [], []
    for atom in catoms:
        walked = []
        _walk(atom, walked)
        for kind, tok in walked:
            if kind == "leaf" and _is_skolem_leaf(tok) and tok not in leaves:
                leaves.append(tok)
            elif kind == "head" and _is_fn_head(tok) and tok not in heads:
                heads.append(tok)
    return sorted(leaves), sorted(heads)


def _mask_others(term, keep, replacement):
    """Linearize with every skolem but ``keep`` replaced by ``replacement``."""
    if isinstance(term, str):
        if _is_skolem_leaf(term) and term != keep:
            return replacement
        return term
    head = term[0]
    if _is_fn_head(head) and head != keep:
        head = replacement
    return "(" + " ".join([head] + [_mask_others(x, keep, replacement) for x in term[1:]]) + ")"


def _atom_all_symbols(term):
    out = set()

    def rec(node):
        if isinstance(node, str):
            out.add(node)
            return
        out.add(node[0])
        for arg in node[1:]:
            rec(arg)

    rec(term)
    return out


def _overlap(lines_a, lines_b):
    counts_a, counts_b = {}, {}
    for line in lines_a:
        counts_a[line] = counts_a.get(line, 0) + 1
    for line in lines_b:
        counts_b[line] = counts_b.get(line, 0) + 1
    shared = 0
    for line in sorted(counts_a):
        shared += min(counts_a[line], counts_b.get(line, 0))
    union = len(lines_a) + len(lines_b) - shared
    return shared, union


def soft_jaccard(canon_a, canon_b, bucket_tv=None):
    """§6 — soft-Jaccard under the best skolem alignment.  Deterministic, 0.0..1.0.

    Constants must match exactly; skolems are matched by an injective map found
    by (1) restricting candidates to the same skolem stream, scoring
    colour-compatible pairs higher, (2) an exact Hungarian solve of the
    similarity matrix, (3) one bounded local-improvement pass.

    Deviation from §6 step 1, stated deliberately: colour compatibility is a
    strong *preference* in the cost matrix rather than a hard prune.  A hard
    prune is lossless only for graphs that are actually isomorphic — and those
    never reach here, because their hashes already agree.  On the near-miss
    graphs this function actually sees, a hard prune would refuse to align the
    obviously-corresponding skolems and would report a spuriously low score.
    As §6 notes, the result is a lower bound on true overlap either way, and
    the identical procedure runs on both sides of every comparison.
    """
    if bucket_tv is None:
        bucket_tv = BUCKET_TV_IN_HASHES
    if canon_a.get("graph_id") and canon_a.get("graph_id") == canon_b.get("graph_id"):
        return 1.0

    terms_a = [parse_term(a["term"]) for a in canon_a.get("atoms", [])]
    terms_b = [parse_term(a["term"]) for a in canon_b.get("atoms", [])]
    stv_a = [a["stv"] for a in canon_a.get("atoms", [])]
    stv_b = [a["stv"] for a in canon_b.get("atoms", [])]

    if not terms_a and not terms_b:
        return 1.0

    def lines(terms, stvs, sub_leaf, sub_head):
        return [
            linearize_term(_substitute(t, sub_leaf, sub_head))
            + " "
            + _stv_field(s, bucket_tv)
            for t, s in zip(terms, stvs)
        ]

    leaves_a, heads_a = _skolem_inventory(terms_a)
    leaves_b, heads_b = _skolem_inventory(terms_b)
    refined_a, _ = refine_colours(terms_a)
    refined_b, _ = refine_colours(terms_b)

    def align(syms_a, syms_b, kind):
        """Return dict a->b for one stream, by Hungarian on the similarity matrix."""
        if not syms_a or not syms_b:
            return {}
        colours_a = {s: refined_a.get((kind, s)) for s in syms_a}
        colours_b = {s: refined_b.get((kind, s)) for s in syms_b}
        masked_a = {
            s: sorted(
                _mask_others(t, s, _WILD_SKOLEM) + " " + _stv_field(v, bucket_tv)
                for t, v in zip(terms_a, stv_a)
                if s in _atom_all_symbols(t)
            )
            for s in syms_a
        }
        masked_b = {
            s: sorted(
                _mask_others(t, s, _WILD_SKOLEM) + " " + _stv_field(v, bucket_tv)
                for t, v in zip(terms_b, stv_b)
                if s in _atom_all_symbols(t)
            )
            for s in syms_b
        }
        score = []
        for sa in syms_a:
            row = []
            for sb in syms_b:
                agree, _ = _overlap(masked_a[sa], masked_b[sb])
                compatible = colours_a[sa] is not None and colours_a[sa] == colours_b[sb]
                row.append(2 * agree + (1 if compatible else 0))
            score.append(row)
        transposed = len(syms_a) > len(syms_b)
        matrix = score
        rows, cols = syms_a, syms_b
        if transposed:
            matrix = [[score[i][j] for i in range(len(syms_a))] for j in range(len(syms_b))]
            rows, cols = syms_b, syms_a
        best = max(max(r) for r in matrix)
        cost = [[best - value for value in r] for r in matrix]
        assign = _hungarian(cost)
        out = {}
        for i, j in enumerate(assign):
            if j < 0:
                continue
            if transposed:
                out[cols[j]] = rows[i]
            else:
                out[rows[i]] = cols[j]
        return out

    leaf_map = align(leaves_a, leaves_b, "leaf")
    head_map = align(heads_a, heads_b, "head")

    # unmatched A-skolems get unique tokens so they cannot match by accident
    def complete(syms, mapping, tag):
        full = dict(mapping)
        k = 0
        for s in syms:
            if s not in full:
                full[s] = "%s%s%d" % (_UNMATCHED, tag, k)
                k += 1
        return full

    leaf_full = complete(leaves_a, leaf_map, "l")
    head_full = complete(heads_a, head_map, "h")

    lines_b = lines(terms_b, stv_b, {}, {})

    def score_of(lmap, hmap):
        shared, union = _overlap(lines(terms_a, stv_a, lmap, hmap), lines_b)
        return shared, union

    shared, union = score_of(leaf_full, head_full)

    # one local-improvement pass, capped at 50 swaps (§6 step 3)
    swaps = 0
    improved = True
    while improved and swaps < 50:
        improved = False
        for i in range(len(leaves_a)):
            for j in range(i + 1, len(leaves_a)):
                if swaps >= 50:
                    break
                trial = dict(leaf_full)
                a_i, a_j = leaves_a[i], leaves_a[j]
                trial[a_i], trial[a_j] = leaf_full[a_j], leaf_full[a_i]
                t_shared, t_union = score_of(trial, head_full)
                if t_union and (t_shared * union > shared * t_union):
                    leaf_full = trial
                    shared, union = t_shared, t_union
                    swaps += 1
                    improved = True

    if union == 0:
        return 1.0
    return shared / float(union)


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------


def main(argv=None):
    import argparse
    import sys

    ap = argparse.ArgumentParser(description="Canonicalize a parses JSONL file.")
    ap.add_argument("input", help="fusenf/parses/<tier>.parses.jsonl")
    ap.add_argument("output", help="fusenf/canonical/<tier>.canon.jsonl")
    ap.add_argument(
        "--bucket-tv",
        action="store_true",
        help="use §4.6 bucketed truth values in graph_id / content_id",
    )
    ap.add_argument(
        "--no-view",
        action="store_true",
        help="skip the readable <output-stem>.view.json (sentence/before/after) dump",
    )
    args = ap.parse_args(argv)

    vocab = load_vocabulary()
    n = 0
    view = {}
    with open(args.input, "r", encoding="utf-8") as src, open(
        args.output, "w", encoding="utf-8"
    ) as dst:
        for line in src:
            line = line.strip()
            if not line:
                continue
            record = json.loads(line)
            canon = canonicalize(record, bucket_tv=args.bucket_tv, vocab=vocab)
            dst.write(_canonical_json(canon) + "\n")
            if not args.no_view:
                view["%s run%s" % (canon["id"], canon["run"])] = view_entry(record, canon)
            n += 1
    sys.stderr.write("canonicalized %d records -> %s\n" % (n, args.output))
    if not args.no_view:
        vp = view_path_for(args.output)
        write_view(view, vp)
        sys.stderr.write("readable view -> %s\n" % vp)
    return 0


if __name__ == "__main__":  # pragma: no cover
    raise SystemExit(main())
