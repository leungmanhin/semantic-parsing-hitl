# §4.3.2 role fillers 2 (valuation export) — H, full canonical substrate

- input: valuations_slots.jsonl; slots: 1729 event-role (148 under open preposition-named oblique heads), 2343 other (entity centers + event centers under non-role heads: Member 764, To 32, Result 17, Before 14, During 11, But 10)
- signals (ppmi weighting): 1 cross-event + 2 cross-role (event) + 1 cross-entity-class + 0 cross-head (entity); cosine>=0.5, >=2 shared informative fillers, slot n>=3. The raw batch-1 criterion would give 24 + 1 (event) + 2 + 0 (entity)
- D.3 doctrine table: 59 prompt-named verbs (11 since 2ed18b93, 48 since f6448eac), pinned prompt 2ed18b93
- D.3 routing: 27 determined classes present in the substrate; 0 forbidden-role witnesses (any filler kind) + 0 entity flip witnesses + 0 cross-role signals on prompt-DETERMINED classes -> flip_diagnostics.jsonl (parse-error path, NOT candidates)

## Cross-event slot agreement (supports event-lemma equivalence)

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 0.51 | portray.Agent (5) | win.Agent (7) | james_woods, wilson |

## Cross-role agreement within one event class (candidate-eligible only)

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 0.63 | find.Agent (4) | find.Theme (10) | couper, pietro |
| 0.58 | portray.Agent (5) | portray.Theme (5) | james_woods, wilson |

## Entity-conditioned slots — cross-head / cross-class agreement

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 0.76 | destined.Member (3) | film.Member (5) | film, syrian_film |

## #23 audit — Theme vs Patient (ENTITY fillers; construction-aware)

- global entity-filler vocabularies: Theme 327 distinct (517 uses), Patient 281 distinct (449 uses); **45 filler classes under BOTH** (global cosine 0.913)
- flip witnesses: **29 candidate-eligible** (prompt-undetermined) + **0 parse-error-routed** (D.3); 29/29 eligible classes have distinct-doc witness pairs
- construction-conditioned, NOT flips: 5 classes carry Theme and Patient only across the eventive-complement / entity-argument split (begin, block, cease, go, stop)

| route | event class | Theme n | Patient n | shared fillers | witnesses | since |
|---|---|---|---|---|---|---|
| eligible | get | 3 | 7 | — | 3 |  |
| eligible | leave | 3 | 3 | — | 3 |  |
| eligible | do | 2 | 4 | thing | 3 |  |
| eligible | take | 10 | 2 | — | 3 |  |
| eligible | arrange | 1 | 1 | <untyped> | 1 |  |
| eligible | base | 2 | 1 | — | 2 |  |
| eligible | become | 1 | 11 | inomaru | 3 |  |
| eligible | cause | 1 | 4 | — | 3 |  |
| eligible | celebrate | 2 | 1 | mela | 2 |  |
| eligible | clarify | 1 | 1 | <untyped> | 1 |  |
| eligible | conduct | 3 | 1 | — | 3 |  |
| eligible | connect | 4 | 1 | — | 3 |  |
| eligible | cover | 1 | 3 | — | 3 |  |
| eligible | develop | 1 | 1 | — | 1 |  |
| eligible | direct | 1 | 5 | — | 3 |  |
| eligible | draw | 1 | 2 | — | 2 |  |
| eligible | hold | 1 | 3 | <untyped> | 3 |  |
| eligible | hold_up | 2 | 1 | — | 2 |  |
| eligible | influence | 1 | 2 | religion | 2 |  |
| eligible | make | 1 | 20 | — | 3 |  |
| eligible | pass | 2 | 1 | — | 2 |  |
| eligible | pick_up | 2 | 1 | — | 2 |  |
| eligible | play | 8 | 1 | series | 3 |  |
| eligible | reach | 2 | 1 | — | 2 |  |
| eligible | spend | 3 | 1 | — | 3 |  |
| eligible | spread | 1 | 1 | — | 1 |  |
| eligible | start | 1 | 10 | — | 3 |  |
| eligible | strike | 1 | 1 | — | 1 |  |
| eligible | take_over | 2 | 1 | — | 2 |  |

## Eventive complements under Theme / Patient (aspectual & attitude family; not audited as wobble)

- 77 Theme uses over 39 classes; 6 Patient uses over 6 classes (a Patient eventive complement is the rare side — worth a look)

| event class | role | eventive uses | fillers |
|---|---|---|---|
| start | Theme | 12 | appear, chant, cry, disappear, feel, hear |
| begin | Theme | 11 | create, applaud, bud, confess, distribute, hang_out |
| try | Theme | 7 | abuse, burnish, call, give_up, pull, reach |
| need | Theme | 5 | generate, go, paint, run, understand |
| stop | Theme | 4 | cry, work |
| attempt | Theme | 2 | collaborate |
| continue | Theme | 2 | climb, shine |
| decide | Theme | 2 | confront, study |
| help | Theme | 2 | define, thrive |
| announce | Theme | 1 | come |
| ban | Theme | 1 | travel |
| block | Theme | 1 | enter |
| book | Theme | 1 | flight |
| borrow | Theme | 1 | inomaru |
| break_out | Patient | 1 | war |
| cause | Theme | 1 | accrete |
| cease | Theme | 1 | french |
| choose | Theme | 1 | imprison |
| complete | Patient | 1 | conquest |
| constitute | Theme | 1 | attack |

## D.3 — prompt-determined classes carrying a forbidden role

- none: every one of the 27 determined classes present carries only its licensed roles (the item-E cancel / call_off flips were pre-B2 residuals; this substrate is post-B2)

## FYI — intransitive-subject verbs named since 2ed18b93: Agent fillers (pre-pinned parses; unrouted, a self-powered mover keeps Agent)

| event class | determined subject role | Agent fillers |
|---|---|---|
| arrive | Theme | donald 1, driver 1, paris_train 1, spring 1 |
| depart | Theme | train 1 |
| move | Theme | headquarters 2, sammy 1, school 1 |
