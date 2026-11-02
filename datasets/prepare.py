#!/usr/bin/env python3
"""Turn the fetched datasets into ONE standard format the parser reads: JSON lines, one SENTENCE per
record, every record self-describing, one file per dataset and split under ``datasets/prepared/``.

The record::

    {"id": "hotpotqa-validation-ScottDerri4f1c2a-002",  # dataset-split-block-sentence, unique
     "dataset": "hotpotqa", "split": "validation",
     "doc": "Scott Derrickson",                   # the BLOCK: the native paragraph / passage / story / page id
     "title": "Scott Derrickson",                 # when the source has one
     "sent": 2,                                   # the sentence's index within its block: the availability boundary
     "text": "…",                                 # the sentence as the parser will see it
     "family": "hotpotqa:Scott Derrickson",       # the unit no split may cut (see below)
     "role": "evaluate",                          # the family's role (see below)
     "register": "encyclopedic",                  # the coarse register, for the mix
     "domain": "history",                         # a finer label where the source has one
     "task": {...}}                               # pointers into the dataset's task (queried relations, questions); never parsed

The parser's context for a sentence is every earlier sentence of the same block (same ``doc``, lower
``sent``), taken from the prepared file in order.

FAMILY = the unit that must stay on one side of every split: everything that shares content — a
Wikipedia article (HotpotQA, WikiText), a passage (DROP, by its text, so a passage repeated under two
ids is one family), a story (CLUTRR by its text, bAbI), a web page, a book; for the paraphrase sets
the sentences joined by pairs (MRPC), and for SICK also the sentences rewritten from one caption.

ROLE = the family's role, assigned here by fixed rules so that no family is both mined and evaluated:
``mine`` (mining material), ``evaluate`` (the held-out pool; each experiment draws its fitting,
admission and test sets from it, by family), ``control`` (general text for the do-no-harm checks;
never mined), ``later`` (not in the current plan), ``spent`` (a family the coverage sample in
``datasets/sample/`` drew from: the catalog was tuned on it, so it is never evaluated). The rules
per dataset are in each adapter's docstring.

Auxiliary files beside the sentences: ``<dataset>.pairs.jsonl`` (MRPC, SICK: one record per labelled
pair, naming its two sentences by block id) and ``hotpotqa.validation.questions.jsonl`` (the
questions with their answers, supporting facts, gold and distractor articles, and whether every gold
article is in the evaluation pool).

Per-source cleaning lives in the adapters: WikiText is detokenized, PG-19 unwrapped with the
Gutenberg matter dropped, CLUTRR's bracketed names stripped, LAMBADA passages with explicit content
left out, web text kept to sentences of plausible shape, bAbI statements separated from their
questions.  One shared rule-based sentence splitter cuts every source the same way.

    python datasets/prepare.py                          # every adapter
    python datasets/prepare.py drop pg19                # some of them
    python datasets/prepare.py hotpotqa --hotpotqa-pool 40000   # a larger HotpotQA mining pool
"""
from __future__ import annotations

import argparse
import collections
import csv
import hashlib
import io
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "prepared")
SAMPLE = os.path.join(HERE, "sample", "coverage-sample.jsonl")
HOTPOT_POOL = 20000            # train articles in the HotpotQA mining pool (~4 sentences each)

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


def clean(s: str) -> str:
    return re.sub(r"\s+", " ", s).strip()


def digest(s: str, n: int = 12) -> str:
    return hashlib.sha1(s.encode("utf-8")).hexdigest()[:n]


def components(edges) -> dict:
    """Connected components of an undirected graph given as node pairs: node -> a stable component id
    (the smallest member, as a string), so the grouping does not depend on the input order."""
    parent: dict = {}

    def find(x):
        parent.setdefault(x, x)
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    for a, b in edges:
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[max(ra, rb)] = min(ra, rb)
    return {x: find(x) for x in parent}


# ------------------------------------------------------------------ records
def rec(dataset: str, split: str, doc: str, sent: int, text: str, register: str, family: str, role: str,
        title: str | None = None, domain: str | None = None, task: dict | None = None) -> dict:
    d = re.sub(r"[^A-Za-z0-9]+", "", str(doc))
    if d != str(doc) or len(d) > 16:                 # a title or a long id: keep it readable and unique
        d = d[:10] + digest(str(doc), 6)
    r = {"id": f"{dataset}-{split}-{d or '0'}-{sent:03d}", "dataset": dataset, "split": split, "doc": str(doc),
         "sent": sent, "text": text, "family": family, "role": role, "register": register}
    if title:
        r["title"] = title
    if domain:
        r["domain"] = domain
    if task:
        r["task"] = task
    return r


