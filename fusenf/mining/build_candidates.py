"""FUSE-NF — build ``rules/candidates.jsonl`` (PLAN.md §7 format) from wave-1 mining.

Assembles the full candidate ledger from §4.3.4's anti-unified rules plus
§4.3.2's #23 flip witnesses, with the two decisions a candidate needs made
mechanically and recorded:

* **routing** (``type``): majority ``expected_routing`` label over the Tier A
  variants the rule was mined from (the seed table's design truth:
  ``X<-Y`` families -> consolidation, converses -> bridging). Tier-C-only
  rules default: 1<->1 lexical -> consolidation, structural -> bridging.
  ``consolidation-lossy`` labels keep type consolidation with
  ``lossless: false``.
* **direction** (consolidation only): lexical pairs point at the CANONICAL
  representative = the more frequent symbol corpus-wide (token count over all
  canonical atom terms; tie -> lexicographically smaller, documented as
  provisional); structural rules point larger-side -> smaller-side, which is
  also what makes the rewriter's atom-count measure strictly non-increasing.
  Note the seed table's arrows are variant->base and MOSTLY agree with
  frequency (buy, begin, repair) but not always (large<-big) — frequency wins
  here, the P4 gauntlet may override per rule.

Sides are stored in rewriter syntax (``$c`` center, ``$x0`` satellites, type
conjuncts inlined), via the same translation the chainer export uses.
Everything is ``status: candidate`` — the P4 gauntlet promotes or rejects.

Usage:
  python build_candidates.py --corpus ../corpora/tierA.jsonl [--corpus ...] \
      --date 2026-08-07 ../canonical/*.canon.jsonl [--out ../rules/candidates.jsonl]
"""

from __future__ import annotations

import argparse
import collections
import json
import os
import re

import export_bridges as EB

