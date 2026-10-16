# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 202a40b842f6568c) · type check: ran

## Catalog checks

19 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `acquisition` ← transfer: "Ottoline took the envelope from Lamine."
- `activity` ← transfer: "Yusra gave up."
- `communication` ← transfer: "Teodor told Ottoline the news."

## transfer — held_out

9 cases, 27 records (ok 27; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 2 | 6 | 6 | 6 | 6 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 18/18 · abstain cases false fires 0/9
- fill: exact 18/18 among fires
- stability: pairwise agreement 1.0 (9 cases, 27 pairs), unanimous 9/9
- type check: 27/27 emitted parses type
- graph lints: none
- usage: 27 calls · in 134,628 · out 3,636 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine paid Yusra a visit." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra gave up." (target `activity`): r1 pending_unmapped [named-entity×1; unmapped G00] · r2 pending_unmapped [named-entity×1; unmapped G00] · r3 pending_unmapped [named-entity×1; unmapped G00]
- "Teodor told Ottoline the news." (target `communication`): r1 pending_unmapped [named-entity×2, witness×1; unmapped G00] · r2 pending_unmapped [named-entity×2, witness×1; unmapped G00] · r3 pending_unmapped [named-entity×2, witness×1; unmapped G00]

Mismatches: none
