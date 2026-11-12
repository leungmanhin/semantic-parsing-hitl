"""A parsed sentence as a GRAPH OF ATOMS: every statement the emitter produces, walked into flat atoms that
carry their scope (the operators above them — a negation, a modal, a sealed complement, a rule's premise or
consequent), their types (from the declarations and the substrate's argument types), their truth value, and
their provenance (the instance and the template that emitted them). This is the unit everything in
``fusenf.mine`` works on (§5.1: mine over the emitted atoms, each tagged with its instance id and template,
descending into scopes with the marker kept).

An atom record::

    {"i": 3, "head": "Agent", "args": ["sk_sing_1", "sk_teodor_1"], "scope": [], "tense": null,
     "name": "v1_agent", "inst": "v1", "template": "activity", "s": 1.0, "c": 0.99, "kind": "content"}

``scope`` is a list of ``[marker, anchor]`` pairs from the outside in — ``["Not", ""]``, ``["Theme",
"sk_say_1"]``, ``["Implication", "premise"]``, ``["Holds", "sk_located_1"]``. An operator with a proposition
argument is itself kept as an atom whose proposition arguments are replaced by ``§<n>`` placeholders, and the
proposition's atoms carry the operator as a scope marker. A conjunction is transparent; a tense wrapper over a
flat predication (``(Past (LocatedIn a b))``) becomes the inner atom's ``tense``. ``kind`` sorts the atoms:
``content`` (what the sentence states), ``tense`` (a tense or aspect tag on an event), ``surface`` (a surface
record: a name, a quantifier word — provenance), ``scope`` (an operator atom with placeholders).
"""
from __future__ import annotations

import json
import os

from . import TEMPLATES  # noqa: F401  (puts templates/ on the path)
from tmpl import catalog as CAT, lower as L, typecheck as T, validate as V

SUBSTRATE = T.load_substrate()
HEADS: dict = SUBSTRATE["heads"]
OUT = {h: e.get("out") for h, e in HEADS.items()}
KIND = {h: e.get("kind") for h, e in HEADS.items()}
TENSE_HEADS = {"Past", "Future", "Ongoing", "Prospective", "Habitual"}
SURFACE_HEADS = {h for h, k in KIND.items() if k == "surface-record"}
TRANSPARENT = {"And"}


def is_variable(tok) -> bool:
    return isinstance(tok, str) and tok.startswith("$")


def is_function_term(term) -> bool:
    """A skolem function of a rule's variables: ``(sk_sleep $x)`` — a list whose head is no substrate head."""
    return isinstance(term, list) and bool(term) and isinstance(term[0], str) and term[0] not in HEADS and term[0].startswith("sk_")


def is_proposition(term) -> bool:
    return isinstance(term, list) and bool(term) and isinstance(term[0], str) and OUT.get(term[0]) == "Proposition"


def arg_types(head: str, nargs: int) -> list[str]:
    entry = HEADS.get(head)
    if not entry:
        return ["?"] * nargs
    try:
        types = T.arg_types_here_for(entry, nargs)
    except Exception:
        types = []
    if not types:
        types = list(entry.get("arg_types") or [])
    if len(types) < nargs:                                   # a variadic head: repeat the last type
        types = types + [types[-1] if types else "?"] * (nargs - len(types))
    return types[:nargs]


def _truth(stmt: str) -> tuple[float, float]:
    expr = T.parse(stmt)
    tv = expr[3] if isinstance(expr, list) and len(expr) == 4 else None
    if isinstance(tv, list) and len(tv) == 3 and tv[0] == "STV":
        return float(tv[1]), float(tv[2])
    return 1.0, 0.99


