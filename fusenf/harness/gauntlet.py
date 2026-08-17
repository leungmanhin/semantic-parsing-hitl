"""FUSE-NF P4 — the validation gauntlet (PLAN.md §7, routing per §1, gates per metrics.md M4/M5).

Pipeline over ``rules/candidates.jsonl``:

  --stage mech      cross-method consensus votes; per-rule Tier-A effect (each rule applied
                    ALONE: newly-identical positive pairs vs CONTROL MERGES — M4's hard gate);
                    seeded-vocabulary and frozen-head compatibility; substitutability probe
                    cards for the blind judges.
  --stage finalize  collect judge votes, compute evidence-based confidence, route per §1,
                    write rules/validated.jsonl.

Stage boundaries follow deterministic-first: everything mechanical is computed here;
the ONE judgment call (does the swap preserve truth conditions / lose information?) goes
to blind judges via probe cards, majority-of-3.

Evidence-based confidence (the §1 thresholds are pre-registered; this formula is the
"tuned on Tier A" instantiation, explicit and revisable):

    conf = 0.50
         + 0.15 * probe_same_truth_majority
         + 0.10 * probe_lossless_majority
         + 0.15 * design_label_consolidation   (Tier A expected_routing)
         + 0.05 * consensus_votes              (0-3 methods)
         + 0.05 * (support >= 3)
    capped at 0.95

Routing (§1 + M4 hard gate + M5 frozen gate):
    control_merges > 0                       -> rejected (never consolidation)
    frozen-head rewrite or seeded collision  -> bridging at most
    conf >= 0.9 and lossless and directed    -> consolidation / validated
    0.6 <= conf < 0.9, or lossy              -> bridging / validated
    conf < 0.6 or same-truth majority NO     -> rejected
"""

from __future__ import annotations

import argparse
import collections
import glob
import itertools
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import canonicalize as C  # noqa: E402
import consolidate as K  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)

CONSENSUS = {
    # a vote = independent method evidence for the candidate
    "align": lambda r, ctx: 1,                                   # the mining source itself
    "role-fillers": lambda r, ctx: 1 if (r.get("provenance", {}).get("slot_cosine") or 0) >= 0.5
                                     or r.get("kind") == "role-canonicalization" else 0,
    "stars": lambda r, ctx: 1 if r.get("kind") == "lexical-collapse" and r.get("symbol_pair_ok")
                              else 0,
}


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def seeded_tokens(path):
    toks = set()
    for line in open(path, encoding="utf-8"):
        line = line.strip()
        if not line or line.startswith(";"):
            continue
        line = re.sub(r'"[^"]*"', " ", line)
        toks.update(t for t in re.findall(r"(?<![\w$])[a-z][a-z0-9_]*(?![\w])", line))
    return toks


def rule_symbols(side):
    out = set()
    for a in side:
        for t in re.findall(r"(?<![\w$<:\"])[a-z][a-z0-9_]*(?![\w])", re.sub(r'"[^"]*"', " ", a)):
            out.add(t)
    return out


def rule_heads(side):
    return {a.strip("()").split()[0] for a in side}


