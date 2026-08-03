#!/usr/bin/env python3
"""Tier C — paraphrase pairs and hard controls, from PAWS-Wiki labeled_final.

Both sides of a pair are separate corpus records sharing an `equiv_class`, so
they are parsed independently and only the canonical graphs are ever compared.

    build_tierC.py --parquet <paws_train.parquet> --pos 300 --neg 200

Source note: the plan's URL (storage.googleapis.com/paws/...) now returns
AccessDenied; this uses the HuggingFace mirror of the same release.

What Tier C is good for, and what it is not:

* Its **controls are excellent** — PAWS negatives are word-scrambles that change
  who did what to whom while keeping the token bag nearly identical. That is the
  discrimination M2 has to demonstrate, and it is hard in exactly the right way.
* Its **positives are mostly structural** — reordering, of-phrase vs compound,
  light verb swaps. Only ~13% share an identical bag of words after filtering, so
  there is real variation, but it is not the lexical-synonym variation that our
  consolidation rules target. That is Tier A's job, by construction.

So Tier C measures whether the pipeline keeps paraphrases close and non-paraphrases
apart; it is not evidence about lexical rule discovery.
"""

from __future__ import annotations

import argparse
import collections
import hashlib
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir, "harness"))
from records import input_sha256  # noqa: E402

MIN_WORDS, MAX_WORDS = 5, 15
_RE_WORD = re.compile(r"[A-Za-z']+")
_RE_ASCII = re.compile(r"\A[\x20-\x7e]+\Z")
_RE_REJECT = re.compile(r"[\"'`()\[\]{}<>*/\\|_#@~^]|\d")


def acceptable(text: str) -> bool:
    if not _RE_ASCII.match(text) or _RE_REJECT.search(text):
        return False
    if not (text.endswith(".") and text[:1].isupper()):
        return False
    if text.count(",") > 1:
        return False
    return MIN_WORDS <= len(_RE_WORD.findall(text)) <= MAX_WORDS


def bag(text: str):
    return collections.Counter(w.lower() for w in _RE_WORD.findall(text))


def main():
    import pyarrow.parquet as pq

    ap = argparse.ArgumentParser()
    ap.add_argument("--parquet", required=True)
    ap.add_argument("--pos", type=int, default=300)
    ap.add_argument("--neg", type=int, default=200)
    ap.add_argument("--out", default=os.path.join(HERE, "tierC.jsonl"))
    args = ap.parse_args()

    d = pq.read_table(args.parquet).to_pydict()
    buckets = {1: [], 0: []}
    for a, b, label in zip(d["sentence1"], d["sentence2"], d["label"]):
        a, b = a.strip(), b.strip()
        # `a == b` is not enough: PAWS has pairs whose sides differ only in
        # punctuation or case, and such a "paraphrase" sits at distance 0 for
        # free — it would flatter M2's positive arm without testing anything.
        if not (acceptable(a) and acceptable(b)):
            continue
        if re.sub(r"[^a-z0-9 ]", "", a.lower()).strip() == re.sub(r"[^a-z0-9 ]", "", b.lower()).strip():
            continue
        key = hashlib.sha256(("%s\x00%s" % (a, b)).encode("utf-8")).hexdigest()
        buckets[label].append((key, a, b))

    records, n, pair_no = [], 0, 0
    stats = collections.Counter()
    for label, want in ((1, args.pos), (0, args.neg)):
        rows = sorted(buckets[label])[:want]          # deterministic: hash order
        for _key, a, b in rows:
            pair_no += 1
            pid = "pairC-%04d" % pair_no
            stats["identical_bag" if bag(a) == bag(b) else "lexical_diff"] += 1
            for side, text in (("a", a), ("b", b)):
                n += 1
                sentences, context = [text], {"today": None, "domain": None,
                                              "prior": [], "notes": None}
                records.append({
                    "schema": "fusenf-corpus/1",
                    "id": "tierC-%06d" % n,
                    "source": "paws-wiki-labeled-final",
                    "source_license": "PAWS: free for research use (Google)",
                    "sentences": sentences,
                    "context": context,
                    "equiv_class": pid,
                    "labels": {
                        "side": side,
                        "polarity": "same" if label == 1 else "different",
                        "pair_kind": "paraphrase" if label == 1 else "control",
                        "words": len(_RE_WORD.findall(text)),
                    },
                    "input_sha256": input_sha256({"sentences": sentences,
                                                  "context": context}),
                })
    with open(args.out, "w", encoding="utf-8") as fh:
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")

    print("eligible   positives %d, negatives %d" % (len(buckets[1]), len(buckets[0])))
    print("selected   %d pairs -> %d records" % (pair_no, len(records)))
    print("pairs      paraphrase %d, control %d" % (args.pos, args.neg))
    print("lexical    %d pairs differ only in word order, %d have lexical variation"
          % (stats["identical_bag"], stats["lexical_diff"]))
    print("wrote     ", args.out)


if __name__ == "__main__":
    main()
