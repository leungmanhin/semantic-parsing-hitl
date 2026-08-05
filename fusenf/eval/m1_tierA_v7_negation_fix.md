# M1 after the negation-denial fix (v7) — 2026-08-04

Prompt sha `68d2695309ea` (2,200 lines). 29 items × 3 runs = 87 parses, all clean on C1–C8,
`canonicalizer` variance 0. e2e 329/329, goldens 346.

## Headline

| | round 3 (3 runs) | pooled (6 runs) | **v7 (3 runs)** |
|---|---|---|---|
| `pairwise_agreement`, same 26 items | 0.845 | 0.857 | **0.923** |
| items stable at 1.000 | 20/26 | 18/26 | **23/26** |
| `unanimity` (29 items) | — | — | **0.897** |
| `modal_share` (29 items) | — | — | **0.966** |
| all 29 items `pairwise` | — | — | **0.931** |
| expansion trigger | TRIGGERED | TRIGGERED | **not triggered** |

First measurement where the expansion trigger does not fire.

## The class is closed — and the out-of-sample test is the evidence

| item | | before | after |
|---|---|---|---|
| `tierA-000294` `teach` | target | 0.67 | **1.00** |
| `tierA-000383` `entity` | target | 0.67 | **1.00** |
| `tierA-000248` `arrive` | target | 0.67 | **1.00** |
| `tierA-000379` "A physician does not sign the chart." | **fresh** | — | **1.00** |
| `tierA-000402` "An automobile does not cross the bridge." | **fresh** | — | **1.00** |
| `tierA-000366` "The night crew is not exhausted." | **fresh** | — | **1.00** |

The three targets going stable proves little on its own — re-measuring the items that motivated a fix
shows improvement through regression to the mean. **The three fresh controls are the real result**:
drawn by sha256 order from the 52 negation controls *not* in the M1 sample, never inspected while
drafting the rule, all unanimous on the first try. The third also probes two carve-outs at once
(copular negation, singular-collective non-distribution) and neither broke.

## No collateral damage — but only tracing the atoms proves it

Two families read 1.00 in the 6-run pool and 0.33 here, which looks like damage from the edit. It is
not. Tracing the divergent atom across all nine runs of the current prompt family:

- `buy` — `(Ordinal sk_kiln_1 2 sell)` in **8 of 9** runs; run 16 alone wrote `… 2 kiln`
- `destroy` — **8 of 9** runs emit no `footbridge` genus; run 15 alone emitted it

Each is a **single outlier in nine runs**, on an atom the edit never mentions (`Ordinal`'s scale
argument; compound-genus decomposition). The pooled 6/6 was luck, not stability — at a ~1-in-9 rate,
six clean runs is unremarkable. **At 3 runs one outlier drags a family from 1.00 to 0.33**, which is
the same n=1 artifact this project keeps re-learning; the aggregate is what moved.

## A diagnosis I had wrong

`allow` ("A warden permits visitors on Sundays") also went to 1.00, and the round-3 report blamed its
instability on *"'on Sundays' — recurring or a plain time?"*. Tracing the runs shows the dominant
split was **witness vs `Implication`** — runs 12 and 14 read "A warden" as a kind — i.e. the *same*
indefinite-singular-as-generic ambiguity this fix decides. The recurrence question was the minor
component and is now consistent across 15/16/17. **The class was one item larger than I scoped it.**

`die` also reads 1.00, but its pooled score was 0.40 and the idiom was already recognized in all nine
runs, so 3-of-3 here may be luck rather than a fix. Not claimed.

## What remains

`decide` (0.33) — the infinitival complement: sealed under `Theme`, or a separate event with its own
`Agent`? A **singleton**, not a class (26 `participant-swap` controls, and only this one is unstable).
Per the stopping rule agreed in advance, no new 3-of-3 class appeared, so this does **not** buy
another round.

## Decision

**Parse the corpus.** 0.931 satisfies *parse once*, the expansion trigger is clear, and the one
remaining unstable item is a singleton whose fix would be measured inside the noise band of an
n=1-per-family sample. Remaining: 302 Tier A + 917 distinct Tier C, batched at 6 items per agent.
