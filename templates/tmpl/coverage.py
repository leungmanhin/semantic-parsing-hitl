"""The COVERAGE INSTRUMENT (the Next-Steps doc's §7.4): a stratified sample of natural text through
the catalog, scored for what the parser could and could not map — the parse rate per source, the
gap-code and unmapped-span histograms, the fired-template distribution — to re-rank the template
backlog and set the mining shares.  Never a regression suite: nothing sampled here is copied into
a template's examples (the suite's leak check watches the sample file).

Three steps::

    python -m tmpl.coverage sample            # datasets/prepared/*.jsonl -> datasets/sample/coverage-sample.jsonl
    python -m tmpl.coverage parse  …          # the paid step: one parser call per sentence, resumable
    python -m tmpl.coverage report            # datasets/sample/COVERAGE.md + coverage.json

The sample keeps the prepared records as they are (dataset, document, sentence index, context,
register, task pointers) and adds the plan and the seed; the parsed file adds the parser's record,
the prompt hashes and the manifest id; the report validates every reply with the catalog's own
validator (contract, emission, lints, C9) and counts.
"""
from __future__ import annotations

import argparse
import collections
import concurrent.futures
import glob
import json
import os
import random
import re
import statistics
import sys
import threading
import time

from . import catalog as CAT, manifest as MF, suite as S, validate as V

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
REPO = os.path.abspath(os.path.join(TEMPLATES, os.pardir))
PREPARED = os.path.join(REPO, "datasets", "prepared")
SAMPLE_DIR = os.path.join(REPO, "datasets", "sample")
SAMPLE = os.path.join(SAMPLE_DIR, "coverage-sample.jsonl")
PARSED = os.path.join(SAMPLE_DIR, "coverage-sample.parsed.jsonl")
PROMPT = os.path.join(TEMPLATES, "generated", "PROMPT_CATALOG.txt")

# The plan: (prepared file stem, quota of sentences, how, a filter on the record or None).
#   "spread"    — round-robin over shuffled documents, one new sentence per document per round
#   "documents" — whole documents (a story's sentences stay together) until the quota is reached
PLANS = {
    "default": [
        ("hotpotqa.validation", 150, "spread", None),
        ("drop.dev", 40, "spread", lambda r: r.get("domain") == "history"),
        ("drop.dev", 20, "spread", lambda r: r.get("domain") == "nfl"),
        ("wikitext-103.validation", 80, "spread", None),
        ("openwebtext.slice", 80, "spread", None),
        ("clutrr.gen_train23_test2to10.test", 100, "documents", None),
        ("babi.qa1.test", 60, "documents", None),
        ("lambada.test", 30, "spread", None),
        ("pg19.validation", 30, "spread", None),
    ],
    # The paraphrase sets, in whole families by role. The fold is the start of the full draw (same
    # seed, same order), so its replies are reused when the full selection is parsed into the same file.
    "paraphrase-fold": [
        ("sick.all", 300, "families", lambda r: r.get("role") == "mine"),
        ("mrpc.train", 300, "families", lambda r: r.get("role") == "mine"),
    ],
    # More SICK mining families: the same seed and the same first item as "paraphrase", so its first ~1,000
    # sentences are the families already parsed (skipped by the runner) and the rest are new. A separate plan
    # because the sampler's random state is shared across a plan's items: widening "paraphrase" itself would
    # redraw its MRPC and evaluation items.
    "paraphrase-2": [
        ("sick.all", 2000, "families", lambda r: r.get("role") == "mine"),
    ],
    # The rest of SICK: every family the sampler can take (50 sentences or fewer), the evaluation share first,
    # then the mining share — the quotas are above the totals. A separate plan for the reason given above; the
    # runner skips the sentences already parsed into the shared file.
    "paraphrase-3": [
        ("sick.all", 5000, "families", lambda r: r.get("role") == "evaluate"),
        ("sick.all", 5000, "families", lambda r: r.get("role") == "mine"),
    ],
    "paraphrase": [
        ("sick.all", 1000, "families", lambda r: r.get("role") == "mine"),
        ("mrpc.train", 1000, "families", lambda r: r.get("role") == "mine"),
        ("sick.all", 800, "families", lambda r: r.get("role") == "evaluate"),
        ("mrpc.test", 550, "families", lambda r: r.get("role") == "evaluate"),
    ],
}