def from_document(dataset: str, split: str, doc: str, text_or_sents, register: str, family: str, role: str,
                  title=None, domain=None, task=None, cap: int | None = None, keep=plausible) -> list[dict]:
    sents = text_or_sents if isinstance(text_or_sents, list) else split_sentences(text_or_sents)
    out = []
    for i, s in enumerate(sents):
        if keep is None or keep(s):
            out.append(rec(dataset, split, doc, i, s, register, family, role, title, domain, task))
        if cap and len(out) >= cap:
            break
    return out


def _consumed() -> list[dict]:
    """The coverage sample's records: the blocks they were drawn from are spent."""
    if not os.path.exists(SAMPLE):
        return []
    with open(SAMPLE, encoding="utf-8") as fh:
        return [r for r in map(json.loads, fh) if r.get("dataset")]


CONSUMED = _consumed()
UNMATCHED: list[str] = []          # sample records whose block was not found (reported by main)


def spend(dataset: str, files: list[tuple[str, list[dict]]], aliases: dict | None = None) -> set:
    """Mark every family the coverage sample DREW FROM — the block named by the sample record's split
    and doc, not every block that happens to repeat one of its sentences (templated stories repeat
    sentences everywhere) — as spent: never evaluated. ``aliases`` maps other (split, doc) names of a
    block to its family (a CLUTRR story asked under several row ids). Returns the spent families."""
    where = {(sp, r["doc"]): r["family"] for sp, recs in files for r in recs if "doc" in r and "family" in r}
    where.update(aliases or {})
    spent = set()
    for c in CONSUMED:
        if c["dataset"] == dataset:
            f = where.get((c.get("split"), c.get("doc")))
            if f:
                spent.add(f)
            else:
                UNMATCHED.append(c.get("id", "?"))
    for _, recs in files:
        for r in recs:
            if r.get("family") in spent and r.get("role") in ("evaluate", "mine"):
                r["role"] = "spent"
    return spent


def write(name: str, split: str, records: list[dict]) -> str:
    os.makedirs(OUT, exist_ok=True)
    ids = [r["id"] for r in records if "id" in r]
    dup = [k for k, n in collections.Counter(ids).items() if n > 1]
    if dup:
        raise ValueError(f"{name}.{split}: duplicate record ids, e.g. {dup[:3]}")
    path = os.path.join(OUT, f"{name}.{split}.jsonl")
    with open(path, "w", encoding="utf-8") as fh:
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
    return path


# ------------------------------------------------------------------ adapters
def hotpotqa(pool: int = HOTPOT_POOL) -> list[tuple[str, list[dict]]]:
    """Whole lead paragraphs, one block per Wikipedia article (family = the article title).
    validation: the GOLD articles of every question → evaluate; every article in any validation
    question's context (gold or distractor) is reserved. train: a deterministic pool of gold articles
    of train questions (questions in the order of their id's hash), none of them reserved → mine.
    questions file: each validation question, with `usable` = every gold article is still evaluate."""
    import pyarrow.parquet as pq

    def rows(paths, cols):
        for path in paths:
            for b in pq.ParquetFile(path).iter_batches(columns=cols, batch_size=2000):
                yield from b.to_pylist()

    keep = lambda s: plausible(s, lo=3, hi=90)
    val_path = [os.path.join(HERE, "hotpotqa", "distractor.validation.parquet")]
    reserved, gold, questions = set(), {}, []
    for q in rows(val_path, ["id", "question", "answer", "type", "level", "supporting_facts", "context"]):
        ctx = dict(zip(q["context"]["title"], q["context"]["sentences"]))
        reserved.update(ctx)
        g = list(dict.fromkeys(q["supporting_facts"]["title"]))
        for t in g:
            if t in ctx and t not in gold:
                gold[t] = [clean(s) for s in ctx[t]]
        questions.append({"question_id": q["id"], "question": q["question"], "answer": q["answer"], "type": q["type"],
                          "level": q["level"], "supporting": [[t, int(i)] for t, i in
                                                              zip(q["supporting_facts"]["title"], q["supporting_facts"]["sent_id"])],
                          "gold": g, "distractors": [t for t in q["context"]["title"] if t not in g]})
    val = [r for t, sents in gold.items()
           for r in from_document("hotpotqa", "validation", t, sents, "encyclopedic", f"hotpotqa:{t}", "evaluate", title=t, keep=keep)]

    train_paths = sorted(os.path.join(HERE, "hotpotqa", f) for f in os.listdir(os.path.join(HERE, "hotpotqa"))
                         if f.startswith("distractor.train-") and f.endswith(".parquet"))
    order = sorted((digest(q["id"], 16), list(dict.fromkeys(q["supporting_facts"]["title"])))
                   for q in rows(train_paths, ["id", "supporting_facts"]))
    chosen: dict[str, None] = {}
    for _, titles in order:
        for t in titles:
            if t not in reserved and t not in chosen and len(chosen) < pool:
                chosen[t] = None
        if len(chosen) >= pool:
            break
    paras: dict[str, list[str]] = {}
    if chosen:
        for q in rows(train_paths, ["context"]):
            for t, sents in zip(q["context"]["title"], q["context"]["sentences"]):
                if t in chosen and t not in paras:
                    paras[t] = [clean(s) for s in sents]
            if len(paras) == len(chosen):
                break
    train = [r for t in chosen if t in paras
             for r in from_document("hotpotqa", "train", t, paras[t], "encyclopedic", f"hotpotqa:{t}", "mine", title=t, keep=keep)]

    files = [("train", train), ("validation", val)]
    spend("hotpotqa", files)
    role = {r["family"]: r["role"] for r in val}
    for q in questions:
        q["usable"] = all(role.get(f"hotpotqa:{t}") == "evaluate" for t in q["gold"])
    return files + [("validation.questions", questions)]