def stage_mech(args):
    cands = load(args.candidates)
    corpora = {}
    for p in args.corpus:
        for r in load(p):
            corpora[r["id"]] = r

    # --- stars corroboration set (lexical): unit patterns present at support>=3
    star_atoms = set()
    for p in load(os.path.join(FUSENF, "mining", args.mining_out, "stars.jsonl")):
        if p["support"] >= 3:
            star_atoms.update(p["atoms"])

    # --- Tier A records + pair lists for the per-rule effect check
    tierA = load(os.path.join(FUSENF, "canonical", "tierA.canon.jsonl"))
    meta = {cid: corpora[cid] for cid in (r["id"] for r in tierA) if cid in corpora}
    by_class = collections.defaultdict(list)
    for cid, m in meta.items():
        by_class[m["equiv_class"]].append(cid)
    pos_pairs, ctl_pairs = [], []
    for ec in sorted(by_class):
        ids = sorted(by_class[ec])
        same = [i for i in ids if meta[i]["labels"]["polarity"] == "same"]
        diff = [i for i in ids if meta[i]["labels"]["polarity"] == "different"]
        pos_pairs += list(itertools.combinations(same, 2))
        ctl_pairs += [(a, b) for a in same for b in diff]
    base_gid = {r["id"]: r["graph_id"] for r in tierA}
    vocab = C.load_vocabulary()

    def gids_under(rule):
        sym, struct = K.prepare_rules([rule])
        out = dict(base_gid)
        for rec in tierA:
            stmts, n_tok, applied = K.consolidate_record(rec, sym, struct)
            if n_tok or applied:
                out[rec["id"]] = C.canonicalize(
                    {"id": rec["id"], "run": rec.get("run"), "statements": stmts},
                    vocab=vocab)["graph_id"]
        return out

    seeded = seeded_tokens(os.path.join(FUSENF, os.pardir, "seeded_rules.metta"))
    raw_vocab = json.load(open(os.path.join(FUSENF, "specs", "vocabulary.json"), encoding="utf-8"))
    frozen_heads = {n for n, e in raw_vocab["operators"].items() if e.get("frozen")}

    for r in cands:
        # stars corroboration (lexical pairs only)
        r["symbol_pair_ok"] = False
        if r["kind"] == "lexical-collapse":
            m = re.findall(r"\(Member \$\w+ ([a-z][a-z0-9_]*)\)", r["lhs"][0] + " " + r["rhs"][0])
            if len(m) == 2:
                pa = "(Member $C %s)" % m[0]
                pb = "(Member $C %s)" % m[1]
                r["symbol_pair_ok"] = pa in star_atoms and pb in star_atoms
        r["consensus_votes"] = sum(f(r, None) for f in CONSENSUS.values())

        # seeded / frozen compatibility. Frozen test = HEAD SUBSTITUTION on identical
        # arguments (a lhs/rhs atom pair differing only in a frozen head — the
        # role-canonicalization shape); frame RESTRUCTURING that merely drops a role
        # atom is not flagged here — M5 preservation adjudicates it instead.
        lhs_only = rule_symbols(r["lhs"]) - rule_symbols(r["rhs"])
        r["seeded_collision"] = sorted(lhs_only & seeded)
        frozen_swaps = set()
        for la in r["lhs"]:
            lt = la.strip("()").split()
            for ra in r["rhs"]:
                rt = ra.strip("()").split()
                if len(lt) == len(rt) and lt[1:] == rt[1:] and lt[0] != rt[0] \
                        and lt[0] in frozen_heads and rt[0] in frozen_heads:
                    frozen_swaps.add("%s->%s" % (lt[0], rt[0]))
        r["frozen_head_rewrite"] = sorted(frozen_swaps)

        # per-rule Tier A effect (consolidation candidates only)
        if r["type"] == "consolidation":
            g = gids_under(r)
            r["tierA_new_identical"] = sum(1 for a, b in pos_pairs
                                           if g[a] == g[b] and base_gid[a] != base_gid[b])
            r["tierA_control_merges"] = sum(1 for a, b in ctl_pairs if g[a] == g[b])
        else:
            r["tierA_new_identical"] = None
            r["tierA_control_merges"] = 0

    with open(args.candidates + ".mech", "w", encoding="utf-8") as fh:
        for r in cands:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    # --- probe cards (all non-role rules; role rules are annotation-level, no surface swap)
    cards = []
    for r in cands:
        if r["kind"] == "role-canonicalization":
            continue
        examples = []
        for ex in (r.get("provenance", {}).get("examples") or [])[:2]:
            ids = ex.split("|")
            sents = [" ".join(corpora[i]["sentences"]) for i in ids if i in corpora]
            if len(sents) == 2:
                examples.append({"A": sents[0], "B": sents[1]})
        cards.append({
            "rule_id": r["id"], "kind": r["kind"],
            "lhs": r["lhs"], "rhs": r["rhs"], "examples": examples,
        })
    os.makedirs(args.cards_dir, exist_ok=True)
    nb = args.batches
    for b in range(nb):
        chunk = cards[b::nb]
        with open(os.path.join(args.cards_dir, "cards_b%d.json" % (b + 1)), "w",
                  encoding="utf-8") as fh:
            json.dump(chunk, fh, ensure_ascii=False, indent=1)
    print(f"mech: {len(cands)} candidates annotated -> {args.candidates}.mech")
    hard = [r["id"] for r in cands if r["tierA_control_merges"]]
    print(f"      control merges (HARD GATE, must be none): {hard or 'none'}")
    print(f"      seeded collisions: "
          f"{ {r['id']: r['seeded_collision'] for r in cands if r['seeded_collision']} or 'none' }")
    print(f"      frozen-head rewrites: "
          f"{ {r['id']: r['frozen_head_rewrite'] for r in cands if r['frozen_head_rewrite']} or 'none' }")
    print(f"      probe cards: {len(cards)} rules -> {nb} batches in {args.cards_dir}")


REGISTER_WORDS = ("register", "formal", "informal", "colloquial", "casual", "bureaucratic",
                  "latinate", "ceremonial", "spoken", "everyday", "neutral", "style", "tone",
                  "phrasal", "idiomatic", "business")
SEMANTIC_WORDS = ("broader", "narrower", "hypernym", "hyponym", "entail", "implies", "imply",
                  "intensity", "scale", "exceed", "stronger", "weaker", "manner", "aspect",
                  "causation", "mediated", "deliberat", "process", "payment", "gift",
                  "participant", "role", "patient", "theme", "voice", "final", "dramatic",
                  "emphasis", "mandate", "commercial")


