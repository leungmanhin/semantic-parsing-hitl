#!/usr/bin/env python3
"""Tier B — natural sentences from Tatoeba (CC-BY 2.0 FR).

Deterministic selection: the pool is ordered by sha256 of the sentence, not by a
seeded shuffle, so the same dump + the same filters always yield the same corpus
and no random state has to be carried anywhere.

    build_tierB.py --dump <eng_sentences.tsv.bz2> --n 100

Superset build (batch 2): carry an existing corpus verbatim and append to it —

    build_tierB.py --dump <fresh dump> --n 2000 --extend tierB.jsonl --relaxed \
        --date 2026-08-22 --manifest tierB_manifest.json

`--extend` keeps every existing record byte-identical (ids, sentences, hashes), excludes
their sentences from the pool, pre-seeds the proper-noun cap, and numbers new records
from the highest carried index + 1. `--relaxed` widens the filter deliberately (digits
allowed, up to two commas) while keeping the hard lines: ASCII, declarative, no
pronouns, no quotes/markup, 5-15 words. All existing corpora/*.jsonl sentences are
always excluded (a sentence lives in one tier only).

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
# Relaxed (batch-2 superset): digits admitted — dates, counts, measures are exactly the
# constructions the scale-up is meant to stress. Everything else stays rejected.
_RE_REJECT_RELAXED = re.compile(
    r"["
    r"\"'`()\[\]{}<>*/\\|_#@~^]"
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


def acceptable(text: str, relaxed: bool = False) -> bool:
    if not _RE_ASCII.match(text):
        return False
    if not _RE_SENTENCE_END.match(text):
        return False          # must be a capitalised, period-terminated declarative
    if (_RE_REJECT_RELAXED if relaxed else _RE_REJECT).search(text):
        return False
    words = _RE_WORD.findall(text)
    if not (MIN_WORDS <= len(words) <= MAX_WORDS):
        return False
    if text.count(",") > (2 if relaxed else 1):
        return False          # near one clause (relaxed: up to two commas)
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
    # every sentence already living in ANY corpus file — a sentence belongs to one tier
    for fn in sorted(os.listdir(HERE)):
        if not fn.endswith(".jsonl"):
            continue
        with open(os.path.join(HERE, fn), "r", encoding="utf-8") as fh:
            for line in fh:
                try:
                    rec = json.loads(line)
                except ValueError:
                    continue
                for s in rec.get("sentences") or []:
                    out.add(norm(s))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dump", required=True, help="eng_sentences.tsv.bz2 from Tatoeba")
    ap.add_argument("--n", type=int, default=100, help="TOTAL corpus size (carried + new)")
    ap.add_argument("--max-per-name", type=int, default=3,
                    help="cap on how many selected sentences may share one proper noun")
    ap.add_argument("--out", default=os.path.join(HERE, "tierB.jsonl"))
    ap.add_argument("--extend", default=None,
                    help="existing corpus jsonl carried VERBATIM; new ids continue its numbering")
    ap.add_argument("--relaxed", action="store_true",
                    help="batch-2 filter: digits allowed, up to two commas")
    ap.add_argument("--date", default=None, help="build date recorded in the manifest (no clock reads)")
    ap.add_argument("--manifest", default=None, help="write a dump/params/stats manifest JSON here")
    args = ap.parse_args()

    carried_lines, carried = [], []
    if args.extend:
        with open(args.extend, "r", encoding="utf-8") as fh:
            for line in fh:
                line = line.rstrip("\n")
                if not line:
                    continue
                carried_lines.append(line)
                carried.append(json.loads(line))

    excluded = load_excluded()        # includes every corpora/*.jsonl sentence (carried too)
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
            if not acceptable(text, relaxed=args.relaxed):
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
    # An extension pre-seeds the counter from the carried records, so the cap
    # holds over the WHOLE corpus, not per build.
    name_use = collections.Counter()
    for rec in carried:
        for s in rec.get("sentences") or []:
            for w in _RE_PROPER.findall(s):
                if w not in _SENTENCE_INITIAL_OK:
                    name_use[w] += 1

    n_new = args.n - len(carried)
    if n_new < 0:
        raise SystemExit("--n %d is smaller than the carried corpus (%d)" % (args.n, len(carried)))
    picked = []
    for entry in pool:
        text = entry[2]
        names = [w for w in _RE_PROPER.findall(text) if w not in _SENTENCE_INITIAL_OK]
        if any(name_use[n] >= args.max_per_name for n in names):
            continue
        for n in names:
            name_use[n] += 1
        picked.append(entry)
        if len(picked) >= n_new:
            break

    start = 1
    if carried:
        start = max(int(r["id"].rsplit("-", 1)[1]) for r in carried) + 1

    records = []
    for i, (_h, sid, text) in enumerate(picked, start):
        sentences = [text]
        context = {"today": None, "domain": None, "prior": [], "notes": None}
        labels = {"words": len(_RE_WORD.findall(text))}
        if args.relaxed:
            labels["filter"] = "relaxed"
        records.append({
            "schema": "fusenf-corpus/1",
            "id": "tierB-%06d" % i,
            "source": "tatoeba",
            "source_id": sid,
            "source_license": "CC-BY 2.0 FR",
            "sentences": sentences,
            "context": context,
            "equiv_class": None,
            "labels": labels,
            "input_sha256": input_sha256({"sentences": sentences, "context": context}),
        })
    with open(args.out, "w", encoding="utf-8") as fh:
        for line in carried_lines:    # byte-identical carry
            fh.write(line + "\n")
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")

    if args.manifest:
        h = hashlib.sha256()
        with open(args.dump, "rb") as fh:
            for chunk in iter(lambda: fh.read(1 << 20), b""):
                h.update(chunk)
        manifest = {
            "date": args.date,
            "dump_file": os.path.basename(args.dump),
            "dump_sha256": h.hexdigest(),
            "dump_bytes": os.path.getsize(args.dump),
            "dump_url": "https://downloads.tatoeba.org/exports/per_language/eng/eng_sentences.tsv.bz2",
            "params": {"n_total": args.n, "relaxed": bool(args.relaxed),
                       "max_per_name": args.max_per_name,
                       "extend": os.path.basename(args.extend) if args.extend else None},
            "scanned": scanned, "pool": len(pool),
            "carried": len(carried), "selected_new": len(records),
            "total": len(carried) + len(records),
        }
        with open(args.manifest, "w", encoding="utf-8") as fh:
            json.dump(manifest, fh, indent=1)
            fh.write("\n")

    lens = [r["labels"]["words"] for r in records] or [0]
    print("scanned   %d lines" % scanned)
    print("pool      %d acceptable (%.2f%%)" % (len(pool), 100.0 * len(pool) / max(scanned, 1)))
    print("carried   %d verbatim" % len(carried))
    print("selected  %d new -> %s (total %d)" % (len(records), args.out, len(carried) + len(records)))
    print("words     min=%d median=%d max=%d" % (min(lens), sorted(lens)[len(lens) // 2], max(lens)))


if __name__ == "__main__":
    main()
