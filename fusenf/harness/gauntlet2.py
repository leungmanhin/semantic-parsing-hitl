"""FUSE-NF P4 gauntlet — ROUND 2, over wave-2 signals (candidates2.jsonl).

Same two-stage design as round 1 (gauntlet.py), same hard gates, same
evidence-based confidence formula; differences are the two new candidate
families and the now-scripted M3 accounting:

  --stage mech      * meta-node pack rules (kind subtree-collapse): REAL M3 run —
                      wave-1 validated rules + the greedy-selected packs applied to
                      the 862-record unique corpus; atoms before/after; per-rule
                      MARGINAL savings (drop-one re-run).  Pre-registered MDL
                      accounting, pinned here rather than inline as in round 1:
                          rule_cost = |lhs| + |rhs| + 1   (the round-1 formula; #50 owner
                                      2026-09-01: expansion bridges RETIRED — the decode
                                      direction is the same rule read backwards, so the
                                      rule is billed exactly once)
                          M3 = total atom savings - sum(rule costs)
                      (round-2 HISTORY in m3_round2*.json was billed under the
                      pre-#50 dual w1/strict accounting and stands as a record)
                      Tier-A solo effect per rule (control merges = M4 hard gate),
                      seeded/frozen compatibility (both expected empty — packs
                      contain no open-class symbols and substitute no heads;
                      packing REMOVES frozen-head atoms and the query normalizer
                      re-expresses queries in pack vocabulary: M5 adjudicates).
                    * AE lexical pairs: Tier-A solo effect where applicable;
                      role-interchange pairs die at the frozen gate mechanically.
                    * probe cards -> two families: meta coherence cards (is the
                      bundle ONE recurring semantic unit?) and AE substitutability
                      cards (same_truth / lossless, wave-1 wording).
  --stage finalize  collect votes; route; write rules/validated2.jsonl.

Routing, re-based on #50 (owner 2026-09-01 — consolidation-only, NO demotion tier;
rules/validated2.jsonl HISTORY was produced by the pre-#50 table and stands):
  subtree-collapse:  greedy-selected AND control_merges==0 AND marginal
                     net > 0 AND coherent-majority  -> consolidation/validated;
                     anything else -> rejected (packs never had a fallback —
                     round 2 already modeled #50's shape here).
  lexical-collapse:  consolidation/validated at conf >= 0.9 + lossless + directed
                     (incl. register_only calibration; no design-label bonus —
                     AE has no Tier-A design provenance); anything else rejected.
  role-interchange:  rejected -> prompt-side evidence (unconditioned frozen-head
                     swap; #23/#50 fix-pack channel decides).

Usage:
  python gauntlet2.py --stage mech
  python gauntlet2.py --stage finalize
"""

from __future__ import annotations

import argparse
import collections
import glob
import itertools
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import canonicalize as C  # noqa: E402
import consolidate as K  # noqa: E402
from gauntlet import load, register_only, rule_symbols, seeded_tokens  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)

CANONICAL = ["tierA", "tierB", "tierC_p1", "tierC_p2", "tierC_p3", "tierC_m1"]
CORPORA = ["tierA.jsonl", "tierB.jsonl", "tierC.jsonl"]


def unique_records():
    out, seen = [], set()
    for name in CANONICAL:
        for rec in load(os.path.join(FUSENF, "canonical", "%s.canon.jsonl" % name)):
            if rec["id"] not in seen:
                seen.add(rec["id"])
                out.append(rec)
    return out


def sentences_by_id():
    out = {}
    for name in CORPORA:
        for row in load(os.path.join(FUSENF, "corpora", name)):
            out[row["id"]] = " ".join(row["sentences"])
    return out


def wave1_validated():
    return [r for r in load(os.path.join(FUSENF, "rules", "validated.jsonl"))
            if r["type"] == "consolidation" and r["status"] == "validated"
            and r["direction"] == "lhs->rhs"]


def atoms_after(records, rules, vocab):
    """Total atom count after applying ``rules`` (wave-1 style + packs) to records."""
    sym, struct = K.prepare_rules(rules)
    av = K.augment_vocab(vocab, struct)
    total = 0
    napplied = collections.Counter()
    for rec in records:
        stmts, n_tok, applied = K.consolidate_record(rec, sym, struct)
        napplied.update(applied)
        total += len(stmts)
    return total, napplied, av


