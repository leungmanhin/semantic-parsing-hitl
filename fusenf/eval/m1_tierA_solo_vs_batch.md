# Solo vs batch parsing — does one sentence per agent parse more stably? (2026-08-04)

**Hypothesis (owner).** Giving each agent a single sentence, instead of six, should raise parse
stability: the agent's whole attention is on one item, with no cross-item interference.

**Answer: no.** The effect is null. Batch parsing stays.

## Design

The two arms differ in **exactly one variable**. Same 26 stratified Tier A items, same 3 runs per
item, same blind-Sonnet parser, and — critically — the **same prompt**, sha `d8f5caff0d`, verified
from the `parser.prompt_sha256` field of both parse files. The only difference is items-per-agent:
6 (round 3, runs 9–11) versus 1 (solo, runs 12–14).

78 parses per arm. Both arms clean on C1–C8, `canonicalizer` variance 0.

## Result

| | round 3 (6/agent) | **solo (1/agent)** |
|---|---|---|
| `pairwise_agreement` | 0.846 | **0.859** |
| `unanimity` | 0.769 | **0.808** |
| `modal_share` | 0.923 | **0.923** |
| disagreeing pairs (of 78) | 12 | **11** |
| families at 1.000 | 20/26 | **21/26** |

The headline moved by **one disagreeing pair out of 78**.

## The paired test is exactly null

Aggregate deltas invite over-reading, so the right test is per-item and paired — same items, same
prompt, so each item is its own control:

| | count | families |
|---|---|---|
| unchanged | 20 | — |
| **better** under solo | 3 | `discover` 0.33→1.00, `cancel` 0.33→1.00, `arrive` 0.33→1.00 |
| **worse** under solo | 3 | `teach` 1.00→0.33, `entity` 1.00→0.33, `decide` 0.33→0.00 |

McNemar exact on the 6 discordant items: **two-sided p = 1.000**. Three up, three down.

This is the churn pattern already documented in `m1_tierA_rounds.md`: each family is a **single
item**, so one run's variance flips it between 1.000 and 0.333. The +0.013 aggregate is that churn
failing to cancel exactly, not a signal. Had the three coin-flips landed the other way the solo arm
would have read *0.833* and the same hypothesis would have looked refuted rather than supported.

## What this rules out — and what it doesn't

**Ruled out:** the large effect the hypothesis predicted. If solo parsing removed even half the
disagreements we would expect ~6 rather than 11, which this sample would detect easily.

**Not ruled out:** a small effect of a few points. With 26 items × 3 runs the confidence interval on
a 12-vs-11 difference is far too wide to exclude one. That limit doesn't change the decision, for the
cost reason below.

## Cost

Each solo agent reads the full 2,161-line `prompt.txt` for one sentence: **~108k tokens per
sentence** measured over run 13's 26 agents (2.80M total). Batching 6 items amortizes that read
across 6 sentences.

Parsing what remains (302 Tier A + 917 Tier C = 1,219 sentences) solo would cost **~131M tokens**,
against roughly a sixth of that batched — to buy an effect measured at zero.

## Decision

**Keep batch parsing at 6 items per agent.** Parse the remaining Tier A and Tier C once each, per
the M1 *parse once* rule that both arms satisfy.

The residual instability is not an artifact of how work is packaged into agents. It is the six
singleton convention gaps listed in `m1_tierA_rounds.md` — and the three that flipped *down* here
(`teach`, `entity`, `decide`) are the same species: rules whose scope or optionality is unstated.
Closing those is the only lever that has actually moved this number (0.654 → 0.846 across three
rounds).

## Method note

Run 14 was interrupted mid-flight by a session limit. Five agents reported an API failure — and all
five had **already written complete, paren-balanced output** before dying. The files were kept and
only the 13 genuinely missing items were re-dispatched. Verifying against disk rather than trusting
agent status reports is what kept the arm at exactly 3 samples per item; re-running the 5 would have
overwritten good parses with second samples, which is precisely what corrupted the run-12 count
earlier. The rule cuts both ways: a completion message is not proof of a write, and a failure
message is not proof of its absence.
