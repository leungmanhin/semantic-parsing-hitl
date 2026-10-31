"""Generate the atom-type substrate artifacts from ``templates/atom-type-substrates.json``.

Outputs:

* ``templates/ATOM-TYPE-SUBSTRATES.md`` — the reviewable rendering, one block per head;
* ``templates/generated/atom-types.metta`` — PeTTa type declarations for every head whose
  ``out`` type is set (``(: Head (-> In … Out))``), plus the type declarations.  This is the
  file a type checker loads before asking ``(get-type <atom>)``; a well-typed atom answers
  with its head's ``out`` type, anything else is a finding.

The JSON is the hand-maintained source (migrated once from ``fusenf/specs/vocabulary.json``,
which stays an attestation record until retired); this script only renders it.  Review
comments go to the JSON or to this renderer, never to the generated files.

Run from ``templates/``::

    python -m tmpl.gen_substrate

Rendering rules (deterministic, no dates of our own):

* heads are grouped by kind in a fixed order, alphabetical within a kind;
* each block is ``head`` / ``kind`` / ``arity`` / ``type-def`` / ``gloss`` (+ ``status`` when proposed);
* ``arity`` is a number, ``a | b`` for alternatives, or ``2+ (variadic)``;
* ``type-def`` is the first declaration the ``.metta`` file carries for the head, with a count
  of the others (a union argument type ``A|B`` expands to one declaration per alternative, a
  variadic head to one per arity from the minimum up to :data:`VARIADIC_MAX`).  A head whose
  ``out`` is not yet set shows a provisional ``(: Head (-> … ?))`` and is absent from the
  ``.metta`` file; a position the head takes but the JSON does not type is ``%Undefined%``.
"""
from __future__ import annotations

import itertools
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir))
SRC_PATH = os.path.join(REPO, "templates", "atom-type-substrates.json")
OUT_MD = os.path.join(REPO, "templates", "ATOM-TYPE-SUBSTRATES.md")
OUT_METTA = os.path.join(REPO, "templates", "generated", "atom-types.metta")

KIND_ORDER = [
    "core-link",
    "role",
    "scope",
    "particle",
    "temporal",
    "relation",
    "measure",
    "lexicon",
    "discourse",
    "property-constructor",
    "surface-record",
    "meta",
    "computation",
]

#: PeTTa types are fixed-arity, so a variadic head gets one declaration per arity up to this.
VARIADIC_MAX = 9

#: Type shown for a position the head takes but the JSON does not type (PeTTa's "unknown").
UNTYPED = "%Undefined%"

#: Marker for an output type not yet reviewed (never emitted to the .metta file).
PENDING_OUT = "?"


def arities_of(entry: dict) -> list[int]:
    a = entry.get("arity")
    if isinstance(a, list):
        return sorted(int(x) for x in a)
    return [int(a)] if a is not None else []


def arity_text(entry: dict) -> str:
    arities = arities_of(entry)
    if entry.get("variadic"):
        return f"{arities[0] if arities else 2}+ (variadic)"
    return " | ".join(str(a) for a in arities) if arities else "?"


def type_defs(head: str, entry: dict, out: str) -> list[str]:
    """Every ``(: head (-> … out))`` form the entry describes, in a fixed order."""
    arg_types = list(entry.get("arg_types") or [])
    arities = arities_of(entry)
    forms: list[str] = []
    if entry.get("variadic"):
        one = arg_types[0] if arg_types else "Atom"
        lo = arities[0] if arities else 2
        for n in range(lo, VARIADIC_MAX + 1):
            forms.append(f"(: {head} (-> {' '.join([one] * n)} {out}))")
        return forms
    widest = max(arities) if arities else len(arg_types)
    for n in arities or [len(arg_types)]:
        slots = (arg_types + [UNTYPED] * widest)[:n]
        alternatives = [s.split("|") for s in slots]
        for combo in itertools.product(*alternatives):
            forms.append(f"(: {head} (-> {' '.join(combo)} {out}))")
    return forms


def declarations(head: str, entry: dict) -> list[str]:
    """The declarations emitted to the .metta file: heads with an ``out`` type, plus any
    ``legacy_type_defs`` kept so that parses made before a rename still type-check."""
    out = entry.get("out")
    forms = type_defs(head, entry, out) if out else []
    return forms + list(entry.get("legacy_type_defs") or [])


def type_def_line(head: str, entry: dict) -> str:
    out = entry.get("out")
    forms = type_defs(head, entry, out or PENDING_OUT)
    shown = forms[0]
    if len(forms) > 1:
        shown += f"  ; and {len(forms) - 1} more (per arity / per union alternative)"
    if not out:
        shown += "  ; out type pending review"
    return shown


