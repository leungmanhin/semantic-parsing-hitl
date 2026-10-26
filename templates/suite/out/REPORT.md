# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 afb9b34e08037e4a) · type check: ran

## Catalog checks

715 examples checked; findings: 0

Sentences two templates claim with the same expected atoms (composition, fine):
- "Lamine danced with Yusra." — activity, adjunct
- "Yusra deeply distrusts Lamine." — extent, psych
- "Teodor ran across the field." — motion, oblique

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
- spans: 111/111 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 36 calls · in 2,034,243 · cached 1,960,310 (96% of the input) · out 5,717 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline owns the quilt." (target `possession`): r1 target_fired [named-entity×1, possession×1, witness×1] · r2 target_fired [named-entity×1, possession×1, witness×1] · r3 target_fired [named-entity×1, possession×1, witness×1]
- "Teodor won the race." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra got tired." (target `change-of-state`): r1 target_fired [change-of-state×1, named-entity×1] · r2 target_fired [change-of-state×1, named-entity×1] · r3 target_fired [change-of-state×1, named-entity×1]
- "Lamine sold the spindle to Teodor." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none

## activity — held_out

17 cases, 51 records (ok 51; stale prompt 51) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 39/39 · abstain cases false fires 0/12
- fill: exact 39/39 among fires
- stability: pairwise agreement 1.0 (17 cases, 51 pairs), unanimous 17/17
- type check: 51/51 emitted parses type
- graph lints: none
- spans: 135/135 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 51 calls · in 2,881,752 · cached 2,722,740 (94% of the input) · out 6,690 · thinking 0 (calls with thought tokens: 0)
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
- spans: 135/135 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 33 calls · in 1,864,776 · cached 1,737,380 (93% of the input) · out 6,480 · thinking 0 (calls with thought tokens: 0)
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
- spans: 108/108 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 33 calls · in 1,864,701 · cached 1,794,661 (96% of the input) · out 5,443 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra no longer works." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "The audit began." (target `change-of-state`): r1 target_fired [change-of-state×1, witness×1] · r2 target_fired [change-of-state×1, witness×1] · r3 target_fired [change-of-state×1, witness×1]
- "Lamine kept Teodor from leaving." (target `causative`): r1 target_fired [causative×1, motion×1, named-entity×2] · r2 target_fired [causative×1, motion×1, named-entity×2] · r3 target_fired [causative×1, motion×1, named-entity×2]

Mismatches: none

## attitude — held_out

15 cases, 45 records (ok 45; stale prompt 45) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| contrast | 2 | 6 | 6 | 6 | 6 |
| scoped | 4 | 12 | 12 | 12 | 12 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 36/36 · abstain cases false fires 0/9
- fill: exact 36/36 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 45/45 emitted parses type
- graph lints: none
- spans: 222/222 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 45 calls · in 2,542,911 · cached 2,335,245 (92% of the input) · out 10,893 · thinking 0 (calls with thought tokens: 0)
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
- spans: 156/156 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 42 calls · in 2,373,297 · cached 2,287,221 (96% of the input) · out 7,878 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Let's go to the market." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Teodor made a trip." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra stopped working." (target `aspectual`): r1 target_fired [activity×1, aspectual×1, named-entity×1] · r2 target_fired [activity×1, aspectual×1, named-entity×1] · r3 target_fired [activity×1, aspectual×1, named-entity×1]
- "Lamine made the wax soft." (target `change-of-state`): r1 target_fired [change-of-state×1, named-entity×1, witness×1] · r2 target_fired [change-of-state×1, named-entity×1, witness×1] · r3 target_fired [change-of-state×1, named-entity×1, witness×1]

Mismatches: none

## change-of-state — held_out

16 cases, 48 records (ok 48; stale prompt 48) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 36/36 · abstain cases false fires 0/12
- fill: exact 36/36 among fires
- stability: pairwise agreement 1.0 (16 cases, 48 pairs), unanimous 16/16
- type check: 48/48 emitted parses type
- graph lints: none
- spans: 117/117 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 48 calls · in 2,712,219 · cached 2,450,502 (90% of the input) · out 6,100 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ladder fell." (target `motion`): r1 target_fired [motion×1, witness×1] · r2 target_fired [motion×1, witness×1] · r3 target_fired [motion×1, witness×1]
- "Yusra stopped working." (target `aspectual`): r1 target_fired [activity×1, aspectual×1, named-entity×1] · r2 target_fired [activity×1, aspectual×1, named-entity×1] · r3 target_fired [activity×1, aspectual×1, named-entity×1]
- "Teodor built a shed." (target `creation`): r1 target_fired [creation×1, named-entity×1, witness×1] · r2 target_fired [creation×1, named-entity×1, witness×1] · r3 target_fired [creation×1, named-entity×1, witness×1]
- "Ottoline helped Lamine." (target `activity`): r1 target_fired [activity×1, named-entity×2] · r2 target_fired [activity×1, named-entity×2] · r3 target_fired [activity×1, named-entity×2]

