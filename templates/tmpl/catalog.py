"""Catalog loader: one template per file under ``templates/catalog/``.

A template file is the whole specification of one template (see ``catalog/transfer.yaml``
for the layout).  This module loads every ``*.yaml`` in the directory, checks the structural
invariants the emitter and the suite runner rely on, and returns ``{id: template}``.

Structural invariants checked here (content is reviewed by people, not checked here):

* ``id`` matches the file name; ``family`` and ``shape`` present;
* every slot has a ``type`` from the known set, and every ``filler`` / ``lemma`` / ``refs``
  slot has a substrate ``class``;
* every ``emits`` entry has an ``atom`` whose placeholders name a slot of the template (or
  ``@id`` when the template mints a symbol); ``if_filled`` / ``each`` name a slot; ``when``
  mentions only slots, their values and ``true`` / ``false``, or tests a slot against a list of
  the template's ``lexicon`` (``relation in symmetric``); ``project`` is a boolean;
  ``within`` names a refs slot (the shape is rendered inside that slot's bundle); a refs
  placeholder may carry ``|own`` or ``|attachments`` (the referenced predication's own atoms,
  or its attachments' — the two halves of a rule restricted to the clause's events);
* ``one_of`` (exactly one filled) and ``any_of`` (at least one filled) groups list two or more
  slots each; ``truth`` gives ``strength`` / ``confidence``
  clause lists (numbers, or ``{slot, values}`` / ``{from, slot, values}``); a shape's ``stv`` is a
  pair of numbers; ``presupposed`` lists slots of the template;
* examples carry a ``category`` and either ``instances`` or an ``expected`` abstain target; every
  shown instance carries a ``span`` that is verbatim in the example's text (the prompt demonstrates
  the field through them); a held-out instance may carry one, checked the same way.
"""
from __future__ import annotations

import glob
import os
import re

import yaml

HERE = os.path.dirname(os.path.abspath(__file__))
CATALOG_DIR = os.path.abspath(os.path.join(HERE, os.pardir, "catalog"))

SLOT_TYPES = {"id", "lemma", "filler", "refs", "enum", "bool", "string", "number", "int", "list"}
CLASSED = {"lemma", "filler", "refs"}
CATEGORIES = {"positive", "contrast", "scoped", "optional", "abstain"}
SLOT_KEYS = {"type", "class", "role", "required", "default", "values", "doc", "consumes", "bind", "skolemize", "attaches", "bare_content", "participant", "as_variable"}

_PLACEHOLDER = re.compile(r"\{([a-z_]+)(?:\|(own|attachments))?\}")   # {slot}, or {slot|own} / {slot|attachments} for a refs slot


class CatalogError(Exception):
    pass


def placeholders(atom: str) -> set[str]:
    return {m.group(1) for m in _PLACEHOLDER.finditer(atom)}


def norm_span(s: str) -> str:
    """Whitespace collapsed, curly apostrophes and quotes straightened: the tolerance of 'verbatim'."""
    return " ".join(str(s).replace("\u2019", "'").replace("\u2018", "'").replace("\u201c", '"').replace("\u201d", '"').split())


def span_in_text(span: str, text: str) -> bool:
    """A span is verbatim when, normalized, it is a substring of the normalized text."""
    s = norm_span(span)
    return bool(s) and s in norm_span(text)


def check_when(cond: str, slots: dict, lists: dict | None = None) -> list[str]:
    """A ``when`` condition is clauses joined by ``and`` / ``or``, each ``[not] slot``,
    ``slot == value``, ``slot != value``, or ``slot in name`` / ``slot not in name`` where the
    name is a list of the template's ``lexicon``: the value is one of an enum slot's values,
    ``true`` / ``false`` for a bool slot, and any lowercase word for a lemma or string slot."""
    problems = []
    for part in cond.split(" or "):
        for clause in part.split(" and "):
            clause = clause.strip()
            if clause.startswith("not "):
                clause = clause[4:].strip()
            op = "!=" if "!=" in clause else "==" if "==" in clause else None
            if op is None and (" not in " in clause or " in " in clause):
                name, listname = [x.strip() for x in re.split(r" not in | in ", clause, 1)]
                if name not in slots:
                    problems.append(f"when mentions {name!r}, not a slot")
                elif slots[name].get("type") not in ("lemma", "string", "enum"):
                    problems.append(f"when tests {name} against a list, but it is not a lemma, string or enum slot")
                if listname not in (lists or {}):
                    problems.append(f"when tests against {listname!r}, not a list of the template's lexicon")
                continue
            if op is None:
                if clause not in slots:
                    problems.append(f"when mentions {clause!r}, not a slot")
                continue
            name, value = [x.strip() for x in clause.split(op, 1)]
            spec = slots.get(name)
            if spec is None:
                problems.append(f"when mentions {name!r}, not a slot")
            elif spec["type"] == "enum":
                if value not in [str(v) for v in spec.get("values") or []]:
                    problems.append(f"when compares {name} with {value!r}, not one of its values")
            elif spec["type"] == "bool":
                if value not in ("true", "false"):
                    problems.append(f"when compares {name} with {value!r}, not true / false")
            elif not re.fullmatch(r"[a-z_][a-z0-9_]*", value):
                problems.append(f"when compares {name} with {value!r}, not a word")
    return problems


