"""FUSE-NF — mechanical validation of parse records (schema.md §5.1, checks C1-C8).

Everything decidable from the text of a record plus `vocabulary.json`, and nothing else.
Judgment — is this parse *right*, does `prompt.txt` cover this construction, did the parse
leak interpretive context — belongs to the agent reviewer (§5.2) and is deliberately absent.

REPORT-ONLY IS THE DEFAULT. Every finding carries `severity: "report"`; nothing is
quarantined. Severities get set from the observed distribution once the pilot has run, so a
too-strict check cannot silently drop exactly the novel constructions Tier B exists to
surface. `strict=True` maps codes through `STRICT_SEVERITY` when that day comes.

C7 (chainer smoke test) is expensive and runs batched per file, not per record.
"""

from __future__ import annotations

import hashlib
import io
import json
import os
import re
import sys
from contextlib import redirect_stdout, redirect_stderr
from typing import Any, Iterable, Sequence

# The harness is a directory of scripts, not an installed package.
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from records import (  # noqa: E402
    PARSE_SCHEMA,
    Node,
    input_sha256,
    is_number,
    is_string_literal,
    is_variable,
    iter_terms,
    iter_tokens,
    parse_sexp,
    read_jsonl,
    term_key,
)

# PeTTaChainer cfe25f9 (2026-08-04) makes PeTTa an ordinary pinned dependency, so there is no
# fork checkout to put on sys.path any more. C7 now needs the interpreter from PeTTaChainer's own
# uv environment: run the harness under `cd /home/manhin/Dev/PeTTaChainer && uv run python ...`,
# or point PETTA_VENV_PYTHON at that interpreter. Kept as a fallback for older checkouts.
PETTA_PYTHON_PATH = os.environ.get("PETTA_PYTHON_PATH", "")

CHECKS = ("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8")

#: Provisional, unused while report-only. Set from the pilot distribution, not by guesswork.
STRICT_SEVERITY = {
    "C1": "error", "C2": "error", "C3": "error", "C4": "warn",
    "C5": "warn", "C6": "warn", "C7": "error", "C8": "warn",
}

# Casing (schema.md §5.1 C5, prompt.txt "Names and casing").
UPPER_CAMEL_RE = re.compile(r"^[A-Z][A-Za-z0-9]*$")
SNAKE_RE = re.compile(r"^[a-z][a-z0-9_]*$")
VARIABLE_RE = re.compile(r"^\$[A-Za-z][A-Za-z0-9_]*$")
PROOF_NAME_RE = re.compile(r"^[a-z][a-z0-9_]*$")
SKOLEM_FN_RE = re.compile(r"^sk_[a-z0-9_]*$")
ID_RE = re.compile(r"^[A-Za-z][A-Za-z0-9_]*-\d{6}$")
SHA256_RE = re.compile(r"^[0-9a-f]{64}$")

#: Heads that are lowercase by declaration (prompt.txt "Casing exceptions").
LOWERCASE_HEADS = ("can", "obligated", "permitted", "forKind")
#: The assertion head itself.
ASSERTION_HEAD = ":"

#: Heads whose arg0 introduces a symbol other atoms may predicate over (C6).
DECLARING_HEADS = ("Member", "Inheritance")

REQUIRED_TOP_FIELDS = {
    "schema": str, "id": str, "run": int, "sentences": list,
    "context": dict, "statements": list, "parser": dict, "input_sha256": str,
}
REQUIRED_PARSER_FIELDS = ("model", "prompt_sha256", "seeded_sha256", "harness", "date")


# ---------------------------------------------------------------------------
# loading
# ---------------------------------------------------------------------------


def load_json(path) -> dict:
    with open(str(path), "r", encoding="utf-8") as fh:
        return json.load(fh)


def load_vocab(path) -> dict:
    return load_json(path)


