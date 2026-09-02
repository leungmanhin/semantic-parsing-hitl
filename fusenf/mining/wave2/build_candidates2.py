"""FUSE-NF gauntlet round 2 — candidates from wave-2 signals (PLAN §7; eval/wave2.md decision).

Two families, from ``mining/out/mi_groups.jsonl`` + ``mining/out/interchange.jsonl``:

* **subtree-collapse (meta-nodes, §4.3.3)** — each non-containment MI group is
  event-centered (entity-view members fold back onto the event; satellite classes
  are nomination context only and are dropped); the union of component heads is a
  SHAPE. Shapes become PARAMETERIZED pack rules per the wave-2 encoding decision:
  head ``Mn<codes>`` carries the structure, fillers carry the content —
  class-AGNOSTIC (``$v`` is a filler, so one rule covers every verb):

      (And (Member $C $v) (Agent $C $x1) (Theme $C $x2))  ->  (MnEvAgTh $C $v $x1 $x2)

  The pack is bijective per instance (expansion implications restore each
  component exactly), so truth preservation is mechanical; instance guards are
  enforced by the rewriter: ``$v`` binds a plain lowercase symbol, ``$C`` an
  event skolem, all matched atoms share ONE identical positive STV.

  **MDL selection** (greedy, SUBDUE-spirited, decided BEFORE judges run;
  re-billed 2026-09-01 per #50): savings = occurrences x (k-1) atoms;
  cost = k+2 (the pack rule at wave-1's |lhs|+|rhs|+1 accounting, billed
  ONCE — expansion bridges are retired; the decode direction is the same
  rule read backwards). A shape enters the proposed set only while its
  MARGINAL net gain under larger-LHS-first application stays positive.
  (Round-2 HISTORY was selected under the pre-#50 strict bill of 3k+2.)

* **lexical-collapse (AE, §4.3.5)** — distinct NOVEL interchange symbol pairs
  (corroborations of validated rules and pairs already judged in wave 1 are
  excluded with counts). Direction is frequency-directed as in wave-1
  build_candidates. Distributional similarity is GENERATOR evidence only —
  judges decide equivalence (similarity != synonymy; scenario siblings are the
  expected bulk). Pairs of capitalized/frozen role heads become
  ``kind=role-interchange`` (no probe; the frozen gate adjudicates).

Deterministic end to end; no clock (--date is an argument).

Usage:
  python build_candidates2.py --date 2026-08-14 \
      [--out ../../rules/candidates2.jsonl]
"""

from __future__ import annotations

import argparse
import collections
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
MINING = os.path.dirname(HERE)
FUSENF = os.path.dirname(MINING)

CANONICAL = ["tierA", "tierB", "tierC_p1", "tierC_p2", "tierC_p3", "tierC_m1"]
CORPORA = ["tierA.jsonl", "tierB.jsonl", "tierC.jsonl"]

RE_ATOM = re.compile(r"\(([A-Za-z_][A-Za-z0-9_]*)\s+(.*)\)$")
RE_SKOLEM_FULL = re.compile(r"[exf]\d+")
RE_SYMBOL = re.compile(r"[a-z][a-z0-9_]*")
RE_QUOTED = re.compile(r'"[^"]*"')

# component -> (name code, contributes a filler argument)
CODE = {"Member": ("Ev", False), "Agent": ("Ag", True), "Beneficiary": ("Ben", True),
        "Experiencer": ("Exp", True), "Location": ("Loc", True), "Patient": ("Pat", True),
        "Recipient": ("Rec", True), "Theme": ("Th", True), "Past": ("Past", False)}
ORDER = ["Member", "Agent", "Beneficiary", "Experiencer", "Location", "Patient",
         "Recipient", "Theme", "Past"]


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


