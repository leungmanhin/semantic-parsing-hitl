"""C7 (engine load) for emitted atoms. Runs under PeTTaChainer's own environment and imports
nothing but the harness validator, so that environment is never touched:

    cd /home/manhin/Dev/PeTTaChainer && STEPS=400 uv run python \
        /home/manhin/Dev/semantic-parsing-hitl/templates/tmpl/c7.py <statements.jsonl> ...

Each input line is {"id", "run", "statements"} (a parses file, or the registry examples as
rendered by `python -m tmpl.pilot examples`).
"""
from __future__ import annotations

import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(HERE)), "fusenf", "harness"))

import validator as V  # noqa: E402


def main(argv) -> int:
    if not argv:
        print(__doc__)
        return 2
    total = bad = 0
    for path in argv:
        for line in open(path, encoding="utf-8"):
            if not line.strip():
                continue
            r = json.loads(line)
            total += 1
            findings = V.check_c7(r["statements"], strict=True)
            if findings:
                bad += 1
                print("C7", f"{r['id']}__run{r['run']}", [f["detail"][:200] for f in findings])
    print(f"C7: {total} statement sets loaded, {bad} with findings")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
