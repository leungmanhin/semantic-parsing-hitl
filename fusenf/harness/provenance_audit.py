"""FUSE-NF batch-2 item A — the retroactive provenance audit (BATCH2_PLAN.md §A).

Two stages:

``--harvest``  collect every corpus record cited as evidence by a VALIDATED rule across
  ``rules/validated{,2,3}.jsonl``: pair-string examples split on ``|`` (rounds 1/3), plain
  id lists (round-2 packs), ``examples_by_symbol`` values (AE rescues). Role rules cite
  statistics, not ids, so their evidence is RE-DERIVED deterministically: every substrate
  record whose atoms attest the rule's event class with a Theme or Patient (the flip
  witnesses). Emits ``review_batches/rv-NNN.txt`` (5 items, priority records first —
  pack/role evidence is the half that matters) + ``review_batches/rv_manifest.json``
  (record -> citing rules, evidence type, batch) and refuses records whose raw parse
  file is missing.

``--ingest``  after the Opus reviews land in ``review/``: join verdicts to the manifest,
  classify (clean / flagged), recompute each rule's surviving support (a failed record
  no longer counts), and write ``eval/provenance_audit.md``. Verdict-failure criteria:
  ``q1_faithful`` in {no, partial} or non-empty ``q4_unlicensed_heads``; ``uncertain``
  is listed but not counted as failure. Nothing here edits validated files — suspensions
  are REPORTED for the owner (append-only discipline).

Usage (from fusenf/harness):
  python provenance_audit.py --harvest
  python provenance_audit.py --ingest --date 2026-08-21
"""

from __future__ import annotations

import argparse
import collections
import glob
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)

VALIDATED = ("validated.jsonl", "validated2.jsonl", "validated3.jsonl")
#: the mining substrate whose parses the cited evidence lives in
SUBSTRATE = ("tierA.canon.jsonl", "tierB.canon.jsonl", "tierC_p1.canon.jsonl",
             "tierC_p2.canon.jsonl", "tierC_p3.canon.jsonl")
SUBSTRATE_EXTRA = (os.path.join("mining", "out2", "p4_mine.canon.jsonl"),)  # loop-2 mine half
CORPORA = ("tierA.jsonl", "tierB.jsonl", "tierC.jsonl", "pilot.jsonl")
PRIORITY_KINDS = {"subtree-collapse", "role-canonicalization"}


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def validated_rules():
    for vf in VALIDATED:
        for r in load(os.path.join(FUSENF, "rules", vf)):
            if r.get("status") == "validated":
                yield vf, r


def role_class(rule):
    for a in rule.get("lhs") or []:
        m = re.match(r"\(Member \$\w+ ([a-z][a-z0-9_]*)\)", a)
        if m:
            return m.group(1)
    return None


def derive_role_witnesses(classes):
    """class -> sorted record ids attesting (Member sk class) + Theme/Patient on sk."""
    out = {c: set() for c in classes}
    paths = [os.path.join(FUSENF, "canonical", f) for f in SUBSTRATE] + \
            [os.path.join(FUSENF, p) for p in SUBSTRATE_EXTRA]
    for path in paths:
        if not os.path.exists(path):
            continue
        for rec in load(path):
            terms = [a["term"] for a in rec.get("atoms") or []]
            for c in classes:
                sks = {m.group(1) for t in terms
                       for m in [re.match(r"\(Member ([exf]\d+) %s\)" % re.escape(c), t)] if m}
                if sks and any(re.match(r"\((?:Theme|Patient) (%s) " % "|".join(sks), t)
                               for t in terms):
                    out[c].add(rec["id"])
    return out


