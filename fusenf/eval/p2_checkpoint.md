# P2 checkpoint — corpora (2026-07-29)

| tier | records | grouping | words (min/med/max) | source |
|---|---|---|---|---|
| **A** synthetic controlled | 402 | 84 seeds | 4 / 7 / 11 | hand-authored design table, blind-agent realization |
| **B** natural | 100 | — | 5 / 7 / 15 | Tatoeba (CC-BY 2.0 FR), per-sentence attribution kept |
| **C** paraphrase pairs | 1000 | 500 pairs | 6 / 13 / 15 | PAWS-Wiki `labeled_final` |
| **total** | **1502** | | | |

Files: `corpora/tierA.jsonl`, `tierB.jsonl`, `tierC.jsonl`, plus the deterministic builders
(`build_tierA.py`, `build_tierB.py`, `build_tierC.py`) and the design table `tierA_design.md`.
All three builders are reproducible without a seed — selection is by sha256 order, never an RNG.

## Tier A — support, not coverage

31 target rules, **each with 3–4 independent seeds**; 84 base / 104 mining / 46 normalize /
168 control. The plan sketched ~50 seeds; the extra buys the support floor. Organizing the corpus
phenomenon-first would have given one instance per rule, and a rule seen once clears no mining
threshold — M4 recall would be capped near zero and we would be measuring the corpus, not the miner.

Mechanically verified: 0 duplicates, 0 leaks against `prompt.txt` / goldens / pilot, 0 label
inconsistencies, and **all 104 mining variants contain the lexical item their rule names**.

### The category-(i) probe — the reason to check before generating

`normalize` variants assert that our *prompt* already collapses an alternation, so their ground truth
is a claim about us, not about English. 12 pairs were parsed and compared before the corpus was
built: **12/12 identical canonical `graph_id`** (6 active↔*by*-passive, 6 dative). The claim holds,
and the 46 normalize records rest on measurement rather than assumption.

The same check retired two alternations the plan had listed: **cleft↔plain** differs by the
`(Cleft filler event)` atom *by design*, and **agentless passive↔active** differs by an `Agent` plus
an indefinite witness. Neither is a normalization failure; both moved to Tier C territory.

### Three defects found in review — two of them mine

Mechanical checks passed on the first build. The sample review did not:

1. **Family bundling** (design bug). A family carrying two adjective rules asks each seed for a
   variant its own base cannot support: glossed "the repair is difficult", it produced *"The repair
   is very tired."* Every adjective pair now has its own family whose gloss instantiates it.
2. **`antonym` on `teach`** (design bug). There is no lexical antonym, so the realizer coined
   *"A potter unteaches an apprentice glazing."* Control kind removed from that family.
3. **`participant-swap` on `work_with`** (design bug, and the one that mattered). **`work with` is
   symmetric** — "Bo works with Ana" *is* "Ana works with Bo". Four records were labelled
   `polarity: different` while meaning the same thing, which would have scored a **correct**
   consolidation as a false positive. A control that corrupts the metric against the miner is worse
   than a missing control, because it is invisible in the aggregate.

25 seeds were re-realized; the rebuilt corpus passes both the mechanical suite and the review.

**Lesson for the remaining tiers:** the mechanical checks verify *form* — labels, duplicates, leaks,
lexical presence. All three defects were **semantic**, and all three came from my table rather than
the realizer. Generated corpora need a read, not just a validator.

## Tier B — the artifact worth catching

Filtered 2,032,338 Tatoeba lines to 366,991 acceptable (18%), then took 100 in hash order.

The first draw put **`Tom` in 27 of 100 sentences and a stock name in 45** — Tatoeba is dominated by
a few contributors' recurring characters. That lands precisely where it does most damage:
role-filler clustering (§4.3.2) keys on event-conditioned slot fillers, so one symbol owning a
quarter of the `Agent` slots makes the filler distribution a fact about Tatoeba's authorship rather
than about meaning. A per-name cap (≤3) fixed it: **74 distinct proper nouns across 100 sentences**,
still fully deterministic (greedy over the fixed hash order).

## Tier C — good controls, structural positives

500 pairs (300 paraphrase / 200 control) from 2,230 eligible positives and 2,852 eligible negatives.

- **The controls are the strong part.** PAWS negatives are word-scrambles that change who did what to
  whom while keeping the token bag nearly identical — exactly the discrimination M2 must demonstrate.
- **The positives are mostly structural**: reordering, of-phrase vs compound, light verb swaps. 431
  of 500 pairs carry some lexical variation, but not the synonym variation our consolidation rules
  target. That is Tier A's job by construction, and the division is worth stating in the M2 write-up
  so Tier C is not read as evidence about lexical rule discovery.
- Dropped pairs whose two sides are identical modulo punctuation — a "paraphrase" at distance 0
  flatters M2's positive arm for free.
- **Plan URL is stale**: `storage.googleapis.com/paws/...` now returns `AccessDenied`; the
  HuggingFace mirror of the same release was used.

83 of the 1000 records repeat a sentence that appears in another pair (PAWS reuses sentences across
pairs) — 917 distinct sentences. Harmless for the metric, and a **parse-time dedup opportunity**:
parse each distinct sentence once and reuse its canonical graph.

## Parse budget — a decision for P3

1,502 records is the full corpus; with dedup, **1,419 distinct sentences to parse**. At one parse per
item — which M1 = 1.000 justifies — that is roughly 285 agent batches, far larger than anything run
so far (the largest to date was 60 parses).

Recommended staging rather than one sweep:

1. **Tier A + B (502 records)** → P3 Wave-1 mining and M4. This is the whole ground-truth arm and
   most of the discovery signal.
2. **Tier C (917 distinct)** → parsed when M2 is run, since it feeds only the convergence metric.

That also keeps the triage loop viable: at the pilot's rate (~1 coverage gap per item on unseen
natural text) Tier B alone could surface a substantial queue, and gaps found there should be fixed
before 900 more records are parsed against the same prompt.

## State

Prompt 2,090 lines, goldens 326, e2e 327/327, `fusenf-canon/2`, 26 triage gaps (23 fixed, 3 open).
Raw corpus dumps were downloaded read-only into the session scratchpad and are **not** in the repo;
the builders regenerate the corpora from them.