def build_corpus_index(paths) -> dict:
    """{id: corpus item} from one JSONL file, a list of them, or a directory of them."""
    if paths is None:
        return {}
    if isinstance(paths, (str, os.PathLike)):
        path = str(paths)
        if os.path.isdir(path):
            files = sorted(
                os.path.join(path, n) for n in sorted(os.listdir(path)) if n.endswith(".jsonl")
            )
        else:
            files = [path]
    else:
        files = [str(p) for p in paths]
    index: dict = {}
    for f in files:
        for item in read_jsonl(f):
            if item.get("id"):
                index[item["id"]] = item
    return index


# ---------------------------------------------------------------------------
# vocabulary lookup — operator identity is (name, arity), never name alone
# ---------------------------------------------------------------------------


def resolve_operator(vocab: dict, head: str, arity: int) -> dict | None:
    """Operator entry for `(head, arity)`, with the matching sense merged in.

    `Yet` is a genuine head collision — `(Yet <event>)` is the aspectual particle,
    `(Yet <main> <sub>)` the adversative connective. Anything keyed on head name alone
    conflates them (schema.md §7).
    """
    op = (vocab.get("operators") or {}).get(head)
    if op is None:
        return None
    senses = op.get("senses")
    if senses:
        for sense in senses:
            if sense.get("arity") == arity:
                merged = dict(op)
                merged.update(sense)
                return merged
    return op


def operator_class(vocab: dict, head: str, arity: int) -> str | None:
    op = resolve_operator(vocab, head, arity)
    return op.get("class") if op else None


def _open_class_heads(vocab: dict) -> frozenset:
    """Heads checked by position and arity only, never by name.

    `attested_heads` is a documentation list of lexical relations we have seen.
    `oblique_prepositions` is load-bearing: `prompt.txt` licenses obliques
    **named after their own preposition or adverb**, so that head set is open by
    construction. Enumerating only the attested ones made C4 fire on every
    previously-unseen preposition — `By` in "antibodies work **by** attaching …"
    is a correct parse — and on natural text that noise would bury real findings.
    """
    oc = vocab.get("open_class") or {}
    return frozenset(oc.get("attested_heads") or []) | frozenset(
        oc.get("oblique_prepositions") or []
    )


# ---------------------------------------------------------------------------
# findings
# ---------------------------------------------------------------------------


def _finding(code: str, index: int | None, detail: str, text: str, strict: bool) -> dict:
    return {
        "code": code,
        "severity": STRICT_SEVERITY.get(code, "report") if strict else "report",
        "statement_index": index,
        "detail": detail,
        "text": text,
    }


def _head_of(node: Node) -> str | None:
    if isinstance(node, list) and node and isinstance(node[0], str):
        return node[0]
    return None


# ---------------------------------------------------------------------------
# C1 — JSON conformance
# ---------------------------------------------------------------------------


