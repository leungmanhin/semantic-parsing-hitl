"""Fiction-world corpus — external downstream parse job (owner side quest 2, 2026-08-27).

Source: /home/manhin/Dev/semantic-chemistry/experiments/expt2-fiction-world/world_rules.json
(30 items, each `{"id": "R<n>", "rule": <sentence>, "texts": [<sentence>...]}`; the source
file's sha256 is pinned in the manifest). One corpus record per sentence.

Role: EXTERNAL / MEASUREMENT-STYLE — parsed for the semantic-chemistry consumer, follows the
standard parse -> review -> adjudicate pipeline, and is NEVER part of the mining substrate.

Record shape: `fusenf-corpus/1`, ids `fict-NNNNNN` sequential in source order (the
validator's C1 id contract is `<tier>-<6 digits>`; the item/field mapping lives in
`source_id` ("R1/rule"), `labels.item`/`labels.field`, and the manifest's `id_map`);
`equiv_class` = `fictR-R<nn>` groups a source item — the dispatch constraint is that no
parse batch may contain two sentences from the same item (owner instruction), which the
batch builder enforces off this field. No context is supplied (self-contained declaratives;
fictional vocabulary parses like any open-class lexical material).

Deterministic: source order preserved, no clock, no randomness (date passed in).

Usage:  python build_fiction.py --date YYYY-MM-DD
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir, "harness"))
from records import input_sha256  # noqa: E402

SOURCE = "/home/manhin/Dev/semantic-chemistry/experiments/expt2-fiction-world/world_rules.json"
CONTEXT = {"today": None, "domain": None, "prior": [], "notes": None}
_RE_WORD = re.compile(r"[A-Za-z][A-Za-z'-]*")


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", default=SOURCE)
    ap.add_argument("--out", default=os.path.join(HERE, "fiction.jsonl"))
    ap.add_argument("--manifest", default=os.path.join(HERE, "fiction_manifest.json"))
    ap.add_argument("--date", required=True, help="YYYY-MM-DD — passed in, never read off a clock")
    ap.add_argument("--prefix", default="fict", help="record id prefix (<prefix>-NNNNNN)")
    ap.add_argument("--skip-rules", action="store_true",
                    help="corpus the texts only — the 'rule' field is not parsed "
                         "(consumer feedback, 2026-09-01 rewrite round)")
    args = ap.parse_args()

    raw = open(args.source, "rb").read()
    items = json.loads(raw)
    records = []
    seq = 0
    for item in items:
        m = re.fullmatch(r"R(\d+)", item["id"])
        if not m:
            raise SystemExit(f"unexpected item id {item['id']!r}")
        rnn = f"R{int(m.group(1)):02d}"
        parts = ([] if args.skip_rules else [("rule", item["rule"])]) + [
            (f"t{k}", t) for k, t in enumerate(item["texts"], 1)]
        for field, sentence in parts:
            sentence = sentence.strip()
            if not (sentence and sentence.isprintable()):
                raise SystemExit(f"unprintable/empty sentence in {item['id']}/{field}")
            seq += 1
            records.append({
                "schema": "fusenf-corpus/1",
                "id": f"{args.prefix}-{seq:06d}",
                "source": "semantic-chemistry/expt2-fiction-world",
                "source_id": f"{item['id']}/{field}",
                "source_license": "internal (downstream consumer)",
                "sentences": [sentence],
                "context": CONTEXT,
                "equiv_class": f"fictR-{rnn}",
                "labels": {"words": len(_RE_WORD.findall(sentence)),
                           "item": item["id"], "field": "rule" if field == "rule" else "text"},
                "input_sha256": input_sha256({"sentences": [sentence], "context": CONTEXT}),
            })

    ids = [r["id"] for r in records]
    if len(set(ids)) != len(ids):
        raise SystemExit("duplicate record ids")
    with open(args.out, "w", encoding="utf-8") as fh:
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    manifest = {
        "id_map": {r["id"]: r["source_id"] for r in records},
        "source_path": args.source,
        "source_sha256": hashlib.sha256(raw).hexdigest(),
        "source_items": len(items),
        "records": len(records),
        "rules": sum(1 for r in records if r["labels"]["field"] == "rule"),
        "texts": sum(1 for r in records if r["labels"]["field"] == "text"),
        "built": args.date,
        "role": "external-downstream (semantic-chemistry); NEVER in the mining substrate",
        "dispatch_constraint": "no parse batch may contain two sentences of one equiv_class",
    }
    json.dump(manifest, open(args.manifest, "w", encoding="utf-8"), indent=1, sort_keys=True)
    print(f"-> {args.out}  ({len(records)} records from {len(items)} items)")
    print(f"-> {args.manifest}")


if __name__ == "__main__":
    main()
