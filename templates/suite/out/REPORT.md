# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 43caf6785635a5b8) · type check: ran

## Catalog checks

71 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `perception` ← psych: "Teodor saw the ferret."; psych: "Teodor heard the news."
- `acquisition` ← transfer: "Ottoline took the envelope from Lamine."
- `activity` ← transfer: "Yusra gave up."

## psych — held_out

13 cases, 39 records (ok 39; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 2 | 6 | 6 | 6 | 6 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/12
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- usage: 39 calls · in 376,194 · out 4,715 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline is afraid of the ferret." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra fears that Lamine sold the spindle." (target `attitude`): r1 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r2 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r3 target_fired [attitude×1, named-entity×2, transfer×1, witness×1]
- "Teodor heard the news." (target `perception`): r1 pending_unmapped [named-entity×1; unmapped G00] · r2 pending_unmapped [named-entity×1; unmapped G00] · r3 pending_unmapped [named-entity×1; unmapped G00]
- "Lamine enjoys sending quilts." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

Mismatches: none
