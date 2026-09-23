# §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm (paper as written)

> "For every predicate-slot (e.g. go to.Agent or Agent2), we collect the set of fillers across the corpus and embed them in a vector space (using word or subtree embeddings). Clustering these embeddings reveals when two slots share indistinguishable distributions of fillers, indicating they fulfill the same semantic role and can be merged." — FUSE-NF §4.3.2

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| predicate-slot | every argument head attached to an event center in the canonical graph (closed-class roles, preposition-named obliques, and the other heads — temporal, resultative, discourse); the class links Member / Inheritance classify the event and are not slots; entity-center heads reported separately |
| fillers | every argument of such a head, across the corpus; texts per `embeddings.py` (class labels, surface names, constant symbols); un-embeddable fillers (untyped skolems, numbers, strings, structured terms) excluded from the distribution |
| embeddings | out_tier_ab/embeddings: Qwen3-Embedding-8B, bf16, normalized; word texts (one per class label, 1/m mass for a multi-label filler) and subtree texts (the label bag / plural form / name as one text) |
| clustering | agglomerative, average linkage on cosine distance, one tree cut at cluster cosine [0.8, 0.85, 0.9, 0.95, 1.0] (1.0 = one cluster per distinct text) |
| slot distribution | raw mass over clusters, no weighting; a slot enters comparison at n >= 3 embedded fillers |
| 'indistinguishable' | similarity, not a homogeneity test (slot sizes are far too small for one): cosine >= 0.5 with >= 2 shared clusters; the other statistic is reported beside it |
| slot pairs compared | all pairs of the same center kind; shown by bucket for reading only: same role / different class, same class / different role, different class and role |

- exact-label baseline on the same substrate (augmented arm, for reference only): 0 signals

## Signals across the dial (gate: cosine >= 0.50)

| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw cosine criterion (event / entity) |
|---|---|---|---|---|---|---|---|
| exact label (augmented arm, cosine gate) | — | — | 0 | 0 | 0 | 0 | — |
| faithful word | 0.80 | 1640 (811) | 43 | 6 | 13 | 0 | 43+6+13 / 0+0+0 |
| faithful word | 0.85 | 2192 (682) | 44 | 6 | 10 | 0 | 44+6+10 / 0+0+0 |
| faithful word | 0.90 | 2681 (361) | 44 | 6 | 10 | 0 | 44+6+10 / 0+0+0 |
| faithful word | 0.95 | 2986 (83) | 47 | 6 | 11 | 0 | 47+6+11 / 0+0+0 |
| faithful word | 1.00 | 3069 (0) | 47 | 6 | 11 | 0 | 47+6+11 / 0+0+0 |
| faithful subtree | 0.80 | 1640 (811) | 43 | 5 | 13 | 0 | 43+5+13 / 0+0+0 |
| faithful subtree | 0.85 | 2192 (682) | 44 | 5 | 10 | 0 | 44+5+10 / 0+0+0 |
| faithful subtree | 0.90 | 2681 (361) | 45 | 5 | 10 | 0 | 45+5+10 / 0+0+0 |
| faithful subtree | 0.95 | 2986 (83) | 47 | 5 | 11 | 0 | 47+5+11 / 0+0+0 |
| faithful subtree | 1.00 | 3069 (0) | 47 | 5 | 11 | 0 | 47+5+11 / 0+0+0 |

## faithful word @ cluster cos 0.80

