"""BATCH2_PLAN item C — the retro-AE acceptance test for the embedding prior.

The decisive question (pre-registered in the plan): on batch-1's judged AE novel pairs
(rules/validated2.jsonl, ae*: 2 validated synonyms vs 93 rejected scenario siblings),
does general-language embedding similarity separate them? Acceptance: some threshold
keeps BOTH validated pairs while killing >= 90% of the rejected 93. If it cannot
separate those, the channel is not ready regardless of benchmark scores.

Secondary table: Tier A ground-truth synonym targets vs antonym/near-miss controls —
expected to show the known embedding blindness (antonyms score high; that stays the
judges' job, the prior only kills siblings).

Writes out2/embed_eval_ae.json (+ eval/embed_pilot.md report).

Usage:
  /home/manhin/Dev/.venv-dev/bin/python embed_eval_ae.py --date 2026-08-21
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import time

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)

SYNONYM_TARGETS = [("buy", "purchase"), ("buy", "acquire"), ("repair", "fix"),
                   ("repair", "mend"), ("begin", "start"), ("begin", "commence"),
                   ("allow", "permit"), ("require", "need"), ("doctor", "physician"),
                   ("car", "automobile"), ("big", "large"), ("difficult", "hard")]
CONTROL_PAIRS = [("allow", "forbid"), ("abandon", "continue"), ("stroll", "sprint"),
                 ("rise", "fall"), ("begin", "end"), ("buy", "sell")]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--model", default="Qwen/Qwen3-Embedding-8B")
    ap.add_argument("--date", required=True)
    args = ap.parse_args()

    ae = []
    for l in open(os.path.join(FUSENF, "rules", "validated2.jsonl")):
        r = json.loads(l)
        if not r["id"].startswith("ae"):
            continue
        syms = sorted((r.get("provenance") or {}).get("examples_by_symbol") or {})
        ae.append({"id": r["id"], "status": r["status"], "pair": syms})

    words = sorted({w for e in ae for w in e["pair"]}
                   | {w for p in SYNONYM_TARGETS + CONTROL_PAIRS for w in p})
    texts = [w.replace("_", " ") for w in words]

    import numpy as np
    import torch
    from sentence_transformers import SentenceTransformer
    t0 = time.time()
    model = SentenceTransformer(args.model, device="cpu",
                                model_kwargs={"torch_dtype": torch.bfloat16})
    load_s = round(time.time() - t0, 1)
    t0 = time.time()
    emb = model.encode(texts, normalize_embeddings=True, batch_size=8)
    enc_s = round(time.time() - t0, 1)
    ix = {w: i for i, w in enumerate(words)}

    def cos(a, b):
        return round(float(np.dot(emb[ix[a]], emb[ix[b]])), 4)

    for e in ae:
        e["cosine"] = cos(*e["pair"])
    valid = [e for e in ae if e["status"] == "validated"]
    rejected = [e for e in ae if e["status"] == "rejected"]
    floor = min(e["cosine"] for e in valid)
    killed = [e for e in rejected if e["cosine"] < floor]
    kill_rate = len(killed) / len(rejected)
    survivors = sorted((e for e in rejected if e["cosine"] >= floor),
                       key=lambda e: -e["cosine"])

    out = {
        "date": args.date, "model": args.model, "dtype": "bfloat16",
        "emb_sha256": hashlib.sha256(emb.tobytes()).hexdigest(),
        "load_seconds": load_s, "encode_seconds": enc_s, "n_words": len(words),
        "valid_pairs": [{"pair": e["pair"], "cosine": e["cosine"]} for e in valid],
        "threshold_floor_of_valid": floor,
        "rejected_n": len(rejected), "killed_below_floor": len(killed),
        "kill_rate": round(kill_rate, 3),
        "acceptance_>=0.90": kill_rate >= 0.90,
        "surviving_siblings": [{"pair": e["pair"], "cosine": e["cosine"]} for e in survivors],
        "ae_pairs": ae,
        "synonym_targets": {f"{a}~{b}": cos(a, b) for a, b in SYNONYM_TARGETS},
        "control_pairs": {f"{a}~{b}": cos(a, b) for a, b in CONTROL_PAIRS},
    }
    op = os.path.join(HERE, "out2", "embed_eval_ae.json")
    json.dump(out, open(op, "w"), indent=1)

    L = [f"# Embedding prior pilot — retro-AE acceptance test ({args.date})", "",
         f"Model {args.model} (bf16, CPU; load {load_s}s, encode {len(words)} words {enc_s}s).",
         f"Embeddings sha256 `{out['emb_sha256'][:16]}…` (determinism pin).", "",
         f"**Acceptance: keep both validated pairs, kill >= 90% of the 93 rejected siblings.**", "",
         f"- validated pairs: " + ", ".join(f"{'/'.join(e['pair'])} @ {e['cosine']}" for e in valid),
         f"- threshold = floor of validated = **{floor}**",
         f"- siblings killed below it: **{len(killed)}/{len(rejected)} = {out['kill_rate']}**"
         f" -> acceptance {'**PASS**' if out['acceptance_>=0.90'] else '**FAIL**'}", ""]
    if survivors:
        L.append("Surviving siblings (above the floor):")
        for e in survivors:
            L.append(f"- {'/'.join(e['pair'])} @ {e['cosine']}")
        L.append("")
    L.append("## Secondary: Tier A ground truth (the prior's known blindness, measured)")
    L.append("| synonym target | cos | control (antonym/near-miss/converse) | cos |")
    L.append("|---|---|---|---|")
    st, cp = list(out["synonym_targets"].items()), list(out["control_pairs"].items())
    for i in range(max(len(st), len(cp))):
        a = f"{st[i][0]} | {st[i][1]}" if i < len(st) else " | "
        b = f"{cp[i][0]} | {cp[i][1]}" if i < len(cp) else " | "
        L.append(f"| {a} | {b} |")
    L.append("")
    L.append("Reading: the prior separates *scenario siblings* from synonyms; it does NOT separate "
             "antonyms/converses from synonyms (both are distributional neighbors) — that remains "
             "the judges' job. The prior is a candidate FILTER, never evidence.")
    rp = os.path.join(FUSENF, "eval", "embed_pilot.md")
    open(rp, "w").write("\n".join(L) + "\n")
    print(f"-> {op}\n-> {rp}")
    print(f"ACCEPTANCE: {'PASS' if out['acceptance_>=0.90'] else 'FAIL'} "
          f"(kill {len(killed)}/{len(rejected)}, floor {floor})")


if __name__ == "__main__":
    main()
