"""R-checks: mechanical validation of template instance records against the registry.

The analogue, for records, of the harness's C1-C8 for atoms. Everything here is decidable from
the record and the registry alone; nothing judges whether a template was the RIGHT one.

  R1  item shape            id / instances / unmapped present and well-typed
  R2  template id           known, and one the parser writes records for
  R3  slots                 required present, no unknown slot, value types
  R4  references            every "@id" resolves to an instance of an allowed template
  R5  ids and enumerations  ids unique and well-formed; enum / qword / code values known
  R6  lemma form            lowercase snake_case
  R7  unmapped records      span + code + construction
  R8  composition           the registry's structural rules and the P06 rulings
"""
from __future__ import annotations

import re
from typing import Any

from . import registry as REG

ID_RE = re.compile(r"^[a-z][a-z0-9]{0,15}$")
LEMMA_RE = re.compile(r"^[a-z][a-z0-9_]*$")
PREP_RE = re.compile(r"^[a-z]+( [a-z]+)*$")
CHECKS = ("R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8")


def _f(code: str, index, detail: str) -> dict:
    return {"code": code, "index": index, "detail": detail}


def is_ref(v: Any) -> bool:
    return isinstance(v, str) and v.startswith("@") and len(v) > 1


def _check_value(reg, spec, value, idx, slot, by_id, out):
    """Type-check one slot value; append findings to `out`."""
    t = spec["type"]
    where = f"slot `{slot}`"
    if t == "id":
        if not isinstance(value, str) or not ID_RE.match(value):
            out.append(_f("R5", idx, f"{where}: malformed id {value!r}"))
    elif t == "lemma":
        if not isinstance(value, str) or not LEMMA_RE.match(value):
            out.append(_f("R6", idx, f"{where}: not a lowercase snake_case lemma: {value!r}"))
    elif t == "string":
        if not isinstance(value, str) or not value.strip():
            out.append(_f("R3", idx, f"{where}: expected a non-empty string"))
    elif t == "bool":
        if not isinstance(value, bool):
            out.append(_f("R3", idx, f"{where}: expected true / false"))
    elif t == "int":
        if isinstance(value, bool) or not isinstance(value, int):
            out.append(_f("R3", idx, f"{where}: expected an integer"))
    elif t == "number":
        if isinstance(value, bool) or not isinstance(value, (int, float)):
            out.append(_f("R3", idx, f"{where}: expected a number"))
    elif t == "enum":
        if value not in REG.enum_values(reg, spec):
            out.append(_f("R5", idx, f"{where}: {value!r} is not one of the allowed values"))
    elif t == "ref":
        _check_ref(spec, value, idx, slot, by_id, out)
    elif t == "filler":
        if is_ref(value):
            _check_ref(spec, value, idx, slot, by_id, out)
        elif isinstance(value, str) and value in spec.get("constants", []):
            pass
        elif not isinstance(value, str) or not LEMMA_RE.match(value):
            out.append(_f("R6", idx, f"{where}: neither a reference nor a lemma: {value!r}"))
    elif t == "list":
        if not isinstance(value, list) or not value:
            out.append(_f("R3", idx, f"{where}: expected a non-empty list"))
        else:
            for v in value:
                _check_value(reg, spec["of"], v, idx, slot, by_id, out)
    elif t == "roles":
        _check_roles(reg, spec, value, idx, slot, by_id, out)
    elif t == "obliques":
        if not isinstance(value, list) or not value:
            out.append(_f("R3", idx, f"{where}: expected a non-empty list"))
        else:
            for ob in value:
                if not isinstance(ob, dict) or set(ob) != {"prep", "obj"}:
                    out.append(_f("R3", idx, f"{where}: each entry is {{\"prep\", \"obj\"}}"))
                    continue
                if not isinstance(ob["prep"], str) or not PREP_RE.match(ob["prep"]):
                    out.append(_f("R3", idx, f"{where}: malformed preposition {ob['prep']!r}"))
                _check_value(reg, {"type": "filler", "targets": spec["targets"]}, ob["obj"],
                             idx, slot, by_id, out)
    elif t == "terms":
        keys = reg["params"]["time_term_keys"]
        if not isinstance(value, dict) or not value:
            out.append(_f("R3", idx, f"{where}: expected a non-empty object"))
        else:
            for k, v in value.items():
                if k not in keys:
                    out.append(_f("R5", idx, f"{where}: unknown time term {k!r}"))
                elif k in ("Month", "Weekday"):
                    if not isinstance(v, str) or not LEMMA_RE.match(v):
                        out.append(_f("R6", idx, f"{where}: {k} must be a lowercase name"))
                elif isinstance(v, bool) or not isinstance(v, int):
                    out.append(_f("R3", idx, f"{where}: {k} must be an integer"))
    elif t == "gap":
        if (not isinstance(value, dict) or set(value) != {"n", "unit"}
                or isinstance(value["n"], bool) or not isinstance(value["n"], (int, float))
                or not isinstance(value["unit"], str) or not LEMMA_RE.match(value["unit"])):
            out.append(_f("R3", idx, f"{where}: expected {{\"n\": number, \"unit\": lemma}}"))
    else:  # pragma: no cover - registry error
        raise ValueError(f"registry: unknown slot type {t!r}")