def _read_jsonl(path: str) -> list[dict]:
    with open(path, encoding="utf-8") as fh:
        return [json.loads(line) for line in fh if line.strip()]


def _catalog_sentences(catalog: dict) -> set[str]:
    out = set()
    for t in catalog.values():
        for section in ("shown", "held_out"):
            for ex in (t.get("examples") or {}).get(section) or []:
                out.add(S._norm_sentence(ex.get("text") or ""))
                for c in ex.get("context") or []:
                    out.add(S._norm_sentence(c.get("text") or ""))
    out.discard("")
    return out


def sample(plan: str = "default", seed: int = 7, prepared_dir: str = PREPARED, out: str = SAMPLE,
           catalog: dict | None = None, max_words: int = 60) -> list[dict]:
    """A stratified sample of the prepared files; deterministic for a plan and a seed."""
    rng = random.Random(seed)
    avoid = _catalog_sentences(catalog) if catalog else set()
    chosen: list[dict] = []
    seen_text: set[str] = set()
    for n, (stem, quota, how, keep) in enumerate(PLANS[plan]):
        path = os.path.join(prepared_dir, f"{stem}.jsonl")
        if not os.path.exists(path):
            print(f"  missing {os.path.relpath(path, REPO)} — run datasets/prepare.py", file=sys.stderr)
            continue
        if how == "families":
            picked = _whole_families([r for r in _read_jsonl(path) if keep is None or keep(r)], quota, rng, avoid, max_words)
            group = stem if keep is None else f"{stem}/{picked[0].get('role') if picked else n}"
            for r in picked:
                key = S._norm_sentence(r["text"])
                if key not in seen_text:
                    seen_text.add(key)
                    chosen.append({**r, "sample": {"plan": plan, "seed": seed, "group": group}})
            continue
        records = [r for r in _read_jsonl(path) if (keep is None or keep(r))
                   and len(r["text"].split()) <= max_words and S._norm_sentence(r["text"]) not in avoid]
        by_doc: dict[str, list[dict]] = collections.OrderedDict()
        for r in records:
            by_doc.setdefault(r["doc"], []).append(r)
        docs = list(by_doc)
        rng.shuffle(docs)
        picked: list[dict] = []
        if how == "documents":
            for d in docs:
                picked.extend(by_doc[d])
                if len(picked) >= quota:
                    break
        else:
            cursors = {d: 0 for d in docs}
            while len(picked) < quota and any(cursors[d] < len(by_doc[d]) for d in docs):
                for d in docs:
                    if cursors[d] < len(by_doc[d]) and len(picked) < quota:
                        picked.append(by_doc[d][cursors[d]])
                        cursors[d] += 1
        group = stem if keep is None else f"{stem}/{picked[0].get('domain') if picked else n}"
        for r in picked:
            key = S._norm_sentence(r["text"])
            if key in seen_text:
                continue
            seen_text.add(key)
            chosen.append({**r, "sample": {"plan": plan, "seed": seed, "group": group}})
    os.makedirs(os.path.dirname(out), exist_ok=True)
    with open(out, "w", encoding="utf-8") as fh:
        for r in chosen:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
    return chosen


FAMILY_CAP = 50        # a family larger than this is left out of a "families" draw (SICK has one of 1,081 sentences)


