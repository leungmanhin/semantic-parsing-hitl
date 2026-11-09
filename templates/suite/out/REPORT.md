# Suite report

prompt `templates/generated/PROMPT_CATALOG.txt` (body sha256 7423b953801b8633) · manifest a00bfbea4ce5 · type check: ran

## Catalog checks

1389 examples checked; findings: 0

Sentences two templates claim with the same expected atoms (composition, fine):
- "Ottoline bought the quilt for forty euros." — acquisition, measure
- "Lamine danced with Yusra." — activity, adjunct
- "The mill remained closed." — aspectual, copular
- "Teodor seems tired." — copular, evidential
- "Yusra deeply distrusts Lamine." — extent, psych
- "Teodor ran across the field." — motion, oblique

## acquisition — held_out

13 cases, 39 records (ok 39; stale prompt 39; stale manifest 6, unstamped 33) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 4 | 12 | 12 | 12 | 12 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/12
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- spans: 129/129 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 2,570,520 · cached 2,490,387 (97% of the input) · out 6,431 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline owns the quilt." (target `possession`): r1 target_fired [named-entity×1, possession×1, witness×1] · r2 target_fired [named-entity×1, possession×1, witness×1] · r3 target_fired [named-entity×1, possession×1, witness×1]
- "Teodor won the race." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra got tired." (target `change-of-state`): r1 target_fired [change-of-state×1, named-entity×1] · r2 target_fired [change-of-state×1, named-entity×1] · r3 target_fired [change-of-state×1, named-entity×1]
- "Lamine sold the spindle to Teodor." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none

## activity — held_out

28 cases, 84 records (ok 84; stale prompt 84; stale manifest 30, unstamped 54) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 19 | 57 | 57 | 57 | 57 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 72/72 · abstain cases false fires 0/12
- fill: exact 72/72 among fires
- stability: pairwise agreement 1.0 (28 cases, 84 pairs), unanimous 28/28
- type check: 84/84 emitted parses type
- graph lints: none
- spans: 237/237 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 84 calls · in 6,286,323 · cached 6,059,522 (96% of the input) · out 11,847 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 3
  - P00 · acquisition · r1 "Corvin took a stroll.": The Lemmas and symbols section and the acquisition boundary instruct to parse a light verb with an event noun as one surface symbol using the activity template, whereas a negative example under acquisition instructs to report 'took a walk' as unmapped G00.
  - P00 · Lemmas and symbols · r2 "Corvin took a stroll.": The general instructions say a light verb with an event noun is parsed with the activity template as a single symbol, whereas the acquisition template example says to report 'took a walk' as unmapped (G00).
  - P00 · Lemmas and symbols / acquisition · r3 "Corvin took a stroll.": 'Lemmas and symbols' states a light verb with an event noun is one surface symbol using the activity template, whereas 'acquisition' and 'motion' state to report light-verb constructions as unmapped (G00).

Abstain cases (what the parser did, per run):
- "Teodor arrived." (target `motion`): r1 target_fired [motion×1, named-entity×1] · r2 target_fired [motion×1, named-entity×1] · r3 target_fired [motion×1, named-entity×1]
- "Yusra had a rest." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "The ladder broke." (target `change-of-state`): r1 target_fired [change-of-state×1, witness×1] · r2 target_fired [change-of-state×1, witness×1] · r3 target_fired [change-of-state×1, witness×1]
- "Teodor built a shed." (target `creation`): r1 target_fired [creation×1, named-entity×1, witness×1] · r2 target_fired [creation×1, named-entity×1, witness×1] · r3 target_fired [creation×1, named-entity×1, witness×1]

Mismatches: none

## adjective-complement — held_out

36 cases, 108 records (ok 108; stale prompt 108; stale manifest 0, unstamped 108) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 20 | 60 | 60 | 60 | 60 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| abstain | 13 | 39 | 0 (false fires) | – | 39 |

- selection: fire cases fired 69/69 · abstain cases false fires 0/39
- fill: exact 69/69 among fires
- stability: pairwise agreement 1.0 (36 cases, 108 pairs), unanimous 36/36
- type check: 108/108 emitted parses type
- graph lints: none
- spans: 312/312 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 108 calls · in 9,471,855 · cached 9,075,057 (96% of the input) · out 15,961 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra is married to Lamine." (target `stative-relation`): r1 target_fired [named-entity×2, stative-relation×1] · r2 target_fired [named-entity×2, stative-relation×1] · r3 target_fired [named-entity×2, stative-relation×1]
- "The delay was due to the rain." (target `oblique`): r1 target_fired [oblique×1, witness×2] · r2 target_fired [oblique×1, witness×2] · r3 target_fired [oblique×1, witness×2]
- "The house is surrounded by a wall." (target `stative-relation`): r1 target_fired [stative-relation×1, witness×2] · r2 target_fired [stative-relation×1, witness×2] · r3 target_fired [stative-relation×1, witness×2]
- "Yusra is tired." (target `copular`): r1 target_fired [copular×1, named-entity×1] · r2 target_fired [copular×1, named-entity×1] · r3 target_fired [copular×1, named-entity×1]
- "Lamine is in trouble." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra is likely to win." (target `hedge`): r1 target_fired [activity×1, hedge×1, named-entity×1] · r2 target_fired [activity×1, hedge×1, named-entity×1] · r3 target_fired [activity×1, hedge×1, named-entity×1]
- "Lamine was happy in Calderwick." (target `location`): r1 target_fired [copular×1, location×1, named-entity×2] · r2 target_fired [copular×1, location×1, named-entity×2] · r3 target_fired [copular×1, location×1, named-entity×2]
- "Ottoline is ready to leave." (target `attitude`): r1 target_fired [attitude×1, motion×1, named-entity×1] · r2 target_fired [attitude×1, motion×1, named-entity×1] · r3 target_fired [attitude×1, motion×1, named-entity×1]
- "Teodor is extremely tired." (target `degree`): r1 target_fired [degree×1, named-entity×1] · r2 target_fired [degree×1, named-entity×1] · r3 target_fired [degree×1, named-entity×1]
- "Lamine is sure that Yusra left." (target `attitude`): r1 target_fired [attitude×1, motion×1, named-entity×2] · r2 target_fired [attitude×1, motion×1, named-entity×2] · r3 target_fired [attitude×1, motion×1, named-entity×2]
- "Lamine is able to swim." (target `modal`): r1 target_fired [activity×1, modal×1, named-entity×1] · r2 target_fired [activity×1, modal×1, named-entity×1] · r3 target_fired [activity×1, modal×1, named-entity×1]
- "Teodor is supposed to wait." (target `norm`): r1 target_fired [activity×1, named-entity×1, norm×1] · r2 target_fired [activity×1, named-entity×1, norm×1] · r3 target_fired [activity×1, named-entity×1, norm×1]
- "Yusra fears the ferret." (target `psych`): r1 target_fired [named-entity×1, psych×1, witness×1] · r2 target_fired [named-entity×1, psych×1, witness×1] · r3 target_fired [named-entity×1, psych×1, witness×1]

Mismatches: none

## adjunct — held_out

12 cases, 36 records (ok 36; stale prompt 36; stale manifest 3, unstamped 33) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/9
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (12 cases, 36 pairs), unanimous 12/12
- type check: 36/36 emitted parses type
- graph lints: none
- spans: 153/153 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 36 calls · in 2,234,328 · cached 1,925,193 (86% of the input) · out 7,191 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Ottoline bought the quilt for forty euros." (target `acquisition`): r1 target_fired [acquisition×1, named-entity×1, witness×1; unmapped G00] · r2 target_fired [acquisition×1, named-entity×1, witness×1; unmapped G00] · r3 target_fired [acquisition×1, named-entity×1, witness×1; unmapped G00]
- "Lamine worked for six hours." (target `measure`): r1 target_fired [activity×1, measure×1, named-entity×1] · r2 target_fired [activity×1, measure×1, named-entity×1] · r3 target_fired [activity×1, measure×1, named-entity×1]
- "The quilt was washed by Yusra." (target `activity`): r1 target_fired [activity×1, named-entity×1, witness×1] · r2 target_fired [activity×1, named-entity×1, witness×1] · r3 target_fired [activity×1, named-entity×1, witness×1]

Mismatches: none

## aspectual — held_out

15 cases, 45 records (ok 45; stale prompt 45; stale manifest 12, unstamped 33) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 9 | 27 | 27 | 27 | 27 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 36/36 · abstain cases false fires 0/9
- fill: exact 36/36 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 45/45 emitted parses type
- graph lints: none
- spans: 150/150 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 45 calls · in 3,266,688 · cached 3,163,678 (97% of the input) · out 7,513 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra no longer works." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "The audit began." (target `change-of-state`): r1 target_fired [change-of-state×1, witness×1] · r2 target_fired [change-of-state×1, witness×1] · r3 target_fired [change-of-state×1, witness×1]
- "Lamine kept Teodor from leaving." (target `causative`): r1 target_fired [causative×1, motion×1, named-entity×2] · r2 target_fired [causative×1, motion×1, named-entity×2] · r3 target_fired [causative×1, motion×1, named-entity×2]

Mismatches: none

## attitude — held_out

30 cases, 90 records (ok 90; stale prompt 90; stale manifest 36, unstamped 54) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 20 | 60 | 60 | 60 | 60 |
| contrast | 2 | 6 | 6 | 6 | 6 |
| scoped | 4 | 12 | 12 | 12 | 12 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 81/81 · abstain cases false fires 0/9
- fill: exact 81/81 among fires
- stability: pairwise agreement 1.0 (30 cases, 90 pairs), unanimous 30/30
- type check: 90/90 emitted parses type
- graph lints: none
- spans: 405/405 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 90 calls · in 7,297,332 · cached 7,051,575 (97% of the input) · out 19,897 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra knows Lamine." (target `stative-relation`): r1 target_fired [named-entity×2, stative-relation×1] · r2 target_fired [named-entity×2, stative-relation×1] · r3 target_fired [named-entity×2, stative-relation×1]
- "Teodor wonders whether Lamine sold the spindle." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra told Teodor that Ottoline sent the quilt." (target `communication`): r1 target_fired [communication×1, named-entity×3, transfer×1, witness×1] · r2 target_fired [communication×1, named-entity×3, transfer×1, witness×1] · r3 target_fired [communication×1, named-entity×3, transfer×1, witness×1]

Mismatches: none

## causative — held_out

