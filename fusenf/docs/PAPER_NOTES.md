# PAPER_NOTES — rationale ledger for the future FUSE-NF paper (started 2026-08-19)

NOT a draft. One-line entries capturing design decisions, the rejected alternative, and the
artifact pointer — the "why this way and not that way" that lives nowhere else. Results stay
in `eval/` + `rules/` (raw, reproducible; pull at writing time). **Discipline: append an
entry whenever a decision with a nontrivial alternative is made; never write prose here.**
Sections follow a prospective paper skeleton; reorganize freely at writing time.

## 1. Position / architecture

- SENF uniqueness WITHOUT a confluent rewrite system (which the paper asserts but never
  constructs): prompt-side normalization does the semantic work, a deterministic
  canonicalizer removes non-semantic freedom, and the leftover variation IS the mining
  target — a division, not a shortfall. → `specs/canonicalization.md` §0.
- Deterministic-first as methodology: everything mechanically decidable is Python
  (byte-identical reruns); agents only where judgment is irreducible; every agent role has
  a standing brief and blindness rules (contamination discipline; orchestrator never
  parses or judges). → `DISPATCH.md` brief inventory.
- Two rule species — equivalence (normalize forms) vs packaging (compress structure) —
  resolve the convergence-vs-compression tension: species split owner-pinned in PLAN §1;
  M3 gates packs only (amended 2026-08-19). Alternative rejected: one global MDL gate
  (mislabeled round 1 as a failure). → `specs/metrics.md` M3, `PLAN.md` §1.
- Surface-faithful parsing, normalization downstream: the LLM parse is the sole record of
  surface form; no syntax/CCG branch (owner 2026-07-20); translation-faithful — never
  distort a parse to dodge an engine limitation, file a repro instead.

## 2. Corpora

- Tier A support-first, not coverage-first: one-instance-per-phenomenon corpora are
  structurally unminable (every miner thresholds on recurrence) → 31 rules × 3–4 seeds.
  M4 is a ceiling estimate by construction. → `corpora/tierA_design.md`.
- Router traps designed in: converses + CoAgent~GroupOf (the paper's own flagship merge,
  deliberately not hard-coded) test routing, not just detection.
- Controls removed where dishonest: no antonym for teach ("unteaches" coinage), no
  participant-swap for symmetric work_with — a control that would punish a CORRECT merge
  corrupts M4 against the miner.
- PAWS chosen for its negatives (word-scrambles = the exact discrimination M2's safety arm
  needs); its positives documented AT BUILD TIME as structural-not-lexical — which
  predicted the held-out criterion-1 miss. PAWS label noise found: 2/4 "adversarial"
  collapses genuinely equivalent. → `corpora/build_tierC.py` docstring, `eval/m2_heldout.md`.
- Tatoeba: weekly-refreshed exports → the corpus jsonl + per-sentence source_id is the
  durable record, not the URL; scale-up = superset build.
- Paraphrase emphasis = the only cheap ground truth of meaning equivalence (measurement,
  mining substrate, safety); pivot to unpaired text justified by loop-2 density verdict
  (60 pairs → 2 rules).

## 3. Parsing + validation

- Brief system + per-record hash pinning: "every agent saw the same content except the
  sentences" is verifiable (parser.prompt_sha256), not intended. Wrapper minimalism: no
  role-play framing — uncontrolled prompt surface. → `DISPATCH.md`, `PARSE.md`.
- Report-only validation for the pilot: severities set from the observed distribution,
  never guessed — a too-strict check silently quarantines exactly the novel constructions
  the corpus exists to surface (selection bias that LOOKS clean). Batch 2: move to
  exclusion-by-adjudicated-disposition (pair-aware on Tier C; measurement corpora exempt —
  M1 needs the unstable parses in).
- vocabulary.json = machine-readable projection of prompt.txt (two independent extractions
  reconciled vs mechanical golden inventory; 17 adjudications marked). C4's open-class
  boundary is the least objective check → reports with hint, reviewer adjudicates.
  Staleness enforced not remembered (pins vs live files; vocab_attest.py = the update
  procedure); removed operators become deprecated_operators (the engine accepts old
  Implication syntax SILENTLY and returns [] — C4 is the only parse-time detector).
