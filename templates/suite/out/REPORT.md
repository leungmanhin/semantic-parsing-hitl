# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 4045b2ad4809e7e7) · type check: ran

## Catalog checks

124 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `activity` ← transfer: "Yusra gave up."

## perception — held_out

12 cases, 36 records (ok 36; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/9
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (12 cases, 36 pairs), unanimous 12/12
- type check: 36/36 emitted parses type
- graph lints: none
- usage: 36 calls · in 497,493 · out 4,489 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra saw the point." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Teodor felt tired." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra fears the ferret." (target `psych`): r1 target_fired [named-entity×1, psych×1, witness×1] · r2 target_fired [named-entity×1, psych×1, witness×1] · r3 target_fired [named-entity×1, psych×1, witness×1]

Mismatches: none
