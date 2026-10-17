# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 7ebc2160e3f1d78f) · type check: ran

## Catalog checks

142 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `motion` ← activity: "Yusra went to the market."; activity: "Teodor arrived."
- `change-of-state` ← activity: "The ladder broke."
- `creation` ← activity: "Teodor built a shed."

## activity — held_out

14 cases, 42 records (ok 42; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/15
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (14 cases, 42 pairs), unanimous 14/14
- type check: 39/39 emitted parses type
- graph lints: none
- usage: 42 calls · in 623,658 · out 4,126 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra tried to sleep." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Teodor arrived." (target `motion`): r1 pending_unmapped [named-entity×1; unmapped G00] · r2 pending_unmapped [named-entity×1; unmapped G00] · r3 pending_unmapped [named-entity×1; unmapped G00]
- "Yusra had a rest." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "The ladder broke." (target `change-of-state`): r1 pending_unmapped [nothing fired; unmapped G00] · r2 pending_unmapped [nothing fired; unmapped G00] · r3 pending_unmapped [nothing fired; unmapped G00]
- "Teodor built a shed." (target `creation`): r1 pending_unmapped [named-entity×1; unmapped G00] · r2 pending_unmapped [named-entity×1; unmapped G00] · r3 pending_unmapped [named-entity×1; unmapped G00]

Mismatches: none
