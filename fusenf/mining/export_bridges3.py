"""FUSE-NF — export gauntlet ROUND-3 validated rules to PeTTaChainer syntax.

Regenerates ``rules/mined_bridges_wave3.metta`` from ``rules/validated3.jsonl``
(first written inline on 2026-08-17; scripted here for reproducibility). Two
families: mutual Member implications for validated lexical consolidations
(conf = min(0.9, 0.7 + 0.05*support), wave-1 convention) and class-conditioned
Theme/Patient role bridges for validated role-canonicalizations (flat 0.8,
wave-1 form). Load beside seeded_rules.metta + mined_bridges_wave{1,2}.metta;
proof names unique (mined_w3_*).

Usage:
  python export_bridges3.py --date 2026-08-17 \\
      [--validated ../rules/validated3.jsonl] [--out ../rules/mined_bridges_wave3.metta]
"""

from __future__ import annotations

import argparse
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--validated", default=os.path.join(FUSENF, "rules", "validated3.jsonl"))
    ap.add_argument("--out", default=os.path.join(FUSENF, "rules", "mined_bridges_wave3.metta"))
    ap.add_argument("--date", required=True)
    args = ap.parse_args()

    V = [json.loads(l) for l in open(args.validated, encoding="utf-8") if l.strip()]
    L = ["; ===== FUSE-NF loop-2 mined bridges (P4 GAUNTLET ROUND 3, VALIDATED ONLY) =====",
         "; generated %s by mining/export_bridges3.py from rules/validated3.jsonl;" % args.date,
         "; load beside seeded_rules.metta, mined_bridges_wave1.metta and",
         "; mined_bridges_wave2.metta; proof names unique (mined_w3_*).", ""]
    n = 0
    L.append("; ----- lexical equivalences (loop-2 singleton-mined, judge-validated) -----")
    for v in V:
        if v["kind"] == "lexical-collapse" and v["status"] == "validated":
            a, b = re.findall(r"\(Member \$\w+ ([a-z][a-z0-9_]*)\)",
                              v["lhs"][0] + " " + v["rhs"][0])
            c = round(min(0.9, 0.7 + 0.05 * v.get("support", 0)), 2)
            L.append(f"; {a} <-> {b}   loop-2 singleton, judges unanimous")
            L.append(f"(: mined_w3_lex_{a}_{b} (Implication (Member $x {a}) "
                     f"(Member $x {b})) (STV 1.0 {c}))")
            L.append(f"(: mined_w3_lex_{b}_{a} (Implication (Member $x {b}) "
                     f"(Member $x {a})) (STV 1.0 {c}))")
            n += 2
    L.append("")
    L.append("; ----- role bridges (loop-2 flip witnesses, class-conditioned; wave-1 form) -----")
    for v in V:
        if v["kind"] == "role-canonicalization" and v["status"] == "validated":
            ev = re.findall(r"\(Member \$\w+ ([a-z][a-z0-9_]*)\)", v["lhs"][0])[0]
            L.append(f"(: mined_w3_role_{ev}_tp (Implication (And (Member $e {ev}) "
                     f"(Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))")
            L.append(f"(: mined_w3_role_{ev}_pt (Implication (And (Member $e {ev}) "
                     f"(Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))")
            n += 2
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write("\n".join(L) + "\n")
    print(f"-> {args.out}  ({n} rules)")


if __name__ == "__main__":
    main()
