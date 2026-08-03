#!/usr/bin/env python3
"""Tier A seed table -> realization specs -> corpus JSONL.

Source of truth for the Tier A design (`tierA_design.md`).  Deterministic: no
clock, no randomness, no set iteration reaching the output.

    build_tierA.py specs   > writes tierA_specs.json  (input to the realization agents)
    build_tierA.py corpus  < reads tierA_realized.json, writes tierA.jsonl + stats

Rules come first and seeds are allocated to them, not the other way round: a
`buy<-purchase` variant only exists in a buying scenario, so the seed inventory
is a consequence of wanting >=3 independent instances of every target rule.
"""

from __future__ import annotations

import hashlib
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))

# --------------------------------------------------------------------------
# target rules, grouped by the predicate family that can host them
# --------------------------------------------------------------------------
# family -> (mining rules, expected routing, applicable control kinds)
FAMILIES = {
    "buy":       (["buy<-purchase", "buy<-acquire", "buy~sell"], "consolidation+bridging",
                  ["participant-swap", "quantity-change", "negation"]),
    "repair":    (["repair<-fix", "repair<-mend"], "consolidation",
                  ["antonym", "negation", "participant-swap"]),
    "begin":     (["begin<-start", "begin<-commence"], "consolidation",
                  ["antonym", "negation", "modality-shift"]),
    "allow":     (["allow<-permit"], "consolidation",
                  ["antonym", "modality-shift", "negation"]),
    "require":   (["require<-need"], "consolidation",
                  ["modality-shift", "quantity-change", "negation"]),
    "abandon":   (["abandon<-give_up"], "consolidation",
                  ["antonym", "negation", "modality-shift"]),
    "postpone":  (["postpone<-put_off"], "consolidation",
                  ["antonym", "negation", "modality-shift"]),
    "discover":  (["discover<-find_out"], "consolidation",
                  ["negation", "participant-swap", "modality-shift"]),
    "cancel":    (["cancel<-call_off"], "consolidation",
                  ["antonym", "negation", "modality-shift"]),
    "reject":    (["reject<-turn_down"], "consolidation",
                  ["antonym", "participant-swap", "negation"]),
    "walk":      (["walk<-take_a_walk"], "consolidation",
                  ["manner-near-miss", "negation", "participant-swap"]),
    "decide":    (["decide<-make_a_decision", "decide<-decision"], "consolidation",
                  ["negation", "modality-shift", "participant-swap"]),
    "answer":    (["answer<-give_an_answer"], "consolidation",
                  ["negation", "participant-swap", "modality-shift"]),
    "destroy":   (["destroy<-destruction"], "consolidation",
                  ["antonym", "negation", "participant-swap"]),
    "arrive":    (["arrive<-arrival"], "consolidation",
                  ["antonym", "negation", "modality-shift"]),
    "die":       (["die<-kick_the_bucket"], "consolidation-lossy",
                  ["negation", "antonym", "modality-shift"]),
    "give":      (["give~receive"], "bridging",
                  ["participant-swap", "negation", "quantity-change"]),
    # `teach` has no lexical antonym — the realizer coined "unteaches" when asked
    # for one.  Participant-swap and negation are the honest controls here.
    "teach":     (["teach~learn"], "bridging",
                  ["participant-swap", "negation", "modality-shift"]),
    "lend":      (["lend~borrow"], "bridging",
                  ["participant-swap", "negation", "quantity-change"]),
    # NO participant-swap: `work with` is SYMMETRIC, so swapping the participants
    # preserves the meaning.  Labelling that `polarity: different` would score a
    # correct consolidation as a false positive — a control that corrupts M4 in
    # the direction of flattering nothing and penalising the miner.
    "work_with": (["CoAgent~GroupOf"], "bridging-or-reject",
                  ["negation", "manner-near-miss", "modality-shift"]),
    # One adjective pair per family: a family bundling two pairs asks its seeds
    # for a variant their own base adjective cannot support ("The repair is very
    # tired"), because the gloss can only instantiate one of them.
    "prop_large":     (["large<-big"], "consolidation",
                       ["antonym", "negation", "modality-shift"]),
    "prop_huge":      (["huge<-very_big"], "consolidation",
                       ["antonym", "negation", "modality-shift"]),
    "prop_difficult": (["difficult<-hard"], "consolidation",
                       ["antonym", "negation", "modality-shift"]),
    "prop_exhausted": (["exhausted<-very_tired"], "consolidation",
                       ["antonym", "negation", "modality-shift"]),
    "entity":    (["physician<-doctor"], "consolidation",
                  ["participant-swap", "negation", "antonym"]),
    "entity2":   (["automobile<-car"], "consolidation",
                  ["negation", "quantity-change", "antonym"]),
}