def check_c1(record: dict, corpus_index: dict, strict: bool) -> list[dict]:
    out: list[dict] = []

    def add(detail: str) -> None:
        out.append(_finding("C1", None, detail, "", strict))

    for field, typ in REQUIRED_TOP_FIELDS.items():
        if field not in record:
            add(f"missing required field '{field}'")
            continue
        value = record[field]
        if typ is int and isinstance(value, bool):
            add(f"field '{field}' must be {typ.__name__}, got bool")
        elif not isinstance(value, typ):
            add(f"field '{field}' must be {typ.__name__}, got {type(value).__name__}")

    schema = record.get("schema")
    if isinstance(schema, str) and schema != PARSE_SCHEMA:
        add(f"schema is {schema!r}, expected {PARSE_SCHEMA!r}")

    item_id = record.get("id")
    if isinstance(item_id, str) and not ID_RE.match(item_id):
        add(f"id {item_id!r} is not <tier>-<6 digits>")

    run = record.get("run")
    if isinstance(run, int) and not isinstance(run, bool) and run < 1:
        add(f"run must be >= 1, got {run}")

    sentences = record.get("sentences")
    if isinstance(sentences, list):
        if not sentences:
            add("sentences is empty")
        for n, s in enumerate(sentences):
            if not isinstance(s, str):
                add(f"sentences[{n}] must be str, got {type(s).__name__}")

    statements = record.get("statements")
    if isinstance(statements, list):
        for n, s in enumerate(statements):
            if not isinstance(s, str):
                add(f"statements[{n}] must be str, got {type(s).__name__}")

    equiv = record.get("equiv_class", None)
    if equiv is not None and not isinstance(equiv, str):
        add(f"equiv_class must be str or null, got {type(equiv).__name__}")

    parser = record.get("parser")
    if isinstance(parser, dict):
        for field in REQUIRED_PARSER_FIELDS:
            if not parser.get(field):
                add(f"parser.{field} missing or empty")
        for field in ("prompt_sha256", "seeded_sha256"):
            value = parser.get(field)
            if isinstance(value, str) and value and not SHA256_RE.match(value):
                add(f"parser.{field} is not a 64-char lowercase sha256")

    declared = record.get("input_sha256")
    if isinstance(declared, str):
        if not SHA256_RE.match(declared):
            add("input_sha256 is not a 64-char lowercase sha256")
        if isinstance(record.get("sentences"), list) and isinstance(record.get("context"), dict):
            recomputed = input_sha256(record)
            if recomputed != declared:
                add(
                    "input_sha256 does not match this record's own sentences/context "
                    f"(declared {declared[:12]}…, recomputed {recomputed[:12]}…)"
                )

    item = corpus_index.get(item_id) if isinstance(item_id, str) else None
    if item is None:
        if corpus_index:
            add(f"id {item_id!r} is not in the corpus index")
    else:
        corpus_hash = item.get("input_sha256")
        if isinstance(corpus_hash, str) and isinstance(declared, str) and corpus_hash != declared:
            add(
                f"input_sha256 differs from corpus item {item_id} "
                f"(record {declared[:12]}…, corpus {corpus_hash[:12]}…) — input drift"
            )
        if item.get("sentences") != record.get("sentences"):
            add("denormalized 'sentences' differs from the corpus item")
        if (item.get("context") or {}) != (record.get("context") or {}):
            add("denormalized 'context' differs from the corpus item")

    return out


# ---------------------------------------------------------------------------
# C2 — well-formed s-expressions
# ---------------------------------------------------------------------------


def check_c2(statements: Sequence[str], parsed: Sequence[dict], strict: bool) -> list[dict]:
    out: list[dict] = []
    for i, (text, tree) in enumerate(zip(statements, parsed)):
        for err in tree["errors"]:
            out.append(_finding("C2", i, err, text, strict))
    return out


# ---------------------------------------------------------------------------
# C3 — assertion shape, proof names, truth values
# ---------------------------------------------------------------------------


def _stv_number(tok: Any) -> float | None:
    if isinstance(tok, str) and is_number(tok):
        return float(tok)
    return None


def check_c3(statements: Sequence[str], parsed: Sequence[dict], strict: bool) -> list[dict]:
    out: list[dict] = []
    seen_names: dict[str, int] = {}
    for i, (text, tree) in enumerate(zip(statements, parsed)):
        node = tree["node"]
        if node is None:
            continue  # C2 owns this one

        def add(detail: str) -> None:
            out.append(_finding("C3", i, detail, text, strict))

        if _head_of(node) != ASSERTION_HEAD:
            actual = term_key(node[0]) if node else "()"
            add("not an assertion '(: <proof-name> <expr> (STV <s> <c>))': "
                f"head is {actual!r}")
            continue
        if len(node) != 4:
            add(f"assertion has {len(node) - 1} arguments, expected 3 (name, expr, STV)")
            continue
        name, expr, stv = node[1], node[2], node[3]

        if not isinstance(name, str):
            add(f"proof name must be a symbol, got {term_key(name)!r}")
        elif not PROOF_NAME_RE.match(name):
            add(f"proof name {name!r} is not snake_case")
        else:
            first = seen_names.get(name)
            if first is not None:
                add(f"proof name {name!r} already used by statement {first}")
            else:
                seen_names[name] = i

        if not isinstance(expr, list):
            add(f"asserted expression must be a compound term, got bare {expr!r}")

        if not isinstance(stv, list) or _head_of(stv) != "STV":
            add(f"missing or malformed truth value, got {term_key(stv)!r}")
            continue
        if len(stv) != 3:
            add(f"STV takes 2 arguments, got {len(stv) - 1}")
            continue
        strength, confidence = _stv_number(stv[1]), _stv_number(stv[2])
        if strength is None:
            add(f"STV strength {term_key(stv[1])!r} is not a number")
        elif not 0.0 <= strength <= 1.0:
            add(f"STV strength {strength} outside [0,1]")
        if confidence is None:
            add(f"STV confidence {term_key(stv[2])!r} is not a number")
        else:
            if not 0.0 <= confidence <= 1.0:
                add(f"STV confidence {confidence} outside [0,1]")
            elif confidence == 1.0:
                add("STV confidence is 1.0 (prompt rule: never confidence 1.0)")
    return out


