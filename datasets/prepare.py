#!/usr/bin/env python3
"""Turn the fetched datasets into ONE standard format the parser reads: JSON lines, one SENTENCE per
record, every record self-describing, one file per dataset and split under ``datasets/prepared/``.

The record::

    {"id": "hotpotqa-validation-5a8b57f2-002",   # dataset-split-document-sentence
     "dataset": "hotpotqa", "split": "validation",
     "doc": "5a8b57f2…",                          # the native document / passage / story / book id
     "title": "Scott Derrickson",                 # when the source has one
     "sent": 2,                                   # the sentence's index within its document: the availability boundary
     "text": "…",                                 # the sentence as the parser will see it
     "prev": ["…", "…"],                          # up to two preceding sentences of the same document, for context later
     "register": "encyclopedic",                  # the coarse register, for the mix
     "domain": "history",                         # a finer label where the source has one
     "task": {...}}                               # pointers into the dataset's task (a question id, a queried relation); never parsed

Per-source cleaning lives in the adapters: WikiText is detokenized, PG-19 unwrapped with the
Gutenberg matter dropped, CLUTRR's bracketed names stripped, LAMBADA passages with explicit content
left out, web text kept to sentences of plausible shape, bAbI statements separated from their
questions.  One shared rule-based sentence splitter cuts every source the same way.

    python datasets/prepare.py            # every adapter
    python datasets/prepare.py drop pg19  # some of them
"""
from __future__ import annotations

import argparse
import csv
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "prepared")

# ------------------------------------------------------------------ the shared splitter
ABBREV = {"mr", "mrs", "ms", "dr", "prof", "sr", "jr", "st", "mt", "no", "vs", "etc", "e.g", "i.e", "inc", "ltd", "co",
          "corp", "u.s", "u.k", "u.n", "a.m", "p.m", "jan", "feb", "mar", "apr", "jun", "jul", "aug", "sep", "sept", "oct",
          "nov", "dec", "gen", "col", "capt", "lt", "sgt", "rev", "hon", "ave", "blvd", "rd", "ft", "mi", "km", "approx",
          "ca", "cf", "ed", "eds", "fig", "op", "pp", "vol", "ch", "sec", "al", "govt", "dept", "univ", "bros", "mme", "mlle"}
_BOUNDARY = re.compile(r'([.!?]+["\')\]]*)\s+(?=["\'(\[“‘]?[A-Z0-9])')


def split_sentences(text: str) -> list[str]:
    """Rule-based sentence splitting: a boundary is end punctuation (with closing quotes or brackets)
    followed by space and a capital, a digit or an opening quote — unless the token before the stop
    is a known abbreviation or a single initial."""
    text = re.sub(r"\s+", " ", text).strip()
    if not text:
        return []
    out, start = [], 0
    for m in _BOUNDARY.finditer(text):
        end = m.end(1)
        before = text[start:end].rstrip()
        last = re.search(r"([A-Za-z.]+)[.!?]+[\"')\]]*$", before)
        if last:
            token = last.group(1).lower().rstrip(".")
            if token in ABBREV or re.fullmatch(r"[a-z]", token) or re.fullmatch(r"(?:[a-z]\.)+[a-z]?", token):
                continue
        out.append(before)
        start = m.end()
    tail = text[start:].strip()
    if tail:
        out.append(tail)
    return [s for s in out if s]


def plausible(s: str, lo: int = 4, hi: int = 70) -> bool:
    """A sentence worth sending to the parser: a plausible length, mostly letters, ending in a stop, no URL."""
    words = s.split()
    if not (lo <= len(words) <= hi) or "http" in s or "www." in s:
        return False
    letters = sum(c.isalpha() for c in s)
    return letters / max(1, len(s)) >= 0.6 and s[-1] in '.!?"\'' and (s[0].isupper() or s[0] in '"\'“‘(')


def detok(s: str) -> str:
    """Undo Moses tokenization (WikiText): the @-@ joins, spaces before punctuation and clitics, quotes."""
    s = s.replace(" @-@ ", "-").replace(" @,@ ", ",").replace(" @.@ ", ".")
    s = re.sub(r" ([,.;:!?%)\]])", r"\1", s)
    s = re.sub(r"([(\[$£€]) ", r"\1", s)
    s = re.sub(r" (n't|'s|'re|'ve|'ll|'d|'m)\b", r"\1", s)
    out, open_q = [], True
    for ch in s:
        if ch == '"':
            out.append('"' if open_q else '"'); open_q = not open_q
        else:
            out.append(ch)
    s = "".join(out)
    s = re.sub(r'" (\S)', r'"\1', s)          # an opening quote hugs the next word
    s = re.sub(r'(\S) "', r'\1"', s)          # a closing quote hugs the previous word (every other quote)
    return re.sub(r"\s+", " ", s).strip()


