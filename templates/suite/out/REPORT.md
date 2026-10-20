# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 49ea9cf47ef53a70) · type check: ran

## Catalog checks

538 examples checked; findings: 0

Sentences two templates claim with the same expected atoms (composition, fine):
- "Lamine danced with Yusra." — activity, adjunct
- "Yusra deeply distrusts Lamine." — extent, psych

Stored records whose sentence is no longer in the catalog (ignored): suite/raw/activity/068c3d0726.r1.json, suite/raw/activity/068c3d0726.r2.json, suite/raw/activity/068c3d0726.r3.json, suite/raw/creation/131993ffcf.r1.json, suite/raw/creation/131993ffcf.r2.json, suite/raw/creation/131993ffcf.r3.json

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
- usage: 36 calls · in 502,629 · cached 121,917 (24% of the input) · out 4,561 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline owns the quilt." (target `possession`): r1 target_fired [named-entity×1, possession×1, witness×1] · r2 target_fired [named-entity×1, possession×1, witness×1] · r3 target_fired [named-entity×1, possession×1, witness×1]
- "Teodor won the race." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra got tired." (target `change-of-state`): r1 target_fired [change-of-state×1, named-entity×1] · r2 target_fired [change-of-state×1, named-entity×1] · r3 target_fired [change-of-state×1, named-entity×1]
- "Lamine sold the spindle to Teodor." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none

## activity — held_out

16 cases, 48 records (ok 48; stale prompt 48) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 7 | 21 | 21 | 21 | 21 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 36/36 · abstain cases false fires 0/12
- fill: exact 36/36 among fires
- stability: pairwise agreement 1.0 (16 cases, 48 pairs), unanimous 16/16
- type check: 48/48 emitted parses type
- graph lints: none
- usage: 48 calls · in 890,913 · cached 94,312 (11% of the input) · out 5,100 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor arrived." (target `motion`): r1 target_fired [motion×1, named-entity×1] · r2 target_fired [motion×1, named-entity×1] · r3 target_fired [motion×1, named-entity×1]
- "Yusra had a rest." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "The ladder broke." (target `change-of-state`): r1 target_fired [change-of-state×1, witness×1] · r2 target_fired [change-of-state×1, witness×1] · r3 target_fired [change-of-state×1, witness×1]
- "Teodor built a shed." (target `creation`): r1 target_fired [creation×1, named-entity×1, witness×1] · r2 target_fired [creation×1, named-entity×1, witness×1] · r3 target_fired [creation×1, named-entity×1, witness×1]

Mismatches: none

## adjunct — held_out

11 cases, 33 records (ok 33; stale prompt 33) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/9
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (11 cases, 33 pairs), unanimous 11/11
- type check: 33/33 emitted parses type
- graph lints: none
- usage: 33 calls · in 1,105,677 · cached 975,314 (88% of the input) · out 5,212 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline bought the quilt for forty euros." (target `acquisition`): r1 target_fired [acquisition×1, named-entity×1, witness×1; unmapped G00] · r2 target_fired [acquisition×1, named-entity×1, witness×1; unmapped G00] · r3 target_fired [acquisition×1, named-entity×1, witness×1; unmapped G00]
- "Lamine worked for six hours." (gap G00): r1 gap_reported [activity×1, named-entity×1; unmapped G00] · r2 gap_reported [activity×1, named-entity×1; unmapped G00] · r3 gap_reported [activity×1, named-entity×1; unmapped G00]
- "The quilt was washed by Yusra." (target `activity`): r1 target_fired [activity×1, named-entity×1, witness×1] · r2 target_fired [activity×1, named-entity×1, witness×1] · r3 target_fired [activity×1, named-entity×1, witness×1]

Mismatches: none

## aspectual — held_out

11 cases, 33 records (ok 33; stale prompt 33) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/9
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (11 cases, 33 pairs), unanimous 11/11
- type check: 33/33 emitted parses type
- graph lints: none
- usage: 33 calls · in 1,408,757 · cached 1,256,081 (89% of the input) · out 4,551 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 1
  - P00 · aspectual · r3 "Yusra no longer works.": The boundary case for 'no longer V-s' says to report the aspectual words as unmapped, leaving it ambiguous whether to parse the negated present clause or report the whole clause as unmapped under the entailment rule.

