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
  on the ~3.5k-record substrate; 77-group conjunction candidates included.
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