Mismatches: none

## class-property — held_out

16 cases, 48 records (ok 48; stale prompt 48) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 9 | 27 | 27 | 27 | 27 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 39/39 · abstain cases false fires 0/9
- fill: exact 39/39 among fires
- stability: pairwise agreement 1.0 (16 cases, 48 pairs), unanimous 16/16
- type check: 45/45 emitted parses type
- graph lints: none
- spans: 66/66 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 48 calls · in 2,712,255 · cached 2,504,983 (92% of the input) · out 4,546 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ferrets are dying out." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Herons are patient." (target `class-statement`): r1 target_fired [class-statement×1] · r2 target_fired [class-statement×1] · r3 target_fired [class-statement×1]
- "Tin is brittle when cold." (target `conditional-property`): r1 target_fired [conditional-property×1, copular×2, range×1] · r2 target_fired [conditional-property×1, copular×2, range×1] · r3 target_fired [conditional-property×1, copular×2, range×1]

Mismatches: none

## class-statement — held_out

13 cases, 39 records (ok 39; stale prompt 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/12
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- spans: 63/63 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 2,203,680 · cached 1,905,949 (86% of the input) · out 4,188 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferrets are curious." (target `group`): r1 target_fired [copular×1, distribution×1, group×1] · r2 target_fired [copular×1, distribution×1, group×1] · r3 target_fired [copular×1, distribution×1, group×1]
- "Yusra is a weaver." (target `copular`): r1 target_fired [copular×1, named-entity×1] · r2 target_fired [copular×1, named-entity×1] · r3 target_fired [copular×1, named-entity×1]
- "Ferrets are widespread." (target `class-property`): r1 target_fired [class-property×1] · r2 target_fired [class-property×1] · r3 target_fired [class-property×1]
- "Wax is soft when warm." (target `conditional-property`): r1 target_fired [conditional-property×1, copular×2, range×1] · r2 target_fired [conditional-property×1, copular×2, range×1] · r3 target_fired [conditional-property×1, copular×2, range×1]

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
- spans: 198/198 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 2,203,872 · cached 2,069,475 (94% of the input) · out 8,780 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra gave Ottoline a call." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Lamine handed Teodor an envelope." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none

## conditional-property — held_out

13 cases, 39 records (ok 39; stale prompt 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 6 | 18 | 0 (false fires) | – | 18 |

- selection: fire cases fired 21/21 · abstain cases false fires 0/18
- fill: exact 21/21 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 30/30 emitted parses type
- graph lints: none
- spans: 114/114 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 2,203,764 · cached 2,014,928 (91% of the input) · out 6,702 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ladder is brittle when cold." (gap G11): r1 gap_reported [nothing fired; unmapped G11] · r2 gap_reported [nothing fired; unmapped G11] · r3 gap_reported [nothing fired; unmapped G11]
- "Herons are patient if the weather is sunny." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Pewter is solid at room temperature." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Clay softens when wet." (target `generic`): r1 target_fired [change-of-state×1, copular×1, generic×1, range×1] · r2 target_fired [change-of-state×1, copular×1, generic×1, range×1] · r3 target_fired [change-of-state×1, copular×1, generic×1, range×1]
- "Herons are patient." (target `class-statement`): r1 target_fired [class-statement×1] · r2 target_fired [class-statement×1] · r3 target_fired [class-statement×1]
- "Otters are rare." (target `class-property`): r1 target_fired [class-property×1] · r2 target_fired [class-property×1] · r3 target_fired [class-property×1]

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
- spans: 153/153 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 42 calls · in 2,373,303 · cached 2,287,218 (96% of the input) · out 7,771 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 1
  - P01 · motion · r2 "Teodor learned to swim.": Intransitive 'swim' with no path or destination could be parsed as `motion` (where 'swim' is an anchor verb) or `activity` (as an action with no change of place).

Abstain cases (what the parser did, per run):
- "Lamine let Ottoline leave." (target `causative`): r1 target_fired [causative×1, motion×1, named-entity×2] · r2 target_fired [causative×1, motion×1, named-entity×2] · r3 target_fired [causative×1, motion×1, named-entity×2]
- "Yusra stopped working." (target `aspectual`): r1 target_fired [activity×1, aspectual×1, named-entity×1] · r2 target_fired [activity×1, aspectual×1, named-entity×1] · r3 target_fired [activity×1, aspectual×1, named-entity×1]
- "Teodor seems to be tired." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra went to the market to buy a thermos." (target `purpose`): r1 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r2 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r3 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2]

Mismatches: none

## copular — held_out

14 cases, 42 records (ok 42; stale prompt 42) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/15
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (14 cases, 42 pairs), unanimous 14/14
- type check: 42/42 emitted parses type
- graph lints: none
- spans: 87/87 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 42 calls · in 2,373,252 · cached 2,232,726 (94% of the input) · out 5,253 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 2
  - P00 · perception · r1 "Teodor seems tired.": The perception template's 'Not this template' section says 'looks tired, sounds odd, feels cold, felt tired: a copular clause with a property', which contradicts the copular template's 'Not this template' section ('a copular verb other than be — seems tired, looks tired, remains open: an evidential or aspectual verb') and the perception template's own 'Not this template' example ('looks tired — report it as unmapped').
  - P00 · copular / perception · r3 "Teodor seems tired.": The 'Not this template' section of 'copular' excludes 'seems tired' as an evidential verb, while 'perception' says 'looks tired... a copular clause with a property', creating a contradiction about whether non-be copular verbs with adjectives are covered or unmapped.

Abstain cases (what the parser did, per run):
- "Herons are birds." (target `class-statement`): r1 target_fired [class-statement×1] · r2 target_fired [class-statement×1] · r3 target_fired [class-statement×1]
- "Teodor is the locksmith." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Teodor seems tired." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Teodor is extremely tired." (target `degree`): r1 target_fired [degree×1, named-entity×1] · r2 target_fired [degree×1, named-entity×1] · r3 target_fired [degree×1, named-entity×1]
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
- stability: pairwise agreement 0.917 (8 cases, 24 pairs), unanimous 7/8
- type check: 24/24 emitted parses type
- graph lints: none
- spans: 136/136 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 24 calls · in 1,356,180 · cached 1,306,992 (96% of the input) · out 6,113 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra gave up." (target `activity`): r1 target_fired [activity×1, named-entity×1] · r2 target_fired [activity×1, named-entity×1] · r3 target_fired [activity×1, named-entity×1]
- "The clerk who laughed left." (gap G00): r1 gap_reported [motion×1, witness×1; unmapped G00] · r2 gap_reported [activity×1, motion×1, witness×1; unmapped G00] · r3 gap_reported [motion×1, witness×1; unmapped G00]

Mismatches: none

## creation — held_out

16 cases, 48 records (ok 48; stale prompt 48) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 3 | 9 | 9 | 9 | 9 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 36/36 · abstain cases false fires 0/12
- fill: exact 36/36 among fires
- stability: pairwise agreement 1.0 (16 cases, 48 pairs), unanimous 16/16
- type check: 48/48 emitted parses type
- graph lints: none
- spans: 156/156 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 48 calls · in 2,712,273 · cached 2,613,908 (96% of the input) · out 7,325 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra wrote Teodor a letter." (target `communication`): r1 target_fired [communication×1, named-entity×2, witness×1] · r2 target_fired [communication×1, named-entity×2, witness×1] · r3 target_fired [communication×1, named-entity×2, witness×1]
- "Lamine made the wax soft." (target `change-of-state`): r1 target_fired [change-of-state×1, named-entity×1, witness×1] · r2 target_fired [change-of-state×1, named-entity×1, witness×1] · r3 target_fired [change-of-state×1, named-entity×1, witness×1]
- "Ottoline painted the shed." (target `activity`): r1 target_fired [activity×1, named-entity×1, witness×1] · r2 target_fired [activity×1, named-entity×1, witness×1] · r3 target_fired [activity×1, named-entity×1, witness×1]
- "Lamine made Yusra send the quilt." (target `causative`): r1 target_fired [causative×1, named-entity×2, transfer×1, witness×1] · r2 target_fired [causative×1, named-entity×2, transfer×1, witness×1] · r3 target_fired [causative×1, named-entity×2, transfer×1, witness×1]

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
- stability: pairwise agreement 1.0 (18 cases, 54 pairs), unanimous 18/18
- type check: 54/54 emitted parses type
- graph lints: none
- spans: 117/117 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 54 calls · in 3,051,342 · cached 2,886,217 (95% of the input) · out 6,543 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ladder is crooked." (target `copular`): r1 target_fired [copular×1, witness×1] · r2 target_fired [copular×1, witness×1] · r3 target_fired [copular×1, witness×1]
- "Teodor added too much salt." (gap G00): r1 gap_reported [activity×1, named-entity×1; unmapped G00] · r2 gap_reported [activity×1, named-entity×1; unmapped G00] · r3 gap_reported [activity×1, named-entity×1; unmapped G00]
- "Lamine barely moved." (target `extent`): r1 target_fired [extent×1, motion×1, named-entity×1] · r2 target_fired [extent×1, motion×1, named-entity×1] · r3 target_fired [extent×1, motion×1, named-entity×1]
- "Ferrets are very curious." (gap G02): r1 gap_reported [class-statement×1; unmapped G02] · r2 gap_reported [class-statement×1; unmapped G02] · r3 gap_reported [class-statement×1; unmapped G02]
- "Teodor is taller than Yusra." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra is the tallest weaver." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

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
- spans: 54/54 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 18 calls · in 1,017,096 · cached 925,704 (91% of the input) · out 2,640 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferrets surrounded the barn." (target `group`): r1 target_fired [activity×1, group×1, witness×1] · r2 target_fired [activity×1, group×1, witness×1] · r3 target_fired [activity×1, group×1, witness×1]
- "Herons are patient." (target `class-statement`): r1 target_fired [class-statement×1] · r2 target_fired [class-statement×1] · r3 target_fired [class-statement×1]

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
- spans: 150/150 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 45 calls · in 2,558,283 · cached 2,466,070 (96% of the input) · out 7,236 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra laughed very loudly." (gap G02): r1 gap_reported [activity×1, manner×1, named-entity×1; unmapped G02] · r2 gap_reported [activity×1, manner×1, named-entity×1; unmapped G02] · r3 gap_reported [activity×1, manner×1, named-entity×1; unmapped G02]
- "The ladder almost fell." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Lamine waited patiently." (target `manner`): r1 target_fired [activity×1, manner×1, named-entity×1] · r2 target_fired [activity×1, manner×1, named-entity×1] · r3 target_fired [activity×1, manner×1, named-entity×1]
- "Lamine often laughed." (target `frequency`): r1 target_fired [activity×1, frequency×1, named-entity×1] · r2 target_fired [activity×1, frequency×1, named-entity×1] · r3 target_fired [activity×1, frequency×1, named-entity×1]
- "Teodor is extremely tired." (target `degree`): r1 target_fired [degree×1, named-entity×1] · r2 target_fired [degree×1, named-entity×1] · r3 target_fired [degree×1, named-entity×1]

Mismatches: none

## focus — held_out

21 cases, 63 records (ok 63; stale prompt 63) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 10 | 30 | 30 | 30 | 30 |
| scoped | 6 | 18 | 18 | 18 | 18 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 48/48 · abstain cases false fires 0/15
- fill: exact 48/48 among fires
- stability: pairwise agreement 1.0 (21 cases, 63 pairs), unanimous 21/21
- type check: 63/63 emitted parses type
- graph lints: none
- spans: 213/213 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 63 calls · in 3,559,854 · cached 3,267,395 (92% of the input) · out 10,197 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Only the ladder is crooked." (gap G00): r1 gap_reported [copular×1, witness×1; unmapped G00] · r2 gap_reported [copular×1, witness×1; unmapped G00] · r3 gap_reported [copular×1, witness×1; unmapped G00]
- "The ferret slept alone." (target `manner`): r1 target_fired [activity×1, manner×1, witness×1] · r2 target_fired [activity×1, manner×1, witness×1] · r3 target_fired [activity×1, manner×1, witness×1]
- "Also, Teodor left." (gap G05): r1 gap_reported [motion×1, named-entity×1; unmapped G05] · r2 gap_reported [motion×1, named-entity×1; unmapped G05] · r3 gap_reported [motion×1, named-entity×1; unmapped G05]
- "Teodor has just arrived." (gap G02): r1 gap_reported [motion×1, named-entity×1; unmapped G02] · r2 gap_reported [motion×1, named-entity×1; unmapped G02] · r3 gap_reported [motion×1, named-entity×1; unmapped G02]
- "Even though Lamine waited, Teodor left." (target `link`): r1 target_fired [activity×1, link×1, motion×1, named-entity×2] · r2 target_fired [activity×1, link×1, motion×1, named-entity×2] · r3 target_fired [activity×1, link×1, motion×1, named-entity×2]

Mismatches: none

## frequency — held_out

23 cases, 69 records (ok 69; stale prompt 27) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 17 | 51 | 51 | 51 | 51 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 57/57 · abstain cases false fires 0/12
- fill: exact 57/57 among fires
- stability: pairwise agreement 1.0 (23 cases, 69 pairs), unanimous 23/23
- type check: 69/69 emitted parses type
- graph lints: none
- spans: 267/267 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 69 calls · in 4,281,972 · cached 4,020,582 (94% of the input) · out 12,226 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Every ferret slept." (target `generic`): r1 target_fired [activity×1, generic×1, range×1] · r2 target_fired [activity×1, generic×1, range×1] · r3 target_fired [activity×1, generic×1, range×1]
- "Yusra never laughs." (target `negation`): r1 target_fired [activity×1, named-entity×1, negation×1] · r2 target_fired [activity×1, named-entity×1, negation×1] · r3 target_fired [activity×1, named-entity×1, negation×1]
- "Whenever Yusra sang, the ferret hid." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine used to sing." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

Mismatches: none

## generic — held_out

17 cases, 51 records (ok 51; stale prompt 51) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 11 | 33 | 33 | 33 | 33 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 39/39 · abstain cases false fires 0/12
- fill: exact 39/39 among fires
- stability: pairwise agreement 1.0 (17 cases, 51 pairs), unanimous 17/17
- type check: 48/48 emitted parses type
- graph lints: none
- spans: 162/162 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 51 calls · in 2,881,743 · cached 2,668,333 (93% of the input) · out 8,166 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 2
  - P00 · generic · r2 "Ferrets can climb.": The generic template's 'over' slot allows a modal over the predication, but its 'Not this template' section explicitly excludes 'ferrets can climb' as a property of the class with no template covering it.
  - P00 · generic · r3 "Ferrets can climb.": The generic template's 'over' slot allows a modal over the predication, but its 'Not this template' section explicitly excludes 'ferrets can climb' as a property of the class with no template covering that construction.

Abstain cases (what the parser did, per run):
- "Ferrets can climb." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "A few students laughed." (target `group`): r1 target_fired [activity×1, distribution×1, group×1] · r2 target_fired [activity×1, distribution×1, group×1] · r3 target_fired [activity×1, distribution×1, group×1]
- "Most herons are patient." (target `class-statement`): r1 target_fired [class-statement×1] · r2 target_fired [class-statement×1] · r3 target_fired [class-statement×1]
- "Wax is soft when warm." (target `conditional-property`): r1 target_fired [conditional-property×1, copular×2, range×1] · r2 target_fired [conditional-property×1, copular×2, range×1] · r3 target_fired [conditional-property×1, copular×2, range×1]

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
- spans: 105/105 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 33 calls · in 1,864,656 · cached 1,688,127 (91% of the input) · out 5,043 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

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
- spans: 180/180 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 54 calls · in 3,051,300 · cached 2,722,828 (89% of the input) · out 8,481 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Let's go to the market." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Could you lock the shed?" (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "The quilt was washed." (target `activity`): r1 target_fired [activity×1, witness×1] · r2 target_fired [activity×1, witness×1] · r3 target_fired [activity×1, witness×1]
- "Yusra has to send the quilt." (target `modal`): r1 target_fired [modal×1, named-entity×1, transfer×1, witness×1] · r2 target_fired [modal×1, named-entity×1, transfer×1, witness×1] · r3 target_fired [modal×1, named-entity×1, transfer×1, witness×1]

Mismatches: none

## link — held_out

15 cases, 45 records (ok 45; stale prompt 45) · gemini-4-argon effort=low

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
- spans: 225/225 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 45 calls · in 2,552,613 · cached 2,348,230 (92% of the input) · out 9,939 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra left because the gate was open." (gap G00): r1 gap_reported [copular×1, motion×1, named-entity×1, witness×1; unmapped G00] · r2 gap_reported [copular×1, motion×1, named-entity×1, witness×1; unmapped G00] · r3 gap_reported [copular×1, motion×1, named-entity×1, witness×1; unmapped G00]
- "Yusra laughed because of the rain." (gap G00): r1 gap_reported [activity×1, named-entity×1; unmapped G00] · r2 gap_reported [activity×1, named-entity×1; unmapped G00] · r3 gap_reported [activity×1, named-entity×1; unmapped G00]
- "If Lamine sings, Yusra leaves." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Lamine waited while Yusra sang." (target `time-relation`): r1 target_fired [activity×2, named-entity×2, time-relation×1] · r2 target_fired [activity×2, named-entity×2, time-relation×1] · r3 target_fired [activity×2, named-entity×2, time-relation×1]
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
- spans: 183/183 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 45 calls · in 2,542,815 · cached 2,450,600 (96% of the input) · out 8,952 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 3
  - P00 · copular · r1 "Lamine was modest in his demands.": The location template mentions 'in its demands' as an oblique on an event, but a copular predication has no event symbol for an oblique to attach to and states that an adjective with a complement must be reported as unmapped as a whole.
  - P00 · copular · r2 "Lamine was modest in his demands.": The location boundary note classifies 'in its demands' as an oblique on an event, but a copular predication renders no event symbol for an oblique to attach to, and the copular boundary note treats an adjective with a complement as an unmapped predicate.
  - P00 · copular · r3 "Lamine was modest in his demands.": The location template mentions 'in its demands' as an oblique on an event, but a copular predication has no event symbol for an oblique to attach to, and copular rejects adjectives with complements.

Abstain cases (what the parser did, per run):
- "Teodor arrived in 2019." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Teodor ran across the field." (target `motion`): r1 target_fired [motion×1, named-entity×1, oblique×1, witness×1] · r2 target_fired [motion×1, named-entity×1, oblique×1, witness×1] · r3 target_fired [motion×1, named-entity×1, oblique×1, witness×1]
- "Lamine was modest in his demands." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

Mismatches: none

## locative — held_out

15 cases, 45 records (ok 45; stale prompt 45) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 9 | 27 | 27 | 27 | 27 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 36/36 · abstain cases false fires 0/9
- fill: exact 36/36 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 45/45 emitted parses type
- graph lints: none
- spans: 141/141 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 45 calls · in 2,542,803 · cached 2,450,586 (96% of the input) · out 7,224 · thinking 0 (calls with thought tokens: 0)
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
- spans: 129/129 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 2,219,256 · cached 2,084,875 (94% of the input) · out 6,036 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor arrived in 2019." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Yusra deeply distrusts Lamine." (target `extent`): r1 target_fired [extent×1, named-entity×2, psych×1] · r2 target_fired [extent×1, named-entity×2, psych×1] · r3 target_fired [extent×1, named-entity×2, psych×1]
- "Yusra probably left." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine often laughed." (target `frequency`): r1 target_fired [activity×1, frequency×1, named-entity×1] · r2 target_fired [activity×1, frequency×1, named-entity×1] · r3 target_fired [activity×1, frequency×1, named-entity×1]

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
- spans: 12/12 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 3 calls · in 169,524 · cached 163,377 (96% of the input) · out 653 · thinking 0 (calls with thought tokens: 0)
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
- spans: 135/135 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 45 calls · in 2,542,776 · cached 2,232,745 (88% of the input) · out 6,629 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra came to like the quilt." (target `aspectual`): r1 target_fired [aspectual×1, named-entity×1, psych×1, witness×1] · r2 target_fired [aspectual×1, named-entity×1, psych×1, witness×1] · r3 target_fired [aspectual×1, named-entity×1, psych×1, witness×1]
- "The price fell." (target `change-of-state`): r1 target_fired [change-of-state×1, witness×1] · r2 target_fired [change-of-state×1, witness×1] · r3 target_fired [change-of-state×1, witness×1]
- "Teodor made a trip." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine handed Teodor an envelope." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none

## named-entity — held_out

1 cases, 3 records (ok 3; stale prompt 3) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 1 | 3 | 3 | 3 | 3 |

- selection: fire cases fired 3/3 · abstain cases false fires 0/0
- fill: exact 3/3 among fires
- stability: pairwise agreement 1.0 (1 cases, 3 pairs), unanimous 1/1
- type check: 3/3 emitted parses type
- graph lints: none
- spans: 3/3 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 3 calls · in 169,518 · cached 163,371 (96% of the input) · out 219 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Mismatches: none

## negation — held_out

1 cases, 3 records (ok 3; stale prompt 3) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 1 | 3 | 3 | 3 | 3 |

- selection: fire cases fired 3/3 · abstain cases false fires 0/0
- fill: exact 3/3 among fires
- stability: pairwise agreement 1.0 (1 cases, 3 pairs), unanimous 1/1
- type check: 3/3 emitted parses type
- graph lints: none
- spans: 9/9 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 3 calls · in 185,034 · cached 178,887 (97% of the input) · out 393 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Mismatches: none

## oblique — held_out

19 cases, 57 records (ok 57; stale prompt 57) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| scoped | 4 | 12 | 12 | 12 | 12 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 6 | 18 | 0 (false fires) | – | 18 |

- selection: fire cases fired 39/39 · abstain cases false fires 0/18
- fill: exact 39/39 among fires
- stability: pairwise agreement 1.0 (19 cases, 57 pairs), unanimous 19/19
- type check: 57/57 emitted parses type
- graph lints: none
- spans: 219/219 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 57 calls · in 3,230,640 · cached 3,113,835 (96% of the input) · out 10,279 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor arrived in 2019." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Lamine left without saying a word." (gap G00): r1 gap_reported [motion×1, named-entity×1; unmapped G00] · r2 gap_reported [motion×1, named-entity×1; unmapped G00] · r3 gap_reported [motion×1, named-entity×1; unmapped G00]
- "Yusra left after the audit." (target `time-relation`): r1 target_fired [motion×1, named-entity×1, time-relation×1, witness×1] · r2 target_fired [motion×1, named-entity×1, time-relation×1, witness×1] · r3 target_fired [motion×1, named-entity×1, time-relation×1, witness×1]
- "Lamine entered the shed." (target `motion`): r1 target_fired [motion×1, named-entity×1, witness×1] · r2 target_fired [motion×1, named-entity×1, witness×1] · r3 target_fired [motion×1, named-entity×1, witness×1]
- "The quilt was washed by Yusra." (target `activity`): r1 target_fired [activity×1, named-entity×1, witness×1] · r2 target_fired [activity×1, named-entity×1, witness×1] · r3 target_fired [activity×1, named-entity×1, witness×1]
- "Teodor is taller than Yusra." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]

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
- spans: 111/111 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 36 calls · in 2,034,225 · cached 1,797,090 (88% of the input) · out 5,735 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 3
  - P00 · perception · r1 "Teodor felt tired.": The 'perception' boundary says 'felt tired' is 'a copular clause with a property', but 'copular' is restricted to 'be' and 'perception' shows 'looks tired' as unmapped G00.
  - P00 · copular · r2 "Teodor felt tired.": The perception template directs 'felt tired' to a copular clause with a property, but the copular template requires 'be' as the main verb and excludes copular verbs other than 'be'.
  - P00 · copular · r3 "Teodor felt tired.": The perception template classifies 'felt tired' as 'a copular clause with a property', while the copular template requires 'be' as the main verb and excludes copular verbs other than 'be'.

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
- spans: 114/114 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 36 calls · in 2,034,228 · cached 1,960,399 (96% of the input) · out 5,778 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor bought the spindle from Yusra." (target `acquisition`): r1 target_fired [acquisition×1, named-entity×2, witness×1] · r2 target_fired [acquisition×1, named-entity×2, witness×1] · r3 target_fired [acquisition×1, named-entity×2, witness×1]
- "Yusra has sent the quilt." (target `transfer`): r1 target_fired [named-entity×1, transfer×1, witness×1] · r2 target_fired [named-entity×1, transfer×1, witness×1] · r3 target_fired [named-entity×1, transfer×1, witness×1]
- "Ottoline has a brother." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra has to send the quilt." (target `modal`): r1 target_fired [modal×1, named-entity×1, transfer×1, witness×1] · r2 target_fired [modal×1, named-entity×1, transfer×1, witness×1] · r3 target_fired [modal×1, named-entity×1, transfer×1, witness×1]

Mismatches: none

## postmodifier — held_out

10 cases, 30 records (ok 30; stale prompt 30) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 18/18 · abstain cases false fires 0/12
- fill: exact 18/18 among fires
- stability: pairwise agreement 1.0 (10 cases, 30 pairs), unanimous 10/10
- type check: 30/30 emitted parses type
- graph lints: none
- spans: 126/126 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 30 calls · in 1,695,246 · cached 1,574,006 (93% of the input) · out 5,845 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor voted against the plan." (target `oblique`): r1 target_fired [activity×1, named-entity×1, oblique×1, witness×1] · r2 target_fired [activity×1, named-entity×1, oblique×1, witness×1] · r3 target_fired [activity×1, named-entity×1, oblique×1, witness×1]
- "The ferret in the barn slept." (target `locative`): r1 target_fired [activity×1, locative×1, witness×2] · r2 target_fired [activity×1, locative×1, witness×2] · r3 target_fired [activity×1, locative×1, witness×2]
- "Yusra drank a cup of tea." (gap G00): r1 gap_reported [activity×1, named-entity×1; unmapped G00] · r2 gap_reported [activity×1, named-entity×1; unmapped G00] · r3 gap_reported [activity×1, named-entity×1; unmapped G00]
- "Lamine washed the quilt of Teodor." (target `witness`): r1 target_fired [activity×1, named-entity×2, witness×1] · r2 target_fired [activity×1, named-entity×2, witness×1] · r3 target_fired [activity×1, named-entity×2, witness×1]

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
- spans: 123/123 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 2,203,773 · cached 2,122,587 (96% of the input) · out 6,315 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 2
  - P01 · psych · r2 "Teodor was frightened.": Both psych (agentless passive '<experiencer> was V-ed') and copular (adjectival participle '<subject> was <ADJ>') apply to 'Teodor was frightened'.
  - P01 · psych · r3 "Teodor was frightened.": Both psych (as an agentless passive `<experiencer> was V-ed` of frighten) and copular (as a past copular predication with the participial adjective frightened) seem to apply to 'Teodor was frightened'.

Abstain cases (what the parser did, per run):
- "Ottoline is afraid of the ferret." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra fears that Lamine sold the spindle." (target `attitude`): r1 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r2 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r3 target_fired [attitude×1, named-entity×2, transfer×1, witness×1]
- "Teodor heard the news." (target `perception`): r1 target_fired [named-entity×1, perception×1, witness×1] · r2 target_fired [named-entity×1, perception×1, witness×1] · r3 target_fired [named-entity×1, perception×1, witness×1]

Mismatches: none

## purpose — held_out

11 cases, 33 records (ok 33; stale prompt 33) · gemini-4-argon effort=low

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
- spans: 132/132 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 33 calls · in 1,864,776 · cached 1,797,146 (96% of the input) · out 6,614 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine decided to leave." (target `attitude`): r1 target_fired [attitude×1, motion×1, named-entity×1] · r2 target_fired [attitude×1, motion×1, named-entity×1] · r3 target_fired [attitude×1, motion×1, named-entity×1]
- "Lamine left so that Yusra could sleep." (gap G00): r1 gap_reported [motion×1, named-entity×2; unmapped G00] · r2 gap_reported [motion×1, named-entity×2; unmapped G00] · r3 gap_reported [motion×1, named-entity×2; unmapped G00]
- "Teodor woke to find the gate open." (gap G06): r1 gap_reported [change-of-state×1, named-entity×1; unmapped G06] · r2 gap_reported [change-of-state×1, named-entity×1; unmapped G06] · r3 gap_reported [change-of-state×1, named-entity×1; unmapped G06]
- "Ottoline refused to sing." (target `control`): r1 target_fired [activity×1, control×1, named-entity×1] · r2 target_fired [activity×1, control×1, named-entity×1] · r3 target_fired [activity×1, control×1, named-entity×1]
- "Yusra is too tired to sing." (gap G00): r1 gap_reported [degree×1, named-entity×1; unmapped G00] · r2 gap_reported [degree×1, named-entity×1; unmapped G00] · r3 gap_reported [degree×1, named-entity×1; unmapped G00]

Mismatches: none

## time — held_out

25 cases, 75 records (ok 75; stale prompt 75) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 18 | 54 | 54 | 54 | 54 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 66/66 · abstain cases false fires 0/9
- fill: exact 66/66 among fires
- stability: pairwise agreement 1.0 (25 cases, 75 pairs), unanimous 25/25
- type check: 75/75 emitted parses type
- graph lints: none
- spans: 279/279 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 75 calls · in 4,331,460 · cached 4,065,585 (94% of the input) · out 13,160 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor reads every day." (target `frequency`): r1 target_fired [activity×1, frequency×1, named-entity×1] · r2 target_fired [activity×1, frequency×1, named-entity×1] · r3 target_fired [activity×1, frequency×1, named-entity×1]
- "Lamine left after the audit." (target `time-relation`): r1 target_fired [motion×1, named-entity×1, time-relation×1, witness×1] · r2 target_fired [motion×1, named-entity×1, time-relation×1, witness×1] · r3 target_fired [motion×1, named-entity×1, time-relation×1, witness×1]
- "Lamine waited at the market." (target `location`): r1 target_fired [activity×1, location×1, named-entity×1, witness×1] · r2 target_fired [activity×1, location×1, named-entity×1, witness×1] · r3 target_fired [activity×1, location×1, named-entity×1, witness×1]

Mismatches: none

## time-relation — held_out

26 cases, 78 records (ok 78; stale prompt 78) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 18 | 54 | 54 | 54 | 54 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 66/66 · abstain cases false fires 0/12
- fill: exact 66/66 among fires
- stability: pairwise agreement 1.0 (26 cases, 78 pairs), unanimous 26/26
- type check: 78/78 emitted parses type
- graph lints: none
- spans: 339/339 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 78 calls · in 4,660,506 · cached 4,385,138 (94% of the input) · out 16,132 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor will leave tomorrow." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Since the ferret slept, Yusra sang." (target `link`): r1 target_fired [activity×2, link×1, named-entity×1, witness×1] · r2 target_fired [activity×2, link×1, named-entity×1, witness×1] · r3 target_fired [activity×2, link×1, named-entity×1, witness×1]
- "The ladder was crooked until Monday." (gap G00): r1 gap_reported [copular×1, time×1, witness×1; unmapped G00] · r2 gap_reported [copular×1, time×1, witness×1; unmapped G00] · r3 gap_reported [copular×1, time×1, witness×1; unmapped G00]
- "Whenever Yusra sang, the ferret hid." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

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
- spans: 120/120 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 33 calls · in 1,864,734 · cached 1,742,645 (93% of the input) · out 5,505 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine paid Yusra a visit." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra gave up." (target `activity`): r1 target_fired [activity×1, named-entity×1] · r2 target_fired [activity×1, named-entity×1] · r3 target_fired [activity×1, named-entity×1]
- "Teodor told Ottoline the news." (target `communication`): r1 target_fired [communication×1, named-entity×2, witness×1] · r2 target_fired [communication×1, named-entity×2, witness×1] · r3 target_fired [communication×1, named-entity×2, witness×1]

Mismatches: none

## witness — held_out

2 cases, 6 records (ok 6; stale prompt 6) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 2 | 6 | 6 | 6 | 6 |

- selection: fire cases fired 6/6 · abstain cases false fires 0/0
- fill: exact 6/6 among fires
- stability: pairwise agreement 1.0 (2 cases, 6 pairs), unanimous 2/2
- type check: 6/6 emitted parses type
- graph lints: none
- spans: 21/21 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 6 calls · in 339,045 · cached 326,748 (96% of the input) · out 987 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Mismatches: none
