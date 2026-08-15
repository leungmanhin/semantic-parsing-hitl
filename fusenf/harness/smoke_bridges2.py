"""FUSE-NF — smoke test for wave-2 bridges (run via `cd /home/manhin/Dev/PeTTaChainer && uv run python <abs>`).

KB = seeded_rules.metta + mined_bridges_wave2.metta + one hand-packed record
("The depot bought two forklifts" in packed form). Checks that the meta-node
expansion bridges reconstruct every faithful-vocabulary atom, that a
conjunction of two DERIVED conjuncts binds (their shared premise — the meta
atom — is not itself a query conjunct, so the filed premise-reuse gap must not
fire), that a validated wave-2 lexical bridge fires if one exists, and one
negative control.
"""

from __future__ import annotations

import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
sys.path.insert(0, HERE)

from pettachainer import PeTTaChainer  # noqa: E402

SEEDED = os.path.join(FUSENF, os.pardir, "seeded_rules.metta")
BRIDGES2 = os.path.join(FUSENF, "rules", "mined_bridges_wave2.metta")
STEPS = 400

PACKED = [
    "(: s1 (MnEvAgThPast e0 buy x1 x0) (STV 1.0 0.99))",
    "(: s2 (Member x1 depot) (STV 1.0 0.99))",
    "(: s3 (GroupOf x0 forklift) (STV 1.0 0.99))",
    "(: s4 (Cardinality x0 2) (STV 1.0 0.99))",
]


def rule_lines(path):
    out = []
    for line in open(path, encoding="utf-8"):
        line = line.strip()
        if line and not line.startswith(";"):
            out.append(line)
    return out


def main():
    h = PeTTaChainer()
    for l in rule_lines(SEEDED) + rule_lines(BRIDGES2):
        h.add_atom(l)
    for s in PACKED:
        h.add_atom(s)

    checks = [
        ("expand Member", "(: $prf (Member e0 buy) $tv)", True),
        ("expand Past", "(: $prf (Past e0) $tv)", True),
        ("expand Agent", "(: $prf (Agent e0 x1) $tv)", True),
        ("expand Theme", "(: $prf (Theme e0 x0) $tv)", True),
        ("conj of two derived", "(: $prf (And (Member $e buy) (Theme $e $t)) $tv)", True),
        ("negative control", "(: $prf (Member e0 sell) $tv)", False),
    ]
    # a wave-2 lexical bridge, if any were validated
    lex = None
    for line in open(BRIDGES2, encoding="utf-8"):
        m = re.match(r"\(: mined_w2_lex_(\w+?)_(\w+?) ", line)
        if m:
            lex = (m.group(1), m.group(2))
            break
    if lex:
        h.add_atom("(: s5 (Member x9 %s) (STV 1.0 0.9))" % lex[0])
        checks.append(("lexical bridge %s->%s" % lex,
                       "(: $prf (Member x9 %s) $tv)" % lex[1], True))

    n_pass = 0
    for name, q, expect in checks:
        got = bool(h.query(q, steps=STEPS, timeout_sec=0))
        ok = got == expect
        n_pass += ok
        print(f"{'PASS' if ok else 'FAIL'}  {name}: {q}  -> {got} (expect {expect})")
    print(f"{n_pass}/{len(checks)} checks pass")


if __name__ == "__main__":
    main()