def tierA_pairs():
    corpora = {}
    for name in CORPORA:
        for row in load(os.path.join(FUSENF, "corpora", name)):
            corpora[row["id"]] = row
    tierA = load(os.path.join(FUSENF, "canonical", "tierA.canon.jsonl"))
    meta = {r["id"]: corpora[r["id"]] for r in tierA if r["id"] in corpora}
    by_class = collections.defaultdict(list)
    for cid, m in meta.items():
        by_class[m["equiv_class"]].append(cid)
    pos, ctl = [], []
    for ec in sorted(by_class):
        ids = sorted(by_class[ec])
        same = [i for i in ids if meta[i]["labels"]["polarity"] == "same"]
        diff = [i for i in ids if meta[i]["labels"]["polarity"] == "different"]
        pos += list(itertools.combinations(same, 2))
        ctl += [(a, b) for a in same for b in diff]
    return tierA, pos, ctl


def gids_under(rule, tierA, base_gid, vocab):
    sym, struct = K.prepare_rules([rule])
    av = K.augment_vocab(vocab, struct)
    out = dict(base_gid)
    for rec in tierA:
        stmts, n_tok, applied = K.consolidate_record(rec, sym, struct)
        if n_tok or applied:
            out[rec["id"]] = C.canonicalize(
                {"id": rec["id"], "run": rec.get("run"), "statements": stmts},
                vocab=av)["graph_id"]
    return out


def stage_mech(args):
    cands = load(args.candidates)
    records = unique_records()
    sents = sentences_by_id()
    vocab = C.load_vocabulary()
    w1 = wave1_validated()

    baseline = sum(len(r["atoms"]) for r in records)
    after_w1, _, _ = atoms_after(records, w1, vocab)

    packs = [r for r in cands if r["kind"] == "subtree-collapse"
             and r["mdl"]["selected"]]
    after_full, napplied, _ = atoms_after(records, w1 + packs, vocab)

    # per-rule marginal savings: drop-one re-runs
    marginal = {}
    for p in packs:
        rest = [q for q in packs if q["id"] != p["id"]]
        after_wo, _, _ = atoms_after(records, w1 + rest, vocab)
        marginal[p["id"]] = after_wo - after_full          # atoms this rule saves

    tierA, pos_pairs, ctl_pairs = tierA_pairs()
    base_gid = {r["id"]: r["graph_id"] for r in tierA}
    seeded = seeded_tokens(os.path.join(FUSENF, os.pardir, "seeded_rules.metta"))
    raw_vocab = json.load(open(os.path.join(FUSENF, "specs", "vocabulary.json"),
                               encoding="utf-8"))
    frozen_heads = {n for n, e in raw_vocab["operators"].items() if e.get("frozen")}

    for r in cands:
        r["seeded_collision"] = sorted(
            (rule_symbols(r["lhs"]) - rule_symbols(r["rhs"])) & seeded)
        swaps = set()
        for la in r["lhs"]:
            lt = la.strip("()").split()
            for ra in r["rhs"]:
                rt = ra.strip("()").split()
                if len(lt) == len(rt) and lt[1:] == rt[1:] and lt[0] != rt[0] \
                        and lt[0] in frozen_heads and rt[0] in frozen_heads:
                    swaps.add("%s->%s" % (lt[0], rt[0]))
        r["frozen_head_rewrite"] = sorted(swaps)

        if r["type"] == "consolidation":
            g = gids_under(r, tierA, base_gid, vocab)
            r["tierA_new_identical"] = sum(1 for a, b in pos_pairs
                                           if g[a] == g[b] and base_gid[a] != base_gid[b])
            r["tierA_control_merges"] = sum(1 for a, b in ctl_pairs if g[a] == g[b])
        else:
            r["tierA_new_identical"] = None
            r["tierA_control_merges"] = 0

        if r["kind"] == "subtree-collapse":
            m = r["mdl"]
            save = marginal.get(r["id"], 0)
            m["applications"] = napplied.get(r["id"], 0)
            m["marginal_savings"] = save
            # #50: single billing — the decoder is the rule read backwards, never a
            # separate cost line
            m["marginal_net"] = save - m["cost_w1"]

    pack_rule_cost = sum(p["mdl"]["cost_w1"] for p in packs)
    w1_rule_cost = sum(len(r["lhs"]) + len(r["rhs"]) + 1 for r in w1)
    summary = {
        "atoms_baseline": baseline,
        "atoms_after_wave1": after_w1,
        "atoms_after_wave1_plus_packs": after_full,
        "savings_from_packs": after_w1 - after_full,
        "pack_rule_cost": pack_rule_cost,
        "M3_round2": (baseline - after_full) - (w1_rule_cost + pack_rule_cost),
        "M3_round1_for_reference": (baseline - after_w1) - w1_rule_cost,
    }

    with open(args.candidates + ".mech", "w", encoding="utf-8") as fh:
        for r in cands:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    with open(os.path.join(os.path.dirname(args.candidates), "m3_round2.json"),
              "w", encoding="utf-8") as fh:
        json.dump(summary, fh, indent=1, sort_keys=True)

    # ---- probe cards --------------------------------------------------------
    os.makedirs(args.cards_dir, exist_ok=True)
    meta_cards = []
    for r in packs:
        ex = []
        for rid in r["provenance"]["examples"]:
            if rid in sents:
                ex.append(sents[rid])
        meta_cards.append({
            "rule_id": r["id"], "kind": "subtree-collapse",
            "head": r["meta"]["head"], "components": r["meta"]["components"],
            "lhs": r["lhs"], "rhs": r["rhs"],
            "expansions": r["meta"]["expansions"],
            "example_sentences": ex[:3],
        })
    with open(os.path.join(args.cards_dir, "cards_meta.json"), "w", encoding="utf-8") as fh:
        json.dump(meta_cards, fh, ensure_ascii=False, indent=1)

    ae = [r for r in cands if r["kind"] == "lexical-collapse"]
    ae_cards = []
    for r in ae:
        ex = r["provenance"]["examples_by_symbol"]
        sym_l = r["lhs"][0].split()[-1].rstrip(")")
        sym_r = r["rhs"][0].split()[-1].rstrip(")")
        ae_cards.append({
            "rule_id": r["id"], "kind": "lexical-collapse",
            "lhs": r["lhs"], "rhs": r["rhs"],
            "examples_lhs_symbol": [sents[i] for i in ex[sym_l] if i in sents][:2],
            "examples_rhs_symbol": [sents[i] for i in ex[sym_r] if i in sents][:2],
        })
    nb = args.batches
    for b in range(nb):
        chunk = ae_cards[b::nb]
        with open(os.path.join(args.cards_dir, "cards_ae_b%d.json" % (b + 1)), "w",
                  encoding="utf-8") as fh:
            json.dump(chunk, fh, ensure_ascii=False, indent=1)

    print(f"mech: {len(cands)} candidates -> {args.candidates}.mech")
    print(f"M3 accounting: {json.dumps(summary, indent=1, sort_keys=True)}")
    hard = [r["id"] for r in cands if r["tierA_control_merges"]]
    print(f"control merges (HARD GATE): {hard or 'none'}")
    print(f"seeded collisions: "
          f"{ {r['id']: r['seeded_collision'] for r in cands if r['seeded_collision']} or 'none' }")
    print(f"frozen-head rewrites: "
          f"{ {r['id']: r['frozen_head_rewrite'] for r in cands if r['frozen_head_rewrite']} or 'none' }")
    for p in packs:
        m = p["mdl"]
        print(f"   {p['id']} {p['meta']['head']:<16} applications={m['applications']:>3} "
              f"marginal_savings={m['marginal_savings']:>4} net={m['marginal_net']:>4}")
    print(f"cards: {len(meta_cards)} meta -> cards_meta.json; "
          f"{len(ae_cards)} AE -> {nb} batches in {args.cards_dir}")