def graph_of(record: dict, catalog: dict | None = None, inspected: dict | None = None) -> dict | None:
    """The graph of one parsed record (a row of a ``*.parsed.jsonl`` file). ``None`` when the reply failed or
    the emitter refused it. ``inspected`` may pass the result of ``validate.inspect`` already computed."""
    reply = record.get("reply") or {}
    resp = reply.get("response")
    if not isinstance(resp, dict) or reply.get("error"):
        return None
    res = inspected if inspected is not None else V.inspect(resp, catalog or CAT.load(), text=record.get("text", ""))
    if not res.get("statements"):
        return None
    hard = [f for f in (res.get("findings") or []) if f.get("kind") in ("contract", "instance")]
    if hard:
        return None
    types: dict[str, set] = {}
    atoms: list[dict] = []
    text = CAT.norm_span(record.get("text", ""))
    place: dict[str, list] = {}                               # an instance → where it stands: the offset of its span in
    for k, inst in enumerate(resp.get("instances") or []):    # the text (the text's length when it has none), then its
        if isinstance(inst, dict) and inst.get("id") is not None:      # place in the reply
            span = inst.get("span")
            first = span[0] if isinstance(span, list) and span else span
            at = text.find(CAT.norm_span(first)) if isinstance(first, str) and first.strip() else -1
            place.setdefault(str(inst["id"]), [at if at >= 0 else len(text), k])
    nowhere = [len(text), len(place)]
    if res.get("records") is not None:                       # the emitter's records: terms and truth values as data
        for sym, classes in (res.get("types") or {}).items():
            types.setdefault(sym, set()).update(classes)     # skolem functions are declared apart and not read here
        for rec in res["records"]:
            meta = {"name": rec["name"], "inst": rec.get("inst"), "template": rec.get("owner"),
                    "s": float(rec["truth"][0]), "c": float(rec["truth"][1]), "at": place.get(str(rec.get("inst")), nowhere)}
            _walk(L.leaves(rec["term"]), [], None, atoms, meta)   # leaves as the statement's text writes them
    else:                                                    # an inspection without records: read the lowered text
        for d in res.get("declarations") or []:
            e = T.parse(d)
            if isinstance(e, list) and len(e) == 3 and e[0] == ":" and isinstance(e[1], str) and isinstance(e[2], str):
                types.setdefault(e[1], set()).add(e[2])      # a function term's declaration ((sk_f $x) Event) is skipped
        for stmt, det in zip(res["statements"], res["detail"]):
            name, term = T.split_statement(stmt)
            s, c = _truth(stmt)
            meta = {"name": name, "inst": det.get("inst"), "template": det.get("owner"), "s": s, "c": c,
                    "at": place.get(str(det.get("inst")), nowhere)}
            _walk(term, [], None, atoms, meta)
    for i, a in enumerate(atoms):
        a["i"] = i
    return {"id": record["id"], "text": record.get("text", ""), "dataset": record.get("dataset"), "family": record.get("family"),
            "role": record.get("role"), "manifest": reply.get("manifest_id"),
            "types": {k: sorted(v) for k, v in types.items()}, "atoms": atoms,
            "unmapped": [u.get("code") for u in (resp.get("unmapped") or []) if isinstance(u, dict)]}


def _walk(term, scope: list, tense: str | None, atoms: list, meta: dict):
    """Flatten one term into atom records (see the module doc)."""
    if not isinstance(term, list) or not term:
        return                                                # a bare symbol statement: nothing to mine
    head = term[0]
    if not isinstance(head, str):
        return
    if head in TRANSPARENT:
        for a in term[1:]:
            _walk(a, scope, tense, atoms, meta)
        return
    if head in TENSE_HEADS and len(term) == 2 and is_proposition(term[1]):
        _walk(term[1], scope, head, atoms, meta)             # (Past (LocatedIn a b)): the tense on the inner atom
        return
    if head == "Implication" and len(term) == 3:
        rule = meta["name"]                                   # the rule's statement name anchors its two sides
        atoms.append({**meta, "head": head, "args": ["§premise", "§consequent"], "scope": list(scope), "tense": tense, "kind": "scope"})
        _walk(term[1], scope + [["Implication:premise", rule]], tense, atoms, meta)
        _walk(term[2], scope + [["Implication:consequent", rule]], tense, atoms, meta)
        return
    props = [i for i, a in enumerate(term[1:], 1) if is_proposition(a)]
    if props:
        anchors = [a for i, a in enumerate(term[1:], 1) if i not in props and (isinstance(a, str) or is_function_term(a))]
        anchor = anchors[0] if anchors else ""          # a symbol, or a skolem function term (a list)
        args = [f"§{k}" if i in props else a for k, (i, a) in enumerate(enumerate(term[1:], 1))]
        atoms.append({**meta, "head": head, "args": args, "scope": list(scope), "tense": tense, "kind": "scope"})
        for i in props:
            _walk(term[i], scope + [[head, anchor]], tense, atoms, meta)
        return
    kind = "tense" if head in TENSE_HEADS else "surface" if head in SURFACE_HEADS else "content"
    atoms.append({**meta, "head": head, "args": term[1:], "scope": list(scope), "tense": tense, "kind": kind})


def graphs_of(parsed_path: str, catalog: dict | None = None, limit: int | None = None, latest: bool = True):
    """Every graph of a parsed file, one record per sentence (the latest successful reply)."""
    from tmpl import coverage as C
    catalog = catalog or CAT.load()
    rows = [json.loads(l) for l in open(parsed_path, encoding="utf-8") if l.strip()]
    if latest:
        rows = C.latest(rows)
    out = []
    for r in rows:
        g = graph_of(r, catalog)
        if g is not None:
            out.append(g)
        if limit and len(out) >= limit:
            break
    return out


def write_graphs(graphs: list[dict], path: str):
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        for g in graphs:
            fh.write(json.dumps(g, ensure_ascii=False) + "\n")


def read_graphs(path: str) -> list[dict]:
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]
