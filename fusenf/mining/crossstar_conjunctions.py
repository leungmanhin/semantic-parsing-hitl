"""FUSE-NF item E — the 77 cross-star MI groups as conjunction candidates.

Round 2 parameterized the event-centerable MI groups into meta-node packs;
**77 groups were event-centering-untranslatable** (entity-class/cross-star
bundles — `p4_gauntlet_round2.md` "Standing"). ``frequent_patterns2``'s
conjunction expansion is the principled representation for exactly those:
this script re-derives the 77 (same ``event_center`` verdict as
``wave2/build_candidates2.py``), translates each group's cross-mode member
pairs from wave-1 star language ($C + ``:cls`` annotations) into patterns2
clause language (classes become explicit Member clauses; the variable
identification hypothesis = same-class tokens unify, sorted-first-come), and
looks the resulting conjunction up in the patterns2 inventory. An attested
lookup gives the group an explicit, doc-supported, nisurp-ranked conjunction
candidate for the H gauntlet; misses are reported with their reason
(disconnected after translation, >k clauses, or genuinely unattested).

This is candidate PREP for H, not a mining run — no corpus is re-mined here.

Usage:
  python crossstar_conjunctions.py [--groups out/mi_groups.jsonl]
      [--patterns out_e/patterns2.jsonl] [--out out_e/crossstar_conjunctions.jsonl]
      [--report ../eval/crossstar_iteme.md]
"""

from __future__ import annotations

import argparse
import collections
import itertools
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(HERE, os.pardir, "harness"))
import frequent_patterns2 as FP  # noqa: E402

RE_ATOM = re.compile(r"\(([A-Za-z][A-Za-z0-9_]*)\s+(.*)\)( ~NEG)?\Z")
RE_WILD = re.compile(r"\$([exf])(\d+)((?::[A-Za-z0-9_<>]+)?)\Z")

# round-2 event-centering vocabulary (mirrors wave2/build_candidates2.py)
CODE = {"Member": ("M", True), "Agent": ("A", True), "Patient": ("P", True),
        "Theme": ("T", True), "Recipient": ("R", True), "Source": ("S", True),
        "Location": ("L", True), "Time": ("t", True), "Past": ("p", False),
        "Beneficiary": ("B", True), "Instrument": ("I", True),
        "Experiencer": ("E", True), "Stimulus": ("s", True)}


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def event_center_verdict(group):
    """Reproduce build_candidates2.event_center: [] reasons = translatable."""
    comps, reasons = set(), []
    for m in group["members"]:
        for a in m["atoms"]:
            if any(b in a for b in ("~NEG", "<num>", "<str>")):
                reasons.append("neg/num/str")
                continue
            mm = RE_ATOM.match(a)
            if not mm:
                reasons.append("unparsed")
                continue
            head, rest = mm.group(1), mm.group(2).split()
            if m["mode"] == "event":
                if head == "Member" and len(rest) == 2 and rest[0] == "$C" \
                        and not rest[1].startswith("$"):
                    comps.add("Member")
                elif rest and rest[0] == "$C" and head in CODE:
                    comps.add(head)
                else:
                    reasons.append("event:%s" % head)
            elif m["mode"] == "entity":
                if len(rest) == 2 and rest[0].startswith("$e0") and rest[1] == "$C" \
                        and head in CODE:
                    comps.add(head)
                    comps.add("Member")
                else:
                    reasons.append("entity:%s" % head)
            else:
                reasons.append("mode:%s" % m["mode"])
    k = sum(1 for c in comps if c == "Member" or CODE.get(c, ("", False))[1])
    return comps, reasons, k


