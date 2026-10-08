"""Generate ``templates/ATOM-KIND-SUBSTRATES.md`` from ``fusenf/specs/vocabulary.json``.

The atom-kind substrate (FUSE-NF Next Steps §3.1) is the alphabet of atom kinds the parser
may emit, each with its class, arity and argument types.  ``vocabulary.json`` already
attests every head; this script only renders it in a reviewable form.  Nothing is decided
here: the output is a function of the input, so review comments go to the vocabulary (or
to this renderer), never to the generated file.

Run from ``templates/``::

    /home/manhin/Dev/.venv-dev/bin/python -m tmpl.gen_substrate

Rendering rules (deterministic, no dates of our own):

* one block per head, grouped by class in a fixed order, heads alphabetical within a class;
* the S-expression shows one ``<arg_type>`` placeholder per declared position; a position
  the vocabulary attests but does not type is shown as ``<?>``; a variadic head ends in
  ``...``;
* ``arity`` lists every attested arity, ``|``-separated.
"""
from __future__ import annotations

import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir))
VOCAB_PATH = os.path.join(REPO, "fusenf", "specs", "vocabulary.json")
OUT_PATH = os.path.join(REPO, "templates", "ATOM-KIND-SUBSTRATES.md")

CLASS_ORDER = [
    "core-link",
    "role",
    "status",
    "operator",
    "discourse",
    "property-constructor",
    "surface-record",
    "meta",
    "engine",
]


def sexpr(head: str, entry: dict) -> str:
    """Render the head with one placeholder per argument position."""
    arg_types = list(entry.get("arg_types") or [])
    arities = sorted(entry.get("arities") or [])
    variadic = bool(entry.get("variadic"))
    if arg_types == ["atom-list"]:
        return f"({head} <atom> <atom> ...)"
    parts = [f"<{t}>" for t in arg_types]
    widest = max(arities) if arities else len(parts)
    while len(parts) < widest:
        parts.append("<?>")
    if variadic:
        parts.append("...")
    return f"({head}{''.join(' ' + p for p in parts)})"


#: A variadic head (a connective) takes at least this many arguments; attested arities below it
#: are reported in the notes section rather than in the head's own block.
VARIADIC_MIN = 2


def arity_text(entry: dict) -> str:
    arities = sorted(entry.get("arities") or [])
    if entry.get("variadic"):
        return f"{VARIADIC_MIN}+ (variadic)"
    return " | ".join(str(a) for a in arities) if arities else "?"


def arg_types_text(entry: dict) -> str:
    arg_types = list(entry.get("arg_types") or [])
    if entry.get("variadic") and arg_types == ["atom-list"]:
        return "[atom, atom, ...]"
    return f"[{', '.join(arg_types)}]"


def render(vocab: dict) -> str:
    ops = vocab["operators"]
    meta = vocab.get("meta", {})
    classes = sorted({e.get("class", "?") for e in ops.values()}, key=lambda c: (CLASS_ORDER.index(c) if c in CLASS_ORDER else len(CLASS_ORDER), c))

    lines: list[str] = []
    lines.append("# Atom-kind substrates")
    lines.append("")
    lines.append(
        "Generated from `fusenf/specs/vocabulary.json` "
        f"(schema `{meta.get('schema', '?')}`, revised {meta.get('revised', meta.get('generated', '?'))}, "
        f"prompt `{str(meta.get('prompt_sha256', ''))[:8]}…`) by `templates/tmpl/gen_substrate.py`. "
        "Do not edit by hand; regenerate with `cd templates && python -m tmpl.gen_substrate`."
    )
    lines.append("")
    lines.append(
        f"{len(ops)} heads in {len(classes)} classes. Placeholders are the vocabulary's `arg_types`; "
        "`<?>` marks an attested position the vocabulary does not type; `...` marks a variadic head."
    )
    lines.append("")

    for cls in classes:
        heads = sorted(n for n, e in ops.items() if e.get("class", "?") == cls)
        lines.append(f"## {cls} ({len(heads)})")
        lines.append("")
        for head in heads:
            e = ops[head]
            lines.append(sexpr(head, e))
            lines.append(f"class: {cls}")
            lines.append(f"arity: {arity_text(e)}")
            lines.append(f"arg_types: {arg_types_text(e)}")
            lines.append("")
            lines.append("")

    oc = vocab.get("open_class") or {}
    lines.append("## open-class heads (not enumerable)")
    lines.append("")
    lines.append(
        "Heads the prompt licenses generically; the validator checks position and arity only. "
        "Attested positions:"
    )
    lines.append("")
    for pos in oc.get("positions") or []:
        lines.append(f"- {pos}")
    attested = oc.get("attested_heads") or {}
    n_attested = len(attested)
    n_sk = len(oc.get("skolem_function_heads") or [])
    n_prep = len(oc.get("oblique_prepositions") or [])
    lines.append("")
    lines.append(
        f"Attested so far: {n_attested} relation heads, {n_sk} skolem-function heads, "
        f"{n_prep} oblique prepositions (listed in `vocabulary.json`)."
    )
    lines.append("")

    dbu = (vocab.get("declared_but_unattested") or {}).get("heads") or []
    dep = list((vocab.get("deprecated_operators") or {}).keys())
    lines.append("## notes")
    lines.append("")
    if dbu:
        lines.append(
            "- Declared in prompt.txt but exercised by no golden, e2e case or seeded rule "
            f"(listed above all the same): {', '.join(sorted(dbu))}."
        )
    if dep:
        lines.append(f"- Deprecated heads, not listed: {', '.join(sorted(dep))}.")
    for head in sorted(ops):
        e = ops[head]
        if not e.get("variadic"):
            continue
        attested = ((e.get("attested") or {}).get("arities") or {})
        low = {int(a): n for a, n in attested.items() if int(a) < VARIADIC_MIN}
        if low:
            where = ", ".join(f"arity {a} ×{n}" for a, n in sorted(low.items()))
            lines.append(
                f"- `{head}` is declared {VARIADIC_MIN}+ but also attested below that ({where}) — to review."
            )
    lines.append("")
    return "\n".join(lines)


def main(argv: list[str] | None = None) -> int:
    with open(VOCAB_PATH, encoding="utf-8") as fh:
        vocab = json.load(fh)
    text = render(vocab)
    with open(OUT_PATH, "w", encoding="utf-8") as fh:
        fh.write(text)
    print(f"wrote {os.path.relpath(OUT_PATH, REPO)} ({len(vocab['operators'])} heads)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