# ---------------------------------------------------------------- meta-nodes
def event_center(group):
    """MI group -> (component-head set, nominating classes, untranslatable reasons)."""
    comps, classes, reasons = set(), set(), []
    for m in group["members"]:
        for a in m["atoms"]:
            if any(b in a for b in ("~NEG", "<num>", "<str>")):
                reasons.append("neg/num/str"); continue
            mm = RE_ATOM.match(a)
            if not mm:
                reasons.append("unparsed"); continue
            head, rest = mm.group(1), mm.group(2).split()
            if m["mode"] == "event":
                if head == "Member" and len(rest) == 2 and rest[0] == "$C" \
                        and not rest[1].startswith("$"):
                    comps.add("Member"); classes.add(rest[1])
                elif rest and rest[0] == "$C" and head in CODE:
                    comps.add(head)
                else:
                    reasons.append("event:%s" % head)
            elif m["mode"] == "entity":
                if len(rest) == 2 and rest[0].startswith("$e0") and rest[1] == "$C" \
                        and head in CODE:
                    comps.add(head); comps.add("Member")
                    if ":" in rest[0] and not rest[0].split(":", 1)[1].startswith("K"):
                        classes.add(rest[0].split(":", 1)[1])
                else:
                    reasons.append("entity:%s" % head)
            else:
                reasons.append("mode:%s" % m["mode"])
    return comps, classes, reasons


def shape_rule(comps):
    """Component set -> (head, lhs atoms, rhs atom, expansions, k)."""
    ordered = [c for c in ORDER if c in comps]
    head = "Mn" + "".join(CODE[c][0] for c in ordered)
    args, lhs = [], []
    n = 0
    for c in ordered:
        if c == "Member":
            lhs.append("(Member $C $v)"); args.append("$v")
        elif CODE[c][1]:
            n += 1
            lhs.append("(%s $C $x%d)" % (c, n)); args.append("$x%d" % n)
        else:                                    # Past — status, no filler
            lhs.append("(%s $C)" % c)
    rhs = "(%s $C %s)" % (head, " ".join(args))
    expansions = list(zip([rhs] * len(lhs), lhs))
    return head, lhs, rhs, expansions, len(lhs)


def star_instances(records, shapes):
    """Largest-first assignment of event stars to shapes; returns per-shape occurrence
    counts + example (record, class) pairs.  Mirrors the rewriter's guards:
    plain-symbol class, one identical positive STV across the matched atoms."""
    occ = collections.Counter()
    examples = collections.defaultdict(list)
    order = sorted(shapes, key=lambda s: (-shapes[s]["k"], s))
    for rec in records:
        for sym, star in sorted(rec["stars"].items()):
            if star["kind"] != "event" or not RE_SKOLEM_FULL.fullmatch(sym):
                continue
            atoms = [rec["atoms"][i] for i in star["atoms"]]
            by_head = collections.defaultdict(list)
            for a in atoms:
                mm = RE_ATOM.match(a["term"])
                if not mm:
                    continue
                head, rest = mm.group(1), mm.group(2).split()
                if rest and rest[0] == sym:
                    by_head[head].append(a)
            for name in order:
                comps = shapes[name]["comps"]
                picked = []
                ok = True
                for c in comps:
                    cand = None
                    for a in by_head.get(c, []):
                        if c == "Member":
                            parts = a["term"][1:-1].split()
                            if len(parts) != 3 or not RE_SYMBOL.fullmatch(parts[2]):
                                continue
                        cand = a
                        break
                    if cand is None:
                        ok = False
                        break
                    picked.append(cand)
                if not ok:
                    continue
                stvs = {tuple(a["stv"]) for a in picked}
                if len(stvs) != 1 or picked[0]["stv"][0] < 0.5:
                    continue
                occ[name] += 1
                cls = next((a["term"][1:-1].split()[2] for a in picked
                            if a["term"].startswith("(Member ")), "?")
                examples[name].append((rec["id"], cls))
                break                            # one pack per event star
    return occ, examples


def greedy_select(shapes, records):
    """Pre-registered greedy: add shapes by net gain while marginal > 0 (#50 billing)."""
    selected = []
    remaining = sorted(shapes)
    base_occ, _ = star_instances(records, {s: shapes[s] for s in selected}) \
        if selected else (collections.Counter(), None)

    def net(sel):
        occ, _ = star_instances(records, {s: shapes[s] for s in sel})
        return sum(occ[s] * (shapes[s]["k"] - 1) - (shapes[s]["k"] + 2)
                   for s in sel), occ

    cur_net, cur_occ = 0, collections.Counter()
    while True:
        best = None
        for s in remaining:
            trial_net, trial_occ = net(selected + [s])
            marginal = trial_net - cur_net
            if marginal > 0 and (best is None or marginal > best[0]
                                 or (marginal == best[0] and s < best[1])):
                best = (marginal, s, trial_net, trial_occ)
        if best is None:
            break
        selected.append(best[1])
        remaining.remove(best[1])
        cur_net, cur_occ = best[2], best[3]
    return selected, cur_net, cur_occ