def translate_member(member, tok_base):
    """Wave-1 star pattern -> (clause list over private skolems, class map).

    ``$C`` becomes a private center token (stream by mode); annotated
    satellites become private tokens plus explicit Member clauses. Returns
    None when an atom cannot be parsed into the clause language.
    """
    mode = member["mode"]
    tokens = {}
    classes = {}
    counter = itertools.count(tok_base)

    def tok_for(name, stream, cls):
        if name not in tokens:
            tokens[name] = "%s%d" % (stream, next(counter))
            if cls:
                classes[tokens[name]] = cls
        return tokens[name]

    clauses = []
    for a in member["atoms"]:
        neg = a.endswith(" ~NEG")
        body = a[:-5] if neg else a

        def sub(m):
            stream, _, ann = m.group(1), m.group(2), m.group(3)
            cls = ann[1:] if ann else None
            return tok_for(m.group(0), stream, cls)

        t = re.sub(r"\$([exf])(\d+)((?::[A-Za-z0-9_]+)?)", sub, body)
        if mode == "event":
            t = t.replace("$C", tok_for("$C", "e", None))
        elif mode == "entity":
            t = t.replace("$C", tok_for("$C", "x", None))
        elif "$C" in t:
            return None
        clauses.append(t + (" ~NEG" if neg else ""))
    for tok, cls in sorted(classes.items()):
        clauses.append("(Member %s %s)" % (tok, cls))
    return clauses, classes