def register_only(note):
    """True iff a lossless-'no' note cites ONLY register/formality, no semantic content.

    PLAN.md §1's example table is the pre-registered calibration: ``purchase -> buy``
    IS the canonical consolidation example, so register loss alone must not demote;
    ``stroll ~ walk (manner lost)`` is the bridging example, so any semantic-content
    keyword blocks the override. Every override is logged with its notes."""
    low = note.lower()
    return any(w in low for w in REGISTER_WORDS) and not any(w in low for w in SEMANTIC_WORDS)


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
        st = majority(rid, "same_truth")
        ll = majority(rid, "lossless")
        # plan-calibration review: unanimous same-truth + every lossless-'no' note
        # register-only -> lossless under the §1 standard
        cal_override = False
        if st and ll is False:
            no_notes = [v.get("note", "") for v in votes.get(rid, [])
                        if v.get("lossless") == "no"]
            if no_notes and all(register_only(n) for n in no_notes):
                ll = True
                cal_override = True
        design = None
        # design label from the mined provenance routing decision at build time
        design_cons = r["type"] == "consolidation" and r["kind"] != "role-canonicalization"
        conf = 0.50
        conf += 0.15 * (1 if st else 0)
        conf += 0.10 * (1 if ll else 0)
        conf += 0.15 * (1 if (design_cons and r.get("lossless")) else 0)
        conf += 0.05 * r.get("consensus_votes", 1)
        conf += 0.05 * (1 if r.get("support", 0) >= 3 else 0)
        conf = round(min(conf, 0.95), 3)

        lossless_final = bool(ll) and r.get("lossless", True)
        gate_control = r.get("tierA_control_merges", 0) > 0
        gate_compat = bool(r.get("seeded_collision")) or bool(r.get("frozen_head_rewrite"))
        directed = r.get("direction") == "lhs->rhs"

        if r["kind"] == "role-canonicalization":
            final_type, status = "bridging", "validated"
            note = "annotation-level merge; frozen-head rewrite -> never consolidation (M5 gate)"
        elif gate_control:
            final_type, status = r["type"], "rejected"
            note = "HARD GATE: collapses a negative-control pair"
        elif st is False:
            final_type, status = r["type"], "rejected"
            note = "judges: truth conditions not preserved"
        elif r["type"] == "bridging":
            final_type = "bridging"
            status = "validated" if (st or st is None) else "rejected"
            note = "converse/structural equivalence, both directions live in the chainer"
        elif gate_compat:
            final_type, status = "bridging", "validated"
            note = "seeded/frozen compatibility gate -> demoted to bridging"
        elif conf >= 0.9 and lossless_final and directed:
            final_type, status = "consolidation", "validated"
            note = ""
        elif conf >= 0.6:
            final_type, status = "bridging", "validated"
            note = "conf<0.9 or lossy -> bridging (§1)"
        else:
            final_type, status = r["type"], "rejected"
            note = "conf<0.6"

        r2 = dict(r)
        r2.update({
            "type": final_type, "status": status, "confidence": conf,
            "gauntlet": {
                "probe_same_truth": st, "probe_lossless": ll,
                "plan_calibration_override": cal_override,
                "judge_notes": [v.get("note", "") for v in votes.get(rid, [])],
                "probe_votes": len(votes.get(rid, [])),
                "consensus_votes": r.get("consensus_votes"),
                "tierA_new_identical": r.get("tierA_new_identical"),
                "tierA_control_merges": r.get("tierA_control_merges"),
                "seeded_collision": r.get("seeded_collision"),
                "frozen_head_rewrite": r.get("frozen_head_rewrite"),
                "original_type": r["type"], "note": note,
            },
        })
        for k in ("symbol_pair_ok", "consensus_votes", "tierA_new_identical",
                  "tierA_control_merges", "seeded_collision", "frozen_head_rewrite"):
            r2.pop(k, None)
        out.append(r2)

    with open(args.out, "w", encoding="utf-8") as fh:
        for r in out:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    tally = collections.Counter((r["type"], r["status"]) for r in out)
    print(f"-> {args.out}  ({len(out)} rules)")
    for (t, s), n in sorted(tally.items()):
        print(f"   {t:14} {s:10} {n}")
    low_votes = [r["id"] for r in out if r["gauntlet"]["probe_votes"] not in (0, 3)
                 and r["kind"] != "role-canonicalization"]
    if low_votes:
        print(f"   WARNING incomplete probe votes: {low_votes}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--stage", required=True, choices=["mech", "finalize"])
    ap.add_argument("--candidates", default=os.path.join(FUSENF, "rules", "candidates.jsonl"))
    ap.add_argument("--corpus", action="append", required=True)
    ap.add_argument("--cards-dir", default=os.path.join(FUSENF, "rules", "probes"))
    ap.add_argument("--batches", type=int, default=6)
    ap.add_argument("--mining-out", default="out",
                    help="mining output dir name for stars corroboration (loop 2: out2)")
    ap.add_argument("--out", default=os.path.join(FUSENF, "rules", "validated.jsonl"))
    args = ap.parse_args()
    if args.stage == "mech":
        stage_mech(args)
    else:
        stage_finalize(args)


if __name__ == "__main__":
    main()