def _whole_families(records: list[dict], quota: int, rng: random.Random, avoid: set, max_words: int) -> list[dict]:
    """Whole families in a seeded order until ``quota`` sentences: a pair's two sentences, a caption's
    rewrites, a story — never part of one. A family is skipped when any of its sentences is too long
    or is a catalog example, or when it is larger than FAMILY_CAP; the order does not depend on the
    quota, so a smaller draw is the start of a larger one with the same seed."""
    by_fam: dict[str, list[dict]] = collections.OrderedDict()
    for r in records:
        by_fam.setdefault(r.get("family") or r["doc"], []).append(r)
    fams = sorted(by_fam)
    rng.shuffle(fams)
    picked: list[dict] = []
    for f in fams:
        rs = by_fam[f]
        if len(rs) > FAMILY_CAP or any(len(r["text"].split()) > max_words or S._norm_sentence(r["text"]) in avoid for r in rs):
            continue
        picked.extend(rs)
        if len(picked) >= quota:
            break
    return picked


def _composition(records: list[dict]) -> list[str]:
    groups = collections.OrderedDict()
    for r in records:
        g = r.get("sample", {}).get("group", r["dataset"])
        groups.setdefault(g, []).append(r)
    lines = []
    for g, rs in groups.items():
        docs = len({r["doc"] for r in rs})
        words = [len(r["text"].split()) for r in rs]
        lines.append(f"  {g:40s} {len(rs):4d} sentences from {docs:4d} documents · median {statistics.median(words):.0f} words")
    return lines