# ------------------------------------------------------------------ records
def rec(dataset: str, split: str, doc: str, sent: int, text: str, prev: list[str], register: str,
        title: str | None = None, domain: str | None = None, task: dict | None = None) -> dict:
    d = re.sub(r"[^A-Za-z0-9]+", "", str(doc))[:16] or "0"
    r = {"id": f"{dataset}-{split}-{d}-{sent:03d}", "dataset": dataset, "split": split, "doc": str(doc), "sent": sent,
         "text": text, "prev": prev[-2:], "register": register}
    if title:
        r["title"] = title
    if domain:
        r["domain"] = domain
    if task:
        r["task"] = task
    return r


def from_document(dataset: str, split: str, doc: str, text_or_sents, register: str, title=None, domain=None, task=None,
                  cap: int | None = None, keep=plausible) -> list[dict]:
    sents = text_or_sents if isinstance(text_or_sents, list) else split_sentences(text_or_sents)
    out, prev = [], []
    for i, s in enumerate(sents):
        if keep is None or keep(s):
            out.append(rec(dataset, split, doc, i, s, prev, register, title, domain, task))
        prev.append(s)
        if cap and len(out) >= cap:
            break
    return out


def write(name: str, split: str, records: list[dict]) -> str:
    os.makedirs(OUT, exist_ok=True)
    path = os.path.join(OUT, f"{name}.{split}.jsonl")
    with open(path, "w", encoding="utf-8") as fh:
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
    return path


# ------------------------------------------------------------------ adapters
def hotpotqa() -> list[tuple[str, list[dict]]]:
    import pandas as pd
    df = pd.read_parquet(os.path.join(HERE, "hotpotqa", "distractor.validation.parquet"))
    out, seen = [], set()
    for _, q in df.iterrows():
        ctx = {t: list(s) for t, s in zip(q["context"]["title"], q["context"]["sentences"])}
        for t, i in zip(q["supporting_facts"]["title"], q["supporting_facts"]["sent_id"]):
            if t not in ctx or i >= len(ctx[t]) or (t, i) in seen:
                continue
            seen.add((t, i))
            text = re.sub(r"\s+", " ", ctx[t][i]).strip()
            if not plausible(text, lo=3, hi=90):
                continue
            prev = [re.sub(r"\s+", " ", x).strip() for x in ctx[t][max(0, i - 2):i]]
            out.append(rec("hotpotqa", "validation", t, int(i), text, prev, "encyclopedic", title=t,
                           task={"kind": "supporting_fact", "question_id": q["id"], "question": q["question"],
                                 "answer": q["answer"], "type": q["type"]}))
    return [("validation", out)]


def drop() -> list[tuple[str, list[dict]]]:
    dev = json.load(open(os.path.join(HERE, "drop", "drop_dataset", "drop_dataset_dev.json"), encoding="utf-8"))
    out = []
    for pid, v in dev.items():
        domain = pid.split("_")[0]
        out.extend(from_document("drop", "dev", pid, v["passage"], "sports-recap" if domain == "nfl" else "encyclopedic",
                                 domain=domain, task={"kind": "passage", "questions": len(v["qa_pairs"])}))
    return [("dev", out)]


def wikitext() -> list[tuple[str, list[dict]]]:
    import pandas as pd
    res = []
    for split in ("validation", "test"):
        rows = pd.read_parquet(os.path.join(HERE, "wikitext-103", f"raw-v1.{split}.parquet"))["text"].tolist()
        out, title, para = [], None, 0
        for line in rows:
            m = re.fullmatch(r"\s*= ([^=].*?) =\s*", line)
            if m:
                title, para = m.group(1).strip(), 0
                continue
            if re.fullmatch(r"\s*= =.*", line) or not line.strip() or title is None:
                continue
            out.extend(from_document("wikitext-103", split, f"{title}#{para}", detok(line), "encyclopedic", title=title))
            para += 1
        res.append((split, out))
    return res


def openwebtext() -> list[tuple[str, list[dict]]]:
    out = []
    with open(os.path.join(HERE, "openwebtext", "slice.train.jsonl"), encoding="utf-8") as fh:
        for n, line in enumerate(fh):
            text = json.loads(line)["text"]
            sents = [s for p in re.split(r"\n\s*\n", text) for s in split_sentences(p)]
            out.extend(from_document("openwebtext", "slice", str(n), sents, "web", cap=40))
    return [("slice", out)]