def stage_finalize(args):
    cands = load(args.candidates + ".mech")
    votes = collections.defaultdict(list)
    for path in sorted(glob.glob(os.path.join(args.cards_dir, "votes_*.jsonl"))):
        for v in load(path):
            votes[v.get("rule_id")].append(v)

    def majority(rule_id, field):
        vs = [v.get(field, "unsure") for v in votes.get(rule_id, [])]
        return sum(1 for x in vs if x == "yes") > len(vs) / 2 if vs else None

    out = []
    for r in cands:
        rid = r["id"]
        gate_control = r.get("tierA_control_merges", 0) > 0
        gate_compat = bool(r.get("seeded_collision")) or bool(r.get("frozen_head_rewrite"))

        if r["kind"] == "subtree-collapse":
            coh = majority(rid, "coherent")
            sel = r["mdl"]["selected"]
            net_ok = r["mdl"].get("marginal_net", 0) > 0
            conf = 0.50 + 0.15 * (1 if coh else 0) + 0.10 \
                + 0.05 * (1 + (1 if r["meta"]["star_corroborated"] else 0)) \
                + 0.05 * (1 if r.get("support", 0) >= 3 else 0)
            conf = round(min(conf, 0.95), 3)
            if gate_control:
                status, note = "rejected", "HARD GATE: collapses a negative-control pair"
            elif not sel:
                status, note = "rejected", "greedy MDL: marginal net <= 0 at selection"
            elif not net_ok:
                status, note = "rejected", "measured marginal net <= 0"
            elif coh is False:
                status, note = "rejected", "judges: not one coherent semantic unit"
            elif coh is None:
                status, note = "rejected", "no probe votes"
            else:
                status, note = "validated", ""
            r2 = dict(r)
            r2.update({"type": "consolidation", "status": status, "confidence": conf})
            g = {"probe_coherent": coh,
                 "judge_notes": [v.get("note", "") for v in votes.get(rid, [])],
                 "probe_votes": len(votes.get(rid, []))}
        elif r["kind"] == "role-interchange":
            r2 = dict(r)
            r2.update({"type": "consolidation", "status": "rejected", "confidence": 0.5})
            g = {"probe_votes": 0}
            note = ("unconditioned frozen-head role swap -> prompt-side evidence "
                    "(#23/#50: the fix-pack channel decides)")
        else:                                    # lexical-collapse — round-1 routing
            st = majority(rid, "same_truth")
            ll = majority(rid, "lossless")
            cal_override = False
            if st and ll is False:
                no_notes = [v.get("note", "") for v in votes.get(rid, [])
                            if v.get("lossless") == "no"]
                if no_notes and all(register_only(n) for n in no_notes):
                    ll = True
                    cal_override = True
            conf = 0.50
            conf += 0.15 * (1 if st else 0)
            conf += 0.10 * (1 if ll else 0)
            conf += 0.05 * 1                     # one method: the AE generator
            conf += 0.05 * (1 if r.get("support", 0) >= 3 else 0)
            conf = round(min(conf, 0.95), 3)
            lossless_final = bool(ll)
            directed = r.get("direction") == "lhs->rhs"
            final_type = "consolidation"
            if gate_control:
                status = "rejected"
                note = "HARD GATE: collapses a negative-control pair"
            elif st is False:
                status = "rejected"
                note = "judges: truth conditions not preserved"
            elif gate_compat:
                status = "rejected"
                note = ("frozen-vocabulary conflict -> prompt-side evidence "
                        "(#50: the fix-pack channel decides; no demotion tier)")
            elif conf >= 0.9 and lossless_final and directed:
                status = "validated"
                note = ""
            else:
                status = "rejected"
                note = "sub-threshold, lossy, or undirected (#50: no demotion tier)"
            r2 = dict(r)
            r2.update({"type": final_type, "status": status, "confidence": conf})
            g = {"probe_same_truth": st, "probe_lossless": ll,
                 "plan_calibration_override": cal_override,
                 "judge_notes": [v.get("note", "") for v in votes.get(rid, [])],
                 "probe_votes": len(votes.get(rid, []))}

        g.update({"tierA_new_identical": r.get("tierA_new_identical"),
                  "tierA_control_merges": r.get("tierA_control_merges"),
                  "seeded_collision": r.get("seeded_collision"),
                  "frozen_head_rewrite": r.get("frozen_head_rewrite"),
                  "original_type": r["type"], "note": note, "round": 2})
        r2["gauntlet"] = g
        for k in ("tierA_new_identical", "tierA_control_merges",
                  "seeded_collision", "frozen_head_rewrite"):
            r2.pop(k, None)
        out.append(r2)

    with open(args.out, "w", encoding="utf-8") as fh:
        for r in out:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    tally = collections.Counter((r["kind"], r["type"], r["status"]) for r in out)
    print(f"-> {args.out}  ({len(out)} rules)")
    for (k, t, s), n in sorted(tally.items()):
        print(f"   {k:18} {t:14} {s:10} {n}")
    incomplete = [r["id"] for r in out if r["gauntlet"].get("probe_votes", 0) not in (0, 3)]
    if incomplete:
        print(f"   WARNING incomplete probe votes: {incomplete}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--stage", required=True, choices=["mech", "finalize"])
    ap.add_argument("--candidates", default=os.path.join(FUSENF, "rules", "candidates2.jsonl"))
    ap.add_argument("--cards-dir", default=os.path.join(FUSENF, "rules", "probes2"))
    ap.add_argument("--batches", type=int, default=6)
    ap.add_argument("--out", default=os.path.join(FUSENF, "rules", "validated2.jsonl"))
    args = ap.parse_args()
    if args.stage == "mech":
        stage_mech(args)
    else:
        stage_finalize(args)


if __name__ == "__main__":
    main()
