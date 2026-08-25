# FUSE-NF — Batch 1 Plan (paper §4.1–§4.4, semantic-parse-only)

Drafted 2026-07-24. Batch 1 = corpora → parse → canonical graph → mine → route & apply rules → evaluate.
§4.5 / §4.6 / §5 (PLN injection, causal-association graph, transformer) are deferred to a later batch —
PeTTaChainer + seeded_rules.metta already play much of the background-inference role, so when we get
there it is chainer integration, not new machinery.

## 0. Standing principles

- **No syntax branch.** The LLM semantic parse (prompt.txt as the sole parsing instruction set, plus
  optional contextual info) is the only record of surface form. The paper's cross-linking stage (§4.2)
  therefore disappears; §4.1 collapses to a parsing harness and §4.2 to a graph canonicalizer.
- **The faithful parse is immutable.** Consolidation produces a *derived* layer with provenance; the
  raw parse JSONL is never overwritten. (Extends translation-faithful-not-chainer-workaround.)
- **Consolidation runs at KB-build time** (post-parse rewriting), never as query-result filtering —
  the no-host-side-postprocessing rule is untouched.
- **Parser = latest Sonnet at parse time** (currently Sonnet 5), spawned as blind agents that see only
  prompt.txt + the input items (no orchestrator context). Record the concrete model id per parse.
- **Prompt-improvement loop is a standing workstream:** validation failures and odd parses go to a
  triage queue feeding prompt.txt / seeded_rules.metta fixes + new regression cases (hard rule: no
  regression sentence may copy a prompt.txt example).
- Run everything with `/home/manhin/Dev/.venv-dev/bin/python`; `timeout_sec=0` on every PeTTaChainer query.
- **This project owns the FUSE-NF work, built fresh here.** The outputs (FUSE-NF-form parses + rule
  sets) will have at least one immediate downstream consumer project — keep formats clean, documented,
  and stable.
- **Division of labor (user, 2026-07-24):** design and specification work stays at the orchestration
  level; implementation/experimentation nitty-gritty may be delegated to spawned Opus/Sonnet agents
  whenever useful, with the orchestrator overseeing and reviewing everything. The semantic parser
  itself is always a spawned blind Sonnet agent.

## 1. Rule taxonomy (the core output of Batch 1)

**The mining target is consolidation rules.** The FUSE-NF doc's §4.3 methods are normalization
miners, and the doc's claims (M2 convergence, M3 compression) are realized exclusively by the
consolidation set; the doc does not call for bridging-rule creation. Bridging is a PLAN-level
auxiliary bucket (owner, 2026-08-16): when a mined equivalence is judged real but not
rewrite-safe (converses, lossy near-synonyms, frozen-head conflicts), demoting it to a chainer
implication preserves it for inference-time QA instead of discarding it — a bonus capture, not
a target. Two rule species come out of Batch 1:

1. **Equivalence candidates** (lexical/structural, §4.3.2/§4.3.4/§4.3.5) — each validated
   candidate is routed to exactly one type per the table below.
2. **Packaging (pack) rules** (meta-nodes, §4.3.1/§4.3.3; executed in gauntlet round 2) — NOT
   equivalences: one-sided compression rewrites `(bundle over one event) → (Mn… head + fillers)`,
   consolidation-only (no bridging fallback), bijective per instance, with per-component
   expansion implications as the mechanical inverse — the decompressor is counted in M3's
   strict rule cost.

   M3 splits along the same line (metrics.md M3, amended 2026-08-19): for equivalence rules MDL
   is reported, never gated (a symbol rewrite saves ≈0 atoms by construction — its success
   criteria are M2/M4/M5); for pack rules strict marginal MDL > 0 remains a hard per-candidate
   selection gate, because for that species compression is the claim.

Routing for the equivalence species:

| | **Consolidation rule** | **Bridging rule** |
|---|---|---|
| Meaning | sub-graph X **normalizes to** sub-graph Y | sub-graph X **is more-or-less** sub-graph Y |
| Consumer | Python post-processor, after parsing | PeTTaChainer, at inference time |
| Form | directional rewrite LHS→RHS (JSON) | MeTTa rule with STV (`fusenf/rules/mined_bridges.metta`) |
| Obligations | termination (strictly size/frequency-reducing), deterministic order (confluence in practice) | none — TV carries the softness |
| Typical effect | smaller, standardized graph | both forms coexist; chainer derives across |
| Examples | `purchase → buy`; light-verb `take a walk → walk`; idiom `kick the bucket → die` | `stroll ≈ walk` (manner lost); converses `buy/sell` (argument swap); `ScaleOpposite`-style relations |

**Routing criterion** (thresholds provisional, tuned on Tier A):
confidence ≥ 0.9 **and** judged information-lossless **and** a clear canonical direction (more frequent
form wins; tiebreak = smaller) → **consolidation**. Confidence 0.6–0.9, or lossy, or no direction
(converses, near-synonyms with residue) → **bridging**. Below → reject/park.
Additional gate for both: **compatibility check against seeded_rules.metta and prompt.txt QA
conventions** — a rule may not rewrite vocabulary that existing seeded rules or query patterns match on
(e.g. merging `Agent` away would break any seeded rule that binds `(Agent $e $x)`).

## 2. Pipeline

> **2026-08-26: this diagram is the BATCH-1 pipeline, kept for the historical record.
> The current end-to-end overview (review/adjudication layers, substrate gate, graded
> gauntlet route, question arm, tierD) lives in `PIPELINE.md` and is maintained there.**

```
sentences+context ──▶ [P1 harness: blind Sonnet agents + prompt.txt] ──▶ faithful parses (JSONL, immutable)
                                                                              │
                                                                              ▼
                                                                   [P1 validator + triage queue] ──▶ prompt.txt loop
                                                                              │
                                                                              ▼
                                                                   [P1 canonicalizer] ──▶ canonical graphs + stars
                                                                              │
                                                                              ▼
                                                        [P3 mining: waves 1–3] ──▶ rule candidates
                                                                              │
                                                                              ▼
                                                        [P4 validation gauntlet + routing]
                                                              │                     │
                                                              ▼                     ▼
                                            consolidation rules (JSON)   bridging rules (.metta)
                                                              │                     │
                                                              ▼                     ▼
                                            [P4 rewriter → consolidated graphs]   chainer loads alongside
                                                              │                    seeded_rules.metta
                                                              ▼
                                                        [P4 evaluation M1–M5]
```

## 3. Phase 0 — Specs & metrics (deliverables in `fusenf/specs/`)

> **Status: P0 delivered 2026-07-27.** `specs/schema.md`, `specs/canonicalization.md`,
> `specs/metrics.md` and `specs/vocabulary.json` are now **authoritative**; the sketches in §3.1–3.3
> below are the design intent they were built from, kept for the record. Three things the specs
> settled that these sketches did not: the parse key is **`(id, run)`** not `id` (M1 needs several
> parses of one item); canonical and consolidated forms live in **separate files** so the faithful
> parse is never rewritten; and the §1 seeded-rules/QA compatibility gate is now a machine-checkable
> **`frozen`** flag, derived from what seeded rules and query patterns actually match on.

### 3.1 Parse record schema (`schema.md` + validator)

One JSON object per record, JSONL files. Statement records:

```json
{
  "id": "tierB-000123",
  "source": "tatoeba",
  "equiv_class": null,
  "sentences": ["Maria drove to the store."],
  "context": {"today": null, "domain": null, "prior": [], "notes": null},
  "statements": ["(: c1 (Member sk_drive_1 drive) (STV 0.9 0.9))", "..."],
  "parser": {"model": "<model id>", "prompt_sha256": "<hash>", "date": "2026-07-24"},
  "validation": {"ok": true, "errors": []}
}
```

