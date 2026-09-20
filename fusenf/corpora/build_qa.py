"""QA task-stream corpus — the consumer's qa_pending.json (semantic-chemistry expt2, 2026-09-19).

Source: qa_pending.json = `{id, rule, texts}` per QA entry (the parse-facing texts only; retired
entries carry no texts and are absent); qa.json supplies each text's parse MODE (query /
statement / intervention) and, for a C intervention, its removal ROOT. Both files' sha256 are
pinned in the manifest. One corpus record per text, ids `<prefix>-NNNNNN` sequential in source
order over ALL texts (so ids are stable across rebuilds); `source_id` = "<item>/t<k>";
`equiv_class` = one class per source item (no parse batch holds two texts of one item).

CHAINED parsing for the what-next (N) entries — owner 2026-09-19: "first parse all the
statements, after that parse the question with the statements of the same entry placed in the
context". An entry is chained when its modes end in a query and it has two or more texts: text k
is parsed with `context.prior` = the statements already parsed for texts 1..k-1 of the same entry
(the parse store's `statements`, verbatim, in order), so a later premise and the question reuse
the earlier witnesses per prompt.txt "Input — TEXT and optional CONTEXT". `context.symbols` (the
carried symbol set the validator's C6 reads) is derived from those atoms. F/W questions, every C
text and every entry's first text are context-free. `labels.stage` = the text's position in its
chain (1 = context-free), `labels.prior_ids` = the records whose statements form its context.

The corpus is REBUILT after each stage with --prior-from <parses.jsonl>: a record is written
only when its context is ready (stage 1 always; stage k when every earlier text of its entry is
in the parse store at --run). A ready record never changes between rebuilds (its context is
fixed by the store), so assembled records stay byte-identical; not-ready records are listed in
the manifest under `pending_context`.

Role: EXTERNAL / MEASUREMENT-STYLE — parsed for the semantic-chemistry consumer, follows the
standard parse -> review -> adjudicate pipeline, and is NEVER part of the mining substrate.
Deterministic: source order preserved, no clock, no randomness (date passed in).

Usage:  python build_qa.py --date YYYY-MM-DD [--prior-from ../parses/qa_pending.parses.jsonl --run 1]
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
from collections import Counter

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir, "harness"))
from records import input_sha256, iter_terms, parse_sexp  # noqa: E402

CONSUMER = "/home/manhin/Dev/semantic-chemistry/experiments/expt2-fiction-world"
PENDING = os.path.join(CONSUMER, "qa_pending.json")
QA = os.path.join(CONSUMER, "qa.json")
NO_CONTEXT = {"today": None, "domain": None, "prior": [], "notes": None}
MODES = ("query", "statement", "intervention")
_RE_WORD = re.compile(r"[A-Za-z][A-Za-z'-]*")
_RE_SYMBOL = re.compile(r"^[a-z][a-z0-9_]*$")


def carried_symbols(atoms: list[str]) -> list[str]:
    """Every lowercase symbol in an argument slot of the context atoms (kinds, constants,
    witnesses) — the set a parse made under this context may legitimately attach to."""
    out: set[str] = set()
    for atom in atoms:
        node = parse_sexp(atom)["node"]
        if node is None:
            continue
        if isinstance(node, list) and len(node) == 3 and node[0] == "Interpretation":
            node = node[2]  # (Interpretation rN (: name expr tv)) — the multi-reading wrapper
        if isinstance(node, list) and len(node) == 4 and node[0] == ":":
            node = node[2]  # the asserted expression: proof names are never carriers
        for term in iter_terms(node):
            if not isinstance(term, list):
                continue
            for arg in term[1:]:
                if isinstance(arg, str) and _RE_SYMBOL.match(arg):
                    out.add(arg)
    return sorted(out)


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--pending", default=PENDING, help="consumer qa_pending.json (texts to parse)")
    ap.add_argument("--qa", default=QA, help="consumer qa.json (modes / roots per text)")
    ap.add_argument("--out", default=os.path.join(HERE, "qa_pending.jsonl"))
    ap.add_argument("--manifest", default=os.path.join(HERE, "qa_pending_manifest.json"))
    ap.add_argument("--date", required=True, help="YYYY-MM-DD — passed in, never read off a clock")
    ap.add_argument("--prefix", default="qap", help="record id prefix (<prefix>-NNNNNN)")
    ap.add_argument("--prior-from", default=None,
                    help="parse store supplying the context of chained texts (rebuild after each stage)")
    ap.add_argument("--run", type=int, default=1, help="parse run to read from --prior-from")
    args = ap.parse_args()

    raw_pending = open(args.pending, "rb").read()
    raw_qa = open(args.qa, "rb").read()
    pending = json.loads(raw_pending)
    qa_by_id = {e["id"]: e for e in json.loads(raw_qa)}

    store: dict[str, list[str]] = {}
    if args.prior_from and os.path.exists(args.prior_from):
        for ln in open(args.prior_from, encoding="utf-8"):
            p = json.loads(ln)
            if p.get("run") == args.run:
                store[p["id"]] = list(p["statements"])

    records, not_ready = [], []
    seq = 0
    for item in pending:
        if not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.-]*", item["id"]):
            raise SystemExit(f"unexpected item id {item['id']!r}")
        src = qa_by_id.get(item["id"])
        if src is None:
            raise SystemExit(f"{item['id']}: not in {args.qa}")
        if list(src["texts"]) != list(item["texts"]):
            raise SystemExit(f"{item['id']}: pending texts differ from qa.json texts")
        modes, roots = list(src["modes"]), list(src.get("roots") or [None] * len(item["texts"]))
        if len(modes) != len(item["texts"]) or any(m not in MODES for m in modes):
            raise SystemExit(f"{item['id']}: bad modes {modes}")
        chained = modes[-1] == "query" and len(item["texts"]) >= 2
        ids = [f"{args.prefix}-{seq + k:06d}" for k in range(1, len(item["texts"]) + 1)]
        for k, text in enumerate(item["texts"]):
            seq += 1
            rid = ids[k]
            text = text.strip()
            if not text or not text.isprintable():
                raise SystemExit(f"unprintable/empty text in {item['id']}/t{k + 1}")
            prior_ids = ids[:k] if chained else []
            if prior_ids:
                if any(pid not in store for pid in prior_ids):
                    not_ready.append({"id": rid, "item": item["id"], "field": f"t{k + 1}",
                                      "waiting_for": [pid for pid in prior_ids if pid not in store]})
                    continue
                atoms = [a for pid in prior_ids for a in store[pid]]
                context = {"today": None, "domain": None, "prior": atoms, "notes": None,
                           "symbols": carried_symbols(atoms)}
            else:
                context = dict(NO_CONTEXT)
            labels = {"words": len(_RE_WORD.findall(text)), "item": item["id"], "field": "text",
                      "category": src.get("category") or item["id"][0], "mode": modes[k],
                      "root": roots[k], "stage": (k + 1) if chained else 1, "prior_ids": prior_ids}
            records.append({
                "schema": "fusenf-corpus/1",
                "id": rid,
                "source": "semantic-chemistry/expt2-fiction-world",
                "source_id": f"{item['id']}/t{k + 1}",
                "source_license": "internal (downstream consumer)",
                "sentences": [text],
                "context": context,
                "equiv_class": f"{args.prefix}-{item['id']}",
                "labels": labels,
                "input_sha256": input_sha256({"sentences": [text], "context": context}),
            })

    rids = [r["id"] for r in records]
    if len(set(rids)) != len(rids):
        raise SystemExit("duplicate record ids")
    with open(args.out, "w", encoding="utf-8") as fh:
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    manifest = {
        "id_map": {r["id"]: r["source_id"] for r in records},
        "source_path": args.pending,
        "source_sha256": hashlib.sha256(raw_pending).hexdigest(),
        "modes_path": args.qa,
        "modes_sha256": hashlib.sha256(raw_qa).hexdigest(),
        "source_items": len(pending),
        "texts": seq,
        "records": len(records),
        "pending_context": not_ready,
        "prior_from": args.prior_from if store else None,
        "modes": dict(sorted(Counter(r["labels"]["mode"] for r in records).items())),
        "stages": {str(k): v for k, v in sorted(Counter(r["labels"]["stage"] for r in records).items())},
        "built": args.date,
        "role": "external-downstream (semantic-chemistry QA task stream); NEVER in the mining substrate",
        "dispatch_constraint": ("no parse batch may contain two texts of one equiv_class; a chained "
                                "text (labels.stage > 1) is parsed only after its labels.prior_ids "
                                "are assembled, with their statements as context.prior"),
    }
    json.dump(manifest, open(args.manifest, "w", encoding="utf-8"), indent=1, sort_keys=True)
    print(f"-> {args.out}  ({len(records)} records ready from {len(pending)} items / {seq} texts; "
          f"{len(not_ready)} waiting for context)")
    print(f"-> {args.manifest}")


if __name__ == "__main__":
    main()
