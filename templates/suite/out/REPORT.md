# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 41b1c076c80ab3ff) · type check: ran

## Catalog checks

106 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `perception` ← psych: "Teodor saw the ferret."; psych: "Teodor heard the news."
- `activity` ← transfer: "Yusra gave up."

## possession — held_out

12 cases, 36 records (ok 36; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/12
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (12 cases, 36 pairs), unanimous 12/12
- type check: 36/36 emitted parses type
- graph lints: none
- usage: 36 calls · in 426,216 · out 4,518 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor bought the spindle from Yusra." (target `acquisition`): r1 target_fired [acquisition×1, named-entity×2, witness×1] · r2 target_fired [acquisition×1, named-entity×2, witness×1] · r3 target_fired [acquisition×1, named-entity×2, witness×1]
- "Yusra has sent the quilt." (target `transfer`): r1 target_fired [named-entity×1, transfer×1, witness×1] · r2 target_fired [named-entity×1, transfer×1, witness×1] · r3 target_fired [named-entity×1, transfer×1, witness×1]
- "Ottoline has a brother." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra has to send the quilt." (target `modal`): r1 target_fired [modal×1, named-entity×1, transfer×1, witness×1] · r2 target_fired [modal×1, named-entity×1, transfer×1, witness×1] · r3 target_fired [modal×1, named-entity×1, transfer×1, witness×1]

Mismatches: none