_(inventory: 1846 slots; 3754 embedded filler units (one per label); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 0.99 (0.99) | 0.003 | borrow.Theme (3) | lend.Theme (10) | {generator, generate} {painting, paint, paintings} {ladder, ladders} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {use, permit, well, do, …} {recipe} {lathe} | A permit needs a countersignature. | A permit requires a countersignature. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club, squad, team} {board, panel} {ferry, fishing boat} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {arrive, departure, arrival, depart} {tournament} {vote, election} | A ferry postpones its departure. | A ferry puts off its departure. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {plane, airline, flight, aeroplane, …} {teach, tutor} {committee, council} | An airline calls off the evening flight. | An airline cancels the evening flight. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {licence} {curator} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {visitor, visit, guest} {camera, photography} {night delivery, deliver, delivery} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {board, panel} {bank, banking industry} {editor, editorial staff} | A panel rejects the proposal. | A panel turns down the proposal. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {loan application, apply} {proposal, provide, proposition, prove, …} {manuscript} | A bank rejects the loan application. | A bank turns down the loan application. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {budget, spend} {new, brand new, language, new, new, product} {case, switch} | A board decides next year's budget. | A board makes a decision on next year's budget. |
| 0.89 (0.89) | 0.255 | acquire.Theme (4) | buy.Theme (19) | {crate} {kiln} {lemon, crate, lemons} | The chef acquired several crates of lemons. | The chef bought several crates of lemons. |
| 0.89 (0.89) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef acquired several crates of lemons. | The chef bought several crates of lemons. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef bought several crates of lemons. | The chef purchased several crates of lemons. |
| 0.88 (0.88) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {crate} {kiln} {lemon, crate, lemons} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {error, catch, throw} {auditor} | An error discovers an auditor in the ledger. | An error in the ledger is discovered by an auditor. |
| 0.79 (0.79) | 0.116 | repair.Agent (8) | repair.Patient (9) | {seized} {cracked, crack} {feed pipe} | A seized gearbox repaired the mechanic. | The mechanic repaired a seized gearbox. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked, locked, lock, door, locked} {open, close, end, closed} {use, permit, well, do, …} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {loan application, apply} {bank, banking industry} {editor, editorial staff} | The loan application rejects a bank. | The loan application is rejected by a bank. |
| 0.55 (0.55) | 0.351 | sign.Agent (5) | sign.Patient (5) | {physician, doctor, doctors} {chart, plot, draw} | A physician signs the chart. | The chart signs a physician. |
| 0.51 (0.51) | 0.459 | order.Agent (6) | order.Theme (6) | {physician, doctor, doctors} {scan} | A physician orders a second scan. | A second scan orders a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef acquired several crates of lemons. | Several crates of lemons were sold to the chef. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef purchased several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {crew} {Ravi} {gallery} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {neighbour, next door} {museum, museum, worth} {depot} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {club, squad, team} {apprentice} {child, children, kid, baby, …} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {coach, trainer} {old, elder, aging, ages ago, …} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef bought several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.77 (0.77) | 0.375 | give.Agent (15) | receive.Source (4) | {coach, trainer} {school, university, campus, college, …} {foreman} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.70 (0.70) | 0.624 | make.Patient (24) | reach.Theme (6) | {decision, decide, choose, option} {Linda, Beth, Amanda, Ana, …} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {winner, win, award} {driver, drive} {recruit} | A school gives the winner a medal. | The winner receives a medal from a school. |
| 0.62 (0.62) | 0.482 | play.Agent (9) | sleep.Experiencer (6) | {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …} | The child likes to play with the cats. | The child is apparently sleeping. |
| 0.56 (0.56) | 0.475 | hear.Experiencer (8) | try.Agent (10) | {David, William, James, Donald, …} {Jonas, Bo, Bob, Thomas, …} {Gustavo, Alberto, Martino, Pietro, …} | James heard upbeat music outside. | David was trying to reach Amanda. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {thing, things, stuff, practice, thing} {weather, bad, weather} | Things have changed a lot over the past year. | Until today, everything was good. |

## faithful word @ cluster cos 0.85

