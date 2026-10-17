# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 6cf313445a0a101e) · type check: ran

## Catalog checks

88 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `possession` ← acquisition: "Ottoline owns the quilt."
- `perception` ← psych: "Teodor saw the ferret."; psych: "Teodor heard the news."
- `activity` ← transfer: "Yusra gave up."

## acquisition — held_out

12 cases, 36 records (ok 36; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 3 | 9 | 9 | 9 | 9 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/12
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (12 cases, 36 pairs), unanimous 12/12
- type check: 36/36 emitted parses type
- graph lints: none
- usage: 36 calls · in 389,835 · out 4,418 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline owns the quilt." (target `possession`): r1 pending_unmapped [named-entity×1; unmapped G00] · r2 pending_unmapped [named-entity×1; unmapped G00] · r3 pending_unmapped [named-entity×1; unmapped G00]
- "Teodor won the race." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra got tired." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine sold the spindle to Teodor." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none
