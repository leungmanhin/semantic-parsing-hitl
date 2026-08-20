# FUSE-NF Batch 1 — synthesis report (2026-08-17)

The PLAN §9 step-5 deliverable: one document over the full pre-registered loop
**corpora → parse → canonicalize → mine → gauntlet → route → apply → measure**, covering
P0–P4, mining waves 1–2 + P3 loop 2, gauntlet rounds 1–3, and metrics M1–M5. Detailed
per-phase reports live in `eval/`; this report cites them.

## 0. Glossary (the three meanings of "wave")

- **Method waves** (PLAN §6): Wave 1 = §4.3.1/2/4 (frequent stars, role-fillers, paraphrase
  alignment); Wave 2 = §4.3.3/5 (MI grouping, linear AE); Wave 3 = "beyond the paper"
  exploratory methods — **not started as a unit** (though its MDL bullet ≈ round-2 packs and
  its LLM-as-validator bullet ≈ the gauntlet probes).
- **Chronological runs**: P3 wave 1 (08-13), P3 wave 2 (08-14), gauntlet rounds 1–2 (08-14),
  **P3 loop 2** (08-17; PLAN §9's "second loop of P3→P4") with gauntlet round 3.
- **Parse-dispatch waves 1–4**: operational batching of the c4 640-item parse (08-16).

## 1. What was built (all deterministic-first: mechanical → Python, judgment → blind agents)

Specs (`specs/`): schema, canonicalization (`fusenf-canon/4`), metrics M1–M5, operator
vocabulary (117 heads, frozen flags). Harness (`harness/`): blind-Sonnet parse orchestration
(5-item load-balanced batches, disk-diff recovery), validator C1–C8, canonicalizer
(graph/shape/content ids, star structure, skolem refinement), assembler, consolidation
rewriter (symbol / structural / pack rewrites with backtracking guards + in-process vocab
augmentation), gauntlet (mech gates + probe cards + evidence-based confidence + §1 routing),
M5 preservation harness, M2 convergence harness. Miners (`mining/`): frequent stars,
role-filler distributions, paraphrase alignment + anti-unification, MI grouping, linear AE.
Corpora: Tier A 402 (engineered design table), Tier B 100 (natural pilot), Tier C 1,000
(PAWS-derived paraphrase pairs + adversarial controls) — **all fully parsed**: 862 records
@ `38fc16af20` (in-sample stratum) + 640 @ `64ad2464` (held-out stratum), parser =
claude-sonnet-5 blind agents, prompt.txt e2e 334/334.

## 2. Metric results

| metric | result | reports |
|---|---|---|
| **M1 stability** | Tier A **0.931**. Tier C hard slice plateaus **≈0.45±0.06** after 4 prompt fix rounds; residual = corpus garble + representation wobble over ≥2 live analyses — **not** binary ambiguity (the #48 pilot closed that theory: multi-reading emission 1/102, stable reading-sets 0). | `eval/m1_tierC_*.md`, `pilot48/REPORT.md` |
| **M2 convergence** (headline) | In-sample: Tier A graph-identical **18.9% → 43.3%** under validated-only rules, controls 0/468. Held-out (640, one hash, first true adversarial-arm test): **criterion 2 PASSES** — 0 consolidation-induced control merges, AUC unchanged; **criterion 1 NOT MET** — exact 15/120 unchanged; loop 2 diagnosed why: **rule density** (60 natural pairs yield 2 valid rules; the inventory can't intersect a disjoint sample). | `eval/m2_preview.md`, `eval/m2_heldout.md`, `eval/p3_loop2.md` |
| **M3 compression** | Round 1: **−39** (honest fail — symbol rewrites preserve counts). Round 2 meta-node packs: **6,372 → 4,894 atoms (−23.2%), strict MDL +1,329** (rule + expansion-bridge costs counted; formula pinned in `harness/gauntlet2.py`). | `eval/p4_gauntlet_round2.md`, `rules/m3_round2_final.json` |
| **M4 rule quality** | Round-1 precision **0.94** (49/52), recall vs engineered targets 30/31; **control merges 0 across all three rounds** (every candidate solo-tested on Tier A polarity pairs). AE-generator precision **0.022** (2/93) — the quantified similarity≠synonymy result. Round-3 judges 6/7 against lexicographic ground truth. | `eval/p4_gauntlet_wave1.md`, `eval/wave2.md`, `eval/p3_loop2.md` |
| **M5 QA preservation** | Round 1: **32/32 = 1.0**, fabrication 0, frozen 0. Round 2 (packed KBs): atom-level recovery **38/38**, fabrication 0, unexplained 0 — but the conjunction gate **fails 1/38 pending an engine fix** (see §4); packed views must not serve conjunction QA until then (faithful + bridges remains the QA layout). | `eval/p4_gauntlet_round2.md` |

## 3. Rule ledger (3 gauntlet rounds; every rule carries judge notes + gate evidence)

- **Consolidation (rewriter, KB-build time): 25** — 13 lexical symbol rewrites (round 1;
  9 via the logged register_only calibration override), 10 parameterized meta-node packs
  (round 2; class-agnostic `(MnEvAgTh $C $v …)`, bijective, uniform-STV guarded), 2 loop-2
  compound synonyms (`rate_of_flow→flow_rate`, `train_station→railway_station`).
- **Bridging (chainer, inference time): 44 validated rules → 132 compiled implications**
  across `rules/mined_bridges_wave{1,2,3}.metta` (82 + 34 + 16), all loading together with
  seeded_rules.metta (verified; wave-3 bridge fires). Includes converses, wrappers,
  class-conditioned role bridges, meta-node expansion bridges (the M3 decompressor), and
  the 2 AE rescues (car/automobile, doctor/physician).
- **Rejected: ~104** with reasons retained — dominated by the 91 AE scenario siblings;
  judges repeatedly beat naive intuition (acquire-hypernymy, doctor-hypernymy,
  divide-polysemy, propose-strength, core-arg-stranding pack shapes).
- Consolidated corpus views: `consolidated/*.cons.jsonl` (7 files) under rounds 1+2+3.

## 4. Engine deliverables (PeTTaChainer, baseline b0e24f9 adopted 08-15, battery clean)

- **Two open And-prover bugs, minimal repros at repo root**: `bug_conj_reuses_rule_premise`
  (08-07: a conjunct re-asserting the deriving rule's premise → []) and
  `bug_conj_two_conjuncts_share_premise` (08-14: two conjuncts derived from ONE shared
  stored premise by different rules → []; no faithful workaround). Both re-confirmed at
  upstream b0e24f9. **An engine fix flips M5-conjunction from 1/38 to ~37/38 with zero rule
  changes** — the single highest-leverage external item.
- Canonicalizer ticket: sealed-interior skolem twins named by surface order (tierC-000043).

## 5. Negative results and incidents (kept, per the empirical-validation discipline)

1. **Similarity ≠ synonymy, quantified**: AE novel pairs 2/93 valid; the rest are corpus-
   construction scenario siblings. AE is generator-only.
2. **Support sparsity on natural pairs**: anti-unification at support≥2 recurs ~0 times on
   60 PAWS pairs; the labeled singleton extension + judge filtering is the working pattern.
3. **#48 ambiguity theory closed**: the M1 plateau is not made of discrete two-reading
   ambiguity; the Interpretation mechanism is sound but inert for stability.
4. **Metric artifact**: d_content across pack/no-pack views embeds a denominator rescale —
   compare faithful-view distances (or exact-match) across consolidation regimes.
5. **Calibration incident (round 1)**: probe wording let judges count register as loss
   against §1's own example; fixed mechanically (`register_only()`), every override logged.
6. **PAWS label noise**: of 4 parser-collapsed "adversarial" control pairs, 2 are genuinely
   semantically equivalent (conjunct-order swaps) — the representation was right; 1 garble
   normalization; 1 real title-attachment miss (pairC-0378).
7. Ops: one server-side rate-limit burst killed 18/32 parse agents mid-wave; disk-diff
   recovery + 8-at-a-time pacing eliminated all subsequent failures (137 agents, 0 data loss).

## 6. Batch-2 agenda (ranked by expected leverage)

1. **Tier B scale to 1–2k natural sentences** — the density fix M2-held-out demands
   (×10–100 rule inventory), and the plan's own step 6.
2. **Engine And-prover fix** (upstream) — unblocks packed-KB conjunction QA (M5).
3. Method-Wave-3 picks: LLM-as-rule-proposer, cluster-level anti-unification; plus the 77
   event-centering-untranslatable cross-star MI groups. **Mining-design study done
   (2026-08-19): `PATTERN_MINER_STUDY.md`** — Ben Goertzel's miner lineage (URE miner /
   hyperon-miner) vs our `frequent_stars`; recommendation = Ben-faithful deterministic
   Python miner (`frequent_patterns2`: top-down specialization, a-priori pruning,
   conjunction expansion = the principled multi-center form, isurp/nisurp ranking) with
   hyperon-miner run as a cross-reference on Tier A — NOT an oracle (it is itself WIP;
   on divergence the arbiter is the written formal spec + the Tier A answer key);
   supersedes the ad-hoc two-center idea.
4. **Qwen3-family embedding channel** (owner-deferred) — corpus-independent lexical prior as
   a generator signal; would have separated the 91 scenario siblings pre-gauntlet.
5. Owner reviews parked: the 9 register-overrides, the doctor/physician hypernym call,
   role-canonicalization re-promotion, uniform-hash re-parse of the 360 in-sample records.
6. #48 adoption on representation grounds (typed trigger), if/when wanted.
7. **Retroactive provenance audit** (queued 2026-08-19, owner-approved): Opus-review, per
   `REVIEW.md`, of every record cited as evidence by a batch-1 validated rule (~100–200
   distinct ids) — pack/role-bridge evidence is the half that matters (lexical rules were
   judged on the words). Cheap; run before batch-2 mining trusts the ledger. Failure
   handling per `DISPATCH.md` §Review: record → triage; rule support recomputed without
   it; below-threshold → suspended with a ledger entry.
8. **M5 question arm** (banked 2026-08-19, owner-approved): add generated natural-language
   questions to M5 alongside the e2e-pattern queries. Blind question-writer agents produce
   questions answerable from the record's sentence alone — including *paraphrastic phrasings*
   (synonyms/converses of the record's words), which makes this the first direct measure of
   the bridging rules' QA payoff (deferred-topic #33 by another name). A question→query
   translation step is new prompt surface. M5's differential design absorbs query-parse
   noise (same query runs on both KBs); add a `query-brittleness` triage bucket for
   one-sided binds. New briefs to be authored with the build: `QGEN.md` (question writer)
   and `QPARSE.md` (question→query parser). External QA datasets rejected: their questions
   presuppose background knowledge single-record KBs don't have.

## 7. Reproducibility

Prompt `64ad2464…` (2,330 lines) + `seeded_rules.metta`; canon `fusenf-canon/4`; engine
pinned b0e24f9 (e2e 334/334, `STEPS=400`); every script clock-free (`--date` arguments);
mining loop-1 artifacts frozen in `mining/out/`, loop-2 in `mining/out2/` with the
pre-registered split in `mining/out2/loop2_split.json`; parse recovery always from the disk
diff; all judge votes and calibration overrides retained as audit trails in `rules/probes*/`
and `rules/validated*.jsonl`.
