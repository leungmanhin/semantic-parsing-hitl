"""Post-parse validation: a parser reply -> emitted statements, declarations and findings.

One implementation for two callers: ``semantic-parse.py`` validates every reply it receives,
the suite scorer validates every stored record.  Report only: nothing here changes the reply.

Checks, in order:

* contract — the reply is a JSON object whose ``instances`` is a list of objects and whose
  ``unmapped`` / ``issues``, when present, are lists; a null slot value (the contract says omit,
  never null) is counted and stripped before emission;
* instances — the emitter's own checks: unknown template, missing or duplicate id, missing
  required slot, bad enum value, unknown slot, dangling reference, a filler pointing at an
  instance that mints no symbol, a scope cycle.  Any of these stops the record here
  (status ``malformed``);
* graph lints on well-formed instances: a witness no other instance mentions, or a name no
  instance mentions while nothing is reported unmapped (``dangling-referent``: a witness is
  introduced only by a covered clause, a name may stand alone beside an unmapped span), a
  predication with filler slots none of which is filled (``bare-predication``) unless it is the
  content, directly or through another scope, of a scope whose refs slot declares
  ``bare_content`` (an imperative's addressee is implicit), an optional
  scope with an empty ``refs`` list (``empty-scope``);
* C9 — every emitted statement types against the substrate with the emitter's declarations
  (needs the ``petta`` package, otherwise ``typecheck`` is ``skipped``).

``inspect`` does everything but C9 (no engine needed); ``typecheck_records`` runs C9 over many
records in one engine session; ``validate`` does both for one reply.
"""
from __future__ import annotations

import collections
import contextlib
import io
import json
import os
import tempfile

from . import catalog as CAT, emit as E, typecheck as T

HARD_TYPE_FINDINGS = ("type", "type-conflict", "parse-error")


def _is_list(x) -> bool:
    return isinstance(x, list)


def inspect(reply, catalog: dict | None = None, reference_time=None) -> dict:
    """Contract + emission + lints for one reply; never raises on a malformed reply."""
    if catalog is None:
        catalog = CAT.load()
    res = {"status": "ok", "findings": [], "instances": [], "unmapped": [], "issues": [], "fired": {},
           "null_slots": 0, "statements": None, "declarations": None, "detail": None, "typecheck": "not run"}
    if not isinstance(reply, dict):
        res["status"] = "not-an-object"
        res["findings"].append({"kind": "contract", "detail": "the reply is not a JSON object"})
        return res
    insts = reply.get("instances")
    if not _is_list(insts):
        res["status"] = "malformed"
        res["findings"].append({"kind": "contract", "detail": "`instances` is missing or not a list"})
        return res
    for key in ("unmapped", "issues"):
        v = reply.get(key)
        if v is None:
            continue
        if _is_list(v):
            res[key] = [x for x in v if isinstance(x, dict)]
            if len(res[key]) != len(v):
                res["findings"].append({"kind": "contract", "detail": f"`{key}` holds entries that are not objects"})
        else:
            res["findings"].append({"kind": "contract", "detail": f"`{key}` is not a list"})
    bad = [r for r in insts if not isinstance(r, dict)]
    if bad:
        res["findings"].append({"kind": "contract", "detail": f"{len(bad)} instance(s) are not objects"})
    cleaned = []
    for r in insts:
        if not isinstance(r, dict):
            continue
        c = {k: v for k, v in r.items() if v is not None}
        res["null_slots"] += len(r) - len(c)
        cleaned.append(c)
    res["instances"] = cleaned
    res["fired"] = dict(collections.Counter(str(r.get("t")) for r in cleaned))
    try:
        out = E.emit({"id": reply.get("id") or "parse", "instances": cleaned, "unmapped": res["unmapped"],
                      "reference_time": reference_time}, catalog)
    except E.EmitError as exc:
        problems = exc.args[0] if exc.args and isinstance(exc.args[0], list) else [str(exc)]
        res["findings"].extend({"kind": "instance", "detail": p} for p in problems)
        res["status"] = "malformed"
        return res
    res["statements"], res["declarations"], res["detail"] = out["statements"], out["declarations"], out["detail"]
    res["findings"].extend(lints(cleaned, catalog, res["unmapped"]))
    return res


