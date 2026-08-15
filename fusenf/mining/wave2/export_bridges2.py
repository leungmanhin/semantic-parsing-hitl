"""FUSE-NF — export gauntlet ROUND-2 validated rules to PeTTaChainer syntax.

Reads ``rules/validated2.jsonl`` and writes ``rules/mined_bridges_wave2.metta``
in seeded_rules.metta form, loadable beside the wave-1 bridge file. Families:

* **meta-node expansions** (validated subtree-collapse packs): one implication
  per component, ``(Implication <meta atom> <component>)`` — single-atom
  conclusions only (engine-safe), all variables premise-bound by construction.
  STV 1.0 0.99: the expansion is definitional (the pack is bijective), matching
  the structural-link TV convention. These are the DECOMPRESSOR: consolidated
  KBs answer faithful-vocabulary queries through them (M5's gate).
* **lexical equivalences** (validated AE pairs, consolidation or bridging):
  mutual Member-class implications, wave-1 conf formula
  ``c = min(0.9, 0.7 + 0.05*support)``.

Rejected rules are skipped with counts. Deterministic; --date is an argument.

Usage:
  python export_bridges2.py --date 2026-08-14 \
      [--validated ../../rules/validated2.jsonl] \
      [--out ../../rules/mined_bridges_wave2.metta]
"""

from __future__ import annotations

import argparse
import collections
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(os.path.dirname(HERE))


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--validated", default=os.path.join(FUSENF, "rules", "validated2.jsonl"))
    ap.add_argument("--out", default=os.path.join(FUSENF, "rules", "mined_bridges_wave2.metta"))
    ap.add_argument("--date", required=True)
    args = ap.parse_args()

    rules = load(args.validated)
    lines = [
        "; ===== FUSE-NF wave-2 mined bridges (P4 GAUNTLET ROUND 2, VALIDATED ONLY) =====",
        "; generated %s by mining/wave2/export_bridges2.py from rules/validated2.jsonl" % args.date,
        "; load beside seeded_rules.metta and mined_bridges_wave1.metta;",
        "; all proof names are unique (mined_w2_*).",
        "; meta-node expansions are the decompressor for packed consolidated KBs:",
        ";   (Mn... $C $v ...) |- each original component atom, STV 1.0 0.99.",
        "",
    ]
    skipped = collections.Counter()
    n = 0

    lines.append("; ----- meta-node expansions (§4.3.3 subtree-collapse, validated packs) -----")
    for r in sorted(rules, key=lambda r: r["id"]):
        if r["kind"] != "subtree-collapse":
            continue
        if r["status"] != "validated":
            skipped["meta-" + r["status"]] += 1
            continue
        m = r["mdl"]
        lines.append("; %s %s  applications %d, marginal savings %d atoms (net strict %+d)"
                     % (r["id"], r["meta"]["head"], m["applications"],
                        m["marginal_savings"], m["marginal_net_strict"]))
        for i, (meta_atom, comp) in enumerate(r["meta"]["expansions"]):
            lines.append("(: mined_w2_exp_%s_%d (Implication %s %s) (STV 1.0 0.99))"
                         % (r["meta"]["head"], i, meta_atom, comp))
            n += 1
    lines.append("")

    lines.append("; ----- lexical equivalences (§4.3.5 AE pairs judged genuine) -----")
    for r in sorted(rules, key=lambda r: r["id"]):
        if r["kind"] != "lexical-collapse":
            continue
        if r["status"] != "validated":
            skipped["lex-" + r["status"]] += 1
            continue
        m = re.findall(r"\(Member \$\w+ ([a-z][a-z0-9_]*)\)", r["lhs"][0] + " " + r["rhs"][0])
        if len(m) != 2:
            skipped["lex-unparsed"] += 1
            continue
        a, b = m
        c = round(min(0.9, 0.7 + 0.05 * r.get("support", 0)), 2)
        lines.append("; %s <-> %s   AE cosine %.2f, support %d, judged same-truth"
                     % (a, b, r["provenance"]["cosine"], r.get("support", 0)))
        lines.append("(: mined_w2_lex_%s_%s (Implication (Member $x %s) (Member $x %s)) (STV 1.0 %s))"
                     % (a, b, a, b, c))
        lines.append("(: mined_w2_lex_%s_%s (Implication (Member $x %s) (Member $x %s)) (STV 1.0 %s))"
                     % (b, a, b, a, c))
        n += 2

    os.makedirs(os.path.dirname(os.path.abspath(args.out)), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines) + "\n")
    print(f"-> {args.out}")
    print(f"rules {n}   skipped: {dict(sorted(skipped.items())) or 0}")


if __name__ == "__main__":
    main()