def _check_ref(spec, value, idx, slot, by_id, out):
    if not is_ref(value):
        out.append(_f("R4", idx, f"slot `{slot}`: expected a reference \"@id\", got {value!r}"))
        return
    target = by_id.get(value[1:])
    if target is None:
        out.append(_f("R4", idx, f"slot `{slot}`: {value} refers to no instance"))
    elif target["t"] not in spec["targets"]:
        out.append(_f("R4", idx, f"slot `{slot}`: {value} is a {target['t']}, "
                                 f"allowed: {', '.join(spec['targets'])}"))


def _check_roles(reg, spec, value, idx, slot, by_id, out):
    P = reg["params"]
    if not isinstance(value, dict) or not value:
        out.append(_f("R3", idx, f"slot `{slot}`: expected a non-empty object"))
        return
    for role, filler in value.items():
        if role not in P["roles"]:
            out.append(_f("R5", idx, f"slot `{slot}`: unknown role {role!r}"))
            continue
        vals = filler if isinstance(filler, list) else [filler]
        if not vals:
            out.append(_f("R3", idx, f"slot `{slot}`: role {role} has no filler"))
        for v in vals:
            if role in P["lexical_roles"]:
                if not isinstance(v, str) or not LEMMA_RE.match(v):
                    out.append(_f("R6", idx, f"slot `{slot}`: {role} takes a surface adverb lemma"))
            else:
                _check_value(reg, {"type": "filler", "targets": spec["targets"]}, v,
                             idx, slot, by_id, out)


def validate(item: Any, reg: dict) -> dict:
    """Run R1-R8 over one item. Returns {"ok": bool, "findings": [...]} (deterministic order)."""
    out: list[dict] = []
    if not isinstance(item, dict):
        return {"ok": False, "findings": [_f("R1", None, "item is not a JSON object")]}
    for key in ("id", "instances", "unmapped"):
        if key not in item:
            out.append(_f("R1", None, f"missing top-level field `{key}`"))
    extra = sorted(set(item) - {"id", "instances", "unmapped"})
    if extra:
        out.append(_f("R1", None, f"unknown top-level field(s): {', '.join(extra)}"))
    insts = item.get("instances")
    if not isinstance(insts, list):
        out.append(_f("R1", None, "`instances` is not a list"))
        insts = []
    unm = item.get("unmapped")
    if not isinstance(unm, list):
        out.append(_f("R1", None, "`unmapped` is not a list"))
        unm = []

    templates = REG.record_templates(reg)
    by_id: dict[str, dict] = {}
    for idx, r in enumerate(insts):
        if not isinstance(r, dict) or "t" not in r:
            out.append(_f("R2", idx, "instance is not an object with a `t` field"))
            continue
        if r["t"] not in templates:
            out.append(_f("R2", idx, f"unknown or slot-level template {r['t']!r}"))
            continue
        rid = r.get("id")
        if isinstance(rid, str):
            if rid in by_id:
                out.append(_f("R5", idx, f"duplicate id {rid!r}"))
            else:
                by_id[rid] = r

    for idx, r in enumerate(insts):
        if not isinstance(r, dict) or r.get("t") not in templates:
            continue
        slots = templates[r["t"]]["slots"]
        for name, spec in slots.items():
            if name not in r:
                if spec.get("required"):
                    out.append(_f("R3", idx, f"{r['t']}: missing required slot `{name}`"))
                continue
            if r[name] is None:
                out.append(_f("R3", idx, f"{r['t']}: slot `{name}` is null (omit it instead)"))
                continue
            _check_value(reg, spec, r[name], idx, name, by_id, out)
        for name in sorted(set(r) - set(slots) - {"t"}):
            out.append(_f("R3", idx, f"{r['t']}: unknown slot `{name}`"))

    codes = reg["params"]["gap_codes"]
    for idx, u in enumerate(unm):
        if not isinstance(u, dict) or set(u) != {"span", "code", "construction"}:
            out.append(_f("R7", idx, "unmapped record must have exactly span / code / construction"))
            continue
        if u["code"] not in codes:
            out.append(_f("R7", idx, f"unknown gap code {u['code']!r}"))
        for k in ("span", "construction"):
            if not isinstance(u[k], str) or not u[k].strip():
                out.append(_f("R7", idx, f"unmapped `{k}` is empty"))

    if not out:                       # composition is only meaningful on well-formed records
        out += _composition(insts, by_id, reg)
    order = {c: i for i, c in enumerate(CHECKS)}
    out.sort(key=lambda f: (-1 if f["index"] is None else f["index"], order[f["code"]], f["detail"]))
    return {"ok": not out, "findings": out}


