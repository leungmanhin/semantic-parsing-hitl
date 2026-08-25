# Parse dispatch — what a blind parse agent sees (the standard)

Orchestrator-facing. The agent-facing briefs (`PARSE.md`, `REPARSE.md`, `M1PARSE.md`,
`SOLOPARSE.md`) are read by the agents themselves and must stay byte-stable; anything the
agents should NOT see — dispatch mechanics, ops parameters, historical notes — belongs here.

## The context stack

A parse agent is a fresh `general-purpose` subagent, model **sonnet** (the resolved id is
recorded per record as `parser.model`, e.g. `claude-sonnet-5`). It sees, in order:

1. **Harness scaffolding** — the CLI's own subagent system prompt. Not ours to pin, but
   identical across a wave by construction.
2. **The dispatch wrapper** (the Agent-tool `prompt`) — two sentences, nothing else:

       Read /home/manhin/Dev/semantic-parsing-hitl/fusenf/PARSE.md and follow it exactly.
       Your batch file is /home/manhin/Dev/semantic-parsing-hitl/fusenf/parse_batches/<batch>.txt.

   For the multi-run briefs (`M1PARSE.md`, `SOLOPARSE.md`) add exactly one more line:
   `Run number: <N>.` — and for `SOLOPARSE.md` the item line `<ID>\t<TEXT>` replaces the
   batch-file sentence. **No role framing, no format restatement, no examples**: anything
   with parse-behavior surface lives in `prompt.txt` or the brief, never in the wrapper.
3. **The brief** (the agent reads it) — I/O mechanics and blindness rules only: read
   `prompt.txt` in full, read nothing else in the repo, no web, write atoms straight to
   `raw/<ID>__run<N>.txt`, no prose/fences, items independent, no context supplied.
4. **`prompt.txt`** (the agent reads it IN FULL) — the complete and only translation
   instruction set. Pinned per record as `parser.prompt_sha256`. (`parser.seeded_sha256`
   pins the `seeded_rules.metta` environment for downstream provenance; the parse agent
   itself never reads that file.)
5. **The batch file** — `<ID>\t<TEXT>` lines. **The only content that varies between
   agents of a wave** (plus the run number, where applicable).

So: fixed across a wave = scaffolding + wrapper shape + brief + prompt.txt; variable =
the sentences (and run number). "Same content except the sentences" is then *verifiable*,
not just intended: every parse record carries `parser.prompt_sha256` + `input_sha256`.

## Briefs

| brief | use | output file |
|---|---|---|
| `PARSE.md` | standard run-1 batch parse | `raw/<ID>__run1.txt` |
| `REPARSE.md` | run 2 over the same items (never touches run 1) | `raw/<ID>__run2.txt` |
| `REPARSE_run40.md` | batch-2 Tier C uniform-hash wave (D.4; run 40 avoids the fix-loop's 2–8 and the audit wave's 30) | `raw/<ID>__run40.txt` |
| `REPARSE_run50.md` | batch-3 re-parse wave (130 fix-pack-covered defect records @ `bb7c4b71`; wave manifest `parse_batches/reparse50_wave.json`) | `raw/<ID>__run50.txt` |
| `M1PARSE.md` | M1 stability runs, run number in wrapper | `raw/<ID>__run<N>.txt` |
| `SOLOPARSE.md` | one item per agent (within-batch-contamination isolation) | `raw/<ID>__run<N>.txt` |

## Context

