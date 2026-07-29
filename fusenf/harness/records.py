"""FUSE-NF — deterministic record assembly (`fusenf-parse/1`).

Raw parser-agent output -> statement list -> parse record (schema.md §2, §3).

Two invariants govern everything here:

* **Never repair content.** `extract_atoms` removes non-semantic wrappers only (markdown
  fences, list numbering, commentary lines, hard line wraps). It never inserts a paren,
  invents an STV or a proof name, or touches a head. A malformed statement is returned
  verbatim so the validator can flag it (schema.md §5.3).
* **Parses are append-only.** `write_jsonl` appends and refuses to write a `(id, run)`
  key the file already holds; nothing rewrites an existing record.

No `hash()`, no clock reads, no set-iteration-order dependence: the same inputs always
produce byte-identical output.
"""

from __future__ import annotations

import hashlib
import json
import os
import re
from typing import Any, Iterable, Sequence

PARSE_SCHEMA = "fusenf-parse/1"
HARNESS_VERSION = "fusenf-harness/1"

#: provenance keys `build_record` requires; `batch` is optional.
REQUIRED_PROVENANCE = ("model", "prompt_sha256", "seeded_sha256", "harness", "date")

# ---------------------------------------------------------------------------
# s-expression reader (shared with validator.py)
# ---------------------------------------------------------------------------

Node = Any  # str (token) | list[Node]

_DELIMS = '()'


def tokenize(text: str) -> tuple[list[str], list[str]]:
    """Split `text` into `(`, `)`, string-literal and symbol tokens.

    String literals keep their quotes, so `is_string_literal` can tell `"1"` from `1`.
    Errors are returned, never raised: a bad statement still has to survive to the
    validator intact.
    """
    tokens: list[str] = []
    errors: list[str] = []
    i, n = 0, len(text)
    while i < n:
        ch = text[i]
        if ch.isspace():
            i += 1
            continue
        if ch in _DELIMS:
            tokens.append(ch)
            i += 1
            continue
        if ch == '"':
            j = i + 1
            closed = False
            while j < n:
                if text[j] == "\\" and j + 1 < n:
                    j += 2
                    continue
                if text[j] == '"':
                    j += 1
                    closed = True
                    break
                j += 1
            tokens.append(text[i:j])
            if not closed:
                errors.append("unterminated string literal")
                return tokens, errors
            i = j
            continue
        j = i
        while j < n and not text[j].isspace() and text[j] not in _DELIMS and text[j] != '"':
            j += 1
        tokens.append(text[i:j])
        i = j
    return tokens, errors


def parse_sexp(text: str) -> dict:
    """Parse one statement.

    Returns ``{'ok', 'node', 'errors'}``. `node` is the first complete top-level list
    (or None); `errors` carries every structural complaint C2 reports.
    """
    tokens, errors = tokenize(text)
    errors = list(errors)
    stack: list[list] = []
    top: list[Node] = []
    unexpected_close = 0
    for tok in tokens:
        if tok == "(":
            new: list[Node] = []
            if stack:
                stack[-1].append(new)
            stack.append(new)
        elif tok == ")":
            if not stack:
                unexpected_close += 1
                continue
            done = stack.pop()
            if not stack:
                top.append(done)
        else:
            if stack:
                stack[-1].append(tok)
            else:
                top.append(tok)
    if unexpected_close:
        errors.append(f'unbalanced: {unexpected_close} unexpected ")"')
    if stack:
        errors.append(f'unbalanced: {len(stack)} unclosed "("')
    bare = [t for t in top if not isinstance(t, list)]
    if bare:
        errors.append("stray text outside the outermost parens: " + " ".join(bare[:4]))
    lists = [t for t in top if isinstance(t, list)]
    if len(lists) > 1:
        errors.append(f"{len(lists)} top-level expressions in one statement")
    node = lists[0] if lists else None
    if node is None and not errors:
        errors.append("statement is not an s-expression")
    return {"ok": not errors and node is not None, "node": node, "errors": errors}


def term_key(node: Node) -> str:
    """Whitespace-normalized text of a term — the identity used by C6 and C8."""
    if isinstance(node, list):
        return "(" + " ".join(term_key(x) for x in node) + ")"
    return node


def iter_terms(node: Node):
    """Yield every list node in `node`, outermost first (depth-first, left to right)."""
    if isinstance(node, list):
        yield node
        for child in node:
            yield from iter_terms(child)