def _composition(insts, by_id, reg) -> list[dict]:
    P = reg["params"]
    out: list[dict] = []
    sealed: dict[str, int] = {}
    denied: dict[str, int] = {}
    or_events: set[str] = set()
    v02_pairs, c01_pairs = {}, {}
    for idx, r in enumerate(insts):
        t = r["t"]
        if t == "E03" and not (r.get("kind") or r.get("collective")):
            out.append(_f("R8", idx, "E03 needs `kind` or `collective`"))
        if t == "E08" and r["possessed"] == r["possessor"]:
            out.append(_f("R8", idx, "E08: possessed and possessor are the same instance"))
        if t == "V05":
            for c in r["content"]:
                if c[1:] == r["id"]:
                    out.append(_f("R8", idx, "V05 lists itself as content"))
                if c[1:] in sealed:
                    out.append(_f("R8", idx, f"{c} is content of two attitudes"))
                sealed[c[1:]] = idx
        if t == "O03":
            for c in r["over"]:
                if c[1:] in denied:
                    out.append(_f("R8", idx, f"{c} is denied twice"))
                denied[c[1:]] = idx
        if t == "O01":
            if "word" in r and r["head"] != "Obligated":
                out.append(_f("R8", idx, "O01: `word` applies to Obligated only"))
        if t in ("R01", "R03", "C02") and "qword" in r:
            if r["qword"] not in P["strength_by_qword"]:
                out.append(_f("R5", idx, f"{t}: unknown quantifier word {r['qword']!r}"))
        if t == "R03":
            verbal, copular = "verb" in r, "prop" in r
            if verbal == copular:
                out.append(_f("R8", idx, "R03 takes exactly one of `verb` / `prop`"))
            if verbal and "subj_role" not in r:
                out.append(_f("R8", idx, "R03 with `verb` needs `subj_role`"))
            if copular and any(k in r for k in ("subj_role", "roles", "obliques")):
                out.append(_f("R8", idx, "R03 with `prop` takes no roles"))
        if t == "J01":
            part = all(k in r for k in ("event", "role", "alts"))
            prop = all(k in r for k in ("subj", "props"))
            if part == prop or (part and any(k in r for k in ("subj", "props"))) \
                    or (prop and any(k in r for k in ("event", "role", "alts"))):
                out.append(_f("R8", idx, "J01 takes either event/role/alts or subj/props"))
            elif part:
                if len(r["alts"]) < 2:
                    out.append(_f("R8", idx, "J01 needs at least two alternatives"))
                ev = by_id[r["event"][1:]]
                if r["role"] in ev.get("roles", {}):
                    out.append(_f("R8", idx, f"J01: role {r['role']} is also listed on the event"))
                if r["role"] in P["lexical_roles"]:
                    out.append(_f("R8", idx, "J01: a lexical role cannot be disjoined"))
                or_events.add(r["event"][1:])
            elif len(r["props"]) < 2:
                out.append(_f("R8", idx, "J01 needs at least two alternatives"))
        if t == "L01":
            if r["connective"] != r["connective"].lower() or not PREP_RE.match(r["connective"]):
                out.append(_f("R3", idx, "L01: `connective` is the lowercase surface connective"))
            elif r["connective"] in P["temporal_connectives"]:
                out.append(_f("R8", idx, f"L01: {r['connective']!r} is temporal, never a link"))
            if r["main"] == r["sub"]:
                out.append(_f("R8", idx, "L01: main and sub are the same instance"))
        if t == "T08":
            if r["earlier"] == r["later"]:
                out.append(_f("R8", idx, "T08: earlier and later are the same"))
            if not (is_ref(r["earlier"]) or is_ref(r["later"])):
                out.append(_f("R8", idx, "T08: at least one endpoint must be an eventuality"))
        if t == "C14" and not PREP_RE.match(r["prep"]):
            out.append(_f("R3", idx, "C14: `prep` is the lowercase preposition"))
        if t == "V02":
            v02_pairs[(r["subj"], r["prop"])] = idx
        if t == "C01":
            c01_pairs[(r["subj"], r["pred"])] = idx
        if t == "E01" and "title" in r and not r["name"].startswith(r["title"]):
            out.append(_f("R8", idx, "E01: `title` must be the leading part of `name`"))
    for key, idx in c01_pairs.items():
        if key in v02_pairs:
            out.append(_f("R8", idx, "C01 duplicates the plain fact a V02 already states"))
    # P06 corner 5: a denied bundle never carries an Or
    for pid in sorted(or_events):
        if pid in denied:
            out.append(_f("R8", denied[pid], f"@{pid} is denied and carries a disjunction: "
                                             "\"not … or\" is one denial per alternative"))
    # a denial groups either copular predications or exactly one eventuality / rule each
    for idx, r in enumerate(insts):
        if r["t"] != "O03":
            continue
        kinds = [by_id[c[1:]]["t"] for c in r["over"]]
        copular = [k for k in kinds if k in ("C01", "C14", "D01", "M01")]
        if copular and len(copular) != len(kinds):
            out.append(_f("R8", idx, "O03: copular predications are denied together, "
                                     "separately from events and rules"))
        if kinds.count("C02") and len(kinds) > 1:
            out.append(_f("R8", idx, "O03: a kind-level C02 is denied on its own"))
    return out