- `sentences` — one or a very small number of related raw English sentences.
- `context` — semi-structured, **deliberately not rigid**: regular optional keys (`today` =
  real/fictional time, `domain`, `prior` = N previously parsed sentences for anaphora) plus
  **free-form `notes`** (string or list) for any situational / conversational / perceptual
  background — e.g. "turn-based conversation, you're chatting with X", or "you're holding a
  telescope, intending to confirm whether the distant person is Bob" (which legitimately shifts the
  preferred reading and its confidence for "I saw the man with the telescope"). The object is open —
  ad-hoc keys are allowed. Structured keys render into the prompt's `CONTEXT`/`TODAY`/`DOMAIN`
  inputs (#18); free-form notes render as a background block. May be empty to begin with.
  **P1 check:** #18 may need a small prompt extension so free-text background is read as
  *interpretive context only* — the parser must never emit atoms from the context itself.
- `statements` — the full assertion strings exactly as the parser emitted them (proof-name + STV
  included): the faithful record.
- `equiv_class` — Tier-A ground-truth equivalence class id (+ polarity label, see §5.1); null elsewhere.
- Question records reserved for a later batch: `questions` / `context` / `queries`, same envelope.

### 3.2 Canonicalization spec (`canonicalization.md`)

Purpose: isomorphic parses must hash identically. Honest deviation from the paper: our SENF uniqueness
comes from prompt-side normalization + a deterministic canonicalizer, not a confluent rewrite calculus
(which the paper asserts but never constructs).

1. Strip proof-names (parser-arbitrary); regenerate `c1..cn` after ordering.
2. **Skolem α-renaming** by signature refinement: iterated neighborhood hashing over the atom graph
   (constants — named entities, kinds, operators — are fixed points), deterministic tiebreaks; rename
   skolems by canonical position. Per-sentence bundles are small (<~30 atoms), so refinement converges
   trivially.
3. Canonical atom ordering: sort by (predicate, arity, canonicalized args).
4. **STV bucketing for identity**: {definitional ≈.99, empirical ≈.9, lowered/striking, negation ≈0,
   graded mid-band}; raw STV kept as an attribute (identity ignores small numeric drift).
5. Outputs per record: canonical linearization, sha256 graph id, and **star decomposition** — the
   mining primitive: an event star = event skolem + every atom mentioning it (Member, roles, status
   predicates); entity stars likewise; shared arguments are the cross-star edges.

### 3.3 Metrics (`metrics.md`) — defined before any mining runs

- **M1 Parse stability** (fuzz baseline): ~60 sentences × 5 blind re-parses → % identical canonical
  hash; mean soft-Jaccard (best-skolem-alignment atom overlap) on mismatches. Quantifies the variance
  FUSE-NF must absorb, and separates LLM noise from genuine ambiguity (#48 territory — for Batch 1 we
  take the majority reading).
- **M2 Paraphrase convergence vs control separation** (the headline metric): graph distance
  (soft-Jaccard) on Tier-C paraphrase pairs vs non-paraphrase controls, before/after consolidation.
  Success = paraphrase distance drops materially while control distance is preserved; also reported as
  paraphrase-vs-control discrimination (AUC) before/after.
- **M3 Compression**: corpus-wide atom count + distinct-star count before/after; MDL view: size(rules)
  + size(consolidated corpus) vs size(original corpus).
- **M4 Rule quality vs Tier-A ground truth**: precision/recall of discovered equivalences against
  labeled classes. Wave-1 target: precision ≥ 0.9 at whatever recall is achievable (provisional).
- **M5 QA preservation**: sample consolidated bundles asserted into PeTTaChainer must still answer the
  e2e-style queries their faithful forms answer (spot-check harness reusing e2e machinery).

## 4. Phase 1 — Parse harness, validator, canonicalizer (§4.1 + §4.2)

- **Harness** (`fusenf/harness/`): orchestrated agent spawning. Each blind agent gets prompt.txt + a
  batch of ≤6 records (output-cap experience from blind validation), returns per-record statement
  lists; parallel spawns; retries on malformed output. Model: latest Sonnet. The orchestrator writes
  JSONL, stamps `parser` provenance.
- **Validation is split by decidability** (`specs/schema.md` §5, superseding this bullet's original
  single-validator framing): **Python** does the mechanical checks C1–C8 — s-expression
  well-formedness, assertion shape, head+arity against `specs/vocabulary.json`, casing, structural
  sanity, chainer smoke-test, duplicates — in **report-only** mode for the pilot, severities set from
  observed data rather than guessed. An **agent reviewer** takes what no program can decide: is the
  parse right for the sentence, **does `prompt.txt` even cover this construction** (the coverage gap
  — the highest-value signal for the prompt loop), and the **context-leak** check, which has no
  reliable mechanical form. Findings → `fusenf/triage/parse_failures.jsonl`.
- **Canonicalizer** (`canonicalize.py`) implementing PLAN.md §3.2, with unit tests on hand-built isomorphic
  pairs.
- **Exit experiment**: micro-pilot ~30 Tier-B sentences end-to-end through canonicalizer → run M1.
  Checkpoint report to user.

## 5. Phase 2 — Corpora (`fusenf/corpora/`)

### 5.1 Tier A — synthetic controlled (~50 seed meanings × 5–7 variants ≈ 300 sentences)

Each seed = one meaning; variants labeled `equiv_class` + polarity. Three variant categories, kept
distinct because they test different things:

- **(i) Prompt-should-already-normalize** (voice active/passive, dative alternation, cleft vs plain):
  expected to parse *identically* → these are parse-stability probes, not mining targets.
- **(ii) True mining targets** (the prompt deliberately keeps these distinct — surface-faithfulness):
  lexical synonyms (buy/purchase/acquire), phrasal ↔ simple verb (give up ↔ abandon; `verb_particle`
  forms), light-verb constructions (take a walk ↔ walk), idioms (kick the bucket ↔ die), intensifier/
  degree wording (very big ↔ huge), nominalization (destroyed the city ↔ destruction of the city),
  converses (buy ↔ sell — bridging-expected), role-merge candidates (comitative `CoAgent` ↔ plural
  `GroupOf` agent).
- **(iii) Negative controls** (must NOT consolidate): antonym swap, added negation, modality shift
  (must ↔ may), participant swap, quantity change, near-miss manner verbs (stroll vs run).

Generation: LLM-synthesized from a seed-meaning design table, then human-skimmable review. Ground truth
lives in `equiv_class` + polarity labels.

### 5.2 Tier B — natural corpus

Pilot 100 → scale to ~1–2k sentences. Sources (short, self-contained, permissively licensed):
Tatoeba (CC-BY), Simple English Wikipedia sentences, ROCStories (also sets up §4.6 later). Isolated
sentences primarily; a small multi-sentence subset exercises `context.prior` + cross-sentence
coreference. Selection favors declarative, present/past-tense, concrete sentences first (the prompt's
strong zone), broadening deliberately to stress coverage (feeding the triage loop is a feature).

### 5.3 Tier C — paraphrase pairs

~300–500 positive pairs + ~200 non-paraphrase controls. Sources: PAWS / MRPC / Quora subsets
(controls come free: PAWS negatives are high-lexical-overlap non-paraphrases — ideal), topped up with
LLM-synthesized pairs where construction coverage is thin. Both sides parsed independently.

## 6. Phase 3 — Mining (§4.3), in waves

**Composition philosophy:** the methods are not five
independent shots at the same target — frequent-star mining supplies the **candidate vocabulary**,
MI/autoencoder treat those as **features**, role-filler clustering proposes **slot merges** on its own
axis, and paraphrase alignment + LLM judgment are primarily **validators**. Frequency alone never
establishes equivalence (frequent ≠ equivalent). Each method emits **typed signals**
`{candidate, confidence, kind ∈ {lexical-collapse, slot-merge, subtree-collapse, specialization, …}}`;
a rule candidate survives on **cross-method consensus aggregated by kind**, with the scoring/voting
rule an explicit configurable (not hard-coded).

**Wave 1** (works at small scale, no labels needed):
- **§4.3.1 Frequent stars/sub-stars**: enumerate connected sub-stars up to size k (start k=4), count
  document support, threshold → common semantic units (meta-node / subtree-collapse candidates).
- **§4.3.2 Role-filler distribution clustering**: at two granularities — **event-conditioned slot
  keys** (`drive.Agent`, not bare `Agent`, so generic slots don't pool fillers across unrelated event
  types) and the global role level (do `Theme`/`Patient` filler distributions actually separate? — an
  empirical audit of #23). Filler embedding: small local embedding model if available in the venv,
  else co-occurrence vectors (decide at implementation; no cloud dependency).
- **§4.3.4 Paraphrase alignment + anti-unification** (the main consolidation-rule source): best-match
  star alignment across each Tier-C pair → extract the differing aligned subgraphs → anti-unify
  recurring diffs into LHS↔RHS candidates with variables, support counts, and example ids. For
  discovering paraphrase candidates *within* Tier B (beyond curated Tier-C pairs), score pairwise
  maximum-common-subgraph overlap between canonical graphs, with a per-record statement cap (exact
  MCS cost blows up on long records).

**Wave 2** (wants ≥~1k graphs; run degraded earlier if useful):
- **§4.3.3 MI grouping** over the star-feature × sentence matrix.
- **§4.3.5 Autoencoder**: shallow AE over feature-count vectors; encoder-weight-tied features →
  interchangeability candidates.

**Wave 3 — beyond the paper** (exploratory; pursue after the five are assessed):
- **LLM-as-rule-proposer / LLM-as-judge**: show clustered diffs / near-identical star groups to an
  LLM to propose the general rule + counterexamples (constructive), and use LLM equivalence judgment
  as a validator on candidates from other methods; accept only after statistical validation on corpus.
- **MDL / compression-driven search** (SUBDUE-spirited): prefer rule sets that maximally compress the
  corpus — the most ENF-spirited criterion available.
- **Anti-unification generalization ladder** beyond pairs (graph-LGG over whole candidate clusters).
- **Lexical-resource priors**: WordNet/PPDB/FrameNet as cheap candidate *generators*, admitted only
  with corpus evidence (keeps the empirical-validation discipline).
- **Substitutability probes**: LLM judges whether swapping X↔Y inside full sentence contexts preserves
  truth conditions — used as a validation oracle, not a discovery method.
- **NLI directional entailment** (SNLI/MNLI): one-way entailment (A→B, not B→A) marks B as a
  *generalization* of A → **specialization-preserving hierarchical rules** (a distinct signal kind;
  routes naturally to bridging, since flat-merging a specialization is lossy by definition).
- **Back-translation pivot paraphrasing** (En→X→En): a paraphrase distribution complementary to
  direct LLM prompting for topping up Tier C.
- **Active learning on inter-method disagreement**: candidates where methods conflict are the
  highest-information cases — surface them to the LLM judge (or the user) first.

Every method is scored against Tier-A ground truth (M4) before its candidates enter Phase 4.

## 7. Phase 4 — Validation, routing, application (§4.4)

- **Rule format** (`fusenf/rules/candidates.jsonl` → `validated.jsonl`):

```json
{"id": "r0012", "type": "consolidation|bridging", "lhs": ["(Member $e purchase)"],
 "rhs": ["(Member $e buy)"], "direction": "lhs->rhs", "confidence": 0.93, "support": 41,
 "lossless": true, "provenance": {"method": "paraphrase-align", "examples": ["tierC-0041"]},
 "status": "candidate|validated|rejected"}
```

- **Validation gauntlet**: cross-method consensus scoring (typed signals, §6) → Tier-A precision
  check → negative-control check (must not fire on polarity-different pairs) → losslessness judgment
  (substitutability probe) → seeded-rules/QA-vocabulary compatibility check (§1) → routing by the §1
  criterion.
- **Meta-node encoding — explicit design decision** (decide at P4 start with
  examples in hand): when a subtree collapses, its internal arguments can be encoded as
  **fully-named** meta-nodes (`AfterFinishHomework` — compact, vocabulary explodes),
  **parameterized** (`(AfterFinish homework)` — pattern in the head, fillers attached), or
  **structured** (meta-node with preserved internal slots — expressive, barely consolidates).
  Working lean: **parameterized** — it matches how our compound terms already behave under the
  chainer (SEALING: nested term args stay queryable via unification into the term), but confirm
  against real Wave-1 candidates.
- **Rewriter** (consolidation set): apply to fixpoint; deterministic priority = larger LHS first, then
  higher confidence, then rule id; every rewrite strictly non-increasing on (atom count, canonical-form
  frequency rank) → termination. Confluence handled pragmatically: fixed order + overlap tests on
  Tier A; divergences documented, no formal critical-pair proofs.
- **Bridging compile**: `mined_bridges.metta` with uniquely named rules
  (`(: mined_bridge_rN (-> <premise…> <conclusion…>) (STV s c))`) — kept separate from hand-written
  seeded_rules.metta for provenance; chainer loads both. (Mind the open `bug_rule_proofname_collision`
  — unique names throughout.)
- **Evaluation**: M2 (headline), M3, M4, M5. Checkpoint report with before/after examples.

## 8. File layout

```
fusenf/
  PLAN.md                 (this file)
  specs/                  schema.md, canonicalization.md, metrics.md, vocabulary.json
  harness/                parse orchestration, validator.py, canonicalize.py (+ unit tests)
  corpora/                tierA.jsonl, tierB.jsonl, tierC_pairs.jsonl (inputs only)
  parses/                 <tier>.parses.jsonl (faithful, APPEND-ONLY)
  canonical/              <tier>.canon.jsonl (canonicalizer output, keyed to a parse)
  consolidated/           <tier>.cons.jsonl (rewriter output, keyed to a canonical form)
  mining/                 m1_stars.py, m2_rolefiller.py, m4_paraphrase_align.py, wave2/, wave3/
  rules/                  candidates.jsonl, validated.jsonl, mined_bridges.metta
  eval/                   m1_stability.md, m2_convergence.md, … (reports)
  triage/                 parse_failures.jsonl (→ prompt-improvement loop)
```

## 9. Sequencing & checkpoints

1. **P0** specs + vocabulary inventory → user review of specs.
2. **P1** harness + validator + canonicalizer; 30-sentence micro-pilot; **M1 baseline** → checkpoint.
3. **P2** Tier A design table → generate; Tier B pilot 100; Tier C assembly → checkpoint (corpus stats).
4. **P3** wave 1 mining, M4-scored → checkpoint (candidate rules with examples).
5. **P4** gauntlet + routing + rewriter + bridging compile; **M2/M3/M5** → Batch-1 report.
6. Scale Tier B toward 1–2k and run wave 2 (+ wave 3 picks) as a second loop of P3→P4.

Every checkpoint = short report; nothing advances past a phase boundary without review. Git commits
remain user-handled throughout.

## 10. Risks & open questions

- **Parse variance** — if M1 stability is low, consolidation must first absorb self-paraphrase noise;
  mitigations: majority-of-3 parsing for corpus records, and prompt tightening via triage. Genuine
  ambiguity belongs to #48 (`Interpretation`), out of scope for Batch 1.
- **Agent throughput** at >1k sentences — revisit direct-API scripting vs agent spawning at P2-scale
  time; pilot volumes are comfortably agent-sized.
- **Embedding availability** in the venv for §4.3.2/§4.3.5 — decide local model vs co-occurrence at
  implementation; no cloud dependency required by the plan.
- **Role-merge rules vs engine conventions** — any Participants-style merge must pass the seeded-rules
  compatibility gate; expectation: most role merges route to bridging or rejection, not consolidation.
- **What gets asserted to the KB** for downstream reasoning: proposal = consolidated form + bridging
  rules (smaller KB), faithful parse archived in JSONL; decide with M5 evidence in hand.
- **Question parsing** deferred; schema reserved (`questions`/`context`/`queries`).
