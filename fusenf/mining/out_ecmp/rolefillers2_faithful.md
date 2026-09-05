# §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm (paper as written)

> "For every predicate-slot (e.g. go to.Agent or Agent2), we collect the set of fillers across the corpus and embed them in a vector space (using word or subtree embeddings). Clustering these embeddings reveals when two slots share indistinguishable distributions of fillers, indicating they fulfill the same semantic role and can be merged." — FUSE-NF §4.3.2

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| predicate-slot | every argument head attached to an event center in the canonical graph (closed-class roles, preposition-named obliques, and the other heads — temporal, resultative, discourse); the class links Member / Inheritance classify the event and are not slots; entity-center heads reported separately |
| fillers | every argument of such a head, across the corpus; texts per `embeddings.py` (class labels, surface names, constant symbols); un-embeddable fillers (untyped skolems, numbers, strings, structured terms) excluded from the distribution |
| embeddings | mining/out_ecmp/embeddings: Qwen3-Embedding-8B, bf16, normalized; word texts (one per class label, 1/m mass for a multi-label filler) and subtree texts (the label bag / plural form / name as one text) |
| clustering | agglomerative, average linkage on cosine distance, one tree cut at cluster cosine [0.8, 0.85, 0.9, 0.95, 1.0] (1.0 = one cluster per distinct text) |
| slot distribution | raw mass over clusters, no weighting; a slot enters comparison at n >= 3 embedded fillers; a head enters the pooled view at n >= 20 |
| 'indistinguishable' | similarity, not a homogeneity test (slot sizes are far too small for one): Jensen-Shannon divergence <= 0.3 (0 = identical, 1 = disjoint) with >= 2 shared clusters; the other statistic is reported beside it |
| slot pairs compared | all pairs of the same center kind; shown by bucket for reading only: same role / different class, same class / different role, different class and role |

- exact-label baseline on the same substrate (augmented arm, for reference only): 87 signals

## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)

- recall = expected lemma pairs (paraphrase variants: buy~purchase, buy~sell the converse, …) linked by ANY signal; lexical control hits = antonym / near-miss pairs linked by a same-role or cross-both signal (must be 0); swap-control hits = classes whose participant-swap control produced an Agent~object cross-role signal (informational: the swapped sentence IS role wobble by design)

| method | recall | recovered / expected | lexical control hits | swap-control hits | missed |
|---|---|---|---|---|---|
| exact label (augmented arm, cos>=0.50) | 0.769 | 20 / 26 | begin|end | 7 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful word @ 0.80 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |
| faithful word @ 0.85 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |
| faithful word @ 0.90 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |
| faithful word @ 0.95 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |
| faithful word @ 1.00 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |
| faithful subtree @ 0.80 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |
| faithful subtree @ 0.85 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |
| faithful subtree @ 0.90 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |
| faithful subtree @ 0.95 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |
| faithful subtree @ 1.00 (JSD<=0.30) | 0.692 | 18 / 26 | begin|end | 3 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair, take|walk |

## Signals across the dial (gate: JSD <= 0.30)

| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw cosine criterion (event / entity) | JSD <= 0.40 (sensitivity; event) |
|---|---|---|---|---|---|---|---|---|
| exact label (augmented arm, cosine gate) | — | — | 50 | 14 | 22 | 1 | — | — |
| faithful word | 0.80 | 562 (208) | 37 | 5 | 10 | 0 | 43+9+11 / 0+0+0 | 40+12+11 |
| faithful word | 0.85 | 695 (147) | 37 | 4 | 10 | 0 | 43+8+10 / 0+0+0 | 40+12+10 |
| faithful word | 0.90 | 798 (82) | 36 | 4 | 10 | 0 | 42+8+10 / 0+0+0 | 39+12+10 |
| faithful word | 0.95 | 863 (23) | 39 | 4 | 11 | 0 | 45+8+11 / 0+0+0 | 42+12+11 |
| faithful word | 1.00 | 888 (0) | 39 | 4 | 11 | 0 | 44+8+11 / 0+0+0 | 42+12+11 |
| faithful subtree | 0.80 | 562 (208) | 37 | 5 | 10 | 0 | 42+8+11 / 0+0+0 | 40+11+11 |
| faithful subtree | 0.85 | 695 (147) | 37 | 4 | 10 | 0 | 42+7+10 / 0+0+0 | 40+11+10 |
| faithful subtree | 0.90 | 798 (82) | 36 | 4 | 10 | 0 | 40+7+10 / 0+0+0 | 39+11+10 |
| faithful subtree | 0.95 | 863 (23) | 37 | 4 | 11 | 0 | 42+8+11 / 0+0+0 | 41+11+11 |
| faithful subtree | 1.00 | 888 (0) | 37 | 4 | 11 | 0 | 42+8+11 / 0+0+0 | 41+11+11 |