def lints(insts: list, catalog: dict, unmapped: list) -> list:
    """Structural lints on well-formed instances (the emitter has accepted them)."""
    mentioned: set[str] = set()
    for r in insts:
        for sname, spec in (catalog[r["t"]].get("slots") or {}).items():
            v = r.get(sname)
            if spec["type"] == "filler" and E.is_ref(v):
                mentioned.add(v[1:])
            elif spec["type"] == "refs":
                mentioned.update(x[1:] for x in (v or []) if E.is_ref(x))
    by_id = {r["id"]: r for r in insts if "id" in r}

    def content_of(iid: str, seen: set) -> set:
        """The ids an instance scopes over, through its refs slots, transitively."""
        r = by_id.get(iid)
        if r is None or iid in seen:
            return set()
        seen.add(iid)
        found = set()
        for sname, spec in (catalog[r["t"]].get("slots") or {}).items():
            if spec["type"] == "refs":
                for x in r.get(sname) or []:
                    if E.is_ref(x):
                        found.add(x[1:])
                        found |= content_of(x[1:], seen)
        return found

    bare_ok: set[str] = set()                   # predications an imperative-like scope licenses to fill no participant
    for r in insts:
        for sname, spec in (catalog[r["t"]].get("slots") or {}).items():
            if spec["type"] == "refs" and spec.get("bare_content"):
                for x in r.get(sname) or []:
                    if E.is_ref(x):
                        bare_ok.add(x[1:])
                        bare_ok |= content_of(x[1:], set())
    out = []
    for r in insts:
        t = catalog[r["t"]]
        slots = t.get("slots") or {}
        if t.get("family") == "referent" and r["id"] not in mentioned:
            mints = t.get("mints") or {}
            is_name = mints.get("stem") == "name" or mints.get("symbol") == "name"   # a name may stand inside an unmapped span
            if not is_name:
                out.append({"kind": "dangling-referent", "instance": r["id"],
                            "detail": f"{r['t']} {r['id']} is mentioned by no other instance: a witness is introduced only by a clause a template covers"})
            elif not unmapped:
                out.append({"kind": "dangling-referent", "instance": r["id"],
                            "detail": f"{r['t']} {r['id']} is mentioned by no other instance and nothing is reported unmapped"})
        if t.get("family") == "predication" and r["id"] not in bare_ok:
            fillers = [s for s, spec in slots.items() if spec["type"] == "filler"]
            if fillers and not any(r.get(s) not in (None, "", []) for s in fillers):
                out.append({"kind": "bare-predication", "instance": r["id"],
                            "detail": f"{r['t']} {r['id']} fills none of its participant slots ({', '.join(fillers)})"})
        for sname, spec in slots.items():
            if spec["type"] == "refs" and r.get(sname) == []:
                out.append({"kind": "empty-scope", "instance": r["id"],
                            "detail": f"{r['t']} {r['id']}: {sname} is an empty list (a scope over nothing)"})
    return out


def typecheck_records(records: list[dict]):
    """C9 over ``[{"statements": [...], "declarations": [...]}, ...]`` in one engine session.
    Returns ``{index: [findings]}`` (only records with hard findings appear), or ``None`` when
    the ``petta`` package is not importable."""
    try:
        import petta  # noqa: F401
    except Exception:
        return None
    todo = [{"id": str(i), "statements": r["statements"], "declarations": r["declarations"]}
            for i, r in enumerate(records) if r.get("statements")]
    if not todo:
        return {}
    with tempfile.NamedTemporaryFile("w", suffix=".jsonl", delete=False) as fh:
        for r in todo:
            fh.write(json.dumps(r) + "\n")
        path = fh.name
    report = path + ".report.json"
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            T.main([path, "--no-infer", "--report", report])
        with open(report, encoding="utf-8") as fh:
            rep = json.load(fh)
    finally:
        for p in (path, report):
            if os.path.exists(p):
                os.unlink(p)
    by: dict[int, list] = collections.defaultdict(list)
    for f in rep["findings"]:
        if f["kind"] in HARD_TYPE_FINDINGS:
            by[int(f["id"])].append({"kind": "type", "detail": f"{f['kind']}: {f.get('statement') or f.get('error')}",
                                     "statement": f.get("statement"), "expected": f.get("expected"), "got": f.get("got")})
    return by


def validate(reply, catalog: dict | None = None, typecheck: bool = True, reference_time=None) -> dict:
    """Everything for one reply: contract, emission, lints and C9."""
    res = inspect(reply, catalog, reference_time)
    if typecheck and res["statements"]:
        typed = typecheck_records([res])
        if typed is None:
            res["typecheck"] = "skipped (no petta package)"
        else:
            res["typecheck"] = "ran"
            res["findings"].extend(typed.get(0, []))
    return res


def summary(res: dict) -> str:
    """One line for a terminal: status, statement count, C9, findings."""
    n = len(res["statements"] or [])
    tc = res.get("typecheck", "not run")
    if tc == "ran":
        bad = sum(1 for f in res["findings"] if f["kind"] == "type")
        tc = f"C9 {n - bad}/{n}"
    kinds = collections.Counter(f["kind"] for f in res["findings"])
    found = ", ".join(f"{k} {v}" for k, v in sorted(kinds.items())) or "none"
    return f"validation {res['status']} · {n} statements · {tc} · findings: {found}"