# --------------------------------------------------------------------------
# seeds — one meaning each.  `alt` = the category-(i) alternation this frame
# supports, or None.  Domains deliberately varied: role-filler clustering
# (§4.3.2) keys on event-conditioned slots, so identical fillers would make the
# slot distribution degenerate.
# --------------------------------------------------------------------------
SEEDS = [
    # family, domain, gloss (the MEANING to realize; wording is the agent's)
    ("buy", "depot", "a depot acquires two forklifts", "voice"),
    ("buy", "school", "a school acquires a projector for the hall", "voice"),
    ("buy", "kitchen", "a chef acquires several crates of lemons", "voice"),
    ("buy", "studio", "a pottery studio acquires a second kiln", "voice"),

    ("repair", "garage", "a mechanic repairs a seized gearbox", "voice"),
    ("repair", "site", "an electrician repairs the yard floodlight", "voice"),
    ("repair", "market", "a tailor repairs a torn awning", None),
    ("repair", "harbour", "a crew repairs a cracked feed pipe", "voice"),

    ("begin", "survey", "a shoreline survey begins at dawn", None),
    ("begin", "court", "a hearing begins on Monday morning", None),
    ("begin", "theatre", "the dress rehearsal begins after lunch", None),
    ("begin", "farm", "the apple harvest begins in September", None),

    ("allow", "prison", "a warden allows visitors on Sundays", None),
    ("allow", "transport", "a licence allows night deliveries", None),
    ("allow", "museum", "a curator allows photography in the hall", None),

    ("require", "kitchen", "a recipe requires two eggs", "voice"),
    ("require", "office", "a permit requires a countersignature", "voice"),
    ("require", "workshop", "a lathe requires monthly servicing", "voice"),

    ("abandon", "mountain", "a rescue team abandons the search", "voice"),
    ("abandon", "office", "a firm abandons its tender", "voice"),
    ("abandon", "mountain", "two climbers abandon the north route", "voice"),

    ("postpone", "office", "a board postpones the vote", "voice"),
    ("postpone", "harbour", "a ferry postpones its departure", None),
    ("postpone", "sport", "a club postpones the tournament", "voice"),

    ("discover", "office", "an auditor discovers an error in the ledger", "voice"),
    ("discover", "sea", "a diver discovers a wreck off the point", "voice"),
    ("discover", "office", "an intern discovers the missing file", "voice"),

    ("cancel", "transport", "an airline cancels the evening flight", "voice"),
    ("cancel", "town", "a council cancels the summer fair", "voice"),
    ("cancel", "school", "a tutor cancels the afternoon session", "voice"),

    ("reject", "publishing", "an editor rejects a manuscript", "voice"),
    ("reject", "bank", "a bank rejects the loan application", "voice"),
    ("reject", "office", "a panel rejects the proposal", "voice"),

    ("walk", "hills", "a shepherd walks along the ridge", None),
    ("walk", "clinic", "a nurse walks through the ward", None),
    ("walk", "harbour", "two children walk to the pier", None),

    ("decide", "office", "a committee decides on a new roof", None),
    ("decide", "court", "a judge decides the case", "voice"),
    ("decide", "home", "a family decides to move north", None),
    ("decide", "office", "a board decides next year's budget", "voice"),

    ("answer", "office", "a clerk answers the query", "voice"),
    ("answer", "airfield", "a pilot answers the tower", "voice"),
    ("answer", "clinic", "a vet answers the caller", "voice"),

    ("destroy", "garden", "a storm destroys the greenhouse", "voice"),
    ("destroy", "library", "a fire destroys the archive", "voice"),
    ("destroy", "valley", "a flood destroys the footbridge", "voice"),

    ("arrive", "depot", "the freight arrives at noon", None),
    ("arrive", "office", "a delegation arrives on Thursday", None),
    ("arrive", "lab", "the soil samples arrive by post", None),

    ("die", "farm", "an old mare dies during the winter", None),
    ("die", "town", "the founder dies at ninety", None),
    ("die", "orchard", "the last elm dies that autumn", None),

    ("give", "training", "a trainer gives a recruit a whistle", "dative"),
    ("give", "library", "a library gives each member a card", "dative"),
    ("give", "depot", "a foreman gives a driver the manifest", "dative"),
    ("give", "school", "a school gives the winner a medal", "dative"),

    ("teach", "studio", "a potter teaches an apprentice glazing", "dative"),
    ("teach", "sport", "a coach teaches the squad a drill", "dative"),
    ("teach", "village", "an elder teaches the children a song", "dative"),

    ("lend", "street", "a neighbour lends Ravi a ladder", "dative"),
    ("lend", "depot", "a depot lends the crew a generator", "dative"),
    ("lend", "museum", "a museum lends the gallery a painting", "dative"),

    ("work_with", "art", "Ana works with Bo on the mural", None),
    ("work_with", "site", "a welder works with a fitter on the frame", None),
    ("work_with", "field", "a biologist works with a ranger on the survey", None),
    ("work_with", "office", "Dara works with Nils on the ledger", None),

    ("prop_large", "depot", "a crate is large", None),
    ("prop_large", "harbour", "the hatch is large", None),
    ("prop_large", "workshop", "the new bench is large", None),

    ("prop_huge", "yard", "the boiler is huge", None),
    ("prop_huge", "hall", "the skylight is huge", None),
    ("prop_huge", "quarry", "the spoil mound is huge", None),

    ("prop_difficult", "site", "the repair is difficult", None),
    ("prop_difficult", "lab", "the calibration is difficult", None),
    ("prop_difficult", "mountain", "the descent is difficult", None),

    ("prop_exhausted", "harbour", "the night crew is exhausted", None),
    ("prop_exhausted", "transport", "the courier is exhausted", None),
    ("prop_exhausted", "sea", "the divers are exhausted", None),

    ("entity", "clinic", "a physician signs the chart", "voice"),
    ("entity", "clinic", "a physician examines the samples", "voice"),
    ("entity", "hospital", "a physician orders a second scan", "voice"),

    ("entity2", "street", "an automobile blocks the lane", "voice"),
    ("entity2", "depot", "an automobile waits at the gate", None),
    ("entity2", "town", "an automobile crosses the bridge", None),
]