def iter_tokens(node: Node):
    """Yield every leaf token in `node`, in order."""
    if isinstance(node, list):
        for child in node:
            yield from iter_tokens(child)
    else:
        yield node


def is_string_literal(tok: str) -> bool:
    return isinstance(tok, str) and tok.startswith('"')


def is_variable(tok: str) -> bool:
    return isinstance(tok, str) and tok.startswith("$")


_NUMBER_RE = re.compile(r"^[+-]?(\d+\.?\d*|\.\d+)([eE][+-]?\d+)?$")


def is_number(tok: str) -> bool:
    return isinstance(tok, str) and bool(_NUMBER_RE.match(tok))


# ---------------------------------------------------------------------------
# raw agent output -> statements
# ---------------------------------------------------------------------------

_FENCE_RE = re.compile(r"^\s*(```+|~~~+)\s*[A-Za-z0-9_+-]*\s*$")
_ITEM_NUM_RE = re.compile(r"^\s*(\d+\s*[.)]\s+)")
_BULLET_RE = re.compile(r"^\s*([-*+•]\s+)")
_ASSERTION_START_RE = re.compile(r"^\(:\s")


def _paren_depth(text: str) -> int:
    """Net paren depth of `text`, string literals excluded. Negative = over-closed."""
    tokens, _ = tokenize(text)
    return tokens.count("(") - tokens.count(")")


def _strip_prefixes(line: str) -> tuple[str, list[str]]:
    """Remove a leading list number and/or bullet marker. Returns (line, removals)."""
    removals: list[str] = []
    out = line
    for regex, label in ((_ITEM_NUM_RE, "item-number"), (_BULLET_RE, "bullet")):
        m = regex.match(out)
        if m and out[m.end():].lstrip().startswith("("):
            removals.append(f"{label} {m.group(1)!r}")
            out = out[m.end():]
    return out, removals


def extract_atoms(raw_text: str) -> tuple[list[str], list[str]]:
    """Raw parser-agent output -> (statements, strip_log).

    Strips ONLY non-semantic wrappers: markdown fences, a leading item number or bullet,
    blank lines, and commentary lines that are not s-expressions. A statement whose parens
    are still open at end of line is joined with the following line(s) — a hard line wrap
    is presentation, not content — but joining stops at the next `(: ` so a truncated
    statement is never silently welded to the next one.

    CONTENT IS NEVER REPAIRED. Missing STVs, unbalanced parens, bad heads and duplicate
    proof names all survive into `statements` exactly as emitted, for the validator (C2-C8)
    to report. `strip_log` records every removal and join, with 1-based line numbers.
    """
    lines = raw_text.split("\n")
    statements: list[str] = []
    strip_log: list[str] = []
    blanks = 0
    in_fence = False
    i = 0
    while i < len(lines):
        raw_line = lines[i].rstrip()
        lineno = i + 1
        if _FENCE_RE.match(raw_line):
            in_fence = not in_fence
            strip_log.append(f"L{lineno} fence: {raw_line.strip()}")
            i += 1
            continue
        if not raw_line.strip():
            blanks += 1
            i += 1
            continue
        body, removals = _strip_prefixes(raw_line)
        stripped = body.strip()
        if not stripped.startswith("("):
            strip_log.append(f"L{lineno} commentary: {raw_line.strip()}")
            i += 1
            continue
        for removal in removals:
            strip_log.append(f"L{lineno} {removal}")
        text = stripped
        # Join hard-wrapped continuations while the expression is still open.
        j = i + 1
        while _paren_depth(text) > 0 and j < len(lines):
            nxt = lines[j].rstrip()
            nxt_stripped = nxt.strip()
            if not nxt_stripped:
                break
            if _FENCE_RE.match(nxt):
                break
            if _ASSERTION_START_RE.match(nxt_stripped):
                break
            if "(" not in nxt_stripped and ")" not in nxt_stripped:
                break  # prose, not a wrapped s-expression
            text = text + " " + nxt_stripped
            strip_log.append(f"L{j + 1} joined-continuation: {nxt_stripped}")
            j += 1
        statements.append(text)
        i = j
    if blanks and (statements or strip_log):
        strip_log.append(f"{blanks} blank line(s) removed")
    return statements, strip_log


# ---------------------------------------------------------------------------
# records
# ---------------------------------------------------------------------------


