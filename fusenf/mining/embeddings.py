"""FUSE-NF embedding channel (BATCH2_PLAN item C, integrated at H) — the filler / symbol
embedding cache for §4.3.2 (role-filler distribution clustering, paper-faithful) and
§4.3.5 (AE-pair prior).

Model: the item-C pinned ``Qwen/Qwen3-Embedding-8B`` (sentence-transformers, bf16, CPU;
bit-exact reruns measured 2026-08-21). Texts are built from ``valuations_occ.jsonl`` (one
row per filler occurrence, full label bag) plus the canonical substrate (surface ``Name``
strings for constants). Two text modes, both written by ``--texts-only`` for review:

* ``word``     one text per class label or constant symbol ("hiking path", "Ziri", "now")
               — the paper's *word embedding* of a filler; a multi-label skolem is
               represented by each of its labels (fractional mass, as in the exact-label
               method).
* ``subtree``  one text per distinct filler rendering — the label bag joined with ", "
               (alphabetical; "blue, sky"), a plural group in the REAL plural form
               (mechanical, ``pluralize.py``: "parties"; in a bag only the labels that occur
               as a ``GroupOf`` kind somewhere — the noun proxy — inflect: "lights, on"),
               the surface name for a named constant — the paper's *subtree embedding*.

Wildcards (``<untyped>``, ``<num>``, ``<str>``, ``<term:X>``) are never embedded.

``--run --mode word|subtree`` encodes the inventory in sorted order (batch 4, normalized)
and writes ``<out-dir>/emb_<mode>.npy`` (float32), ``index_<mode>.jsonl`` and
``manifest_<mode>.json`` (model, dtype, dim, sha256 of the matrix, wall time). Never run
it beside other heavy jobs: the 8B weights are ~16 GB, streamed from NVMe.

Usage:
  python embeddings.py --texts-only            # inventory + preview, no model
  python embeddings.py --run --mode word       # the cached pass (30-40 min CPU)
"""

from __future__ import annotations

import argparse
import collections
import hashlib
import json
import os
import re
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from pluralize import plural_label  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
WILD = ("<untyped>", "<num>", "<str>")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def is_wild(f):
    return f in WILD or f.startswith("<term:")


def words(sym):
    return sym.replace("_", " ")


def build_inventory(occ_rows, names, nouns=frozenset()):
    """-> {mode: {text: {"n_occ", "examples", "kinds", "sources"}}}; ``nouns`` = labels
    attested as a GroupOf kind (which labels inflect inside a plural bag)"""
    inv = {"word": collections.defaultdict(lambda: {"n_occ": 0, "examples": [], "kinds": collections.Counter(), "sources": collections.Counter()}),
           "subtree": collections.defaultdict(lambda: {"n_occ": 0, "examples": [], "kinds": collections.Counter(), "sources": collections.Counter()})}

    def add(mode, text, r, source, share=1.0):
        e = inv[mode][text]
        e["n_occ"] += share
        if len(e["examples"]) < 3 and r["id"] not in e["examples"]:
            e["examples"].append(r["id"])
        e["kinds"][r["filler_kind"]] += 1
        e["sources"][source] += 1

    for r in occ_rows:
        fk = r["filler_kind"]
        if fk == "constant":
            sym = r["filler"]
            text = names.get(sym, words(sym))
            add("word", text, r, "name" if sym in names else "constant")
            add("subtree", text, r, "name" if sym in names else "constant")
        elif r["labels"]:
            labs = r["labels"]
            for lab in labs:
                add("word", words(lab), r, "label", 1.0 / len(labs))
            if r["plural"]:
                text = ", ".join(plural_label(l) if (len(labs) == 1 or l in nouns) else words(l)
                                 for l in labs)
            else:
                text = ", ".join(words(l) for l in labs)
            add("subtree", text, r, "label-bag" if len(labs) > 1 else ("plural" if r["plural"] else "label"))
        else:
            continue   # wildcard / untyped: never embedded
    return inv


