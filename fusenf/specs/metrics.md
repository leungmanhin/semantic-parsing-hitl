# FUSE-NF — Metrics (`fusenf-metrics/1`)

P0 deliverable, written **before any mining runs**. The paper defines no evaluation protocol at all,
so these are ours; fixing them in advance is what stops a rule set from being judged by the examples
it happens to look good on.

**Pre-registration.** The thresholds below are fixed now. Changing one later is allowed but must be
recorded in the batch report with the reason and the pre-change number. Every metric is produced by a
script in `fusenf/eval/`, and every report states `n`, the confidence interval, and the
`prompt_sha256` / `canon_version` / `ruleset_sha256` it was computed under.

**The anti-gaming principle**, which shapes M2–M4: *any* metric that only rewards collapsing is
trivially maximized by a rule set that merges everything. Every such metric here is therefore paired
with a control arm that must **not** collapse, and it is the *separation* that is scored.

---

## M1 — Parse stability (baseline, run at end of P1)

**Question.** How much of the variation FUSE-NF sees is the parser being non-deterministic, rather
than English being varied? Everything else is uninterpretable without this number.

**Sample — start small, expand on a trigger.** Begin with **20 sentences × 3 parses = 60 parses**,
stratified across construct families (categorical, events+roles, tense/aspect, modality/deontic,
quantification/scope, cardinality, comparatives, measures, time, coordination/plurals,
disjunction/XOR, coreference, connectives, focus, attitudes) — not a random draw, since a random
draw over-samples the easy zone. Same prompt hash, fresh agent per parse, no shared context.

**Expand to 60 × 5 only if the small run is ambiguous** — i.e. `pairwise_agreement` lands in
`[0.70, 0.90]`, where the sample is too small to separate "stable enough to parse once" from "needs
majority-of-3", or if any single construct family shows disagreement on a sample too thin to read.
A clear result at 20 × 3 (well above 0.90 or well below 0.70) needs no more data, and 300 parses is
roughly 50 agent spawns to spend before learning anything.

**Statistics** (all on canonical output, `canonicalization.md` §4.7):

| Statistic | Definition |
|---|---|
| `pairwise_agreement` | mean over all 10 run-pairs per item of `[graph_id equal]`, averaged over items — **the headline** |
| `unanimity` | fraction of items where all 5 runs share one `graph_id` |
| `modal_share` | mean over items of (largest identical-hash class ÷ 5) |
| `soft_jaccard_mismatch` | mean soft-Jaccard (`canonicalization.md` §6) over disagreeing pairs only |
| `shape_agreement` | same as `pairwise_agreement` but on `shape_id` — agreement modulo truth values |

**Variance attribution.** Every disagreeing pair is classified into exactly one bucket, because the
remedy differs per bucket:

| Bucket | Meaning | Remedy |
|---|---|---|
| `tv-only` | identical `shape_id`, different `graph_id` | tolerable; bucketing already absorbs most |
| `role-choice` | same structure, different role label (e.g. Theme vs Patient) | prompt loop (#23 territory) |
| `decomposition-depth` | one run decomposed a compound the other kept whole | prompt loop |
| `optional-atom` | one run emitted an atom the other omitted (surface-record, status) | prompt loop |
| `genuine-ambiguity` | the readings genuinely differ (attachment, scope) | out of scope — #48 |
| `canonicalizer` | differs only in skolem naming or atom order | **canonicalizer bug**, must be zero |

`canonicalizer` must be **0**. Any nonzero count blocks P2.

**Decision rules** (not pass/fail — M1 is a measurement that sets policy):

- `pairwise_agreement ≥ 0.80` → parse corpora once per item.
- `0.60 ≤ pairwise_agreement < 0.80` → **majority-of-3** parsing for all corpus records; the modal
  canonical form becomes the record, minority runs retained.
- `< 0.60` → stop and fix the prompt before P2 scales; a corpus built on that much noise cannot
  support a 25% convergence claim.
- Any construct family below `0.50` goes to the triage/prompt loop before P2, regardless of the
  global figure.

---

## M2 — Paraphrase convergence vs control separation (**headline**, P4)

**Question.** Does consolidation bring genuine paraphrases together *without* also bringing
non-paraphrases together?

**Sample.** Tier C: ~300–500 positive pairs, ~200 non-paraphrase controls (PAWS-style negatives are
ideal — high lexical overlap, different meaning). Both sides parsed independently, same prompt hash.

**Measure.** `d = 1 − soft_jaccard(A, B)` on canonical graphs, computed identically before and after
applying the consolidation rule set. Reported under both the `graph_id` and `content_id` projections.

**Reported.**

| | before | after |
|---|---|---|
| `d_pos` mean (95% bootstrap CI, 1000 resamples over pairs) | | |
| `d_neg` mean (95% CI) | | |
| `separation = d_neg − d_pos` | | |
| `AUC` of the rule "`d < θ` ⇒ paraphrase" | | |
| exact-hash-match rate on positives | | |

Paired **Wilcoxon signed-rank** on the same pairs before vs after, reported for the positive and the
control arm separately.

**Success criteria** (pre-registered, all three required):

1. `d_pos` relative reduction **≥ 25%**;
2. `d_neg` relative reduction **≤ 10%** (controls must largely stay apart);
3. `AUC` **does not decrease**.

Criterion 3 is the anti-gaming clause. A rule set that merges indiscriminately lowers `d_pos` and
`d_neg` together and leaves AUC flat or worse; only genuine equivalences move `d_pos` while sparing
`d_neg`. If (1) is met but (2) or (3) fails, the rule set is over-merging — route the offending rules
to bridging or reject them, and re-run.

---

## M3 — Compression (P4)

**Question.** Does the rule set pay for itself?

| Statistic | Definition |
|---|---|
| `atoms` | total atom count over the corpus, before / after |
| `distinct_stars` | distinct canonical star forms, before / after |
| `distinct_heads` | distinct open-class heads (closed-class is fixed by construction), before / after |
| `mdl` | `size(rules) + size(consolidated corpus)` vs `size(original corpus)` |

`size(corpus)` = total atoms; `size(rule)` = `|LHS atoms| + |RHS atoms| + 1`. This is the most
ENF-spirited criterion available to us and the one hardest to game: a rule that fires twice does
not pay for itself.

**Success criterion — per species, not global (amended 2026-08-19, owner decision; supersedes the
original "net MDL gain > 0" global gate).** FUSE-NF's goal is normalization — semantically
equivalent things represented identically — and KB size is a consequence for one rule species,
not the goal. Per PLAN §1's two species:

- **Equivalence rules** (lexical/structural collapses): M3 is **reported, never gated**. A symbol
  rewrite preserves atom counts, so this species measures ≈0 *by construction* — a zero is the
  signature of a normalization rule doing its job, and a net negative at scale is rule-storage
  bookkeeping, not failure. This species' success criteria are M2 (convergence), M4 (truth) and
  M5 (losslessness). Batch-1 evidence: round 1 posted MDL −39 while the same 13 rules moved Tier A
  convergence 18.9%→43.3% — the "fail" framing was the metric's, not the rules'.
- **Packing rules** (meta-node packs): **strict marginal MDL > 0 stays a hard per-candidate
  selection gate** — for this species compression *is* the claim. Strict accounting (formula
  pinned in `harness/gauntlet2.py`): rule cost `|LHS| + |RHS| + 1` **plus 2 per expansion
  bridge** — the decompressor is part of the theory, so it is part of the bill. The rule-cost
  term is the Occam regularizer, not bookkeeping: without it any pack that fires once looks
  positive, and the selector would memorize the corpus one bespoke pack at a time. Batch-1
  evidence: round-2 packs 6,372→4,894 atoms, strict +1,329, one candidate pack rejected purely
  for not paying for itself.

Reported alongside, not as a success criterion: mean atoms per record before/after (a sanity check
that consolidation is not simply deleting content — cross-checked by M5).

---

## M4 — Rule quality against Tier-A ground truth (P3 gate, per method)

**Question.** Does each mining method actually find meaning-preserving equivalences? Scored
**per method** before its candidates are allowed into P4, so a weak method is caught before it
contaminates the pool.

Tier A supplies labelled equivalence classes and deliberate near-miss negatives (antonym swap, added
negation, modality shift, participant swap, quantity change, near-miss manner verbs).

**Rule-level.**

- `precision` = fraction of proposed rules judged meaning-preserving (Tier-A labels where they
  apply; LLM-judge + orchestrator review otherwise).
- `recall` = fraction of Tier-A category-(ii) variant relations (the true mining targets — synonyms,
  phrasal↔simple, light-verb, idiom, nominalization, degree wording) for which some rule was proposed.
  Category (i) is excluded: those are supposed to parse identically already, so they measure the
  prompt, not the miner — they are reported separately as a prompt-normalization check.

**Pair-level.** After applying the method's rules: same-class Tier-A items converging (recall-like)
vs negative-control pairs converging (precision-like).

**Criteria.**

- Wave-1 target: **rule-level precision ≥ 0.9**, recall reported at whatever level is achieved.
- **Hard gate: zero negative-control merges.** A rule that collapses any polarity-negative pair into
  its seed may not be routed to consolidation under any confidence — it is demoted to bridging or
  rejected. One such merge is worse than fifty missed rules: consolidation is destructive and applied
  before anything downstream sees the data.

---

## M5 — Chainer QA preservation (P4)

**Question.** Can the consolidated form still answer the questions the faithful form answers?

Batch 1 does not parse questions, so queries come from the existing e2e harness: pick **40**
consolidated records whose construct family has an e2e case, instantiate that case's query pattern
against the record's symbols, and run it against a fresh PeTTaChainer KB (seeded rules + mined
bridging rules loaded) for the faithful form and the consolidated form.

| Statistic | Definition | Criterion |
|---|---|---|
| `preservation` | queries answered by consolidated ÷ answered by faithful | **1.0** — hard gate |
| `fabrication` | queries answered by consolidated but **not** by faithful | **0**, unless attributable to a bridging rule, which is then named |
| `frozen_violations` | rewrites touching `frozen: true` vocabulary | **0** |

A `preservation` shortfall is not a metric failure to be tuned away — it is a routing bug (a rule
rewrote frozen vocabulary) or a genuine information loss (the rule is lossy and belongs in bridging).
`fabrication` matters as much: consolidation must not invent answers, and a bridging rule that
supplies one must be identified by name, since that is inference, not normalization.

Run with `/home/manhin/Dev/.venv-dev/bin/python`, `timeout_sec=0` on every query.

---

## Reporting

Each phase checkpoint emits a short markdown report in `fusenf/eval/`
(`m1_stability.md`, `m2_convergence.md`, …) containing: the numbers with `n` and CIs, the version
hashes, the decision-rule outcome, and — for M1 and M4 — the per-family / per-method breakdown that
feeds the prompt-improvement loop. Negative results are reported as-is; a metric that comes out
badly is a finding about the pipeline, and burying it would defeat the point of fixing the
thresholds in advance.