# ---------------------------------------------------------------------------
# C4 — closed-class head + arity, keyed on (name, arity)
# ---------------------------------------------------------------------------


def _engine_arg_terms(node: Node, vocab: dict) -> set:
    """`id()`s of compound arguments of engine-class operators.

    Engine operators carry their own argument syntax — `(Compute - (7 4) -> 3)` holds a
    bare number tuple, not an operator application — so C4 must not read `7` as an
    unknown head and C5 must not demand it be UpperCamelCase. The assertion head is
    engine-class too and must NOT grant this skip (it would exempt every asserted
    expression).
    """
    out: set = set()
    for term in iter_terms(node):
        head = _head_of(term)
        if head and head != ASSERTION_HEAD and not is_variable(head) \
                and operator_class(vocab, head, len(term) - 1) == "engine":
            for arg in term[1:]:
                if isinstance(arg, list):
                    out.add(id(arg))
    return out


def check_c4(statements: Sequence[str], parsed: Sequence[dict], vocab: dict, strict: bool) -> list[dict]:
    out: list[dict] = []
    open_heads = _open_class_heads(vocab)
    deprecated = vocab.get("deprecated_operators") or {}
    for i, (text, tree) in enumerate(zip(statements, parsed)):
        node = tree["node"]
        if node is None:
            continue
        engine_args = _engine_arg_terms(node, vocab)
        for term in iter_terms(node):
            if id(term) in engine_args:
                continue
            head = _head_of(term)
            if head is None:
                out.append(_finding(
                    "C4", i, f"term head is not a symbol: {term_key(term)!r}", text, strict))
                continue
            if is_variable(head):
                continue  # a variable head is a query/computation slot, not an operator
            arity = len(term) - 1
            op = resolve_operator(vocab, head, arity)
            if op is None:
                dep = deprecated.get(head)
                if dep:
                    out.append(_finding(
                        "C4", i,
                        f"deprecated head {head!r} (removed {dep.get('removed', '?')}): "
                        f"{dep.get('reason', 'no reason recorded')}",
                        text, strict))
                    continue
                if SKOLEM_FN_RE.match(head) or head in open_heads:
                    continue  # open class: position and arity only, never checked by name
                hint = ""
                if UPPER_CAMEL_RE.match(head) and all(
                    isinstance(a, str) and SNAKE_RE.match(a) for a in term[1:]
                ):
                    hint = " — shape is consistent with an open-class lexical relation"
                out.append(_finding(
                    "C4", i, f"unknown closed-class head {head!r} (arity {arity}){hint}",
                    text, strict))
                continue
            arities = op.get("arities") or []
            if op.get("variadic"):
                if arities and not (min(arities) <= arity <= max(arities)):
                    out.append(_finding(
                        "C4", i,
                        f"variadic head {head!r} arity {arity} outside the attested range "
                        f"{min(arities)}..{max(arities)} (informational — variadic arities "
                        "record attestation, not a signature)",
                        text, strict))
            elif arity not in arities:
                out.append(_finding(
                    "C4", i,
                    f"head {head!r} arity {arity}, vocabulary declares {arities}",
                    text, strict))
    return out


