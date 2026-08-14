"""FUSE-NF — export wave-1 mined rules to PeTTaChainer syntax (pre-gauntlet).

Reads §4.3.4's anti-unified rules (``out/align_rules.jsonl``) and §4.3.2's slot
table (``out/slots.jsonl``) and writes ``rules/mined_bridges_wave1.metta`` in
exactly the form ``seeded_rules.metta`` uses —
``(: <unique_name> (Implication <premise> <conclusion>) (STV s c))`` — so the
chainer can load it beside the seeded file. Three rule families:

* **lexical equivalences** (lexical-collapse candidates): a pair of mutual
  ``Member``-class implications per symbol pair — works identically for event
  verbs (``purchase``/``buy``) and entity kinds (``physician``/``doctor``).
* **structural bridges** (structural-alt candidates): converse frames,
  light-verb / causative wrappers. The mining wildcards translate as:
  ``$C`` -> ``$c``; a satellite carrying a CONCRETE class becomes a variable
  plus a ``(Member $v <class>)`` conjunct on its own side; a LIFTED class
  (``:K0``) becomes a plain variable when its recorded witnesses span >=
  ``--min-witnesses`` distinct classes, else its witness class is restored as
  a conjunct (this is what keeps "made a decision -> reached a decision" from
  exporting as "made a cake -> reached a cake"). A direction is emitted only
  when every conclusion variable is bound by the premise — which mechanically
  kills wrapper-INTRODUCTION directions (their fresh event is unbound).
* **role bridges** (§4.3.2 #23 flip witnesses): per event class attested with
  BOTH ``Theme`` and ``Patient``, mutual class-conditioned role implications —
  QA over the known wobble classes stops depending on which role a parse
  picked. Theme/Patient only, never Agent-involving pairs (those flag parse
  errors, not equivalences).

Skipped, with counts: ``fires_on_control`` rules, one-sided (``lone``) rules
(rewriter material, not implications), and rules containing ``~NEG`` /
``<num>`` / ``<str>`` (not expressible as plain pattern conjuncts).

Confidence is provisional and support-based — ``c = min(0.9, 0.7 + 0.05*support)``,
role bridges flat 0.8 — pending the P4 gauntlet; strength is 1.0 throughout.
Deterministic: no clock (--date is an argument), sorted iteration only.

Usage:
  python export_bridges.py [--rules out/align_rules.jsonl] [--slots out/slots.jsonl]
      --date 2026-08-07 [--out ../rules/mined_bridges_wave1.metta]
"""

from __future__ import annotations

import argparse
import collections
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
RE_TOKEN = re.compile(r"\$([exf])(\d+)(?::([A-Za-z0-9_]+))?|\$C")
BAD = ("~NEG", "<num>", "<str>")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def conf(support):
    return round(min(0.9, 0.7 + 0.05 * support), 2)


def translate_side(atoms, witnesses, min_wit):
    """Mining atoms -> (translated atoms, type conjuncts) or None if untranslatable.

    Type conjuncts are returned separately: they are CONSTRAINTS and belong on
    the premise side of whichever direction is emitted — repeating them in a
    conclusion both re-asserts a known fact and (measured) trips the engine's
    premise-reuse conjunction gap."""
    out, extra = [], []
    for a in atoms:
        if any(b in a for b in BAD):
            return None
        def sub(m):
            if m.group(0) == "$C":
                return "$c"
            var = "$%s%s" % (m.group(1), m.group(2))
            cls = m.group(3)
            if cls and not cls.startswith("K"):
                extra.append("(Member %s %s)" % (var, cls))
            elif cls:  # lifted label — restore witness class unless truly variable
                wit = witnesses.get(cls, {})
                if len(wit) < min_wit and wit:
                    top = sorted(wit.items(), key=lambda kv: (-kv[1], kv[0]))[0][0]
                    extra.append("(Member %s %s)" % (var, top))
            return var
        out.append(RE_TOKEN.sub(sub, a))
    return sorted(set(out)), sorted(set(extra))


def side_vars(conjuncts):
    return set(re.findall(r"\$[a-z]\w*", " ".join(conjuncts)))