_(inventory: 1846 slots; 3754 embedded filler units (one per label); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {depot} {chef, cook} {pottery studio} | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 0.99 (0.99) | 0.003 | borrow.Theme (3) | lend.Theme (10) | {ladder, ladders} {generator, generate} {painting, paint, paintings} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit, allow, permitted} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club, team} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {departure, depart} {tournament} {vote} | A ferry postpones its departure. | A ferry puts off its departure. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {plane, airline, flight, aeroplane, …} {tutor} {council} | An airline calls off the evening flight. | An airline cancels the evening flight. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {licence} {curator} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {visitor, guest} {photography} {night delivery, deliver, delivery} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {panel} {bank} {editor} | A panel rejects the proposal. | A panel turns down the proposal. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {loan application} {proposal, proposition} {manuscript} | A bank rejects the loan application. | A bank turns down the loan application. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {roof, new, roof, conical, roof} {budget} {new, brand new, new, product} | A committee decides on a new roof. | A committee makes a decision on a new roof. |
| 0.89 (0.89) | 0.255 | acquire.Theme (4) | buy.Theme (19) | {forklift, forklifts} {crate} {kiln} | The depot acquired two forklifts. | The depot bought two forklifts. |
| 0.89 (0.89) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {depot} {chef, cook} {pottery studio} | The depot acquired two forklifts. | The depot bought two forklifts. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {depot} {chef, cook} {pottery studio} | The depot bought two forklifts. | The depot purchased two forklifts. |
| 0.88 (0.88) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {forklift, forklifts} {crate} {kiln} | The depot acquired two forklifts. | The depot purchased two forklifts. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {error} {auditor} | An error discovers an auditor in the ledger. | An error in the ledger is discovered by an auditor. |
| 0.79 (0.79) | 0.116 | repair.Agent (8) | repair.Patient (9) | {seized} {cracked, crack} {feed pipe} | A seized gearbox repaired the mechanic. | The mechanic repaired a seized gearbox. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked} {open} {well, on, there, be} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {loan application} {bank} {editor} | The loan application rejects a bank. | The loan application is rejected by a bank. |
| 0.55 (0.55) | 0.351 | sign.Agent (5) | sign.Patient (5) | {physician, doctor, doctors} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.51 (0.51) | 0.459 | order.Agent (6) | order.Theme (6) | {physician, doctor, doctors} {scan} | A physician orders a second scan. | A second scan orders a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {depot} {chef, cook} {pottery studio} | The depot acquired two forklifts. | Two forklifts were sold to the depot. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {depot} {chef, cook} {pottery studio} | The depot purchased two forklifts. | Two forklifts were sold to the depot. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {gallery} {crew} {Ravi} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {depot} {neighbour, next door} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {squad} {apprentice} {child, children, kid, kids} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {coach, trainer} {old, elder, elderly} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {depot} {chef, cook} {pottery studio} | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 0.77 (0.77) | 0.375 | give.Agent (15) | receive.Source (4) | {coach, trainer} {school, education} {foreman} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {recruit} {winner, win} {driver, drive} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing, things} | Looks like the weather is changing. | The weather looks good today. |

## faithful word @ cluster cos 0.90

_(inventory: 1846 slots; 3754 embedded filler units (one per label); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 0.99 (0.99) | 0.003 | borrow.Theme (3) | lend.Theme (10) | {painting, paintings} {ladder, ladders} {generator, generate} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit, permitted} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {vote} {departure, depart} {tournament} | A board postpones the vote. | A board puts off the vote. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {council} {airline} {tutor} | A council calls off the summer fair. | A council cancels the summer fair. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {licence} {curator} {warden} | A licence allows night deliveries. | A licence permits night deliveries. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {photography} {visitor, guest} {night delivery} | A curator allows photography in the hall. | A curator permits photography in the hall. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {panel} {bank} {editor} | A panel rejects the proposal. | A panel turns down the proposal. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {manuscript} {loan application} {proposal} | An editor rejects a manuscript. | An editor turns down a manuscript. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {roof} {budget} {new} | A committee decides on a new roof. | A committee makes a decision on a new roof. |
| 0.89 (0.89) | 0.255 | acquire.Theme (4) | buy.Theme (19) | {projector, projectors} {forklift, forklifts} {crate} | The school acquired a projector for the hall. | The school bought a projector for the hall. |
| 0.89 (0.89) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | The depot bought two forklifts. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {depot} {chef} {pottery studio} | The depot bought two forklifts. | The depot purchased two forklifts. |
| 0.88 (0.88) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {projector, projectors} {forklift, forklifts} {crate} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.79 (0.79) | 0.116 | repair.Agent (8) | repair.Patient (9) | {seized} {cracked, crack} {feed pipe} | A seized gearbox repaired the mechanic. | The mechanic repaired a seized gearbox. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked} {open} {on} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {loan application} {bank} | A manuscript rejects an editor. | An editor rejects a manuscript. |
| 0.55 (0.55) | 0.351 | sign.Agent (5) | sign.Patient (5) | {chart} {physician, doctor} | The chart signs a physician. | A doctor signs the chart. |
| 0.51 (0.51) | 0.459 | order.Agent (6) | order.Theme (6) | {scan} {physician, doctor} | A second scan orders a physician. | A doctor orders a second scan. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | Two forklifts were sold to the depot. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot purchased two forklifts. | Two forklifts were sold to the depot. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {gallery} {crew} {Ravi} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {neighbour} {museum} {depot} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {squad} {apprentice} {child, kid} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {coach} {elder, elderly} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 0.77 (0.77) | 0.375 | give.Agent (15) | receive.Source (4) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {recruit} {winner, win} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing, things} | Looks like the weather is changing. | The weather looks good today. |