# ---------------------------------------------------------------------------
# C5 — casing
# ---------------------------------------------------------------------------


def _record_heads(parsed: Iterable[dict]) -> frozenset:
    """Every symbol used as a head anywhere in the record.

    `(Symmetric Cousin)` puts a relation head in an argument slot; so does any future
    head-naming operator. Collecting the record's own heads keeps C5 from calling that a
    casing violation without hard-coding one operator.
    """
    heads: set[str] = set()
    for tree in parsed:
        node = tree["node"]
        if node is None:
            continue
        for term in iter_terms(node):
            head = _head_of(term)
            if head is not None:
                heads.add(head)
    return frozenset(heads)


def check_c5(statements: Sequence[str], parsed: Sequence[dict], vocab: dict, strict: bool) -> list[dict]:
    out: list[dict] = []
    open_heads = _open_class_heads(vocab)
    heads_in_record = _record_heads(parsed)
    for i, (text, tree) in enumerate(zip(statements, parsed)):
        node = tree["node"]
        if node is None:
            continue

        def add(detail: str) -> None:
            out.append(_finding("C5", i, detail, text, strict))

        engine_args = _engine_arg_terms(node, vocab)
        for term in iter_terms(node):
            if id(term) in engine_args:
                continue
            head = _head_of(term)
            if head is None:
                continue
            arity = len(term) - 1
            if not (
                head == ASSERTION_HEAD
                or head in LOWERCASE_HEADS
                or is_variable(head)
                or SKOLEM_FN_RE.match(head)
                or UPPER_CAMEL_RE.match(head)
            ):
                add(f"head {head!r} is not UpperCamelCase "
                    f"(declared lowercase heads: {', '.join(LOWERCASE_HEADS)})")
            op = resolve_operator(vocab, head, arity)
            head_class = op.get("class") if op else None
            if head_class == "engine" and head != ASSERTION_HEAD:
                continue  # `(Compute > ($n 4) -> true)` — engine syntax, not entity terms
            for pos, arg in enumerate(term[1:], start=1):
                if not isinstance(arg, str):
                    continue
                if head == ASSERTION_HEAD and pos == 1:
                    continue  # proof name — C3 owns its shape
                if is_string_literal(arg) or is_number(arg):
                    continue
                if arg.startswith("$"):
                    if not VARIABLE_RE.match(arg):
                        add(f"malformed variable {arg!r} in ({head} …)")
                    continue
                if arg.startswith("'") or arg.endswith("'"):
                    add(f"string literal {arg!r} must be double-quoted")
                    continue
                if SNAKE_RE.match(arg):
                    continue
                if arg in heads_in_record or arg in open_heads:
                    continue  # a relation name in an argument slot, e.g. (Symmetric Cousin)
                add(f"entity term {arg!r} in ({head} …) is not lowercase snake_case")
    return out


# ---------------------------------------------------------------------------
# C6 — structural sanity
# ---------------------------------------------------------------------------


def _context_symbols(record: dict) -> frozenset:
    """Symbols the context is declared to carry into the parse.

    schema.md §4's `context` holds raw English (`prior`), not atoms, so there is no
    mechanical symbol set unless a corpus item states one explicitly under `symbols`.
    """
    context = record.get("context") or {}
    symbols = context.get("symbols")
    if isinstance(symbols, list):
        return frozenset(s for s in symbols if isinstance(s, str))
    return frozenset()