def drop() -> list[tuple[str, list[dict]]]:
    """One block per passage; family = the passage TEXT (12 passages appear in both splits under
    different ids). dev → evaluate; train → mine, unless its family is also in dev."""
    data = {sp: json.load(open(os.path.join(HERE, "drop", "drop_dataset", f"drop_dataset_{sp}.json"), encoding="utf-8"))
            for sp in ("train", "dev")}
    fam = lambda v: "drop:" + digest(clean(v["passage"]))
    dev = {fam(v) for v in data["dev"].values()}
    files = []
    for sp, d in data.items():
        out = []
        for pid, v in d.items():
            domain, f = pid.split("_")[0], fam(v)
            out.extend(from_document("drop", sp, pid, v["passage"], "sports-recap" if domain == "nfl" else "encyclopedic",
                                     f, "evaluate" if f in dev else "mine", domain=domain,
                                     task={"kind": "passage", "questions": len(v["qa_pairs"])}))
        files.append((sp, out))
    spend("drop", files)
    return files


def wikitext() -> list[tuple[str, list[dict]]]:
    """One block per paragraph, family = the article; every family → control."""
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
            out.extend(from_document("wikitext-103", split, f"{title}#{para}", detok(line), "encyclopedic",
                                     f"wikitext-103:{title}", "control", title=title))
            para += 1
        res.append((split, out))
    spend("wikitext-103", res)
    return res


def openwebtext() -> list[tuple[str, list[dict]]]:
    """One block per web page, family = the page; every family → control."""
    out = []
    with open(os.path.join(HERE, "openwebtext", "slice.train.jsonl"), encoding="utf-8") as fh:
        for n, line in enumerate(fh):
            text = json.loads(line)["text"]
            sents = [s for p in re.split(r"\n\s*\n", text) for s in split_sentences(p)]
            out.extend(from_document("openwebtext", "slice", str(n), sents, "web", f"openwebtext:{n}", "control", cap=40))
    files = [("slice", out)]
    spend("openwebtext", files)
    return files


def pg19() -> list[tuple[str, list[dict]]]:
    """One block per book, family = the book; → later (long narrative is not in the current plan)."""
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
        paras = [clean(p) for p in re.split(r"\n\s*\n", raw)]
        body = [p for p in paras if len(p.split()) >= 12 and not p.isupper()]     # skip front matter, headings, verse
        sents = [s for p in body for s in split_sentences(p)]
        out.extend(from_document("pg19", "validation", bid, sents, "book", f"pg19:{bid}", "later", title=meta.get(bid), cap=600))
    files = [("validation", out)]
    spend("pg19", files)
    return files


