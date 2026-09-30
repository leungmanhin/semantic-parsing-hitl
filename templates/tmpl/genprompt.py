"""Generate the parser's instruction set from the registry.

The registry is the single source. Every example's rendering is produced by running the
emitter on the example's own records, so the instruction set cannot drift from the code.

    /home/manhin/Dev/.venv-dev/bin/python -m tmpl.genprompt            (from templates/)
"""
from __future__ import annotations

import hashlib
import json
import os
import sys
import textwrap

from . import emitter as E, records as R, registry as REG

OUT = os.path.join(REG.ROOT, "generated", "PROMPT_T26.txt")


def _wrap(text: str, indent: str = "", first: str | None = None) -> str:
    return textwrap.fill(" ".join(text.split()), width=96, initial_indent=first or indent,
                         subsequent_indent=indent, break_long_words=False,
                         break_on_hyphens=False)


def _value_doc(reg: dict, spec: dict) -> str:
    t = spec["type"]
    if t == "id":
        return "a label"
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
        return "one of: " + ", ".join(str(v) for v in REG.enum_values(reg, spec))
    if t == "ref":
        return '"@id" of a ' + " / ".join(spec["targets"]) + " instance"
    if t == "filler":
        extra = "".join(f', or the constant "{c}"' for c in spec.get("constants", []))
        return ('"@id" of a ' + " / ".join(spec["targets"]) + " instance, or a bare lemma" + extra)
    if t == "list":
        return "a list; each entry " + _value_doc(reg, spec["of"])
    if t == "roles":
        return ('an object {"<Role>": filler}; a filler is "@id" or a bare lemma, or a list of '
                "them when the role has several fillers")
    if t == "obliques":
        return 'a list of {"prep": "<preposition>", "obj": filler}'
    if t == "terms":
        return "an object with keys from " + ", ".join(reg["params"]["time_term_keys"])
    if t == "gap":
        return '{"n": <number>, "unit": "<unit lemma>"}'
    raise ValueError(t)


def generate(reg: dict) -> str:
    G = reg["general"]
    out: list[str] = []
    add = out.append
    add("# " + G["title"])
    add("")
    add(f"registry {reg['meta']['registry']} v{reg['meta']['version']} · "
        f"registry sha256 {reg['_sha256'][:16]}")
    add("")
    for p in G["intro"]:
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

    section("Output", G["output_contract"])
    section("Identifiers and fillers", G["identifiers"], bullets=True)
    section("Lemmas and symbols", G["lemmas"], bullets=True)
    section("Unmapped spans", G["unmapped"])
    add("Codes:")
    add("")
    for code, doc in reg["params"]["gap_codes"].items():
        add(_wrap(f"{code}: {doc}", indent="  ", first="- "))
    add("")

    add("## Roles")
    add("")
    add(_wrap("Roles are the keys of the `roles` slot of V01, R01 and R03. Decide each "
              "participant's role by these tests."))
    add("")
    for r in reg["roles_doc"]:
        add(_wrap(f"`{r['role']}`: {r['test']}", indent="  ", first="- "))
    add("")
    for p in reg["roles_notes"]:
        add(_wrap(p))
        add("")

    add("## Templates")
    add("")
    for tid, t in reg["templates"].items():
        add(f"### {tid} — {t['title']}")
        add("")
        add(_wrap("When: " + t["trigger"]))
        add("")
        for rule in t.get("rules", []):
            add(_wrap(rule, indent="  ", first="- "))
        if t.get("rules"):
            add("")
        if t.get("no_record"):
            add("No record of its own.")
            add("")
        else:
            add("Slots:")
            add("")
            add(f'- `t` (required): "{tid}"')
            for name, spec in t["slots"].items():
                req = "required" if spec.get("required") else "optional"
                add(_wrap(f"`{name}` ({req}; {_value_doc(reg, spec)}): {spec['doc']}.",
                          indent="  ", first="- "))
            add("")
        for ex in t.get("examples", []):
            item = json.loads(ex["records_json"])
            res = R.validate(item, reg)
            if not res["ok"]:
                raise SystemExit(f"registry example for {tid} fails the R-checks: {res['findings']}")
            rendered = E.emit(item, reg)
            add("Example. TEXT: " + ex["text"])
            add("")
            add("Records:")
            add("")
            add(textwrap.indent(ex["records_json"].rstrip("\n"), "    "))
            add("")
            add("The program renders these records as:")
            add("")
            for d in rendered["detail"]:
                add(f"    {d['term']}   (STV {E.fmt_num(d['stv'][0])} {E.fmt_num(d['stv'][1])})")
            add("")
    text = "\n".join(out).rstrip("\n") + "\n"
    return text


def main(argv=None) -> int:
    reg = REG.load()
    text = generate(reg)
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "w", encoding="utf-8") as fh:
        fh.write(text)
    sha = hashlib.sha256(text.encode("utf-8")).hexdigest()
    print(f"{OUT}\n  lines {text.count(chr(10))}  chars {len(text)}  sha256 {sha}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