# ------------------------------------------------------------------ parse (the paid step)
def parse(args) -> int:
    sp = S.load_parse_script(args.parse_script)
    records = _read_jsonl(args.sample)
    done: dict[str, dict] = {}
    if os.path.exists(args.out) and not args.force:
        for r in _read_jsonl(args.out):
            if not (r.get("reply") or {}).get("error"):
                done[r["id"]] = r
    todo = [r for r in records if r["id"] not in done]
    if args.limit:
        todo = todo[: args.limit]
    stale = None if args.dry_run else S.stale_prompt(args.prompt)
    if stale:
        print(f"error: {stale}", file=sys.stderr)
        return 2
    with open(args.prompt, encoding="utf-8") as fh:
        body_sha = S.prompt_body_sha(fh.read())
    manifest_id = MF.current_id()
    model = args.model or sp.PROVIDERS[args.provider].default_model
    print(f"planned {len(todo)} calls ({len(records)} sentences, {len(done)} already parsed) · provider {args.provider} "
          f"model {model} effort {args.effort} · manifest {manifest_id}")
    if not todo:
        return 0
    if args.dry_run:
        rec = sp.parse_sentence(todo[0]["text"], args, todo[0]["id"])
        print(json.dumps(rec["request"], indent=2, ensure_ascii=False))
        return 0
    st = {"primes": 0, "cached": 0, "input": 0, "failed": 0, "write": None, "done": 0, "last_prime": 0.0, "streak": 0, "stop": None}
    out_lock, prime_lock = threading.Lock(), threading.Lock()   # one writer at a time; one re-prime per cache loss

    def prime(reason):
        if args.no_prime or not hasattr(sp, "prime"):
            return
        try:
            pu = sp.prime(args)
        except Exception as exc:
            print(f"prime failed ({exc})", flush=True)
            return
        if pu is not None:
            st["primes"] += 1
            print(f"primed ({reason}): catalog alone, in={pu.get('input')} cached={pu.get('cached')}", flush=True)

    fatal = getattr(sp, "FatalProviderError", ())

    def one(r, out):
        if st["stop"]:                                      # the run is stopped: not attempted, left for a resume
            return
        t0 = time.time()
        try:
            rec = sp.parse_sentence(r["text"], args, r["id"])
        except fatal as exc:                                # the account cannot pay: stop the run on this reply
            st["stop"] = str(exc).splitlines()[0][:200]
            rec = {"provider": args.provider, "model": model, "effort": args.effort,
                   "item": {"id": r["id"], "text": r["text"]}, "response": None, "error": f"request failed: {exc}"}
        except sp.ProviderError as exc:
            rec = {"provider": args.provider, "model": model, "effort": args.effort,
                   "item": {"id": r["id"], "text": r["text"]}, "response": None, "error": f"request failed: {exc}"}
        rec["prompt_body_sha256"] = body_sha
        rec["manifest_id"] = manifest_id
        rec["timing"] = {"start": round(t0, 3), "end": round(time.time(), 3), "worker": threading.current_thread().name}
        u = rec.get("usage") or {}
        status = "error" if rec.get("error") else "ok"
        n_inst = len(((rec.get("response") or {}).get("instances") or [])) if isinstance(rec.get("response"), dict) else 0
        n_unm = len(((rec.get("response") or {}).get("unmapped") or [])) if isinstance(rec.get("response"), dict) else 0
        with out_lock:
            out.write(json.dumps({**r, "reply": rec}, ensure_ascii=False) + "\n")
            out.flush()
            st["done"] += 1
            st["failed"] += status == "error"
            st["cached"] += u.get("cached") or 0
            st["input"] += u.get("input") or 0
            write = ""
            if "cache_write" in u:
                st["write"] = (st["write"] or 0) + (u["cache_write"] or 0)
                write = f" cache_write={u['cache_write']}"
            print(f"[{st['done']}/{len(todo)}] {r['dataset']:14s} {status:5s} inst={n_inst:2d} unmapped={n_unm} in={u.get('input')} "
                  f"cached={u.get('cached')}{write} · {r['text'][:90]}", flush=True)
        # Gemini's implicit cache misses about one call in six under load, singly and whatever the time since the
        # last prime (measured on the first paraphrase slice): a single miss is not a lost cache and a re-prime
        # does not prevent the next one. Re-prime only after `reprime_after` misses in a row (0 = never).
        if status == "ok" and hasattr(sp, "cache_lost"):
            with prime_lock:
                st["streak"] = st["streak"] + 1 if sp.cache_lost(u) else 0
                if (args.reprime_after and st["streak"] >= args.reprime_after and t0 > st["last_prime"]
                        and st["done"] < len(todo)):
                    prime(f"{st['streak']} replies in a row had no cached tokens")
                    st["last_prime"] = time.time()
                    st["streak"] = 0

    prime("start")
    st["last_prime"] = time.time()
    mode = "a" if (os.path.exists(args.out) and not args.force) else "w"
    with open(args.out, mode, encoding="utf-8") as out:
        if args.workers <= 1:
            for r in todo:
                one(r, out)
        else:
            with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers, thread_name_prefix="w") as pool:
                for f in concurrent.futures.as_completed([pool.submit(one, r, out) for r in todo]):
                    f.result()
    share = f" · cached {st['cached']:,} of {st['input']:,} input tokens ({st['cached'] / st['input']:.0%})" if st["input"] else ""
    if st["write"] is not None:
        share += f" · written to the cache {st['write']:,}"
    if st["stop"]:
        print(f"STOPPED: {st['stop']} — {len(todo) - st['done']} sentences not attempted (a resume parses them)", flush=True)
    print(f"done: {st['done'] - st['failed']} replies stored, {st['failed']} failed · primes {st['primes']}{share} · "
          f"{os.path.relpath(args.out, REPO)}")
    return 3 if st["stop"] else 1 if st["failed"] else 0


# ------------------------------------------------------------------ report
def _pattern(span: str) -> str:
    """A crude shape of an unmapped span: capitalized words become N, numbers #, the rest lowercased.
    A discontinuous span comes as a list of its pieces."""
    if isinstance(span, list):
        span = " ".join(str(x) for x in span)
    toks = re.findall(r"[A-Za-z][A-Za-z'\-]*|\d[\d.,]*", span)
    out = []
    for t in toks:
        if t[0].isdigit():
            out.append("#")
        elif t[0].isupper() and out:
            out.append("N")
        else:
            out.append(t.lower())
    return " ".join(out)[:60]


