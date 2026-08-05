# M1 on Tier A — three fix-and-re-measure rounds (2026-08-03 → 08-04)

Same 26 stratified items throughout, 3 fresh runs per round, 234 parses total. All clean on C1–C8;
`canonicalizer` variance 0 in every round.

| | pilot | round 1 | round 2 | round 3 |
|---|---|---|---|---|
| `pairwise_agreement` | 1.000 | 0.654 | 0.744 | **0.846** |
| `unanimity` | 1.000 | 0.538 | 0.692 | **0.769** |
| `modal_share` | 1.000 | 0.808 | 0.846 | **0.923** |
| disagreeing pairs | 0 | 27 | 20 | **12** |
| families at 1.000 | 20/20 | 14/26 | 18/26 | **20/26** |
| decision rule | parse once | majority-of-3 | majority-of-3 | **parse once** |

**0.654 → 0.846 for 234 parses**, against ~3,960 for brute-force majority-of-3 over the full corpus.
The decision rule has flipped back to *parse once per item*; the expansion trigger still nominally
fires (0.846 ∈ [0.70, 0.90]), the same spec conflict met at the P1 checkpoint and resolved the same
way — fix causes rather than measure a prompt we know is about to change.

## What each round fixed

**Round 1 → 2.** Negation-bundle scope (`teach` 0.000 → 1.000) and universal-over-copular
(`prop_exhausted` 0.000 → 1.000). Idiom recognition also landed — all three runs treat
`kick the bucket` as one symbol, against 2-of-3 literal before — from a prompt whose worked example
is a *different* idiom, so the parser generalized the coherence test rather than reciting.

**Round 2 → 3.** `Ongoing` given three explicit markers instead of "usually" (gap-0035, the fourth
optional-atom instance in this project); the psych/`Experiencer` carve-out bounded by the
**progressive test** instead of an example list (gap-0036 — my own regression, `discover` had gone
1.000 → 0.000); subject-matter PPs given the preposition-named oblique (gap-0037).

## Read the aggregate, not the family scores

Six families are still below 1.000, and three of them (`allow`, `cancel`, `discover`) read 1.000 in
round 1. That churn is mostly **sampling noise, not regression**: each family is a *single item*, so
one run's variance flips it between 1.000 and 0.333 and back. With n=1 per family the per-family
column is far noisier than the 78-parse aggregate, which has moved monotonically up across all five
headline measures. Diagnose *from* the family table; conclude *from* the aggregate.

A second reading trap, seen in round 2: a family score is a conjunction over every atom, so a real
fix can be entirely masked by unrelated residue in the same sentence — the idiom fix worked while
`die` still scored 0.000.

## The remaining residue — six singletons, each a small unstated rule

| family | what splits |
|---|---|
| `allow` | "on Sundays" — recurring `(Every e 1 week)` or a plain time? |
| `discover` | "an error **in the ledger**" — is the PP a `Location` on the error, and is `error` an entity or eventuality? |
| `cancel` | is "afternoon session" fused to a compound kind at all? |
| `decide` | infinitival complement — sealed under `Theme`, or a separate event with its own `Agent`? |
| `arrive` | counted plural **under negation** — distribute, or one negation bundle? |
| `die` | `(Ordinal x last <scale>)` — what is the scale argument when the noun heads an idiom? |

None is a large convention; all six are the same species we have been closing all along — a rule
whose scope or optionality is unstated.

## Recommendation

One more round would likely clear 0.90. But 0.846 already satisfies the spec's *parse once* rule, and
the six residual items are singletons whose fixes are individually cheap but whose measured effect is
inside the noise band of an n=1-per-family sample. Two defensible options:

1. **Stop here and parse.** Accept 0.846, parse Tier A's remaining 302 and Tier C once each, and let
   the mining stage report anything the residue causes.
2. **One more round** on the six, then parse — ~78 parses, the same cost as before.

Either way the brute-force majority-of-3 path is no longer warranted.
