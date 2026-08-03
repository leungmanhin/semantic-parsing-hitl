#!/usr/bin/env python3
"""Tier B — natural sentences from Tatoeba (CC-BY 2.0 FR).

Deterministic selection: the pool is ordered by sha256 of the sentence, not by a
seeded shuffle, so the same dump + the same filters always yield the same corpus
and no random state has to be carried anywhere.

    build_tierB.py --dump <eng_sentences.tsv.bz2> --n 100

Attribution is kept per sentence (`source_id`) — Tatoeba is CC-BY and the sentence
ids are what make the credit checkable.
"""

from __future__ import annotations

import argparse
import bz2
import collections
import hashlib
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir, "harness"))
from records import input_sha256  # noqa: E402

# The prompt's strong zone: one clause, concrete, declarative, plain ASCII.
MIN_WORDS, MAX_WORDS = 5, 15

_RE_ASCII = re.compile(r"\A[\x20-\x7e]+\Z")
_RE_WORD = re.compile(r"[A-Za-z']+")
# Constructions we deliberately keep out of the *pilot* (they are the stress
# material for the scale-up, not the first 100).
_RE_REJECT = re.compile(
    r"["
    r"\"'`()\[\]{}<>*/\\|_#@~^]"          # quotes, brackets, markup
    r"|\d"                                  # digits — dates/numbers get their own study
    r"|\b(?:I|you|we|he|she|they|it|me|him|her|us|them|my|your|our|his|their)\b",
    re.IGNORECASE,
)
_RE_SENTENCE_END = re.compile(r"\A[A-Z].*\.\Z")
_RE_PROPER = re.compile(r"\b[A-Z][a-z]+\b")
#: capitalised words that are not proper nouns when sentence-initial
_SENTENCE_INITIAL_OK = frozenset(
    "The A An This That These Those There It He She They We You His Her Their Its Some Many Most "
    "Every Each No Not All Both One Two Three Four Five Six Seven Eight Nine Ten When While After "
    "Before If Because Although Since Until Once Nobody Everyone Someone Something Nothing".split()
)


def acceptable(text: str) -> bool:
    if not _RE_ASCII.match(text):
        return False
    if not _RE_SENTENCE_END.match(text):
        return False          # must be a capitalised, period-terminated declarative
    if _RE_REJECT.search(text):
        return False
    words = _RE_WORD.findall(text)
    if not (MIN_WORDS <= len(words) <= MAX_WORDS):
        return False
    if text.count(",") > 1:
        return False          # keep the pilot near one clause
    return True


def load_excluded() -> set:
    """Sentences already used as prompt examples, goldens or pilot items."""
    out = set()
    root = os.path.join(HERE, os.pardir, os.pardir)

    def norm(s):
        return re.sub(r"[^a-z0-9 ]", "", s.lower()).strip()

    for rel in ("prompt.txt", os.path.join("regression", "regression_cases.md")):
        path = os.path.join(root, rel)
        if os.path.exists(path):
            with open(path, "r", encoding="utf-8") as fh:
                for line in fh:
                    for m in re.findall(r"[A-Z][^.!?]{4,120}[.!?]", line):
                        out.add(norm(m))
    pilot = os.path.join(HERE, "pilot.jsonl")
    if os.path.exists(pilot):
        with open(pilot, "r", encoding="utf-8") as fh:
            for line in fh:
                for s in json.loads(line)["sentences"]:
                    out.add(norm(s))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dump", required=True, help="eng_sentences.tsv.bz2 from Tatoeba")
    ap.add_argument("--n", type=int, default=100)
    ap.add_argument("--max-per-name", type=int, default=3,
                    help="cap on how many selected sentences may share one proper noun")
    ap.add_argument("--out", default=os.path.join(HERE, "tierB.jsonl"))
    args = ap.parse_args()

    excluded = load_excluded()
    def norm(s):
        return re.sub(r"[^a-z0-9 ]", "", s.lower()).strip()

    pool, seen, scanned = [], set(), 0
    with bz2.open(args.dump, "rt", encoding="utf-8") as fh:
        for line in fh:
            scanned += 1
            parts = line.rstrip("\n").split("\t")
            if len(parts) != 3:
                continue
            sid, lang, text = parts
            if lang != "eng":
                continue
            text = text.strip()
            if not acceptable(text):
                continue
            key = norm(text)
            if key in seen or key in excluded:
                continue
            seen.add(key)
            pool.append((hashlib.sha256(text.encode("utf-8")).hexdigest(), sid, text))

    pool.sort()                       # deterministic order, no RNG

    # Tatoeba is dominated by a few contributors' stock characters: an uncapped
    # draw put "Tom" in 27 of 100 sentences and a stock name in 45. That is an
    # authorship artifact, and it lands exactly where it does most damage —
    # role-filler clustering (§4.3.2) keys on event-conditioned slot fillers, so
    # one symbol owning a quarter of the Agent slots makes the filler
    # distribution a fact about Tatoeba rather than about meaning. Cap each
    # proper noun greedily over the fixed hash order: still deterministic.
    picked, name_use = [], collections.Counter()
    for entry in pool:
        text = entry[2]
        names = [w for w in _RE_PROPER.findall(text) if w not in _SENTENCE_INITIAL_OK]
        if any(name_use[n] >= args.max_per_name for n in names):
            continue
        for n in names:
            name_use[n] += 1
        picked.append(entry)
        if len(picked) >= args.n:
            break

    records = []
    for i, (_h, sid, text) in enumerate(picked, 1):
        sentences = [text]
        context = {"today": None, "domain": None, "prior": [], "notes": None}
        records.append({
            "schema": "fusenf-corpus/1",
            "id": "tierB-%06d" % i,
            "source": "tatoeba",
            "source_id": sid,
            "source_license": "CC-BY 2.0 FR",
            "sentences": sentences,
            "context": context,
            "equiv_class": None,
            "labels": {"words": len(_RE_WORD.findall(text))},
            "input_sha256": input_sha256({"sentences": sentences, "context": context}),
        })
    with open(args.out, "w", encoding="utf-8") as fh:
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")

    lens = [r["labels"]["words"] for r in records]
    print("scanned   %d lines" % scanned)
    print("pool      %d acceptable (%.2f%%)" % (len(pool), 100.0 * len(pool) / max(scanned, 1)))
    print("selected  %d -> %s" % (len(records), args.out))
    print("words     min=%d median=%d max=%d" % (min(lens), sorted(lens)[len(lens) // 2], max(lens)))


if __name__ == "__main__":
    main()
