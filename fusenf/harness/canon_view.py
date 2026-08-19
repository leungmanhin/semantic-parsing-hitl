"""FUSE-NF — human-readable before/after view of canonical records.

Canonical records carry neither the sentence nor the original statements (they
link back via ``parse_input_sha256`` and per-atom ``proof_name``), so this
viewer joins ``canonical/<tier>.canon.jsonl`` with its sibling
``parses/<tier>.parses.jsonl`` by ``(id, run)`` and prints, per record:

  * the sentence(s) parsed;
  * BEFORE — the faithful statements exactly as the parse agent wrote them;
  * AFTER — the canonical atoms in linearization order, each carrying its STV,
    its originating proof name, and projection markers:
        [S]  surface-record atom — dropped by the content_id projection
        [O]  opaque head — a single node for mining, interior untouchable
  * the skolem renaming map and the three ids.

The three ids are three projections of ONE atom list, so they are shown as one
listing plus markers rather than three copies: graph_id hashes everything you
see, shape_id the same lines with the STV column dropped, content_id everything
except the [S]-marked lines.

Read-only; touches no identity machinery. Usage (from fusenf/harness):
  python canon_view.py ../canonical/tierB.canon.jsonl                 # whole file
  python canon_view.py ../canonical/tierB.canon.jsonl --limit 3
  python canon_view.py ../canonical/tierA.canon.jsonl --ids tierA-000037,tierA-000038
  python canon_view.py ../canonical/tierC_p4.canon.jsonl --out view.md
"""

from __future__ import annotations

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import canonicalize as C  # noqa: E402


def load_jsonl(path):
    with open(path, encoding="utf-8") as fh:
        return [json.loads(line) for line in fh if line.strip()]


def default_parses_path(canon_path: str) -> str:
    base = os.path.basename(canon_path).replace(".canon.jsonl", ".parses.jsonl")
    return os.path.join(os.path.dirname(os.path.abspath(canon_path)), os.pardir, "parses", base)


def render(rec: dict, parse: dict | None, surface: set, out) -> None:
    w = out.write
    w(f"## {rec['id']} run {rec['run']}   ({rec['canon_version']}, exact={rec.get('exact')})\n\n")
    if parse:
        for s in parse.get("sentences") or []:
            w(f"> {s}\n")
        w("\n")
    else:
        w("> (no matching parse record found — pass --parses)\n\n")

    if parse:
        w("BEFORE (faithful statements, as written by the parse agent):\n")
        for s in parse.get("statements") or []:
            w(f"    {s}\n")
        w("\n")

    w("AFTER (canonical atoms, linearization order; [S]=surface-record/dropped by content_id, [O]=opaque):\n")
    for atom in rec["atoms"]:
        head = atom["term"][1:].split(None, 1)[0].rstrip(")")
        marks = ("[S]" if head in surface else "   ") + ("[O]" if atom.get("opaque") else "   ")
        stv = atom.get("stv") or ["?", "?"]
        w(f"  {marks} {atom['term']}  (STV {stv[0]} {stv[1]})   <- {atom.get('proof_name', '?')}\n")
    w("\n")

    ren = rec.get("renaming") or {}
    if ren:
        w("renaming: " + ", ".join(f"{k} -> {v}" for k, v in sorted(ren.items())) + "\n")
    w(f"graph_id   {rec['graph_id']}     (all lines, with STV)\n")
    w(f"shape_id   {rec['shape_id']}     (all lines, STV column dropped)\n")
    w(f"content_id {rec['content_id']}     (lines except [S], with STV)\n\n")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canon", help="canonical/<tier>.canon.jsonl")
    ap.add_argument("--parses", default=None,
                    help="parses/<tier>.parses.jsonl (default: inferred sibling)")
    ap.add_argument("--ids", default=None, help="comma-separated record ids to show")
    ap.add_argument("--run", type=int, default=None, help="restrict to one run number")
    ap.add_argument("--limit", type=int, default=None)
    ap.add_argument("--out", default=None, help="write to file instead of stdout")
    ap.add_argument("--json", default=None, metavar="PATH",
                    help="instead of the annotated text view, write the 3-field "
                         "sentence/before/after JSON (canonicalize.view_entry format); "
                         "used to backfill views for canon files made before the "
                         "canonicalizer emitted them itself")
    args = ap.parse_args()

    parses_path = args.parses or default_parses_path(args.canon)
    parses = {}
    if os.path.exists(parses_path):
        parses = {(r["id"], r.get("run", 1)): r for r in load_jsonl(parses_path)}
    surface = set(C.load_vocabulary()["surface_record"])

    wanted = set(args.ids.split(",")) if args.ids else None

    if args.json:
        view = {}
        for rec in load_jsonl(args.canon):
            if wanted and rec["id"] not in wanted:
                continue
            if args.run is not None and rec.get("run") != args.run:
                continue
            parse = parses.get((rec["id"], rec.get("run", 1))) or {}
            view[f"{rec['id']} run{rec.get('run', 1)}"] = C.view_entry(parse, rec)
            if args.limit and len(view) >= args.limit:
                break
        C.write_view(view, args.json)
        print(f"-> {args.json} ({len(view)} record(s))")
        return

    shown = 0
    out = open(args.out, "w", encoding="utf-8") if args.out else sys.stdout
    try:
        for rec in load_jsonl(args.canon):
            if wanted and rec["id"] not in wanted:
                continue
            if args.run is not None and rec.get("run") != args.run:
                continue
            render(rec, parses.get((rec["id"], rec.get("run", 1))), surface, out)
            shown += 1
            if args.limit and shown >= args.limit:
                break
    finally:
        if args.out:
            out.close()
            print(f"-> {args.out} ({shown} record(s))")


if __name__ == "__main__":
    main()
