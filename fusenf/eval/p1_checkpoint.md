# FUSE-NF — P1 checkpoint (2026-07-29)

Harness, validator, canonicalizer built and verified; 20-item micro-pilot parsed 3× and measured.
Nothing advances to P2 without review (`PLAN.md` §9).

## What was built

| component | status | independent validation |
|---|---|---|
| `canonicalize.py` | 67/67 tests | 256 golden bundles / 33,656 canonicalizations — 0 order, α, or idempotence failures; identical digests across `PYTHONHASHSEED` 0/1/12345 |
| `validator.py` + `records.py` + `assemble.py` | 56/56 tests | 1,248 golden assertions — 0 findings |
| `m1_stability.py` | — | mechanical variance attribution verified against a real divergence |

Prompt gained the `BACKGROUND` interpretive-only input channel (blind-validated 11/11 across three
agents) + 3 goldens. Goldens 317 → 320, e2e 325/325.

## Pilot: 60 parses, all mechanically clean

20 stratified items × 3 independent blind Sonnet parses. **All 60 passed C1–C8 with zero findings**,
including the chainer smoke test — every parse loads into a fresh KB without error.

*(The corpus is hand-authored and stratified by construct family, recorded as
`source: "pilot-stratified"`. It is not sampled natural text — that is Tier B at P2. Stratified
coverage matters more than naturalness for a stability baseline, but no later report should read
this as a natural-corpus result.)*

## M1 — parse stability

| statistic | value |
|---|---|
| `pairwise_agreement` | **0.800** |
| `unanimity` (all 3 runs identical) | 0.750 — 15/20 items |
| `modal_share` | 0.883 |
| `shape_agreement` | 0.800 |
| `soft_jaccard_mismatch` | 0.662 over 12 disagreeing pairs |
| **`canonicalizer` variance bucket** | **0** — the blocker check passes |

`canonicalizer = 0` is the load-bearing number: no pair agrees under skolem-wildcarding while
disagreeing on `graph_id`. Canonicalization is not leaking noise into the measurement, so every
disagreement below is real parser variance rather than an artefact of the instrument.

**15 of 20 construct families are perfectly stable** (categorical, ditransitive, passive, epistemic
modality, negation, generic, cardinality, comparative, measure, time, coordination, disjunction,
connective, focus, possession-partitive).

## The finding that matters: every unstable family has an identified cause

| family | pairwise | traced to |
|---|---|---|
| coreference | 0.00 | gap-0015 / gap-0016 — kinship titles; "the following year" (succession rule is day-scoped) |
| attitude | 0.00 | **gap-0018** — sealed-complement typing, a *verified contradiction* |
| event-transitive | 0.33 | gap-0001 — "replace" has no Theme/Patient guidance |
| deontic | 0.33 | gap-0013 — no mechanism to attach "on arrival" to a kind-level norm |
| quant-scope | 0.33 | **gap-0014** — `QuantifierPhrase` on verbal universals, a *verified contradiction* |

**5 of 5.** Not one unstable item is unexplained noise. The gaps were reported by the parser agents
*before* the instability was measured, so the coverage-gap channel is **predictive, not merely
descriptive** — which makes `triage/coverage_gaps.jsonl` (19 entries) a ranked work list rather than
a wish list.

Worked example: on "The technician replaced the cracked bearing", two runs differ in exactly one
atom — `Theme` vs `Patient` on the bearing — with four proof-name differences correctly ignored by
canonicalization, and the mechanical attribution classifying it as `role-choice` without judgment.

## Two things to decide

**1. The decision rules conflict, and that is my spec's fault.** `metrics.md` M1 says
`pairwise ≥ 0.80` → "parse corpora once per item", while the expansion trigger says
`pairwise ∈ [0.70, 0.90]` → expand to 60×5. At exactly 0.800 **both fire**. They were written to
answer different questions (how to build the corpus vs. is the sample big enough to trust), and the
boundary case was never considered.

**Recommendation: neither — fix the five causes and re-measure.** Expanding to 60×5 spends ~240
further parses measuring a prompt we already know is about to change, and all five unstable families
have named, mostly-cheap fixes. Re-running the same 20×3 after the fixes costs 60 parses and tests
the thing we actually care about. Expansion is the right move only if the post-fix number is *still*
ambiguous.

**2. M1 structurally cannot see uniformly-wrong extrapolation.** gap-0004 (the strict-before
boundary rule is worked through only for linearly-ordered `Year`/`Month`; parsers extend it to
*cyclic* weekdays by decrementing) produced **identical** output across runs. Perfect stability,
possibly wrong semantics. Stability measures agreement, not correctness — so the coverage-gap
question must stay a permanent part of the parse loop, not pilot scaffolding.

## Recommended next step

Prompt-fix batch against the 19 triage entries, prioritising the four flagged high — the three
verified contradictions (gap-0014, gap-0018, gap-0019) and the weekday-ordering correctness
question (gap-0004) — then re-run the identical 20×3 pilot and compare. That converts the pilot from
a one-off measurement into a before/after test of the prompt loop itself.