def unify_by_class(cl_a, classes_a, cl_b, classes_b):
    """Identify same-stream tokens sharing a class (sorted first-come)."""
    ren = {}
    used = set()
    by_class_a = collections.defaultdict(list)
    for tok, cls in sorted(classes_a.items()):
        by_class_a[(tok[0], cls)].append(tok)
    for tok_b, cls in sorted(classes_b.items()):
        cands = [t for t in by_class_a.get((tok_b[0], cls), []) if t not in used]
        if cands:
            ren[tok_b] = cands[0]
            used.add(cands[0])
    out_b = []
    for cl in cl_b:
        for old, new in sorted(ren.items(), key=lambda kv: -len(kv[0])):
            cl = re.sub(r"(?<![\w$])" + re.escape(old) + r"(?![\w])", new, cl)
        out_b.append(cl)
    return sorted(set(cl_a) | set(out_b)), bool(ren)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--groups", default=os.path.join(HERE, "out", "mi_groups.jsonl"))
    ap.add_argument("--patterns", default=os.path.join(HERE, "out_e", "patterns2.jsonl"))
    ap.add_argument("--k", type=int, default=3)
    ap.add_argument("--out", default=os.path.join(HERE, "out_e", "crossstar_conjunctions.jsonl"))
    ap.add_argument("--report", default=None)
    args = ap.parse_args()

    raw = json.load(open(os.path.join(HERE, os.pardir, "specs", "vocabulary.json"),
                         encoding="utf-8"))
    operators = set(raw["operators"]) | set(raw.get("deprecated_operators", {}))

    groups = [g for g in load(args.groups) if not g["pure_containment"]]
    inventory = {}
    for r in load(args.patterns):
        inventory[tuple(r["atoms"])] = r

    the77, translatable = [], []
    for g in groups:
        comps, reasons, k = event_center_verdict(g)
        if reasons or not comps or k < 2:
            the77.append(g)
        else:
            translatable.append(g)

    rows = []
    n_attested_groups = 0
    reason_counts = collections.Counter()
    for g in the77:
        g_rows = []
        members = sorted(g["members"], key=lambda m: m["pattern_id"])
        for ma, mb in itertools.combinations(members, 2):
            if ma["mode"] == mb["mode"]:
                continue
            ta = translate_member(ma, 100)
            tb = translate_member(mb, 200)
            if ta is None or tb is None:
                g_rows.append({"pair": [ma["pattern_id"], mb["pattern_id"]],
                               "status": "untranslatable-member"})
                continue
            merged, linked = unify_by_class(ta[0], ta[1], tb[0], tb[1])
            # canonicalize into patterns2 key space
            key = FP.canonical_pattern_text(
                [re.sub(r"(?<![\w$])([exf])(\d+)(?![\w])", r"$\1\2", c) for c in merged],
                operators)
            n_cl = len(key)
            blocks_ok = FP.connected_blocks_ok(list(key), list(range(n_cl)), operators)
            row = {"pair": [ma["pattern_id"], mb["pattern_id"]],
                   "modes": [ma["mode"], mb["mode"]],
                   "conjunction": list(key), "clauses": n_cl,
                   "class_linked": linked}
            hit = inventory.get(key)
            if not blocks_ok:
                row["status"] = "disconnected"
            elif n_cl > args.k:
                row["status"] = "k>%d" % args.k
            elif hit:
                row["status"] = "attested"
                row["attested"] = {"pattern_id": hit["pattern_id"],
                                   "support": hit["support"],
                                   "nisurp": hit["nisurp"]}
            else:
                row["status"] = "unattested"
            g_rows.append(row)
        statuses = [r["status"] for r in g_rows]
        if "attested" in statuses:
            n_attested_groups += 1
        for s in set(statuses) or {"no-cross-mode-pair"}:
            reason_counts[s] += 0
        for s in statuses:
            reason_counts[s] += 1
        rows.append({"group_id": g["group_id"], "support": g["support"],
                     "size": g["size"], "pairs": g_rows,
                     "any_attested": "attested" in statuses})

    with open(args.out, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    # ---- report ------------------------------------------------------------
    attested_rows = []
    for r in rows:
        for p in r["pairs"]:
            if p.get("status") == "attested":
                attested_rows.append((r["group_id"], r["support"], p))
    attested_rows.sort(key=lambda t: (-(t[2]["attested"]["nisurp"] or 0), -t[1]))
    L = []
    L.append("# Item E — the 77 cross-star MI groups as conjunction candidates\n")
    L.append(f"- non-pure-containment groups: {len(groups)}; event-centering-untranslatable"
             f" (the round-2 remainder): **{len(the77)}**; already packed round 2:"
             f" {len(translatable)}")
    L.append(f"- groups with >=1 ATTESTED conjunction (patterns2, k<={args.k}):"
             f" **{n_attested_groups}/{len(the77)}**")
    L.append(f"- pair statuses: {dict(sorted(reason_counts.items()))}")
    L.append("- note: the patterns2 inventory here is the 762-record Tier A + Tier C p1-p3"
             " run (Tier B untouched until H); supports re-measure at H on the full"
             " substrate.\n")
    L.append("## Attested conjunction candidates (by nisurp)\n")
    L.append("| group | g-sup | p2 sup | nisurp | conjunction |\n|---|---|---|---|---|")
    for gid, gsup, p in attested_rows[:30]:
        at = p["attested"]
        ns = "%.2f" % at["nisurp"] if at["nisurp"] is not None else "—"
        conj = "<br>".join("`%s`" % c for c in p["conjunction"])
        L.append(f"| {gid} | {gsup} | {at['support']} | {ns} | {conj} |")
    L.append("\n## Unattested / blocked (honest misses)\n")
    L.append("| group | status | conjunction |\n|---|---|---|")
    n_miss = 0
    for r in rows:
        if r["any_attested"]:
            continue
        for p in r["pairs"][:1]:
            conj = "<br>".join("`%s`" % c for c in p.get("conjunction", [])[:4])
            L.append(f"| {r['group_id']} | {p['status']} | {conj} |")
            n_miss += 1
        if n_miss >= 25:
            break
    text = "\n".join(L) + "\n"
    if args.report:
        open(args.report, "w", encoding="utf-8").write(text)
        print(f"-> {args.report}")
    print(f"-> {args.out}  ({len(rows)} groups)")
    print(f"the77 {len(the77)}  attested-groups {n_attested_groups}  "
          f"pair-statuses {dict(sorted(reason_counts.items()))}")


if __name__ == "__main__":
    main()
