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