def check_c6(record: dict, statements: Sequence[str], parsed: Sequence[dict], vocab: dict,
             strict: bool) -> list[dict]:
    out: list[dict] = []
    carried = _context_symbols(record)

    # Pass 1 — every symbol a Member/Inheritance introduces, anywhere, rules included.
    declared: set[str] = set(carried)
    for tree in parsed:
        node = tree["node"]
        if node is None:
            continue
        for term in iter_terms(node):
            if _head_of(term) in DECLARING_HEADS and len(term) == 3:
                declared.add(term_key(term[1]))

    # Pass 2 — role/status atoms must attach to something declared; variables must be bound.
    for i, (text, tree) in enumerate(zip(statements, parsed)):
        node = tree["node"]
        if node is None:
            continue

        def add(detail: str) -> None:
            out.append(_finding("C6", i, detail, text, strict))

        expr = node[2] if (_head_of(node) == ASSERTION_HEAD and len(node) == 4) else node
        is_rule = _head_of(expr) == "Implication"

        for term in iter_terms(expr):
            head = _head_of(term)
            if head is None or is_variable(head):
                continue
            head_class = operator_class(vocab, head, len(term) - 1)
            if head_class not in ("role", "status") or len(term) < 2:
                continue
            carrier = term[1]
            key = term_key(carrier)
            if isinstance(carrier, str):
                if is_variable(carrier):
                    continue  # bound by the rule; binding itself is checked below
                if is_number(carrier) or is_string_literal(carrier):
                    add(f"({head} …) attaches to the literal {key} — not a symbol")
                    continue
            elif not (isinstance(_head_of(carrier), str) and SKOLEM_FN_RE.match(_head_of(carrier))):
                # A status operator scoping a whole proposition — `(Past (Member tom nervous))`,
                # `(Must (Member mary ill))`, `(Past (More tall carol dan))`. That is the
                # prompt's copular tense/modality form, not a reference to an event symbol.
                continue
            if key not in declared:
                add(f"({head} …) attaches to {key}, which has no (Member {key} <verb>) "
                    "in the record or the context-carried symbol set")

        # Free variables: legal only inside a rule, and only if the premises bind them.
        if not is_rule:
            free = sorted({t for t in iter_tokens(expr) if isinstance(t, str) and is_variable(t)})
            for var in free:
                add(f"free variable {var} outside an Implication")
        else:
            # PeTTaChainer cfe25f9: an Implication is positional — expr[1] is the antecedent
            # (which binds) and expr[2] the consequent (which uses). There is no (Premises …)
            # head to key off any more.
            bound: set[str] = set()
            used: set[str] = set()
            for idx, part in enumerate(expr[1:], start=1):
                target = bound if idx == 1 else used
                for tok in iter_tokens(part):
                    if isinstance(tok, str) and is_variable(tok):
                        target.add(tok)
            for var in sorted(used - bound):
                add(f"variable {var} appears in the consequent but is not bound by the antecedent")
    return out


# ---------------------------------------------------------------------------
# C7 — chainer smoke test (expensive; batched per file)
# ---------------------------------------------------------------------------


def _load_chainer():
    if PETTA_PYTHON_PATH and PETTA_PYTHON_PATH not in sys.path:
        sys.path.insert(0, PETTA_PYTHON_PATH)
    buf = io.StringIO()
    with redirect_stdout(buf), redirect_stderr(buf):
        from pettachainer import PeTTaChainer  # noqa: WPS433 — optional, slow import
    return PeTTaChainer


def smoke_test(statements: Sequence[str], chainer_cls=None) -> list[tuple[int, str]]:
    """C7: load every statement into a fresh KB. Any exception is a finding.

    Returns `[(statement_index, detail)]`. A fresh chainer per record keeps one record's
    symbols out of another's KB; construction is cheap once the MeTTa library is loaded.
    """
    if chainer_cls is None:
        chainer_cls = _load_chainer()
    findings: list[tuple[int, str]] = []
    buf = io.StringIO()
    with redirect_stdout(buf), redirect_stderr(buf):
        handle = chainer_cls()
        for i, statement in enumerate(statements):
            try:
                handle.add_atom(statement)
            except Exception as exc:  # noqa: BLE001 — any failure at all is the signal
                findings.append((i, f"{type(exc).__name__}: {str(exc).strip()[:200]}"))
    return findings


def check_c7(statements: Sequence[str], strict: bool, chainer_cls=None) -> list[dict]:
    return [
        _finding("C7", i, f"chainer rejected the statement — {detail}",
                 statements[i] if i < len(statements) else "", strict)
        for i, detail in smoke_test(statements, chainer_cls=chainer_cls)
    ]