## faithful word @ cluster cos 0.95

_(inventory: 1846 slots; 3754 embedded filler units (one per label); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 0.99 (0.99) | 0.003 | borrow.Theme (3) | lend.Theme (10) | {painting} {ladder} {generator} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {vote} {departure, depart} {tournament} | A board postpones the vote. | A board puts off the vote. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {council} {airline} {tutor} | A council calls off the summer fair. | A council cancels the summer fair. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {licence} {curator} {warden} | A licence allows night deliveries. | A licence permits night deliveries. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {photography} {visitor} {night delivery} | A curator allows photography in the hall. | A curator permits photography in the hall. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {panel} {bank} {editor} | A panel rejects the proposal. | A panel turns down the proposal. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {manuscript} {loan application} {proposal} | An editor rejects a manuscript. | An editor turns down a manuscript. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {roof} {budget} {new} | A committee decides on a new roof. | A committee makes a decision on a new roof. |
| 0.89 (0.89) | 0.255 | acquire.Theme (4) | buy.Theme (19) | {projector} {forklift, forklifts} {crate} | The school acquired a projector for the hall. | The school bought a projector for the hall. |
| 0.89 (0.89) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | The depot bought two forklifts. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {depot} {chef} {pottery studio} | The depot bought two forklifts. | The depot purchased two forklifts. |
| 0.88 (0.88) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {projector} {forklift, forklifts} {crate} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.79 (0.79) | 0.116 | repair.Agent (8) | repair.Patient (9) | {seized} {cracked} {feed pipe} | A seized gearbox repaired the mechanic. | The mechanic repaired a seized gearbox. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked} {open} {on} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {loan application} {bank} | A manuscript rejects an editor. | An editor rejects a manuscript. |
| 0.57 (0.57) | 0.4 | sign.Agent (5) | sign.Patient (5) | {chart} {physician} | The chart signs a physician. | A doctor signs the chart. |
| 0.52 (0.52) | 0.5 | order.Agent (6) | order.Theme (6) | {scan} {physician} | A second scan orders a physician. | A doctor orders a second scan. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | Two forklifts were sold to the depot. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot purchased two forklifts. | Two forklifts were sold to the depot. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {gallery} {crew} {Ravi} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {neighbour} {museum} {depot} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {squad} {apprentice} {child, kid} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {potter} {coach} {elder, elderly} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 0.86 (0.86) | 0.298 | block.Agent (6) | wait.Experiencer (4) | {automobile, automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.77 (0.77) | 0.375 | give.Agent (15) | receive.Source (4) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {recruit} {winner} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing} | Looks like the weather is changing. | The weather looks good today. |

## faithful word @ cluster cos 1.00

_(inventory: 1846 slots; 3754 embedded filler units (one per label); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {school} {chef} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 0.99 (0.99) | 0.003 | borrow.Theme (3) | lend.Theme (10) | {generator} {ladder} {painting} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {ferry} {board} {club} | A ferry postpones its departure. | A ferry puts off its departure. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure} | A club postpones the tournament. | A club puts off the tournament. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {tutor} {airline} {council} | A tutor calls off the afternoon session. | A tutor cancels the afternoon session. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {licence} {warden} {curator} | A licence allows night deliveries. | A licence permits night deliveries. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {night delivery} {photography} {visitor} | A licence allows night deliveries. | A licence permits night deliveries. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {editor} {panel} {bank} | An editor rejects a manuscript. | An editor turns down a manuscript. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {loan application} {manuscript} {proposal} | A bank rejects the loan application. | A bank turns down the loan application. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {new} {roof} {budget} | A committee decides on a new roof. | A committee makes a decision on a new roof. |
| 0.89 (0.89) | 0.255 | acquire.Theme (4) | buy.Theme (19) | {forklift} {kiln} {lemon} | The depot acquired two forklifts. | The depot bought two forklifts. |
| 0.89 (0.89) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {pottery studio} {school} {chef} | The pottery studio acquired a second kiln. | The pottery studio bought a second kiln. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {pottery studio} {school} {chef} | The pottery studio bought a second kiln. | The pottery studio purchased a second kiln. |
| 0.88 (0.88) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {forklift} {kiln} {lemon} | The depot acquired two forklifts. | The depot purchased two forklifts. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {error} {auditor} | An error discovers an auditor in the ledger. | An error in the ledger is discovered by an auditor. |
| 0.79 (0.79) | 0.116 | repair.Agent (8) | repair.Patient (9) | {electrician} {feed pipe} {gearbox} | The electrician repaired the yard floodlight. | The yard floodlight repaired the electrician. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {on} {open} {unlocked} | Tom leaves the lights on all day. | Someone must have left the door unlocked. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {editor} {loan application} {manuscript} | An editor rejects a manuscript. | A manuscript rejects an editor. |
| 0.57 (0.57) | 0.4 | sign.Agent (5) | sign.Patient (5) | {physician} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.52 (0.52) | 0.5 | order.Agent (6) | order.Theme (6) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {school} {chef} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {school} {chef} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {gallery} {Ravi} {crew} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {squad} {apprentice} {child} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {elder} {potter} {coach} | The children learn a song from an elder. | An elder teaches the children a song. |
| 0.89 (0.89) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {pottery studio} {school} {chef} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.86 (0.86) | 0.298 | block.Agent (6) | wait.Experiencer (4) | {automobile} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.77 (0.77) | 0.375 | give.Agent (15) | receive.Source (4) | {foreman} {school} {trainer} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {driver} {recruit} {winner} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {thing} {weather} | Things have changed a lot over the past year. | Until today, everything was good. |

