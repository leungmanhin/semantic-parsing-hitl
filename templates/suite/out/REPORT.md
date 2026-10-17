# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 1f1bd4be275047a2) · type check: ran

## Catalog checks

198 examples checked; findings: 0

Pending abstain targets (templates to write; each line = the sentences waiting for it):
- `motion` ← activity: "Yusra went to the market."; activity: "Teodor arrived."
- `change-of-state` ← activity: "The ladder broke."; copular: "Teodor became a locksmith."
- `creation` ← activity: "Teodor built a shed."
- `generic` ← group: "Every ferret slept."; kind-statement: "All ferrets are curious."; kind-statement: "Most herons are patient."

## acquisition — held_out

12 cases, 36 records (ok 36; stale prompt 36) · gemini-4-argon effort=low

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

16 cases, 48 records (ok 48; stale prompt 42) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 33/33 · abstain cases false fires 0/15
- fill: exact 33/33 among fires
- stability: pairwise agreement 1.0 (16 cases, 48 pairs), unanimous 16/16
- type check: 45/45 emitted parses type
- graph lints: none
- usage: 48 calls · in 733,515 · out 4,813 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra tried to sleep." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Teodor arrived." (target `motion`): r1 pending_unmapped [named-entity×1; unmapped G00] · r2 pending_unmapped [named-entity×1; unmapped G00] · r3 pending_unmapped [named-entity×1; unmapped G00]
- "Yusra had a rest." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "The ladder broke." (target `change-of-state`): r1 pending_unmapped [nothing fired; unmapped G00] · r2 pending_unmapped [nothing fired; unmapped G00] · r3 pending_unmapped [nothing fired; unmapped G00]
- "Teodor built a shed." (target `creation`): r1 pending_unmapped [named-entity×1; unmapped G00] · r2 pending_unmapped [named-entity×1; unmapped G00] · r3 pending_unmapped [named-entity×1; unmapped G00]

Mismatches: none

## attitude — held_out

