# §4.3.2 role fillers 2 (valuation export) — item E

- input: valuations_slots.jsonl; slots: 513 event-role, 595 entity/other (the batch-1 event-only restriction is gone)
- signals: 50 cross-event + 7 cross-role (event) + 0 cross-entity-class + 0 cross-head (entity); cosine>=0.5, >=2 shared fillers
- D.3 routing: 2 flip witnesses + 0 cross-role signals on prompt-DETERMINED classes -> flip_diagnostics.jsonl (parse-error path, NOT bridge candidates)

## Cross-event slot agreement (supports event-lemma equivalence)

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 1.00 | acquire.Agent (4) | purchase.Agent (4) | chef, depot, pottery_studio, school |
| 1.00 | acquire.Theme (4) | purchase.Theme (4) | <untyped>, crate, kiln, projector |
| 1.00 | commence.Patient (4) | start.Patient (4) | apple_harvest, dress_rehearsal, hearing, shoreline_survey |
| 1.00 | commence.Time (4) | end.Time (4) | <term:Month>, <term:Weekday>, dawn, morning |
| 1.00 | commence.Time (4) | start.Time (4) | <term:Month>, <term:Weekday>, dawn, morning |
| 1.00 | end.Time (4) | start.Time (4) | <term:Month>, <term:Weekday>, dawn, morning |
| 1.00 | make.Agent (4) | reach.Agent (4) | board, committee, family, judge |
| 0.99 | learn.Theme (3) | teach.Theme (10) | drill, glazing, song |
| 0.98 | abandon.Agent (8) | give_up.Agent (3) | <untyped>, firm, rescue_team |
| 0.98 | abandon.Theme (8) | give_up.Theme (3) | north_route, search, tender |
| 0.98 | need.Holder (3) | require.Holder (8) | lathe, permit, recipe |
| 0.98 | postpone.Agent (7) | put_off.Agent (3) | board, club, ferry |
| 0.98 | postpone.Theme (7) | put_off.Theme (3) | departure, tournament, vote |
| 0.97 | begin.Patient (7) | commence.Patient (4) | apple_harvest, dress_rehearsal, hearing, shoreline_survey |
| 0.97 | begin.Patient (7) | start.Patient (4) | apple_harvest, dress_rehearsal, hearing, shoreline_survey |
| 0.96 | call_off.Agent (3) | cancel.Agent (9) | airline, council, tutor |
| 0.96 | decide.Theme (11) | decision.Theme (8) | <term:And>, budget, case, new |
| 0.95 | begin.Time (6) | commence.Time (4) | <term:Month>, <term:Weekday>, dawn, morning |
| 0.95 | begin.Time (6) | end.Time (4) | <term:Month>, <term:Weekday>, dawn, morning |
| 0.95 | begin.Time (6) | start.Time (4) | <term:Month>, <term:Weekday>, dawn, morning |

## Cross-role agreement within one event class (bridge-eligible only)

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 0.83 | repair.Agent (8) | repair.Patient (8) | cracked, crew, electrician, gearbox, mechanic |
| 0.80 | discover.Experiencer (3) | discover.Stimulus (3) | auditor, error |
| 0.67 | portray.Agent (6) | portray.Theme (6) | james_woods, wilson |
| 0.65 | order.Agent (4) | order.Theme (4) | physician, scan |
| 0.65 | sign.Agent (4) | sign.Patient (4) | chart, physician |
| 0.60 | walk.Agent (5) | walk.Goal (3) | <untyped>, pier |
| 0.57 | reject.Agent (8) | reject.Theme (8) | bank, editor, loan_application, manuscript |

## Entity-conditioned slots (NEW) — cross-head agreement

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|

## #23 audit — Theme vs Patient

- global filler vocabularies: Theme 132 distinct (393 uses), Patient 64 distinct (169 uses); **13 filler classes under BOTH** (global cosine 0.533)
- flip witnesses: **5 bridge-eligible** (prompt-undetermined) + **2 parse-error-routed** (D.3)

| route | event class | Theme n | Patient n | shared fillers |
|---|---|---|---|---|
| ERROR | cancel | 2 | 7 | evening_flight |
| ERROR | call_off | 1 | 2 | — |
| eligible | begin | 4 | 7 | — |
| eligible | become | 2 | 6 | — |
| eligible | avoid | 1 | 1 | — |
| eligible | conduct | 2 | 1 | — |
| eligible | take | 4 | 1 | walk |
