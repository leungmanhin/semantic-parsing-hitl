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
- Caps: 30 concurrent subagents, 600 per session lifetime.
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

## Historical note

Batch-1 wrappers followed the two-sentence pattern above with minor wording drift across
waves; the drifted wordings were not preserved. The parts with behavioral surface — the
briefs and `prompt.txt` — were byte-identical within every wave and are pinned in the
records. From batch 2 on, the wrapper form in §2 is normative. The §5.2 reviewer ran only
demand-driven in batch 1; `REVIEW.md` + the section above make it standing from batch 2.