Batch-1 corpora carry no context (`context` fields all null/empty), and the briefs assert
this ("No CONTEXT / TODAY / DOMAIN is supplied"). If a future corpus supplies context, the
batch format needs a per-item context field and the brief a matching paragraph — present it
in the `TEXT:`/`CONTEXT:` input form `prompt.txt` §context (#18) already defines. Do not
bolt context into the wrapper.

## Ops parameters (batch-1 lessons; binding until superseded)

- **5-item load-balanced batches** — longer items to smaller batches; oversized batches die
  at the agent's 64k output-token ceiling.
- **Fleets in ~8-agent sub-groups**, not all at once (server-side rate-limit bursts).
- On a rate-limit burst: **stop dispatching, let in-flight agents terminate, then ONE
  recovery pass rebuilt from the disk diff** (`raw/` files present vs the batch manifest).
  Never per-batch retries mid-burst.
- Caps: 30 concurrent subagents. (The 600/session-lifetime cap was RETIRED upstream;
  empirically confirmed no-op 2026-08-24 — launches 601–650 all succeeded. Budget
  planning no longer needs the per-session ledger; keep the concurrency discipline.)
- Agents write files and reply "done" at most — atoms never travel through the reply
  channel. Extraction + validation is mechanical downstream (`harness/validator.py`,
  C1–C8; per-record `extraction.strip_log` keeps what was stripped).

## Review dispatch (schema.md §5.2 — standing from batch 2)

Batch 1 ran the §5.2 reviewer only demand-driven (M1 diagnoses, triage). From batch 2 it is a
standing sampled pass. Brief: `REVIEW.md`. Wrapper, same discipline as parsing:

    Read /home/manhin/Dev/semantic-parsing-hitl/fusenf/REVIEW.md and follow it exactly.
    Your batch file is /home/manhin/Dev/semantic-parsing-hitl/fusenf/review_batches/rv-NN.txt.
    Run number: <N>.

- **Model: `opus`** — deliberately a different tier than the Sonnet parser. A same-model
  reviewer shares the parser's blind spots and re-approves its own misreading; a cross-model
  reviewer is a decorrelated draw. Recorded per verdict file at ingestion.
- **Reviewers are blind to validator findings.** Showing a reviewer the C4 hint anchors the
  judgment; instead REVIEW.md's Q4 (licensed heads) asks the question neutrally over every
  head, and the orchestrator joins verdicts against `validation.findings` mechanically
  afterwards. Agreement/disagreement on flagged heads falls out of the join, unanchored.
- **Coverage exception (owner, 2026-08-26): 100% review for `tierD` (all 250) and the
  run-50 re-parse wave (all 130)** — tierD feeds the M2 measurement arm with no
  downstream gauntlet gate, and every run-50 record carries an elevated defect prior
  plus the pack-coverage verification claim. Review waves for these run in groups WITH
  OWNER QUOTA PAUSES between phases (owner instruction). Tier-B-scale corpora stay on
  the strata below.
- **Sampling policy** (orchestrator-side), four strata:
  1. 100% of records with any mechanical finding;
  2. **review-by-provenance: 100% of records cited as evidence by a rule candidate,
     reviewed BEFORE the candidate enters the gauntlet.** The review gates the candidate,
     not just the record — mining runs over the unreviewed corpus freely; the review debt
     comes due the moment a record's parse is about to justify a rule. A record that fails
     review goes to triage (reparse or wontfix + substrate-exclusion), and the candidate's
     support is recomputed without it: still above threshold → proceeds with the evidence
     change logged; below → suspended with a ledger entry, never silently dropped.
  3. ≥10% uniform random of clean records — the defect-rate estimator, not certification.
     Escalation: sampled defect rate > ~5% → widen the sample and consider majority-of-N
     parsing (`metrics.md` M1) before trusting the corpus further;
  4. anything triage marks `open`.
  Weighting toward unseen construction types stays a manual orchestrator call until there
  is a construction tagger.
- **Review substrate is `raw/<ID>__run<N>.txt`**, not the assembled JSONL — the reviewer must
  not see neighboring records or validation blocks, and extraction only strips non-semantic
  wrappers, so the raw bytes are the faithful parse.
- Ingestion is deterministic: verdicts join triage by id; `q2_gaps` feed the prompt loop;
  `q1_issues`/`q4_unlicensed_heads` set triage dispositions. Reviewers never edit parses
  (never-auto-repair-content applies to reviewers too).
- Batching: 5-item batches (`review_batches/rv-NN.txt`, same TSV as parse batches), fleets in
  ~8-agent sub-groups, same burst discipline as parsing.

## Adjudication dispatch (the review-gate adjudicator — piloted 2026-08-24)

Brief: `ADJUDICATE.md`. Sits between a blind review verdict and any repair: confirms or
REFUTES each reviewer issue against prompt.txt (refute-don't-obey), then either accepts
the parse or writes a minimal repair. Wrapper:

    Read /home/manhin/Dev/semantic-parsing-hitl/fusenf/ADJUDICATE.md and follow it exactly.
    Your batch file is /home/manhin/Dev/semantic-parsing-hitl/fusenf/adjudication_batches/aj-NN.txt.
    Run number: <N>. Output tag: <TAG>.

- **Model: decided by the dual-tier pilot** (30 records × Opus and Fable, scored against
  the owner's 20 ground-truth adjudications in `review_batches/adjudication_sample.json`;
  the deference test — refutation behavior on owner-acceptable records — picks the
  production tier). Output tag = the model name, so tiers never collide.
- **Isolation**: the adjudicator sees prompt.txt + sentence + parse + review verdict and
  NOTHING else — no validator findings (13%-precision C4 would anchor), no triage, no
  manifests (the owner's ground-truth calls live in a manifest and must stay unseen).
- **The owner's calibration line is baked into the brief** (2026-08-24): improvisation in
  gap territory is acceptable iff every atom is true and well-typed; false/ill-typed/
  over-asserted content is a defect regardless of coverage.
- Repairs land in `adjudication/` as pilot artifacts, NEVER in `raw/` — promotion to a
  new run in the parse store is an explicit later step, so provenance stays clean
  (a promoted repair is flagged non-blind).
- Batching: 5-item batches, same TSV and group discipline as review.

## Diagnosis dispatch (M1 judgment buckets — standing from batch 2)

Batch 1 ran M1 disagreement diagnosis with ad-hoc wrappers over `m1_disagreements.py`
dumps; `DIAGNOSE.md` is now the standing brief. Mechanical prep first, judgment second:

    harness/m1_stability.py         -> buckets what it can (tv-only, canonicalizer, …)
    harness/m1_disagreements.py --jsonl dump.jsonl --bucket unclassified
                                    -> sentence + canonical terms + diff per pair
    diag_batches/dg-NN.txt          -> <ID>\t<runA>\t<runB>, ~5 pairs per agent

Wrapper:

    Read /home/manhin/Dev/semantic-parsing-hitl/fusenf/DIAGNOSE.md and follow it exactly.
    Your batch file is /home/manhin/Dev/semantic-parsing-hitl/fusenf/diag_batches/dg-NN.txt.
    The dump file is /home/manhin/Dev/semantic-parsing-hitl/fusenf/<dump path>.

- **Model: `opus`** — same decorrelation argument as review: a same-family diagnostician can
  share the exact bias that produced the wobble. (Batch-1 diagnosis used Sonnet ad hoc; its
  verdicts stand as recorded in `eval/m1_tierC_diagnosis.md`.)
- **Coverage: 100% of `unclassified` pairs** — this is the judgment residue after mechanical
  bucketing, small by construction (Tier C round 1: 25 pairs). No sampling.
- Ingestion is deterministic: `underdetermined` verdicts group by `missing_decision` and rank
  by frequency = the prompt fix-round worklist; `garbled` → corpus triage; `different_readings`
  → #48 evidence; `determined`+`winner` → error-rate bookkeeping. Verdicts never edit parses.

## Judge dispatch (P4 gauntlet — standing from batch 2; brief authored 2026-08-19)

Brief: `JUDGE.md`. Wrapper:

    Read /home/manhin/Dev/semantic-parsing-hitl/fusenf/JUDGE.md and follow it exactly.
    Your cards file is /home/manhin/Dev/semantic-parsing-hitl/fusenf/rules/probes<N>/cards_<batch>.json.
    Write your votes to /home/manhin/Dev/semantic-parsing-hitl/fusenf/rules/probes<N>/votes_<batch>_<judge>.jsonl.

- **Model: `sonnet`, panels of 3 (majority vote).** The judged content is English
  sentences, not model-generated parses, so the decorrelation argument that made the
  reviewer and diagnostician Opus does not apply; batch-1 Sonnet panels calibrated well
  (6/7 vs lexicographic ground truth, and they beat the seed table three times).
  Escalation on a 2-1 split over a high-stakes candidate: widen to 5 or add one Opus
  adjudicator — orchestrator's call, logged.
- **Card-construction discipline** (orchestrator-side; the brief cannot enforce these):
  cards carry **no provenance** — no miner name, no support counts, no confidence, no
  sibling candidates (anchoring); a **factored-edit card must not show the joint diff it
  was factored from** (the joint key is its own separate card); examples are natural
  sentences from the cited corpus records, at least two per card.
- The 5 authoring requirements accumulated during the walk-through are discharged into
  the brief: per-family question sets via the card `task` field (req 1); the register
  rule and the full loss taxonomy as brief text with worked calibration examples
  (reqs 2+3); the judge-the-rule-not-the-examples doctrine + the bare-converse
  calibration line + `defeaters` (req 4); `task: grade` **REGISTERED for the H gauntlet**
  (owner decision G.5, 2026-08-25): graded cards for lexical-equivalence BRIDGING
  candidates only (never consolidation/packs); the judge ceiling (≤0.8) becomes the
  implication's strength, confidence stays support-based; every graded rule must pass
  the M2 adversarial control gate (zero induced control merges) before the ledger keeps
  it (req 5).
- **Audit trail**: `harness/ledger_view.py` renders the complete ledger — every candidate,
  every mech gate, every vote verbatim, final routing — to `eval/rule_ledger.md`.
  Regenerate after every gauntlet round.

## M5 question-arm dispatch (QGEN + QPARSE — standing from item F, 2026-08-25)

Two waves per run; both briefs frozen (sha256 in `questions/manifest.json`) before any
dispatch. Wrappers, same two-sentence discipline:

    Read /home/manhin/Dev/semantic-parsing-hitl/fusenf/QGEN.md and follow it exactly.
    Your batch file is /home/manhin/Dev/semantic-parsing-hitl/fusenf/question_batches/qg-NN.txt.

    Read /home/manhin/Dev/semantic-parsing-hitl/fusenf/QPARSE.md and follow it exactly.
    Your batch file is /home/manhin/Dev/semantic-parsing-hitl/fusenf/question_batches/qp-NN.txt.

- **Model: `sonnet` for both.** QGEN judges English (the JUDGE argument — no decorrelation
  need); QPARSE writes queries in the parser's own conventions (parser-tier task).
- **Blindness is the measurement**: QGEN sees sentences ONLY (no prompt.txt — parse
  vocabulary would anchor its paraphrase choices; its rewording choices are the sample of
  natural paraphrase space that makes this the #33 measurement). QPARSE sees questions
  ONLY (never the sentence — seeing it would let the query re-borrow sentence vocabulary
  and erase the paraphrastic signal) and reads prompt.txt in full (the representation's
  single source of truth; QPARSE.md adds only question-side mapping, so there is no
  schema fork and no parse-hash impact).
- Record sampling is orchestrator-side and mechanical (bridge-covered + control strata,
  deterministic); writers never know which stratum a sentence is in.
- QGEN outputs `questions/<ID>.q.json`; mechanical validation drops/flags items whose
  `answer` is not a verbatim substring of the sentence (accounted, never edited). QPARSE
  outputs `queries/<QID>.query.txt`, one s-expression each.
- The harness (`harness/m5_questions.py`, PeTTaChainer env) is agent-free: same query on
  both KB arms (faithful / faithful+bridges), structural `$ans` extraction, answer check
  against the QGEN gold, engine-bug conjunct-drop triage, `query-brittleness` bucket for
  one-sided binds and malformed queries.
- Batching: 5-item batches, ~8-agent groups, burst discipline as parsing.

## Brief inventory (every agent role; nothing runs briefless from batch 2 on)

| agent role | brief | status |
|---|---|---|
| batch parse, run 1 | `PARSE.md` | standing |
| re-parse, run 2 | `REPARSE.md` | standing |
| M1 stability runs | `M1PARSE.md` | standing |
| one-sentence-per-agent parse | `SOLOPARSE.md` | standing |
| Tier A corpus realization | `corpora/REALIZE.md` | standing (P2-era, still the standard) |
| §5.2 parse reviewer | `REVIEW.md` | standing from batch 2 |
| review-gate adjudicator | `ADJUDICATE.md` | authored 2026-08-24; dual-tier pilot decides the production model |
| M1 disagreement diagnosis | `DIAGNOSE.md` | standing from batch 2 |
| gauntlet judges (M4 / routing) | `JUDGE.md` | standing from batch 2 (authored 2026-08-19) |
| M5 question writer | `QGEN.md` | standing from item F (authored 2026-08-25) |
| M5 question→query parser | `QPARSE.md` | standing from item F (authored 2026-08-25) |

Agent-free by design (no brief will ever exist): canonicalization, star decomposition,
M2/M3 measurement, M5 query instantiation + differential comparison, consolidation rewriting,
majority-of-N voting, all miners' counting/thresholding. One-off closed contracts: the #48
pilot (`pilot48/ADDENDUM.md`) and the batch-1 PAWS control-pair dissection (recorded in
`eval/m2_heldout.md`; future instances = the judge family).

## Historical note

Batch-1 wrappers followed the two-sentence pattern above with minor wording drift across
waves; the drifted wordings were not preserved. The parts with behavioral surface — the
briefs and `prompt.txt` — were byte-identical within every wave and are pinned in the
records. From batch 2 on, the wrapper form in §2 is normative. The §5.2 reviewer ran only
demand-driven in batch 1; `REVIEW.md` + the section above make it standing from batch 2.