Abstain cases (what the parser did, per run):
- "Yusra no longer works." (gap G00): r1 gap_reported [activity×1, named-entity×1, negation×1; unmapped G00] · r2 gap_reported [activity×1, named-entity×1, negation×1; unmapped G00] · r3 gap_reported [activity×1, named-entity×1, negation×1; unmapped G00]
- "The audit began." (target `change-of-state`): r1 target_fired [change-of-state×1, witness×1] · r2 target_fired [change-of-state×1, witness×1] · r3 target_fired [change-of-state×1, witness×1]
- "Lamine kept Teodor from leaving." (target `causative`): r1 target_fired [causative×1, motion×1, named-entity×2] · r2 target_fired [causative×1, motion×1, named-entity×2] · r3 target_fired [causative×1, motion×1, named-entity×2]

Mismatches: none

## attitude — held_out

13 cases, 39 records (ok 39; stale prompt 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 3 | 9 | 9 | 9 | 9 |
| contrast | 2 | 6 | 6 | 6 | 6 |
| scoped | 4 | 12 | 12 | 12 | 12 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 30/30 · abstain cases false fires 0/9
- fill: exact 30/30 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- usage: 39 calls · in 321,159 · out 7,311 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra knows Lamine." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Teodor wonders whether Lamine sold the spindle." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra told Teodor that Ottoline sent the quilt." (target `communication`): r1 target_fired [communication×1, named-entity×3, transfer×1, witness×1] · r2 target_fired [communication×1, named-entity×3, transfer×1, witness×1] · r3 target_fired [communication×1, named-entity×3, transfer×1, witness×1]

Mismatches: none

## causative — held_out

14 cases, 42 records (ok 42; stale prompt 42) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 7 | 21 | 21 | 21 | 21 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 30/30 · abstain cases false fires 0/12
- fill: exact 30/30 among fires
- stability: pairwise agreement 1.0 (14 cases, 42 pairs), unanimous 14/14
- type check: 39/39 emitted parses type
- graph lints: none
- usage: 42 calls · in 1,793,025 · cached 1,666,317 (93% of the input) · out 6,319 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Let's go to the market." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Teodor made a trip." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra stopped working." (target `aspectual`): r1 target_fired [activity×1, aspectual×1, named-entity×1] · r2 target_fired [activity×1, aspectual×1, named-entity×1] · r3 target_fired [activity×1, aspectual×1, named-entity×1]
- "Lamine made the wax soft." (target `change-of-state`): r1 target_fired [change-of-state×1, named-entity×1, witness×1] · r2 target_fired [change-of-state×1, named-entity×1, witness×1] · r3 target_fired [change-of-state×1, named-entity×1, witness×1]

Mismatches: none

## change-of-state — held_out

15 cases, 45 records (ok 45; stale prompt 45) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 7 | 21 | 21 | 21 | 21 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 33/33 · abstain cases false fires 0/12
- fill: exact 33/33 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 45/45 emitted parses type
- graph lints: none
- usage: 45 calls · in 1,082,283 · cached 121,919 (11% of the input) · out 4,801 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ladder fell." (target `motion`): r1 target_fired [motion×1, witness×1] · r2 target_fired [motion×1, witness×1] · r3 target_fired [motion×1, witness×1]
- "Yusra stopped working." (target `aspectual`): r1 target_fired [activity×1, aspectual×1, named-entity×1] · r2 target_fired [activity×1, aspectual×1, named-entity×1] · r3 target_fired [activity×1, aspectual×1, named-entity×1]
- "Teodor built a shed." (target `creation`): r1 target_fired [creation×1, named-entity×1, witness×1] · r2 target_fired [creation×1, named-entity×1, witness×1] · r3 target_fired [creation×1, named-entity×1, witness×1]
- "Ottoline helped Lamine." (target `activity`): r1 target_fired [activity×1, named-entity×2] · r2 target_fired [activity×1, named-entity×2] · r3 target_fired [activity×1, named-entity×2]

Mismatches: none

## communication — held_out

13 cases, 39 records (ok 39; stale prompt 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 2 | 6 | 0 (false fires) | – | 6 |

- selection: fire cases fired 33/33 · abstain cases false fires 0/6
- fill: exact 33/33 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- usage: 39 calls · in 478,620 · cached 121,924 (25% of the input) · out 7,133 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 1
  - P00 · transfer · r1 "Yusra told Teodor that Lamine might lend Ottoline the trowel.": The tense slot is required on predications, but the instructions do not specify which tense value to use when the clause is governed by a modal auxiliary like 'might'.

Abstain cases (what the parser did, per run):
- "Yusra gave Ottoline a call." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Lamine handed Teodor an envelope." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none

## control — held_out

14 cases, 42 records (ok 42; stale prompt 42) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 30/30 · abstain cases false fires 0/12
- fill: exact 30/30 among fires
- stability: pairwise agreement 1.0 (14 cases, 42 pairs), unanimous 14/14
- type check: 42/42 emitted parses type
- graph lints: none
- usage: 42 calls · in 1,802,577 · cached 1,635,173 (91% of the input) · out 6,320 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine let Ottoline leave." (target `causative`): r1 target_fired [causative×1, motion×1, named-entity×2] · r2 target_fired [causative×1, motion×1, named-entity×2] · r3 target_fired [causative×1, motion×1, named-entity×2]
- "Yusra stopped working." (target `aspectual`): r1 target_fired [activity×1, aspectual×1, named-entity×1] · r2 target_fired [activity×1, aspectual×1, named-entity×1] · r3 target_fired [activity×1, aspectual×1, named-entity×1]
- "Teodor seems to be tired." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra went to the market to buy a thermos." (target `purpose`): r1 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r2 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r3 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2]

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

## coref — held_out

8 cases, 24 records (ok 24; stale prompt 24) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 2 | 6 | 0 (false fires) | – | 6 |

- selection: fire cases fired 18/18 · abstain cases false fires 0/6
- fill: exact 18/18 among fires
- stability: pairwise agreement 1.0 (8 cases, 24 pairs), unanimous 8/8
- type check: 24/24 emitted parses type
- graph lints: none
- usage: 24 calls · in 726,012 · out 4,855 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 2
  - P00 · witness · r2 "Yusra sold her spindle.": The mention template says a possessive pronoun gets its own mention instance that fills the possessor slot of a witness, whereas the witness template says a possessive pronoun resolves to its antecedent's id.
  - P00 · witness · r3 "Yusra sold her spindle.": The witness template says a possessive pronoun resolves to its antecedent's id, whereas the mention template says a possessive pronoun is a mention instance that fills the possessor slot of a witness.

Abstain cases (what the parser did, per run):
- "Yusra gave up." (target `activity`): r1 target_fired [activity×1, named-entity×1] · r2 target_fired [activity×1, named-entity×1] · r3 target_fired [activity×1, named-entity×1]
- "The clerk who laughed left." (gap G00): r1 gap_reported [motion×1, witness×1; unmapped G00] · r2 gap_reported [motion×1, witness×1; unmapped G00] · r3 gap_reported [motion×1, witness×1; unmapped G00]

Mismatches: none

## creation — held_out

15 cases, 45 records (ok 45; stale prompt 45) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 3 | 9 | 9 | 9 | 9 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 36/36 · abstain cases false fires 0/9
- fill: exact 36/36 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 45/45 emitted parses type
- graph lints: none
- usage: 45 calls · in 1,389,486 · cached 1,268,395 (91% of the input) · out 5,472 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra wrote Teodor a letter." (target `communication`): r1 target_fired [communication×1, named-entity×2, witness×1] · r2 target_fired [communication×1, named-entity×2, witness×1] · r3 target_fired [communication×1, named-entity×2, witness×1]
- "Lamine made the wax soft." (target `change-of-state`): r1 target_fired [change-of-state×1, named-entity×1, witness×1] · r2 target_fired [change-of-state×1, named-entity×1, witness×1] · r3 target_fired [change-of-state×1, named-entity×1, witness×1]
- "Ottoline painted the shed." (target `activity`): r1 target_fired [activity×1, named-entity×1, witness×1] · r2 target_fired [activity×1, named-entity×1, witness×1] · r3 target_fired [activity×1, named-entity×1, witness×1]

Mismatches: none

## degree — held_out

18 cases, 54 records (ok 54; stale prompt 54) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 7 | 21 | 21 | 21 | 21 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 6 | 18 | 0 (false fires) | – | 18 |

- selection: fire cases fired 36/36 · abstain cases false fires 0/18
- fill: exact 36/36 among fires
- stability: pairwise agreement 0.963 (18 cases, 54 pairs), unanimous 17/18
- type check: 54/54 emitted parses type
- graph lints: none
- usage: 54 calls · in 1,938,240 · cached 1,788,403 (92% of the input) · out 5,781 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 1
  - P00 · copular / degree · r2 "Yusra is the tallest weaver.": The instructions say to report 'the tallest weaver' as unmapped under degree, while copular forbids a definite predicate ('is the locksmith') unless licensed by the superlative, leaving it unclear whether the entailed kind predication ('weaver') should be kept as a copular instance or the whole predicate reported as unmapped.

Abstain cases (what the parser did, per run):
- "The ladder is crooked." (target `copular`): r1 target_fired [copular×1, witness×1] · r2 target_fired [copular×1, witness×1] · r3 target_fired [copular×1, witness×1]
- "Teodor added too much salt." (gap G00): r1 gap_reported [activity×1, named-entity×1; unmapped G00] · r2 gap_reported [activity×1, named-entity×1; unmapped G00] · r3 gap_reported [activity×1, named-entity×1; unmapped G00]
- "Lamine barely moved." (target `extent`): r1 target_fired [extent×1, motion×1, named-entity×1] · r2 target_fired [extent×1, motion×1, named-entity×1] · r3 target_fired [extent×1, motion×1, named-entity×1]
- "Ferrets are very curious." (gap G02): r1 gap_reported [kind-statement×1; unmapped G02] · r2 gap_reported [kind-statement×1; unmapped G02] · r3 gap_reported [kind-statement×1; unmapped G02]
- "Teodor is taller than Yusra." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra is the tallest weaver." (gap G00): r1 gap_reported [copular×1, named-entity×1; unmapped G00] · r2 gap_reported [copular×1, named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

Mismatches: none

## distribution — held_out

6 cases, 18 records (ok 18; stale prompt 18) · gemini-4-argon effort=low

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

## extent — held_out

15 cases, 45 records (ok 45; stale prompt 45) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 30/30 · abstain cases false fires 0/15
- fill: exact 30/30 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 42/42 emitted parses type
- graph lints: none
- usage: 45 calls · in 1,615,176 · cached 1,489,113 (92% of the input) · out 6,088 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra laughed very loudly." (gap G02): r1 gap_reported [activity×1, manner×1, named-entity×1; unmapped G02] · r2 gap_reported [activity×1, manner×1, named-entity×1; unmapped G02] · r3 gap_reported [activity×1, manner×1, named-entity×1; unmapped G02]
- "The ladder almost fell." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Lamine waited patiently." (target `manner`): r1 target_fired [activity×1, manner×1, named-entity×1] · r2 target_fired [activity×1, manner×1, named-entity×1] · r3 target_fired [activity×1, manner×1, named-entity×1]
- "Lamine often laughed." (gap G02): r1 gap_reported [activity×1, named-entity×1; unmapped G02] · r2 gap_reported [activity×1, named-entity×1; unmapped G02] · r3 gap_reported [activity×1, named-entity×1; unmapped G02]
- "Teodor is extremely tired." (target `degree`): r1 target_fired [degree×1, named-entity×1] · r2 target_fired [degree×1, named-entity×1] · r3 target_fired [degree×1, named-entity×1]

Mismatches: none

## generic — held_out

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
- usage: 33 calls · in 649,791 · out 4,104 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ferrets can climb." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "A few students laughed." (target `group`): r1 target_fired [activity×1, distribution×1, group×1] · r2 target_fired [activity×1, distribution×1, group×1] · r3 target_fired [activity×1, distribution×1, group×1]
- "Most herons are patient." (target `kind-statement`): r1 target_fired [kind-statement×1] · r2 target_fired [kind-statement×1] · r3 target_fired [kind-statement×1]

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
- type check: 33/33 emitted parses type
- graph lints: none
- usage: 33 calls · in 603,855 · out 4,432 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 5
  - P00 · group · r1 "Yusra's ferrets slept.": The prose states that a possessed group is presupposed to exist (which marks definite: true in witness), while the definite slot description for group only lists 'the / these / those / both'.
  - P00 · group / activity · r1 "Teodor and Yusra laughed.": The group template forbids creating a group for coordinated names ('one instance per conjunct, no group'), and the activity actor slot only accepts a single referent id, leaving it unstated whether a predicate with a coordinated subject requires one predication instance per conjunct.
  - P00 · group · r1 "Both ladders are crooked.": The instructions for 'both' are contradictory: the 'When' description says size is recorded as count when a numeral states it and as a vague phrase otherwise, and says 'both counts as definite with count 2', while the 'quantity' slot lists 'both' as an example but states it is absent when a numeral states the size.
  - P00 · group · r2 "Both ladders are crooked.": The instructions for 'group' state that 'both' counts as definite with count 2 and that 'quantity' is absent when a numeral states the size, while also listing 'both' as an example under 'quantity', making it ambiguous whether 'quantity' should be omitted for 'both'.
  - P00 · group · r3 "Both ladders are crooked.": The instructions for 'group' state that 'both' counts as definite with count 2 and that 'quantity' is absent when a numeral states the size, yet also list 'both' as an example filler for 'quantity'.

Abstain cases (what the parser did, per run):
- "The ferret slept." (target `activity`): r1 target_fired [activity×1, witness×1] · r2 target_fired [activity×1, witness×1] · r3 target_fired [activity×1, witness×1]
- "Every ferret slept." (target `generic`): r1 target_fired [activity×1, generic×1, range×1] · r2 target_fired [activity×1, generic×1, range×1] · r3 target_fired [activity×1, generic×1, range×1]
- "Teodor and Yusra laughed." (target `activity`): r1 target_fired [activity×2, named-entity×2] · r2 target_fired [activity×2, named-entity×2] · r3 target_fired [activity×2, named-entity×2]

Mismatches: none

## imperative — held_out

18 cases, 54 records (ok 54; stale prompt 54) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 10 | 30 | 30 | 30 | 30 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 42/42 · abstain cases false fires 0/12
- fill: exact 42/42 among fires
- stability: pairwise agreement 1.0 (18 cases, 54 pairs), unanimous 18/18
- type check: 48/48 emitted parses type
- graph lints: none
- usage: 54 calls · in 2,023,248 · cached 1,910,084 (94% of the input) · out 6,803 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Let's go to the market." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Could you lock the shed?" (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "The quilt was washed." (target `activity`): r1 target_fired [activity×1, witness×1] · r2 target_fired [activity×1, witness×1] · r3 target_fired [activity×1, witness×1]
- "Yusra has to send the quilt." (target `modal`): r1 target_fired [modal×1, named-entity×1, transfer×1, witness×1] · r2 target_fired [modal×1, named-entity×1, transfer×1, witness×1] · r3 target_fired [modal×1, named-entity×1, transfer×1, witness×1]

Mismatches: none

## kind-statement — held_out

12 cases, 36 records (ok 36; stale prompt 36) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/9
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (12 cases, 36 pairs), unanimous 12/12
- type check: 33/33 emitted parses type
- graph lints: none
- usage: 36 calls · in 619,209 · out 3,164 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferrets are curious." (target `group`): r1 target_fired [copular×1, distribution×1, group×1] · r2 target_fired [copular×1, distribution×1, group×1] · r3 target_fired [copular×1, distribution×1, group×1]
- "Yusra is a weaver." (target `copular`): r1 target_fired [copular×1, named-entity×1] · r2 target_fired [copular×1, named-entity×1] · r3 target_fired [copular×1, named-entity×1]
- "Ferrets are widespread." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]

Mismatches: none

## link — held_out

15 cases, 45 records (ok 45; stale prompt 42) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 30/30 · abstain cases false fires 0/15
- fill: exact 30/30 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 45/45 emitted parses type
- graph lints: none
- usage: 45 calls · in 2,064,759 · cached 1,925,678 (93% of the input) · out 8,167 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra left because the gate was open." (gap G00): r1 gap_reported [copular×1, motion×1, named-entity×1, witness×1; unmapped G00] · r2 gap_reported [copular×1, motion×1, named-entity×1, witness×1; unmapped G00] · r3 gap_reported [copular×1, motion×1, named-entity×1, witness×1; unmapped G00]
- "Yusra laughed because of the rain." (gap G00): r1 gap_reported [activity×1, named-entity×1; unmapped G00] · r2 gap_reported [activity×1, named-entity×1; unmapped G00] · r3 gap_reported [activity×1, named-entity×1; unmapped G00]
- "If Lamine sings, Yusra leaves." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Lamine waited while Yusra sang." (gap G00): r1 gap_reported [activity×2, named-entity×2; unmapped G00] · r2 gap_reported [activity×2, named-entity×2; unmapped G00] · r3 gap_reported [activity×2, named-entity×2; unmapped G00]
- "Yusra went to the market to buy a thermos." (target `purpose`): r1 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r2 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r3 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2]

