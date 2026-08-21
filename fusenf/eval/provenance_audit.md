# Retroactive provenance audit — batch-2 item A (2026-08-21)

Records cited by validated rules: 234, all reviewed via `REVIEW.md` (Opus, 47 batches, 0 losses). Verdicts absent: 0.

**Classification** (evidence failure is per (record, citing-rule), not per record):
- hard misparse (q1 no): **2** — fails as evidence for every citing rule;
- evidence-relevant partial (issues touch the citing rule's content): **33**;
- incidental partial (real doctrine findings, unrelated to the citing rule): **65** — routed to triage/prompt loop, NOT evidence failures;
- legacy-syntax artifact (q4 = Premises/Conclusions on pre-migration parses): **5** — known migration, mechanically converted downstream; not failures;
- non-legacy invented heads: **0**.

## Hard misparses
- **tierC-000001** (cited by rc0044):
  - (Result sk_cease_1 sk_french_1) inverts the sentence — it says the ceasing produced the state of being French, when the sentence says that state ends.
  - The french state is reified and asserted positively at top level (with its Experiencer at index 12) with no Past, no strength-0 denial and nothing marking it as the ceased state, so the parse claims the people are French.
  - The cease event carries only (Patient sk_cease_1 sk_people_1) and no Theme naming the ceased eventuality, unlike the inceptive mirror pattern where Theme is the activity's own witness.
  - "would cease" is future-in-the-past and the instruction set maps "would V" to Future, but the parse marks it (Past sk_cease_1).
  - The whole "Once X had ..., Y would ..." conditional is asserted flat as two occurred past events plus a Before ordering, so the parse claims both clauses actually happened.
  - The two parallel flat copular atoms are treated inconsistently — (Member sk_people_1 indigenous) is bare while the parallel french atom at index 14 is wrapped in Past.
- **tierC-000405** (cited by r30002):
  - The Implication contains no variables at all - its premises are ground atoms over sk_maintain_1 / sk_rate_1, which are asserted nowhere in the parse, so the rule can never fire and the sentence's only claim is unretrievable; the instruction
  - "the results" is a presupposed definite plural, but its (GroupOf sk_result_1 result) typing sits inside the rule's consequent, so the group exists only if the (unfirable) rule fires rather than standing as an asserted fact.
  - The plural descriptive modifier "comparable" is predicated of the group witness as (Member sk_rate_1 comparable) instead of distributing over the members like a copular predicate, and "the results are high" likewise gets no distributive rul

## Per-rule surviving evidence (failures = hard + relevant-partial + invented-head)
| rule | kind | cited | failed | survives | note |
|---|---|---|---|---|---|
| ae0046 | lexical-collapse | 4 | 1 | 3 | failed: tierA-000378 |
| mn0003 | subtree-collapse | 3 | 1 | 2 | failed: tierA-000208 |
| mn0008 | subtree-collapse | 3 | 2 | 1 | failed: tierB-000016, tierB-000081 |
| mn0009 | subtree-collapse | 3 | 1 | 2 | failed: tierB-000034 |
| mn0011 | subtree-collapse | 3 | 1 | 2 | failed: tierA-000186 |
| r30002 | lexical-collapse | 2 | 1 | 1 | failed: tierC-000405 |
| r30009 | role-canonicalization | 2 | 1 | 1 | failed: tierC-000565 |
| r30011 | role-canonicalization | 7 | 2 | 5 | failed: tierC-000230, tierC-000513 |
| r30013 | role-canonicalization | 3 | 1 | 2 | failed: tierC-000454 |
| rc0010 | structural-alt | 6 | 4 | 2 | failed: tierA-000186, tierA-000187, tierA-000191, tierA-000192 (4 pair-shared, cancel in diff) |
| rc0012 | lexical-collapse | 6 | 1 | 5 | failed: tierA-000327 |
| rc0013 | lexical-collapse | 5 | 2 | 3 | failed: tierA-000143, tierA-000144 (2 pair-shared, cancel in diff) |
| rc0015 | lexical-collapse | 5 | 2 | 3 | failed: tierA-000128, tierA-000130 |
| rc0016 | lexical-collapse | 5 | 2 | 3 | failed: tierA-000085, tierA-000090 |
| rc0017 | lexical-collapse | 5 | 5 | 0 | all failures pair-shared -> **diff evidence stands** (shared systematic error cancels); records to re-parse queue |
| rc0023 | structural-alt | 6 | 1 | 5 | failed: tierA-000208 |
| rc0024 | structural-alt | 6 | 1 | 5 | failed: tierA-000208 |
| rc0025 | structural-alt | 5 | 3 | 2 | failed: tierA-000185, tierA-000186, tierA-000191 (2 pair-shared, cancel in diff) |
| rc0026 | structural-alt | 5 | 3 | 2 | failed: tierA-000185, tierA-000187, tierA-000192 (2 pair-shared, cancel in diff) |
| rc0033 | lexical-collapse | 4 | 1 | 3 | failed: tierC-000338 |
| rc0035 | structural-alt | 4 | 2 | 2 | failed: tierA-000174, tierA-000178 |
| rc0044 | role-canonicalization | 8 | 1 | 7 | failed: tierC-000001 |
| rc0046 | role-canonicalization | 3 | 1 | 2 | failed: tierA-000144 |
| rc0047 | role-canonicalization | 9 | 2 | 7 | failed: tierA-000143, tierA-000388 |
| rc0048 | role-canonicalization | 4 | 1 | 3 | failed: tierB-000038 |
| rc0050 | role-canonicalization | 2 | 1 | 1 | failed: tierB-000004 |
| rc0052 | role-canonicalization | 5 | 3 | 2 | failed: tierA-000174, tierA-000178, tierA-000182 |
| *(rules with zero failures omitted)* | | | | | |

## Incidental partials — the corpus-quality harvest (65)
Genuine per-record doctrine findings (role choice, futurate rule, world-knowledge emission, …) that do not touch their citing rules' content. These feed the triage/prompt loop as reviewer output — the largest single harvest of parse-quality findings to date. Verdict files in `review/` carry the details; ids:
tierA-000009, tierA-000010, tierA-000011, tierA-000016, tierA-000017, tierA-000018, tierA-000062, tierA-000063, tierA-000064, tierA-000067, tierA-000068, tierA-000080, tierA-000086, tierA-000089, tierA-000091, tierA-000129, tierA-000223, tierA-000228, tierA-000237, tierA-000241, tierA-000242, tierA-000245, tierA-000246, tierA-000253, tierA-000254, tierA-000257, tierA-000258, tierA-000328, tierB-000005, tierB-000018, tierB-000043, tierB-000075, tierB-000089, tierB-000098, tierC-000025, tierC-000026, tierC-000045, tierC-000046, tierC-000047, tierC-000048, tierC-000071, tierC-000072, tierC-000075, tierC-000076, tierC-000158, tierC-000159, tierC-000160, tierC-000227, tierC-000228, tierC-000229, tierC-000237, tierC-000238, tierC-000284, tierC-000291, tierC-000292, tierC-000337, tierC-000355, tierC-000356, tierC-000381, tierC-000382, tierC-000406, tierC-000413, tierC-000414, tierC-000514, tierC-000538

## Calibration note (shakedown finding)
`REVIEW.md` does not define the yes/partial boundary; reviewers used `partial` for any doctrine deviation, which is defensible but makes q1 alone unusable as an evidence gate. This audit's per-rule relevance filter is the corrective layer; a boundary clarification in the brief is queued as a post-audit improvement (do not edit the brief mid-campaign — all 234 verdicts were judged under one text).

Suspension candidates: none — validated files untouched (append-only; owner decides).

## Owner dispositions (2026-08-21)

1. **r30002 stands** — judges unanimous on the compound tokens + stars corroboration; the
   hard-failed side (tierC-000405) joins the re-parse queue.
2. **defeat/play/stop role bridges RETIRED PERMANENTLY** (r30009, r30011, r30013): every
   Patient-side flip witness is a reviewer-flagged parse — clean-witness flip tallies
   defeat 1/0, play 5/0, stop 2/0. Recorded in `rules/retired.jsonl`;
   `mined_bridges_wave3.metta` regenerated 16 → **10 rules** (export_bridges3.py now
   consults the retirement ledger); full bridge stack (seeded + waves 1–3, 234 rules)
   re-smoked, loads clean. These classes may re-earn bridges only through fresh batch-2
   mining. `train`'s flip survived (1/1 clean); `finish`/`spend` had no failures.
3. **mn0008 stands** — the two failed records are 2 of 46 firings; 44 audit-clean, and
   validation rested on instance-level gates over all firings.
4. **Re-parse queue approved, executes AFTER item B** at the post-#48 prompt hash
   (`reparse_queue.txt`, 10 records) — one wave, no double-parsing.

## Re-parse wave outcome (2026-08-21, executed as item-B tail @ run 30, prompt 102bba250c11)

10/10 records re-parsed blind at the post-#48 hash, all validating clean (C1–C8 zero).
Defect-level outcomes:
- **rc0017's five records: all five now `Patient`** (the scheduled-occurrence rule the
  reviewers cited) — the shared systematic error is corrected and the diff-cancellation
  call is vindicated: the lexical contrast was never at risk.
- **tierC-000405: the Implication now carries variables** — the unfirable ground-atom rule
  is fixed; r30002's second evidence leg is restored (subject to any future re-review).
- **Retired role witnesses**: defeat (tierC-000565) and play (tierC-000513) re-parse as
  `Theme` — the original Patient attestations were parse artifacts; **retirement
  empirically vindicated**. stop (tierC-000454) re-parses as `Patient` again — plausibly
  genuine for the boxing sense ("stopped X in five rounds" = defeated); the class stays
  retired per the owner decision, and may re-earn its bridge through fresh batch-2 mining
  with clean witnesses, exactly the path the decision provided.
- tierC-000001 received a fresh judgment-based parse (validates clean; full re-review not
  in this wave's scope).
