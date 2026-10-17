# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 88394b9b4a867520) · type check: ran

## Catalog checks

174 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `motion` ← activity: "Yusra went to the market."; activity: "Teodor arrived."
- `change-of-state` ← activity: "The ladder broke."; copular: "Teodor became a locksmith."
- `creation` ← activity: "Teodor built a shed."
- `generic` ← kind-statement: "All ferrets are curious."; kind-statement: "Most herons are patient."
- `group` ← kind-statement: "The ferrets are curious."

## acquisition — held_out

12 cases, 36 records (ok 36; stale prompt 33) · gemini-4-argon effort=low

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
- usage: 36 calls · in 407,046 · out 4,531 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline owns the quilt." (target `possession`): r1 target_fired [named-entity×1, possession×1, witness×1] · r2 target_fired [named-entity×1, possession×1, witness×1] · r3 target_fired [named-entity×1, possession×1, witness×1]
- "Teodor won the race." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra got tired." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine sold the spindle to Teodor." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none

## activity — held_out

14 cases, 42 records (ok 42; stale prompt 42) · gemini-4-argon effort=low

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

## attitude — held_out

13 cases, 39 records (ok 39; stale prompt 36) · gemini-4-argon effort=low

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
- usage: 39 calls · in 286,125 · out 7,010 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline wants to send the quilt." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra knows Lamine." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Teodor wonders whether Lamine sold the spindle." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra told Teodor that Ottoline sent the quilt." (target `communication`): r1 target_fired [communication×1, named-entity×3, transfer×1, witness×1] · r2 target_fired [communication×1, named-entity×3, transfer×1, witness×1] · r3 target_fired [communication×1, named-entity×3, transfer×1, witness×1]

Mismatches: none

## communication — held_out

12 cases, 36 records (ok 36; stale prompt 36) · gemini-4-argon effort=low

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

## copular — held_out

13 cases, 39 records (ok 39; stale prompt 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/12
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- usage: 39 calls · in 644,202 · out 3,971 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Herons are birds." (target `kind-statement`): r1 target_fired [kind-statement×1] · r2 target_fired [kind-statement×1] · r3 target_fired [kind-statement×1]
- "Teodor is the locksmith." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Teodor seems tired." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine is fond of Yusra." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]

Mismatches: none

## kind-statement — held_out

11 cases, 33 records (ok 33; stale prompt 27) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 21/21 · abstain cases false fires 0/12
- fill: exact 21/21 among fires
- stability: pairwise agreement 1.0 (11 cases, 33 pairs), unanimous 11/11
- type check: 24/24 emitted parses type
- graph lints: none
- usage: 33 calls · in 545,340 · out 2,700 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferrets are curious." (target `group`): r1 pending_unmapped [nothing fired; unmapped G00] · r2 pending_unmapped [nothing fired; unmapped G00] · r3 pending_unmapped [nothing fired; unmapped G00]
- "Yusra is a weaver." (target `copular`): r1 target_fired [copular×1, named-entity×1] · r2 target_fired [copular×1, named-entity×1] · r3 target_fired [copular×1, named-entity×1]
- "Ferrets are widespread." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Most herons are patient." (target `generic`): r1 pending_unmapped [nothing fired; unmapped G00] · r2 pending_unmapped [nothing fired; unmapped G00] · r3 pending_unmapped [nothing fired; unmapped G00]

Mismatches: none

## perception — held_out

12 cases, 36 records (ok 36; stale prompt 36) · gemini-4-argon effort=low

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

## possession — held_out

12 cases, 36 records (ok 36; stale prompt 36) · gemini-4-argon effort=low

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

## psych — held_out

13 cases, 39 records (ok 39; stale prompt 36) · gemini-4-argon effort=low

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
- usage: 39 calls · in 396,954 · out 4,822 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline is afraid of the ferret." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra fears that Lamine sold the spindle." (target `attitude`): r1 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r2 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r3 target_fired [attitude×1, named-entity×2, transfer×1, witness×1]
- "Teodor heard the news." (target `perception`): r1 target_fired [named-entity×1, perception×1, witness×1] · r2 target_fired [named-entity×1, perception×1, witness×1] · r3 target_fired [named-entity×1, perception×1, witness×1]
- "Lamine enjoys sending quilts." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

Mismatches: none

## transfer — held_out

9 cases, 27 records (ok 27; stale prompt 21) · gemini-4-argon effort=low

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
- usage: 27 calls · in 209,058 · out 3,695 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine paid Yusra a visit." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra gave up." (target `activity`): r1 target_fired [activity×1, named-entity×1] · r2 target_fired [activity×1, named-entity×1] · r3 target_fired [activity×1, named-entity×1]
- "Teodor told Ottoline the news." (target `communication`): r1 target_fired [communication×1, named-entity×2, witness×1] · r2 target_fired [communication×1, named-entity×2, witness×1] · r3 target_fired [communication×1, named-entity×2, witness×1]

Mismatches: none