HERE = os.path.dirname(os.path.abspath(__file__))
RE_SYM = re.compile(r"(?<![\w$<:\"])[a-z][a-z0-9_]*(?![\w])")
RE_SKOLEM_TOK = re.compile(r"\A[exf]\d+\Z")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def symbol_frequency(canonical_paths):
    freq = collections.Counter()
    for p in canonical_paths:
        for r in load(p):
            for a in r["atoms"]:
                term = re.sub(r'"[^"]*"', " ", a["term"])
                for tok in RE_SYM.findall(term):
                    if not RE_SKOLEM_TOK.match(tok):
                        freq[tok] += 1
    return freq


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical", nargs="+", help="canonical files for the frequency table")
    ap.add_argument("--corpus", action="append", required=True)
    ap.add_argument("--rules", default=os.path.join(HERE, "out", "align_rules.jsonl"))
    ap.add_argument("--slots", default=os.path.join(HERE, "out", "slots.jsonl"))
    ap.add_argument("--out", default=os.path.join(HERE, os.pardir, "rules", "candidates.jsonl"))
    ap.add_argument("--date", required=True)
    ap.add_argument("--min-witnesses", type=int, default=3)
    args = ap.parse_args()

    meta = {}
    for path in args.corpus:
        for r in load(path):
            meta[r["id"]] = r
    freq = symbol_frequency(args.canonical)
    mined = load(args.rules)

    def routing_for(rule):
        votes = collections.Counter()
        for ex in rule["examples"]:
            for cid in ex.split("|"):
                lab = meta.get(cid, {}).get("labels", {})
                er = lab.get("expected_routing")
                if er:
                    votes[er] += 1
        if votes:
            top = votes.most_common(1)[0][0]
            if "bridging-or-reject" in top:
                return "bridging", True
            if top == "bridging":
                return "bridging", True
            lossless = "lossy" not in top
            return "consolidation", lossless
        # Tier-C-only rule: no design label
        if rule["kind"] == "lexical-collapse":
            return "consolidation", True
        return "bridging", True

    out_rows = []
    skipped_unbound = []
    n = 0

    def emit(row):
        nonlocal n
        n += 1
        row["id"] = "rc%04d" % n
        out_rows.append(row)

    for r in sorted(mined, key=lambda r: r["rule_id"]):
        if r["fires_on_control"] or r["kind"] == "polarity-diff":
            continue
        if not r["lhs"] or not r["rhs"]:
            continue   # one-sided add/drop patterns: not rewrite rules
        wit = r.get("k_witnesses", {})
        ta = EB.translate_side(r["lhs"], wit, args.min_witnesses)
        tb = EB.translate_side(r["rhs"], wit, args.min_witnesses)
        if ta is None or tb is None:
            continue
        side_a = sorted(set(ta[0] + ta[1]))
        side_b = sorted(set(tb[0] + tb[1]))
        rtype, lossless = routing_for(r)
        provenance = {
            "method": "paraphrase-align-4.3.4", "mined_rule": r["rule_id"],
            "examples": r["examples"], "classes": r["classes"],
            "slot_cosine": r.get("slot_cosine"), "k_witnesses": wit or None,
            "date": args.date,
        }
        base = {
            "type": rtype, "confidence": EB.conf(r["support"]), "support": r["support"],
            "lossless": lossless, "provenance": provenance, "status": "candidate",
            "kind": r["kind"],
        }
        if rtype == "bridging":
            emit({**base, "lhs": side_a, "rhs": side_b, "direction": "both"})
            continue
        if r["kind"] == "lexical-collapse" and r["symbol_pair"]:
            a, b = r["symbol_pair"]
            # higher corpus frequency wins; on a tie the lexicographically
            # smaller symbol is canonical (provisional, gauntlet may override)
            canon = a if freq[a] > freq[b] else b if freq[b] > freq[a] else min(a, b)
            other = b if canon == a else a
            emit({**base,
                  "lhs": ["(Member $x %s)" % other], "rhs": ["(Member $x %s)" % canon],
                  "direction": "lhs->rhs",
                  "frequency": {other: freq[other], canon: freq[canon]}})
        else:
            big, small = (side_a, side_b) if len(side_a) >= len(side_b) else (side_b, side_a)
            vbig = set(re.findall(r"\$[a-z]\w*", " ".join(big)))
            vsmall = set(re.findall(r"\$[a-z]\w*", " ".join(small)))
            if not vsmall <= vbig:
                # not expressible as a rewrite (target var unbound by the match) —
                # these are entity-view duplicates of pairs already covered by
                # symbol rewrites; their bidirectional bridges live in the metta file
                skipped_unbound.append(r["rule_id"])
                continue
            emit({**base, "lhs": big, "rhs": small, "direction": "lhs->rhs"})

    # role canonicalization (#23 flip witnesses): minority role -> majority role
    slots = load(args.slots)
    by_class = collections.defaultdict(dict)
    for s in slots:
        if s["role"] in ("Theme", "Patient"):
            by_class[s["event_class"]][s["role"]] = s["n"]
    for ev in sorted(by_class):
        d = by_class[ev]
        if "Theme" not in d or "Patient" not in d or ev == "<unclassed>":
            continue
        loser, winner = (("Theme", "Patient") if d["Patient"] >= d["Theme"]
                         else ("Patient", "Theme"))
        emit({
            "type": "consolidation", "kind": "role-canonicalization",
            "lhs": ["(Member $e %s)" % ev, "(%s $e $x)" % loser],
            "rhs": ["(Member $e %s)" % ev, "(%s $e $x)" % winner],
            "direction": "lhs->rhs", "confidence": 0.8,
            "support": min(d["Theme"], d["Patient"]), "lossless": False,
            "provenance": {"method": "role-fillers-4.3.2", "date": args.date,
                           "theme_n": d["Theme"], "patient_n": d["Patient"]},
            "status": "candidate",
            "rationale": "both roles attested for this class (#23 flip witness); "
                         "collapse to the majority role in the consolidated view",
        })

    os.makedirs(os.path.dirname(os.path.abspath(args.out)), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        for row in out_rows:
            fh.write(json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n")
    kinds = collections.Counter((r["type"], r["kind"]) for r in out_rows)
    print(f"-> {args.out}  ({len(out_rows)} candidates)")
    for (t, k), c in sorted(kinds.items()):
        print(f"   {t:14} {k:22} {c}")
    if skipped_unbound:
        print(f"   skipped (unbound rewrite direction, covered elsewhere): {skipped_unbound}")


if __name__ == "__main__":
    main()