def pg19() -> list[tuple[str, list[dict]]]:
    meta = {}
    with open(os.path.join(HERE, "pg19", "metadata.csv"), encoding="utf-8") as fh:
        for row in csv.reader(fh):
            if row:
                meta[row[0]] = row[1]
    out = []
    folder = os.path.join(HERE, "pg19", "validation")
    for fn in sorted(os.listdir(folder)):
        bid = fn[:-4]
        raw = open(os.path.join(folder, fn), encoding="utf-8", errors="replace").read()
        raw = re.split(r"\*\*\* ?END OF|End of (the )?Project Gutenberg", raw)[0]
        paras = [re.sub(r"\s+", " ", p).strip() for p in re.split(r"\n\s*\n", raw)]
        body = [p for p in paras if len(p.split()) >= 12 and not p.isupper()]     # skip front matter, headings, verse
        sents = [s for p in body for s in split_sentences(p)]
        out.extend(from_document("pg19", "validation", bid, sents, "book", title=meta.get(bid), cap=600))
    return [("validation", out)]


def clutrr() -> list[tuple[str, list[dict]]]:
    res = []
    for cfg, split in (("gen_train23_test2to10", "test"), ("gen_train23_test2to10", "validation"), ("gen_train234_test2to10", "test")):
        out = []
        with open(os.path.join(HERE, "clutrr", f"{cfg}.{split}.jsonl"), encoding="utf-8") as fh:
            for line in fh:
                r = json.loads(line)
                story = re.sub(r"\[([^\]]+)\]", r"\1", r["clean_story"])
                out.extend(from_document("clutrr", f"{cfg}.{split}", r["id"], story, "synthetic-kinship",
                                         task={"kind": "relation", "query": list(r["query"]) if not isinstance(r["query"], str) else r["query"],
                                               "target": r["target_text"]}, keep=lambda s: plausible(s, lo=3)))
        res.append((f"{cfg}.{split}", out))
    return res


def babi() -> list[tuple[str, list[dict]]]:
    res = []
    for split in ("train", "test"):
        out = []
        with open(os.path.join(HERE, "babi", f"en-10k-qa1.{split}.jsonl"), encoding="utf-8") as fh:
            for n, line in enumerate(fh):
                st = json.loads(line)["story"]
                statements = [t for t, ty in zip(st["text"], st["type"]) if ty == 0]
                questions = [{"question": t, "answer": a, "supporting": s} for t, ty, a, s in
                             zip(st["text"], st["type"], st["answer"], st["supporting_ids"]) if ty == 1]
                out.extend(from_document("babi", f"qa1.{split}", str(n), statements, "synthetic-world",
                                         domain="qa1", task={"kind": "where", "questions": questions}, keep=lambda s: plausible(s, lo=3)))
        res.append((f"qa1.{split}", out))
    return res


EXPLICIT_TERMS = ("nipple", "ni**le", "cock", "pussy", "fuck", "orgasm", "thrust", "moan", "erection", "breasts", "naked", "sex ")


def lambada() -> list[tuple[str, list[dict]]]:
    out = []
    with open(os.path.join(HERE, "lambada", "lambada_test.jsonl"), encoding="utf-8") as fh:
        for n, line in enumerate(fh):
            text = json.loads(line)["text"]
            low = text.lower()
            if any(t in low for t in EXPLICIT_TERMS):
                continue
            sents = [s for p in re.split(r"\n\s*\n", text) for s in split_sentences(p)]
            out.extend(from_document("lambada", "test", str(n), sents, "fiction"))
    return [("test", out)]


ADAPTERS = {"hotpotqa": hotpotqa, "drop": drop, "wikitext-103": wikitext, "openwebtext": openwebtext, "pg19": pg19,
            "clutrr": clutrr, "babi": babi, "lambada": lambada}


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="prepare the fetched datasets into the standard per-sentence format")
    ap.add_argument("names", nargs="*", help="dataset names (default: all adapters)")
    ap.add_argument("--show", type=int, default=0, help="print this many records per file")
    args = ap.parse_args(argv)
    names = args.names or list(ADAPTERS)
    unknown = [n for n in names if n not in ADAPTERS]
    if unknown:
        print("no adapter for: " + ", ".join(unknown), file=sys.stderr)
        return 2
    for name in names:
        for split, records in ADAPTERS[name]():
            path = write(name, split, records)
            docs = len({r["doc"] for r in records})
            print(f"{os.path.relpath(path, HERE)}: {len(records)} sentences from {docs} documents")
            for r in records[: args.show]:
                print("   ", json.dumps({k: r[k] for k in ("id", "text")}, ensure_ascii=False)[:220])
    return 0


if __name__ == "__main__":
    sys.exit(main())
