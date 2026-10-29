#!/usr/bin/env python3
"""Fetch the public datasets the coverage sample and the mining substrate draw on, into
``datasets/<name>/``, and record each download's source and sha256 in ``datasets/<name>/SOURCE.json``.

Only the script, the README and the SOURCE records are versioned; the data stays local (see
``.gitignore``).  A re-run skips a file whose recorded hash still matches, and reports a file whose
hash has changed at the source instead of silently replacing it (``--refresh`` replaces it).

Sources, as verified when the registry was written:

* HotpotQA and WikiText-103 as parquet files on the Hugging Face hub (pyarrow reads them);
* CLUTRR, bAbI (task 1) and the OpenWebText slice through the hub's rows API, written as JSON lines;
* DROP from AI2's public bucket; CounterFact and zsRE from the ROME project's site; MQuAKE and GSM8K
  from their GitHub repositories; LAMBADA from OpenAI's public store; PG-19 from DeepMind's bucket.

The big corpora come in as SLICES: the default set is sized for inspection and a coverage sample;
``--all`` adds the training splits and larger slices.

    python datasets/fetch.py --list            # the registry
    python datasets/fetch.py                   # the default set
    python datasets/fetch.py hotpotqa clutrr   # some of it
    python datasets/fetch.py --all             # everything, including the large files
"""
from __future__ import annotations

import argparse
import hashlib
import io
import json
import os
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
UA = {"User-Agent": "semantic-parsing-hitl datasets/fetch.py"}
ROWS_API = "https://datasets-server.huggingface.co/rows"
HF_RESOLVE = "https://huggingface.co/datasets/{repo}/resolve/main/{path}"


def hf(repo: str, path: str) -> str:
    return HF_RESOLVE.format(repo=repo, path=path)