## faithful subtree @ cluster cos 0.80

_(inventory: 1846 slots; 3407 embedded filler units (one per filler); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 0.99 (0.99) | 0.003 | borrow.Theme (3) | lend.Theme (10) | {generator, generate} {painting, paint, paintings} {ladder, ladders} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {use, permit, well, do, …} {recipe} {lathe} | A permit needs a countersignature. | A permit requires a countersignature. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club, squad, team} {board, panel} {ferry, fishing boat} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {arrive, departure, arrival, depart} {tournament} {vote, election} | A ferry postpones its departure. | A ferry puts off its departure. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {plane, airline, flight, aeroplane, …} {teach, tutor} {committee, council} | An airline calls off the evening flight. | An airline cancels the evening flight. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {licence} {curator} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {visitor, visit, guest} {camera, photography} {night delivery, deliver, delivery} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {board, panel} {bank, banking industry} {editor, editorial staff} | A panel rejects the proposal. | A panel turns down the proposal. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {loan application, apply} {proposal, provide, proposition, prove, …} {manuscript} | A bank rejects the loan application. | A bank turns down the loan application. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {budget, spend} {case, switch} {roof, new, roof, conical, roof} | A board decides next year's budget. | A board makes a decision on next year's budget. |
| 0.89 (0.89) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {kiln} {lemon, crate, lemons} {projector, projectors} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 0.88 (0.88) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef acquired several crates of lemons. | The chef bought several crates of lemons. |
| 0.88 (0.88) | 0.255 | acquire.Theme (4) | buy.Theme (19) | {kiln} {lemon, crate, lemons} {projector, projectors} | The pottery studio acquired a second kiln. | The pottery studio bought a second kiln. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef bought several crates of lemons. | The chef purchased several crates of lemons. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.116 | repair.Agent (8) | repair.Patient (9) | {cracked, feed pipe} {gearbox, gearbox, seized} {mechanic} | A cracked feed pipe repairs a crew. | A cracked feed pipe is repaired by a crew. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {error, catch, throw} {auditor} | An error discovers an auditor in the ledger. | An error in the ledger is discovered by an auditor. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {loan application, apply} {bank, banking industry} {editor, editorial staff} | The loan application rejects a bank. | The loan application is rejected by a bank. |
| 0.55 (0.55) | 0.351 | sign.Agent (5) | sign.Patient (5) | {physician, doctor, doctors} {chart, plot, draw} | A physician signs the chart. | The chart signs a physician. |
| 0.50 (0.50) | 0.459 | order.Agent (6) | order.Theme (6) | {physician, doctor, doctors} {scan} | A physician orders a second scan. | A second scan orders a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef acquired several crates of lemons. | Several crates of lemons were sold to the chef. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef purchased several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {crew} {Ravi} {gallery} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {neighbour, next door} {museum, museum, worth} {depot} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {club, squad, team} {apprentice} {child, children, kid, baby, …} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {coach, trainer} {old, elder, aging, ages ago, …} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {chef, cook} {pottery studio} {school, university, campus, college, …} | The chef bought several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.72 (0.72) | 0.375 | give.Agent (15) | receive.Source (4) | {coach, trainer} {school, university, campus, college, …} {foreman} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {winner, win, award} {driver, drive} {recruit} | A school gives the winner a medal. | The winner receives a medal from a school. |
| 0.65 (0.65) | 0.624 | make.Patient (24) | reach.Theme (6) | {decision, decide, choose, option} {Linda, Beth, Amanda, Ana, …} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.62 (0.62) | 0.482 | play.Agent (9) | sleep.Experiencer (6) | {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …} | The child likes to play with the cats. | The child is apparently sleeping. |
| 0.55 (0.55) | 0.475 | hear.Experiencer (8) | try.Agent (10) | {David, William, James, Donald, …} {Jonas, Bo, Bob, Thomas, …} {Gustavo, Alberto, Martino, Pietro, …} | James heard upbeat music outside. | David was trying to reach Amanda. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {thing, things, stuff, practice, thing} {weather, bad, weather} | Things have changed a lot over the past year. | Until today, everything was good. |