- Reviewer = Opus (a same-family reviewer re-approves its own misreading — decorrelation);
  gauntlet judges = Sonnet ×3 (judged content is English sentences, not model output; the
  decorrelation argument does not transfer). Review-by-provenance: review gates a record
  at the moment its parse becomes rule evidence — not pre-mining (that's 100% coverage by
  another name), not post-hoc.
- Majority-of-N: a mechanical vote over canonical graph_ids — no agent picker (voting
  needs a stable notion of "the same parse"; a picker re-introduces judgment variance AND
  breaks blindness). Switched on only by M1 decision rules; never needed in batch 1.

## 4. Canonicalization

- Constants are fixed points; only witness material (skolems, rule vars) α-renames.
  Rationale trio: bound names carry no semantic content; pay-the-quotient-once (byte
  equality everywhere after) vs graph-isomorphism at every comparison site; renaming
  localizes lexical content into atoms so a rewrite touches ONE atom. Skolem stems
  deliberately NOT used as colour seeds (parser-chosen → would smuggle input dependence).
- Escalate-only-on-test-failure: simple sort failed order-invariance on 17/256 golden
  bundles → colour refinement; true automorphisms ("two dogs were chased": 720 orderings,
  2 ids) → individualization + branch-and-minimum. Both escalations forced, neither
  speculative. → `harness/canonicalize.py` docstring.
- And-arguments sorted BEFORE skolem naming (conjunct-order bug, M1 v4); Or/Xor
  deliberately NOT sorted — the chainer matches them verbatim, order is load-bearing.
- STV bucketing specified but OFF until M1 reports tv-only jitter (currently a no-op on
  all attested TVs). content_id drops surface-record atoms because whether "all"/"every"
  should consolidate is a batch-1 question — don't prejudge by dropping atoms.
- soft_jaccard: colour compatibility is a PREFERENCE not a prune — everything reaching the
  distance function is a near-miss by definition; a hard prune understates agreement
  exactly where the number matters.
- Canon version is part of every hash payload → ids never comparable across versions.

## 5. Mining (five methods; composition philosophy)

- Stars supply vocabulary, MI/AE treat them as features, role-fillers work their own axis,
  alignment + judges validate; frequency alone NEVER establishes equivalence. → PLAN §6.
- frequent stars: constants stay verbatim ("lexical identity is the point" — masking
  constants destroys the very signal); DOCUMENT support (burstiness guard) vs occurrence
  count; canonical pattern = lexicographic minimum over satellite permutations
  (anti-fragmentation — the naming lottery quotiented at every layer it re-enters);
  star-restriction vs general FSM = a knowing trade with QUANTIFIED residue
  (CoAgent~GroupOf recall miss + 77 cross-star MI groups).
- role-fillers: slots event-conditioned (bare-role slots pool unrelated fillers); cosine
  over raw counts = the no-embedding baseline (Qwen3 prior is the upgrade, deferred);
  flip witnesses = the template for turning stability failures into mining substrate
  (M1 wobble → #23 audit → validated rule family). Known blindness visible in own output:
  commence.Time ≈ end.Time at 1.00 (distributional agreement is meaning-blind).
- alignment: the ONE supervised channel (pair label ⇒ diff = candidate by construction);
  anti-unification is syntactic (abstraction-then-exact-key = the lgg in that vocabulary);
  negative controls MINED TOO — "rise↔fall must die here, not in P4" (182 control keys);
  support-recurrence is an engineered-corpus luxury (loop 2: natural diffs essentially
  unique) → singleton + judge is the natural-text pattern; diff FACTORING design + the
  converse trap (co-dependent edits must not be split silently). → `PATTERN_MINER_STUDY.md` §4.
- MI grouping: the units quadrant (high Jaccard = together); statistically re-unifies the
  star decomposition's multi-view double-vision (the buy group = same atoms from two
  centers); containment tagging filters enumeration artifacts.
- AE: linear = truncated SVD, deliberately (LAPACK determinism; no capacity argument at
  862 docs; a linear AE trained to convergence recovers the SVD subspace anyway);
  interchange = complementary distribution operationalized (cos ≥ .8 AND jacc ≤ .1 —
  dropping the Jaccard cap floods in every MI group: substitutes vs units);
  scenario-sibling mechanism laid bare (bank/editor: Tier A's parallel seeds put different
  words in identical structural neighborhoods); verdict: generator-only, 0.85 cap.
  Upgrade ladder: external prior → scale → PPMI+SVD → (only on evidence) nonlinear.