15 cases, 45 records (ok 45; stale prompt 45; stale manifest 0, unstamped 45) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 33/33 · abstain cases false fires 0/12
- fill: exact 33/33 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 42/42 emitted parses type
- graph lints: none
- spans: 168/168 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 45 calls · in 2,593,749 · cached 2,501,523 (96% of the input) · out 8,452 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Let's go to the market." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Teodor made a trip." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Yusra stopped working." (target `aspectual`): r1 target_fired [activity×1, aspectual×1, named-entity×1] · r2 target_fired [activity×1, aspectual×1, named-entity×1] · r3 target_fired [activity×1, aspectual×1, named-entity×1]
- "Lamine made the wax soft." (target `change-of-state`): r1 target_fired [change-of-state×1, named-entity×1, witness×1] · r2 target_fired [change-of-state×1, named-entity×1, witness×1] · r3 target_fired [change-of-state×1, named-entity×1, witness×1]

Mismatches: none

## change-of-state — held_out

21 cases, 63 records (ok 63; stale prompt 63; stale manifest 9, unstamped 54) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 13 | 39 | 39 | 39 | 39 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 51/51 · abstain cases false fires 0/12
- fill: exact 51/51 among fires
- stability: pairwise agreement 1.0 (21 cases, 63 pairs), unanimous 21/21
- type check: 63/63 emitted parses type
- graph lints: none
- spans: 168/168 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 63 calls · in 4,210,455 · cached 3,915,838 (93% of the input) · out 8,806 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ladder fell." (target `motion`): r1 target_fired [motion×1, witness×1] · r2 target_fired [motion×1, witness×1] · r3 target_fired [motion×1, witness×1]
- "Yusra stopped working." (target `aspectual`): r1 target_fired [activity×1, aspectual×1, named-entity×1] · r2 target_fired [activity×1, aspectual×1, named-entity×1] · r3 target_fired [activity×1, aspectual×1, named-entity×1]
- "Teodor built a shed." (target `creation`): r1 target_fired [creation×1, named-entity×1, witness×1] · r2 target_fired [creation×1, named-entity×1, witness×1] · r3 target_fired [creation×1, named-entity×1, witness×1]
- "Ottoline helped Lamine." (target `activity`): r1 target_fired [activity×1, named-entity×2] · r2 target_fired [activity×1, named-entity×2] · r3 target_fired [activity×1, named-entity×2]

Mismatches: none

## class-property — held_out

16 cases, 48 records (ok 48; stale prompt 48; stale manifest 0, unstamped 48) · gemini-4-argon effort=low

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

