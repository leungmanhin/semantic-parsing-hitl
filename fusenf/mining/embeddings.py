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


def occ_texts(r, names, nouns=frozenset()):
    """texts one filler occurrence sends: {"word": [(text, share, source), ...],
    "subtree": (text, source)} — or None for a wildcard / untyped filler (never embedded)."""
    fk = r["filler_kind"]
    if fk == "constant":
        sym = r["filler"]
        text = names.get(sym, words(sym))
        src = "name" if sym in names else "constant"
        return {"word": [(text, 1.0, src)], "subtree": (text, src)}
    labs = r["labels"]
    if not labs:
        return None
    word = [(words(l), 1.0 / len(labs), "label") for l in labs]
    if r["plural"]:
        text = ", ".join(plural_label(l) if (len(labs) == 1 or l in nouns) else words(l) for l in labs)
    else:
        text = ", ".join(words(l) for l in labs)
    src = "label-bag" if len(labs) > 1 else ("plural" if r["plural"] else "label")
    return {"word": word, "subtree": (text, src)}


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
        t = occ_texts(r, names, nouns)
        if t is None:
            continue   # wildcard / untyped: never embedded
        for text, share, src in t["word"]:
            add("word", text, r, src, share)
        add("subtree", t["subtree"][0], r, t["subtree"][1])
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
    ap.add_argument("--mode", choices=("word", "subtree", "union"), default="union",
                    help="which inventory to encode; union = both modes' texts in one pass")
    ap.add_argument("--chunk", type=int, default=100, help="texts per encode call (progress log)")
    ap.add_argument("--reuse", default=None,
                    help="existing cache dir: rows for texts already there are copied, only new texts are encoded")
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
        # plain-text list of exactly the texts this mode sends (one per line, sorted)
        with open(os.path.join(args.out_dir, f"embed_{mode}s.txt"), "w", encoding="utf-8") as fh:
            for text in sorted(inv[mode]):
                fh.write(text + "\n")
    print(f"-> {inv_path}  (+ embed_words.txt / embed_subtrees.txt)")
    if not args.run:
        return

    import numpy as np
    from sentence_transformers import SentenceTransformer
    import torch
    texts = sorted(set(inv["word"]) | set(inv["subtree"])) if args.mode == "union" else sorted(inv[args.mode])
    reused = {}
    if args.reuse:
        old_emb = np.load(os.path.join(args.reuse, f"emb_{args.mode}.npy"))
        old_idx = {r["text"]: r["i"] for r in load(os.path.join(args.reuse, f"index_{args.mode}.jsonl"))}
        reused = {t: old_emb[old_idx[t]] for t in texts if t in old_idx}
    todo = [t for t in texts if t not in reused]
    print(f"encoding {len(todo)} texts ({args.mode}; {len(reused)} reused from {args.reuse}) with {args.model} …", flush=True)
    t0 = time.time()
    model = SentenceTransformer(args.model, device="cpu", model_kwargs={"torch_dtype": torch.bfloat16})
    load_s = time.time() - t0
    print(f"model loaded in {load_s:.0f}s", flush=True)
    t0 = time.time()
    new = {}
    # checkpoint/resume: after every chunk the vectors so far are saved; a restart with the
    # same inventory and chunking picks up where the previous run stopped (same batches)
    ck_npy = os.path.join(args.out_dir, f"emb_{args.mode}.partial.npy")
    ck_idx = os.path.join(args.out_dir, f"index_{args.mode}.partial.jsonl")
    start = 0
    if os.path.exists(ck_npy) and os.path.exists(ck_idx):
        ck_texts = [json.loads(l)["text"] for l in open(ck_idx, encoding="utf-8")]
        ck_emb = np.load(ck_npy)
        if ck_texts == todo[:len(ck_texts)] and len(ck_texts) % args.chunk == 0:
            new.update(zip(ck_texts, ck_emb))
            start = len(ck_texts)
            print(f"resumed {start} texts from checkpoint", flush=True)
    for i in range(start, len(todo), args.chunk):   # fixed chunking = same batches on rerun
        chunk = todo[i:i + args.chunk]
        vecs = model.encode(chunk, normalize_embeddings=True, batch_size=args.batch_size,
                            show_progress_bar=False)
        new.update(zip(chunk, vecs))
        done = min(i + args.chunk, len(todo))
        np.save(ck_npy, np.stack([new[t] for t in todo[:done]]).astype(np.float32))
        with open(ck_idx, "w", encoding="utf-8") as fh:
            for t in todo[:done]:
                fh.write(json.dumps({"text": t}, ensure_ascii=False) + "\n")
        el = time.time() - t0
        print(f"  {done}/{len(todo)}  {el:.0f}s elapsed, ~{el / done * (len(todo) - done):.0f}s left", flush=True)
    emb = np.stack([reused[t] if t in reused else new[t] for t in texts]).astype(np.float32)
    enc_s = time.time() - t0
    for f in (ck_npy, ck_idx):
        if os.path.exists(f):
            os.remove(f)
    npy = os.path.join(args.out_dir, f"emb_{args.mode}.npy")
    np.save(npy, emb)
    with open(os.path.join(args.out_dir, f"index_{args.mode}.jsonl"), "w", encoding="utf-8") as fh:
        for i, t in enumerate(texts):
            fh.write(json.dumps({"i": i, "text": t}, ensure_ascii=False) + "\n")
    man = {"model": args.model, "dtype": "bfloat16", "device": "cpu", "torch": torch.__version__,
           "mode": args.mode, "n_texts": len(texts), "dim": int(emb.shape[1]),
           "batch_size": args.batch_size, "chunk": args.chunk, "normalized": True,
           "reused_from": args.reuse, "n_reused": len(reused), "n_encoded": len(todo),
           "matrix_sha256": hashlib.sha256(emb.tobytes()).hexdigest(),
           "load_seconds": round(load_s, 1), "encode_seconds": round(enc_s, 1)}
    json.dump(man, open(os.path.join(args.out_dir, f"manifest_{args.mode}.json"), "w"), indent=1)
    print(f"-> {npy}  {emb.shape}  sha {man['matrix_sha256'][:16]}  load {load_s:.0f}s  encode {enc_s:.0f}s")


if __name__ == "__main__":
    main()