- Miner lineage study vs Ben Goertzel's pattern miner (URE / hyperon-miner): our
  frequent_stars = the single-center constants-verbatim fragment of his lattice;
  batch-2 `frequent_patterns2` scoped to shape stratum + bounded conjunction expansion +
  nisurp ranking; hyperon-miner = cross-reference, NOT oracle (WIP; arbiter = written
  formal spec + Tier A answer key). → `PATTERN_MINER_STUDY.md`.

## 6. Validation gauntlet

- Mech gates first (cheap kills; judge attention is the scarce resource): M4's control
  gate (per-candidate SOLO Tier A application), M5's frozen gate, M3's pack marginal —
  the metrics' hard gates compiled into the front end. Judges answer exactly ONE question
  class (truth preservation / information loss) via probe cards with natural-language
  examples; provenance kept OFF cards (anchoring).
- Routing = pre-registered arithmetic (conf formula explicit in code; control merge
  overrides ANY confidence — "one merge is worse than fifty missed rules").
- Register incident: probe wording let judges count formality as loss against the plan's
  own example → mechanical register_only() override, every case logged; lesson: the loss
  taxonomy is BRIEF CONTENT (now verbatim in JUDGE.md), not judge intuition.
- Judges beat the seed table (acquire-hypernymy, doctor-hypernymy, divide-polysemy,
  propose-strength): the answer key is itself a judgment artifact → M4 is "agreement with
  a curated-and-adjudicated key". Full audit trail: `harness/ledger_view.py` →
  `eval/rule_ledger.md` (every candidate, every gate, every vote verbatim).

## 7. Consolidation rewriter

- "The chainer never sees these rules — a consolidated graph IS the equivalence": the
  species boundary as executable fact. Bridging = inference-time TVs; batch-1 serving
  layout is faithful+bridges only because packed conjunction QA is engine-gated.
- Guards with rationales: positive-only matching (rules mined from positive paraphrases —
  a denial must never be restructured); single-STV pack guard (a meta-node carries one TV;
  mixed bundles stay faithful); min-TV propagation on structural RHS; backtracking
  instance guards (skip, not fail).
- augment_vocab two-vocabularies move: Mn heads registered in-process for
  re-canonicalization; specs/vocabulary.json untouched BECAUSE the parser never emits Mn —
  C4 must keep flagging it at parse time.
- Confluence-in-practice: fixed total application order (larger LHS, conf, id; fixpoint)
  instead of a confluence proof; termination argued (idempotent symbol rewrites;
  strictly-reducing one-direction structural rules). Orphan sweep = a declared projection,
  M5-checked.

## 8. Metrics (design rationales; numbers live in eval/)

- M1: variance attribution with a remedy per bucket; canonicalizer bucket must be 0
  (blocks P2); decision rules SET POLICY (parse-once / majority-of-3 / stop). Tier C
  plateau decomposition: garble + wobble, NOT binary ambiguity (#48 pilot closed it).
  Natural-text M1 measures corpus quality × parser stability entangled.
- M2: two-armed by design; AUC = the anti-gaming clause (indiscriminate merging moves both
  arms); d = 1 − soft-jaccard; exact content-id match trusted over distance under pack
  regimes (denominator artifact).
- M3: per-species (see §1). M4: precision-over-recall asymmetry; zero-merge hard gate.
- M5: the consumer contract; fabrication clause draws the normalization/inference boundary
  (bridging may add answers, ATTRIBUTABLY; consolidation may not); differential design
  absorbs query noise; M5 doubled as an ENGINE FUZZER (found the second And-prover bug).
- "Lossless" = answer-lossless + judged meaning-preserving; four loss regimes (forbidden /
  judged / TV-quantified / out-of-band) + packs strictly bijective.

## 9. Negative results (keep ALL — paper gold)

BATCH1_REPORT §5's seven + : AE precision 0.022 with mechanism (similarity ≠ synonymy,
quantified); loop-2 support sparsity (natural diffs unique); #48 ambiguity theory closed
(1/102); d_content pack-denominator artifact; register incident; PAWS label noise;
M3 −39 reframed as species mismatch; rate-limit ops incident (disk-diff recovery).

## 10. Engine findings

