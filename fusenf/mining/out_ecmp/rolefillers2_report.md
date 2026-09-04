# §4.3.2 role fillers 2 (valuation export) — H, full canonical substrate

- input: valuations_slots.jsonl; slots: 526 event-role (13 under open preposition-named oblique heads), 582 other (entity centers + event centers under non-role heads: Member 223, Before 8, To 5, But 3, Result 2, End 2)
- signals (ppmi weighting): 50 cross-event + 14 cross-role + 22 cross-both (event) + 0 cross-entity-class + 0 cross-head + 1 cross-entity-both (entity); cosine>=0.5, >=2 shared informative fillers, slot n>=3. The raw batch-1 criterion would give 50 + 7 + 11 (event) + 0 + 0 + 0 (entity)
- D.3 doctrine table: 59 prompt-named verbs (11 since 2ed18b93, 48 since f6448eac), pinned prompt 2ed18b93
- D.3 routing: 16 determined classes present in the substrate; 5 forbidden-role witnesses (any filler kind) + 2 entity flip witnesses + 1 cross-role signals on prompt-DETERMINED classes -> flip_diagnostics.jsonl (parse-error path, NOT candidates)

## Cross-event slot agreement (supports event-lemma equivalence)

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 1.00 | acquire.Agent (4) | purchase.Agent (4) | chef, depot, pottery_studio, school |
| 1.00 | acquire.Theme (4) | purchase.Theme (4) | crate, forklift, kiln, lemon, projector |
| 1.00 | begin.Agent (4) | create.Agent (4) | european_american_settler, indigenous_american, native_american |
| 1.00 | commence.Patient (4) | start.Patient (4) | apple_harvest, dress_rehearsal, hearing, shoreline_survey |
| 1.00 | commence.Time (4) | end.Time (4) | dawn, morning |
| 1.00 | commence.Time (4) | start.Time (4) | dawn, morning |
| 1.00 | end.Time (4) | start.Time (4) | dawn, morning |
| 1.00 | make.Agent (4) | reach.Agent (4) | board, committee, family, judge |
| 1.00 | abandon.Agent (8) | give_up.Agent (3) | climber, firm, rescue_team |
| 1.00 | learn.Theme (3) | teach.Theme (10) | drill, glazing, song |
| 1.00 | need.Theme (3) | require.Theme (10) | countersignature, egg, monthly_servicing |
| 1.00 | postpone.Agent (7) | put_off.Agent (3) | board, club, ferry |
| 1.00 | postpone.Theme (7) | put_off.Theme (3) | departure, tournament, vote |
| 1.00 | abandon.Theme (8) | give_up.Theme (3) | north_route, search, tender |
| 1.00 | allow.Agent (4) | permit.Agent (3) | curator, licence, warden |
| 1.00 | allow.Theme (4) | permit.Theme (3) | night_delivery, photography, visitor |
| 0.99 | begin.Patient (7) | commence.Patient (4) | apple_harvest, dress_rehearsal, hearing, shoreline_survey |
| 0.99 | begin.Patient (7) | start.Patient (4) | apple_harvest, dress_rehearsal, hearing, shoreline_survey |
| 0.96 | need.Holder (3) | require.Holder (8) | lathe, permit, recipe |
| 0.95 | begin.Time (6) | commence.Time (4) | dawn, morning |
| 0.95 | begin.Time (6) | end.Time (4) | dawn, morning |
| 0.95 | begin.Time (6) | start.Time (4) | dawn, morning |
| 0.95 | call_off.Agent (3) | cancel.Agent (9) | airline, council, tutor |
| 0.85 | decide.Theme (11) | decision.Theme (8) | budget, case, new, roof |
| 0.85 | commence.Patient (4) | end.Patient (3) | apple_harvest, hearing, shoreline_survey |

## Cross-role agreement within one event class (candidate-eligible only)

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 0.97 | repair.Agent (8) | repair.Patient (8) | cracked, crew, electrician, feed_pipe, gearbox |
| 0.83 | sign.Agent (4) | sign.Patient (4) | chart, physician |
| 0.83 | order.Agent (4) | order.Theme (4) | physician, scan |
| 0.83 | reject.Agent (8) | reject.Theme (8) | bank, editor, loan_application, manuscript |
| 0.81 | destroy.Agent (8) | destroy.Patient (11) | archive, fire, greenhouse, storm |
| 0.80 | answer.Agent (10) | answer.Theme (10) | caller, clerk, query, vet |
| 0.78 | teach.Agent (10) | teach.Recipient (10) | apprentice, coach, potter, squad |
| 0.74 | lend.Agent (10) | lend.Recipient (10) | crew, depot, neighbour, ravi |
| 0.67 | form.Agent (6) | form.Patient (4) | complex, simple, technetium |
| 0.63 | portray.Agent (6) | portray.Theme (6) | james_woods, wilson |
| 0.60 | walk.Agent (5) | walk.Goal (3) | child, pier |
| 0.60 | work.Agent (17) | work.CoAgent (7) | bo, fitter, nils, ranger |
| 0.57 | walk.Agent (5) | walk.Location (5) | nurse, ward |
| 0.53 | discover.Agent (7) | discover.Theme (9) | diver, wreck |

