"""Read regression/regression_cases.md into cases, and predict starter-set coverage by heads.

A case is `**[tag] Sentence(s).** — note` followed by an indented block of expected statements.
The file's own comparison rule (ignore witness symbols and proof names) is canonical-form
equality under the harness canonicalizer, so nothing here judges anything.
"""
from __future__ import annotations

import hashlib
import os
import re
import sys

from . import registry as REG

sys.path.insert(0, os.path.join(REG.REPO, "fusenf", "harness"))
import records as HR  # noqa: E402  (harness record helpers)

GOLDENS = os.path.join(REG.REPO, "regression", "regression_cases.md")
HEADER_RE = re.compile(r"^\*\*\[(?P<tag>[^\]]+)\]\s*(?P<text>.*?)\*\*(?P<rest>.*)$")
EXCLUDED_SECTIONS = ("Context input", "Queries")

#: heads the starter-26 emitter can produce, beyond open-class prepositions and connectives
STARTER_HEADS = frozenset("""
: STV Member Inheritance Name QuantifierPhrase GroupOf PartOf Possession Cardinality LocatedIn
Agent Patient Theme Recipient Experiencer Stimulus Holder CoAgent Instrument Location Source Goal
Beneficiary Manner Duration Past Future Ongoing Can Might Probably Must Obligated Permitted
And Or Implication More Measure Time Year Month Day Weekday Hour Minute Before BeforeBy
Because So Although But Yet AsAResult Therefore Consequently Thus EvenThough Despite Since
""".split())


def load(path: str = GOLDENS) -> list[dict]:
    lines = open(path, encoding="utf-8").read().split("\n")
    cases, cur, section = [], None, None
    for i, line in enumerate(lines):
        if line.startswith("## "):
            section, cur = line[3:].strip(), None
            continue
        m = HEADER_RE.match(line)
        if m:
            cur = {"tag": m["tag"], "text": m["text"].strip(), "note": m["rest"].strip(" —"),
                   "section": section, "line": i + 1, "block": []}
            cases.append(cur)
        elif cur is not None and (line.startswith("    ") or line.startswith("\t")):
            cur["block"].append(line)
    for c in cases:
        atoms, _log = HR.extract_atoms("\n".join(c.pop("block")))
        c["statements"] = atoms
        c["is_query"] = any(re.match(r"^\(:\s+\$", s) for s in atoms)
        c["order_key"] = hashlib.sha256(c["tag"].encode("utf-8")).hexdigest()
    return cases


def eligible(case: dict) -> bool:
    """Statement cases with no supplied context: what the pilot can parse blind."""
    if case["is_query"] or not case["statements"]:
        return False
    if any(case["section"].startswith(s) for s in EXCLUDED_SECTIONS):
        return False
    return not any("(Interpretation " in s for s in case["statements"])


def heads_of(statements, vocab_heads: frozenset) -> tuple[set, set]:
    """(closed-class heads used, open-class heads used) across the statements."""
    closed, opened = set(), set()
    for s in statements:
        node = HR.parse_sexp(s)
        for term in HR.iter_terms(node.get("node") if isinstance(node, dict) else node):
            if isinstance(term, list) and term and isinstance(term[0], str):
                h = term[0]
                if h.startswith("sk_") or h.startswith("$"):
                    continue
                (closed if h in vocab_heads else opened).add(h)
    return closed, opened


def coverage_class(case: dict, vocab_heads: frozenset) -> tuple[str, list]:
    """`full` when every closed-class head is one the starter emitter produces, else `partial`.

    A prediction from the expected atoms only: necessary, not sufficient (a factive attitude or
    a control verb uses starter heads in a composition no starter template licenses)."""
    closed, _open = heads_of(case["statements"], vocab_heads)
    outside = sorted(closed - STARTER_HEADS)
    text = " ".join(case["statements"])
    fn_heads = set(re.findall(r"\((sk_[a-z0-9_]+) \$", text))
    if len(fn_heads) > 1:
        outside.append("skolem-function-entity")
    return ("partial" if outside else "full"), outside
