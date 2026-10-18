# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 000098f3bba48980) · type check: ran

## Catalog checks

233 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `change-of-state` ← activity: "The ladder broke."; copular: "Teodor became a locksmith."; motion: "The price fell."
- `creation` ← activity: "Teodor built a shed."

## motion — held_out

15 cases, 45 records (ok 45; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 33/33 · abstain cases false fires 0/12
- fill: exact 33/33 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 42/42 emitted parses type
- graph lints: none
- usage: 45 calls · in 949,641 · out 5,004 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra came to like the quilt." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "The price fell." (target `change-of-state`): r1 pending_unmapped [nothing fired; unmapped G00] · r2 pending_unmapped [nothing fired; unmapped G00] · r3 pending_unmapped [nothing fired; unmapped G00]
- "Teodor made a trip." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine handed Teodor an envelope." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none