Mismatches: none

## location — held_out

15 cases, 45 records (ok 45; stale prompt 45) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 36/36 · abstain cases false fires 0/9
- fill: exact 36/36 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 45/45 emitted parses type
- graph lints: none
- usage: 45 calls · in 1,201,650 · out 6,749 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor arrived in 2019." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Teodor ran across the field." (target `motion`): r1 target_fired [motion×1, named-entity×1; unmapped G00] · r2 target_fired [motion×1, named-entity×1; unmapped G00] · r3 target_fired [motion×1, named-entity×1; unmapped G00]
- "Lamine was modest in his demands." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

Mismatches: none

## locative — held_out

14 cases, 42 records (ok 42; stale prompt 42) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 33/33 · abstain cases false fires 0/9
- fill: exact 33/33 among fires
- stability: pairwise agreement 1.0 (14 cases, 42 pairs), unanimous 14/14
- type check: 42/42 emitted parses type
- graph lints: none
- usage: 42 calls · in 1,122,285 · out 5,403 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The meeting is at noon." (target `time`): r1 target_fired [time×1, witness×1] · r2 target_fired [time×1, witness×1] · r3 target_fired [time×1, witness×1]
- "Lamine is in trouble." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine entered the shed." (target `motion`): r1 target_fired [motion×1, named-entity×1, witness×1] · r2 target_fired [motion×1, named-entity×1, witness×1] · r3 target_fired [motion×1, named-entity×1, witness×1]

