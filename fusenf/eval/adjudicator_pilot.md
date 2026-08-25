# Adjudicator dual-tier pilot (2026-08-24)

Design: 30 records (20 owner-anchored + 10 fresh clean-stratum partials), each
adjudicated independently by an Opus and a Fable agent under `ADJUDICATE.md`
(refute-don't-obey; owner calibration line binding; repairs to `adjudication/`, never
`raw/`). Ground truth = the owner's 20 adjudications in
`review_batches/adjudication_sample.json` (agents forbidden to read it). Scoring rule
pre-registered in `adjudication/pilot_manifest.json`. 16 agents total; all outputs
present, every repair decision has its repair file.

## Scores

| | Opus | Fable |
|---|---|---|
| anchor agreement (n=20) | **17/20** | **17/20** |
| recall on owner-genuine (14) | **14/14** | 13/14 |
| owner-acceptable accepted (6) | 3/6 | **4/6** |
| issue verdicts (n=61 across 30) | 38 confirm / 15 refute / 8 partial | 38 confirm / 21 refute / 2 partial |
| decisions (30) | 26 repair / 4 accept | 23 repair / 7 accept |
| inter-tier decision agreement | \multicolumn{2}{c}{**27/30**} | |

## Reading the misses

- **The two shared "misses" are not really misses.** Both tiers independently repaired
  `tierC-000007` (article-mandated witness) and `tierC-000341` (the mandatory
  agent-nominalization atom — "fixed, not a judgment call" per the prompt). The owner
  had accepted both on the content-truth line; the adjudicators enforce the mechanical
  letter. Both repairs are harmless-to-beneficial (nothing false enters; consistency
  improves) — for a KB pipeline this behavior is arguably correct, and it is
  *convergent across tiers*, i.e., a property of the brief, not a tier.
- **The two discriminating records split 1–1.** Fable matched the owner's borderline
  accept on `tierB-001951` with the pilot's best refutation (the "X has a
  generalization" paraphrase patterns with the licensed relational-noun genitive, not
  the excluded aboutness class). Opus matched the owner's genuine on `tierB-001186`
  (the "only"-drop / unbindable existential) where Fable accepted — the pilot's only
  miss on the defect side, and the one asymmetry that matters for safety.
- **Deference is refuted for both tiers**: 15 and 21 issue-level refutations
  respectively; neither rubber-stamps the Opus reviewer.

## Decision: Opus is the production adjudicator

Equal anchor accuracy at ~5× lower cost, with **perfect recall on the owner-genuine
side** (the safety-relevant direction — Fable's single miss was there). Fable's edge is
subtlety on borderline refutations, which is exactly the escalation profile: **Fable is
reserved as the second-stage adjudicator** for (a) reviewer–adjudicator hard conflicts,
(b) repairs that would touch doctrine, (c) records the owner flags. The convergent
letter-over-spirit behavior on mandatory-form rules is accepted as pipeline behavior
(logged for the owner; revisit only if it produces churn).

## Side products

- 26 Opus repairs + 23 Fable repairs exist as pilot artifacts in `adjudication/`
  (promotion to the parse store is a separate explicit step, not yet taken).
- Recurring cross-item finds (now multiply-derived): negation-inside-seal is
  inexpressible (converges with tierB-000052); **the preposition-named `To` oblique
  collides with the seeded purpose-connective head at the same arity** (vocabulary
  hazard, owner attention); `ConditionalProperty` forces distribution so the
  non-distributing `KindProperty` family has no restricted form; ~34 new gaps filed by
  the Opus arm alone, merged into the batch-3 harvest.

## Not yet done (optional next steps, owner's call on quota)

1. **Repair-yield measurement**: blind re-review (plain REVIEW.md, reviewers unaware
   they see repairs) of the production-tier arm's 26 repairs — ~6 Opus batches. This
   was the pilot design's closing loop; the tier decision did not need it, the yield
   number does.
2. Promotion policy for pilot repairs (new run, flagged non-blind) — after (1).
3. Scale decision: adjudication over the remaining ~140 unadjudicated review-defect
   records, or hold for the batch-3 fix-pack first (the gap harvest suggests many
   defects vanish at the prompt level).

## Repair-yield re-review — round 1 (2026-08-25; closes the pilot)

The 26 Opus repairs, staged as `raw/<ID>__run90.txt` (staging only, never assembled), were
blind-re-reviewed per plain REVIEW.md (6 Opus batches, reviewers unaware of repair status;
verdicts `review/*__run90.review.json`). **Result: 11/26 now `q1=yes` (42% clean yield),
14 partial, 1 regressed.**

**The load-bearing finding is standard drift, not repair failure**: 8 of the 15 residual
verdicts cite fix-pack-3 rules verbatim (change-of-kind, containment-only `LocatedIn`, the D1
0.8 band + companion, S1's `For`-argument atom, S4's hedge→0.9) — the repairs were made against
`f6448eac` and judged against `2aa57fa8`. True yield vs the standard the repairs were made
under is therefore higher than 42%; and the remedy for those 8 is a **fresh blind parse at the
new hash**, not a second hand-repair.

**Terminal dispositions (bounded loop, round 1 — zero second repairs needed):**

| disposition | n | records |
|---|---|---|
| repaired-verified | 11 | the q1=yes set |
| reparse-at-`2aa57fa8` (fix-pack family) | 8 | 000654 000566 000436 001186 001472 001826 tierC-000157 tierC-000234 |
| excluded-from-substrate (deferred-gap territory) | 4 | 001353 (metaphor) 000652 (equative/pl-superlative) 000270 (variant-"in"+focus) 001654 (until-reschedule, false Time) |
| accepted-with-registered-gap (single minor issue) | 2 | tierC-000007 (casing) tierC-000010 (ordinal scale) |
| owner-escalated | 1 | 001686 (expressive-formula doctrine question) |

One honest regression on record: tierB-000652's repair deleted the ill-typed `Most` atoms with
nothing licensed to replace them (the construction is deferred-gap), so the re-review correctly
graded the deletion `no` — both the repair and the grade behaved per doctrine; the record is
simply unservable until the equative gap is designed. Promotion note: the 11 verified repairs
remain pilot artifacts pending the owner's promotion decision; nothing has entered the parse
store.

## Promotion + doctrine closure (2026-08-25, owner decisions)

- **The 11 verified repairs are PROMOTED** to the parse store as **run 90** (9 tierB → 
  `tierB.parses.jsonl`, 2 tierC → `tierC.parses.jsonl`), model `claude-opus-5`, batch
  `adjudicated-repair-nonblind`, pinned `f6448eac` (the standard they were authored under);
  validation at promotion 10 clean / 1 report-only C4. The 15 non-verified staging files were
  removed from `raw/` (repair originals remain in `adjudication/`). Non-blind provenance is
  carried by batch label + model + run number.
- **Expressive-formula doctrine question WITHDRAWN by the owner** — no implicit
  speaker/addressee minting; current doctrine stands. tierB-001686 re-dispositioned
  `accepted-with-registered-gap` (final tally: 11 promoted / 8 reparse / 4 excluded /
  3 accepted-with-gap / 0 escalated).
- Clarified for the record: the 8 reparse-family records CAN be re-parsed at `2aa57fa8` under a
  fresh run number at any time (append-only store, per-record hash pins) — riding batch-3
  parsing is economy, not necessity.