def clutrr() -> list[tuple[str, list[dict]]]:
    """One block per distinct story (family = the story text; a story asked several queries is one
    block with all its queries). A family that appears in either configuration's train split → mine
    (half of gen_train23's validation stories are copies of train stories); the rest → evaluate."""
    cfgs = ("gen_train23_test2to10", "gen_train234_test2to10")
    stories: dict[tuple, dict] = {}
    aliases: dict[tuple, str] = {}
    for cfg in cfgs:
        for sp in ("train", "validation", "test"):
            d = stories.setdefault((cfg, sp), {})
            with open(os.path.join(HERE, "clutrr", f"{cfg}.{sp}.jsonl"), encoding="utf-8") as fh:
                for line in fh:
                    r = json.loads(line)
                    story = clean(re.sub(r"\[([^\]]+)\]", r"\1", r["clean_story"]))
                    f = "clutrr:" + digest(story)
                    e = d.setdefault(f, {"story": story, "id": r["id"], "task": r.get("task_name"), "queries": []})
                    aliases[(f"{cfg}.{sp}", r["id"])] = f
                    e["queries"].append({"query": list(r["query"]) if not isinstance(r["query"], str) else r["query"],
                                         "target": r["target_text"]})
    train = {f for cfg in cfgs for f in stories[(cfg, "train")]}
    files = []
    for (cfg, sp), d in stories.items():
        out = []
        for f, e in d.items():
            out.extend(from_document("clutrr", f"{cfg}.{sp}", e["id"], e["story"], "synthetic-kinship", f,
                                     "mine" if f in train else "evaluate",
                                     task={"kind": "relation", "task": e["task"], "queries": e["queries"]},
                                     keep=lambda s: plausible(s, lo=3)))
        files.append((f"{cfg}.{sp}", out))
    spend("clutrr", files, aliases)
    return files


def babi() -> list[tuple[str, list[dict]]]:
    """One block per story; → evaluate (a state-tracking test: five-word statements give nothing to mine)."""
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
                                         f"babi:qa1.{split}:{n}", "evaluate", domain="qa1",
                                         task={"kind": "where", "questions": questions}, keep=lambda s: plausible(s, lo=3)))
        res.append((f"qa1.{split}", out))
    spend("babi", res)
    return res


def mrpc() -> list[tuple[str, list[dict]]]:
    """One record per distinct sentence (block = the MSR sentence id), per official split; family =
    the sentences joined by pairs across BOTH splits; a family with any test pair → evaluate, else
    mine. pairs file: one record per labelled pair (label 1 = judged equivalent)."""
    pairs, texts = [], {}
    for sp in ("train", "test"):
        raw = open(os.path.join(HERE, "mrpc", f"msr_paraphrase_{sp}.txt"), encoding="utf-8-sig").read()
        rows = [r for r in list(csv.reader(io.StringIO(raw), delimiter="\t", quoting=csv.QUOTE_NONE))[1:] if len(r) >= 5]
        for n, r in enumerate(rows):
            q, a, b, ta, tb = r[:5]
            texts.setdefault(a, clean(ta))
            texts.setdefault(b, clean(tb))
            pairs.append({"pair": f"mrpc-{sp}-{n:04d}", "split": sp, "a": a, "b": b, "label": int(q)})
    comp = components((p["a"], p["b"]) for p in pairs)
    fam = {s: f"mrpc:{comp[s]}" for s in comp}
    held = {fam[p["a"]] for p in pairs if p["split"] == "test"}
    role = lambda s: "evaluate" if fam[s] in held else "mine"
    files = []
    for sp in ("train", "test"):
        ids = list(dict.fromkeys(x for p in pairs if p["split"] == sp for x in (p["a"], p["b"])))
        files.append((sp, [rec("mrpc", sp, s, 0, texts[s], "news", fam[s], role(s)) for s in ids]))
    spent = spend("mrpc", files)
    for p in pairs:
        p["family"] = fam[p["a"]]
        p["role"] = "spent" if p["family"] in spent else role(p["a"])
    return files + [("pairs", pairs)]


