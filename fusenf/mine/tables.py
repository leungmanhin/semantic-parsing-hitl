"""FAMILY-LEVEL PRESENCE TABLES (§5.1 decision 1, §5.3 decision 1): a unit is present in a family when any
sentence of the family has it; support is counted in families, with sentences, datasets and roles beside it."""
from __future__ import annotations

import collections
import json
import os


def presence(lifted: list[dict], units_of=None) -> dict:
    """``{unit: {"families": [...], "sentences": [...], "datasets": {...}, "roles": {...}}}`` over the lifted
    graphs; ``units_of(lifted_graph)`` yields the unit keys of a graph (default: its lifted atoms)."""
    units_of = units_of or (lambda g: g.get("canonical") or g["atoms"])
    table: dict[str, dict] = {}
    for g in lifted:
        fam = g.get("family") or g["id"]
        for u in set(units_of(g)):
            row = table.setdefault(u, {"families": set(), "sentences": set(), "datasets": collections.Counter(), "roles": collections.Counter()})
            if fam not in row["families"]:
                row["datasets"][g.get("dataset") or "?"] += 1
                row["roles"][g.get("role") or "?"] += 1
            row["families"].add(fam)
            row["sentences"].add(g["id"])
    return table


def support(row: dict) -> dict:
    return {"families": len(row["families"]), "sentences": len(row["sentences"]),
            "datasets": dict(row["datasets"]), "roles": dict(row["roles"])}


def write_table(table: dict, path: str, min_families: int = 1):
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    rows = [{"unit": u, **support(r), "family_ids": sorted(r["families"])} for u, r in table.items() if len(r["families"]) >= min_families]
    rows.sort(key=lambda x: (-x["families"], x["unit"]))
    with open(path, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
    return rows


def families_of(lifted: list[dict]) -> dict:
    """``{family: [graph ids]}`` and the role / dataset of each family."""
    fams: dict[str, dict] = {}
    for g in lifted:
        f = fams.setdefault(g.get("family") or g["id"], {"ids": [], "dataset": g.get("dataset"), "roles": set()})
        f["ids"].append(g["id"])
        f["roles"].add(g.get("role"))
    return fams