14 cases, 42 records (ok 42; stale prompt 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 3 | 9 | 9 | 9 | 9 |
| contrast | 2 | 6 | 6 | 6 | 6 |
| scoped | 4 | 12 | 12 | 12 | 12 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 30/30 · abstain cases false fires 0/12
- fill: exact 30/30 among fires
- stability: pairwise agreement 1.0 (14 cases, 42 pairs), unanimous 14/14
- type check: 42/42 emitted parses type
- graph lints: none
- usage: 42 calls · in 341,073 · out 7,574 · thinking 0 (calls with thought tokens: 0)
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

## distribution — held_out

6 cases, 18 records (ok 18; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 2 | 6 | 6 | 6 | 6 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 2 | 6 | 0 (false fires) | – | 6 |

- selection: fire cases fired 12/12 · abstain cases false fires 0/6
- fill: exact 12/12 among fires
- stability: pairwise agreement 1.0 (6 cases, 18 pairs), unanimous 6/6
- type check: 18/18 emitted parses type
- graph lints: none
- usage: 18 calls · in 329,586 · out 2,193 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferrets surrounded the barn." (target `group`): r1 target_fired [activity×1, group×1, witness×1] · r2 target_fired [activity×1, group×1, witness×1] · r3 target_fired [activity×1, group×1, witness×1]
- "Herons are patient." (target `kind-statement`): r1 target_fired [kind-statement×1] · r2 target_fired [kind-statement×1] · r3 target_fired [kind-statement×1]

Mismatches: none

## group — held_out

11 cases, 33 records (ok 33; stale prompt 33) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/9
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (11 cases, 33 pairs), unanimous 11/11
- type check: 30/30 emitted parses type
- graph lints: none
- usage: 33 calls · in 599,238 · out 4,245 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 5
  - P00 · group · r1 "Yusra's ferrets slept.": The prose states that a possessed group is presupposed to exist (which marks definite: true in witness), while the definite slot description for group only lists 'the / these / those / both'.
  - P00 · group / activity · r1 "Teodor and Yusra laughed.": The group template forbids creating a group for coordinated names ('one instance per conjunct, no group'), and the activity actor slot only accepts a single referent id, leaving it unstated whether a predicate with a coordinated subject requires one predication instance per conjunct.
  - P00 · group · r1 "Both ladders are crooked.": The instructions for 'both' are contradictory: the 'When' description says size is recorded as count when a numeral states it and as a vague phrase otherwise, and says 'both counts as definite with count 2', while the 'quantity' slot lists 'both' as an example but states it is absent when a numeral states the size.
  - P00 · group · r2 "Both ladders are crooked.": The instructions for 'group' state that 'both' counts as definite with count 2 and that 'quantity' is absent when a numeral states the size, while also listing 'both' as an example under 'quantity', making it ambiguous whether 'quantity' should be omitted for 'both'.
  - P00 · group · r3 "Both ladders are crooked.": The instructions for 'group' state that 'both' counts as definite with count 2 and that 'quantity' is absent when a numeral states the size, yet also list 'both' as an example filler for 'quantity'.

Abstain cases (what the parser did, per run):
- "The ferret slept." (target `activity`): r1 target_fired [activity×1, witness×1] · r2 target_fired [activity×1, witness×1] · r3 target_fired [activity×1, witness×1]
- "Every ferret slept." (target `generic`): r1 pending_unmapped [nothing fired; unmapped G00] · r2 pending_unmapped [nothing fired; unmapped G00] · r3 pending_unmapped [nothing fired; unmapped G00]
- "Teodor and Yusra laughed." (target `activity`): r1 target_fired [activity×2, named-entity×2] · r2 target_fired [activity×2, named-entity×2] · r3 target_fired [activity×2, named-entity×2]

Mismatches: none

## kind-statement — held_out

11 cases, 33 records (ok 33; stale prompt 30) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 21/21 · abstain cases false fires 0/12
- fill: exact 21/21 among fires
- stability: pairwise agreement 1.0 (11 cases, 33 pairs), unanimous 11/11
- type check: 27/27 emitted parses type
- graph lints: none
- usage: 33 calls · in 550,578 · out 2,863 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferrets are curious." (target `group`): r1 target_fired [copular×1, distribution×1, group×1] · r2 target_fired [copular×1, distribution×1, group×1] · r3 target_fired [copular×1, distribution×1, group×1]
- "Yusra is a weaver." (target `copular`): r1 target_fired [copular×1, named-entity×1] · r2 target_fired [copular×1, named-entity×1] · r3 target_fired [copular×1, named-entity×1]
- "Ferrets are widespread." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Most herons are patient." (target `generic`): r1 pending_unmapped [nothing fired; unmapped G00] · r2 pending_unmapped [nothing fired; unmapped G00] · r3 pending_unmapped [nothing fired; unmapped G00]

Mismatches: none

## modal — held_out

1 cases, 3 records (ok 3; stale prompt 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 1 | 3 | 3 | 3 | 3 |

- selection: fire cases fired 3/3 · abstain cases false fires 0/0
- fill: exact 3/3 among fires
- stability: pairwise agreement 1.0 (1 cases, 3 pairs), unanimous 1/1
- type check: 3/3 emitted parses type
- graph lints: none
- usage: 3 calls · in 54,939 · out 459 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

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

13 cases, 39 records (ok 39; stale prompt 39) · gemini-4-argon effort=low

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

11 cases, 33 records (ok 33; stale prompt 27) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/9
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (11 cases, 33 pairs), unanimous 11/11
- type check: 33/33 emitted parses type
- graph lints: none
- usage: 33 calls · in 318,927 · out 4,502 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine paid Yusra a visit." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra gave up." (target `activity`): r1 target_fired [activity×1, named-entity×1] · r2 target_fired [activity×1, named-entity×1] · r3 target_fired [activity×1, named-entity×1]
- "Teodor told Ottoline the news." (target `communication`): r1 target_fired [communication×1, named-entity×2, witness×1] · r2 target_fired [communication×1, named-entity×2, witness×1] · r3 target_fired [communication×1, named-entity×2, witness×1]

Mismatches: none
