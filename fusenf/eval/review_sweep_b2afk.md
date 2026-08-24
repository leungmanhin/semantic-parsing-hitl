# Review sweep — batch-2 AFK campaign, findings stratum (2026-08-24)

First standing use of the §5.2 sampled-review machinery on campaign output (REVIEW.md,
blind Opus, validator findings withheld; DISPATCH.md sampling policy). Owner budget
decision: **findings+flags now; the ≥10% clean-record stratum runs next session** — its
deterministic 227-record sample is pre-registered in
`review_batches/rv_campaign_manifest.json` (sha256(id|run)-ordered, rule pinned there).

## Scope

96 records in 20 batches (`rv-048`–`rv-067`): all 93 campaign records with mechanical
findings (70 tierB r1, 3 pilot r2, 20 tierC r40) + 3 orchestrator flags (tierB-000606,
-001461, -001799). 96/96 verdicts on disk, disk-diff clean per group. Agents now
584/600 session-lifetime.

**This stratum is maximally adverse by construction** (every record was already
machine-flagged); its defect rate is NOT the corpus rate — that estimator is the clean
sample.

## Headline verdicts (n=96)

| q | result |
|---|---|
| q1 faithful | **yes 37 · partial 57 · no 2** |
| q2 coverage | **gap 87 · covered 9** |
| q3 context leak | na 96 (no context supplied anywhere) |
| q4 unlicensed heads | 11 records |

Triage re-dispositioned mechanically: **34 `reviewed-ok`** (q1=yes) / **59
`review-defect`** (q1≠yes; verdict embedded in the row) — the 59 await owner
adjudication; partials are mostly single-issue (48 tierB partial, 9 tierC partial,
2 tierB no).

## The calibration result: C4 is mostly a false alarm — by design

Join of validator C4 heads vs the blind reviewers' q4 (who saw no validator output):
of **82 C4-flagged heads, reviewers independently confirmed 11 (13%) as genuinely
unlicensed; 71 were judged licensed under the open-class licenses** (lexical
kind-relations, preposition-named obliques), and reviewers flagged **0 heads the
validator missed**. Direct input to pre-flight item G.1: C4 must stay report-only in
`STRICT_SEVERITY`; the true-violation channel is the review join, not the raw C4 count.

## The two hard failures (both pilot run-2)

1. **tierB-000052** — "nobody" polarity LOST: the negation sat inside a sealed
   `Directive` term, and a sealed term has no truth-value slot, so the output asserts
   the positive universal. Plus an `Implication` nested as a seal argument (not a
   licensed sealing shape) and a projection violation (`QuantifierPhrase` outside, rule
   inside). **Doctrine corner exposed: negation-inside-seal has no worked rule.**
2. **tierB-000091** — agent-nominalization misfired on a referring subject
   ("shopkeeper" → `(can keep)` + `(Keep shopkeeper shop)` = world-knowledge assertion);
   idiom "let X go for <price>" parsed as a literal causative over a going event
   (inanimate `Agent`); "almost nothing" as a bare untyped constant.

## Flag verdicts (orchestrator picks, all q1=yes)

- **tierB-000606 "If planes are dangerous, cars are much more so." — the parse is
  VINDICATED** (the pause-2 "near-certain under-parse" suspicion was wrong): ground
  `Implication` with correct `More` argument order and ellipsis resolution. The reviewer
  instead names three real coverage gaps: degree-modified comparative ("much more"),
  the "more so" pro-form, and no pinned TV for a plain indicative conditional.
- **tierB-001461** (two-sentence leak) — fully faithful, no gaps.
- **tierB-001799** (two-sentence leak) — faithful; gaps: degree-on-comparative again +
  discourse "just" in an imperative.

## Gap harvest (q2 → the prompt-loop worklist; 87 gap verdicts)

Recurring (≥2 independent reviewers): degree-modified comparative (much/far/slightly +
comparative — also in both flag verdicts); stative locative with a non-containment
preposition; participial/adjectival post-modifier taking a PP complement; focus particle
over a non-eventive predication; contrastive "while" (=whereas) vs its temporal listing;
multi-word phrasal verb as kind-relation head. Singletons of note: negation-inside-seal
(the 000052 failure), reported/indirect directives, reciprocal inside a sealed
complement, "as well as" coordination, bare mass/abstract generic subjects, complex
multi-word spatial prepositions. These merge with the campaign report's parser-flagged
list (vague frequency adverbs, control-infinitive doctrine, tough-constructions) into
the batch-3 fix-pack candidate pool.

## Next

1. **Clean-sample stratum next session**: 227 pre-registered records (~46 batches at
   the standing 5-item size) — the defect-rate estimator; escalation if >~5%.
2. Owner adjudication over the 59 `review-defect` rows (most are single-issue partials;
   the two pilot-r2 hard failures are re-parse candidates — but per the error-vs-variance
   doctrine, prompt-DETERMINED misses route to diagnosis, not bridges).
3. Review-by-provenance (stratum 2) activates automatically when mining (E/H) produces
   candidates citing campaign records.
