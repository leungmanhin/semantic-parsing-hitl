# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 8674bf87a4b179e1) · type check: ran

## Catalog checks

36 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `communication` ← attitude: "Teodor told Ottoline that Lamine sold the spindle."; attitude: "Yusra told Teodor that Ottoline sent the quilt."; transfer: "Teodor told Ottoline the news."
- `psych` ← attitude: "Yusra distrusts Lamine."
- `acquisition` ← transfer: "Ottoline took the envelope from Lamine."
- `activity` ← transfer: "Yusra gave up."

## attitude — held_out

13 cases, 39 records (ok 39; stale prompt 27) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 2 | 6 | 6 | 6 | 6 |
| contrast | 2 | 6 | 6 | 6 | 6 |
| scoped | 4 | 12 | 12 | 12 | 12 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/12
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- usage: 39 calls · in 256,335 · out 6,791 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline wants to send the quilt." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra knows Lamine." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Teodor wonders whether Lamine sold the spindle." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra told Teodor that Ottoline sent the quilt." (target `communication`): r1 pending_unmapped [named-entity×3; unmapped G00] · r2 pending_unmapped [named-entity×3; unmapped G00] · r3 pending_unmapped [named-entity×3; unmapped G00]

Mismatches: none

## transfer — held_out

9 cases, 27 records (ok 27; stale prompt 18) · gemini-4-argon effort=low

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
- usage: 27 calls · in 149,478 · out 3,577 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine paid Yusra a visit." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra gave up." (target `activity`): r1 pending_unmapped [named-entity×1; unmapped G00] · r2 pending_unmapped [named-entity×1; unmapped G00] · r3 pending_unmapped [named-entity×1; unmapped G00]
- "Teodor told Ottoline the news." (target `communication`): r1 pending_unmapped [named-entity×2; unmapped G00] · r2 pending_unmapped [named-entity×2; unmapped G00] · r3 pending_unmapped [named-entity×2; unmapped G00]

Mismatches: none
