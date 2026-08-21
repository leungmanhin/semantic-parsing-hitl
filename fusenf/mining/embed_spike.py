"""BATCH2_PLAN item C spike — can this machine run Qwen3-Embedding-8B usefully?

Loads the model bf16 on CPU (13GB RAM + 107GB swap: the load leans on swap by design —
speed is a non-issue for our offline-batch workload; determinism and completion are the
questions). Embeds a small word list, times load and encode, and checks in-process
rerun determinism. Writes everything to --out as JSON.

Usage:
  /home/manhin/Dev/.venv-dev/bin/python embed_spike.py --out out2/embed_spike.json
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import time

WORDS = ["car", "automobile", "doctor", "physician", "archive", "flood",
         "bank", "editor", "buy", "purchase", "big", "large", "rise", "fall",
         "rate of flow", "flow rate", "train station", "railway station"]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                                  "out2", "embed_spike.json"))
    ap.add_argument("--model", default="Qwen/Qwen3-Embedding-8B")
    args = ap.parse_args()

    import torch
    from sentence_transformers import SentenceTransformer

    r = {"model": args.model, "torch": torch.__version__, "device": "cpu", "dtype": "bfloat16"}
    t0 = time.time()
    model = SentenceTransformer(args.model, device="cpu",
                                model_kwargs={"torch_dtype": torch.bfloat16})
    r["load_seconds"] = round(time.time() - t0, 1)

    t0 = time.time()
    emb = model.encode(WORDS, normalize_embeddings=True, batch_size=4)
    r["encode_seconds_first"] = round(time.time() - t0, 1)
    r["dim"] = int(emb.shape[1])
    r["n_words"] = len(WORDS)

    t0 = time.time()
    emb2 = model.encode(WORDS, normalize_embeddings=True, batch_size=4)
    r["encode_seconds_second"] = round(time.time() - t0, 1)
    r["rerun_deterministic"] = bool((emb == emb2).all())
    r["emb_sha256"] = hashlib.sha256(emb.tobytes()).hexdigest()

    import numpy as np
    def cos(a, b):
        i, j = WORDS.index(a), WORDS.index(b)
        return round(float(np.dot(emb[i], emb[j])), 4)
    r["sanity_cosines"] = {
        "car~automobile (synonym)": cos("car", "automobile"),
        "doctor~physician (hypernym-ish)": cos("doctor", "physician"),
        "buy~purchase (synonym)": cos("buy", "purchase"),
        "rate of flow~flow rate (compound)": cos("rate of flow", "flow rate"),
        "train station~railway station": cos("train station", "railway station"),
        "archive~flood (sibling)": cos("archive", "flood"),
        "bank~editor (sibling)": cos("bank", "editor"),
        "big~large (synonym)": cos("big", "large"),
        "rise~fall (ANTONYM - expect embeddings to score this high; the judge's job, not the prior's)": cos("rise", "fall"),
    }
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w") as fh:
        json.dump(r, fh, indent=1)
    print(json.dumps(r, indent=1))


if __name__ == "__main__":
    main()
