"""THE SENTENCE-BY-SENTENCE MODE (NESS recommendations §9.3, prefix causality): a text of several sentences is parsed
one sentence at a time. Each call sees the earlier sentences of its text and their instance records as CONTEXT, and
each sentence's record becomes available at its own boundary — never earlier, and never rewritten by a later
sentence (decided with the owner 2026-11-08: sentence-level availability; additive links first).

A BLOCK is the ordered sentences of one document: the selection rows sharing ``dataset`` and ``doc``, in ``sent``
order; the k-th sentence of a block is ``s<k>`` (from 1).

IDS. The parser writes a sentence's own instances with LOCAL ids (n1, x1, e1 …) and refers to an earlier
sentence's instance by its QUALIFIED id, ``s<k>.<id>``, as the context shows it (``"antecedent": "@s1.x1"``).
``qualify`` renames sentence k's local ids to ``s<k>.<id>`` and rewrites its local references (the reserved
``@now`` stays); ``prefix_problems`` refuses an instance id of another sentence, a reference to a later sentence
and a reference to an earlier id the context does not hold.

RECORDS. ``block_records`` emits each PREFIX (sentences 1..k) as one item — one symbol table per block, so the quilt
of sentence 1 is ``sk_quilt_1`` in every later record and a second quilt in sentence 3 is ``sk_quilt_2`` — and gives
sentence k the statements and declarations of prefix 1..k that prefix 1..k−1 did not already have, with
``available_from`` = k. When reading sentence k CHANGES OR DROPS a statement an earlier record holds (a sentence that
negates or scopes over an earlier claim), the earlier record keeps what it said and sentence k gets a
``revision-needed`` finding: the bookkeeping that would withdraw the earlier statement is not built yet — the need is
counted first.

QUESTIONS. A sentence that asks (an instance of the ``question`` family: ``catalog/question.yaml``) states nothing:
its record carries no statement and no declaration but the QUERY (``tmpl.query``) — its pattern read against the
prefix before it, the context's referents named by their symbols through the question's corefs — and its
instances never join the prefix, so no later sentence's record holds anything the question only asked.

CONTEXT. ``context_section`` writes the earlier sentences and their qualified instances for the request, the
earliest first, each instance as the parser wrote it WITHOUT its span (the sentence line above it holds those
words; decided with the owner 2026-11-09: "full without spans", 71 % of the full size); the context of sentence
k+1 extends the context of sentence k, so it is a growing, cacheable prefix. The parser's instructions for it are
the prompt's section "Earlier sentences as context" (``catalog/_general.yaml``, key ``context``).

    python -m tmpl.blocks parse --sample SEL.jsonl --out OUT.parsed.jsonl [provider flags]   # walk the blocks in order
    python -m tmpl.blocks records --parsed OUT.parsed.jsonl [--doc DOC]                      # the per-sentence records
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor

from . import catalog as CAT
from . import emit as E
from . import manifest as MF
from . import suite as S

RESERVED = {"now"}                                   # ids the program supplies (the text's reference time)
QUALIFIED = re.compile(r"^s(\d+)\.(.+)$")

CONTEXT_HEADER = "CONTEXT — the earlier sentences of this text, already parsed (Earlier sentences as context):"


# --------------------------------------------------------------------------
# ids
# --------------------------------------------------------------------------


def qualify(instances: list, k: int) -> list:
    """Sentence k's instances with their local ids made ``s<k>.<id>`` and their local references rewritten; a
    reference that is already qualified (to an earlier sentence) and the reserved ``@now`` are kept."""
    def ref(v):
        if E.is_ref(v):
            body = v[1:]
            return v if body in RESERVED or QUALIFIED.match(body) else f"@s{k}.{body}"
        if isinstance(v, list):
            return [ref(x) for x in v]
        return v
    out = []
    for inst in instances or []:
        if not isinstance(inst, dict):
            out.append(inst)
            continue
        new = {}
        for key, val in inst.items():
            if key == "id" and isinstance(val, str) and not QUALIFIED.match(val):
                new[key] = f"s{k}.{val}"
            elif key in ("t", "span"):
                new[key] = val
            else:
                new[key] = ref(val)
        out.append(new)
    return out


def _refs(v):
    if E.is_ref(v):
        yield v[1:]
    elif isinstance(v, list):
        for x in v:
            yield from _refs(x)


def prefix_problems(qualified: list, k: int, earlier_ids: set) -> list[str]:
    """What breaks prefix causality in sentence k's qualified instances: an instance id of another sentence, a
    reference to a later sentence, a reference to an earlier instance the context does not hold."""
    problems = []
    own = {i.get("id") for i in qualified if isinstance(i, dict)}
    for inst in qualified:
        if not isinstance(inst, dict):
            continue
        m = QUALIFIED.match(str(inst.get("id") or ""))
        if not m or int(m.group(1)) != k:
            problems.append(f"instance {inst.get('id')}: a sentence writes only its own instances (local ids)")
        for key, val in inst.items():
            if key in ("t", "id", "span"):
                continue
            for body in _refs(val):
                if body in RESERVED:
                    continue
                q = QUALIFIED.match(body)
                if not q:
                    continue
                j = int(q.group(1))
                if j > k:
                    problems.append(f"{inst.get('id')}.{key} refers to @{body}, in a later sentence")
                elif j < k and body not in earlier_ids:
                    problems.append(f"{inst.get('id')}.{key} refers to @{body}, which the context does not hold")
                elif j == k and body not in own:
                    problems.append(f"{inst.get('id')}.{key} refers to @{body}, which this sentence does not define")
    return problems


# --------------------------------------------------------------------------
# records
# --------------------------------------------------------------------------


def block_records(sentences: list[dict], catalog: dict | None = None, reference_time=None) -> list[dict]:
    """Per sentence of a block (``[{"k", "text", "instances" (qualified), "unmapped"}]`` in order) its record:
    ``{"k", "available_from", "text", "status", "statements", "declarations", "records", "findings"}`` — the
    statements and declarations prefix 1..k adds to prefix 1..k−1, with the emitter's records of those statements.
    A sentence that breaks prefix causality or that the emitter refuses is ``malformed`` and left out of the later
    prefixes."""
    from . import lower as L, query as Q                 # noqa: PLC0415 (query imports nothing of this module)
    catalog = catalog or CAT.load()
    out = []
    accepted: list = []                                  # the instances of the sentences emitted so far
    earlier_ids: set = set()
    prev_statements: list[str] = []
    prev_declarations: list[str] = []
    for s in sentences:
        k = s["k"]
        rec = {"k": k, "available_from": k, "text": s.get("text"), "status": "ok", "statements": [],
               "declarations": [], "records": [], "findings": []}
        problems = prefix_problems(s["instances"], k, earlier_ids)
        if problems:
            rec["status"] = "malformed"
            rec["findings"] = [{"kind": "prefix", "detail": p} for p in problems]
            out.append(rec)
            continue
        if Q.question_of(s["instances"], catalog) is not None:   # it asks: a query, and nothing joins the prefix
            try:
                asked = Q.ask(s["instances"], catalog, accepted, reference_time)
            except E.EmitError as exc:
                rec["status"] = "malformed"
                details = exc.args[0] if exc.args and isinstance(exc.args[0], list) else [str(exc)]
                rec["findings"] = [{"kind": "instance", "detail": d} for d in details]
                out.append(rec)
                continue
            rec["kind"] = "question"
            rec["question"] = {**asked, **L.question(asked)}
            rec["findings"] = list(asked["findings"])
            out.append(rec)
            continue
        prefix = accepted + list(s["instances"])
        try:
            item = {"id": "block", "instances": prefix, "unmapped": s.get("unmapped") or []}
            if reference_time is not None:
                item["reference_time"] = reference_time
            em = E.emit(item, catalog)
        except E.EmitError as exc:
            rec["status"] = "malformed"
            details = exc.args[0] if exc.args and isinstance(exc.args[0], list) else [str(exc)]
            rec["findings"] = [{"kind": "instance", "detail": d} for d in details]
            out.append(rec)
            continue
        now = em["statements"]
        now_set, prev_set = set(now), set(prev_statements)
        changed = [x for x in prev_statements if x not in now_set]
        if changed:
            rec["findings"].append({"kind": "revision-needed",
                                    "detail": f"{len(changed)} statement(s) of earlier sentences change or vanish once "
                                              f"sentence {k} is read (first: {changed[0][:160]}); their records keep "
                                              f"what they said"})
        new = [i for i, x in enumerate(now) if x not in prev_set]
        rec["statements"] = [now[i] for i in new]
        rec["records"] = [em["records"][i] for i in new]
        had = set(prev_declarations)
        rec["declarations"] = [d for d in em["declarations"] if d not in had]
        out.append(rec)
        accepted = prefix
        earlier_ids |= {i.get("id") for i in s["instances"] if isinstance(i, dict)}
        prev_statements, prev_declarations = now, em["declarations"]
    return out


def context_section(prior: list[dict]) -> str:
    """The CONTEXT of the next sentence: each earlier sentence (``{"k", "text", "instances"}``, qualified) with its
    instance records, the earliest first; empty for the first sentence of a block."""
    if not prior:
        return ""
    lines = [CONTEXT_HEADER]
    for s in prior:
        lines.append(f"[s{s['k']}] {s['text']}")
        lines += [json.dumps({k: v for k, v in inst.items() if k != "span"} if isinstance(inst, dict) else inst,
                             ensure_ascii=False) for inst in s["instances"]]
    return "\n".join(lines)


def context_of(example_context: list) -> list[dict]:
    """A catalog case's ``context`` (``[{"text", "instances"}]``, local ids as the parser wrote them) as the qualified
    earlier sentences of a block."""
    return [{"k": i, "text": c["text"], "instances": qualify(c.get("instances") or [], i)}
            for i, c in enumerate(example_context or [], start=1)]


def sentence_record(context: list, text: str, instances: list, catalog: dict | None = None, unmapped=None,
                    reference_time=None) -> dict:
    """The record of a sentence read after a context (``context_of``): its share of the prefix's emission. The
    context's own records must come out clean; a problem there is the case's, reported as a malformed record."""
    k = len(context) + 1
    recs = block_records(list(context) + [{"k": k, "text": text, "instances": qualify(instances, k),
                                           "unmapped": unmapped or []}], catalog, reference_time)
    bad = [r for r in recs[:-1] if r["status"] != "ok"]
    if bad:
        return {**recs[-1], "status": "malformed",
                "findings": [{"kind": "context", "detail": f"the context's sentence s{r['k']} is {r['status']}: "
                              + "; ".join(f["detail"] for f in r["findings"])[:300]} for r in bad]}
    return recs[-1]


def _sha(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


# --------------------------------------------------------------------------
# blocks from a selection and from a parsed file
# --------------------------------------------------------------------------


def blocks_of(rows: list[dict]) -> list[list[dict]]:
    """The selection rows grouped into blocks — one per (dataset, doc), in ``sent`` order — in first-seen order."""
    order, groups = [], {}
    for r in rows:
        key = (r.get("dataset"), r.get("doc") if r.get("doc") is not None else r["id"])
        if key not in groups:
            groups[key] = []
            order.append(key)
        groups[key].append(r)
    return [sorted(groups[key], key=lambda r: (r.get("sent") or 0)) for key in order]


def _good(rec: dict | None) -> bool:
    return bool(rec) and not rec.get("error") and isinstance(rec.get("response"), dict)


def walk(block: list[dict], replies: dict) -> tuple[list[dict], dict | None]:
    """The block's sentences that have a stored successful reply made under the right context, in order, up to the
    first that has none: ``([{"k", "text", "instances", "unmapped", "row"}], the next row to parse or None)``."""
    prior: list[dict] = []
    for k, row in enumerate(block, start=1):
        context = context_section(prior)
        rec = replies.get(row["id"])
        if not (_good(rec) and (rec.get("item") or {}).get("context_sha256") == (_sha(context) if context else None)):
            return prior, row
        resp = rec["response"]
        prior.append({"k": k, "text": row["text"], "instances": qualify(resp.get("instances") or [], k),
                      "unmapped": resp.get("unmapped") or [], "row": row})
    return prior, None


def read_replies(path: str) -> dict:
    """The last successful reply per sentence id in a parsed file (a later reply of the same sentence wins)."""
    out: dict = {}
    if not os.path.exists(path):
        return out
    with open(path, encoding="utf-8") as fh:
        for line in fh:
            if line.strip():
                r = json.loads(line)
                if _good(r.get("reply")):
                    out[r["id"]] = r["reply"]
    return out


# --------------------------------------------------------------------------
# the runner
# --------------------------------------------------------------------------


def parse(args) -> int:
    """Walk every block of the selection in order: sentence k is parsed only after sentence k−1 has a stored reply,
    with the earlier sentences as its context; a stored reply is reused only when it was made under the same
    context. Blocks run in parallel (``--workers``), the sentences of one block never do. Exit 3 when the account
    cannot pay (the rest is left for a resume)."""
    sp = S.load_parse_script(args.parse_script)
    with open(args.sample, encoding="utf-8") as fh:
        rows = [json.loads(l) for l in fh if l.strip()]
    blocks = blocks_of(rows)
    stale = None if args.dry_run else S.stale_prompt(args.prompt)
    if stale:
        print(f"error: {stale}", file=sys.stderr)
        return 2
    with open(args.prompt, encoding="utf-8") as fh:
        body_sha = S.prompt_body_sha(fh.read())
    manifest_id = MF.current_id()
    replies = read_replies(args.out)
    pending = sum(len(b) - len(walk(b, replies)[0]) for b in blocks)
    print(f"planned up to {pending} calls ({len(rows)} sentences in {len(blocks)} blocks) · manifest {manifest_id}")
    if args.dry_run or not pending:
        return 0
    fatal = getattr(sp, "FatalProviderError", ())
    if not getattr(args, "no_prime", False) and hasattr(sp, "prime"):   # the catalog alone first, as the other runners do
        try:
            pu = sp.prime(args)
            if pu is not None:
                print(f"primed (start): catalog alone, in={pu.get('input')} cached={pu.get('cached')}", flush=True)
        except Exception as exc:
            print(f"prime failed ({exc})", flush=True)
    st = {"stop": None, "done": 0, "failed": 0}
    lock = threading.Lock()
    with open(args.out, "a", encoding="utf-8") as out:
        def run_block(block):
            while not st["stop"]:
                prior, row = walk(block, replies)
                if row is None:
                    return
                k = len(prior) + 1
                context = context_section([{"k": p["k"], "text": p["text"], "instances": p["instances"]} for p in prior])
                try:
                    rec = sp.parse_sentence(row["text"], args, row["id"], context=context or None)
                except fatal as exc:                    # the account cannot pay: stop the run
                    st["stop"] = str(exc).splitlines()[0][:200]
                    rec = {"item": {"id": row["id"], "text": row["text"]}, "response": None,
                           "error": f"request failed: {exc}"}
                except sp.ProviderError as exc:
                    rec = {"item": {"id": row["id"], "text": row["text"]}, "response": None,
                           "error": f"request failed: {exc}"}
                rec["prompt_body_sha256"] = body_sha
                rec["manifest_id"] = manifest_id
                rec["block"] = {"doc": row.get("doc"), "k": k, "available_from": k}
                with lock:
                    out.write(json.dumps({**row, "reply": rec}, ensure_ascii=False) + "\n")
                    out.flush()
                    st["done"] += 1
                    ok = _good(rec)
                    st["failed"] += not ok
                    if ok:
                        replies[row["id"]] = rec
                    print(f"[{st['done']}] {row.get('doc')} s{k} {'ok   ' if ok else 'error'} · {row['text'][:80]}", flush=True)
                if not _good(rec):
                    return                              # the later sentences need this one's record: next run
        workers = max(1, getattr(args, "workers", 1) or 1)
        if workers == 1:
            for b in blocks:
                run_block(b)
        else:
            with ThreadPoolExecutor(max_workers=workers) as pool:
                list(pool.map(run_block, blocks))
    print(f"done: {st['done'] - st['failed']} replies stored, {st['failed']} failed")
    if st["stop"]:
        print(f"STOPPED: {st['stop']} — the rest is left for a resume")
        return 3
    return 0


def records(args, catalog: dict) -> int:
    with open(args.sample, encoding="utf-8") as fh:
        rows = [json.loads(l) for l in fh if l.strip()]
    replies = read_replies(args.parsed)
    for block in blocks_of(rows):
        if args.doc and str(block[0].get("doc")) != args.doc:
            continue
        prior, _ = walk(block, replies)
        for rec in block_records(prior, catalog):
            print(f"== {block[0].get('doc')} s{rec['k']} (available from s{rec['available_from']}) {rec['status']} · {rec['text']}")
            for line in rec["statements"]:
                print("   ", line)
            for line in (rec.get("question") or {}).get("queries") or []:
                print("    ASKS", line)
            for f in rec["findings"]:
                print("    FINDING", f["kind"], f["detail"][:200])
    return 0


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="python -m tmpl.blocks", description=__doc__.split("\n\n")[0])
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("parse", help="parse the selection's blocks sentence by sentence")
    p.add_argument("--sample", required=True)
    p.add_argument("--out", required=True)
    p.add_argument("--workers", type=int, default=1, help="blocks in parallel (the sentences of a block never are)")
    p.add_argument("--dry-run", action="store_true")
    p.add_argument("--no-prime", action="store_true")
    p.add_argument("--parse-script", default=S.PARSE_SCRIPT, help="semantic-parse.py, or a stand-in (tests)")
    S.load_parse_script(S.PARSE_SCRIPT).add_provider_args(p)
    r = sub.add_parser("records", help="print the per-sentence records of the parsed blocks")
    r.add_argument("--sample", required=True)
    r.add_argument("--parsed", required=True)
    r.add_argument("--doc", default=None)
    args = ap.parse_args(argv)
    if args.cmd == "parse":
        return parse(args)
    return records(args, CAT.load())


if __name__ == "__main__":
    sys.exit(main())