## faithful subtree @ cluster cos 0.85

_(inventory: 1846 slots; 3407 embedded filler units (one per filler); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {depot} {chef, cook} {pottery studio} | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 0.99 (0.99) | 0.003 | borrow.Theme (3) | lend.Theme (10) | {ladder, ladders} {generator, generate} {painting, paint, paintings} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit, allow, permitted} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club, team} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {departure, depart} {tournament} {vote} | A ferry postpones its departure. | A ferry puts off its departure. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {plane, airline, flight, aeroplane, …} {tutor} {council} | An airline calls off the evening flight. | An airline cancels the evening flight. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {licence} {curator} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {visitor, guest} {photography} {night delivery, deliver, delivery} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {panel} {bank} {editor} | A panel rejects the proposal. | A panel turns down the proposal. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {loan application} {proposal, proposition} {manuscript} | A bank rejects the loan application. | A bank turns down the loan application. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {roof, new, roof, conical, roof} {budget} {case} | A committee decides on a new roof. | A committee makes a decision on a new roof. |
| 0.89 (0.89) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {forklift, forklifts} {kiln} {lemon, crate, lemons} | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 0.88 (0.88) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {depot} {chef, cook} {pottery studio} | The depot acquired two forklifts. | The depot bought two forklifts. |
| 0.88 (0.88) | 0.255 | acquire.Theme (4) | buy.Theme (19) | {forklift, forklifts} {kiln} {lemon, crate, lemons} | The depot acquired two forklifts. | The depot bought two forklifts. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {depot} {chef, cook} {pottery studio} | The depot bought two forklifts. | The depot purchased two forklifts. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.116 | repair.Agent (8) | repair.Patient (9) | {cracked, feed pipe} {gearbox, gearbox, seized} {mechanic} | A cracked feed pipe repairs a crew. | A cracked feed pipe is repaired by a crew. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {error} {auditor} | An error discovers an auditor in the ledger. | An error in the ledger is discovered by an auditor. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {loan application} {bank} {editor} | The loan application rejects a bank. | The loan application is rejected by a bank. |
| 0.55 (0.55) | 0.351 | sign.Agent (5) | sign.Patient (5) | {physician, doctor, doctors} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.50 (0.50) | 0.459 | order.Agent (6) | order.Theme (6) | {physician, doctor, doctors} {scan} | A physician orders a second scan. | A second scan orders a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {depot} {chef, cook} {pottery studio} | The depot acquired two forklifts. | Two forklifts were sold to the depot. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {depot} {chef, cook} {pottery studio} | The depot purchased two forklifts. | Two forklifts were sold to the depot. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {gallery} {crew} {Ravi} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {depot} {neighbour, next door} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {squad} {apprentice} {child, children, kid, kids} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {coach, trainer} {old, elder, elderly} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {depot} {chef, cook} {pottery studio} | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 0.72 (0.72) | 0.375 | give.Agent (15) | receive.Source (4) | {coach, trainer} {school, education} {foreman} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {recruit} {winner, win} {driver, drive} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing, things} | Looks like the weather is changing. | The weather looks good today. |

## faithful subtree @ cluster cos 0.90