#: Gap codes the catalog asks the parser to REPORT rather than map — a post-nominal tag on a name (G03), a
#: connective opening the text with no first clause (G05), the wording of a quotation whose content is parsed
#: (G10): a convention each, never a gap in the catalog, so a sentence whose only unmapped spans carry one
#: counts as covered. The named gaps (G01, G02, G04, G06 … G09) and the catch-all G00 stay gaps.
REPORTED = {"G03", "G05", "G10", "G13", "G14"}


def assess(parsed: list[dict], catalog: dict, typecheck: bool = False) -> dict:
    """Classify every reply. C9 (the type check) runs ONCE over all the replies in one engine session
    (one session per reply grew past 3 GB on 1,827 replies); its findings are lints, never a class."""
    rows, inspected = [], []
    for r in parsed:
        reply = r.get("reply") or {}
        resp = reply.get("response")
        row = {"id": r["id"], "dataset": r["dataset"], "group": r.get("sample", {}).get("group", r["dataset"]), "text": r["text"],
               "status": "error" if reply.get("error") or not isinstance(resp, dict) else "ok",
               "instances": 0, "fired": {}, "unmapped": [], "reported": [], "issues": [], "findings": [], "outcome": "none",
               "usage": reply.get("usage") or {}}
        if row["status"] == "ok":
            try:
                res = V.inspect(resp, catalog, text=r["text"])
                inspected.append((row, res))
            except Exception as exc:                       # a reply the emitter or the validator cannot take: malformed, with the reason
                res = {"instances": [], "fired": {}, "unmapped": [], "issues": [], "findings": [{"kind": "instance", "detail": f"{type(exc).__name__}: {str(exc)[:200]}"}]}
            row["instances"] = len(res["instances"])
            row["fired"] = res["fired"]
            row["unmapped"] = [u for u in res["unmapped"] if isinstance(u, dict)]
            row["reported"] = [u for u in row["unmapped"] if (u.get("code") or "G00") in REPORTED]
            gaps = [u for u in row["unmapped"] if (u.get("code") or "G00") not in REPORTED]
            row["issues"] = res["issues"]
            row["findings"] = [f for f in res["findings"] if not f["kind"].startswith("span-")]
            hard = [f for f in row["findings"] if f["kind"] in ("contract", "instance")]
            predications = sum(n for t, n in row["fired"].items() if t not in ("named-entity", "witness", "group", "range", "mention", "coref", "reference-time"))
            if hard:
                row["outcome"] = "malformed"
            elif gaps:
                row["outcome"] = "partial" if predications else "none"
            else:
                row["outcome"] = "covered" if predications else "none"
        else:
            row["outcome"] = "error"
        rows.append(row)
    if typecheck and inspected:
        typed = V.typecheck_records([res for _, res in inspected])
        for i, (row, _) in enumerate(inspected):
            row["findings"].extend((typed or {}).get(i, []))

    def table(rs):
        n = len(rs)
        c = collections.Counter(x["outcome"] for x in rs)
        inst = [x["instances"] for x in rs if x["status"] == "ok"]
        return {"sentences": n, **{k: c.get(k, 0) for k in ("covered", "partial", "none", "malformed", "error")},
                "covered_rate": round(c.get("covered", 0) / n, 3) if n else None,
                "reported": sum(1 for x in rs if x["outcome"] == "covered" and x["reported"]),
                "median_instances": statistics.median(inst) if inst else None,
                "lints": sum(1 for x in rs for f in x["findings"] if f["kind"] not in ("contract", "instance")),
                "issues": sum(len(x["issues"]) for x in rs)}

    groups = collections.OrderedDict()
    for x in rows:
        groups.setdefault(x["group"], []).append(x)
    gaps = collections.Counter(u.get("code") or "?" for x in rows for u in x["unmapped"])
    spans = collections.Counter(_pattern(u.get("span") or "") for x in rows for u in x["unmapped"] if u.get("span"))
    fired = collections.Counter()
    for x in rows:
        fired.update(x["fired"])
    lints = collections.Counter(f["kind"] for x in rows for f in x["findings"] if f["kind"] not in ("contract", "instance"))
    usage = {k: sum((x["usage"].get(k) or 0) for x in rows) for k in ("input", "output", "cached", "total")}
    if any("cache_write" in x["usage"] for x in rows):   # only where the provider reports cache writes
        usage["cache_write"] = sum((x["usage"].get("cache_write") or 0) for x in rows)
    return {"overall": table(rows), "by_group": {g: table(rs) for g, rs in groups.items()}, "gap_codes": dict(gaps.most_common()),
            "unmapped_patterns": spans.most_common(40), "fired": dict(fired.most_common()), "lints": dict(lints.most_common()),
            "issues": [{"id": x["id"], "text": x["text"], "issue": i} for x in rows for i in x["issues"]][:40],
            "usage": usage, "rows": rows}