Two And-prover bugs (premise-reuse 08-07; shared-premise 08-14 — no faithful workaround;
minimal repros at repo root; both present at upstream b0e24f9); engine fix flips
M5-conjunction 1/38 → ~37/38 with zero rule changes. Canonicalizer ticket: sealed-interior
skolem twins (tierC-000043; exact:true doesn't certify sealed interiors). Breaking+silent
Implication migration (cfe25f9) as a case study in schema-drift detection (C4 + deprecated
operators + vocab pins).

## 11. Limitations / future-work candidates

In-sample-vocabulary-scoped convergence (safety generalizes, convergence needs density =
Tier B 1–2k); single-parser dependence (claude-sonnet family; prompt is the instrument);
Tier C garble/stability entanglement (split stability corpus from convergence corpus);
frozen role vocabulary (re-promotion parked); graded lexical bridges (#33 route,
unregistered); M5 question arm (QGEN/QPARSE, §6 item 8); embedding channel deferred;
77 cross-star groups unmined; #48 representation adoption.

## 12. Provenance audit (batch-2 item A, 2026-08-21) — audit-methodology rationales

- Evidence failure is per (record, citing-rule), never per record: a parse with a wrong
  Beneficiary is still valid evidence for a lexical swap it exemplifies. Relevance =
  word-boundary match of the rule's content symbols (+ compound space-forms) against the
  reviewer's issue text; conservative by design. → `harness/provenance_audit.py`.
- **Pair-diff cancellation**: evidence validity depends on the MINING METHOD — a
  systematic parse error shared by both sides of a paraphrase pair cancels in the diff
  the rule was mined from (rc0017: all 5 records carried the identical Theme-for-Patient
  choice; the put_off/postpone contrast survives untouched). Alignment-mined rules are
  robust to shared errors; single-record evidence (AE, packs' samples) is not.
- Role rules cited statistics, not record ids → witnesses re-derived deterministically
  from the canon substrate; provenance SHOULD carry ids from batch 2 on (miner fix).
- The audit doubled as the reviewer-machinery shakedown and immediately found its own
  calibration gap: REVIEW.md leaves the yes/partial boundary undefined; 98/234 verdicts
  came back "partial", unusable as a gate without the relevance layer. Fix queued
  post-audit — never edit a brief mid-campaign (all verdicts must share one text).
- Side harvest: 65 incidental doctrine findings = the largest parse-quality triage feed
  to date (role choice, futurate rule, world-knowledge emission), from an audit that was
  nominally about rule trust — reviewer passes pay for themselves in by-catch.

## 13. #48 adoption (batch-2 item B, 2026-08-21) — multi-reading rationales

- Adopted on REPRESENTATION grounds after the pilot refuted the stability motivation
  (1/102 emissions; plateau ≠ binary ambiguity) — the trigger names ambiguity TYPES
  (attachment / lexical sense / idiom-vs-literal) instead of "two complete readings",
  exactly the pilot's closing recommendation.
- Equipoise clause added from blind-batch calibration, not intuition: a world-knowledge
  lean yields the favored single reading (confidence may drop); the tie requires both
  readings genuinely unselected. One probe over-emission (idiom + temporal adjunct) is
  what earned the line — the trigger boundary was DISCOVERED, not designed.
- Reading-set identity: sha256 over sorted per-reading graph_ids under a distinct payload
  — tag names and reading order provably cannot affect identity; single-reading records
  stay byte-identical, so the canon extension is additive (no version bump, no corpus
  regeneration). Alternative rejected: canon/5 (would orphan every existing id for zero
  behavioral change on 100% of existing records).
- Multi-reading records expose EMPTY top-level atoms/stars so every miner skips them
  structurally rather than by special-case code; mining-over-readings is out of scope
  until evidence demands semantics for it.
- Serving semantics pinned in e2e: the KB answers from the SHARED layer; per-reading
  content is absent until engine marginalization (#48's deferred half) — honest QA over
  ambiguity means not answering from a reading the text didn't select.
- Validator scoping principle: a reading = shared + its tag, so name-uniqueness,
  declaration, and duplicate checks all run per-reading; the same expression in two
  different readings is legal (if it holds in all readings it belongs in shared — a
  reviewer judgment, deliberately not mechanized).
- By-catch: the lexical probe ("saw her duck") surfaced a genuine coverage gap —
  perception small-clauses have no prompt rule; the agent improvised via the
  periphrastic-causative analogy. Prompt-loop material.
- Rejected alternative (owner-proposed, adjudicated 2026-08-21): representing readings as
  object-level `(Or r1 r2)` / `(And r1 r2)`. The And half is already the design (both-meant
  = plain dual assertion, no uncertainty, no wrapper). The Or half: verified the engine
  ACCEPTS Or-of-readings, but four costs — category collapse with genuine textual
  disjunction (#20 entanglement); Or's sealed interior erases per-reading identity/stars/
  TVs and lands on the sealed-interior canonicalizer ticket; unsorted Or args resurrect
  order-instability the MRSET hash killed; one outer STV loses the equipoise/lean channel.
  Concession kept: marginal QA semantics IS epistemic-Or → compile-to-Or recorded as
  legitimate ENGINE-internal strategy in the feature-req. Ambiguity is meta-level (which
  assertion was made), disjunction is object-level (what the text asserted).

## 14. Embedding prior (batch-2 item C, 2026-08-21)

- Qwen3-Embedding-8B bf16 on a 13GB no-GPU laptop: 10s load, ~1s/word, bit-exact reruns —
  "speed is a non-issue for offline-batch small-vocab" confirmed empirically; the
  determinism requirement (not latency) was the real constraint, and local+pinned beats
  API on exactly that axis.
- Retro-AE acceptance: **100% separation** (93/93 siblings below the validated floor
  0.9425) — the corpus-independent prior solves precisely the failure the corpus-bound AE
  could not (parallel scenarios manufacture distributional twins in-corpus; general
  language knows better).
- Deployment threshold ≈ 0.70–0.75, NOT the validated floor: several TRUE synonyms score
  0.75–0.80 (repair~mend 0.756) while antonyms/converses score 0.76–0.85 (begin~end
  0.849) — the prior kills siblings, cannot adjudicate synonymy vs antonymy/conversion.
  Filter, never evidence; judges stay. The sibling band runs 0.49–0.79 with a thin tail
  overlapping the low-synonym zone: ~0.75 gives ~95% kill keeping every true synonym;
  100% kill costs 2–3 of them — a dial, acceptable because survivors merely reach judges.

## 15. Owner adjudications (batch-2 item D, 2026-08-21) — `rules/owner_decisions.jsonl`

- Register overrides RATIFIED (all 9): the calibration override anticipated the JUDGE.md
  taxonomy; the two connotation-flavored notes (procrastination-shading, indirectness)
  adjudicated as tolerated connotative loss. Alternative (re-judging under the new brief)
  declined as predictable rubber-stamping.
- doctor/physician: the compiled mutual pair CONTRADICTED the judged hypernym verdict —
  fixed to asymmetric TVs (physician->doctor 0.9 true direction; doctor->physician 0.7
  corpus-usage recall aid). Lesson: export conventions can silently erase judge nuance;
  the ledger view is what caught it.
- Role re-promotion DEFERRED with the error-vs-variance doctrine: prompt-DETERMINED
  classes route flips to diagnosis/re-parse (they are errors); UNDETERMINED classes keep
  bridges (no canonical direction exists — which is what bridging IS). Canonicalizing
  either species would be wrong for opposite reasons.
- Uniform hash: Tier C 360 re-parses inside item H (one fleet, one instrument for both
  M2 arms); Tier A deliberately NOT re-parsed — an engineered answer key's value is its
  stability, and M4 scores labels, not hashes.

## 16. Fix-pack B2 (2026-08-22) — the audit-to-prompt loop, closed

- **Reviewer findings as prompt curriculum**: the retroactive audit's by-product — 98
  evidence-relevant per-record findings — clustered into three recurring themes
  (scheduled-occurrence role ×9, futurate-without-anchor ×8, pronoun typing ×8). Each
  theme got an *emphasis-only* fix at the exact decision point where parses diverged,
  not a new rule: the doctrine was already correct, the errors were salience failures.
  This is the intended standing loop: review → theme → targeted emphasis → blind
  re-validation, with the doctrine itself untouched.
- **Perception reports entered by evidence, not agenda**: probe48-000004's blind parser
  spontaneously linked a perceived *event* by `Stimulus` with no doctrine licensing it —
  a coverage gap discovered by the pipeline's own validation layer. The new section
  canonizes the representation the prompt's internal logic already pointed to
  (perception object → `Stimulus`, whether entity or event), rather than importing an
  external analysis.
- **Veridicality as the routing axis**: the section completes a three-way complement
  routing — sealed (non-factive attitude), sealed+asserted (factive), asserted-only
  (direct perception) — with negation flipping perception to a whole-bundle denial
  (veridicality does not survive negation). Uniform event-`Stimulus` across matrix
  aspect (see vs watch) was chosen over splitting by stativity: one construction, one
  shape, at the cost of one explicit glossary carve-out.
- **Ops rule paid for twice**: the first blind dispatch raced two late glossary wires
  and was discarded wholesale (transcript-verified which text each agent read). Freeze
  the prompt before dispatching; the pinned hash must be the text the validation ran at.

## §17 — Findings-stratum review calibrates the validator (2026-08-24)
First standing §5.2 sweep (blind Opus, findings withheld) over the campaign's 93 machine-flagged records + 3 flags: the unanchored join shows only 11/82 validator-C4 heads are genuinely unlicensed per blind review (13%); the rest are open-class-licensed (kind-relations, preposition-named obliques), with zero reviewer-extra heads. Rationale consequence: C4 stays report-only in G.1's STRICT_SEVERITY — the true-violation signal is the review join, not the raw C4 count. Secondary: the orchestrator's tierB-000606 under-parse suspicion was overturned by review (parse vindicated; the real gaps are degree-modified comparatives and the "more so" pro-form) — evidence the review layer catches orchestrator priors, not just parser errors. Two hard failures (both pilot-r2) expose one doctrine corner: negation-inside-seal has no licensed encoding (a sealed term carries no TV slot).

## §18 — Fix-pack 3: the harvest-to-prompt loop at scale (2026-08-24)
First fix-pack driven by a QUANTIFIED gap harvest (681 review+adjudication gap claims, frequency-ranked) rather than audit reading: the top families (nominalization/adjective complements 51, entity-position prepositions 44, restricted kind claims 34, frequency adverbs 19, control infinitives 15) became 4 sections + 2 designed rules + 5 emphasis fixes; everything below the cut deferred with reasons. Two rationale points: (1) the pack codifies CONVERGENT PARSER IMPROVISATION (entity-attached surface-preposition obliques were what campaign parsers already invented under the open licence — the fix legitimizes and disciplines the pattern rather than inventing a new one); (2) a mid-draft teach-to-the-test audit replaced every example phrase that echoed its motivating corpus record — a fix-pack must generalize the lesson, not memorize the failing sentence. Blind validation confirmed generalization (10/10 on fresh vocabulary) and surfaced one residual two-route variance (postural verb + position preposition), logged for the next wire. Hash f6448eac → 2aa57fa8.

## §19 — Repair yield and the standard-drift effect (2026-08-25)
Re-reviewing repairs AFTER a fix-pack lands measures against a moved bar: 8/15 residual verdicts cited brand-new fix-pack rules the repairs predate. Methodological consequence: repair pipelines and prompt fix-packs interact — a repair's grade is only meaningful against the hash it was made under, and once a pack covers a defect family, re-parse-at-new-hash strictly dominates hand-repair for that family (cheaper, blind, clean provenance). The bounded repair loop terminated at round 1 with zero second repairs: every residual routed to re-parse, exclusion, registered-gap acceptance, or owner escalation — evidence that "loop until pass" is the wrong frame and "loop until disposition" is the right one.

## §20 — Item E: the miner generalization and what recovered the two-star miss (2026-08-25)
Three design decisions carried the M4 pass. (1) **Factor granularity at the pair level, not a new unit shape**: the wave-1 unit machinery is kept verbatim (its keys double as the study's "joint keys"), and factoring re-partitions the pair's pooled diff into connected components under a pair-global naming — components that JOIN across units recover cross-star correspondences (CoAgent ↔ distributed twin-event), components that SPLIT bundled unit diffs are the loop-2 fix; one mechanism, both directions. The connective calculus matters: matched-EVENT centers are inert (else within-unit factoring is a no-op), matched-entity centers connect (else converse role-swaps shatter), lone centers and content constants connect. (2) **Matched-satellite class lifting**: a lone twin-event star drags its scenario fillers into the diff; classes annotated on cross-side-MATCHED satellites are context, not content, and lift to K-variables even when one-sided — genuine lexical candidates (box/crate) are argument constants and stay verbatim. Without this the CoAgent factor splits into support-1 scenario keys. (3) **The §4 trap discipline held empirically**: the bare Agent↔Recipient role-swap factor appeared at support 11 and was correctly quarantined (never sole-diff-attested); promotability = sole-diff attestation + control-clean is the load-bearing gate. Note the answer-key label itself was wrong about the parse reality (no GroupOf atom exists — #21 distributes the coordination); recovery required explaining the target, not matching its name. Miner side: connectivity via shared content constants (not just skolems) is what makes the twin-event 2-conjunct pattern reachable, and it lands as the corpus's top-nisurp pattern (7.41) — the surprisingness channel independently ranks the M4 target first. D.3 mechanization: only prompt-NAMED verbs enter the determined-role table (the open affectedness test stays judgment); first catches were cancel/call_off Theme-parses — exactly fix-pack B2's target family, now flagged mechanically. hyperon-miner spike: corroboration where it runs (24/24 counts on the single-head fragment), non-serviceability at master (entry-path arity skews ×2, multi-head → silently empty) — the "faithful to the conception as written, not to the living implementation" framing was the right call.

## §21 — The question arm as instrument: what the differential actually bought (2026-08-25)
Item F's design decisions paid off in exactly the intended ways. (1) **The differential contract held**: same query on both KBs meant 21/40 literal no-binds indicted neither arm, zero control fabrication, zero monotonicity violations — so the 5 bridge payoffs are clean attributions (each to a named mined rule), not artifacts of query luck. (2) **Blindness placement is the measurement**: QGEN blind to parse vocabulary makes the 10/40 natural-rewording inventory-hit rate an unbiased #33 coverage statistic (an illustration pair inside the brief had to be swapped out pre-freeze — bridge-pair examples would have contaminated it); QPARSE blind to sentences is what makes paraphrastic questions probative at all. (3) **The archival-substrate question arm doubles as a standard-drift detector**: ~8/17 brittleness rows are current-doctrine queries (B2 occurrence-Patient, FP3 obliques, S1 reified states) failing against 64ad2464-era parses — §19's drift phenomenon, now measured from the QA side, with a concrete falsifiable prediction for H's re-parsed substrate. (4) **Per-conjunct census turns "unfired" into "one conjunct short"**: the structural light-verb and idiom bridges DID carry lemma+roles; the misses localize to an oblique token, a measure-dimension token, an improvised head — and the one systematic absence is FRAME-REMAPPING rules (find_out→discover fires, Experiencer/Stimulus→Agent/Theme does not), a rule species wave-1's slot-merge signals gestured at and nothing yet emits. Also two new normalization species: surface↔structured time (noon vs (Hour 12)), measure-dimension synonyms (age/old). (5) **Probe semantics need their own contract**: a probe query without $ans was misread as failure because run_query conflated bind-status with answer extraction — arms unaffected, all probe-derived attributions rerun; the lesson generalizes (every mechanical probe deserves a smoke test of ITS return contract, not just the happy path). (6) The engine And-prover bug now has a question-level cost: 13/80 rows, incl. one confirmed suppressed payoff — the item-X dividend is quantified in QA terms.

## §22 — G.5/G.6: grading and the fairness of the null (2026-08-25)
Two owner decisions close the pre-flight. (1) The graded-lexical-bridge route is REGISTERED, and the shape matters: grading is confined to the BRIDGING species with the judge's ceiling becoming the implication's strength and a per-rule M2 adversarial-control gate — so the system can hold "wreck weakly entails destroy" without ever letting a weak rule merge a meaning-different pair silently. The demand-side evidence came from item F's blind writers (their natural rewordings — obtain/acquire, stroll/walk — are exactly the near-synonym mass a binary gauntlet discards), which is the right provenance direction: the QA layer told the rule layer what it needs, not vice versa. (2) The MRPC arm exists because of an interpretability argument, not a coverage one: PAWS is adversarial-by-construction (high overlap, low lexical variation — measured again in the build: PAWS ~87% identical-bag vs MRPC 0/125), so a convergence null on PAWS alone cannot distinguish "density hypothesis false" from "test surface blind to lexical rules". Adding one lexically-fair surface makes H's headline measurement falsifiable in both directions. Quora was rejected on type grounds (questions, not statements) — and flagged as future question-arm material, which is its own small lesson: pair sources have TYPES, and the M-metric a source feeds must match the parse species it exercises.