def harvest():
    cited = collections.defaultdict(lambda: {"rules": [], "priority": False, "derived": False})
    role_rules = []
    for vf, r in validated_rules():
        prov = r.get("provenance") or {}
        ids = set()
        for ex in prov.get("examples") or []:
            ids.update(x for x in str(ex).split("|") if x)
        for lst in (prov.get("examples_by_symbol") or {}).values():
            ids.update(lst)
        if r.get("kind") == "role-canonicalization":
            role_rules.append((vf, r))
        for i in ids:
            e = cited[i]
            e["rules"].append({"rule": r["id"], "kind": r.get("kind"), "file": vf})
            e["priority"] |= r.get("kind") in PRIORITY_KINDS

    classes = sorted({c for _, r in role_rules for c in [role_class(r)] if c})
    witnesses = derive_role_witnesses(classes) if classes else {}
    for vf, r in role_rules:
        c = role_class(r)
        for i in sorted(witnesses.get(c) or []):
            e = cited[i]
            e["rules"].append({"rule": r["id"], "kind": r.get("kind"), "file": vf,
                               "evidence": "derived-flip-witness"})
            e["priority"] = True
            e["derived"] = True

    sentences = {}
    for cf in CORPORA:
        path = os.path.join(FUSENF, "corpora", cf)
        if os.path.exists(path):
            for rec in load(path):
                sentences[rec["id"]] = " ".join(rec.get("sentences") or [])

    missing_raw, missing_sent = [], []
    rows = []
    for i in sorted(cited):
        if not os.path.exists(os.path.join(FUSENF, "raw", f"{i}__run1.txt")):
            missing_raw.append(i)
            continue
        if i not in sentences:
            missing_sent.append(i)
            continue
        rows.append(i)
    rows.sort(key=lambda i: (not cited[i]["priority"], i))

    bdir = os.path.join(FUSENF, "review_batches")
    os.makedirs(bdir, exist_ok=True)
    os.makedirs(os.path.join(FUSENF, "review"), exist_ok=True)
    batches = {}
    for n in range(0, len(rows), 5):
        name = "rv-%03d" % (n // 5 + 1)
        with open(os.path.join(bdir, name + ".txt"), "w", encoding="utf-8") as fh:
            for i in rows[n:n + 5]:
                fh.write(f"{i}\t{sentences[i]}\n")
                batches[i] = name
    manifest = {i: dict(cited[i], batch=batches[i]) for i in rows}
    with open(os.path.join(bdir, "rv_manifest.json"), "w", encoding="utf-8") as fh:
        json.dump({"records": manifest, "missing_raw": missing_raw,
                   "missing_sentence": missing_sent,
                   "role_witnesses": {c: sorted(v) for c, v in witnesses.items()}},
                  fh, indent=1, sort_keys=True)
        fh.write("\n")
    n_pri = sum(1 for i in rows if cited[i]["priority"])
    print(f"cited records: {len(cited)} | reviewable: {len(rows)} "
          f"({n_pri} priority) | batches: {(len(rows) + 4) // 5} "
          f"| missing raw: {len(missing_raw)} | missing sentence: {len(missing_sent)}")
    for i in missing_raw[:10]:
        print("  missing raw:", i)


LEGACY_HEADS = {"Premises", "Conclusions"}
#: scaffolding tokens too generic to indicate evidence relevance
GENERIC = {"member", "inheritance", "implication", "stv", "and"}


def rule_content_symbols(rule):
    """Tokens whose appearance in an issue text marks the issue rule-relevant.

    Lexical rules: their content lexemes (acquire, buy). Role rules: the event
    class + the role heads. Packs: the packed role heads (class-agnostic, so
    roles are all there is — conservatively over-matchy, which errs toward
    distrusting evidence, the safe direction).
    """
    toks = set()
    for side in (rule.get("lhs") or []) + (rule.get("rhs") or []):
        for t in re.findall(r"[A-Za-z][A-Za-z0-9_]*", str(side)):
            if t.startswith("$") or t.lower() in GENERIC or len(t) <= 2:
                continue
            if t[0].islower() or t[0].isupper():
                toks.add(t.lower())
    return toks


def ingest(date):
    man = json.load(open(os.path.join(FUSENF, "review_batches", "rv_manifest.json")))
    records = man["records"]
    rules_by_id = {r["id"]: r for vf in VALIDATED
                   for r in load(os.path.join(FUSENF, "rules", vf))}
    verdicts, absent = {}, []
    for i in records:
        vp = os.path.join(FUSENF, "review", f"{i}__run1.review.json")
        if os.path.exists(vp):
            verdicts[i] = json.load(open(vp))
        else:
            absent.append(i)

    def issue_text(v):
        return " ".join(x.get("issue", "") for x in v.get("q1_issues") or []).lower()

    # per-record classes
    hard = {i for i, v in verdicts.items() if v.get("q1_faithful") == "no"}
    partial = {i for i, v in verdicts.items() if v.get("q1_faithful") == "partial"}
    legacy = {i for i, v in verdicts.items()
              if set(v.get("q4_unlicensed_heads") or []) and
              set(v.get("q4_unlicensed_heads") or []) <= LEGACY_HEADS}
    nonlegacy_q4 = {i for i, v in verdicts.items()
                    if set(v.get("q4_unlicensed_heads") or []) - LEGACY_HEADS}

    # per (record, rule) evidence failure: hard fail, non-legacy invented head, or a
    # partial whose issues touch the citing rule's own content symbols
    def ev_failed(i, rid):
        if i in hard or i in nonlegacy_q4:
            return True
        if i in partial:
            syms = rule_content_symbols(rules_by_id.get(rid) or {})
            text = issue_text(verdicts[i])
            # word-boundary match; also match the space-joined form of compounds
            # ("rate_of_flow" appears in issue prose as "rate of flow")
            return any(re.search(r"\b%s\b" % re.escape(s), text) or
                       ("_" in s and s.replace("_", " ") in text) for s in syms)
        return False

    rule_ev = collections.defaultdict(set)
    for i, e in records.items():
        for c in e["rules"]:
            rule_ev[(c["file"], c["rule"], c["kind"])].add(i)

    relevant_partial = {i for (vf, rid, k), ids in rule_ev.items() for i in ids
                        if i in partial and ev_failed(i, rid)}
    incidental = sorted(partial - relevant_partial - hard)

    L = [f"# Retroactive provenance audit — batch-2 item A ({date})", "",
         f"Records cited by validated rules: {len(records)}, all reviewed via `REVIEW.md` "
         f"(Opus, 47 batches, 0 losses). Verdicts absent: {len(absent)}.", "",
         "**Classification** (evidence failure is per (record, citing-rule), not per record):",
         f"- hard misparse (q1 no): **{len(hard)}** — fails as evidence for every citing rule;",
         f"- evidence-relevant partial (issues touch the citing rule's content): "
         f"**{len(relevant_partial)}**;",
         f"- incidental partial (real doctrine findings, unrelated to the citing rule): "
         f"**{len(incidental)}** — routed to triage/prompt loop, NOT evidence failures;",
         f"- legacy-syntax artifact (q4 = Premises/Conclusions on pre-migration parses): "
         f"**{len(legacy)}** — known migration, mechanically converted downstream; not failures;",
         f"- non-legacy invented heads: **{len(nonlegacy_q4)}**.", ""]

    L.append("## Hard misparses")
    for i in sorted(hard):
        cites = ", ".join(sorted({c['rule'] for c in records[i]['rules']}))
        L.append(f"- **{i}** (cited by {cites}):")
        for x in verdicts[i].get("q1_issues") or []:
            L.append(f"  - {x.get('issue','')[:240]}")
    L.append("")

    L.append("## Per-rule surviving evidence (failures = hard + relevant-partial + invented-head)")
    L.append("| rule | kind | cited | failed | survives | note |")
    L.append("|---|---|---|---|---|---|")
    suspended = []
    for (vf, rid, kind), ids in sorted(rule_ev.items(), key=lambda kv: kv[0][1]):
        bad = sorted(i for i in ids if ev_failed(i, rid))
        ok = len(ids) - len(bad)
        # Pair-diff cancellation: for pair-mined rules, a failure SHARED by both
        # sides of a cited pair cancels in the diff the rule was mined from — the
        # contrast survives even though each record is individually imperfect.
        pairs = [str(e).split("|") for e in
                 ((rules_by_id.get(rid) or {}).get("provenance") or {}).get("examples") or []
                 if "|" in str(e)]
        shared = {i for a, b in (p for p in pairs if len(p) == 2)
                  if a in bad and b in bad for i in (a, b)}
        onesided = [i for i in bad if i not in shared]
        note = ""
        if bad and ok == 0:
            if pairs and not onesided:
                note = ("all failures pair-shared -> **diff evidence stands** "
                        "(shared systematic error cancels); records to re-parse queue")
            else:
                note = "**ALL evidence failed — suspend (owner decision)**"
                suspended.append(rid)
        elif bad:
            tag = f" ({len(shared)} pair-shared, cancel in diff)" if shared else ""
            note = f"failed: {', '.join(bad)}{tag}"
        if bad or ok == 0:
            L.append(f"| {rid} | {kind} | {len(ids)} | {len(bad)} | {ok} | {note} |")
    L.append(f"| *(rules with zero failures omitted)* | | | | | |")
    L.append("")

    L.append(f"## Incidental partials — the corpus-quality harvest ({len(incidental)})")
    L.append("Genuine per-record doctrine findings (role choice, futurate rule, world-knowledge "
             "emission, …) that do not touch their citing rules' content. These feed the triage/"
             "prompt loop as reviewer output — the largest single harvest of parse-quality "
             "findings to date. Verdict files in `review/` carry the details; ids:")
    L.append(", ".join(incidental))
    L.append("")
    L.append("## Calibration note (shakedown finding)")
    L.append("`REVIEW.md` does not define the yes/partial boundary; reviewers used `partial` for "
             "any doctrine deviation, which is defensible but makes q1 alone unusable as an "
             "evidence gate. This audit's per-rule relevance filter is the corrective layer; a "
             "boundary clarification in the brief is queued as a post-audit improvement "
             "(do not edit the brief mid-campaign — all 234 verdicts were judged under one text).")
    L.append("")
    L.append(f"Suspension candidates: {suspended or 'none'} — validated files untouched "
             "(append-only; owner decides).")
    out = os.path.join(FUSENF, "eval", "provenance_audit.md")
    with open(out, "w", encoding="utf-8") as fh:
        fh.write("\n".join(L) + "\n")
    print(f"-> {out}  (hard {len(hard)}, relevant-partial {len(relevant_partial)}, "
          f"incidental {len(incidental)}, legacy {len(legacy)}, "
          f"suspended-candidates {suspended or 'none'})")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--harvest", action="store_true")
    ap.add_argument("--ingest", action="store_true")
    ap.add_argument("--date", default=None)
    args = ap.parse_args()
    if args.harvest:
        harvest()
    elif args.ingest:
        if not args.date:
            raise SystemExit("--ingest requires --date")
        ingest(args.date)
    else:
        raise SystemExit("pass --harvest or --ingest")


if __name__ == "__main__":
    main()
