"""Tier D — MRPC natural-paraphrase arm (owner decision G.6, 2026-08-25).

The lexically-rich pair source beside the PAWS held-out: MRPC pairs are
newswire paraphrases with real lexical variation (PAWS is adversarial
word-overlap by construction, which under-rewards lexical bridges — a
convergence null on PAWS alone is uninterpretable). Pilot scale per the G.6
decision: 75 paraphrase pairs + 50 labeled non-paraphrases (MRPC Quality=0)
as natural controls.

Source: `msr_paraphrase_test.txt` (MRPC TEST split, 1,725 pairs), pinned
in-repo; sha256 recorded in the manifest alongside the mirror URL and date.
License: MSR Paraphrase Corpus — Microsoft Research, research use.

Deterministic: light filters (5..30 words per sentence, printable text),
selection by sha256 hash order of the pair text (the tierC discipline —
no clock, no randomness). Record shape mirrors tierC exactly
(`fusenf-corpus/1`, equiv_class `pairD-XXXX`, sides a/b, per-record
`input_sha256`), so the M2/alignment harnesses consume it after the one-line
pair-prefix generalization ("pairC" -> ("pairC","pairD")).

Usage:  python build_tierD.py [--pos 75] [--neg 50] [--out tierD.jsonl]
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

_RE_WORD = re.compile(r"[A-Za-z][A-Za-z'-]*")
MIN_WORDS, MAX_WORDS = 5, 30


def ok(text):
    n = len(_RE_WORD.findall(text))
    return MIN_WORDS <= n <= MAX_WORDS and text.isprintable()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", default=os.path.join(HERE, "msr_paraphrase_test.txt"))
    ap.add_argument("--pos", type=int, default=75)
    ap.add_argument("--neg", type=int, default=50)
    ap.add_argument("--out", default=os.path.join(HERE, "tierD.jsonl"))
    ap.add_argument("--manifest", default=os.path.join(HERE, "tierD_manifest.json"))
    args = ap.parse_args()

    raw = open(args.source, encoding="utf-8-sig").read()
    src_sha = hashlib.sha256(open(args.source, "rb").read()).hexdigest()
    buckets = collections.defaultdict(list)
    n_rows = 0
    for line in raw.splitlines()[1:]:
        parts = line.split("\t")
        if len(parts) != 5:
            continue
        n_rows += 1
        label, _, _, a, b = parts
        a, b = a.strip(), b.strip()
        if not (ok(a) and ok(b)) or a == b:
            continue
        key = hashlib.sha256((a + "\t" + b).encode()).hexdigest()
        buckets[int(label)].append((key, a, b))

    def bag(t):
        return sorted(w.lower() for w in _RE_WORD.findall(t))

    records, pair_no, n = [], 0, 0
    stats = collections.Counter()
    for label, want in ((1, args.pos), (0, args.neg)):
        rows = sorted(buckets[label])[:want]          # deterministic: hash order
        for _key, a, b in rows:
            pair_no += 1
            pid = "pairD-%04d" % pair_no
            stats["identical_bag" if bag(a) == bag(b) else "lexical_diff"] += 1
            for side, text in (("a", a), ("b", b)):
                n += 1
                sentences, context = [text], {"today": None, "domain": None,
                                              "prior": [], "notes": None}
                records.append({
                    "schema": "fusenf-corpus/1",
                    "id": "tierD-%06d" % n,
                    "source": "msr-paraphrase-corpus-test",
                    "source_license": "MSR Paraphrase Corpus (Microsoft Research), research use",
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

    manifest = {
        "arm": "tierD-mrpc (G.6 owner decision 2026-08-25)",
        "source_file": os.path.basename(args.source),
        "source_sha256": src_sha,
        "source_rows": n_rows,
        "mirror_url": "https://raw.githubusercontent.com/wasiahmad/paraphrase_identification/master/dataset/msr-paraphrase-corpus/msr_paraphrase_test.txt",
        "fetched": "2026-08-25",
        "filters": {"min_words": MIN_WORDS, "max_words": MAX_WORDS,
                    "printable": True, "identical_dropped": True},
        "eligible": {"paraphrase": len(buckets[1]), "control": len(buckets[0])},
        "selected": {"paraphrase": args.pos, "control": args.neg},
        "lexical": dict(stats),
    }
    json.dump(manifest, open(args.manifest, "w", encoding="utf-8"),
              indent=1, sort_keys=True)
    print(f"-> {args.out}  ({len(records)} records, {pair_no} pairs)")
    print(f"-> {args.manifest}")
    print(f"eligible paraphrase {len(buckets[1])} / control {len(buckets[0])}; "
          f"lexical {dict(stats)}")


if __name__ == "__main__":
    main()