def render_report(a: dict, manifest_id: str | None, model: str | None) -> str:
    L = []
    add = L.append
    o = a["overall"]
    add("# Coverage report")
    add("")
    add(f"{o['sentences']} sentences · manifest {manifest_id or '—'} · parser {model or '—'} · "
        f"covered {o['covered']} ({(o['covered_rate'] or 0):.0%}, {o['reported']} of them with spans reported by convention), "
        f"partial {o['partial']}, none {o['none']}, malformed {o['malformed']}, errors {o['error']}")
    add("")
    add("covered = every span mapped or reported by convention (a tag on a name G03, a connective opening the text G05, "
        "a quotation's wording G10) and at least one predication fired; partial = predications beside spans with a gap code; "
        "none = nothing but referents or everything unmapped; malformed = the reply broke the contract or the emitter refused it.")
    add("")
    add("## By source")
    add("")
    add("| source | sentences | covered | partial | none | malformed | errors | covered rate | median instances | lints | issue reports | reported |")
    add("|---|---|---|---|---|---|---|---|---|---|---|---|")
    for g, t in a["by_group"].items():
        add(f"| {g} | {t['sentences']} | {t['covered']} | {t['partial']} | {t['none']} | {t['malformed']} | {t['error']} | "
            f"{(t['covered_rate'] or 0):.0%} | {t['median_instances'] if t['median_instances'] is not None else '—'} | {t['lints']} | {t['issues']} | {t['reported']} |")
    add("")
    add("## Gap codes on the unmapped spans")
    add("")
    for code, n in a["gap_codes"].items():
        if code not in REPORTED:
            add(f"- {code}: {n}")
    conv = [(code, n) for code, n in a["gap_codes"].items() if code in REPORTED]
    if conv:
        add("")
        add("reported by convention, not gaps: " + ", ".join(f"{code}: {n}" for code, n in conv))
    add("")
    add("## Unmapped span shapes (capitalized words N, numbers #)")
    add("")
    for pat, n in a["unmapped_patterns"]:
        add(f"- {n:3d} · {pat}")
    add("")
    add("## Templates fired")
    add("")
    for t, n in a["fired"].items():
        add(f"- {t}: {n}")
    add("")
    if a["lints"]:
        add("## Validator lints")
        add("")
        for k, n in a["lints"].items():
            add(f"- {k}: {n}")
        add("")
    if a["issues"]:
        add("## Parser issue reports")
        add("")
        for i in a["issues"]:
            add(f"- {i['id']}: {json.dumps(i['issue'], ensure_ascii=False)[:200]} · {i['text'][:120]}")
        add("")
    add("## Examples of unmapped sentences, by source")
    add("")
    for g in a["by_group"]:
        ex = [x for x in a["rows"] if x["group"] == g and x["unmapped"]][:3]
        for x in ex:
            spans = "; ".join(f"{u.get('code')} «{u.get('span')}»" for u in x["unmapped"])
            add(f"- {g}: {x['text'][:160]} → {spans}")
    add("")
    u = a["usage"]
    written = f", written to the cache {u['cache_write']:,}" if u.get("cache_write") is not None else ""
    add(f"usage: input {u['input']:,} (cached {u['cached']:,}{written}), output {u['output']:,}")
    return "\n".join(L) + "\n"