# name -> {homepage, license, notes, default: [item…], all: [item…]}
# item kinds: ("file", url, relpath) · ("zip", url, relpath-of-zip) · ("rows", dataset, config, split, n, relpath)
#             ("gcs_list", bucket_url, prefix, n, dirname)
REGISTRY = {
    "hotpotqa": {
        "homepage": "https://hotpotqa.github.io/", "license": "CC BY-SA 4.0",
        "notes": "Wikipedia-based multi-hop QA with supporting-fact sentences; the distractor setting. "
                 "Parquet columns: id, question, answer, type, level, supporting_facts, context.",
        "default": [("file", hf("hotpotqa/hotpot_qa", "distractor/validation-00000-of-00001.parquet"), "distractor.validation.parquet")],
        "all": [("file", hf("hotpotqa/hotpot_qa", "distractor/train-00000-of-00002.parquet"), "distractor.train-0.parquet"),
                ("file", hf("hotpotqa/hotpot_qa", "distractor/train-00001-of-00002.parquet"), "distractor.train-1.parquet")],
    },
    "drop": {
        "homepage": "https://allenai.org/data/drop", "license": "CC BY-SA 4.0",
        "notes": "Reading comprehension with discrete reasoning over paragraphs (numbers, dates, spans); "
                 "the zip holds drop_dataset_train.json and drop_dataset_dev.json.",
        "default": [("zip", "https://ai2-public-datasets.s3.amazonaws.com/drop/drop_dataset.zip", "drop_dataset.zip")],
        "all": [],
    },
    "clutrr": {
        "homepage": "https://github.com/facebookresearch/clutrr", "license": "CC BY-NC 4.0 (non-commercial; verify before any publication)",
        "notes": "Kinship stories with a queried relation; the generalization configurations (trained on chains of "
                 "length 2-3 or 2-4, tested on 2-10). Rows: id, story, query, target, target_text, clean_story.",
        "default": [("rows", "CLUTRR/v1", "gen_train23_test2to10", "test", 2000, "gen_train23_test2to10.test.jsonl"),
                    ("rows", "CLUTRR/v1", "gen_train23_test2to10", "validation", 2000, "gen_train23_test2to10.validation.jsonl"),
                    ("rows", "CLUTRR/v1", "gen_train234_test2to10", "test", 2000, "gen_train234_test2to10.test.jsonl")],
        "all": [("rows", "CLUTRR/v1", "gen_train23_test2to10", "train", 20000, "gen_train23_test2to10.train.jsonl"),
                ("rows", "CLUTRR/v1", "gen_train234_test2to10", "train", 20000, "gen_train234_test2to10.train.jsonl")],
    },
    "babi": {
        "homepage": "https://research.facebook.com/downloads/babi/", "license": "CC BY 3.0",
        "notes": "The twenty bAbI tasks; only task 1 (single supporting fact: location tracking) is served "
                 "by the hub's rows API — the original tarball's hosts no longer answer. Rows: story {id, type, text, "
                 "supporting_ids, answer}.",
        "default": [("rows", "facebook/babi_qa", "en-10k-qa1", "train", 2000, "en-10k-qa1.train.jsonl"),
                    ("rows", "facebook/babi_qa", "en-10k-qa1", "test", 2000, "en-10k-qa1.test.jsonl")],
        "all": [],
    },
    "counterfact": {
        "homepage": "https://rome.baulab.info/", "license": "MIT (the ROME release; verify)",
        "notes": "Counterfactual fact-editing records: a subject, a relation prompt, the true and the new target, "
                 "paraphrase and neighbourhood prompts, generation prompts.",
        "default": [("file", "https://rome.baulab.info/data/dsets/counterfact.json", "counterfact.json")],
        "all": [],
    },
    "zsre": {
        "homepage": "https://rome.baulab.info/", "license": "the ROME / MEND release; verify",
        "notes": "Zero-shot relation extraction as question-answer pairs, the MEND evaluation set used by ROME.",
        "default": [("file", "https://rome.baulab.info/data/dsets/zsre_mend_eval.json", "zsre_mend_eval.json")],
        "all": [],
    },
    "mquake": {
        "homepage": "https://github.com/princeton-nlp/MQuAKE", "license": "MIT (verify)",
        "notes": "Multi-hop questions over chains of edited facts: MQuAKE-CF-3k (counterfactual edits) and MQuAKE-T (temporal).",
        "default": [("file", "https://raw.githubusercontent.com/princeton-nlp/MQuAKE/main/datasets/MQuAKE-CF-3k.json", "MQuAKE-CF-3k.json"),
                    ("file", "https://raw.githubusercontent.com/princeton-nlp/MQuAKE/main/datasets/MQuAKE-T.json", "MQuAKE-T.json")],
        "all": [],
    },
    "lambada": {
        "homepage": "https://zenodo.org/record/2630551", "license": "CC BY 4.0 (the original release; the OpenAI copy of the test set)",
        "notes": "Discourse-dependent last-word prediction on narrative passages; the test set as distributed with GPT-2.",
        "default": [("file", "https://openaipublic.blob.core.windows.net/gpt-2/data/lambada_test.jsonl", "lambada_test.jsonl")],
        "all": [],
    },
    "wikitext-103": {
        "homepage": "https://huggingface.co/datasets/Salesforce/wikitext", "license": "CC BY-SA 3.0",
        "notes": "Good and featured Wikipedia articles, the raw (untokenized) variant; parquet column: text, one line per row "
                 "(headings, paragraphs, blank lines).",
        "default": [("file", hf("Salesforce/wikitext", "wikitext-103-raw-v1/validation-00000-of-00001.parquet"), "raw-v1.validation.parquet"),
                    ("file", hf("Salesforce/wikitext", "wikitext-103-raw-v1/test-00000-of-00001.parquet"), "raw-v1.test.parquet")],
        "all": [("file", hf("Salesforce/wikitext", "wikitext-103-raw-v1/train-00000-of-00002.parquet"), "raw-v1.train-0.parquet"),
                ("file", hf("Salesforce/wikitext", "wikitext-103-raw-v1/train-00001-of-00002.parquet"), "raw-v1.train-1.parquet")],
    },
    "openwebtext": {
        "homepage": "https://skylion007.github.io/OpenWebTextCorpus/", "license": "a web scrape of mixed provenance (the corpus tooling is MIT)",
        "notes": "Open reproduction of the GPT-2 training corpus: web pages linked from Reddit; a SLICE of documents from the start "
                 "of the hub's copy (rows: text).",
        "default": [("rows", "Skylion007/openwebtext", "plain_text", "train", 1000, "slice.train.jsonl")],
        "all": [("rows", "Skylion007/openwebtext", "plain_text", "train", 10000, "slice10k.train.jsonl")],
    },
    "pg19": {
        "homepage": "https://github.com/deepmind/pg19", "license": "Apache 2.0 (the release); the books are public domain (Project Gutenberg)",
        "notes": "Whole books published before 1919; the metadata and the first books of the validation fold, one text file each.",
        "default": [("file", "https://storage.googleapis.com/deepmind-gutenberg/metadata.csv", "metadata.csv"),
                    ("gcs_list", "https://storage.googleapis.com/deepmind-gutenberg", "validation/", 5, "validation")],
        "all": [("gcs_list", "https://storage.googleapis.com/deepmind-gutenberg", "validation/", 20, "validation")],
    },
    "gsm8k": {
        "homepage": "https://github.com/openai/grade-school-math", "license": "MIT",
        "notes": "Grade-school math word problems with worked answers (not a current NESS endpoint; the narrative "
                 "part is ordinary prose about quantities and transfers).",
        "default": [],
        "all": [("file", "https://raw.githubusercontent.com/openai/grade-school-math/master/grade_school_math/data/test.jsonl", "test.jsonl")],
    },
}