def render_md(src: dict) -> str:
    heads = src["heads"]
    meta = src.get("meta", {})
    kinds = sorted(
        {e.get("kind", "?") for e in heads.values()},
        key=lambda k: (KIND_ORDER.index(k) if k in KIND_ORDER else len(KIND_ORDER), k),
    )
    proposed = sorted(n for n, e in heads.items() if e.get("status") == "proposed")
    typed = sum(1 for e in heads.values() if e.get("out"))

    lines: list[str] = []
    lines.append("# Atom-type substrates")
    lines.append("")
    lines.append(
        f"Generated from `templates/atom-type-substrates.json` (schema `{meta.get('schema', '?')}`) "
        "by `templates/tmpl/gen_substrate.py`, together with `templates/generated/atom-types.metta`. "
        "Do not edit by hand; regenerate with `cd templates && python -m tmpl.gen_substrate`."
    )
    lines.append("")
    lines.append(
        f"{len(heads)} heads in {len(kinds)} kinds ({len(proposed)} proposed; {typed} with a reviewed "
        "type declaration so far). `type-def` is the PeTTa declaration emitted for the head; "
        f"`{PENDING_OUT}` as the output type means the head is not yet reviewed and is absent from the "
        f"`.metta` file; `{UNTYPED}` marks a position the head takes but the JSON does not type."
    )
    lines.append("")
    if meta.get("statement_form"):
        lines.append(meta["statement_form"])
        lines.append("")
    sorts = meta.get("types")
    if sorts:
        lines.append(f"Types: {', '.join(sorts)}.")
        if meta.get("types_note"):
            lines.append("")
            lines.append(meta["types_note"])
        lines.append("")

    for kind in kinds:
        names = sorted(n for n, e in heads.items() if e.get("kind", "?") == kind)
        lines.append(f"## {kind} ({len(names)})")
        lines.append("")
        for name in names:
            e = heads[name]
            lines.append(f"head: {name}")
            lines.append(f"kind: {kind}")
            lines.append(f"arity: {arity_text(e)}")
            lines.append(f"type-def: {type_def_line(name, e)}")
            if e.get("lowering"):
                lines.append(f"lowering: {e['lowering']}  ; engine form produced by the lowering, not by a template")
            if e.get("legacy_type_defs"):
                lines.append(f"legacy: {' · '.join(e['legacy_type_defs'])}  ; kept until the re-parse")
            if e.get("gloss"):
                lines.append(f"gloss: {e['gloss']}")
            if e.get("status"):
                lines.append(f"status: {e['status']}")
            lines.append("")
            lines.append("")

    oc = src.get("open_class") or {}
    if oc:
        lines.append("## open-class heads (not enumerable)")
        lines.append("")
        lines.append(
            "Heads the prompt licenses generically; the validator checks position and arity only. "
            "Licensed positions:"
        )
        lines.append("")
        for pos in oc.get("positions") or []:
            lines.append(f"- {pos}")
        sig = oc.get("oblique_signature")
        preps = oc.get("oblique_prepositions") or []
        if sig and preps:
            lines.append("")
            lines.append(
                f"Oblique prepositions ({len(preps)}), all declared "
                f"`(-> {' '.join(sig['arg_types'])} {sig['out']})`: {', '.join(preps)}."
            )
        lines.append("")

    retired = sorted(n for n, e in heads.items() if e.get("status") == "retire")
    if proposed or retired:
        lines.append("## notes")
        lines.append("")
        if proposed:
            lines.append(f"- Proposed, not yet emitted by any template: {', '.join(proposed)}.")
        if retired:
            lines.append(
                f"- To retire at the re-parse (declaration kept until then so today's parses still "
                f"type-check): {', '.join(retired)}."
            )
        lines.append("")
    return "\n".join(lines)


def render_metta(src: dict) -> str:
    heads = src["heads"]
    meta = src.get("meta", {})
    lines: list[str] = []
    lines.append(";; Atom-type substrate — PeTTa type declarations.")
    lines.append(";; Generated from templates/atom-type-substrates.json by templates/tmpl/gen_substrate.py;")
    lines.append(";; do not edit by hand. Load before (get-type <atom>); a well-typed atom answers with")
    lines.append(";; its head's out type. Per-record symbol declarations ((: e1 Event) (: e1 Instance) ...)")
    lines.append(";; come from the emitter, not from this file.")
    lines.append("")
    for sort in meta.get("types") or []:
        if sort in ("Atom", "Number", "String"):
            continue  # PeTTa built-ins
        lines.append(f"(: {sort} Type)")
    lines.append("")
    for name in sorted(heads):
        lines.extend(declarations(name, heads[name]))
    oc = src.get("open_class") or {}
    sig = oc.get("oblique_signature")
    preps = oc.get("oblique_prepositions") or []
    if sig and preps:
        lines.append("")
        lines.append(";; open-class oblique prepositions (licensed heads), one signature for all")
        seen = set(lines)
        for prep in preps:                   # a form a head's own entry already declares (Between) is not repeated
            for form in type_defs(prep, {"arity": len(sig["arg_types"]), "arg_types": sig["arg_types"]}, sig["out"]):
                if form not in seen:
                    lines.append(form)
                    seen.add(form)
    lines.append("")
    return "\n".join(lines)


def main(argv: list[str] | None = None) -> int:
    with open(SRC_PATH, encoding="utf-8") as fh:
        src = json.load(fh)
    os.makedirs(os.path.dirname(OUT_METTA), exist_ok=True)
    with open(OUT_MD, "w", encoding="utf-8") as fh:
        fh.write(render_md(src))
    with open(OUT_METTA, "w", encoding="utf-8") as fh:
        fh.write(render_metta(src))
    n_decl = sum(len(declarations(n, e)) for n, e in src["heads"].items())
    print(
        f"wrote {os.path.relpath(OUT_MD, REPO)} ({len(src['heads'])} heads) and "
        f"{os.path.relpath(OUT_METTA, REPO)} ({n_decl} declarations)"
    )
    from . import manifest as MF
    print(f"manifest {MF.write()['id']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