## faithful word @ cluster cos 0.80

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.43 | 0.764 | Agent (500) | Experiencer (63) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {person, people} {automobile, car, automobiles} |
| 0.30 | 0.671 | Agent (500) | Recipient (47) | {person, people} {Karen, Katherine, Margaret Fleming, Ana, …} {Ralph, Bo, Bobby, Frankie, …} |
| 0.23 | 0.83 | Agent (500) | Patient (159) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {physician, doctor} |
| 0.21 | 0.834 | Experiencer (63) | Patient (159) | {person, people} {movie, film, music film, musical film} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} |
| 0.20 | 0.745 | Agent (500) | Theme (367) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {person, people} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.16 | 0.851 | Patient (159) | Theme (367) | {song, sing, music} {person, people} {answer, decision, permit, decide, …} |
| 0.15 | 0.844 | Recipient (47) | Theme (367) | {query, search} {Ravi, Armaan Jain, Ranbir Kapoor} {child, children} |
| 0.12 | 0.876 | Experiencer (63) | Theme (367) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {bridge, footbridge} |
| 0.11 | 0.907 | Experiencer (63) | Recipient (47) | {person, people} {Cameron, Blair} |
| 0.09 | 0.804 | Recipient (47) | Source (24) | {coach, trainer} {depot} {potter} |
| 0.09 | 0.938 | Patient (159) | Recipient (47) | {person, people} {crew, night crew} |
| 0.07 | 0.862 | Agent (500) | Source (24) | {school} {depot} {coach, trainer} |
| 0.06 | 0.926 | Goal (30) | Source (24) | {New Jersey, Virginia, West Virginia} |
| 0.06 | 0.939 | Manner (34) | Recipient (47) | {winner, ward, win, well} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child, children} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.05 | 0.932 | Agent (500) | Goal (30) | {Karen, Katherine, Margaret Fleming, Ana, …} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {child, children} |
| 0.04 | 0.963 | Goal (30) | Location (175) | {Germany, Estonia, France, Italy, …} |
| 0.04 | 0.96 | Manner (34) | Theme (367) | {north route, lane, way} {widespread, widely, attention, widespread} |
| 0.03 | 0.965 | Location (175) | Patient (159) | {movie, film, music film, musical film} {hall, house, room} |
| 0.03 | 0.947 | Patient (159) | Time (37) | {afternoon session, late afternoon} {last, later, end} |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon, crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous, indigenous american, indigenous, people, native american, …} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee, council} {family} {board, panel} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing, music} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.99 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, sign, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm, Company, company} | A rescue team abandons the search. | A rescue team gives up the search. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route, lane, way} {query, search} | A firm abandons its tender. | A firm gives up its tender. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {recipe} {lathe} {answer, decision, permit, decide, …} | A recipe needs two eggs. | Two eggs are required by a recipe. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board, panel} {ferry, ship} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vet, vote} {departure, arrive, arrival, depart, …} | A club postpones the tournament. | A club puts off the tournament. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal commences after lunch. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal starts after lunch. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | portray.Agent (6) | portray.Theme (6) | {inomaru, Kantaro Suga, Mie Sonozaki, Soichiro Akizuki} {James Woods, Jeremy Irons} {Wilson, wilson} | Portrayed by Soichiro Akizuki , Kantaro Suga is . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew, night crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi, Armaan Jain, Ranbir Kapoor} {gallery} {crew, night crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {winner, ward, win, well} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |

## faithful word @ cluster cos 0.85

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.29 | 0.715 | Agent (500) | Recipient (47) | {person, people} {school} {depot} |
| 0.28 | 0.858 | Agent (500) | Experiencer (63) | {person, people} {automobile, car, automobiles} {George Allen, James David Edgar, Chuck Robb} |
| 0.24 | 0.845 | Agent (500) | Patient (159) | {person, people} {physician, doctor} {storm, hurricane} |
| 0.21 | 0.834 | Experiencer (63) | Patient (159) | {person, people} {movie, film} {Henry Cole, O. R. Woodcock, Thomas Bain, Thomas Fothergill, …} |
| 0.16 | 0.795 | Agent (500) | Theme (367) | {person, people} {physician, doctor} {inomaru, Mie Sonozaki, Soichiro Akizuki} |
| 0.14 | 0.868 | Patient (159) | Theme (367) | {person, people} {song, sing} {movie, film} |
| 0.11 | 0.804 | Recipient (47) | Source (24) | {coach, trainer} {depot} {potter} |
| 0.11 | 0.907 | Experiencer (63) | Theme (367) | {person, people} {Henry Cole, O. R. Woodcock, Thomas Bain, Thomas Fothergill, …} {bridge, footbridge} |
| 0.10 | 0.896 | Recipient (47) | Theme (367) | {query, search} {child, children} {person, people} |
| 0.10 | 0.862 | Agent (500) | Source (24) | {school} {depot} {coach, trainer} |
| 0.09 | 0.938 | Patient (159) | Recipient (47) | {person, people} {crew} |
| 0.08 | 0.943 | Experiencer (63) | Recipient (47) | {person, people} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child, children} {Ana, Jessica, Loren} |
| 0.04 | 0.947 | Agent (500) | Goal (30) | {Ana, Jessica, Loren} {George Allen, James David Edgar, Chuck Robb} {child, children} |
| 0.02 | 0.972 | Manner (34) | Theme (367) | {lane, way} {widespread, widely, attention, widespread} |
| 0.02 | 0.967 | Experiencer (63) | Goal (30) | {George Allen, James David Edgar, Chuck Robb} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {child, children} {predictive function, predictive functions} |
| 0.02 | 0.977 | Location (175) | Manner (34) | {ward, well} |
| 0.01 | 0.982 | Patient (159) | Time (37) | {last, later} |
| 0.01 | 0.99 | Theme (367) | Time (37) | {today, current, now} |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon, crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous, indigenous american, indigenous, people, native american, …} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.99 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, sign, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {query, search} | A firm abandons its tender. | A firm gives up its tender. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {recipe} {lathe} {permit, allow, accept, confirm} | A recipe needs two eggs. | Two eggs are required by a recipe. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart, leave} | A club postpones the tournament. | A club puts off the tournament. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal commences after lunch. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal starts after lunch. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |

## faithful word @ cluster cos 0.90

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.29 | 0.735 | Agent (500) | Recipient (47) | {person, people} {school} {depot} |
| 0.28 | 0.894 | Agent (500) | Experiencer (63) | {person, people} {automobile, car, automobiles} {Aslan} |
| 0.25 | 0.855 | Agent (500) | Patient (159) | {person, people} {physician, doctor} {electrician} |
| 0.19 | 0.873 | Experiencer (63) | Patient (159) | {person, people} {movie, film} {relationship} |
| 0.15 | 0.822 | Agent (500) | Theme (367) | {person, people} {physician, doctor} {child} |
| 0.13 | 0.879 | Patient (159) | Theme (367) | {person, people} {song, sing} {movie, film} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {potter} {foreman} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {potter} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {child} {person, people} {tower} |
| 0.09 | 0.943 | Experiencer (63) | Recipient (47) | {person, people} |
| 0.09 | 0.938 | Patient (159) | Recipient (47) | {person, people} {crew} |
| 0.08 | 0.929 | Experiencer (63) | Theme (367) | {person, people} {bridge} {view} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child} {Loren} |
| 0.03 | 0.964 | Agent (500) | Goal (30) | {George Allen, Chuck Robb} {child} {pier} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {child} {predictive function, predictive functions} |
| 0.01 | 0.988 | Experiencer (63) | Location (175) | {park} |
| 0.01 | 0.987 | Location (175) | Theme (367) | {mural} {gate} |
| 0.01 | 0.992 | Manner (34) | Theme (367) | {widespread, widely} |
| 0.01 | 0.987 | Agent (500) | Location (175) | {nurse} {north} {ward} |
| 0.01 | 0.993 | Source (24) | Theme (367) | {depot} |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous american, native american, indigenous americans, native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.99 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {search} | A firm abandons its tender. | A firm gives up its tender. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {recipe} {lathe} {permit, allow} | A recipe needs two eggs. | Two eggs are required by a recipe. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart} | A club postpones the tournament. | A club puts off the tournament. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal commences after lunch. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal starts after lunch. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |

## faithful word @ cluster cos 0.95

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.30 | 0.735 | Agent (500) | Recipient (47) | {person} {school} {depot} |
| 0.24 | 0.901 | Agent (500) | Experiencer (63) | {person} {automobile, automobiles} {Aslan} |
| 0.24 | 0.864 | Agent (500) | Patient (159) | {person} {physician} {electrician} |
| 0.15 | 0.874 | Experiencer (63) | Patient (159) | {person} {movie, film} {people} |
| 0.15 | 0.83 | Agent (500) | Theme (367) | {person} {physician} {child} |
| 0.12 | 0.888 | Patient (159) | Theme (367) | {person} {song} {movie, film} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {potter} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {potter} {foreman} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {child} {person} {tower} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person} {crew} |
| 0.07 | 0.93 | Experiencer (63) | Theme (367) | {person} {bridge} {view} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child} {Loren} |
| 0.03 | 0.964 | Agent (500) | Goal (30) | {George Allen, Chuck Robb} {child} {pier} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {child} {predictive function, predictive functions} |
| 0.01 | 0.988 | Experiencer (63) | Location (175) | {park} |
| 0.01 | 0.987 | Location (175) | Theme (367) | {mural} {gate} |
| 0.01 | 0.987 | Agent (500) | Location (175) | {nurse} {north} {ward} |
| 0.01 | 0.993 | Source (24) | Theme (367) | {depot} |
| 0.00 | 1.0 | Agent (500) | Manner (34) |  |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector} {lemon} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler} {indigenous american, native american, indigenous americans, native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {shoreline survey} {dress rehearsal} {apple harvest} | A shoreline survey commences at dawn. | A shoreline survey starts at dawn. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.99 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg} {countersignature, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {search} | A firm abandons its tender. | A firm gives up its tender. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {recipe} {lathe} {permit} | A recipe needs two eggs. | Two eggs are required by a recipe. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart} | A club postpones the tournament. | A club puts off the tournament. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {shoreline survey} {dress rehearsal} {apple harvest} | A shoreline survey begins at dawn. | A shoreline survey commences at dawn. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {shoreline survey} {dress rehearsal} {apple harvest} | A shoreline survey begins at dawn. | A shoreline survey starts at dawn. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.65 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.65 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {physician} {chart} | A physician signs the chart. | The chart signs a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (0.99) | 0.006 | block.Agent (4) | wait.Experiencer (3) | {automobile, automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.78 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson} {wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |

## faithful word @ cluster cos 1.00

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.30 | 0.735 | Agent (500) | Recipient (47) | {person} {depot} {school} |
| 0.24 | 0.864 | Agent (500) | Patient (159) | {person} {physician} {electrician} |
| 0.24 | 0.901 | Agent (500) | Experiencer (63) | {person} {automobile} {Aslan} |
| 0.15 | 0.88 | Experiencer (63) | Patient (159) | {person} {bad} {indigenous} |
| 0.15 | 0.83 | Agent (500) | Theme (367) | {person} {physician} {child} |
| 0.12 | 0.891 | Patient (159) | Theme (367) | {person} {song} {decision} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {elder} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {coach} {foreman} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {child} {person} {query} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person} {crew} |
| 0.07 | 0.93 | Experiencer (63) | Theme (367) | {person} {bridge} {view} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child} {Loren} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {child} {predictive function} |
| 0.02 | 0.978 | Agent (500) | Goal (30) | {child} {pier} |
| 0.01 | 0.988 | Experiencer (63) | Location (175) | {park} |
| 0.01 | 0.987 | Location (175) | Theme (367) | {gate} {mural} |
| 0.01 | 0.987 | Agent (500) | Location (175) | {north} {nurse} {ward} |
| 0.01 | 0.993 | Source (24) | Theme (367) | {depot} |
| 0.00 | 1.0 | Agent (500) | Manner (34) |  |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {crate} {forklift} {kiln} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler} {indigenous american} {native american} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {apple harvest} {dress rehearsal} {hearing} | The apple harvest commences in September. | The apple harvest starts in September. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {board} {committee} {family} | A board makes a decision on next year's budget. | A board reaches a decision on next year's budget. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {glazing} {song} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.99 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {countersignature} {egg} {monthly servicing} | A permit needs a countersignature. | A permit requires a countersignature. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {climber} {firm} {rescue team} | Two climbers abandon the north route. | Two climbers give up the north route. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {north route} {search} {tender} | Two climbers abandon the north route. | Two climbers give up the north route. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {board} {club} {ferry} | A board postpones the vote. | A board puts off the vote. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {departure} {tournament} {vote} | A ferry postpones its departure. | A ferry puts off its departure. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {apple harvest} {dress rehearsal} {hearing} | The apple harvest begins in September. | The apple harvest commences in September. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {apple harvest} {dress rehearsal} {hearing} | The apple harvest begins in September. | The apple harvest starts in September. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {curator} {licence} {warden} | A curator allows photography in the hall. | A curator permits photography in the hall. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.65 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.65 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {chart} {physician} | The chart signs a physician. | A doctor signs the chart. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | Several crates of lemons were sold to the chef. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef purchased several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.99 (0.99) | 0.006 | block.Agent (4) | wait.Experiencer (3) | {automobile} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {crew} {gallery} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {depot} {museum} {neighbour} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {apprentice} {child} {squad} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {coach} {elder} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef bought several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.78 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {Wilson} {James Woods} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | Wilson won an Emmy for his portrayal of James Woods . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {school} {trainer} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {driver} {recruit} {winner} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |

## faithful subtree @ cluster cos 0.80

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.38 | 0.767 | Agent (500) | Experiencer (63) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {person, people} {automobile, car, automobiles} |
| 0.30 | 0.671 | Agent (500) | Recipient (47) | {person, people} {Karen, Katherine, Margaret Fleming, Ana, …} {Ralph, Bo, Bobby, Frankie, …} |
| 0.21 | 0.835 | Agent (500) | Patient (159) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {physician, doctor} |
| 0.20 | 0.745 | Agent (500) | Theme (367) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {person, people} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.18 | 0.839 | Experiencer (63) | Patient (159) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {bridge, footbridge} |
| 0.15 | 0.863 | Patient (159) | Theme (367) | {song, sing, music} {person, people} {answer, decision, permit, decide, …} |
| 0.15 | 0.844 | Recipient (47) | Theme (367) | {query, search} {Ravi, Armaan Jain, Ranbir Kapoor} {child, children} |
| 0.12 | 0.882 | Experiencer (63) | Theme (367) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {bridge, footbridge} |
| 0.09 | 0.912 | Experiencer (63) | Recipient (47) | {person, people} {Cameron, Blair} |
| 0.09 | 0.804 | Recipient (47) | Source (24) | {coach, trainer} {depot} {potter} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person, people} {crew, night crew} |
| 0.07 | 0.862 | Agent (500) | Source (24) | {school} {depot} {coach, trainer} |
| 0.06 | 0.926 | Goal (30) | Source (24) | {New Jersey, Virginia, West Virginia} |
| 0.06 | 0.939 | Manner (34) | Recipient (47) | {winner, ward, win, well} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child, children} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.05 | 0.932 | Agent (500) | Goal (30) | {Karen, Katherine, Margaret Fleming, Ana, …} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {child, children} |
| 0.04 | 0.963 | Goal (30) | Location (175) | {Germany, Estonia, France, Italy, …} |
| 0.03 | 0.966 | Location (175) | Patient (159) | {movie, film, music film, musical film} {hall, house, room} |
| 0.02 | 0.977 | Location (175) | Recipient (47) | {winner, ward, win, well} |
| 0.02 | 0.964 | Patient (159) | Time (37) | {afternoon session, late afternoon} |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon, crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous, indigenous american, indigenous, people, native american, …} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee, council} {family} {board, panel} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing, music} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.99 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, sign, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm, Company, company} | A rescue team abandons the search. | A rescue team gives up the search. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route, lane, way} {query, search} | A firm abandons its tender. | A firm gives up its tender. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {recipe} {lathe} {answer, decision, permit, decide, …} | A recipe needs two eggs. | Two eggs are required by a recipe. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board, panel} {ferry, ship} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vet, vote} {departure, arrive, arrival, depart, …} | A club postpones the tournament. | A club puts off the tournament. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal commences after lunch. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal starts after lunch. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | portray.Agent (6) | portray.Theme (6) | {inomaru, Kantaro Suga, Mie Sonozaki, Soichiro Akizuki} {James Woods, Jeremy Irons} {Wilson, wilson} | Portrayed by Soichiro Akizuki , Kantaro Suga is . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew, night crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi, Armaan Jain, Ranbir Kapoor} {gallery} {crew, night crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {winner, ward, win, well} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |

## faithful subtree @ cluster cos 0.85

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.29 | 0.715 | Agent (500) | Recipient (47) | {person, people} {school} {depot} |
| 0.23 | 0.861 | Agent (500) | Experiencer (63) | {person, people} {automobile, car, automobiles} {George Allen, James David Edgar, Chuck Robb} |
| 0.23 | 0.845 | Agent (500) | Patient (159) | {person, people} {physician, doctor} {storm, hurricane} |
| 0.18 | 0.839 | Experiencer (63) | Patient (159) | {person, people} {Henry Cole, O. R. Woodcock, Thomas Bain, Thomas Fothergill, …} {bridge, footbridge} |
| 0.16 | 0.795 | Agent (500) | Theme (367) | {person, people} {physician, doctor} {inomaru, Mie Sonozaki, Soichiro Akizuki} |
| 0.13 | 0.875 | Patient (159) | Theme (367) | {person, people} {song, sing} {decision, decide} |
| 0.11 | 0.804 | Recipient (47) | Source (24) | {coach, trainer} {depot} {potter} |
| 0.10 | 0.91 | Experiencer (63) | Theme (367) | {person, people} {Henry Cole, O. R. Woodcock, Thomas Bain, Thomas Fothergill, …} {bridge, footbridge} |
| 0.10 | 0.862 | Agent (500) | Source (24) | {school} {depot} {coach, trainer} |
| 0.10 | 0.896 | Recipient (47) | Theme (367) | {query, search} {child, children} {person, people} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person, people} {crew} |
| 0.06 | 0.948 | Experiencer (63) | Recipient (47) | {person, people} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child, children} {Ana, Jessica, Loren} |
| 0.04 | 0.947 | Agent (500) | Goal (30) | {Ana, Jessica, Loren} {George Allen, James David Edgar, Chuck Robb} {child, children} |
| 0.02 | 0.967 | Experiencer (63) | Goal (30) | {George Allen, James David Edgar, Chuck Robb} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {child, children} {predictive function, predictive functions} |
| 0.02 | 0.977 | Location (175) | Manner (34) | {ward, well} |
| 0.01 | 0.987 | Manner (34) | Theme (367) | {widespread, widely, attention, widespread} |
| 0.01 | 0.987 | Location (175) | Theme (367) | {mural} {gate} |
| 0.01 | 0.988 | Experiencer (63) | Location (175) | {park} |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon, crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous, indigenous american, indigenous, people, native american, …} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.99 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, sign, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {query, search} | A firm abandons its tender. | A firm gives up its tender. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {recipe} {lathe} {permit, allow, accept, confirm} | A recipe needs two eggs. | Two eggs are required by a recipe. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart, leave} | A club postpones the tournament. | A club puts off the tournament. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal commences after lunch. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal starts after lunch. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |

## faithful subtree @ cluster cos 0.90

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.29 | 0.735 | Agent (500) | Recipient (47) | {person, people} {school} {depot} |
| 0.23 | 0.858 | Agent (500) | Patient (159) | {person, people} {physician, doctor} {electrician} |
| 0.22 | 0.901 | Agent (500) | Experiencer (63) | {person, people} {automobile, car, automobiles} {Aslan} |
| 0.15 | 0.886 | Experiencer (63) | Patient (159) | {person, people} {bad, relationship} {indigenous, indigenous, people} |
| 0.15 | 0.822 | Agent (500) | Theme (367) | {person, people} {physician, doctor} {children} |
| 0.12 | 0.887 | Patient (159) | Theme (367) | {person, people} {song, sing} {decision, decide} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {potter} {foreman} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {potter} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {children} {person, people} {tower} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person, people} {crew} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person, people} |
| 0.06 | 0.952 | Experiencer (63) | Theme (367) | {person, people} {bridge} {destined, film, syrian} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {children} {Loren} |
| 0.03 | 0.964 | Agent (500) | Goal (30) | {George Allen, Chuck Robb} {children} {pier} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {children} {predictive function, predictive functions} |
| 0.01 | 0.988 | Experiencer (63) | Location (175) | {park} |
| 0.01 | 0.987 | Location (175) | Theme (367) | {mural} {gate} |
| 0.01 | 0.987 | Agent (500) | Location (175) | {nurse} {north} {ward} |
| 0.00 | 0.993 | Source (24) | Theme (367) | {depot} |
| 0.00 | 1.0 | Agent (500) | Manner (34) |  |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous american, native american, indigenous americans, native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.99 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {search} | A firm abandons its tender. | A firm gives up its tender. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {recipe} {lathe} {permit, allow} | A recipe needs two eggs. | Two eggs are required by a recipe. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart} | A club postpones the tournament. | A club puts off the tournament. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal commences after lunch. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal starts after lunch. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |

## faithful subtree @ cluster cos 0.95

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.30 | 0.735 | Agent (500) | Recipient (47) | {person} {school} {depot} |
| 0.22 | 0.901 | Agent (500) | Experiencer (63) | {person} {automobile, automobiles} {Aslan} |
| 0.15 | 0.83 | Agent (500) | Theme (367) | {person} {physician} {children} |
| 0.15 | 0.881 | Agent (500) | Patient (159) | {person} {physician} {electrician} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {potter} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {potter} {foreman} |
| 0.10 | 0.905 | Experiencer (63) | Patient (159) | {person} {bad, relationship} {indigenous, people} |
| 0.10 | 0.9 | Patient (159) | Theme (367) | {song} {person} {decision} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {children} {person} {tower} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person} |
| 0.06 | 0.952 | Experiencer (63) | Theme (367) | {person} {bridge} {destined, film, syrian} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {children} {Loren} |
| 0.04 | 0.954 | Patient (159) | Recipient (47) | {person} {crew} |
| 0.03 | 0.964 | Agent (500) | Goal (30) | {George Allen, Chuck Robb} {children} {pier} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {children} {predictive function, predictive functions} |
| 0.01 | 0.988 | Experiencer (63) | Location (175) | {park} |
| 0.01 | 0.987 | Location (175) | Theme (367) | {mural} {gate} |
| 0.01 | 0.987 | Agent (500) | Location (175) | {nurse} {north} {ward} |
| 0.01 | 0.993 | Source (24) | Theme (367) | {depot} |
| 0.00 | 1.0 | Agent (500) | Manner (34) |  |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector} {crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settlers} {indigenous american, native american, indigenous americans, native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {shoreline survey} {dress rehearsal} {apple harvest} | A shoreline survey commences at dawn. | A shoreline survey starts at dawn. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.99 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {eggs} {countersignature, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {search} | A firm abandons its tender. | A firm gives up its tender. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {recipe} {lathe} {permit} | A recipe needs two eggs. | Two eggs are required by a recipe. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart} | A club postpones the tournament. | A club puts off the tournament. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {shoreline survey} {dress rehearsal} {apple harvest} | A shoreline survey begins at dawn. | A shoreline survey commences at dawn. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {shoreline survey} {dress rehearsal} {apple harvest} | A shoreline survey begins at dawn. | A shoreline survey starts at dawn. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.65 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.65 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {physician} {chart} | A physician signs the chart. | The chart signs a physician. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (0.99) | 0.006 | block.Agent (4) | wait.Experiencer (3) | {automobile, automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.78 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson} {wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |

## faithful subtree @ cluster cos 1.00

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.30 | 0.735 | Agent (500) | Recipient (47) | {person} {depot} {school} |
| 0.21 | 0.903 | Agent (500) | Experiencer (63) | {person} {automobile} {Aslan} |
| 0.15 | 0.83 | Agent (500) | Theme (367) | {person} {physician} {children} |
| 0.15 | 0.881 | Agent (500) | Patient (159) | {person} {physician} {electrician} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {elder} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {coach} {foreman} |
| 0.10 | 0.905 | Experiencer (63) | Patient (159) | {person} {bad, relationship} {indigenous, people} |
| 0.10 | 0.9 | Patient (159) | Theme (367) | {song} {decision} {person} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {children} {person} {query} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person} |
| 0.06 | 0.952 | Experiencer (63) | Theme (367) | {person} {bridge} {destined, film, syrian} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {children} {Loren} |
| 0.04 | 0.954 | Patient (159) | Recipient (47) | {person} {crew} |
| 0.02 | 0.978 | Agent (500) | Goal (30) | {children} {pier} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {children} {predictive functions} |
| 0.01 | 0.988 | Experiencer (63) | Location (175) | {park} |
| 0.01 | 0.987 | Location (175) | Theme (367) | {gate} {mural} |
| 0.01 | 0.987 | Agent (500) | Location (175) | {north} {nurse} {ward} |
| 0.01 | 0.993 | Source (24) | Theme (367) | {depot} |
| 0.00 | 1.0 | Agent (500) | Manner (34) |  |
### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {crate, lemons} {forklifts} {kiln} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settlers} {indigenous americans} {native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {apple harvest} {dress rehearsal} {hearing} | The apple harvest commences in September. | The apple harvest starts in September. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {board} {committee} {family} | A board makes a decision on next year's budget. | A board reaches a decision on next year's budget. |
| 0.99 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {glazing} {song} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.98 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {climbers} {firm} {rescue team} | Two climbers abandon the north route. | Two climbers give up the north route. |
| 0.98 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {north route} {search} {tender} | Two climbers abandon the north route. | Two climbers give up the north route. |
| 0.98 (0.98) | 0.006 | need.Holder (3) | require.Holder (8) | {lathe} {permit} {recipe} | A lathe needs monthly servicing. | A lathe requires monthly servicing. |
| 0.98 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {board} {club} {ferry} | A board postpones the vote. | A board puts off the vote. |
| 0.98 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {departure} {tournament} {vote} | A ferry postpones its departure. | A ferry puts off its departure. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {apple harvest} {dress rehearsal} {hearing} | The apple harvest begins in September. | The apple harvest commences in September. |
| 0.97 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {apple harvest} {dress rehearsal} {hearing} | The apple harvest begins in September. | The apple harvest starts in September. |
| 0.94 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {curator} {licence} {warden} | A curator allows photography in the hall. | A curator permits photography in the hall. |
| 0.94 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {night delivery} {photography} {visitor} | A licence allows night deliveries. | A licence permits night deliveries. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.65 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.65 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {chart} {physician} | The chart signs a physician. | A doctor signs the chart. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | Several crates of lemons were sold to the chef. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef purchased several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.94 (0.94) | 0.021 | block.Agent (4) | wait.Experiencer (3) | {automobile} {automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {crew} {gallery} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {depot} {museum} {neighbour} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {apprentice} {children} {squad} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {coach} {elder} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef bought several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.78 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {Wilson} {James Woods} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | Wilson won an Emmy for his portrayal of James Woods . |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {school} {trainer} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {driver} {recruit} {winner} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