Mismatches: none

## manner — held_out

13 cases, 39 records (ok 39; stale prompt 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/12
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- usage: 39 calls · in 1,313,835 · cached 1,233,815 (94% of the input) · out 5,063 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor arrived in 2019." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Yusra deeply distrusts Lamine." (target `extent`): r1 target_fired [extent×1, named-entity×2, psych×1] · r2 target_fired [extent×1, named-entity×2, psych×1] · r3 target_fired [extent×1, named-entity×2, psych×1]
- "Yusra probably left." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine often laughed." (gap G02): r1 gap_reported [activity×1, named-entity×1; unmapped G02] · r2 gap_reported [activity×1, named-entity×1; unmapped G02] · r3 gap_reported [activity×1, named-entity×1; unmapped G02]

Mismatches: none

## modal — held_out

1 cases, 3 records (ok 3; stale prompt 3) · gemini-4-argon effort=low

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

## motion — held_out

15 cases, 45 records (ok 45; stale prompt 45) · gemini-4-argon effort=low

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
- type check: 45/45 emitted parses type
- graph lints: none
- usage: 45 calls · in 1,018,554 · cached 121,926 (12% of the input) · out 5,291 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra came to like the quilt." (target `aspectual`): r1 target_fired [aspectual×1, named-entity×1, psych×1, witness×1] · r2 target_fired [aspectual×1, named-entity×1, psych×1, witness×1] · r3 target_fired [aspectual×1, named-entity×1, psych×1, witness×1]
- "The price fell." (target `change-of-state`): r1 target_fired [change-of-state×1, witness×1] · r2 target_fired [change-of-state×1, witness×1] · r3 target_fired [change-of-state×1, witness×1]
- "Teodor made a trip." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine handed Teodor an envelope." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

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
| positive | 5 | 15 | 15 | 15 | 15 |
| contrast | 2 | 6 | 6 | 6 | 6 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 30/30 · abstain cases false fires 0/9
- fill: exact 30/30 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- usage: 39 calls · in 574,830 · cached 223,458 (39% of the input) · out 4,940 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline is afraid of the ferret." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra fears that Lamine sold the spindle." (target `attitude`): r1 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r2 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r3 target_fired [attitude×1, named-entity×2, transfer×1, witness×1]
- "Teodor heard the news." (target `perception`): r1 target_fired [named-entity×1, perception×1, witness×1] · r2 target_fired [named-entity×1, perception×1, witness×1] · r3 target_fired [named-entity×1, perception×1, witness×1]

Mismatches: none

## purpose — held_out

11 cases, 33 records (ok 33; stale prompt 30) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 18/18 · abstain cases false fires 0/15
- fill: exact 18/18 among fires
- stability: pairwise agreement 1.0 (11 cases, 33 pairs), unanimous 11/11
- type check: 33/33 emitted parses type
- graph lints: none
- usage: 33 calls · in 1,514,256 · cached 1,446,578 (96% of the input) · out 5,548 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine decided to leave." (target `attitude`): r1 target_fired [attitude×1, motion×1, named-entity×1] · r2 target_fired [attitude×1, motion×1, named-entity×1] · r3 target_fired [attitude×1, motion×1, named-entity×1]
- "Lamine left so that Yusra could sleep." (gap G00): r1 gap_reported [motion×1, named-entity×2; unmapped G00] · r2 gap_reported [motion×1, named-entity×2; unmapped G00] · r3 gap_reported [motion×1, named-entity×2; unmapped G00]
- "Teodor woke to find the gate open." (gap G06): r1 gap_reported [change-of-state×1, named-entity×1; unmapped G06] · r2 gap_reported [change-of-state×1, named-entity×1; unmapped G06] · r3 gap_reported [change-of-state×1, named-entity×1; unmapped G06]
- "Ottoline refused to sing." (target `control`): r1 target_fired [activity×1, control×1, named-entity×1] · r2 target_fired [activity×1, control×1, named-entity×1] · r3 target_fired [activity×1, control×1, named-entity×1]
- "Yusra is too tired to sing." (gap G00): r1 gap_reported [degree×1, named-entity×1; unmapped G00] · r2 gap_reported [degree×1, named-entity×1; unmapped G00] · r3 gap_reported [degree×1, named-entity×1; unmapped G00]

Mismatches: none

## time — held_out

16 cases, 48 records (ok 48; stale prompt 48) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 9 | 27 | 27 | 27 | 27 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 39/39 · abstain cases false fires 0/9
- fill: exact 39/39 among fires
- stability: pairwise agreement 1.0 (16 cases, 48 pairs), unanimous 16/16
- type check: 48/48 emitted parses type
- graph lints: none
- usage: 48 calls · in 1,353,144 · out 5,931 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor reads every day." (gap G00): r1 gap_reported [activity×1, named-entity×1; unmapped G00] · r2 gap_reported [activity×1, named-entity×1; unmapped G00] · r3 gap_reported [activity×1, named-entity×1; unmapped G00]
- "Lamine left after the audit." (gap G00): r1 gap_reported [motion×1, named-entity×1; unmapped G00] · r2 gap_reported [motion×1, named-entity×1; unmapped G00] · r3 gap_reported [motion×1, named-entity×1; unmapped G00]
- "Lamine waited at the market." (target `location`): r1 target_fired [activity×1, location×1, named-entity×1, witness×1] · r2 target_fired [activity×1, location×1, named-entity×1, witness×1] · r3 target_fired [activity×1, location×1, named-entity×1, witness×1]

Mismatches: none

## transfer — held_out

11 cases, 33 records (ok 33; stale prompt 33) · gemini-4-argon effort=low

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
