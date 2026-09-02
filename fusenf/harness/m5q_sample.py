"""M5 question arm — record sampling + QGEN batch construction (item F).

PRE-#50 HARNESS (2026-09-01): measures the RETIRED faithful+bridges serving
layout. Superseded by the consolidation-only design (consolidated view +
query-side normalization) — rework against harness/normalize_query.py before
running at item H; kept meanwhile because batch-1 reports cite its numbers.
Deterministic, orchestrator-side (the writers never see strata): from a canon
file + its corpus, pick N_BRIDGE records whose atoms contain at least one
bridging-rule lexeme (stratified round-robin across lexemes, so one hot verb
cannot monopolize the sample) and N_CONTROL records containing none (the
fabrication-analog arm). Positive-polarity records only — negated/modal
variants cannot support clean wh-questions.

Writes `batches/question/qg-NN.txt` (5-item TSV batches) and seeds
`questions/manifest.json` with the sample, strata, lexeme map, and the frozen
brief hashes (freeze-before-dispatch applies to QGEN.md/QPARSE.md too).

Usage:
  python m5q_sample.py --canon ../canonical/tierA.canon.jsonl \
      --corpus ../corpora/tierA.jsonl --bridges ../rules/mined_bridges_wave1.metta \
      --bridges ../rules/mined_bridges_wave2.metta --bridges ../rules/mined_bridges_wave3.metta
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def sha(path):
    return hashlib.sha256(open(path, "rb").read()).hexdigest()


def bridge_lexemes(paths):
    lex = set()
    for p in paths:
        for line in open(p, encoding="utf-8"):
            s = line.strip()
            if s.startswith(";") or not s:
                continue
            for m in re.finditer(r"\(Member \$\w+ ([a-z_0-9]+)\)", s):
                lex.add(m.group(1))
    return sorted(lex)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--canon", required=True)
    ap.add_argument("--corpus", required=True)
    ap.add_argument("--bridges", action="append", required=True)
    ap.add_argument("--n-bridge", type=int, default=30)
    ap.add_argument("--n-control", type=int, default=10)
    ap.add_argument("--batch-size", type=int, default=5)
    args = ap.parse_args()

    lex = bridge_lexemes(args.bridges)
    lex_re = {l: re.compile(r"(?<![\w$])" + re.escape(l) + r"(?![\w])") for l in lex}
    meta = {r["id"]: r for r in load(args.corpus)}
    canon = {r["id"]: r for r in load(args.canon)}

    eligible = {}
    for cid in sorted(canon):
        m = meta.get(cid)
        if not m or m.get("labels", {}).get("polarity") != "same":
            continue
        text = " ".join(m["sentences"])
        hits = sorted({l for l in lex
                       if any(lex_re[l].search(a["term"]) for a in canon[cid]["atoms"])})
        eligible[cid] = {"text": text, "lexemes": hits}

    by_lex = {}
    for cid, e in eligible.items():
        for l in e["lexemes"]:
            by_lex.setdefault(l, []).append(cid)

    picked_bridge, seen = [], set()
    while len(picked_bridge) < args.n_bridge:
        progress = False
        for l in sorted(by_lex):
            cand = next((c for c in sorted(by_lex[l]) if c not in seen), None)
            if cand:
                picked_bridge.append(cand)
                seen.add(cand)
                progress = True
                if len(picked_bridge) == args.n_bridge:
                    break
        if not progress:
            break
    picked_control = [cid for cid in sorted(eligible)
                      if not eligible[cid]["lexemes"] and cid not in seen][:args.n_control]

    sample = [(cid, "bridge") for cid in picked_bridge] + \
             [(cid, "control") for cid in picked_control]
    sample.sort()

    bdir = os.path.join(FUSENF, "batches", "question")
    os.makedirs(bdir, exist_ok=True)
    os.makedirs(os.path.join(FUSENF, "questions"), exist_ok=True)
    os.makedirs(os.path.join(FUSENF, "queries"), exist_ok=True)
    batches = []
    for i in range(0, len(sample), args.batch_size):
        name = "qg-%02d.txt" % (len(batches) + 1)
        with open(os.path.join(bdir, name), "w", encoding="utf-8") as fh:
            for cid, _ in sample[i:i + args.batch_size]:
                fh.write("%s\t%s\n" % (cid, eligible[cid]["text"]))
        batches.append(name)

    manifest = {
        "arm": "m5-questions",
        "canon": os.path.basename(args.canon),
        "bridge_files": [os.path.basename(p) for p in args.bridges],
        "bridge_lexemes": lex,
        "qgen_sha256": sha(os.path.join(FUSENF, "QGEN.md")),
        "qparse_sha256": sha(os.path.join(FUSENF, "QPARSE.md")),
        "sample": [{"id": cid, "stratum": s, "lexemes": eligible[cid]["lexemes"]}
                   for cid, s in sample],
        "qgen_batches": batches,
    }
    mpath = os.path.join(FUSENF, "questions", "manifest.json")
    json.dump(manifest, open(mpath, "w", encoding="utf-8"), indent=1, sort_keys=True)
    print(f"-> {mpath}")
    print(f"sample {len(sample)} = {len(picked_bridge)} bridge + {len(picked_control)} control; "
          f"batches {len(batches)}; lexemes attested {len(by_lex)}/{len(lex)}")


if __name__ == "__main__":
    main()
