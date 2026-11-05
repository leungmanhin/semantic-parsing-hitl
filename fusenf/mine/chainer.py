"""THE ENGINE RUNNER: a candidate's atoms or rules beside a sentence's statements on PeTTaChainer, answering
"does this space derive that pattern?" (§5: evidence by execution; §5.2's contrast tests; §5.4's pair
classification). Needs the chainer's environment::

    cd <the PeTTaChainer checkout> && PYTHONPATH=<this repo> uv run python -m fusenf.mine.chainer --facts facts.txt --query "(Agent $e $x)"

with this repository's root on the path. Elsewhere ``available()``
is False and the methods record ``"engine": "unavailable"`` instead of a verdict.
"""
from __future__ import annotations

import argparse
import json
import os
import re
import sys

from . import REPO

RULES_PATH = os.path.join(REPO, "templates", "generated", "seeded_rules.metta")
_TV = re.compile(r"\(STV ([0-9.e-]+) ([0-9.e-]+)\)\)$")

try:
    from pettachainer import PeTTaChainer  # type: ignore
except Exception:  # not the chainer's environment
    PeTTaChainer = None


def available() -> bool:
    return PeTTaChainer is not None


def seeded_rules() -> list[str]:
    """The catalog's background rules, one s-expression each (comments dropped)."""
    out, depth, start = [], 0, None
    text = "\n".join(ln for ln in open(RULES_PATH, encoding="utf-8").read().splitlines() if not ln.strip().startswith(";"))
    for i, ch in enumerate(text):
        if ch == "(":
            if depth == 0:
                start = i
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0 and start is not None:
                out.append(text[start:i + 1])
                start = None
    return out


def tv(result) -> tuple[float, float] | None:
    m = _TV.search(result[0]) if result else None
    return (float(m.group(1)), float(m.group(2))) if m else None


class Engine:
    """One chainer space: the seeded rules (unless ``rules=False``), plus facts and candidate rules."""

    def __init__(self, facts: list[str] = (), extra: list[str] = (), rules: bool = True):
        if PeTTaChainer is None:
            raise RuntimeError("pettachainer is not importable here: run under the chainer's environment")
        self.h = PeTTaChainer()
        self.added = 0
        for a in (seeded_rules() if rules else []) + list(facts) + list(extra):
            self.h.add_atom(a)
            self.added += 1

    def query(self, pattern: str, steps: int = 400):
        """A proof query ``(: $prf <pattern> $tv)``; returns the chainer's answers (a list, possibly empty)."""
        return self.h.query(f"(: $prf {pattern} $tv)", steps=steps, timeout_sec=0)

    def derives(self, pattern: str, steps: int = 400) -> tuple[bool, tuple | None]:
        res = self.query(pattern, steps)
        return (bool(res), tv(res))


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="query a space of facts (+ the seeded rules) on the chainer")
    ap.add_argument("--facts", required=True, help="a file with one statement per line, or a JSON list")
    ap.add_argument("--extra", default=None, help="a file with candidate rules, one per line")
    ap.add_argument("--query", action="append", required=True, help="a pattern (repeatable)")
    ap.add_argument("--steps", type=int, default=400)
    ap.add_argument("--no-rules", action="store_true")
    args = ap.parse_args(argv)
    if not available():
        print("the chainer is not importable here", file=sys.stderr)
        return 2
    facts = [l.strip() for l in open(args.facts, encoding="utf-8") if l.strip()]
    extra = [l.strip() for l in open(args.extra, encoding="utf-8") if l.strip()] if args.extra else []
    eng = Engine(facts, extra, rules=not args.no_rules)
    out = {}
    for q in args.query:
        ok, t = eng.derives(q, args.steps)
        out[q] = {"derived": ok, "tv": t}
    print(json.dumps(out))
    return 0


if __name__ == "__main__":
    sys.exit(main())