_(inventory: 1846 slots; 3407 embedded filler units (one per filler); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 0.99 (0.99) | 0.003 | borrow.Theme (3) | lend.Theme (10) | {painting, paintings} {ladder, ladders} {generator, generate} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit, permitted} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {vote} {departure, depart} {tournament} | A board postpones the vote. | A board puts off the vote. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {council} {airline} {tutor} | A council calls off the summer fair. | A council cancels the summer fair. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {licence} {curator} {warden} | A licence allows night deliveries. | A licence permits night deliveries. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {photography} {visitor, guest} {night delivery} | A curator allows photography in the hall. | A curator permits photography in the hall. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {panel} {bank} {editor} | A panel rejects the proposal. | A panel turns down the proposal. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {manuscript} {loan application} {proposal} | An editor rejects a manuscript. | An editor turns down a manuscript. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {new, roof} {budget} {case} | A committee decides on a new roof. | A committee makes a decision on a new roof. |
| 0.89 (0.89) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {projector, projectors} {forklift, forklifts} {kiln} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 0.88 (0.88) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | The depot bought two forklifts. |
| 0.88 (0.88) | 0.255 | acquire.Theme (4) | buy.Theme (19) | {projector, projectors} {forklift, forklifts} {kiln} | The school acquired a projector for the hall. | The school bought a projector for the hall. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {depot} {chef} {pottery studio} | The depot bought two forklifts. | The depot purchased two forklifts. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.116 | repair.Agent (8) | repair.Patient (9) | {cracked, feed pipe} {gearbox, seized} {mechanic} | A cracked feed pipe repairs a crew. | A cracked feed pipe is repaired by a crew. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {loan application} {bank} | A manuscript rejects an editor. | An editor rejects a manuscript. |
| 0.55 (0.55) | 0.351 | sign.Agent (5) | sign.Patient (5) | {chart} {physician, doctor} | The chart signs a physician. | A doctor signs the chart. |
| 0.50 (0.50) | 0.459 | order.Agent (6) | order.Theme (6) | {scan} {physician, doctor} | A second scan orders a physician. | A doctor orders a second scan. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | Two forklifts were sold to the depot. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot purchased two forklifts. | Two forklifts were sold to the depot. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {gallery} {crew} {Ravi} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {neighbour} {museum} {depot} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {squad} {apprentice} {children, kids} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {coach} {elder, elderly} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 0.72 (0.72) | 0.375 | give.Agent (15) | receive.Source (4) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {recruit} {winner, win} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing, things} | Looks like the weather is changing. | The weather looks good today. |

## faithful subtree @ cluster cos 0.95