def check_template(t: dict, path: str) -> list[str]:
    problems = []
    name = os.path.splitext(os.path.basename(path))[0]
    if t.get("id") != name:
        problems.append(f"id {t.get('id')!r} does not match file name {name!r}")
    for key in ("family", "shape", "trigger", "slots", "emits", "examples"):
        if key not in t:
            problems.append(f"missing section {key}")
    slots = t.get("slots") or {}
    for sname, spec in slots.items():
        if not isinstance(spec, dict) or spec.get("type") not in SLOT_TYPES:
            problems.append(f"slot {sname}: unknown type {spec.get('type') if isinstance(spec, dict) else spec!r}")
            continue
        for key in spec:
            if key not in SLOT_KEYS:
                problems.append(f"slot {sname}: unknown key {key!r} (a comma inside an unquoted doc?)")
        if spec["type"] in CLASSED and not spec.get("class"):
            problems.append(f"slot {sname}: a {spec['type']} slot needs a substrate class")
        if spec["type"] == "enum" and not spec.get("values"):
            problems.append(f"slot {sname}: an enum slot needs values")
        for key in ("consumes", "bind", "skolemize", "bare_content", "as_variable"):
            if key in spec and spec["type"] != "refs":
                problems.append(f"slot {sname}: {key} applies to refs slots only")
        if spec.get("bind") and (slots.get(spec["bind"]) or {}).get("type") != "filler":
            problems.append(f"slot {sname}: bind must name a filler slot of the template")
        if spec.get("attaches") and spec["type"] != "filler":
            problems.append(f"slot {sname}: attaches applies to filler slots only")
        if "participant" in spec and (spec["type"] != "filler" or spec["participant"] is not False):
            problems.append(f"slot {sname}: participant: false applies to filler slots only")
    for key in ("one_of", "any_of"):
        for i, group in enumerate(t.get(key) or []):
            if not isinstance(group, list) or len(group) < 2 or any(g not in slots for g in group):
                problems.append(f"{key}[{i}]: must list two or more slots of the template")
    for s in t.get("presupposed") or []:
        if s not in slots:
            problems.append(f"presupposed: {s!r} is not a slot")
    truth = t.get("truth")
    if truth is not None:
        if isinstance(truth, dict) and "inherit" in truth:
            if set(truth) != {"inherit"} or (slots.get(truth["inherit"]) or {}).get("type") != "refs":
                problems.append("truth: inherit must name a refs slot of the template and stand alone")
        elif not isinstance(truth, dict) or not ({"strength", "confidence"} & set(truth)):
            problems.append("truth: needs strength and/or confidence clause lists")
        else:
            for key in ("strength", "confidence"):
                clauses = truth.get(key, [])
                for c in clauses if isinstance(clauses, list) else [clauses]:
                    if isinstance(c, (int, float)):
                        continue
                    if not isinstance(c, dict) or "slot" not in c or not isinstance(c.get("values"), dict):
                        problems.append(f"truth.{key}: a clause is a number or {{slot, values}} (optionally from)")
                    elif c.get("from"):
                        if (slots.get(c["from"]) or {}).get("type") != "refs":
                            problems.append(f"truth.{key}: from must name a refs slot")
                    elif c["slot"] not in slots:
                        problems.append(f"truth.{key}: {c['slot']!r} is not a slot")
    lexicon = t.get("lexicon") or {}
    if not isinstance(lexicon, dict) or not all(
            re.fullmatch(r"[a-z_]+", str(k)) and isinstance(v, list) and v and all(isinstance(x, str) and re.fullmatch(r"[a-z_]+", x) for x in v)
            for k, v in lexicon.items()):
        problems.append("lexicon: must map names to non-empty lists of lowercase words")
        lexicon = {}
    mints = t.get("mints") or {}
    for i, e in enumerate(t.get("emits") or []):
        atom = e.get("atom") if isinstance(e, dict) else None
        if not atom:
            problems.append(f"emits[{i}]: no atom")
            continue
        if "@id" in atom and not mints:
            problems.append(f"emits[{i}]: uses @id but the template mints nothing")
        for ph in placeholders(atom):
            if ph not in slots:
                problems.append(f"emits[{i}]: placeholder {{{ph}}} is not a slot")
        for key in ("if_filled", "each"):
            if key in e and e[key] not in slots:
                problems.append(f"emits[{i}]: {key} names unknown slot {e[key]}")
        if "when" in e:
            problems += [f"emits[{i}]: {m}" for m in check_when(e["when"], slots, lexicon)]
        if "project" in e and not isinstance(e["project"], bool):
            problems.append(f"emits[{i}]: project must be true or false")
        if "if_minted" in e and (not isinstance(e["if_minted"], bool) or not mints):
            problems.append(f"emits[{i}]: if_minted must be true or false, on a template that mints")
        if "within" in e and (slots.get(e["within"]) or {}).get("type") != "refs":
            problems.append(f"emits[{i}]: within must name a refs slot of the template")
        if "stv" in e and not (isinstance(e["stv"], list) and len(e["stv"]) == 2 and all(isinstance(x, (int, float)) for x in e["stv"])):
            problems.append(f"emits[{i}]: stv must be [strength, confidence]")
        if "declare" in e and not (isinstance(e["declare"], dict) and all(isinstance(k, str) and isinstance(v, str) for k, v in e["declare"].items())):
            problems.append(f"emits[{i}]: declare must map symbols to classes")
    for section in ("shown", "held_out"):
        for j, ex in enumerate((t.get("examples") or {}).get(section) or []):
            if ex.get("category") not in CATEGORIES:
                problems.append(f"examples.{section}[{j}]: unknown category {ex.get('category')!r}")
            if ex.get("category") == "abstain":
                if not isinstance(ex.get("expected"), dict) or not ex["expected"].get("abstain"):
                    problems.append(f"examples.{section}[{j}]: an abstain example needs expected: {{abstain: true, …}}")
            elif not ex.get("instances"):
                problems.append(f"examples.{section}[{j}]: no instances")
            else:
                for r in ex["instances"]:
                    if not isinstance(r, dict):
                        continue
                    sp = r.get("span")
                    if sp is None:
                        if section == "shown":
                            problems.append(f"examples.{section}[{j}]: instance {r.get('id')} has no span (a shown instance demonstrates the field)")
                        continue
                    parts = sp if isinstance(sp, list) else [sp]
                    if not parts or not all(isinstance(p, str) and p.strip() for p in parts):
                        problems.append(f"examples.{section}[{j}]: instance {r.get('id')}: span must be a non-empty string or a list of them")
                    elif not all(span_in_text(p, ex.get("text") or "") for p in parts):
                        problems.append(f"examples.{section}[{j}]: instance {r.get('id')}: span {sp!r} is not verbatim in the text")
    return problems


def _enum_values(slots: dict) -> set[str]:
    out = set()
    for spec in slots.values():
        if isinstance(spec, dict) and spec.get("type") == "enum":
            out.update(str(v) for v in spec.get("values") or [])
    return out


def load(directory: str = CATALOG_DIR, strict: bool = True) -> dict:
    """Load every template file; raise CatalogError listing all problems when strict."""
    catalog: dict = {}
    problems: list[str] = []
    for path in sorted(glob.glob(os.path.join(directory, "*.yaml"))):
        if os.path.basename(path).startswith("_"):
            continue                                   # shared files, not templates
        with open(path, encoding="utf-8") as fh:
            t = yaml.safe_load(fh)
        for p in check_template(t, path):
            problems.append(f"{os.path.basename(path)}: {p}")
        catalog[t.get("id")] = t
    if problems and strict:
        raise CatalogError("\n".join(problems))
    return catalog


def load_general(directory: str = CATALOG_DIR) -> dict:
    """The shared prompt text (``_general.yaml``): intro, output contract, identifiers, lemmas,
    unmapped spans, the global gap codes, the abstain rule."""
    with open(os.path.join(directory, "_general.yaml"), encoding="utf-8") as fh:
        return yaml.safe_load(fh)