def canonical_json(obj: Any) -> str:
    """The one canonical JSON encoding used for every hash in the pipeline."""
    return json.dumps(obj, sort_keys=True, separators=(",", ":"), ensure_ascii=False)


def input_sha256(item: dict) -> str:
    """sha256 over the canonical JSON of `{sentences, context}` (schema.md §2)."""
    payload = {"sentences": item.get("sentences"), "context": item.get("context")}
    return hashlib.sha256(canonical_json(payload).encode("utf-8")).hexdigest()


def build_record(item: dict, statements: Sequence[str], run: int, provenance: dict) -> dict:
    """Assemble one `fusenf-parse/1` record.

    `sentences` / `context` are denormalized copies of the corpus item; `input_sha256` is
    recomputed from them so C1 compares two independently derived values. `validation` is
    deliberately absent — the validator writes it once, via `attach_validation`.
    """
    missing = [k for k in REQUIRED_PROVENANCE if not provenance.get(k)]
    if missing:
        raise ValueError(f"provenance missing required key(s): {', '.join(missing)}")
    if not isinstance(run, int) or isinstance(run, bool) or run < 1:
        raise ValueError(f"run must be an int >= 1, got {run!r}")

    sentences = list(item.get("sentences") or [])
    context = json.loads(json.dumps(item.get("context") if item.get("context") is not None else {}))
    parser = {
        "model": provenance["model"],
        "prompt_sha256": provenance["prompt_sha256"],
        "seeded_sha256": provenance["seeded_sha256"],
        "harness": provenance["harness"],
        "batch": provenance.get("batch"),
        "date": provenance["date"],
    }
    record = {
        "schema": PARSE_SCHEMA,
        "id": item.get("id"),
        "run": run,
        "source": item.get("source"),
        "equiv_class": item.get("equiv_class"),
        "sentences": sentences,
        "context": context,
        "statements": list(statements),
        "parser": parser,
        "input_sha256": input_sha256({"sentences": sentences, "context": context}),
    }
    return record


def attach_validation(record: dict, validation: dict) -> dict:
    """Write the `validation` block — once. Mutating a written block is a hard error."""
    if record.get("validation") is not None:
        raise ValueError(
            f"validation already written for ({record.get('id')}, run {record.get('run')});"
            " a re-parse is a new run, not an edit"
        )
    record["validation"] = validation
    return record


def read_jsonl(path) -> list[dict]:
    """Read a JSONL file. A missing file reads as empty; a bad line names its own number."""
    path = str(path)
    if not os.path.exists(path):
        return []
    out: list[dict] = []
    with open(path, "r", encoding="utf-8") as fh:
        for lineno, line in enumerate(fh, start=1):
            line = line.strip()
            if not line:
                continue
            try:
                out.append(json.loads(line))
            except json.JSONDecodeError as exc:
                raise ValueError(f"{path}:{lineno}: invalid JSON ({exc})") from None
    return out


def record_key(record: dict) -> tuple:
    return (record.get("id"), record.get("run"))


def write_jsonl(path, records: Iterable[dict], *, allow_duplicate_keys: bool = False) -> None:
    """Append `records` to `path`, creating it if needed.

    Append-only by construction: existing lines are never read back and rewritten. A
    `(id, run)` already present is refused unless `allow_duplicate_keys` — that pair is the
    primary key of an immutable record (schema.md §0, §1).
    """
    records = list(records)
    if not records:
        return
    path = str(path)
    parent = os.path.dirname(path)
    if parent:
        os.makedirs(parent, exist_ok=True)
    if not allow_duplicate_keys:
        seen = {record_key(r) for r in read_jsonl(path)}
        for rec in records:
            key = record_key(rec)
            if key[0] is None:
                continue
            if key in seen:
                raise ValueError(
                    f"{path}: record {key} already present; parses are append-only "
                    "(a re-parse is a new run)"
                )
            seen.add(key)
    with open(path, "a", encoding="utf-8") as fh:
        for rec in records:
            fh.write(json.dumps(rec, ensure_ascii=False) + "\n")


def raw_path(raw_dir, item_id: str, run: int) -> str:
    """`fusenf/raw/<id>__run<N>.txt` — the agreed hand-off path from the parser agents."""
    return os.path.join(str(raw_dir), f"{item_id}__run{run}.txt")