_(inventory: 1846 slots; 3407 embedded filler units (one per filler); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {vote} {departure, depart} {tournament} | A board postpones the vote. | A board puts off the vote. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {council} {airline} {tutor} | A council calls off the summer fair. | A council cancels the summer fair. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {licence} {curator} {warden} | A licence allows night deliveries. | A licence permits night deliveries. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {photography} {visitor} {night delivery} | A curator allows photography in the hall. | A curator permits photography in the hall. |
| 0.94 (0.94) | 0.113 | borrow.Theme (3) | lend.Theme (10) | {painting} {ladder} {generator} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {panel} {bank} {editor} | A panel rejects the proposal. | A panel turns down the proposal. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {manuscript} {loan application} {proposal} | An editor rejects a manuscript. | An editor turns down a manuscript. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {new, roof} {budget} {case} | A committee decides on a new roof. | A committee makes a decision on a new roof. |
| 0.89 (0.89) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {projector} {forklift, forklifts} {kiln} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 0.88 (0.88) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | The depot bought two forklifts. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {depot} {chef} {pottery studio} | The depot bought two forklifts. | The depot purchased two forklifts. |
| 0.85 (0.85) | 0.143 | abandon.Agent (8) | give_up.Agent (4) | {firm} {climbers} {rescue team} | A firm abandons its tender. | A firm gives up its tender. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.116 | repair.Agent (8) | repair.Patient (9) | {cracked, feed pipe} {gearbox, seized} {mechanic} | A cracked feed pipe repairs a crew. | A cracked feed pipe is repaired by a crew. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {loan application} {bank} | A manuscript rejects an editor. | An editor rejects a manuscript. |
| 0.57 (0.57) | 0.4 | sign.Agent (5) | sign.Patient (5) | {chart} {physician} | The chart signs a physician. | A doctor signs the chart. |
| 0.51 (0.51) | 0.5 | order.Agent (6) | order.Theme (6) | {scan} {physician} | A second scan orders a physician. | A doctor orders a second scan. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot acquired two forklifts. | Two forklifts were sold to the depot. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot purchased two forklifts. | Two forklifts were sold to the depot. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {gallery} {crew} {Ravi} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {neighbour} {museum} {depot} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {squad} {apprentice} {children, kids} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {potter} {coach} {elder, elderly} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {depot} {chef} {pottery studio} | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 0.82 (0.82) | 0.298 | block.Agent (6) | wait.Experiencer (4) | {automobile, automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.72 (0.72) | 0.375 | give.Agent (15) | receive.Source (4) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {recruit} {winner} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing} | Looks like the weather is changing. | The weather looks good today. |

## faithful subtree @ cluster cos 1.00

_(inventory: 1846 slots; 3407 embedded filler units (one per filler); 192 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {school} {chef} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {ferry} {board} {club} | A ferry postpones its departure. | A ferry puts off its departure. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure} | A club postpones the tournament. | A club puts off the tournament. |
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {tutor} {airline} {council} | A tutor calls off the afternoon session. | A tutor cancels the afternoon session. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {licence} {warden} {curator} | A licence allows night deliveries. | A licence permits night deliveries. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {night delivery} {photography} {visitor} | A licence allows night deliveries. | A licence permits night deliveries. |
| 0.94 (0.94) | 0.113 | borrow.Theme (3) | lend.Theme (10) | {generator} {ladder} {painting} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.93 (0.93) | 0.138 | reject.Agent (8) | turn_down.Agent (3) | {editor} {panel} {bank} | An editor rejects a manuscript. | An editor turns down a manuscript. |
| 0.93 (0.93) | 0.138 | reject.Theme (8) | turn_down.Theme (3) | {loan application} {manuscript} {proposal} | A bank rejects the loan application. | A bank turns down the loan application. |
| 0.92 (0.92) | 0.157 | decide.Theme (11) | decision.Theme (6) | {new, roof} {budget} {case} | A committee decides on a new roof. | A committee makes a decision on a new roof. |
| 0.89 (0.89) | 0.108 | acquire.Theme (4) | purchase.Theme (5) | {forklifts} {kiln} {projector} | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 0.88 (0.88) | 0.208 | acquire.Agent (4) | buy.Agent (17) | {pottery studio} {school} {chef} | The pottery studio acquired a second kiln. | The pottery studio bought a second kiln. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | purchase.Agent (4) | {pottery studio} {school} {chef} | The pottery studio bought a second kiln. | The pottery studio purchased a second kiln. |
| 0.85 (0.85) | 0.143 | abandon.Agent (8) | give_up.Agent (4) | {firm} {rescue team} {climbers} | A firm abandons its tender. | A firm gives up its tender. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.116 | repair.Agent (8) | repair.Patient (9) | {electrician} {gearbox, seized} {mechanic} | The electrician repaired the yard floodlight. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {error} {auditor} | An error discovers an auditor in the ledger. | An error in the ledger is discovered by an auditor. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {editor} {loan application} {manuscript} | An editor rejects a manuscript. | A manuscript rejects an editor. |
| 0.57 (0.57) | 0.4 | sign.Agent (5) | sign.Patient (5) | {physician} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.51 (0.51) | 0.5 | order.Agent (6) | order.Theme (6) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {school} {chef} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {school} {chef} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {gallery} {Ravi} {crew} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.92 (0.92) | 0.157 | learn.Agent (3) | teach.Recipient (11) | {squad} {apprentice} {children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | learn.Source (3) | teach.Agent (12) | {elder} {potter} {coach} | The children learn a song from an elder. | An elder teaches the children a song. |
| 0.88 (0.88) | 0.208 | buy.Agent (17) | sell.Recipient (4) | {pottery studio} {school} {chef} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.72 (0.72) | 0.375 | give.Agent (15) | receive.Source (4) | {foreman} {school} {trainer} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.71 (0.71) | 0.308 | block.Agent (6) | wait.Experiencer (4) | {automobile} {automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.67 (0.67) | 0.437 | give.Recipient (14) | receive.Agent (7) | {driver} {recruit} {winner} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {thing} {weather} | Things have changed a lot over the past year. | Until today, everything was good. |