def sha256_of(path: str) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def get(url: str, timeout: int = 120, tries: int = 5) -> bytes:
    """GET with a retry on a server-side error (the hub's rows API answers 502 now and then)."""
    for attempt in range(tries):
        try:
            req = urllib.request.Request(url, headers=UA)
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return resp.read()
        except urllib.error.HTTPError as exc:
            if (exc.code < 500 and exc.code != 429) or attempt == tries - 1:
                raise
            wait = exc.headers.get("Retry-After") if exc.headers else None
            time.sleep(min(float(wait), 120.0) if wait and wait.isdigit() else 3 * 2 ** attempt)
    raise RuntimeError("unreachable")


def download(url: str, path: str) -> None:
    os.makedirs(os.path.dirname(path), exist_ok=True)
    req = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(req, timeout=300) as resp, open(path + ".part", "wb") as fh:
        for chunk in iter(lambda: resp.read(1 << 20), b""):
            fh.write(chunk)
    os.replace(path + ".part", path)


def fetch_rows(dataset: str, config: str, split: str, n: int, path: str) -> int:
    """Up to ``n`` rows of a hub dataset through the rows API, one JSON object per line."""
    os.makedirs(os.path.dirname(path), exist_ok=True)
    written, offset, total = 0, 0, None
    with open(path + ".part", "w", encoding="utf-8") as fh:
        while written < n and (total is None or offset < total):
            length = min(100, n - written)
            q = urllib.parse.urlencode({"dataset": dataset, "config": config, "split": split, "offset": offset, "length": length})
            data = json.loads(get(f"{ROWS_API}?{q}"))
            time.sleep(1.0)                           # the rows API rate-limits bursts
            if "rows" not in data:
                raise RuntimeError(f"rows API: {data.get('error') or data}")
            total = data.get("num_rows_total", total)
            rows = data["rows"]
            if not rows:
                break
            for r in rows:
                fh.write(json.dumps(r["row"], ensure_ascii=False) + "\n")
            written += len(rows)
            offset += len(rows)
    os.replace(path + ".part", path)
    return written


def gcs_keys(bucket_url: str, prefix: str, n: int) -> list[str]:
    q = urllib.parse.urlencode({"prefix": prefix, "max-keys": n})
    xml = get(f"{bucket_url}?{q}").decode("utf-8")
    return re.findall(r"<Key>([^<]+)</Key>", xml)[:n]


def load_source(ddir: str) -> dict:
    p = os.path.join(ddir, "SOURCE.json")
    if os.path.exists(p):
        with open(p, encoding="utf-8") as fh:
            return json.load(fh)
    return {}


def save_source(ddir: str, src: dict) -> None:
    with open(os.path.join(ddir, "SOURCE.json"), "w", encoding="utf-8") as fh:
        json.dump(src, fh, indent=2, ensure_ascii=False)
        fh.write("\n")