def sick() -> list[tuple[str, list[dict]]]:
    """One record per distinct sentence (block = a hash of its text); family = the sentences joined by
    a pair OR rewritten from one caption (a caption's rewrites, its contrasts and the pairs between
    captions stay together); a family whose pairs are mostly in the official TEST set → evaluate,
    else mine. pairs file: one record per pair with both entailment directions and relatedness."""
    rows = list(csv.DictReader(open(os.path.join(HERE, "sick", "SICK.txt"), encoding="utf-8-sig"), delimiter="\t"))
    sid = lambda t: digest(clean(t), 10)
    edges, texts = [], {}
    for r in rows:
        a, b = sid(r["sentence_A"]), sid(r["sentence_B"])
        texts.setdefault(a, clean(r["sentence_A"]))
        texts.setdefault(b, clean(r["sentence_B"]))
        edges += [(a, b), (a, "caption:" + r["sentence_A_original"]), (b, "caption:" + r["sentence_B_original"])]
    comp = components(edges)
    fam = {s: f"sick:{digest(comp[s], 8)}" for s in texts}
    votes = collections.defaultdict(collections.Counter)
    for r in rows:
        votes[fam[sid(r["sentence_A"])]][r["SemEval_set"]] += 1
    role = {f: "evaluate" if v["TEST"] >= v["TRAIN"] + v["TRIAL"] else "mine" for f, v in votes.items()}
    sents = [rec("sick", "all", s, 0, t, "captions", fam[s], role[fam[s]]) for s, t in sorted(texts.items())]
    files = [("all", sents)]
    spent = spend("sick", files)
    pairs = []
    for r in rows:
        a, b = sid(r["sentence_A"]), sid(r["sentence_B"])
        pairs.append({"pair": f"sick-{r['pair_ID']}", "split": r["SemEval_set"].lower(), "a": a, "b": b,
                      "label": r["entailment_label"].lower(), "ab": r["entailment_AB"], "ba": r["entailment_BA"],
                      "relatedness": float(r["relatedness_score"]),
                      "same_caption": r["sentence_A_original"] == r["sentence_B_original"],
                      "family": fam[a], "role": "spent" if fam[a] in spent else role[fam[a]]})
    return files + [("pairs", pairs)]


EXPLICIT_TERMS = ("nipple", "ni**le", "cock", "pussy", "fuck", "orgasm", "thrust", "moan", "erection", "breasts", "naked", "sex ")


def lambada() -> list[tuple[str, list[dict]]]:
    """One block per passage; → later (narrative is not in the current plan)."""
    out = []
    with open(os.path.join(HERE, "lambada", "lambada_test.jsonl"), encoding="utf-8") as fh:
        for n, line in enumerate(fh):
            text = json.loads(line)["text"]
            low = text.lower()
            if any(t in low for t in EXPLICIT_TERMS):
                continue
            sents = [s for p in re.split(r"\n\s*\n", text) for s in split_sentences(p)]
            out.extend(from_document("lambada", "test", str(n), sents, "fiction", f"lambada:{n}", "later"))
    files = [("test", out)]
    spend("lambada", files)
    return files


ADAPTERS = {"hotpotqa": hotpotqa, "drop": drop, "clutrr": clutrr, "babi": babi, "mrpc": mrpc, "sick": sick,
            "wikitext-103": wikitext, "openwebtext": openwebtext, "pg19": pg19, "lambada": lambada}


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="prepare the fetched datasets into the standard per-sentence format")
    ap.add_argument("names", nargs="*", help="dataset names (default: all adapters)")
    ap.add_argument("--hotpotqa-pool", type=int, default=HOTPOT_POOL, help="train articles in the HotpotQA mining pool")
    ap.add_argument("--show", type=int, default=0, help="print this many records per file")
    args = ap.parse_args(argv)
    names = args.names or list(ADAPTERS)
    unknown = [n for n in names if n not in ADAPTERS]
    if unknown:
        print("no adapter for: " + ", ".join(unknown), file=sys.stderr)
        return 2
    for name in names:
        files = ADAPTERS[name](args.hotpotqa_pool) if name == "hotpotqa" else ADAPTERS[name]()
        for split, records in files:
            path = write(name, split, records)
            if records and "text" in records[0]:
                fams = collections.defaultdict(set)
                for r in records:
                    fams[r["role"]].add(r["family"])
                roles = " · ".join(f"{k} {len(v):,}" for k, v in sorted(fams.items()))
                print(f"{os.path.relpath(path, HERE)}: {len(records):,} sentences, {len({r['doc'] for r in records}):,} blocks, "
                      f"families by role: {roles}")
            else:
                print(f"{os.path.relpath(path, HERE)}: {len(records):,} records")
            for r in records[: args.show]:
                print("   ", json.dumps({k: r[k] for k in ("id", "text") if k in r} or r, ensure_ascii=False)[:220])
    if UNMATCHED:
        print(f"coverage-sample records whose block was not found: {len(UNMATCHED)} (e.g. {UNMATCHED[:3]})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
