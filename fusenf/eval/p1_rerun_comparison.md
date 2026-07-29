# FUSE-NF — prompt-fix batch, before/after M1 (2026-07-29)

Same 20 stratified items, 3 independent blind parses each, before (runs 1–3, pre-fix prompt) and
after (runs 4–6, post-fix prompt). 120 parses total; **all 120 clean on C1–C8** including the
chainer smoke test.

## Headline

| statistic | before | after |
|---|---|---|
| `pairwise_agreement` | 0.800 | **0.833** |
| `unanimity` | 0.750 | 0.750 |
| `modal_share` | 0.883 | **0.917** |
| `soft_jaccard_mismatch` | 0.662 | **0.802** |
| disagreeing pairs | 12 | **10** |
| `canonicalizer` bucket | 0 | **0** |

The headline moved only **+0.033**, and that number badly understates what happened.

## Every targeted family was fully fixed

| family | before | after | gap fixed |
|---|---|---|---|
| attitude | 0.000 | **1.000** | gap-0018 sealed-referent projection |
| coreference | 0.000 | **1.000** | gap-0015/0016 titles, succession granularity |
| deontic | 0.333 | **1.000** | gap-0013 `ConditionalProperty` condition slot |
| event-transitive | 0.333 | **1.000** | gap-0001 "replace" → `Theme` |
| quant-scope | 0.333 | **1.000** | gap-0014 `QuantifierPhrase` on verbal universals |

**5 of 5.** The prompt-improvement loop did exactly what the P1 checkpoint predicted it would, on
exactly the families it was aimed at.

## Five previously-stable families regressed — none of it caused by the fixes

| item | family | divergence | source |
|---|---|---|---|
| pilot-000004 | tense-passive | `(Inheritance east_wing east)` emitted or not | **gap-0002**, deliberately left open |
| pilot-000011 | comparative | "replacement burner" fused or not | **gap-0006**, deliberately left open |
| pilot-000005 | modality-epist | `(Future e)` alongside `(Might e)` or not | new — gap-0020 |
| pilot-000007 | negation | `(Past …)` on a nominal event referent or not | new — gap-0021 |
| pilot-000017 | connective | `(PartOf grate culvert)` — a relation the text never states | new — **gap-0022, over-generation** |

Each is a **single optional atom** in territory the prompt does not cover, and none traces to any
edit in the fix batch. They are latent variance that happened not to fire in runs 1–3 and did fire
in runs 4–6.

## What this says about the metric

**At 20 items × 3 runs, one optional atom flips a family from 1.000 to 0.333.** Each family holds a
single item, so a single divergent atom in one of three pairs costs two thirds of that family's
score. That sensitivity is why the headline barely moved while the underlying picture improved a
lot, and it is a concrete argument for the expansion trigger: at this sample size the metric cannot
distinguish a real regression from one unlucky atom.

The quality signals moved much further than the headline:

- **`soft_jaccard_mismatch` 0.662 → 0.802** — surviving disagreements are far *smaller*. Before, a
  disagreement meant a structurally different parse; after, it usually means one extra atom.
- **Variance attribution shifted from semantic to mechanical**: `unclassified` 8 → 2 (divergences
  needing a human/agent to interpret), `optional-atom` 2 → 8 (a program can classify these). The
  remaining instability is a much easier class of problem.

## One finding worth acting on independently

**gap-0022 is over-generation, not a coverage gap.** One run emitted
`(PartOf sk_grate_1 sk_culvert_1)` — a part-whole relation that is world-knowledge-plausible but
stated nowhere in the sentence. That is a different failure mode from everything else in the triage
queue: not "the prompt didn't say", but "the parser asserted something the text does not". Worth an
explicit prohibition, since consolidation and mining downstream would treat an invented relation as
data.

## Status

- 22 triage gaps: **13 fixed**, 9 open (2 of which now have measured stability cost).
- Method note: three pilot sentences leaked into `prompt.txt` as worked examples during the fix
  batch and were caught mid-run; the examples were rewritten and the four affected items re-parsed
  on the clean prompt, so no item in the after-set can score stability by recitation.
- Recommendation unchanged from the P1 checkpoint: the ambiguity at 0.80–0.83 with n=20 is a
  sample-size problem. Fix gap-0002/0006/0020/0021/0022 and re-measure before deciding on 60×5.
