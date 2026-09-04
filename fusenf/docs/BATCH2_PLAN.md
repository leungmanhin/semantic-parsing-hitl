# FUSE-NF Batch 2 — execution plan (2026-08-21)

Sequenced from `BATCH1_REPORT.md` §6 (owner ordering agreed 2026-08-21). Organizing
principle: **stabilize the instrument before the big measurement** — every
prompt/vocabulary/validation-flow change lands before the Tier B campaign, which is the
batch's centerpiece and runs last on a single instrument version. `PLAN.md` remains the
method document; this file is batch-2 execution only.

    order:  A(#7 audit) -> B(#6 #48) -> [C(#4 Qwen3) in parallel] -> D(#5 owner reviews)
            -> B2(fix-pack, added 2026-08-21) -> AFK parse program -> E(#3 miner upgrade)
            -> F(#8 M5 question arm) -> G(pre-flight checklist) -> H(#1 Tier B campaign:
            mining + measurement over the already-parsed corpus)
    event-triggered at any point:  X(#2 engine-fix response)

**AMENDMENT 2026-09-01 (owner, #50 — CONSOLIDATION-ONLY; re-specs item H and G.5):**
FUSE-NF's deliverable is consolidation rules ONLY, per the source PDF's normal-form
mandate — the bridging species, the gauntlet's §1 demotion tier, the G.5 graded route,
and expansion bridges are RETIRED (batch-1 bridge artifacts stand as historical records;
the bridge exporters are deleted, git history keeps them). Serving target = consolidated
view + query-side normalization: `harness/normalize_query.py` (built at H) re-expresses
every query with the same rules (a full-bundle pack query collapses to the pack atom and
sidesteps the item-X And-prover gap; a partial-bundle query emits a pack ∪ residual
faithful union). Gauntlet routing = consolidation|rejected, frozen-vocabulary conflicts
filed as prompt-side evidence for the fix-pack channel; H's M5 runs the new layout.
Older bridge wording further down this plan is pre-amendment history. Full record:
deferred-topics #50 + `eval/preflight_g.md` §G.5 + `PIPELINE.md`.

**AMENDMENT 2026-09-02 (owner, #50 continued — FUZZY consolidation, paper §3.2):** three
adoptions. **(1)** Losslessness is no longer a gate anywhere: judges record a `loss` category
(`none|manner|degree|sense|other`), rules carry it as an annotation (`fuzzy = loss != none`);
hard gates = zero control merges (M4) + same-truth; M5 `fabrication` counts only fabrications NOT
explained by a declared fuzzy rule; the register-only calibration override is deleted; the
confidence formula is re-based (lossless's 0.10 moved onto same-truth so the 0.9 bar keeps its
evidence meaning). **(2)** The frozen-head gate is retired: normalization is TOTAL (KB + queries
+ a derived normalized view of `seeded_rules.metta`); frozen-head rewrites and role relabels are
judged like any candidate (role cards via `same_relation`) and ALSO filed as
`prompt_side_evidence`; the empirical replacement is the new M5 hard gate
`e2e_under_normalization` (the 372-case e2e suite through the normalizer) — the FIRST thing H
builds after `normalize_query.py`. **(3)** Modifier pruning (paper §4.4) enters as kind
`modifier-prune`: one-sided add/drop alignment patterns (§4.3.4) that `build_candidates.py`
used to discard become deletion candidates (`rhs: []`; the rewriter already deletes matches;
`align_pairs.classify` labels them); the conditional-MI refinement (§4.3.3 read asymmetrically,
P(modifier | frame) ≈ 1) is an H-run miner task. H reports control separation PER fuzzy rule.

**AMENDMENT 2026-09-04 (owner — FAITHFUL-FIRST: two arms for H's mining and for the batch-2
report):** batch 2 reports each §4.3 method **as the source PDF describes it** before anything
of ours is added. Rationale (owner): the additions can only be evaluated against a visible
baseline; a weak faithful result is a finding that motivates an addition, not a failure to
hide; and it keeps the doc's methods separate from our instruments (which are ours to revise).
Batch 1 stands as the exploratory phase and is not re-run.

*Vocabulary.* **Faithful core** = the method's logic as written in §4.3.x. **Implementation
parameters** = choices the doc leaves open that any implementation must make — disclosed,
never counted as additions: embedding model and cluster threshold, clustering algorithm,
minimum support, MI cut-offs, SVD rank, alignment / matching algorithm, paraphrase-pair
source. **Additions** = anything that changes a method's logic or filters its input:
constant-lifting shape stratum and nisurp ranking (§4.3.1); count-based and PPMI-weighted
slot comparison, lemma-equivalence corroboration, name zeroing, D.3 routing, the flip
discriminator (§4.3.2); the Qwen3 prior and conditional MI (§4.3.3 / §4.3.5); factoring,
promotability and control-based pruning (§4.3.4). **Evaluation harness** = ours, shared by
both arms and stated as such: the Tier A answer key and negative controls, `JUDGE.md` panels,
gauntlet routing and confidence, M1–M5, the coverage dashboard, query-side normalization.

*Per method (faithful core → additions).* §4.3.1 frequent subtrees at a minimum support →
meta-node proposals | shape stratum, nisurp, cross / kind-level modes. §4.3.2 embed fillers,
cluster, slots with indistinguishable distributions merge (role level and per class, raw
cluster distributions, names included) | PPMI, lemma corroboration (annotation only), name
zeroing, D.3, flip discriminator, oblique heads, cross-both bucket. §4.3.3 pairwise MI over
the binary subtree × sentence matrix, high-MI moderate-support pairs → one feature |
conditional MI. §4.3.4 align paraphrase-pair graphs, record consistently mapping subtrees /
roles | factoring, promotability, controls as pruning. §4.3.5 autoencoder over feature
vectors, interchangeability from tied encoder weights (linear = truncated SVD) | Qwen3 prior.
§4.4 rewrites (slot merge, modifier prune, subtree collapse, role rename, iteration) are the
consolidation kinds the rewriter and `normalize_query.py` implement — a serving stage, not a
mining arm.

*Mechanics.* Every signal and candidate from H onward carries `variant: faithful | augmented`
and, when augmented, `additions: [...]`; `build_candidates.py` propagates it, the gauntlet and
`combine_rules.py` report both arms, the metric tables carry faithful / augmented columns with
the delta. Each method gets one report in `mining/out_h/` with a **faithful** section first and
an **additions (deltas)** section second; `H_MANIFEST.json` records both variants' parameters.
Order: §4.3.1 faithful view from the existing run → §4.3.2 faithful report from the
2026-09-03 embedding runs, then its additions → §4.3.3 + §4.3.5 faithful (prior off) → their
additions → §4.3.4 faithful → its additions → candidates (both arms) → shared gauntlet →
rewrites + `normalize_query.py` → M1–M5 (both arms) → `BATCH2_REPORT.md`.

*Report skeleton (`BATCH2_REPORT.md`).* Part 1 — faithful FUSE-NF: per method the doc's
description, our parameters, outputs, validated rules, metrics. Part 2 — additions: each with
what / why and its measured delta on the same substrate and key. Part 3 — beyond §4.3: the
drafted extras (NLI directional entailment, back-translation pivot, active learning on
inter-method disagreement). Part 4 — negative results and the batch-3 agenda. The three
§4.3.2 decisions that were pending on 2026-09-04 (name zeroing, weighting split, dial range)
become Part 2 ablations.

**Amendment 2026-08-21 (owner decision, supersedes "B is the LAST prompt.txt change"):**
a targeted **fix-pack B2** lands before any campaign parsing — [G] NEW Perception-reports
section (veridical complement asserted + Stimulus link; the probe48 coverage gap) + three
emphasis-only fixes for the audit's top recurring error themes (scheduled-occurrence
Patient x9, futurate-without-anchor x8, antecedent-less pronoun typing x8); goldens/e2e/
blind-batch/re-pin per the item-B pattern; THE post-fix-pack hash is final. Then the
**AFK parse program** front-loads H's parsing: Tier B superset to **2,000** (RELAXED
filters: digits allowed, <=2 commas; still no-pronouns/declarative; build_tierB --extend
carries the pilot 100 verbatim; fresh dump sha+date recorded) + the D.4 Tier C 360
re-parse — ~452 blind Sonnet agents in 8-groups, mechanical assemble+validate per tranche
(NO review agents until the owner returns). The run-30 audit-queue wave is NOT redone at
the final hash (its defect-verification purpose is served; H's Tier C re-parse covers its
Tier C members).

**B2 DONE 2026-08-22 — FINAL HASH `f6448eac9f88…`** (report `eval/fixpack.md`): perception
section + 3 emphasis fixes + glossary/marker wires; no-recital clean; goldens 368; e2e
**338/338**; blind batch **7/7** at the final hash (first dispatch discarded — it raced two
glossary wires; freeze-prompt-before-dispatch rule affirmed); vocabulary re-pinned
(`f6448eac9f88…`/`b7e25b963478…`, no vocab changes).

**AFK PARSE PROGRAM DONE 2026-08-23** (report `eval/afk_campaign.md`): 2,360 sentences
across 472 batches, ALL at the final hash — Tier B new 1,900 @run 1 (1,830 clean/70
report-only), pilot 100 @run 2 (97/3), Tier C in-sample 360 @run 40 (340/20; D.4
executed); full-corpus verification passed (2,000/2,000 tierB ids final-hash-pinned,
tierC r40 360/360, zero duplicate (id,run)); 2 session-limit incidents + 1 blind-protocol
breach (pb-tb374) all recovered by disk-diff/re-run with zero loss; 564/600 agents used.
H's parsing is banked — E (miner) picks up from here after owner reviews.

Standing constraints carried forward, unchanged: deterministic-first; every agent role
runs under its `DISPATCH.md`-inventoried brief (zero pending); parse ops = 5-item
load-balanced batches, ~8-agent sub-groups, disk-diff recovery; owner commits everything;
append to `PAPER_NOTES.md` at decision time.

## A — Retroactive provenance audit (#7)

- **Scope**: collect the distinct record ids cited in `provenance.examples` across
  `rules/validated{,2,3}.jsonl` (~100–200 ids; pack + role-bridge evidence is the half
  that matters); Opus reviews per `REVIEW.md` in 5-item batches; verdicts →
  triage dispositions; recompute support for any rule citing a failed record
  (below-threshold → suspended, ledger entry).
- **Also serves as**: the shakedown cruise of the standing reviewer machinery
  (first real exercise of REVIEW.md, the verdict schema, the triage join).
- **Exit**: every cited record has a verdict file in `review/`; `ledger_view.py`
  regenerated; report `eval/provenance_audit.md`; any suspended rules named.

## B — #48 adoption on representation grounds (#6)

- **Scope**: the representation half only (engine marginalization stays feature-req-gated):
  `prompt.txt` typed-trigger section per the pilot contract (`pilot48/ADDENDUM.md` —
  `Interpretation` wrapper as transport syntax); goldens + e2e additions (no-recital rule
  checked both ways); canonicalizer split-before-canonicalize + reading-set identity
  (sha256 over sorted per-reading graph_ids); M1 identity handling for multi-reading
  records.
- **Instrument consequences, handled in-item**: prompt hash re-pins → run
  `vocab_attest.py` (adjudicate, `--write`); this is the LAST planned `prompt.txt` change
  before the Tier B parse.
- **Exit**: e2e green at the new hash; blind validation batch clean; canonicalizer §7
  tests extended to Interpretation records and passing; vocabulary re-pinned.

## C — Qwen3 embedding channel (#4) — parallel track, integration deferred

- **Spike first (~half a day)**: Qwen3-Embedding-8B quantized, local (llama.cpp/Ollama
  class runtime); embed ~100 vocabulary words; record timing and rerun-determinism.
  Speed is a non-issue by workload shape (offline batch over a small vocabulary, cached);
  the requirements are determinism and pinning. API fallback only if local is genuinely
  infeasible — model version recorded, drift accepted as a documented limitation.
- **Build**: `mining/embeddings.py` — embed filler classes, lexical symbols, candidate
  pair members; persist `mining/out2/embeddings.jsonl` (+ model file sha, quantization,
  runtime version). Integration points activate later: AE-pair prior filter (E/H),
  role-filler generalized similarity (E/H), diff-cluster assist (E).
- **Acceptance test (retroactive, decisive)**: on batch-1's 93 AE novel pairs, the prior
  must pass `car/automobile` + `doctor/physician` and kill ≥90% of the 91 scenario
  siblings. If it can't separate those, the channel isn't ready regardless of MTEB.
- **Exit**: pinned artifact + the retro-test report.

## D — Owner reviews parked (#5)

Four decisions, each logged (ledger + `PAPER_NOTES.md`), any rule changes applied and the
ledger regenerated:
1. the 9 `register_only` overrides — confirm or adjust, reading their ledger blocks;
2. `doctor/physician` — keep as one-way hypernym bridge, or adjust;
3. role-canonicalization re-promotion — decided WITH the audit's verdict on role-bridge
   evidence in hand (that is why D follows A);
4. uniform-hash re-parse of the 360 in-sample records — decided once, against the
   post-#48 hash (that is why D follows B).

## E — Miner upgrade (#3)

- **Scope**: `frequent_patterns2` exactly per `PATTERN_MINER_STUDY.md` §3a (shape stratum
  via shallow abstraction; bounded conjunction expansion n ≤ 3–4 with a-priori pruning;
  nisurp ranking for equivalence candidates only; valuation-set + vocabulary exports; all
  standing invariants). `role_fillers` switches to the valuation export (event-only
  restriction dissolves). Diff factoring per study §4 (joint key kept; factor promotion
  discipline).
- **Role-candidate doctrine (owner decision D.3, 2026-08-21 — error-vs-variance split)**:
  a role-flip witness on a class whose role `prompt.txt` DETERMINES (e.g. the
  scheduled-occurrence rule) is a parse ERROR -> diagnosis/re-parse path, never a bridge
  candidate; only prompt-UNDETERMINED classes may propose Theme<->Patient bridges.
  Re-promotion to build-time canonicalization stays off the table this batch.
- **Gates before any candidate reaches a gauntlet**: M4 against the Tier A answer key —
  headline acceptance: recall ≥ wave-1's 30/31 **with `CoAgent~GroupOf` recovered via a
  2-conjunct pattern** (or its miss explained); zero control merges as always.
- **Cross-reference spike**: hyperon-miner on a namespaced Tier A export; divergences
  classified our-gap / our-extension / their-bug (arbiter = written spec + answer key;
  NOT an oracle). Upstream bug reports are a welcome side product.
- **Exit**: M4 report for the new miner; cross-reference report; the 77 cross-star groups
  re-expressed as conjunction candidates (mining run itself waits for H — never mine
  Tier B twice).

## F — M5 question arm (#8)

- **Scope**: `QGEN.md` (blind question writers: answerable from the sentence alone,
  including paraphrastic phrasings — the first direct QA measurement of the 132 bridging
  implications, #33 by another name) + `QPARSE.md` (question → chainer query; a
  **standalone prompt file**, never a `prompt.txt` extension — no parse-hash impact);
  M5 harness extension with the differential design; new `query-brittleness` triage
  bucket.
- **Exit**: question-arm M5 run against existing faithful+bridges views; report.
  (May slip after H harmlessly if the batch runs long.)

## G — Pre-flight checklist (gates H; all must be green)

1. `STRICT_SEVERITY` set from the observed findings distribution (~1,742 records);
   validator leaves report-only where the distribution says so, not by default.
2. Exclusion-by-disposition flow live (adjudicated dispositions gate the MINING substrate;
   pair-aware on Tier C; measurement corpora exempt — M1 keeps its unstable parses).
3. Standing sampled review active per `DISPATCH.md` strata, including review-by-provenance
   wired as a gauntlet-entry gate.
4. `vocab_attest` clean at the current (post-B) hash; brief inventory zero-pending.
5. Decision point recorded: register the graded-lexical-bridge route (#33) for this
   batch's gauntlet, or explicitly defer (JUDGE.md `task: grade` stays dormant if
   deferred).
6. Decision point recorded: add a lexically-rich pair source (MRPC/Quora) for convergence
   headroom, or measure on PAWS held-out alone this batch.

## H — Tier B campaign (#1) — the centerpiece

- **Corpus**: fresh Tatoeba export (dump date + sha recorded; weekly-refresh caveat),
  superset build to 1–2k via `build_tierB.py` (pilot 100 carried forward or their absence
  explained); broadened deliberately past the pilot's strict filters (feeding triage is a
  feature). **ALL of Tier B parses at the final hash inside this campaign (pilot 100
  included), and per owner decision D.4 the Tier C in-sample 360 re-parse rides the same
  fleet (~72 agents) — unifying both M2 arms on one instrument. Tier A is NOT re-parsed
  (the engineered answer key stays).**
- **Parse**: blind Sonnet per `PARSE.md` at the frozen post-B hash; DISPATCH ops
  discipline; validation + sampled review live from record one.
- **Mine**: `frequent_patterns2` + role-fillers-on-valuations + alignment
  (singleton+judge and factoring modes) + MI/AE with the embedding prior — full portfolio
  on the ~3.5k-record substrate; 77-group conjunction candidates included. **2026-09-04:
  every method runs in TWO ARMS — faithful (the doc as written) first, then augmented (our
  additions as measured deltas); see the AMENDMENT of that date.**
- **Gauntlet**: first standing use of `JUDGE.md`; graded route per G.5; ledger regenerated
  per round.
- **Measure — the batch-1 open verdicts, re-tested**: held-out M2 criterion 1 with a
  ×10–100 rule inventory (the density hypothesis is THE claim under test; criterion 2
  must stay clean); M1 on clean natural text (finally disentangling parser wobble from
  PAWS garble); M3 pack economics at scale (packs should pay better on a bigger corpus).
- **Exit**: `BATCH2_REPORT.md` in the batch-1 report's format — glossary deltas, metric
  table, rule ledger deltas, negative results, batch-3 agenda.

## X — Engine-fix response (#2; event-triggered, slot immediately on arrival)

Upstream And-prover fix lands → re-run the adoption battery (e2e 334/334, bridge smoke
expecting 7/7, both root repros expecting non-empty) + M5 conjunction gate (1/38 →
~37/38 expected, zero rule changes) → if green, revisit the serving-layout decision
(packed-KB conjunction QA unblocks; affects F's query targets and the M3 story). Report
appended to `eval/`, memory updated.

## Out of scope for batch 2 (deliberate, revisit on evidence)

Full Ben-miner features (URE control, unbounded depth, sampling, II-surp/jsd — study
§3a); nonlinear AE (ladder: prior → scale → PPMI+SVD first); engine-side #48
marginalization; role re-promotion beyond D's decision; #10/#16/#19/#20 engine-gated
backlog items.
