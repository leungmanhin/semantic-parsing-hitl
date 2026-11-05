"""THE CANDIDATE RECORD shared by the five methods (§5 intro: candidates carrying different kinds of evidence,
never certificates). One JSON object per candidate::

    {"id": "subtree-000123", "method": "subtree" | "generalizer" | "correspondence" | "mi" | "paraphrase" | "ae",
     "pattern": {"atoms": [...lifted atom strings...], "level": "lexicalized" | "shape", "variables": {...}},
     "key": {the key dials the run used}, "support": {"families": n, "sentences": n, "datasets": {}, "roles": {}},
     "matches": [{"id": sentence id, "family": ..., "bindings": {variable: symbol}}, ...],
     "evidence": {"tenses": {...}, "strengths": [...], "confidences": [...], "surface": [...], "texts": [...],
                  "families": [...], <method-specific fields>},
     "tests": {"renaming": ..., "broken_link": ..., "swap": ..., "third_entity": ..., "negation": ..., "modifier": ...,
               "residual": ...},
     "provenance": {"run": ..., "manifests": [...], "params": {...}},
     "status": "candidate" | "note" | "admitted" | "split" | "rejected"}
"""
from __future__ import annotations

import collections
import json
import os


def new(method: str, number: int, pattern_atoms: list[str], level: str, key: dict, run: str, params: dict | None = None,
        tag: str = "") -> dict:
    """A fresh record; ``tag`` separates the numbering of two series of one method (``subtree-L000012``)."""
    return {"id": f"{method}-{tag}{number:06d}", "method": method,
            "pattern": {"atoms": list(pattern_atoms), "level": level, "variables": {}},
            "key": dict(key), "support": {"families": 0, "sentences": 0, "datasets": {}, "roles": {}},
            "matches": [], "evidence": {}, "tests": {},
            "provenance": {"run": run, "manifests": [], "params": params or {}}, "status": "candidate"}


def add_match(cand: dict, lifted: dict, bindings: dict | None = None):
    cand["matches"].append({"id": lifted["id"], "family": lifted.get("family"), "dataset": lifted.get("dataset"),
                            "role": lifted.get("role"), "bindings": bindings or {}})


def finish(cand: dict, lifted_by_id: dict, manifests_by_id: dict | None = None, max_texts: int = 12) -> dict:
    """Support and evidence from the matches: families, sentences, datasets, roles; the tense distribution,
    the strengths and confidences, the surface records, a sample of the texts, the manifests."""
    fams, sents = set(), set()
    ds, roles = collections.Counter(), collections.Counter()
    tenses, strengths, confidences, surface, texts = collections.Counter(), [], [], collections.Counter(), []
    manifests = set()
    for m in cand["matches"]:
        g = lifted_by_id.get(m["id"])
        f = m.get("family") or m["id"]
        if f not in fams:
            ds[m.get("dataset") or "?"] += 1
            roles[m.get("role") or "?"] += 1
        fams.add(f)
        sents.add(m["id"])
        if g:
            ev = g.get("evidence") or {}
            for _e, ts in (ev.get("tenses") or {}).items():
                tenses.update(ts)
            tenses.update((ev.get("atom_tenses") or {}).values())
            strengths.extend(ev.get("strengths") or [])
            confidences.extend(ev.get("confidences") or [])
            surface.update(ev.get("surface") or [])
            if len(texts) < max_texts and g.get("text"):
                texts.append(g["text"])
        if manifests_by_id and m["id"] in manifests_by_id:
            manifests.add(manifests_by_id[m["id"]])
    cand["support"] = {"families": len(fams), "sentences": len(sents), "datasets": dict(ds), "roles": dict(roles)}
    cand["evidence"].update({"tenses": dict(tenses), "strengths": _hist(strengths), "confidences": _hist(confidences),
                             "surface": dict(surface.most_common(20)), "texts": texts, "families": sorted(fams)})
    cand["provenance"]["manifests"] = sorted(manifests)
    return cand


def _hist(values: list) -> dict:
    h = collections.Counter(round(float(v), 2) for v in values)
    return {str(k): v for k, v in sorted(h.items())}


def write(cands: list[dict], path: str):
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        for c in cands:
            fh.write(json.dumps(c, ensure_ascii=False) + "\n")


def read(path: str) -> list[dict]:
    with open(path, encoding="utf-8") as fh:
        return [json.loads(l) for l in fh if l.strip()]
