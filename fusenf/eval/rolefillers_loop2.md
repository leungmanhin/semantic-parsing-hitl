# §4.3.2 role-filler distributions — wave 1

- inputs: 982 records (canon fusenf-canon/4); slots: 702 event-conditioned keys, 228 with n>=3
- slot-merge signals: 49 cross-event (same role), 7 cross-role (same event class); cosine>=0.5, >=2 shared fillers

## Cross-event slot agreement (supports event-lemma equivalence)

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 1.00 | acquire.Agent (4) | purchase.Agent (4) | chef, depot, pottery_studio, school |
| 1.00 | acquire.Theme (4) | purchase.Theme (4) | <untyped>, crate, kiln, projector |
| 1.00 | commence.Patient (4) | start.Patient (4) | apple_harvest, dress_rehearsal, hearing, shoreline_survey |
| 1.00 | commence.Time (4) | end.Time (4) | <term:Month>, <term:Weekday>, dawn, morning |
| 1.00 | commence.Time (4) | start.Time (4) | <term:Month>, <term:Weekday>, dawn, morning |
| 1.00 | end.Time (4) | start.Time (4) | <term:Month>, <term:Weekday>, dawn, morning |
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
| 0.94 | acquire.Agent (4) | buy.Agent (14) | chef, depot, pottery_studio, school |

## Cross-role slot agreement within one event class

| cosine | slot A | slot B | shared fillers |
|---|---|---|---|
| 0.83 | repair.Agent (8) | repair.Patient (8) | cracked, crew, electrician, gearbox, mechanic |
| 0.80 | discover.Experiencer (3) | discover.Stimulus (3) | auditor, error |
| 0.67 | portray.Agent (6) | portray.Theme (6) | james_woods, wilson |
| 0.65 | order.Agent (4) | order.Theme (4) | physician, scan |
| 0.65 | sign.Agent (4) | sign.Patient (4) | chart, physician |
| 0.57 | reject.Agent (8) | reject.Theme (8) | bank, editor, loan_application, manuscript |
| 0.55 | walk.Agent (6) | walk.Goal (3) | <untyped>, pier |

## #23 audit — Theme vs Patient

- global filler vocabularies: Theme 185 distinct (485 uses), Patient 102 distinct (235 uses); **20 filler classes appear under BOTH** (global cosine 0.572)
- event classes taking a direct object: 221; **flip witnesses (both roles attested): 16**

| event class | Theme n | Patient n | fillers seen under both |
|---|---|---|---|
| begin | 5 | 7 | — |
| become | 2 | 8 | — |
| cancel | 2 | 7 | evening_flight |
| avoid | 1 | 1 | — |
| call_off | 1 | 2 | — |
| change | 1 | 3 | — |
| conduct | 2 | 1 | — |
| defeat | 1 | 1 | dan_barrera |
| finish | 1 | 1 | career |
| leave | 1 | 1 | — |
| play | 6 | 1 | series |
| spend | 1 | 3 | — |
| start | 1 | 4 | — |
| stop | 3 | 1 | joey_dejohn |
| take | 4 | 1 | walk |
| train | 1 | 1 | — |