# ---------------------------------------------------------------- AE pairs
def corpus_freq(records):
    freq = collections.Counter()
    for rec in records:
        for a in rec["atoms"]:
            text = RE_QUOTED.sub(" ", a["term"])
            for t in re.findall(r"(?<![\w$])[a-z][a-z0-9_]*(?![\w])", text):
                freq[t] += 1
    return freq


def symbol_records(records, sym):
    pat = re.compile(r"(?<![\w$])%s(?![\w])" % re.escape(sym))
    hits = []
    for rec in records:
        if any(pat.search(RE_QUOTED.sub(" ", a["term"])) for a in rec["atoms"]):
            hits.append(rec["id"])
    return hits


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--date", required=True)
    ap.add_argument("--out", default=os.path.join(FUSENF, "rules", "candidates2.jsonl"))
    args = ap.parse_args()

    # unique 862-record set, wave-1 M3 scope
    records, seen = [], set()
    for name in CANONICAL:
        for rec in load(os.path.join(FUSENF, "canonical", "%s.canon.jsonl" % name)):
            if rec["id"] not in seen:
                seen.add(rec["id"])
                records.append(rec)
    sentences = {}
    for name in CORPORA:
        for row in load(os.path.join(FUSENF, "corpora", name)):
            sentences[row["id"]] = " ".join(row["sentences"])

    # ---- meta-node shapes from MI groups -----------------------------------
    groups = load(os.path.join(MINING, "out", "mi_groups.jsonl"))
    shapes, nominators = {}, collections.defaultdict(list)
    untranslatable = collections.Counter()
    for g in groups:
        if g["pure_containment"]:
            continue
        comps, classes, reasons = event_center(g)
        if reasons or not comps:
            untranslatable[";".join(sorted(set(reasons))[:2]) or "empty"] += 1
            continue
        head, lhs, rhs, expansions, k = shape_rule(comps)
        if k < 2:
            untranslatable["k<2"] += 1
            continue
        if head not in shapes:
            shapes[head] = {"comps": [c for c in ORDER if c in comps], "lhs": lhs,
                            "rhs": rhs, "expansions": expansions, "k": k}
        nominators[head].append({"group": g["group_id"], "support": g["support"],
                                 "classes": sorted(classes)})

    # star-pattern corroboration: some §4.3.1 event pattern has the same head multiset
    star_shapes = set()
    for p in load(os.path.join(MINING, "out", "stars.jsonl")):
        if p["mode"] == "event" and p["support"] >= 3:
            heads = []
            ok = True
            for a in p["atoms"]:
                mm = RE_ATOM.match(a.replace("~NEG", ""))
                if not mm:
                    ok = False
                    break
                heads.append(mm.group(1))
            if ok:
                star_shapes.add(tuple(sorted(heads)))

    selected, strict_net, sel_occ = greedy_select(shapes, records)
    all_occ, all_examples = star_instances(records, shapes)

    rows = []
    ordered_heads = sorted(shapes, key=lambda h: (-shapes[h]["k"], -all_occ[h], h))
    for i, head in enumerate(ordered_heads, 1):
        sh = shapes[head]
        occ = sel_occ[head] if head in selected else all_occ[head]
        ex_ids = []
        seen_cls = set()
        for rid, cls in all_examples[head]:
            if cls not in seen_cls and rid in sentences:
                seen_cls.add(cls)
                ex_ids.append(rid)
            if len(ex_ids) == 3:
                break
        rows.append({
            "id": "mn%04d" % i, "type": "consolidation", "kind": "subtree-collapse",
            "direction": "lhs->rhs", "lhs": sh["lhs"], "rhs": [sh["rhs"]],
            "confidence": 0.5, "support": len(all_examples[head]),
            "lossless": True,
            "meta": {"head": head, "arity": sh["k"] - sum(1 for c in sh["comps"]
                                                          if c == "Past") + 1,
                     "components": sh["comps"], "expansions": sh["expansions"],
                     "star_corroborated": tuple(sorted(sh["comps"])) in star_shapes},
            "mdl": {"k": sh["k"], "occurrences_solo": all_occ[head],
                    "occurrences_in_set": sel_occ.get(head, 0),
                    "cost_w1": sh["k"] + 2,
                    "selected": head in selected},
            "provenance": {"method": "mi-grouping-4.3.3", "date": args.date,
                           "groups": nominators[head], "examples": ex_ids},
            "status": "candidate",
        })

    # ---- AE lexical pairs ---------------------------------------------------
    inter = load(os.path.join(MINING, "out", "interchange.jsonl"))
    prior = set()
    for v in load(os.path.join(FUSENF, "rules", "validated.jsonl")):
        if v.get("kind") == "lexical-collapse":
            m = re.findall(r"\(Member \$\w+ ([a-z][a-z0-9_]*)\)",
                           v["lhs"][0] + " " + v["rhs"][0])
            if len(m) == 2:
                prior.add(tuple(sorted(m)))
    best = {}
    n_corr = n_prior = 0
    for r in inter:
        if not r["symbol_pair"]:
            continue
        if r["corroborates_validated"]:
            n_corr += 1
            continue
        key = tuple(r["symbol_pair"])
        if tuple(sorted(key)) in prior:
            n_prior += 1
            continue
        if key not in best or r["cosine"] > best[key]["cosine"]:
            best[key] = r
    freq = corpus_freq(records)
    ae_rows = []
    for key in sorted(best, key=lambda k: (-best[k]["cosine"], k)):
        r = best[key]
        a, b = key
        if a[0].isupper() or b[0].isupper():
            kind, typ = "role-interchange", "bridging"
            lhs, rhs = ["(%s $e $x)" % a], ["(%s $e $x)" % b]
            direction = "both"
        else:
            kind, typ = "lexical-collapse", "consolidation"
            canon = a if freq[a] > freq[b] else b if freq[b] > freq[a] else min(a, b)
            other = b if canon == a else a
            lhs, rhs = ["(Member $x %s)" % other], ["(Member $x %s)" % canon]
            direction = "lhs->rhs"
        ex_a = sorted(symbol_records(records, a),
                      key=lambda i: (len(sentences.get(i, "x" * 999)), i))[:2]
        ex_b = sorted(symbol_records(records, b),
                      key=lambda i: (len(sentences.get(i, "x" * 999)), i))[:2]
        ae_rows.append({
            "id": "ae%04d" % (len(ae_rows) + 1), "type": typ, "kind": kind,
            "direction": direction, "lhs": lhs, "rhs": rhs,
            "confidence": r["cosine"], "support": min(r["docs_a"], r["docs_b"]),
            "lossless": True,
            "frequency": {a: freq[a], b: freq[b]},
            "provenance": {"method": "autoencoder-4.3.5", "date": args.date,
                           "patterns": [r["a"], r["b"]],
                           "cosine": r["cosine"], "doc_jaccard": r["doc_jaccard"],
                           "examples_by_symbol": {a: ex_a, b: ex_b}},
            "status": "candidate",
        })

    with open(args.out, "w", encoding="utf-8") as fh:
        for row in rows + ae_rows:
            fh.write(json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n")

    n_sel = sum(1 for r in rows if r["mdl"]["selected"])
    print(f"-> {args.out}")
    print(f"meta-node shapes {len(rows)} (greedy-selected {n_sel}, strict net at selection "
          f"{strict_net:+d} atoms)  from {sum(len(v) for v in nominators.values())} group "
          f"nominations; untranslatable groups {sum(untranslatable.values())}: "
          f"{dict(untranslatable)}")
    print(f"AE pairs {len(ae_rows)} (excluded: {n_corr} corroboration rows, "
          f"{n_prior} wave-1-judged rows)  "
          f"role-interchange {sum(1 for r in ae_rows if r['kind'] == 'role-interchange')}")
    for r in rows:
        m = r["mdl"]
        print(f"   {r['id']} {r['meta']['head']:<18} k={m['k']} solo={m['occurrences_solo']:>3}"
              f" in-set={m['occurrences_in_set']:>3} "
              f"{'SELECTED' if m['selected'] else 'dropped (marginal<=0)'}")


if __name__ == "__main__":
    main()
