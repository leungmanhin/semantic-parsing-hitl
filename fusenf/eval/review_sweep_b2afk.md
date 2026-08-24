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

## Clean-sample stratum (run same day — the cap test made it possible)

The owner had the sweep double as an empirical test of the retired
`CLAUDE_CODE_MAX_SUBAGENTS_PER_SESSION` limit: **the old 600/session cap did NOT fire**
— launches 601–650 all succeeded and completed (the boundary agent at #600 and the
whole over-cap group wrote verdicts normally). The cap is a no-op in the installed
version; ops docs and memory corrected. The full 227-record pre-registered sample
therefore ran in-session (batches `rv-068`–`rv-114`, 47 blind Opus agents, 227/227
verdicts, disk-diff clean per group).

**Defect-rate estimate (n=227 uniform clean records):**

| q1 | n | rate |
|---|---|---|
| yes | 116 | 51.1% |
| partial | 104 | 45.8% |
| no (hard defect) | 7 | **3.1%** |

Rates are uniform across tiers (tierB r1 46% partial, tierC r40 49%, pilot r2 4/11).
**Hard-defect rate 3.1% is under the ~5% escalation threshold; the any-issue rate
(48.9%) is far over it** — the policy's "defect rate" is underdetermined between the
two readings, so the escalation call (widen sample / majority-of-N parsing) goes to the
owner rather than firing mechanically. Partial severity profile: 51/104 single-issue;
themes: role choice (32 issues), witness-vs-generic routing (25), dropped/unrepresented
content (25), strength/TV calibration (20), quantifier/plural mechanics (12),
tense/aspect (12) — systematic prompt-loop material, not random noise.

**Validator blind-spot check: ZERO** — no clean record drew a reviewer-flagged
unlicensed head, so C4's closed-list check had 100% recall on head violations in this
sample (complementing the 13% precision from the findings stratum).

**The 7 hard failures** (all tierB r1): tierB-001229 (counterfactual antecedent
polarity inverted — the #40 family), tierB-000164 ("should not" collapsed to a flat
prohibition, dropping the 0.7 deontic weakening), tierB-000592 (existential witness
asserted for a generic copular — "A man in the kitchen is an uncommon sight" parsed as
an actual man in a kitchen), tierB-001369 + tierB-001195 (idioms "on the verge of" /
"the same goes for" decomposed literally), tierB-001066 (distribution-rule member-kind
mismatch, subject never represented), tierB-000684 (Experiencer/Stimulus direction
swapped + comparative asserted as positive). All 111 q1≠yes clean records added to
triage as `review-defect` with embedded verdicts (findings-stratum rows keep theirs;
total review-defect now 170).

## Next

1. **Owner decisions:** (a) the escalation call above (hard 3.1% pass vs any-issue
   48.9% — recommendation: no majority-of-N; route the partial themes to the batch-3
   prompt loop); (b) adjudication of the 170 `review-defect` triage rows (the 9 hard
   failures first).
2. Review-by-provenance (stratum 2) activates automatically when mining (E/H) produces
   candidates citing campaign records.
3. The sweep is otherwise CLOSED: all four strata discharged or armed.

## Owner adjudication of the 20-record partial sample (2026-08-24, joint session)

Stratified deterministic sample (`review_batches/adjudication_sample.json`, verdicts
embedded): **14 genuine / 6 acceptable → 70% of partial verdicts are real defects.**
Reviewer calibration: q1-grading precision on partials = 70%; **fabricated issues = 0**
(every named issue tracked something real — the strictness is over-flagging graceful
improvisation in gap territory, which an adjudicator gate absorbs). The line that
emerged and held across all 20: *improvisation is acceptable when the emitted atoms
stay true and well-typed; defective when anything false, ill-typed, or over-asserted
enters the KB.*

**Projected true defect rate: 3.1% hard + 0.70×45.8% ≈ 35% (±5 at n=20).**
Of the 14 genuine, ~half are the safety class (false/over-asserted content: 000270,
000436, tierC-000234, tierC-000157, 001353, 000452); the rest are form/routing/
consistency errors that hurt mining comparability more than QA truth.

Side products: two corpus-defect-flavored records (000452 greeting-card fragments,
001686 elliptical formula) → filter notes; one owner doctrine question filed:
**expressive speech-act formulas — should an implicit speaker/addressee be minted?**
(current doctrine forbids minting unstated referents, which forced 001686's gaps).

Decision state after calibration: majority-of-N stays rejected (the genuine defects
are dominated by correlated rule-routing/over-assertion patterns that same-model
voting cannot fix); the parse→blind-review→adjudicated-repair pipeline pilot is now
justified on measured reviewer quality; the fix-pack list gains confirmed
high-frequency targets ("X is considered to be P" epistemic frames, restriction-
scoping PPs on kind claims, nominalization of-complements, adjective+PP complements,
control infinitives, degree-modified comparatives).