def surface_names(canonical_path):
    """-> (constant symbol -> surface Name string, first seen; labels attested as a GroupOf
    kind = the noun proxy for plural bags)"""
    names, nouns = {}, set()
    rx = re.compile(r'\(Name (\S+) "([^"]*)"\)')
    rg = re.compile(r'\(GroupOf \S+ ([a-z][a-z0-9_]*)\)')
    for l in open(canonical_path, encoding="utf-8"):
        rec = json.loads(l)
        for a in rec["atoms"]:
            m = rx.match(a["term"])
            if m and m.group(1) not in names:
                names[m.group(1)] = m.group(2)
            g = rg.match(a["term"])
            if g:
                nouns.add(g.group(1))
    return names, nouns


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--occ", default=os.path.join(HERE, "out_h", "valuations_occ.jsonl"))
    ap.add_argument("--canonical", default=os.path.join(HERE, "canonical_substrate.jsonl"))
    ap.add_argument("--out-dir", default=os.path.join(HERE, "out_h", "embeddings"))
    ap.add_argument("--texts-only", action="store_true")
    ap.add_argument("--run", action="store_true")
    ap.add_argument("--mode", choices=("word", "subtree"), default="word")
    ap.add_argument("--model", default="Qwen/Qwen3-Embedding-8B")
    ap.add_argument("--batch-size", type=int, default=4)
    args = ap.parse_args()

    occ = load(args.occ)
    names, nouns = surface_names(args.canonical)
    inv = build_inventory(occ, names, nouns)
    os.makedirs(args.out_dir, exist_ok=True)
    inv_path = os.path.join(args.out_dir, "embed_texts.jsonl")
    with open(inv_path, "w", encoding="utf-8") as fh:
        for mode in ("word", "subtree"):
            for text in sorted(inv[mode]):
                e = inv[mode][text]
                fh.write(json.dumps({"mode": mode, "text": text, "n_occ": round(e["n_occ"], 3),
                                     "kinds": dict(e["kinds"]), "sources": dict(e["sources"]),
                                     "examples": e["examples"]}, ensure_ascii=False, sort_keys=True) + "\n")
    for mode in ("word", "subtree"):
        src = collections.Counter()
        for e in inv[mode].values():
            src.update(e["sources"])
        print(f"{mode:8} {len(inv[mode])} distinct texts  (occurrence sources: {dict(src)})")
    print(f"-> {inv_path}")
    if not args.run:
        return

    import numpy as np
    from sentence_transformers import SentenceTransformer
    import torch
    texts = sorted(inv[args.mode])
    t0 = time.time()
    model = SentenceTransformer(args.model, device="cpu", model_kwargs={"torch_dtype": torch.bfloat16})
    load_s = time.time() - t0
    t0 = time.time()
    emb = model.encode(texts, normalize_embeddings=True, batch_size=args.batch_size,
                       show_progress_bar=False).astype(np.float32)
    enc_s = time.time() - t0
    npy = os.path.join(args.out_dir, f"emb_{args.mode}.npy")
    np.save(npy, emb)
    with open(os.path.join(args.out_dir, f"index_{args.mode}.jsonl"), "w", encoding="utf-8") as fh:
        for i, t in enumerate(texts):
            fh.write(json.dumps({"i": i, "text": t}, ensure_ascii=False) + "\n")
    man = {"model": args.model, "dtype": "bfloat16", "device": "cpu", "torch": torch.__version__,
           "mode": args.mode, "n_texts": len(texts), "dim": int(emb.shape[1]),
           "batch_size": args.batch_size, "normalized": True,
           "matrix_sha256": hashlib.sha256(emb.tobytes()).hexdigest(),
           "load_seconds": round(load_s, 1), "encode_seconds": round(enc_s, 1)}
    json.dump(man, open(os.path.join(args.out_dir, f"manifest_{args.mode}.json"), "w"), indent=1)
    print(f"-> {npy}  {emb.shape}  sha {man['matrix_sha256'][:16]}  load {load_s:.0f}s  encode {enc_s:.0f}s")


if __name__ == "__main__":
    main()
