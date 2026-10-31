"""Render the parser's instruction set from the catalog.

The catalog is the single source: the shared text comes from ``catalog/_general.yaml``, every
template section from its own file, and every shown example's rendering from running the
generic emitter on the example's own instances, so the instruction set cannot drift from the
code.  Only the ``shown`` examples are rendered; the ``held_out`` suite never is.

    python -m tmpl.render_prompt            (from templates/)  ->  generated/PROMPT_CATALOG.txt
"""
from __future__ import annotations

import hashlib
import glob
import json
import os
import sys
import textwrap

from . import catalog as CAT, emit as E

OUT = os.path.join(os.path.dirname(CAT.CATALOG_DIR), "generated", "PROMPT_CATALOG.txt")

FAMILY_ORDER = ["referent", "predication", "scope", "attachment", "rule", "link"]
FAMILY_TITLES = {
    "referent": "Referents — the things the text talks about",
    "predication": "Predications — what the text states about them",
    "scope": "Scope operators — negation, modality, sealed content",
    "attachment": "Attachments — time, place, measure, particles",
    "rule": "Rules — generic and quantified statements",
    "link": "Links — connectives between clauses",
}


def _wrap(text: str, indent: str = "", first: str | None = None) -> str:
    return textwrap.fill(" ".join(str(text).split()), width=96, initial_indent=first or indent,
                         subsequent_indent=indent, break_long_words=False, break_on_hyphens=False)


def _value_doc(spec: dict, family: str | None = None) -> str:
    t = spec["type"]
    if t == "id":
        return "your label for this instance"
    if t == "lemma":
        return "a lemma"
    if t == "string":
        return "a string"
    if t == "bool":
        return "true / false"
    if t == "int":
        return "an integer"
    if t == "number":
        return "a number"
    if t == "enum":
        return "one of: " + ", ".join(str(v) for v in spec.get("values") or [])
    if t == "filler":
        if spec.get("attaches"):
            return '"@id" of the predication instance this attaches to'
        if spec.get("class") == "Instance":
            return '"@id" of an instance, of the kinds the slot names'
        if spec.get("class") == "Event":
            return '"@id" of a predication instance (the clause\'s event)'
        return '"@id" of a referent instance, or a bare lemma for a non-specific filler'
    if t == "refs":
        if family == "scope":
            return 'a list of "@id" of the instances this one scopes over'
        return 'a list of "@id" of the instances that state the clause'
    if t == "list":
        if spec.get("class") == "Proposition":   # ids of other instances, read but not scoped over
            return 'a list of "@id" of other instances, which stay asserted on their own'
        if spec.get("ids"):                        # lemmas, or the ids of the instances a name or a year is
            return 'a list of lemmas, or "@id" of a ' + " or a ".join(spec["ids"]) + " instance"
        return "a list of lemmas"
    return t


def _catalog_hash(directory: str) -> str:
    h = hashlib.sha256()
    for path in sorted(glob.glob(os.path.join(directory, "*.yaml"))):
        with open(path, "rb") as fh:
            h.update(os.path.basename(path).encode() + b"\0" + fh.read() + b"\0")
    return h.hexdigest()


def _instances_json(instances: list) -> str:
    lines = [json.dumps(r, ensure_ascii=False) for r in instances]
    return "[\n" + ",\n".join("  " + ln for ln in lines) + "\n]"


