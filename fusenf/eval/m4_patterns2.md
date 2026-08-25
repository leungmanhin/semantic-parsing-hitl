# M4 gate — item E miner upgrade (2026-08-25)

Gate per `BATCH2_PLAN.md` §E: before any candidate from the upgraded portfolio reaches a
gauntlet — recall vs the Tier A answer key ≥ wave-1's 30/31 **with `CoAgent~GroupOf`
recovered via a 2-conjunct pattern (or its miss explained)**, and **zero control merges**.
Inputs identical to wave 1 (tierA + tierC_p1–p3 canon, corpora tierA + tierC; baseline
reproduced exactly before the upgrade: 411+468ctl pairs, 46 rules, 0 ctl-flagged, 30/31).

## Verdict: PASS

| criterion | wave 1 | item E |
|---|---|---|
| target-rule recovery | 30/31 | **31/31** |
| CoAgent~GroupOf | MISS | **au0091 (factor, promotable, sole-diff-attested)** |
| control merges (unit signals) | 0 | **0** |
| control merges (factor signals) | — | **0** (promotable requires control-clean) |
| unit rules vs wave 1 | 46 | **46 — exact set match** (lhs/rhs/support/flags) |
| determinism (byte-identical rerun) | ✓ | ✓ (patterns2, align, both) |

## The CoAgent~GroupOf story (the miss, explained and then recovered)

The seed-table name is wrong about the parse reality: the licensed parse of "Ana and Bo
work on the mural" **distributes the coordination** (#21) into two parallel events — no
`GroupOf` atom exists in any of the 4 target classes. The true correspondence is
**CoAgent-event ↔ twin-event pair**, which spans two stars on the RHS and is therefore
structurally invisible to per-unit diffs (wave 1 matched the one event star, emitted the
CoAgent removal, and dropped the second event as an unrelated "lone" instance).

Recovered on both new channels:

1. **Miner side** — `frequent_patterns2` conjunction expansion mines the 2-conjunct
   2-center shape `(Member $e0 $v0) (Member $e1 $v0)` (two events sharing a verb) at
   support 46, and it is the **top-ranked pattern by nisurp (7.41)** — the corpus's
   single most surprising regularity, exactly the distributed-coordination structure.
   (The connectivity edge that makes it reachable: atoms connect on shared content
   constants, not only shared skolems.)
2. **Alignment side** — factoring (§4) yields `au0091`:
   `(CoAgent $e0 $x0:K0)` ↔ `(Agent $e1 $x0:K0) (Location $e1 $x1:K1) (Member $e1 work)`,
   support 2 (seedA-064+065; witnesses fitter/ranger, frame/survey), **promotable**
   (sole-diff-attested, control-clean). The other two classes use proper-named
   participants (bo/nils, constants by design) and a Theme-vs-Location scenario split, so
   they land on sibling keys at support 1 — the recovery matcher takes au0091 via the
   provenance rule (≥2 of the target's classes). The enabling change: class annotations
   on cross-side-MATCHED satellites lift to K-variables even when one-sided in the diff
   (a lone twin-event star drags its scenario fillers into the diff; a matched
   satellite's identity is context, not content). Genuine lexical candidates
   (box/crate) are argument constants, not annotations — untouched.

## The §4 trap, observed and held

Factoring the buy↔sell converse splits the lexeme swap from the role swap exactly as the
study predicted: `(Agent $e0 $x0:K0)` ↔ `(Recipient $e0 $x0:K0)` appears at support 11 —
and is correctly **non-promotable** (never any pair's sole diff), as are the bare
`∅ ↔ (Member $e0 <verb>)` substitution halves. 64 factor rows total: 10 promotable
non-duplicate (cause/take-wrappers, doctor↔physician both directions, automobile↔car,
difficult↔hard, Agent↔Source, CoAgent↔twin-event, tense-add), 0 fire on control, the
rest await judges. Unit keys double as the study's joint keys.

## Portfolio pieces landed with the gate

- **`frequent_patterns2`** (762 records, k=4, min-support 3, 9.6s, deterministic):
  5,799 patterns — 1,898 star / 3,668 cross / 233 kindlevel; 3,939 in the shape stratum
  (constant-lifting with value-level co-reference); nisurp from connected-block
  partitions; exports `patterns2.jsonl` (full id lists = the record×feature matrix
  substrate), `valuations_slots.jsonl` (no support floor), signals. k=3 runs in 2.9s;
  k=4 chosen as production (the plan's upper bound) after it unlocked 14 more attested
  cross-star conjunctions.
- **`role_fillers2`** on the valuation export: 513 event slots + **595 entity slots**
  (the event-only restriction is gone); 57 signals; **D.3 live** — flip witnesses on
  `cancel` (7 Patient / 2 Theme, shared filler `evening_flight`) and `call_off` routed to
  `flip_diagnostics.jsonl` as parse errors (prompt-determined occurrence verbs; the
  residual pre-B2 Theme parses), 5 prompt-undetermined flips stay bridge-eligible.
  Doctrine table `mining/prompt_determined_roles.json` (named verbs only, owner-reviewable).
- **77 cross-star groups re-expressed** (`crossstar_conjunctions.py`): the round-2
  event-centering-untranslatable remainder re-derived exactly (77); 20/77 gain an
  attested conjunction candidate at k≤4 (dominated by #12 compound+genus bundles, e.g.
  `(Member $x0 night_crew)`+`(Inheritance night_crew crew)`, attested via the
  shared-constant edge); 391 pair unions are disconnected after translation — the
  scenario-sibling diagnosis from wave 2, reconfirmed structurally; 354 exceed k=4.
  Candidate prep only; supports re-measure at H.

## Notes for H

- The mining run over Tier B remains reserved for H (this run: Tier A + Tier C p1–p3
  only; the wave-1 862-record substrate included the pilot-100 Tier B canon — not
  re-mined here under the never-mine-Tier-B-twice rule).
- take-a-walk's 3-clause conjunction sits at support 2 (below floor) because
  tierA-000182 parses the light-verb complement as `Patient` where its twins use
  `Theme` — a live #23 wobble on a prompt-undetermined class (bridge-eligible per D.3);
  the alignment channel still recovers the target (au0038-equivalent, provenance).
- Implication-headed atoms and surface records stay excluded (batch-1 parity); rule-level
  mining is its own future species.