def seed_id(i: int) -> str:
    return "seedA-%03d" % (i + 1)


def build_specs():
    """One spec per seed: what the realization agent must produce."""
    specs = []
    for i, (family, domain, gloss, alt) in enumerate(SEEDS):
        rules, routing, controls = FAMILIES[family]
        # deterministic control choice: two distinct kinds, rotated by seed index
        c1 = controls[i % len(controls)]
        c2 = controls[(i + 1) % len(controls)]
        specs.append({
            "seed": seed_id(i),
            "family": family,
            "domain": domain,
            "gloss": gloss,
            "expected_routing": routing,
            "variants": (
                [{"kind": "base", "target_rule": None, "control_kind": None,
                  "instruction": "the plain realization of the meaning"}]
                + [{"kind": "mining", "target_rule": r, "control_kind": None,
                    "instruction": rule_instruction(r)} for r in rules]
                + ([{"kind": "normalize", "target_rule": "alt:" + alt, "control_kind": None,
                     "instruction": ALT_INSTRUCTION[alt]}] if alt else [])
                + [{"kind": "control", "target_rule": None, "control_kind": c,
                    "instruction": CONTROL_INSTRUCTION[c]} for c in (c1, c2)]
            ),
        })
    return specs


def rule_instruction(rule: str) -> str:
    if "~" in rule:
        a, b = rule.split("~")
        return ("state the SAME event from the converse side, using '%s' instead of '%s' "
                "(the participants swap grammatical position but the event is unchanged)" % (b, a))
    canonical, variant = rule.split("<-")
    return ("re-word using '%s' in place of '%s', changing NOTHING else"
            % (variant.replace("_", " "), canonical.replace("_", " ")))