def render_template(tid: str, t: dict, catalog: dict, add) -> None:
    add(f"### {tid} — {t.get('title', '')}")
    add("")
    trig = t.get("trigger") or {}
    add(_wrap("When: " + trig.get("construction", "")))
    add("")
    if trig.get("verbs"):
        add(_wrap("Verbs that anchor the class: " + ", ".join(trig["verbs"]) + "."))
        if trig.get("verbs_note"):
            add(_wrap(trig["verbs_note"]))
        add("")
    if trig.get("surface_forms"):
        add("Forms:")
        for f in trig["surface_forms"]:
            add(_wrap(f, indent="  ", first="- "))
        add("")
    if trig.get("boundary"):
        add("Not this template:")
        for b in trig["boundary"]:
            add(_wrap(b, indent="  ", first="- "))
        add("")
    add("Slots:")
    add("")
    add(f'- `t` (required): "{tid}"')
    for name, spec in (t.get("slots") or {}).items():
        req = "required" if spec.get("required") else "optional"
        doc = spec.get("doc", "")
        tail = f": {doc}" if doc else ""
        add(_wrap(f"`{name}` ({req}; {_value_doc(spec, t.get('family'))}){tail}.", indent="  ", first="- "))
    for group in t.get("one_of") or []:
        add(_wrap("Exactly one of " + ", ".join(f"`{g}`" for g in group) + " is filled.", indent="  ", first="- "))
    for group in t.get("any_of") or []:
        add(_wrap("At least one of " + ", ".join(f"`{g}`" for g in group) + " is filled.", indent="  ", first="- "))
    add("")
    for ex in (t.get("examples") or {}).get("shown") or []:
        cat = ex.get("category")
        if cat == "abstain":
            exp = ex.get("expected") or {}
            target = exp.get("template")
            line = f"Not this template. TEXT: {ex['text']}"
            if target and target in catalog:
                line += f" — use `{target}`."
            elif exp.get("gap"):
                span = exp.get("span", "")
                line += f' — report it as unmapped: {{"span": "{span}", "code": "{exp["gap"]}"}}.'
            else:
                line += " — report the span as unmapped."
            add(_wrap(line))
            add("")
            continue
        note = f" ({ex['note']})" if ex.get("note") else ""
        add(f"Example{note}. TEXT: {ex['text']}")
        add("")
        add("Instances:")
        add("")
        add(textwrap.indent(_instances_json(ex["instances"]), "    "))
        add("")
        out = E.emit({"id": "example", "instances": ex["instances"]}, catalog)
        add("The program renders these instances as:")
        add("")
        for d in out["detail"]:
            add(f"    {d['term']}")
        if ex.get("unmapped"):
            add("")
            add("and reports as unmapped:")
            add("")
            for u in ex["unmapped"]:
                add("    " + json.dumps(u, ensure_ascii=False))
        add("")


def generate(catalog: dict, general: dict, directory: str = CAT.CATALOG_DIR) -> str:
    out: list[str] = []
    add = out.append
    add("# " + general["title"])
    add("")
    add(f"catalog sha256 {_catalog_hash(directory)[:16]} · {len(catalog)} templates")
    add("")
    for p in general["intro"]:
        add(_wrap(p))
        add("")

    def section(title, paras, bullets=False):
        add("## " + title)
        add("")
        for p in paras:
            if p.lstrip().startswith("{"):
                add(textwrap.indent(textwrap.dedent(p.rstrip("\n")), "    "))
            elif bullets:
                add(_wrap(p, indent="  ", first="- "))
            else:
                add(_wrap(p))
            if not bullets:
                add("")
        if bullets:
            add("")

    section("Output", general["output_contract"])
    section("Identifiers and fillers", general["identifiers"], bullets=True)
    section("Spans", general.get("spans") or [], bullets=True)
    section("Lemmas and symbols", general["lemmas"], bullets=True)
    section("Relative clauses and participles", general.get("relatives") or [], bullets=True)
    section("Nouns before nouns", general.get("nouns") or [], bullets=True)
    section("Life dates and names in brackets", general.get("biography") or [], bullets=True)
    section("Choosing a template", general.get("abstain") or [])
    section("Unmapped spans", general["unmapped"])
    add("Codes:")
    add("")
    for code, doc in (general.get("gap_codes") or {}).items():
        add(_wrap(f"{code}: {doc}", indent="  ", first="- "))
    add("")
    if general.get("issues"):
        section("Reporting a problem with the instructions", general["issues"])

    add("## Templates")
    add("")
    families = sorted({t.get("family", "other") for t in catalog.values()},
                      key=lambda f: (FAMILY_ORDER.index(f) if f in FAMILY_ORDER else len(FAMILY_ORDER), f))
    for fam in families:
        add(f"## {FAMILY_TITLES.get(fam, fam)}")
        add("")
        for tid in sorted(catalog):
            if catalog[tid].get("family", "other") == fam:
                render_template(tid, catalog[tid], catalog, add)
    return "\n".join(out).rstrip("\n") + "\n"


def main(argv=None) -> int:
    catalog = CAT.load()
    general = CAT.load_general()
    text = generate(catalog, general)
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "w", encoding="utf-8") as fh:
        fh.write(text)
    print(f"wrote {os.path.relpath(OUT)} ({len(text.splitlines())} lines, {len(catalog)} templates)")
    from . import manifest as MF
    print(f"manifest {MF.write()['id']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