19 cases, 57 records (ok 57; stale prompt 57; stale manifest 18, unstamped 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 12 | 36 | 36 | 36 | 36 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 45/45 · abstain cases false fires 0/12
- fill: exact 45/45 among fires
- stability: pairwise agreement 1.0 (19 cases, 57 pairs), unanimous 19/19
- type check: 57/57 emitted parses type
- graph lints: none
- spans: 81/81 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 57 calls · in 4,099,776 · cached 3,659,335 (89% of the input) · out 5,877 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferrets are curious." (target `group`): r1 target_fired [copular×1, distribution×1, group×1] · r2 target_fired [copular×1, distribution×1, group×1] · r3 target_fired [copular×1, distribution×1, group×1]
- "Yusra is a weaver." (target `copular`): r1 target_fired [copular×1, named-entity×1] · r2 target_fired [copular×1, named-entity×1] · r3 target_fired [copular×1, named-entity×1]
- "Ferrets are widespread." (target `class-property`): r1 target_fired [class-property×1] · r2 target_fired [class-property×1] · r3 target_fired [class-property×1]
- "Wax is soft when warm." (target `conditional-property`): r1 target_fired [conditional-property×1, copular×2, range×1] · r2 target_fired [conditional-property×1, copular×2, range×1] · r3 target_fired [conditional-property×1, copular×2, range×1]

Mismatches: none

## communication — held_out

15 cases, 45 records (ok 45; stale prompt 45; stale manifest 6, unstamped 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 2 | 6 | 0 (false fires) | – | 6 |

- selection: fire cases fired 39/39 · abstain cases false fires 0/6
- fill: exact 39/39 among fires
- stability: pairwise agreement 1.0 (15 cases, 45 pairs), unanimous 15/15
- type check: 45/45 emitted parses type
- graph lints: none
- spans: 222/222 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 45 calls · in 2,885,979 · cached 2,616,077 (91% of the input) · out 9,842 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra gave Ottoline a call." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Lamine handed Teodor an envelope." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none

## comparative — held_out

21 cases, 63 records (ok 63; stale prompt 63; stale manifest 6, unstamped 57) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 13 | 39 | 39 | 39 | 39 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 6 | 18 | 0 (false fires) | – | 18 |

- selection: fire cases fired 45/45 · abstain cases false fires 0/18
- fill: exact 45/45 among fires
- stability: pairwise agreement 0.968 (21 cases, 63 pairs), unanimous 20/21
- type check: 60/60 emitted parses type
- graph lints: none
- spans: 178/178 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 63 calls · in 4,417,026 · cached 4,160,466 (94% of the input) · out 9,762 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 6
  - P00 · comparative · r1 "Ottoline is taller than Yusra was.": The template says 'a standard that is a clause — taller than Yusra was, older than she looks: no slot here; report the than-phrase as unmapped', but reporting only the than-phrase as unmapped leaves 'Ottoline is taller' with no standard, which cannot be encoded as a comparative without a standard.
  - P00 · comparative · r2 "Ottoline is taller than Yusra was.": The boundary case 'a standard that is a clause — taller than Yusra was, older than she looks: no slot here; report the than-phrase as unmapped' says to report the than-phrase as unmapped, but the positive property ('is tall') is not entailed and 'comparative' requires 'standard', so the whole comparative clause must be reported as unmapped.
  - P00 · comparative · r3 "Ottoline is taller than Yusra was.": The boundary case 'a standard that is a clause — taller than Yusra was' instructs to report the than-phrase as unmapped, but the comparative template requires the `standard` slot to be filled, making it impossible to encode the rest of the clause without violating the G01 boundary.
  - P00 · Lemmas and symbols / witness · r1 "An older weaver is mending a quilt.": The Lemmas and symbols section states to lemmatize adjectives to the base (taller -> tall), whereas the witness example for a comparative before a noun ('a sturdier bracket') keeps the comparative form 'sturdier' in props.
  - P00 · witness · r2 "An older weaver is mending a quilt.": The Lemmas and symbols section says to lemmatize adjectives to the base form (taller -> tall), whereas the witness example for a comparative before a noun with no stated standard keeps the comparative form as written (sturdier).
  - P00 · Lemmas and symbols / witness · r3 "An older weaver is mending a quilt.": 'Lemmas and symbols' says to lemmatize adjectives to the base (taller -> tall), while the 'witness' example keeps a comparative before a noun with no stated standard in its comparative form ('sturdier').

Abstain cases (what the parser did, per run):
- "The stew is too hot." (target `degree`): r1 target_fired [degree×1, witness×1] · r2 target_fired [degree×1, witness×1] · r3 target_fired [degree×1, witness×1]
- "Teodor has more quilts than Yusra." (gap G00): r1 gap_reported [named-entity×2, possession×1; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "The bracket is sturdier." (gap G01): r1 gap_reported [nothing fired; unmapped G01] · r2 gap_reported [nothing fired; unmapped G01] · r3 gap_reported [nothing fired; unmapped G01]
- "Ottoline is taller than Yusra was." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "An older weaver is mending a quilt." (target `witness`): r1 target_fired [activity×1, witness×2] · r2 target_fired [activity×1, witness×2] · r3 target_fired [activity×1, witness×2]
- "Yusra is the tallest weaver." (target `superlative`): r1 target_fired [named-entity×1, superlative×1] · r2 target_fired [named-entity×1, superlative×1] · r3 target_fired [named-entity×1, superlative×1]

Mismatches: none

## conditional — held_out

13 cases, 39 records (ok 39; stale prompt 39; stale manifest 0, unstamped 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 7 | 21 | 21 | 21 | 21 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/12
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- spans: 183/183 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 2,765,991 · cached 2,617,092 (95% of the input) · out 8,635 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 1
  - P00 · Unmapped spans · r2 "Teodor is grumpy when tired.": The 'Unmapped spans' section lists a condition on an individual ('the ladder is brittle when cold') as an example of a whole clause to report as unmapped, whereas the 'conditional' template explicitly covers '<X> is ADJ when / if ADJ' with the example 'Teodor is grumpy when tired'.

Abstain cases (what the parser did, per run):
- "If Lamine had sung, Yusra would have left." (target `counterfactual`): r1 target_fired [activity×1, counterfactual×1, motion×1, named-entity×2] · r2 target_fired [activity×1, counterfactual×1, motion×1, named-entity×2] · r3 target_fired [activity×1, counterfactual×1, motion×1, named-entity×2]
- "Whenever Yusra sang, the ferret hid." (target `frequency`): r1 target_fired [activity×2, frequency×1, named-entity×1, witness×1] · r2 target_fired [activity×2, frequency×1, named-entity×1, witness×1] · r3 target_fired [activity×2, frequency×1, named-entity×1, witness×1]
- "Unless Yusra sings, Lamine leaves." (gap G08): r1 gap_reported [named-entity×2; unmapped G08] · r2 gap_reported [named-entity×2; unmapped G08] · r3 gap_reported [named-entity×2; unmapped G08]
- "Tin is brittle when cold." (target `conditional-property`): r1 target_fired [conditional-property×1, copular×2, range×1] · r2 target_fired [conditional-property×1, copular×2, range×1] · r3 target_fired [conditional-property×1, copular×2, range×1]

Mismatches: none

## conditional-property — held_out

14 cases, 42 records (ok 42; stale prompt 42; stale manifest 3, unstamped 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 6 | 18 | 0 (false fires) | – | 18 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/18
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (14 cases, 42 pairs), unanimous 14/14
- type check: 39/39 emitted parses type
- graph lints: none
- spans: 153/153 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 42 calls · in 2,597,568 · cached 2,333,662 (90% of the input) · out 8,344 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 1
  - P00 · Unmapped spans · r3 "The ladder is brittle when cold.": The Unmapped spans section lists 'the ladder is brittle when cold' as an example to leave out, contradicting the conditional and conditional-property templates which explicitly specify using the conditional template for 'the ladder is brittle when cold'.

Abstain cases (what the parser did, per run):
- "The ladder is brittle when cold." (target `conditional`): r1 target_fired [conditional×1, copular×2, witness×1] · r2 target_fired [conditional×1, copular×2, witness×1] · r3 target_fired [conditional×1, copular×2, witness×1]
- "Herons are patient if the weather is sunny." (target `conditional`): r1 target_fired [conditional×1, copular×2, range×1, witness×1] · r2 target_fired [conditional×1, copular×2, range×1, witness×1] · r3 target_fired [conditional×1, copular×2, range×1, witness×1]
- "Pewter is solid at room temperature." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Clay softens when wet." (target `generic`): r1 target_fired [change-of-state×1, copular×1, generic×1, range×1] · r2 target_fired [change-of-state×1, copular×1, generic×1, range×1] · r3 target_fired [change-of-state×1, copular×1, generic×1, range×1]
- "Herons are patient." (target `class-statement`): r1 target_fired [class-statement×1] · r2 target_fired [class-statement×1] · r3 target_fired [class-statement×1]
- "Otters are rare." (target `class-property`): r1 target_fired [class-property×1] · r2 target_fired [class-property×1] · r3 target_fired [class-property×1]

Mismatches: none

## control — held_out

14 cases, 42 records (ok 42; stale prompt 42; stale manifest 0, unstamped 42) · gemini-4-argon effort=low

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
- spans: 159/159 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 42 calls · in 2,454,861 · cached 2,368,775 (96% of the input) · out 7,883 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 1
  - P01 · motion · r2 "Teodor learned to swim.": Intransitive 'swim' with no path or destination could be parsed as `motion` (where 'swim' is an anchor verb) or `activity` (as an action with no change of place).

Abstain cases (what the parser did, per run):
- "Lamine let Ottoline leave." (target `causative`): r1 target_fired [causative×1, motion×1, named-entity×2] · r2 target_fired [causative×1, motion×1, named-entity×2] · r3 target_fired [causative×1, motion×1, named-entity×2]
- "Yusra stopped working." (target `aspectual`): r1 target_fired [activity×1, aspectual×1, named-entity×1] · r2 target_fired [activity×1, aspectual×1, named-entity×1] · r3 target_fired [activity×1, aspectual×1, named-entity×1]
- "Teodor seems to be tired." (target `evidential`): r1 target_fired [copular×1, evidential×1, named-entity×1] · r2 target_fired [copular×1, evidential×1, named-entity×1] · r3 target_fired [copular×1, evidential×1, named-entity×1]
- "Yusra went to the market to buy a thermos." (target `purpose`): r1 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r2 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r3 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2]

Mismatches: none

## copular — held_out

21 cases, 63 records (ok 63; stale prompt 60; stale manifest 18, unstamped 42) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 10 | 30 | 30 | 30 | 30 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 5 | 15 | 15 | 15 | 15 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 51/51 · abstain cases false fires 0/12
- fill: exact 51/51 among fires
- stability: pairwise agreement 1.0 (21 cases, 63 pairs), unanimous 21/21
- type check: 63/63 emitted parses type
- graph lints: none
- spans: 147/147 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 63 calls · in 4,997,958 · cached 4,814,229 (96% of the input) · out 7,923 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Herons are birds." (target `class-statement`): r1 target_fired [class-statement×1] · r2 target_fired [class-statement×1] · r3 target_fired [class-statement×1]
- "Teodor is the locksmith." (target `identity`): r1 target_fired [identity×1, named-entity×1, witness×1] · r2 target_fired [identity×1, named-entity×1, witness×1] · r3 target_fired [identity×1, named-entity×1, witness×1]
- "Teodor is extremely tired." (target `degree`): r1 target_fired [degree×1, named-entity×1] · r2 target_fired [degree×1, named-entity×1] · r3 target_fired [degree×1, named-entity×1]
- "Lamine is fond of Yusra." (target `adjective-complement`): r1 target_fired [adjective-complement×1, named-entity×2] · r2 target_fired [adjective-complement×1, named-entity×2] · r3 target_fired [adjective-complement×1, named-entity×2]

Mismatches: none

## coref — held_out

13 cases, 39 records (ok 39; stale prompt 39; stale manifest 18, unstamped 21) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 30/30 · abstain cases false fires 0/9
- fill: exact 30/30 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- spans: 174/174 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 3,256,599 · cached 3,176,449 (98% of the input) · out 8,043 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "That is false." (gap G11): r1 gap_reported [nothing fired; unmapped G11] · r2 gap_reported [nothing fired; unmapped G11] · r3 gap_reported [nothing fired; unmapped G11]
- "Yusra gave up." (target `activity`): r1 target_fired [activity×1, named-entity×1] · r2 target_fired [activity×1, named-entity×1] · r3 target_fired [activity×1, named-entity×1]
- "The clerk who laughed left." (target `activity`): r1 target_fired [activity×1, motion×1, witness×1] · r2 target_fired [activity×1, motion×1, witness×1] · r3 target_fired [activity×1, motion×1, witness×1]

Mismatches: none

## counterfactual — held_out

6 cases, 18 records (ok 18; stale prompt 18; stale manifest 3, unstamped 15) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 3 | 9 | 9 | 9 | 9 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 2 | 6 | 0 (false fires) | – | 6 |

- selection: fire cases fired 12/12 · abstain cases false fires 0/6
- fill: exact 12/12 among fires
- stability: pairwise agreement 1.0 (6 cases, 18 pairs), unanimous 6/6
- type check: 18/18 emitted parses type
- graph lints: none
- spans: 90/90 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 18 calls · in 1,366,818 · cached 1,261,058 (92% of the input) · out 3,948 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "If Lamine sings, Yusra leaves." (target `conditional`): r1 target_fired [activity×1, conditional×1, motion×1, named-entity×2] · r2 target_fired [activity×1, conditional×1, motion×1, named-entity×2] · r3 target_fired [activity×1, conditional×1, motion×1, named-entity×2]
- "Yusra would have left." (target `modal`): r1 target_fired [modal×1, motion×1, named-entity×1] · r2 target_fired [modal×1, motion×1, named-entity×1] · r3 target_fired [modal×1, motion×1, named-entity×1]

Mismatches: none

## creation — held_out

22 cases, 66 records (ok 66; stale prompt 66; stale manifest 18, unstamped 48) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 12 | 36 | 36 | 36 | 36 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 3 | 9 | 9 | 9 | 9 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 54/54 · abstain cases false fires 0/12
- fill: exact 54/54 among fires
- stability: pairwise agreement 1.0 (22 cases, 66 pairs), unanimous 22/22
- type check: 66/66 emitted parses type
- graph lints: none
- spans: 228/228 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 66 calls · in 4,613,190 · cached 4,477,695 (97% of the input) · out 10,826 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra wrote Teodor a letter." (target `communication`): r1 target_fired [communication×1, named-entity×2, witness×1] · r2 target_fired [communication×1, named-entity×2, witness×1] · r3 target_fired [communication×1, named-entity×2, witness×1]
- "Lamine made the wax soft." (target `change-of-state`): r1 target_fired [change-of-state×1, named-entity×1, witness×1] · r2 target_fired [change-of-state×1, named-entity×1, witness×1] · r3 target_fired [change-of-state×1, named-entity×1, witness×1]
- "Ottoline painted the shed." (target `activity`): r1 target_fired [activity×1, named-entity×1, witness×1] · r2 target_fired [activity×1, named-entity×1, witness×1] · r3 target_fired [activity×1, named-entity×1, witness×1]
- "Lamine made Yusra send the quilt." (target `causative`): r1 target_fired [causative×1, named-entity×2, transfer×1, witness×1] · r2 target_fired [causative×1, named-entity×2, transfer×1, witness×1] · r3 target_fired [causative×1, named-entity×2, transfer×1, witness×1]

Mismatches: none

## degree — held_out

18 cases, 54 records (ok 54; stale prompt 54; stale manifest 0, unstamped 54) · gemini-4-argon effort=low

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
- spans: 123/123 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 54 calls · in 3,114,924 · cached 2,949,799 (95% of the input) · out 6,712 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ladder is crooked." (target `copular`): r1 target_fired [copular×1, witness×1] · r2 target_fired [copular×1, witness×1] · r3 target_fired [copular×1, witness×1]
- "Teodor added too much salt." (gap G00): r1 gap_reported [activity×1, named-entity×1; unmapped G00] · r2 gap_reported [activity×1, named-entity×1; unmapped G00] · r3 gap_reported [activity×1, named-entity×1; unmapped G00]
- "Lamine barely moved." (target `extent`): r1 target_fired [extent×1, motion×1, named-entity×1] · r2 target_fired [extent×1, motion×1, named-entity×1] · r3 target_fired [extent×1, motion×1, named-entity×1]
- "Ferrets are very curious." (gap G02): r1 gap_reported [class-statement×1; unmapped G02] · r2 gap_reported [class-statement×1; unmapped G02] · r3 gap_reported [class-statement×1; unmapped G02]
- "Teodor is taller than Yusra." (target `comparative`): r1 target_fired [comparative×1, named-entity×2] · r2 target_fired [comparative×1, named-entity×2] · r3 target_fired [comparative×1, named-entity×2]
- "Yusra is the tallest weaver." (target `superlative`): r1 target_fired [named-entity×1, superlative×1] · r2 target_fired [named-entity×1, superlative×1] · r3 target_fired [named-entity×1, superlative×1]

Mismatches: none

## direction — held_out

7 cases, 21 records (ok 21; stale prompt 21; stale manifest 21, unstamped 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| abstain | 2 | 6 | 0 (false fires) | – | 6 |

- selection: fire cases fired 15/15 · abstain cases false fires 0/6
- fill: exact 15/15 among fires
- stability: pairwise agreement 1.0 (7 cases, 21 pairs), unanimous 7/7
- type check: 21/21 emitted parses type
- graph lints: none
- spans: 72/72 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 21 calls · in 2,362,275 · cached 2,319,138 (98% of the input) · out 3,274 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferret ran around the hut." (target `oblique`): r1 target_fired [motion×1, oblique×1, witness×2] · r2 target_fired [motion×1, oblique×1, witness×2] · r3 target_fired [motion×1, oblique×1, witness×2]
- "Lamine put away the quilt." (target `activity`): r1 target_fired [activity×1, named-entity×1, witness×1] · r2 target_fired [activity×1, named-entity×1, witness×1] · r3 target_fired [activity×1, named-entity×1, witness×1]

Mismatches: none

## distribution — held_out

8 cases, 24 records (ok 24; stale prompt 24; stale manifest 6, unstamped 18) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 3 | 9 | 9 | 9 | 9 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 15/15 · abstain cases false fires 0/9
- fill: exact 15/15 among fires
- stability: pairwise agreement 1.0 (8 cases, 24 pairs), unanimous 8/8
- type check: 24/24 emitted parses type
- graph lints: none
- spans: 78/78 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 24 calls · in 1,670,565 · cached 1,461,647 (87% of the input) · out 3,705 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferrets surrounded the barn." (target `group`): r1 target_fired [activity×1, group×1, witness×1] · r2 target_fired [activity×1, group×1, witness×1] · r3 target_fired [activity×1, group×1, witness×1]
- "Yusra led a search for three ferrets." (target `postmodifier`): r1 target_fired [activity×1, group×1, named-entity×1, postmodifier×1, witness×1] · r2 target_fired [activity×1, group×1, named-entity×1, postmodifier×1, witness×1] · r3 target_fired [activity×1, group×1, named-entity×1, postmodifier×1, witness×1]
- "Herons are patient." (target `class-statement`): r1 target_fired [class-statement×1] · r2 target_fired [class-statement×1] · r3 target_fired [class-statement×1]

Mismatches: none

## evidential — held_out

14 cases, 42 records (ok 42; stale prompt 42; stale manifest 0, unstamped 42) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 10 | 30 | 30 | 30 | 30 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 33/33 · abstain cases false fires 0/9
- fill: exact 33/33 among fires
- stability: pairwise agreement 1.0 (14 cases, 42 pairs), unanimous 14/14
- type check: 42/42 emitted parses type
- graph lints: none
- spans: 123/123 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 42 calls · in 3,515,064 · cached 3,428,687 (98% of the input) · out 6,111 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor might be tired." (target `modal`): r1 target_fired [copular×1, modal×1, named-entity×1] · r2 target_fired [copular×1, modal×1, named-entity×1] · r3 target_fired [copular×1, modal×1, named-entity×1]
- "Yusra feels tired." (target `sensation`): r1 target_fired [named-entity×1, sensation×1] · r2 target_fired [named-entity×1, sensation×1] · r3 target_fired [named-entity×1, sensation×1]
- "The school looks like a prison." (target `stative-relation`): r1 target_fired [stative-relation×1, witness×2] · r2 target_fired [stative-relation×1, witness×2] · r3 target_fired [stative-relation×1, witness×2]

Mismatches: none

## extent — held_out

18 cases, 54 records (ok 54; stale prompt 54; stale manifest 9, unstamped 45) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 9 | 27 | 27 | 27 | 27 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 39/39 · abstain cases false fires 0/15
- fill: exact 39/39 among fires
- stability: pairwise agreement 1.0 (18 cases, 54 pairs), unanimous 18/18
- type check: 51/51 emitted parses type
- graph lints: none
- spans: 186/186 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 54 calls · in 3,596,760 · cached 3,256,534 (91% of the input) · out 9,067 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra laughed very loudly." (gap G02): r1 gap_reported [activity×1, manner×1, named-entity×1; unmapped G02] · r2 gap_reported [activity×1, manner×1, named-entity×1; unmapped G02] · r3 gap_reported [activity×1, manner×1, named-entity×1; unmapped G02]
- "The ladder almost fell." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Lamine waited patiently." (target `manner`): r1 target_fired [activity×1, manner×1, named-entity×1] · r2 target_fired [activity×1, manner×1, named-entity×1] · r3 target_fired [activity×1, manner×1, named-entity×1]
- "Lamine often laughed." (target `frequency`): r1 target_fired [activity×1, frequency×1, named-entity×1] · r2 target_fired [activity×1, frequency×1, named-entity×1] · r3 target_fired [activity×1, frequency×1, named-entity×1]
- "Teodor is extremely tired." (target `degree`): r1 target_fired [degree×1, named-entity×1] · r2 target_fired [degree×1, named-entity×1] · r3 target_fired [degree×1, named-entity×1]

Mismatches: none

## focus — held_out

24 cases, 72 records (ok 72; stale prompt 72; stale manifest 3, unstamped 69) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 14 | 42 | 42 | 42 | 42 |
| scoped | 6 | 18 | 18 | 18 | 18 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 60/60 · abstain cases false fires 0/12
- fill: exact 60/60 among fires
- stability: pairwise agreement 1.0 (24 cases, 72 pairs), unanimous 24/24
- type check: 72/72 emitted parses type
- graph lints: none
- spans: 243/243 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 72 calls · in 4,539,204 · cached 4,282,705 (94% of the input) · out 11,701 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferret slept alone." (target `manner`): r1 target_fired [activity×1, manner×1, witness×1] · r2 target_fired [activity×1, manner×1, witness×1] · r3 target_fired [activity×1, manner×1, witness×1]
- "Also, Teodor left." (gap G05): r1 gap_reported [motion×1, named-entity×1; unmapped G05] · r2 gap_reported [motion×1, named-entity×1; unmapped G05] · r3 gap_reported [motion×1, named-entity×1; unmapped G05]
- "Teodor has just arrived." (gap G02): r1 gap_reported [motion×1, named-entity×1; unmapped G02] · r2 gap_reported [motion×1, named-entity×1; unmapped G02] · r3 gap_reported [motion×1, named-entity×1; unmapped G02]
- "Even though Lamine waited, Teodor left." (target `link`): r1 target_fired [activity×1, link×1, motion×1, named-entity×2] · r2 target_fired [activity×1, link×1, motion×1, named-entity×2] · r3 target_fired [activity×1, link×1, motion×1, named-entity×2]

Mismatches: none

## frequency — held_out

30 cases, 90 records (ok 90; stale prompt 90; stale manifest 6, unstamped 84) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 24 | 72 | 72 | 72 | 72 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 78/78 · abstain cases false fires 0/12
- fill: exact 78/78 among fires
- stability: pairwise agreement 1.0 (30 cases, 90 pairs), unanimous 30/30
- type check: 90/90 emitted parses type
- graph lints: none
- spans: 375/375 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 90 calls · in 6,052,812 · cached 5,748,277 (95% of the input) · out 16,709 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Visitors must never feed the ferrets." (target `norm`): r1 target_fired [activity×1, generic×1, group×1, norm×1, range×1] · r2 target_fired [activity×1, generic×1, group×1, norm×1, range×1] · r3 target_fired [activity×1, generic×1, group×1, norm×1, range×1]
- "Every ferret slept." (target `generic`): r1 target_fired [activity×1, generic×1, range×1] · r2 target_fired [activity×1, generic×1, range×1] · r3 target_fired [activity×1, generic×1, range×1]
- "Yusra never laughs." (target `negation`): r1 target_fired [activity×1, named-entity×1, negation×1] · r2 target_fired [activity×1, named-entity×1, negation×1] · r3 target_fired [activity×1, named-entity×1, negation×1]
- "Lamine used to sing." (target `habitual`): r1 target_fired [activity×1, habitual×1, named-entity×1] · r2 target_fired [activity×1, habitual×1, named-entity×1] · r3 target_fired [activity×1, habitual×1, named-entity×1]

Mismatches: none

## generic — held_out

28 cases, 84 records (ok 84; stale prompt 84; stale manifest 30, unstamped 54) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 23 | 69 | 69 | 69 | 69 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 75/75 · abstain cases false fires 0/9
- fill: exact 75/75 among fires
- stability: pairwise agreement 1.0 (28 cases, 84 pairs), unanimous 28/28
- type check: 84/84 emitted parses type
- graph lints: none
- spans: 309/309 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 84 calls · in 6,519,762 · cached 6,126,968 (94% of the input) · out 14,789 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "A few students laughed." (target `group`): r1 target_fired [activity×1, distribution×1, group×1] · r2 target_fired [activity×1, distribution×1, group×1] · r3 target_fired [activity×1, distribution×1, group×1]
- "Most herons are patient." (target `class-statement`): r1 target_fired [class-statement×1] · r2 target_fired [class-statement×1] · r3 target_fired [class-statement×1]
- "Wax is soft when warm." (target `conditional-property`): r1 target_fired [conditional-property×1, copular×2, range×1] · r2 target_fired [conditional-property×1, copular×2, range×1] · r3 target_fired [conditional-property×1, copular×2, range×1]

Mismatches: none

## group — held_out

18 cases, 54 records (ok 54; stale prompt 54; stale manifest 18, unstamped 36) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 13 | 39 | 39 | 39 | 39 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 45/45 · abstain cases false fires 0/9
- fill: exact 45/45 among fires
- stability: pairwise agreement 1.0 (18 cases, 54 pairs), unanimous 18/18
- type check: 54/54 emitted parses type
- graph lints: none
- spans: 174/174 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 54 calls · in 4,045,878 · cached 3,730,010 (92% of the input) · out 8,626 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The ferret slept." (target `activity`): r1 target_fired [activity×1, witness×1] · r2 target_fired [activity×1, witness×1] · r3 target_fired [activity×1, witness×1]
- "Every ferret slept." (target `generic`): r1 target_fired [activity×1, generic×1, range×1] · r2 target_fired [activity×1, generic×1, range×1] · r3 target_fired [activity×1, generic×1, range×1]
- "Teodor and Yusra laughed." (target `activity`): r1 target_fired [activity×2, named-entity×2] · r2 target_fired [activity×2, named-entity×2] · r3 target_fired [activity×2, named-entity×2]

Mismatches: none

## habitual — held_out

13 cases, 39 records (ok 39; stale prompt 39; stale manifest 3, unstamped 36) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 7 | 21 | 21 | 21 | 21 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/15
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- spans: 138/138 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 2,592,162 · cached 2,389,058 (92% of the input) · out 6,309 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Herons eat frogs." (target `generic`): r1 target_fired [activity×1, generic×1, range×1] · r2 target_fired [activity×1, generic×1, range×1] · r3 target_fired [activity×1, generic×1, range×1]
- "Teodor reads every day." (target `frequency`): r1 target_fired [activity×1, frequency×1, named-entity×1, range×1] · r2 target_fired [activity×1, frequency×1, named-entity×1, range×1] · r3 target_fired [activity×1, frequency×1, named-entity×1, range×1]
- "Yusra is sleeping." (target `activity`): r1 target_fired [activity×1, named-entity×1] · r2 target_fired [activity×1, named-entity×1] · r3 target_fired [activity×1, named-entity×1]
- "Lamine often laughed." (target `frequency`): r1 target_fired [activity×1, frequency×1, named-entity×1, range×1] · r2 target_fired [activity×1, frequency×1, named-entity×1, range×1] · r3 target_fired [activity×1, frequency×1, named-entity×1, range×1]
- "The ferret slept." (target `activity`): r1 target_fired [activity×1, witness×1] · r2 target_fired [activity×1, witness×1] · r3 target_fired [activity×1, witness×1]

Mismatches: none

## hedge — held_out

31 cases, 93 records (ok 93; stale prompt 93; stale manifest 3, unstamped 90) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 19 | 57 | 57 | 57 | 57 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 10 | 30 | 0 (false fires) | – | 30 |

- selection: fire cases fired 63/63 · abstain cases false fires 0/30
- fill: exact 63/63 among fires
- stability: pairwise agreement 1.0 (31 cases, 93 pairs), unanimous 31/31
- type check: 93/93 emitted parses type
- graph lints: none
- spans: 300/300 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 93 calls · in 8,756,424 · cached 8,378,713 (96% of the input) · out 14,629 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor might be tired." (target `modal`): r1 target_fired [copular×1, modal×1, named-entity×1] · r2 target_fired [copular×1, modal×1, named-entity×1] · r3 target_fired [copular×1, modal×1, named-entity×1]
- "Lamine was about to sing." (target `activity`): r1 target_fired [activity×1, named-entity×1] · r2 target_fired [activity×1, named-entity×1] · r3 target_fired [activity×1, named-entity×1]
- "Unfortunately, Yusra left." (gap G02): r1 gap_reported [motion×1, named-entity×1; unmapped G02] · r2 gap_reported [motion×1, named-entity×1; unmapped G02] · r3 gap_reported [motion×1, named-entity×1; unmapped G02]
- "Teodor believes that Lamine did not sell the spindle." (target `attitude`): r1 target_fired [attitude×1, named-entity×2, negation×1, transfer×1, witness×1] · r2 target_fired [attitude×1, named-entity×2, negation×1, transfer×1, witness×1] · r3 target_fired [attitude×1, named-entity×2, negation×1, transfer×1, witness×1]
- "Lamine often laughed." (target `frequency`): r1 target_fired [activity×1, frequency×1, named-entity×1, range×1] · r2 target_fired [activity×1, frequency×1, named-entity×1, range×1] · r3 target_fired [activity×1, frequency×1, named-entity×1, range×1]
- "According to Lamine, the gate is open." (target `attitude`): r1 target_fired [attitude×1, copular×1, named-entity×1, witness×1] · r2 target_fired [attitude×1, copular×1, named-entity×1, witness×1] · r3 target_fired [attitude×1, copular×1, named-entity×1, witness×1]
- "Perhaps Yusra left." (target `modal`): r1 target_fired [modal×1, motion×1, named-entity×1] · r2 target_fired [modal×1, motion×1, named-entity×1] · r3 target_fired [modal×1, motion×1, named-entity×1]
- "Ottoline is about 40 years old." (target `measure`): r1 target_fired [measure×1, named-entity×1] · r2 target_fired [measure×1, named-entity×1] · r3 target_fired [measure×1, named-entity×1]
- "Lamine is sure that Yusra left." (target `attitude`): r1 target_fired [attitude×1, motion×1, named-entity×2] · r2 target_fired [attitude×1, motion×1, named-entity×2] · r3 target_fired [attitude×1, motion×1, named-entity×2]
- "Teodor is supposed to wait." (target `norm`): r1 target_fired [activity×1, named-entity×1, norm×1] · r2 target_fired [activity×1, named-entity×1, norm×1] · r3 target_fired [activity×1, named-entity×1, norm×1]

Mismatches: none

## identity — held_out

6 cases, 18 records (ok 18; stale prompt 0; stale manifest 0, unstamped 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 6 | 18 | 18 | 18 | 18 |

- selection: fire cases fired 18/18 · abstain cases false fires 0/0
- fill: exact 18/18 among fires
- stability: pairwise agreement 1.0 (6 cases, 18 pairs), unanimous 6/6
- type check: 18/18 emitted parses type
- graph lints: none
- spans: 66/66 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 18 calls · in 2,198,085 · cached 2,155,503 (98% of the input) · out 2,712 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Mismatches: none

## imperative — held_out

18 cases, 54 records (ok 54; stale prompt 54; stale manifest 0, unstamped 54) · gemini-4-argon effort=low

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
- usage: 54 calls · in 3,102,228 · cached 2,773,756 (89% of the input) · out 8,478 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Let's go to the market." (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Could you lock the shed?" (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "The quilt was washed." (target `activity`): r1 target_fired [activity×1, witness×1] · r2 target_fired [activity×1, witness×1] · r3 target_fired [activity×1, witness×1]
- "Yusra has to send the quilt." (target `norm`): r1 target_fired [named-entity×1, norm×1, transfer×1, witness×1] · r2 target_fired [named-entity×1, norm×1, transfer×1, witness×1] · r3 target_fired [named-entity×1, norm×1, transfer×1, witness×1]

Mismatches: none

## link — held_out

18 cases, 54 records (ok 54; stale prompt 54; stale manifest 3, unstamped 51) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 12 | 36 | 36 | 36 | 36 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 42/42 · abstain cases false fires 0/12
- fill: exact 42/42 among fires
- stability: pairwise agreement 1.0 (18 cases, 54 pairs), unanimous 18/18
- type check: 54/54 emitted parses type
- graph lints: none
- spans: 291/291 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 54 calls · in 3,669,357 · cached 3,500,989 (95% of the input) · out 12,483 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra laughed because of the rain." (target `oblique`): r1 target_fired [activity×1, named-entity×1, oblique×1, witness×1] · r2 target_fired [activity×1, named-entity×1, oblique×1, witness×1] · r3 target_fired [activity×1, named-entity×1, oblique×1, witness×1]
- "If Lamine sings, Yusra leaves." (target `conditional`): r1 target_fired [activity×1, conditional×1, motion×1, named-entity×2] · r2 target_fired [activity×1, conditional×1, motion×1, named-entity×2] · r3 target_fired [activity×1, conditional×1, motion×1, named-entity×2]
- "Lamine waited while Yusra sang." (target `time-relation`): r1 target_fired [activity×2, named-entity×2, time-relation×1] · r2 target_fired [activity×2, named-entity×2, time-relation×1] · r3 target_fired [activity×2, named-entity×2, time-relation×1]
- "Yusra went to the market to buy a thermos." (target `purpose`): r1 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r2 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2] · r3 target_fired [acquisition×1, motion×1, named-entity×1, purpose×1, witness×2]

Mismatches: none

## location — held_out

25 cases, 75 records (ok 75; stale prompt 75; stale manifest 27, unstamped 48) · gemini-4-argon effort=low

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
- spans: 327/327 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 75 calls · in 5,911,476 · cached 5,650,809 (96% of the input) · out 14,939 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor arrived in 2019." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Teodor ran across the field." (target `motion`): r1 target_fired [motion×1, named-entity×1, oblique×1, witness×1] · r2 target_fired [motion×1, named-entity×1, oblique×1, witness×1] · r3 target_fired [motion×1, named-entity×1, oblique×1, witness×1]
- "Lamine was modest in his demands." (target `adjective-complement`): r1 target_fired [adjective-complement×1, coref×1, group×1, mention×1, named-entity×1] · r2 target_fired [adjective-complement×1, coref×1, group×1, mention×1, named-entity×1] · r3 target_fired [adjective-complement×1, coref×1, group×1, mention×1, named-entity×1]

Mismatches: none

## locative — held_out

22 cases, 66 records (ok 66; stale prompt 66; stale manifest 18, unstamped 48) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 16 | 48 | 48 | 48 | 48 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 57/57 · abstain cases false fires 0/9
- fill: exact 57/57 among fires
- stability: pairwise agreement 1.0 (22 cases, 66 pairs), unanimous 22/22
- type check: 66/66 emitted parses type
- graph lints: none
- spans: 207/207 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 66 calls · in 4,719,330 · cached 4,478,321 (95% of the input) · out 10,603 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The meeting is at noon." (target `time`): r1 target_fired [time×1, witness×1] · r2 target_fired [time×1, witness×1] · r3 target_fired [time×1, witness×1]
- "Lamine is in trouble." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine entered the shed." (target `motion`): r1 target_fired [motion×1, named-entity×1, witness×1] · r2 target_fired [motion×1, named-entity×1, witness×1] · r3 target_fired [motion×1, named-entity×1, witness×1]

Mismatches: none

## manner — held_out

13 cases, 39 records (ok 39; stale prompt 39; stale manifest 0, unstamped 39) · gemini-4-argon effort=low

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
- spans: 135/135 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 2,327,028 · cached 2,192,647 (94% of the input) · out 6,098 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor arrived in 2019." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Yusra deeply distrusts Lamine." (target `extent`): r1 target_fired [extent×1, named-entity×2, psych×1] · r2 target_fired [extent×1, named-entity×2, psych×1] · r3 target_fired [extent×1, named-entity×2, psych×1]
- "Yusra probably left." (target `hedge`): r1 target_fired [hedge×1, motion×1, named-entity×1] · r2 target_fired [hedge×1, motion×1, named-entity×1] · r3 target_fired [hedge×1, motion×1, named-entity×1]
- "Lamine often laughed." (target `frequency`): r1 target_fired [activity×1, frequency×1, named-entity×1] · r2 target_fired [activity×1, frequency×1, named-entity×1] · r3 target_fired [activity×1, frequency×1, named-entity×1]

Mismatches: none

## measure — held_out

25 cases, 75 records (ok 75; stale prompt 75; stale manifest 12, unstamped 63) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 23 | 69 | 69 | 69 | 69 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 1 | 3 | 0 (false fires) | – | 3 |

- selection: fire cases fired 72/72 · abstain cases false fires 0/3
- fill: exact 72/72 among fires
- stability: pairwise agreement 1.0 (25 cases, 75 pairs), unanimous 25/25
- type check: 75/75 emitted parses type
- graph lints: none
- spans: 210/210 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 75 calls · in 6,555,465 · cached 5,921,744 (90% of the input) · out 12,057 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 4
  - P00 · comparative · r1 "The bridge is more than 200 metres long.": The comparative template says under 'Not this template' both that a comparison against a bare number such as 'more than 200 metres long' uses the measure template and, in another bullet, to report a comparison with a measure as unmapped.
  - P00 · part-whole · r1 "The parcel weighs a pound.": The Not this template section of part-whole and stative-relation state that a measure like 'weighs a pound' has no template yet and should be reported as unmapped (G00), contradicting the measure template which explicitly covers 'weighs <n> <unit>'.
  - P00 · part-whole · r2 "The parcel weighs a pound.": The boundary section of part-whole and stative-relation state that 'weighs a pound' has no template yet (G00), contradicting the measure template which explicitly covers 'weighs <n> <unit>'.
  - P00 · part-whole · r3 "The parcel weighs a pound.": The 'Not this template' section of part-whole and stative-relation states that 'weighs a pound, costs a dollar' has no template yet (G00), contradicting the measure template which explicitly covers 'weighs / costs / measures <n> <unit>'.

Abstain cases (what the parser did, per run):
- "The stew is too hot." (target `degree`): r1 target_fired [degree×1, witness×1] · r2 target_fired [degree×1, witness×1] · r3 target_fired [degree×1, witness×1]

Mismatches: none

## modal — held_out

11 cases, 33 records (ok 33; stale prompt 33; stale manifest 9, unstamped 24) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 2 | 6 | 0 (false fires) | – | 6 |

- selection: fire cases fired 27/27 · abstain cases false fires 0/6
- fill: exact 27/27 among fires
- stability: pairwise agreement 1.0 (11 cases, 33 pairs), unanimous 11/11
- type check: 30/30 emitted parses type
- graph lints: none
- spans: 99/99 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 33 calls · in 2,865,408 · cached 2,698,854 (94% of the input) · out 4,863 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Would you close the window?" (gap G00): r1 gap_reported [nothing fired; unmapped G00] · r2 gap_reported [nothing fired; unmapped G00] · r3 gap_reported [nothing fired; unmapped G00]
- "Yusra has to send the quilt." (target `norm`): r1 target_fired [named-entity×1, norm×1, transfer×1, witness×1] · r2 target_fired [named-entity×1, norm×1, transfer×1, witness×1] · r3 target_fired [named-entity×1, norm×1, transfer×1, witness×1]

Mismatches: none

## motion — held_out

21 cases, 63 records (ok 63; stale prompt 63; stale manifest 9, unstamped 54) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 10 | 30 | 30 | 30 | 30 |
| contrast | 2 | 6 | 6 | 6 | 6 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 2 | 6 | 6 | 6 | 6 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 51/51 · abstain cases false fires 0/12
- fill: exact 51/51 among fires
- stability: pairwise agreement 1.0 (21 cases, 63 pairs), unanimous 21/21
- type check: 63/63 emitted parses type
- graph lints: none
- spans: 189/189 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 63 calls · in 4,380,711 · cached 4,033,739 (92% of the input) · out 9,117 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra came to like the quilt." (target `aspectual`): r1 target_fired [aspectual×1, named-entity×1, psych×1, witness×1] · r2 target_fired [aspectual×1, named-entity×1, psych×1, witness×1] · r3 target_fired [aspectual×1, named-entity×1, psych×1, witness×1]
- "The price fell." (target `change-of-state`): r1 target_fired [change-of-state×1, witness×1] · r2 target_fired [change-of-state×1, witness×1] · r3 target_fired [change-of-state×1, witness×1]
- "Teodor made a trip." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Lamine handed Teodor an envelope." (target `transfer`): r1 target_fired [named-entity×2, transfer×1, witness×1] · r2 target_fired [named-entity×2, transfer×1, witness×1] · r3 target_fired [named-entity×2, transfer×1, witness×1]

Mismatches: none

## named-entity — held_out

13 cases, 39 records (ok 39; stale prompt 39; stale manifest 36, unstamped 3) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 13 | 39 | 39 | 39 | 39 |

- selection: fire cases fired 39/39 · abstain cases false fires 0/0
- fill: exact 39/39 among fires
- stability: pairwise agreement 1.0 (13 cases, 39 pairs), unanimous 13/13
- type check: 39/39 emitted parses type
- graph lints: none
- spans: 93/93 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 39 calls · in 4,039,893 · cached 3,851,405 (95% of the input) · out 5,318 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Mismatches: none

## negation — held_out

3 cases, 9 records (ok 9; stale prompt 9; stale manifest 6, unstamped 3) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 3 | 9 | 9 | 9 | 9 |

- selection: fire cases fired 9/9 · abstain cases false fires 0/0
- fill: exact 9/9 among fires
- stability: pairwise agreement 1.0 (3 cases, 9 pairs), unanimous 3/3
- type check: 9/9 emitted parses type
- graph lints: none
- spans: 33/33 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 9 calls · in 795,147 · cached 776,702 (98% of the input) · out 1,546 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Mismatches: none

## norm — held_out

32 cases, 96 records (ok 96; stale prompt 96; stale manifest 0, unstamped 96) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 25 | 75 | 75 | 75 | 75 |
| contrast | 1 | 3 | 3 | 3 | 3 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 81/81 · abstain cases false fires 0/15
- fill: exact 81/81 among fires
- stability: pairwise agreement 1.0 (32 cases, 96 pairs), unanimous 32/32
- type check: 96/96 emitted parses type
- graph lints: none
- spans: 366/366 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 96 calls · in 7,303,863 · cached 7,033,734 (96% of the input) · out 17,285 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 1
  - P00 · modal · r3 "Ottoline may leave.": The modal 'may' on an agentive verb ('Ottoline may leave') is ambiguous between permission (`norm`) and epistemic possibility (`modal`), and the sentence provides no context to decide the reading.

Abstain cases (what the parser did, per run):
- "Ottoline permitted Lamine to leave." (target `causative`): r1 target_fired [causative×1, motion×1, named-entity×2] · r2 target_fired [causative×1, motion×1, named-entity×2] · r3 target_fired [causative×1, motion×1, named-entity×2]
- "Ottoline must be hungry." (target `modal`): r1 target_fired [copular×1, modal×1, named-entity×1] · r2 target_fired [copular×1, modal×1, named-entity×1] · r3 target_fired [copular×1, modal×1, named-entity×1]
- "Lamine can swim." (target `modal`): r1 target_fired [activity×1, modal×1, named-entity×1] · r2 target_fired [activity×1, modal×1, named-entity×1] · r3 target_fired [activity×1, modal×1, named-entity×1]
- "This spindle is illegal." (target `copular`): r1 target_fired [copular×1, witness×1] · r2 target_fired [copular×1, witness×1] · r3 target_fired [copular×1, witness×1]
- "Teodor was allowed inside the shed." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

Mismatches: none

## oblique — held_out

37 cases, 111 records (ok 111; stale prompt 111; stale manifest 36, unstamped 75) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 25 | 75 | 75 | 75 | 75 |
| scoped | 4 | 12 | 12 | 12 | 12 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 7 | 21 | 0 (false fires) | – | 21 |

- selection: fire cases fired 90/90 · abstain cases false fires 0/21
- fill: exact 90/90 among fires
- stability: pairwise agreement 1.0 (37 cases, 111 pairs), unanimous 37/37
- type check: 111/111 emitted parses type
- graph lints: none
- spans: 438/438 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 111 calls · in 9,220,197 · cached 8,988,314 (97% of the input) · out 19,997 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor arrived in 2019." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Lamine sang instead of Yusra." (gap G00): r1 gap_reported [activity×1, named-entity×2; unmapped G00] · r2 gap_reported [activity×1, named-entity×2; unmapped G00] · r3 gap_reported [activity×1, named-entity×2; unmapped G00]
- "Yusra left after the audit." (target `time-relation`): r1 target_fired [motion×1, named-entity×1, time-relation×1, witness×1] · r2 target_fired [motion×1, named-entity×1, time-relation×1, witness×1] · r3 target_fired [motion×1, named-entity×1, time-relation×1, witness×1]
- "Lamine entered the shed." (target `motion`): r1 target_fired [motion×1, named-entity×1, witness×1] · r2 target_fired [motion×1, named-entity×1, witness×1] · r3 target_fired [motion×1, named-entity×1, witness×1]
- "The quilt was washed by Yusra." (target `activity`): r1 target_fired [activity×1, named-entity×1, witness×1] · r2 target_fired [activity×1, named-entity×1, witness×1] · r3 target_fired [activity×1, named-entity×1, witness×1]
- "Teodor is taller than Yusra." (target `comparative`): r1 target_fired [comparative×1, named-entity×2] · r2 target_fired [comparative×1, named-entity×2] · r3 target_fired [comparative×1, named-entity×2]
- "The ruling is a first step toward recovery." (gap G00): r1 gap_reported [superlative×1, witness×1; unmapped G00] · r2 gap_reported [superlative×1, witness×1; unmapped G00] · r3 gap_reported [superlative×1, witness×1; unmapped G00]

Mismatches: none

## part-whole — held_out

24 cases, 72 records (ok 72; stale prompt 72; stale manifest 18, unstamped 54) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 20 | 60 | 60 | 60 | 60 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 63/63 · abstain cases false fires 0/9
- fill: exact 63/63 among fires
- stability: pairwise agreement 1.0 (24 cases, 72 pairs), unanimous 24/24
- type check: 72/72 emitted parses type
- graph lints: none
- spans: 318/318 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 72 calls · in 6,205,185 · cached 5,904,184 (95% of the input) · out 15,180 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The box contains a letter." (target `locative`): r1 target_fired [locative×1, witness×2] · r2 target_fired [locative×1, witness×2] · r3 target_fired [locative×1, witness×2]
- "Half of the loaf is stale." (target `portion`): r1 target_fired [copular×1, portion×1, witness×1] · r2 target_fired [copular×1, portion×1, witness×1] · r3 target_fired [copular×1, portion×1, witness×1]
- "Lamine had a ladder." (target `possession`): r1 target_fired [named-entity×1, possession×1, witness×1] · r2 target_fired [named-entity×1, possession×1, witness×1] · r3 target_fired [named-entity×1, possession×1, witness×1]

Mismatches: none

## particle — held_out

3 cases, 9 records (ok 9; stale prompt 9; stale manifest 9, unstamped 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 3 | 9 | 9 | 9 | 9 |

- selection: fire cases fired 9/9 · abstain cases false fires 0/0
- fill: exact 9/9 among fires
- stability: pairwise agreement 1.0 (3 cases, 9 pairs), unanimous 3/3
- type check: 9/9 emitted parses type
- graph lints: none
- spans: 27/27 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 9 calls · in 965,538 · cached 841,860 (87% of the input) · out 1,251 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Mismatches: none

## perception — held_out

12 cases, 36 records (ok 36; stale prompt 36; stale manifest 3, unstamped 33) · gemini-4-argon effort=low

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
- spans: 114/114 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 36 calls · in 2,270,190 · cached 2,087,505 (92% of the input) · out 5,605 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra saw the point." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "Teodor felt tired." (target `sensation`): r1 target_fired [named-entity×1, sensation×1] · r2 target_fired [named-entity×1, sensation×1] · r3 target_fired [named-entity×1, sensation×1]
- "Yusra fears the ferret." (target `psych`): r1 target_fired [named-entity×1, psych×1, witness×1] · r2 target_fired [named-entity×1, psych×1, witness×1] · r3 target_fired [named-entity×1, psych×1, witness×1]

Mismatches: none

## portion — held_out

28 cases, 84 records (ok 84; stale prompt 84; stale manifest 3, unstamped 81) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 15 | 45 | 45 | 45 | 45 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 11 | 33 | 0 (false fires) | – | 33 |

- selection: fire cases fired 51/51 · abstain cases false fires 0/33
- fill: exact 51/51 among fires
- stability: pairwise agreement 1.0 (28 cases, 84 pairs), unanimous 28/28
- type check: 84/84 emitted parses type
- graph lints: none
- spans: 333/333 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 84 calls · in 7,519,611 · cached 7,255,630 (96% of the input) · out 15,883 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra's ferrets slept." (target `group`): r1 target_fired [activity×1, distribution×1, group×1, named-entity×1] · r2 target_fired [activity×1, distribution×1, group×1, named-entity×1] · r3 target_fired [activity×1, distribution×1, group×1, named-entity×1]
- "The price fell by 8 percent." (target `measure`): r1 target_fired [change-of-state×1, measure×1, witness×1] · r2 target_fired [change-of-state×1, measure×1, witness×1] · r3 target_fired [change-of-state×1, measure×1, witness×1]
- "Yusra drank a cup of tea." (target `measure`): r1 target_fired [activity×1, measure×1, named-entity×1, witness×1] · r2 target_fired [activity×1, measure×1, named-entity×1, witness×1] · r3 target_fired [activity×1, measure×1, named-entity×1, witness×1]
- "Every ferret slept." (target `generic`): r1 target_fired [activity×1, generic×1, range×1] · r2 target_fired [activity×1, generic×1, range×1] · r3 target_fired [activity×1, generic×1, range×1]
- "None of the ferrets slept." (target `generic`): r1 target_fired [activity×1, generic×1, range×1] · r2 target_fired [activity×1, generic×1, range×1] · r3 target_fired [activity×1, generic×1, range×1]
- "One of the weavers laughed." (target `part-whole`): r1 target_fired [activity×1, group×1, part-whole×1, witness×1] · r2 target_fired [activity×1, group×1, part-whole×1, witness×1] · r3 target_fired [activity×1, group×1, part-whole×1, witness×1]
- "Lamine drank a lot of water." (target `witness`): r1 target_fired [activity×1, named-entity×1, witness×1] · r2 target_fired [activity×1, named-entity×1, witness×1] · r3 target_fired [activity×1, named-entity×1, witness×1]
- "Lamine is a member of the guild." (target `part-whole`): r1 target_fired [named-entity×1, part-whole×1, witness×1] · r2 target_fired [named-entity×1, part-whole×1, witness×1] · r3 target_fired [named-entity×1, part-whole×1, witness×1]
- "All of the ferrets slept." (target `group`): r1 target_fired [activity×1, distribution×1, group×1] · r2 target_fired [activity×1, distribution×1, group×1] · r3 target_fired [activity×1, distribution×1, group×1]
- "Ottoline is one of the oldest glaziers." (target `superlative`): r1 target_fired [named-entity×1, superlative×1] · r2 target_fired [named-entity×1, superlative×1] · r3 target_fired [named-entity×1, superlative×1]
- "The ferrets slept." (target `group`): r1 target_fired [activity×1, distribution×1, group×1] · r2 target_fired [activity×1, distribution×1, group×1] · r3 target_fired [activity×1, distribution×1, group×1]

Mismatches: none

## possession — held_out

12 cases, 36 records (ok 36; stale prompt 36; stale manifest 3, unstamped 33) · gemini-4-argon effort=low

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
- spans: 120/120 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 36 calls · in 2,231,397 · cached 2,157,570 (97% of the input) · out 5,751 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor bought the spindle from Yusra." (target `acquisition`): r1 target_fired [acquisition×1, named-entity×2, witness×1] · r2 target_fired [acquisition×1, named-entity×2, witness×1] · r3 target_fired [acquisition×1, named-entity×2, witness×1]
- "Yusra has sent the quilt." (target `transfer`): r1 target_fired [named-entity×1, transfer×1, witness×1] · r2 target_fired [named-entity×1, transfer×1, witness×1] · r3 target_fired [named-entity×1, transfer×1, witness×1]
- "Ottoline has a brother." (target `stative-relation`): r1 target_fired [named-entity×1, stative-relation×1, witness×1] · r2 target_fired [named-entity×1, stative-relation×1, witness×1] · r3 target_fired [named-entity×1, stative-relation×1, witness×1]
- "Yusra has to send the quilt." (target `norm`): r1 target_fired [named-entity×1, norm×1, transfer×1, witness×1] · r2 target_fired [named-entity×1, norm×1, transfer×1, witness×1] · r3 target_fired [named-entity×1, norm×1, transfer×1, witness×1]

Mismatches: none

## postmodifier — held_out

23 cases, 69 records (ok 69; stale prompt 69; stale manifest 39, unstamped 30) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 18 | 54 | 54 | 54 | 54 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 4 | 12 | 0 (false fires) | – | 12 |

- selection: fire cases fired 57/57 · abstain cases false fires 0/12
- fill: exact 57/57 among fires
- stability: pairwise agreement 1.0 (23 cases, 69 pairs), unanimous 23/23
- type check: 69/69 emitted parses type
- graph lints: none
- spans: 303/303 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 69 calls · in 6,097,470 · cached 5,891,833 (97% of the input) · out 13,945 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor voted against the plan." (target `oblique`): r1 target_fired [activity×1, named-entity×1, oblique×1, witness×1] · r2 target_fired [activity×1, named-entity×1, oblique×1, witness×1] · r3 target_fired [activity×1, named-entity×1, oblique×1, witness×1]
- "The ferret in the barn slept." (target `locative`): r1 target_fired [activity×1, locative×1, witness×2] · r2 target_fired [activity×1, locative×1, witness×2] · r3 target_fired [activity×1, locative×1, witness×2]
- "Yusra drank a cup of tea." (target `measure`): r1 target_fired [activity×1, measure×1, named-entity×1, witness×1] · r2 target_fired [activity×1, measure×1, named-entity×1, witness×1] · r3 target_fired [activity×1, measure×1, named-entity×1, witness×1]
- "Lamine washed the quilt of Teodor." (target `witness`): r1 target_fired [activity×1, named-entity×2, witness×1] · r2 target_fired [activity×1, named-entity×2, witness×1] · r3 target_fired [activity×1, named-entity×2, witness×1]

Mismatches: none

## psych — held_out

16 cases, 48 records (ok 48; stale prompt 48; stale manifest 9, unstamped 39) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| contrast | 2 | 6 | 6 | 6 | 6 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 39/39 · abstain cases false fires 0/9
- fill: exact 39/39 among fires
- stability: pairwise agreement 1.0 (16 cases, 48 pairs), unanimous 16/16
- type check: 48/48 emitted parses type
- graph lints: none
- spans: 153/153 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 48 calls · in 3,222,435 · cached 3,122,803 (97% of the input) · out 7,691 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 2
  - P01 · psych · r2 "Teodor was frightened.": Both psych (agentless passive '<experiencer> was V-ed') and copular (adjectival participle '<subject> was <ADJ>') apply to 'Teodor was frightened'.
  - P01 · psych · r3 "Teodor was frightened.": Both psych (as an agentless passive `<experiencer> was V-ed` of frighten) and copular (as a past copular predication with the participial adjective frightened) seem to apply to 'Teodor was frightened'.

Abstain cases (what the parser did, per run):
- "Ottoline is afraid of the ferret." (target `adjective-complement`): r1 target_fired [adjective-complement×1, named-entity×1, witness×1] · r2 target_fired [adjective-complement×1, named-entity×1, witness×1] · r3 target_fired [adjective-complement×1, named-entity×1, witness×1]
- "Yusra fears that Lamine sold the spindle." (target `attitude`): r1 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r2 target_fired [attitude×1, named-entity×2, transfer×1, witness×1] · r3 target_fired [attitude×1, named-entity×2, transfer×1, witness×1]
- "Teodor heard the news." (target `perception`): r1 target_fired [named-entity×1, perception×1, witness×1] · r2 target_fired [named-entity×1, perception×1, witness×1] · r3 target_fired [named-entity×1, perception×1, witness×1]

Mismatches: none

## purpose — held_out

11 cases, 33 records (ok 33; stale prompt 33; stale manifest 0, unstamped 33) · gemini-4-argon effort=low

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

## question — held_out

10 cases, 30 records (ok 30; stale prompt 30; stale manifest 30, unstamped 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |
| abstain | 2 | 6 | 0 (false fires) | – | 6 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/6
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (10 cases, 30 pairs), unanimous 10/10
- type check: 30/30 emitted parses type
- graph lints: none
- spans: 114/114 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 30 calls · in 3,618,696 · cached 3,316,048 (92% of the input) · out 5,024 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra asked who mended the barn." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]
- "How many quilts did Lamine sell?" (gap G12): r1 gap_reported [named-entity×1; unmapped G12] · r2 gap_reported [named-entity×1; unmapped G12] · r3 gap_reported [named-entity×1; unmapped G12]

Mismatches: none

## reciprocal — held_out

4 cases, 12 records (ok 12; stale prompt 12; stale manifest 12, unstamped 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 3 | 9 | 9 | 9 | 9 |
| abstain | 1 | 3 | 0 (false fires) | – | 3 |

- selection: fire cases fired 9/9 · abstain cases false fires 0/3
- fill: exact 9/9 among fires
- stability: pairwise agreement 1.0 (4 cases, 12 pairs), unanimous 4/4
- type check: 12/12 emitted parses type
- graph lints: none
- spans: 45/45 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 12 calls · in 1,316,547 · cached 1,291,850 (98% of the input) · out 2,177 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra and Teodor hugged each other." (target `activity`): r1 target_fired [activity×2, named-entity×2] · r2 target_fired [activity×2, named-entity×2] · r3 target_fired [activity×2, named-entity×2]

Mismatches: none

## sensation — held_out

8 cases, 24 records (ok 24; stale prompt 24; stale manifest 0, unstamped 24) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 5 | 15 | 15 | 15 | 15 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 2 | 6 | 0 (false fires) | – | 6 |

- selection: fire cases fired 18/18 · abstain cases false fires 0/6
- fill: exact 18/18 among fires
- stability: pairwise agreement 1.0 (8 cases, 24 pairs), unanimous 8/8
- type check: 24/24 emitted parses type
- graph lints: none
- spans: 54/54 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 24 calls · in 2,008,578 · cached 1,877,759 (93% of the input) · out 2,729 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "The wall feels cold." (target `evidential`): r1 target_fired [copular×1, evidential×1, witness×1] · r2 target_fired [copular×1, evidential×1, witness×1] · r3 target_fired [copular×1, evidential×1, witness×1]
- "Yusra is tired." (target `copular`): r1 target_fired [copular×1, named-entity×1] · r2 target_fired [copular×1, named-entity×1] · r3 target_fired [copular×1, named-entity×1]

Mismatches: none

## stative-relation — held_out

34 cases, 102 records (ok 102; stale prompt 102; stale manifest 30, unstamped 72) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 28 | 84 | 84 | 84 | 84 |
| scoped | 1 | 3 | 3 | 3 | 3 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 87/87 · abstain cases false fires 0/15
- fill: exact 87/87 among fires
- stability: pairwise agreement 1.0 (34 cases, 102 pairs), unanimous 34/34
- type check: 102/102 emitted parses type
- graph lints: none
- spans: 354/354 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 102 calls · in 8,616,531 · cached 8,150,584 (95% of the input) · out 16,938 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: 3
  - P00 · part-whole · r1 "The parcel weighs a pound.": The boundary notes of part-whole and stative-relation state that 'weighs a pound' has no template yet (G00), contradicting the measure template which explicitly covers 'weighs <n> <unit>'.
  - P00 · part-whole / stative-relation · r2 "The parcel weighs a pound.": The boundary notes of part-whole and stative-relation state that 'weighs a pound' has no template yet (G00), contradicting the measure template which explicitly covers 'weighs <n> <unit>'.
  - P00 · part-whole · r3 "The parcel weighs a pound.": The boundary of part-whole says 'weighs a pound, costs a dollar: a measure, no template yet (G00)', which contradicts the measure template that covers it.

Abstain cases (what the parser did, per run):
- "Ottoline owns the quilt." (target `possession`): r1 target_fired [named-entity×1, possession×1, witness×1] · r2 target_fired [named-entity×1, possession×1, witness×1] · r3 target_fired [named-entity×1, possession×1, witness×1]
- "The box contains a letter." (target `locative`): r1 target_fired [locative×1, witness×2] · r2 target_fired [locative×1, witness×2] · r3 target_fired [locative×1, witness×2]
- "The parcel weighs a pound." (target `measure`): r1 target_fired [measure×1, witness×1] · r2 target_fired [measure×1, witness×1] · r3 target_fired [measure×1, witness×1]
- "Yusra fears the ferret." (target `psych`): r1 target_fired [named-entity×1, psych×1, witness×1] · r2 target_fired [named-entity×1, psych×1, witness×1] · r3 target_fired [named-entity×1, psych×1, witness×1]
- "Yusra needs to rest." (target `norm`): r1 target_fired [activity×1, named-entity×1, norm×1] · r2 target_fired [activity×1, named-entity×1, norm×1] · r3 target_fired [activity×1, named-entity×1, norm×1]

Mismatches: none

## superlative — held_out

34 cases, 102 records (ok 102; stale prompt 102; stale manifest 57, unstamped 45) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 27 | 81 | 81 | 81 | 81 |
| scoped | 2 | 6 | 6 | 6 | 6 |
| abstain | 5 | 15 | 0 (false fires) | – | 15 |

- selection: fire cases fired 87/87 · abstain cases false fires 0/15
- fill: exact 87/87 among fires
- stability: pairwise agreement 1.0 (34 cases, 102 pairs), unanimous 34/34
- type check: 102/102 emitted parses type
- graph lints: none
- spans: 351/351 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 102 calls · in 8,903,172 · cached 8,621,487 (97% of the input) · out 19,072 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Yusra runs fastest." (gap G00): r1 gap_reported [habitual×1, motion×1, named-entity×1; unmapped G00] · r2 gap_reported [habitual×1, motion×1, named-entity×1; unmapped G00] · r3 gap_reported [habitual×1, motion×1, named-entity×1; unmapped G00]
- "Teodor was the finest glazier of his era." (gap G00): r1 gap_reported [copular×1, named-entity×1; unmapped G00] · r2 gap_reported [copular×1, named-entity×1; unmapped G00] · r3 gap_reported [copular×1, named-entity×1; unmapped G00]
- "Teodor is taller than Yusra." (target `comparative`): r1 target_fired [comparative×1, named-entity×2] · r2 target_fired [comparative×1, named-entity×2] · r3 target_fired [comparative×1, named-entity×2]
- "Most ferrets slept." (target `generic`): r1 target_fired [activity×1, generic×1, range×1] · r2 target_fired [activity×1, generic×1, range×1] · r3 target_fired [activity×1, generic×1, range×1]
- "Teodor is the tallest." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

Mismatches: none

## time — held_out

42 cases, 126 records (ok 126; stale prompt 126; stale manifest 36, unstamped 90) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 35 | 105 | 105 | 105 | 105 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 117/117 · abstain cases false fires 0/9
- fill: exact 117/117 among fires
- stability: pairwise agreement 1.0 (42 cases, 126 pairs), unanimous 42/42
- type check: 126/126 emitted parses type
- graph lints: none
- spans: 447/447 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 126 calls · in 9,573,312 · cached 8,856,196 (93% of the input) · out 21,284 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor reads every day." (target `frequency`): r1 target_fired [activity×1, frequency×1, named-entity×1] · r2 target_fired [activity×1, frequency×1, named-entity×1] · r3 target_fired [activity×1, frequency×1, named-entity×1]
- "Lamine left after the audit." (target `time-relation`): r1 target_fired [motion×1, named-entity×1, time-relation×1, witness×1] · r2 target_fired [motion×1, named-entity×1, time-relation×1, witness×1] · r3 target_fired [motion×1, named-entity×1, time-relation×1, witness×1]
- "Lamine waited at the market." (target `location`): r1 target_fired [activity×1, location×1, named-entity×1, witness×1] · r2 target_fired [activity×1, location×1, named-entity×1, witness×1] · r3 target_fired [activity×1, location×1, named-entity×1, witness×1]

Mismatches: none

## time-relation — held_out

37 cases, 111 records (ok 111; stale prompt 111; stale manifest 18, unstamped 93) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 30 | 90 | 90 | 90 | 90 |
| scoped | 3 | 9 | 9 | 9 | 9 |
| optional | 1 | 3 | 3 | 3 | 3 |
| abstain | 3 | 9 | 0 (false fires) | – | 9 |

- selection: fire cases fired 102/102 · abstain cases false fires 0/9
- fill: exact 102/102 among fires
- stability: pairwise agreement 1.0 (37 cases, 111 pairs), unanimous 37/37
- type check: 111/111 emitted parses type
- graph lints: none
- spans: 525/525 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 111 calls · in 8,021,451 · cached 7,587,159 (95% of the input) · out 24,699 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Teodor will leave tomorrow." (target `time`): r1 target_fired [motion×1, named-entity×1, time×1] · r2 target_fired [motion×1, named-entity×1, time×1] · r3 target_fired [motion×1, named-entity×1, time×1]
- "Since the ferret slept, Yusra sang." (target `link`): r1 target_fired [activity×2, link×1, named-entity×1, witness×1] · r2 target_fired [activity×2, link×1, named-entity×1, witness×1] · r3 target_fired [activity×2, link×1, named-entity×1, witness×1]
- "Whenever Yusra sang, the ferret hid." (target `frequency`): r1 target_fired [activity×2, frequency×1, named-entity×1, witness×1] · r2 target_fired [activity×2, frequency×1, named-entity×1, witness×1] · r3 target_fired [activity×2, frequency×1, named-entity×1, witness×1]

Mismatches: none

## transfer — held_out

12 cases, 36 records (ok 36; stale prompt 36; stale manifest 3, unstamped 33) · gemini-4-argon effort=low

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
- spans: 132/132 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 36 calls · in 2,167,686 · cached 2,039,450 (94% of the input) · out 5,984 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine paid Yusra a visit." (gap G00): r1 gap_reported [named-entity×2; unmapped G00] · r2 gap_reported [named-entity×2; unmapped G00] · r3 gap_reported [named-entity×2; unmapped G00]
- "Yusra gave up." (target `activity`): r1 target_fired [activity×1, named-entity×1] · r2 target_fired [activity×1, named-entity×1] · r3 target_fired [activity×1, named-entity×1]
- "Teodor told Ottoline the news." (target `communication`): r1 target_fired [communication×1, named-entity×2, witness×1] · r2 target_fired [communication×1, named-entity×2, witness×1] · r3 target_fired [communication×1, named-entity×2, witness×1]

Mismatches: none

## wh — held_out

8 cases, 24 records (ok 24; stale prompt 24; stale manifest 24, unstamped 0) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 8 | 24 | 24 | 24 | 24 |

- selection: fire cases fired 24/24 · abstain cases false fires 0/0
- fill: exact 24/24 among fires
- stability: pairwise agreement 1.0 (8 cases, 24 pairs), unanimous 8/8
- type check: 24/24 emitted parses type
- graph lints: none
- spans: 102/102 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 24 calls · in 2,894,010 · cached 2,714,758 (94% of the input) · out 4,194 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Mismatches: none

## witness — held_out

16 cases, 48 records (ok 48; stale prompt 48; stale manifest 39, unstamped 9) · gemini-4-argon effort=low

| category | cases | runs | fired | exact | pass |
|---|---|---|---|---|---|
| positive | 15 | 45 | 45 | 45 | 45 |
| abstain | 1 | 3 | 0 (false fires) | – | 3 |

- selection: fire cases fired 45/45 · abstain cases false fires 0/3
- fill: exact 45/45 among fires
- stability: pairwise agreement 1.0 (16 cases, 48 pairs), unanimous 16/16
- type check: 48/48 emitted parses type
- graph lints: none
- spans: 153/153 instances carry one · missing 0 · not verbatim 0 · malformed 0 (a missing or non-verbatim span fails the record)
- usage: 48 calls · in 4,855,662 · cached 4,646,698 (96% of the input) · out 7,526 · thinking 0 (calls with thought tokens: 0)
- issues reported by the parser: none

Abstain cases (what the parser did, per run):
- "Lamine chased a suspected thief." (gap G00): r1 gap_reported [named-entity×1; unmapped G00] · r2 gap_reported [named-entity×1; unmapped G00] · r3 gap_reported [named-entity×1; unmapped G00]

Mismatches: none