ALT_INSTRUCTION = {
    "voice": ("the same sentence in the PASSIVE voice, keeping the agent in a 'by' phrase "
              "(never agentless — an agentless passive is a different meaning)"),
    "dative": ("the same sentence with the other dative order (double-object <-> 'to' phrase)"),
}

CONTROL_INSTRUCTION = {
    "antonym": "replace the predicate with its OPPOSITE; change nothing else",
    "negation": "negate the sentence; change nothing else",
    "modality-shift": "change the modality (must <-> may, or add 'might'); change nothing else",
    "participant-swap": "swap two participants' roles; change nothing else",
    "quantity-change": "change a quantity to a different number; change nothing else",
    "manner-near-miss": "replace the verb with a near-miss manner verb (stroll vs sprint); change nothing else",
}


sys.path.insert(0, os.path.join(HERE, os.pardir, "harness"))
from records import input_sha256  # noqa: E402  — one definition of the C1 hash, not two


def build_corpus(realized_path: str, out_path: str):
    """realized.json: {seed: {variant_index: "sentence", ...}, ...} -> tierA.jsonl"""
    with open(realized_path, "r", encoding="utf-8") as fh:
        realized = json.load(fh)
    specs = {s["seed"]: s for s in build_specs()}
    records, n = [], 0
    for seed in sorted(specs):
        spec = specs[seed]
        got = realized.get(seed)
        if not got:
            continue
        for idx, variant in enumerate(spec["variants"]):
            sentence = got.get(str(idx)) or got.get(idx)
            if not sentence:
                continue
            n += 1
            sentences = [sentence.strip()]
            context = {"today": None, "domain": None, "prior": [], "notes": None}
            records.append({
                "schema": "fusenf-corpus/1",
                "id": "tierA-%06d" % n,
                "source": "tierA-synthetic",
                "sentences": sentences,
                "context": context,
                "equiv_class": seed,
                "labels": {
                    "family": spec["family"],
                    "domain": spec["domain"],
                    "variant_kind": variant["kind"],
                    "polarity": "different" if variant["kind"] == "control" else "same",
                    "target_rule": variant["target_rule"],
                    "control_kind": variant["control_kind"],
                    "expected_routing": spec["expected_routing"],
                },
                "input_sha256": input_sha256({"sentences": sentences, "context": context}),
            })
    with open(out_path, "w", encoding="utf-8") as fh:
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
    return records


def main():
    mode = sys.argv[1] if len(sys.argv) > 1 else "specs"
    if mode == "specs":
        specs = build_specs()
        out = os.path.join(HERE, "tierA_specs.json")
        with open(out, "w", encoding="utf-8") as fh:
            json.dump(specs, fh, indent=1, ensure_ascii=False)
            fh.write("\n")
        rules = {}
        for s in specs:
            for v in s["variants"]:
                if v["kind"] == "mining":
                    rules.setdefault(v["target_rule"], []).append(s["seed"])
        print("seeds     %d" % len(specs))
        print("sentences %d (planned)" % sum(len(s["variants"]) for s in specs))
        print("rules     %d" % len(rules))
        thin = {r: len(v) for r, v in sorted(rules.items()) if len(v) < 3}
        print("support   min=%d max=%d" % (min(len(v) for v in rules.values()),
                                           max(len(v) for v in rules.values())))
        print("under-supported (<3): %s" % (thin or "none"))
        print("wrote", out)
    elif mode == "corpus":
        recs = build_corpus(os.path.join(HERE, "tierA_realized.json"),
                            os.path.join(HERE, "tierA.jsonl"))
        print("wrote tierA.jsonl with %d records" % len(recs))
    else:
        raise SystemExit("usage: build_tierA.py [specs|corpus]")


if __name__ == "__main__":
    main()