def latest(rows: list[dict]) -> list[dict]:
    """One record per sentence — its id AND its text (an older sample cut ids to 16 characters, so two
    paragraphs of one article could share an id): its last successful reply, else its last attempt
    (a resumed run appends the retried sentences after their failed attempts)."""
    best: dict[tuple, dict] = {}
    for r in rows:
        key = (r["id"], r.get("text"))
        prev = best.get(key)
        if prev is None or not (r.get("reply") or {}).get("error") or (prev.get("reply") or {}).get("error"):
            best[key] = r
    return list(best.values())


def report(args, catalog: dict) -> int:
    parsed = latest(_read_jsonl(args.parsed))
    a = assess(parsed, catalog, typecheck=not args.no_typecheck)
    ids = {(r.get("reply") or {}).get("manifest_id") for r in parsed}
    models = {(r.get("reply") or {}).get("model") for r in parsed}
    text = render_report(a, "/".join(sorted(i for i in ids if i)) or None, "/".join(sorted(m for m in models if m)) or None)
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write(text)
    with open(os.path.splitext(args.out)[0].replace("COVERAGE", "coverage") + ".json", "w", encoding="utf-8") as fh:
        json.dump({k: v for k, v in a.items() if k != "rows"} | {"rows": [{k: x[k] for k in ("id", "dataset", "group", "outcome", "instances", "fired", "unmapped", "issues")} for x in a["rows"]]},
                  fh, indent=1, ensure_ascii=False)
    o = a["overall"]
    print(f"{o['sentences']} sentences: covered {o['covered']} ({(o['covered_rate'] or 0):.0%}), partial {o['partial']}, none {o['none']}, "
          f"malformed {o['malformed']}, errors {o['error']} · report {os.path.relpath(args.out, REPO)}")
    return 0


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    sub = ap.add_subparsers(dest="cmd", required=True)
    s = sub.add_parser("sample", help="draw the stratified sample from the prepared files")
    s.add_argument("--plan", default="default", choices=sorted(PLANS))
    s.add_argument("--seed", type=int, default=7)
    s.add_argument("--prepared-dir", default=PREPARED)
    s.add_argument("--out", default=SAMPLE)
    p = sub.add_parser("parse", help="parse the sample, one call per sentence (resumable)")
    p.add_argument("--sample", default=SAMPLE)
    p.add_argument("--out", default=PARSED)
    p.add_argument("--limit", type=int, default=None)
    p.add_argument("--force", action="store_true", help="re-parse everything")
    p.add_argument("--no-prime", action="store_true")
    p.add_argument("--workers", type=int, default=1, help="parallel calls (each reply is written as it arrives)")
    p.add_argument("--reprime-after", type=int, default=3, help="re-prime after this many cache misses in a row (0: never)")
    p.add_argument("--dry-run", action="store_true")
    p.add_argument("--parse-script", default=S.PARSE_SCRIPT)
    S.load_parse_script(S.PARSE_SCRIPT).add_provider_args(p)
    r = sub.add_parser("report", help="validate the parsed replies and write the coverage report")
    r.add_argument("--parsed", default=PARSED)
    r.add_argument("--out", default=os.path.join(SAMPLE_DIR, "COVERAGE.md"))
    r.add_argument("--no-typecheck", action="store_true")
    args = ap.parse_args(argv)
    catalog = CAT.load()
    if args.cmd == "sample":
        chosen = sample(args.plan, args.seed, args.prepared_dir, args.out, catalog)
        print(f"sampled {len(chosen)} sentences into {os.path.relpath(args.out, REPO)} (plan {args.plan}, seed {args.seed})")
        print("\n".join(_composition(chosen)))
        return 0
    if args.cmd == "parse":
        return parse(args)
    return report(args, catalog)


if __name__ == "__main__":
    sys.exit(main())