def render_side(conjuncts):
    return conjuncts[0] if len(conjuncts) == 1 else "(And %s)" % " ".join(conjuncts)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--rules", default=os.path.join(HERE, "out", "align_rules.jsonl"))
    ap.add_argument("--slots", default=os.path.join(HERE, "out", "slots.jsonl"))
    ap.add_argument("--out", default=os.path.join(HERE, os.pardir, "rules",
                                                  "mined_bridges_wave1.metta"))
    ap.add_argument("--date", required=True)
    ap.add_argument("--min-witnesses", type=int, default=3,
                    help="distinct witnesses for a lifted class to stay a variable")
    ap.add_argument("--validated", default=None,
                    help="rules/validated.jsonl — keep only rules the gauntlet did not reject "
                         "(matched via provenance.mined_rule), and only role classes it kept")
    args = ap.parse_args()

    rules = load(args.rules)
    slots = load(args.slots)
    allowed_mined = allowed_roles = None
    if args.validated:
        vd = load(args.validated)
        allowed_mined = {v.get("provenance", {}).get("mined_rule")
                         for v in vd if v["status"] != "rejected"} - {None}
        allowed_roles = {v["lhs"][0].split()[-1].rstrip(")")
                         for v in vd
                         if v.get("kind") == "role-canonicalization" and v["status"] != "rejected"}
        rules = [r for r in rules if r["rule_id"] in allowed_mined]

    lines = []
    skipped = collections.Counter()
    n_rules = 0

    lines.append("; ===== FUSE-NF wave-1 mined bridges (PRE-GAUNTLET CANDIDATES) =====")
    lines.append("; generated %s by mining/export_bridges.py from out/align_rules.jsonl"
                 " (§4.3.4) + out/slots.jsonl (§4.3.2)" % args.date)
    lines.append("; status: mined + negative-control-checked, NOT yet P4-validated;")
    lines.append(";   confidence is support-based (c = min(0.9, 0.7+0.05*support)) and")
    lines.append(";   provisional — the P4 gauntlet re-scores or rejects each rule.")
    lines.append("; load beside seeded_rules.metta; all proof names are unique (mined_w1_*).")
    lines.append("; KNOWN ENGINE GAP (repro: bug_conj_reuses_rule_premise_minimal.py): a query")
    lines.append(";   conjunction that re-asserts a premise of the rule deriving another of its")
    lines.append(";   conjuncts currently returns [] — e.g. asking (And (Member $e cancel)")
    lines.append(";   (Patient $e $x)) when Patient was derived FROM (Member $e cancel). The")
    lines.append(";   derived atom itself and conjunctions with non-premise atoms bind fine.")
    lines.append("")

    # ---- 1. lexical equivalences -------------------------------------------
    lines.append("; ----- lexical equivalences (§4.3.4 lexical-collapse) -----")
    seen_pairs = set()
    for r in sorted(rules, key=lambda r: r["rule_id"]):
        if r["kind"] != "lexical-collapse" or r["fires_on_control"] or not r["symbol_pair"]:
            continue
        a, b = r["symbol_pair"]
        if (a, b) in seen_pairs:
            skipped["duplicate-pair"] += 1
            continue
        seen_pairs.add((a, b))
        c = conf(r["support"])
        cos = ("slot-cos %.2f" % r["slot_cosine"]) if r.get("slot_cosine") is not None else "no slot data"
        lines.append("; %s <-> %s   support %d (%d pairs), %s, e.g. %s" % (
            a, b, r["support"], r["occurrences"], cos, r["examples"][0]))
        lines.append("(: mined_w1_lex_%s_%s (Implication (Member $x %s) (Member $x %s)) (STV 1.0 %s))"
                     % (b, a, b, a, c))
        lines.append("(: mined_w1_lex_%s_%s (Implication (Member $x %s) (Member $x %s)) (STV 1.0 %s))"
                     % (a, b, a, b, c))
        n_rules += 2
    lines.append("")

    # ---- 2. structural bridges ----------------------------------------------
    lines.append("; ----- structural bridges (§4.3.4 structural-alt) -----")
    for r in sorted(rules, key=lambda r: r["rule_id"]):
        if r["kind"] != "structural-alt" or r["fires_on_control"]:
            continue
        if not r["lhs"] or not r["rhs"]:
            skipped["one-sided"] += 1
            continue
        wit = r.get("k_witnesses", {})
        ta = translate_side(r["lhs"], wit, args.min_witnesses)
        tb = translate_side(r["rhs"], wit, args.min_witnesses)
        if ta is None or tb is None:
            skipped["untranslatable"] += 1
            continue
        c = conf(r["support"])
        emitted = False
        for tag, (pa, px), (qa, qx) in (("f", ta, tb), ("b", tb, ta)):
            prem = sorted(set(pa + px))
            # a conclusion-side type constraint moves into the premise, but only
            # when its variable is already premise-bound — else this direction
            # would conjure a typed entity out of nothing
            movable = [e for e in qx if side_vars([e]) <= side_vars(prem)]
            if len(movable) < len(qx):
                continue
            prem = sorted(set(prem + movable))
            if not side_vars(qa) <= side_vars(prem):
                continue   # conclusion would introduce unbound variables
            if not emitted:
                lines.append("; %s   support %d (%d pairs), witnesses %s, e.g. %s" % (
                    r["rule_id"], r["support"], r["occurrences"],
                    json.dumps(wit, sort_keys=True) if wit else "-", r["examples"][0]))
            lines.append("(: mined_w1_str_%s_%s (Implication %s %s) (STV 1.0 %s))"
                         % (r["rule_id"], tag, render_side(prem), render_side(qa), c))
            n_rules += 1
            emitted = True
        if not emitted:
            skipped["no-bound-direction"] += 1
    lines.append("")

    # ---- 3. role bridges (#23 flip witnesses) -------------------------------
    lines.append("; ----- role bridges (§4.3.2 #23: event classes attested with BOTH")
    lines.append(";       Theme and Patient — QA stops depending on the parse's pick) -----")
    by_class = collections.defaultdict(dict)
    for s in slots:
        if s["role"] in ("Theme", "Patient"):
            by_class[s["event_class"]][s["role"]] = s["n"]
    n_role = 0
    for ev in sorted(by_class):
        d = by_class[ev]
        if "Theme" not in d or "Patient" not in d or ev == "<unclassed>":
            continue
        lines.append("; %s: Theme n=%d, Patient n=%d" % (ev, d["Theme"], d["Patient"]))
        lines.append("(: mined_w1_role_%s_tp (Implication (And (Member $e %s) (Theme $e $x)) "
                     "(Patient $e $x)) (STV 1.0 0.8))" % (ev, ev))
        lines.append("(: mined_w1_role_%s_pt (Implication (And (Member $e %s) (Patient $e $x)) "
                     "(Theme $e $x)) (STV 1.0 0.8))" % (ev, ev))
        n_rules += 2
        n_role += 1

    os.makedirs(os.path.dirname(os.path.abspath(args.out)), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines) + "\n")
    print(f"-> {args.out}")
    print(f"rules {n_rules} (lexical pairs {len(seen_pairs)}, role-bridge classes {n_role})"
          f"   skipped: {dict(sorted(skipped.items())) or 0}")


if __name__ == "__main__":
    main()