def fetch(name: str, full: bool, refresh: bool) -> list[str]:
    """Fetch one registry entry; progress is printed as it happens and the SOURCE record is saved
    after every item, so an interrupted run leaves a true account of what arrived."""
    spec = REGISTRY[name]
    ddir = os.path.join(HERE, name)
    os.makedirs(ddir, exist_ok=True)
    src = load_source(ddir)
    src.update({"name": name, "homepage": spec["homepage"], "license": spec["license"], "notes": spec["notes"]})
    files = {f["path"]: f for f in src.get("files", [])}
    log: list[str] = []
    items = list(spec["default"]) + (list(spec["all"]) if full else [])

    def say(line: str) -> None:
        print(line, flush=True)
        log.append(line)

    def flush() -> None:
        src["files"] = sorted(files.values(), key=lambda f: f["path"])
        save_source(ddir, src)

    def record(relpath: str, url: str, how: str, extra: dict | None = None) -> None:
        path = os.path.join(ddir, relpath)
        entry = {"path": relpath, "url": url, "how": how, "sha256": sha256_of(path), "bytes": os.path.getsize(path), **(extra or {})}
        prev = files.get(relpath)
        if prev and prev.get("sha256") != entry["sha256"]:
            say(f"  CHANGED at the source: {relpath} ({prev['sha256'][:12]} -> {entry['sha256'][:12]})")
        files[relpath] = entry

    def want(relpath: str) -> bool:
        path = os.path.join(ddir, relpath)
        if refresh or not os.path.exists(path):
            return True
        prev = files.get(relpath)
        if prev and prev.get("sha256") == sha256_of(path):
            say(f"  kept {relpath} ({prev['bytes']:,} bytes, hash unchanged)")
            return False
        return True

    for item in items:
        try:
            kind = item[0]
            if kind == "file":
                _, url, relpath = item
                if want(relpath):
                    download(url, os.path.join(ddir, relpath))
                    record(relpath, url, "download")
                    say(f"  fetched {relpath} ({files[relpath]['bytes']:,} bytes)")
            elif kind == "zip":
                _, url, relpath = item
                if want(relpath):
                    download(url, os.path.join(ddir, relpath))
                    record(relpath, url, "download")
                    with zipfile.ZipFile(os.path.join(ddir, relpath)) as zf:
                        zf.extractall(ddir)
                        names = [n for n in zf.namelist() if not n.endswith("/")]
                    files[relpath]["extracted"] = names
                    say(f"  fetched {relpath} ({files[relpath]['bytes']:,} bytes) and extracted {len(names)} files")
            elif kind == "rows":
                _, dataset, config, split, n, relpath = item
                if want(relpath):
                    got = fetch_rows(dataset, config, split, n, os.path.join(ddir, relpath))
                    record(relpath, f"{ROWS_API}?dataset={dataset}&config={config}&split={split}", "rows API", {"rows": got, "requested": n})
                    say(f"  fetched {relpath} ({got} rows)")
            elif kind == "gcs_list":
                _, bucket, prefix, n, dirname = item
                for key in gcs_keys(bucket, prefix, n):
                    relpath = os.path.join(dirname, os.path.basename(key))
                    url = f"{bucket}/{key}"
                    if want(relpath):
                        download(url, os.path.join(ddir, relpath))
                        record(relpath, url, "download")
                        say(f"  fetched {relpath} ({files[relpath]['bytes']:,} bytes)")
            else:
                raise ValueError(kind)
        finally:
            flush()
    return log


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="fetch the public datasets into datasets/<name>/ and record their sources")
    ap.add_argument("names", nargs="*", help="dataset names (default: the whole registry)")
    ap.add_argument("--all", action="store_true", help="also the large files and the bigger slices")
    ap.add_argument("--refresh", action="store_true", help="re-download files that exist")
    ap.add_argument("--list", action="store_true", help="print the registry and exit")
    args = ap.parse_args(argv)
    if args.list:
        for name, spec in REGISTRY.items():
            d = len(spec["default"]); a = len(spec["all"])
            print(f"{name:14s} {spec['license']:60s} default {d} item(s), --all +{a}")
        return 0
    names = args.names or list(REGISTRY)
    unknown = [n for n in names if n not in REGISTRY]
    if unknown:
        print("unknown dataset(s): " + ", ".join(unknown), file=sys.stderr)
        return 2
    rc = 0
    for name in names:
        print(f"{name}:", flush=True)
        try:
            fetch(name, args.all, args.refresh)
        except Exception as exc:  # one dataset's failure does not stop the others
            print(f"  FAILED: {type(exc).__name__}: {exc}")
            rc = 1
    return rc


if __name__ == "__main__":
    sys.exit(main())
