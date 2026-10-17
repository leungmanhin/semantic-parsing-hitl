# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 e3d200dab1a94aef) · type check: ran

## Catalog checks

53 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `psych` ← attitude: "Yusra distrusts Lamine."
- `acquisition` ← transfer: "Ottoline took the envelope from Lamine."
- `activity` ← transfer: "Yusra gave up."

## communication — held_out

12 cases, 36 records (ok 36; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/9
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (12 cases, 36 pairs), unanimous 12/12
- type check: 36/36 emitted parses type
- graph lints: none
- usage: 36 calls · in 303,468 · out 6,461 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 1
  - P00 · transfer · r1 "Yusra told Teodor that Lamine might lend Ottoline the trowel.": The tense slot is required on predications, but the instructions do not specify which tense value to use when the clause is governed by a modal auxiliary like 'might'.

Abstain cases (what the parser did, per run):
- "Yusra gave Ottoline a call." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Lamine handed Teodor an envelope." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]
- "Teodor asked Ottoline to send the quilt." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]

Mismatches: none
