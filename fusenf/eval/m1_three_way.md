# M1 — three-way comparison (2026-07-29)

Same 20 stratified items, 3 independent blind parses per version, 180 parses total.
**All 180 clean on C1–C8**, including the chainer smoke test.

| | v1 baseline | v2 after fix-batch 1 | v3 after fix-batch 2 |
|---|---|---|---|
| `pairwise_agreement` | 0.800 | 0.833 | **0.967** |
| `unanimity` (all 3 runs identical) | 0.750 | 0.750 | **0.950** |
| `modal_share` | 0.883 | 0.917 | **0.983** |
| `soft_jaccard_mismatch` | 0.662 | 0.802 | 0.889 |
| disagreeing pairs | 12 | 10 | **2** |
| families at 1.000 | 15/20 | 15/20 | **19/20** |
| `canonicalizer` variance | 0 | 0 | **0** |

**Both decision rules now agree, resolving the ambiguity open since the P1 checkpoint:**
`pairwise 0.967 ≥ 0.80` → **parse corpora once per item**, and the expansion trigger
(`pairwise ∈ [0.70, 0.90]` → expand to 60×5) is **not triggered**. No majority-of-3, no larger
sample. The 240 extra parses that expansion would have cost were avoided by fixing causes instead
of measuring the same broken prompt more precisely.

## Why v2 looked like a wash and wasn't

v2 fixed all five targeted families (attitude and coreference from 0.000; deontic, event-transitive,
quant-scope from 0.333 — all to 1.000) while five *other* families regressed to 0.333. The headline
moved +0.033 and hid both facts.

Every one of those five regressions was a **single optional atom** in uncovered territory, and v3
confirms the diagnosis was right: fixing the four gaps behind them
(gap-0002 `east_wing` exposure, gap-0006 `replacement_burner` fusion, gap-0020 modal tense,
gap-0021 nominal-event tense) returned **all five to 1.000**, with nothing else regressing.

## The root cause worth generalising

gap-0002 and gap-0006 came from one word: the compound rule said *"you **may** also expose it."*
**An optional atom is a guaranteed variance source** — two faithful parses legitimately differ, and
the metric correctly registers it as instability. gap-0023 (below) is the same defect in another
form: a rule whose *scope* is unstated behaves exactly like an optional one.

Both were invisible to review and only showed up under repeated measurement. That is the argument
for M1 existing at all: it detects underspecification that reading the prompt does not.

## The one remaining instability

`event-ditrans` (0.333) — *"Renata handed the surveyor a clipboard."* One run emitted
`(Inheritance surveyor (can survey))`, decomposing the agent-nominalization; two did not. The rule
states the capability exposure unconditionally, but **both its worked examples have the
nominalization as the predicate** ("Penguins are swimmers"), leaving its scope for an incidental
referent undetermined. Recorded as **gap-0023**; it is the sole disagreement left, worth 2 pairs.

## Status

- 23 triage gaps: **18 fixed, 5 open** (4 with no measured cost, plus gap-0023).
- Prompt: 2,059 lines. Goldens 320, e2e 325/325.
- Method note: a pilot sentence leaked into the prompt as a worked example for the **second** time
  during this batch (the culvert/grate over-generation example *is* pilot item 17), caught by the
  leak check before runs 7–9 launched. The check now runs after every prompt edit, not only before
  a measurement.
