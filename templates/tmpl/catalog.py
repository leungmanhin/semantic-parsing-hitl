"""Catalog loader: one template per file under ``templates/catalog/``.

A template file is the whole specification of one template (see ``catalog/transfer.yaml``
for the layout).  This module loads every ``*.yaml`` in the directory, checks the structural
invariants the emitter and the suite runner rely on, and returns ``{id: template}``.

Structural invariants checked here (content is reviewed by people, not checked here):

* ``id`` matches the file name; ``family`` and ``kind`` present;
* every slot has a ``type`` from the known set, and every ``filler`` / ``lemma`` / ``refs``
  slot has a substrate ``class``;
* every ``emits`` entry has an ``atom`` whose placeholders name a slot of the template (or
  ``@id`` when the template mints a symbol); ``if_filled`` / ``each`` name a slot; ``when``
  mentions only slots, their values and ``true`` / ``false``; ``project`` is a boolean;
* ``one_of`` groups list two or more slots each; a ``truth`` rule names a slot and gives
  ``[strength, confidence]`` pairs; ``presupposed`` lists slots of the template;
* examples carry a ``category`` and either ``instances`` or an ``expected`` abstain target.
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
SLOT_KEYS = {"type", "class", "role", "required", "default", "values", "doc"}

_PLACEHOLDER = re.compile(r"\{([a-z_]+)\}")


class CatalogError(Exception):
    pass


def placeholders(atom: str) -> set[str]:
    return set(_PLACEHOLDER.findall(atom))


def check_template(t: dict, path: str) -> list[str]:
    problems = []
    name = os.path.splitext(os.path.basename(path))[0]
    if t.get("id") != name:
        problems.append(f"id {t.get('id')!r} does not match file name {name!r}")
    for key in ("family", "kind", "trigger", "slots", "emits", "examples"):
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
    for i, group in enumerate(t.get("one_of") or []):
        if not isinstance(group, list) or len(group) < 2 or any(g not in slots for g in group):
            problems.append(f"one_of[{i}]: must list two or more slots of the template")
    for s in t.get("presupposed") or []:
        if s not in slots:
            problems.append(f"presupposed: {s!r} is not a slot")
    truth = t.get("truth")
    if truth is not None:
        if not isinstance(truth, dict) or truth.get("slot") not in slots:
            problems.append("truth: must name a slot of the template")
        else:
            pairs = list((truth.get("values") or {}).values()) + ([truth["default"]] if "default" in truth else [])
            for pair in pairs:
                if not (isinstance(pair, list) and len(pair) == 2 and all(isinstance(x, (int, float)) for x in pair)):
                    problems.append(f"truth: {pair!r} is not a [strength, confidence] pair")
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
            for word in re.findall(r"[a-z_]+", e["when"]):
                if word not in slots and word not in ("and", "or", "not", "true", "false") and word not in _enum_values(slots):
                    problems.append(f"emits[{i}]: when mentions {word!r}, not a slot or a value")
        if "project" in e and not isinstance(e["project"], bool):
            problems.append(f"emits[{i}]: project must be true or false")
    for section in ("shown", "held_out"):
        for j, ex in enumerate((t.get("examples") or {}).get(section) or []):
            if ex.get("category") not in CATEGORIES:
                problems.append(f"examples.{section}[{j}]: unknown category {ex.get('category')!r}")
            if ex.get("category") == "abstain":
                if not isinstance(ex.get("expected"), dict) or not ex["expected"].get("abstain"):
                    problems.append(f"examples.{section}[{j}]: an abstain example needs expected: {{abstain: true, …}}")
            elif not ex.get("instances"):
                problems.append(f"examples.{section}[{j}]: no instances")
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