# ---------------------------------------------------------------------------
# C8 — duplicates
# ---------------------------------------------------------------------------


def check_c8(statements: Sequence[str], parsed: Sequence[dict], strict: bool) -> list[dict]:
    out: list[dict] = []
    first_seen: dict[str, tuple[int, str]] = {}
    for i, (text, tree) in enumerate(zip(statements, parsed)):
        node = tree["node"]
        if node is None or _head_of(node) != ASSERTION_HEAD or len(node) != 4:
            continue
        key = term_key(node[2])
        stv = term_key(node[3])
        if key in first_seen:
            first_index, first_stv = first_seen[key]
            tail = "" if stv == first_stv else f" (truth values differ: {first_stv} vs {stv})"
            out.append(_finding(
                "C8", i,
                f"duplicate expression {key} — already asserted by statement {first_index}"
                f" under a different proof name{tail}",
                text, strict))
        else:
            first_seen[key] = (i, stv)
    return out


# ---------------------------------------------------------------------------
# public API
# ---------------------------------------------------------------------------


def validate(record: dict, vocab: dict, corpus_index: dict, *, include_c7: bool = False,
             strict: bool = False, chainer_cls=None) -> dict:
    """Run C1-C8 over one parse record (schema.md §5.1).

    C7 is off by default — it is the expensive one and `validate_file` runs it batched.
    Findings are sorted by (statement_index, code) so two runs over the same record produce
    byte-identical output.
    """
    raw_statements = record.get("statements")
    # Non-str entries are C1's business; keep their slots so every index still lines up
    # with the record's own `statements` list.
    statements = ([s if isinstance(s, str) else "" for s in raw_statements]
                  if isinstance(raw_statements, list) else [])
    parsed = [parse_sexp(s) for s in statements]

    findings: list[dict] = []
    findings += check_c1(record, corpus_index, strict)
    findings += check_c2(statements, parsed, strict)
    findings += check_c3(statements, parsed, strict)
    findings += check_c4(statements, parsed, vocab, strict)
    findings += check_c5(statements, parsed, vocab, strict)
    findings += check_c6(record, statements, parsed, vocab, strict)
    if include_c7:
        findings += check_c7(statements, strict, chainer_cls=chainer_cls)
    findings += check_c8(statements, parsed, strict)

    return finalize(findings)


def finalize(findings: Sequence[dict]) -> dict:
    """Sort findings deterministically and wrap them in a validation block."""
    ordered = sorted(
        findings,
        key=lambda f: (-1 if f["statement_index"] is None else f["statement_index"],
                       CHECKS.index(f["code"]), f["detail"]),
    )
    return {"ok": not ordered, "findings": ordered}


def validation_block(result: dict) -> dict:
    """The `validation` field written into a record (schema.md §3), written once.

    `errors` / `warnings` stay empty while severities are report-only; `findings` is the
    full report-only list.
    """
    errors = [f for f in result["findings"] if f["severity"] == "error"]
    warnings = [f for f in result["findings"] if f["severity"] == "warn"]
    return {
        "ok": result["ok"],
        "errors": errors,
        "warnings": warnings,
        "findings": result["findings"],
    }


#: Live instruction-set files the vocabulary's meta pins must match.
_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
VOCAB_PIN_FILES = (
    ("prompt_sha256", os.path.join(_ROOT, "prompt.txt")),
    ("seeded_sha256", os.path.join(_ROOT, "seeded_rules.metta")),
)