## Cross-both (different event class AND different role — the converse family)

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 1.00 | block.Agent (4) | wait.Experiencer (3) | automobile, car |
| 0.99 | acquire.Agent (4) | sell.Recipient (4) | chef, depot, pottery_studio, school |
| 0.99 | purchase.Agent (4) | sell.Recipient (4) | chef, depot, pottery_studio, school |
| 0.83 | borrow.Agent (3) | lend.Recipient (10) | crew, gallery, ravi |
| 0.83 | learn.Source (3) | teach.Agent (10) | coach, elder, potter |
| 0.82 | portray.Theme (6) | win.Agent (4) | james_woods, wilson |
| 0.81 | borrow.Source (3) | lend.Agent (10) | depot, museum, neighbour |
| 0.77 | learn.Agent (3) | teach.Recipient (10) | apprentice, child, squad |
| 0.74 | give.Agent (12) | receive.Source (3) | foreman, school, trainer |
| 0.71 | acquire.Theme (4) | buy.Agent (14) | crate, forklift, kiln, lemon |
| 0.71 | buy.Agent (14) | purchase.Theme (4) | crate, forklift, kiln, lemon |
| 0.65 | give.Recipient (12) | receive.Agent (3) | driver, recruit, winner |
| 0.64 | acquire.Agent (4) | buy.Theme (14) | chef, depot, pottery_studio |
| 0.64 | buy.Theme (14) | purchase.Agent (4) | chef, depot, pottery_studio |
| 0.61 | buy.Agent (14) | sell.Recipient (4) | chef, depot, pottery_studio, school |
| 0.59 | buy.Theme (14) | sell.Recipient (4) | chef, depot, pottery_studio |
| 0.57 | reject.Theme (8) | turn_down.Agent (3) | bank, editor |
| 0.57 | reject.Agent (8) | turn_down.Theme (3) | loan_application, manuscript |
| 0.56 | buy.Agent (14) | sell.Theme (6) | crate, forklift, kiln, lemon |
| 0.52 | cause.Agent (3) | destroy.Patient (11) | fire, storm |

## Entity-conditioned slots — cross-head / cross-class agreement

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|

## #23 audit — Theme vs Patient (ENTITY fillers; construction-aware)

- global entity-filler vocabularies: Theme 147 distinct (353 uses), Patient 70 distinct (163 uses); **13 filler classes under BOTH** (global cosine 0.138)
- flip witnesses: **3 candidate-eligible** (prompt-undetermined) + **2 parse-error-routed** (D.3); 3/3 eligible classes have distinct-doc witness pairs
- construction-conditioned, NOT flips: 2 classes carry Theme and Patient only across the eventive-complement / entity-argument split (begin, take)

| route | event class | Theme n | Patient n | shared fillers | witnesses | since |
|---|---|---|---|---|---|---|
| ERROR | cancel | 2 | 7 | evening_flight | 3 | f6448eac |
| ERROR | call_off | 1 | 2 | — | 2 | f6448eac |
| eligible | become | 2 | 5 | — | 3 |  |
| eligible | avoid | 1 | 1 | — | 1 |  |
| eligible | conduct | 2 | 1 | — | 2 |  |

## Eventive complements under Theme / Patient (aspectual & attitude family; not audited as wobble)

- 18 Theme uses over 8 classes; 6 Patient uses over 3 classes (a Patient eventive complement is the rare side — worth a look)

| event class | role | eventive uses | fillers |
|---|---|---|---|
| begin | Theme | 4 | create |
| make | Patient | 4 | decision |
| reach | Theme | 4 | decision |
| cause | Theme | 3 | destroy |
| ship | Theme | 2 | barako |
| take | Theme | 2 | walk |
| become | Patient | 1 | discipline, lax |
| force | Theme | 1 | sleep |
| oblige | Theme | 1 | sleep |
| play | Theme | 1 | series |
| take | Patient | 1 | walk |

## D.3 — prompt-determined classes carrying a forbidden role

| event class | determined | forbidden role | n | fillers (kind) | since |
|---|---|---|---|---|---|
| postpone | Patient | Theme | 7 | departure (entity), tournament (entity), vote (entity) | f6448eac |
| put_off | Patient | Theme | 3 | departure (entity), tournament (entity), vote (entity) | f6448eac |
| cancel | Patient | Theme | 2 | evening_flight (entity), scan (entity) | f6448eac |
| move | Theme | Patient | 2 | headquarters (entity) | f6448eac |
| call_off | Patient | Theme | 1 | evening_flight (entity) | f6448eac |

## FYI — intransitive-subject verbs named since 2ed18b93: Agent fillers (pre-pinned parses; unrouted, a self-powered mover keeps Agent)

| event class | determined subject role | Agent fillers |
|---|---|---|
| arrive | Theme | freight 3, delegation 2, soil_sample 1 |
| depart | Theme | delegation 1, soil_sample 1 |
| move | Theme | person 2 |