def vocab_staleness(vocab: dict) -> list[str]:
    """Compare the vocabulary's meta pins against the live files. Empty list = current.

    This is the tripwire that keeps C4 honest: a vocabulary extracted from an older
    prompt silently mis-checks parses made with the current one. Fix by running
    `harness/vocab_attest.py --date <today>` (adjudicate its report) then `--write`.
    """
    meta = vocab.get("meta") or {}
    out = []
    for pin_field, path in VOCAB_PIN_FILES:
        pin = meta.get(pin_field)
        try:
            with open(path, "rb") as fh:
                live = hashlib.sha256(fh.read()).hexdigest()
        except OSError as exc:
            out.append(f"{os.path.basename(path)}: unreadable ({exc}) — cannot verify {pin_field}")
            continue
        if pin and live != pin:
            out.append(
                f"{os.path.basename(path)} is {live[:12]}… but vocabulary.json pins "
                f"{pin[:12]}… — VOCABULARY IS STALE; run harness/vocab_attest.py "
                f"--date <today> (then --write)")
    return out


def validate_file(parses_path, vocab_path, corpora_path, strict: bool = False,
                  run_c7: bool = True) -> dict:
    """Validate a whole parses file. C7 runs BATCHED here — once, not per record.

    Returns `{'file', 'records', 'ok_records', 'by_code', 'by_record', 'findings'}`.
    Nothing is written: this is a report, and the records it reads are immutable.
    """
    vocab = load_vocab(vocab_path)
    corpus_index = build_corpus_index(corpora_path)
    records = read_jsonl(parses_path)

    chainer_cls = _load_chainer() if (run_c7 and records) else None

    by_record: list[dict] = []
    by_code: dict[str, int] = {code: 0 for code in CHECKS}
    all_findings: list[dict] = []
    ok_records = 0
    for record in records:
        result = validate(record, vocab, corpus_index, include_c7=run_c7, strict=strict,
                          chainer_cls=chainer_cls)
        for finding in result["findings"]:
            by_code[finding["code"]] += 1
            entry = dict(finding)
            entry["id"] = record.get("id")
            entry["run"] = record.get("run")
            all_findings.append(entry)
        ok_records += 1 if result["ok"] else 0
        by_record.append({
            "id": record.get("id"),
            "run": record.get("run"),
            "ok": result["ok"],
            "findings": len(result["findings"]),
            "codes": sorted({f["code"] for f in result["findings"]}),
        })
    return {
        "file": str(parses_path),
        "records": len(records),
        "ok_records": ok_records,
        "c7_run": bool(run_c7 and records),
        "strict": strict,
        "vocab_stale": vocab_staleness(vocab),
        "by_code": by_code,
        "by_record": by_record,
        "findings": all_findings,
    }


def format_summary(summary: dict) -> str:
    lines = [f"!! {msg}" for msg in summary.get("vocab_stale") or []]
    lines += [
        f"{summary['file']}: {summary['records']} record(s), "
        f"{summary['ok_records']} clean, "
        f"{summary['records'] - summary['ok_records']} with findings"
        f"{'' if summary['c7_run'] else '   [C7 skipped]'}",
        "  findings by code: " + ", ".join(
            f"{code}={summary['by_code'][code]}" for code in CHECKS
        ),
    ]
    for entry in summary["by_record"]:
        if not entry["ok"]:
            lines.append(
                f"  {entry['id']} run {entry['run']}: "
                f"{entry['findings']} finding(s) [{', '.join(entry['codes'])}]"
            )
    return "\n".join(lines)


def _main(argv: Sequence[str]) -> int:
    import argparse

    ap = argparse.ArgumentParser(description="Validate a FUSE-NF parses JSONL (C1-C8).")
    ap.add_argument("parses")
    ap.add_argument("--vocab", default=os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "specs", "vocabulary.json"))
    ap.add_argument("--corpora", default=os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "corpora"))
    ap.add_argument("--strict", action="store_true")
    ap.add_argument("--no-c7", action="store_true", help="skip the chainer smoke test")
    ap.add_argument("--json", action="store_true", help="print the summary as JSON")
    args = ap.parse_args(argv)

    summary = validate_file(args.parses, args.vocab, args.corpora,
                            strict=args.strict, run_c7=not args.no_c7)
    if args.json:
        print(json.dumps(summary, ensure_ascii=False, indent=2))
    else:
        print(format_summary(summary))
    return 0


if __name__ == "__main__":
    raise SystemExit(_main(sys.argv[1:]))
