# §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm (paper as written)

> "For every predicate-slot (e.g. go to.Agent or Agent2), we collect the set of fillers across the corpus and embed them in a vector space (using word or subtree embeddings). Clustering these embeddings reveals when two slots share indistinguishable distributions of fillers, indicating they fulfill the same semantic role and can be merged." — FUSE-NF §4.3.2

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| predicate-slot | every argument head attached to an event center in the canonical graph (closed-class roles, preposition-named obliques, and the other heads — temporal, resultative, discourse); the class links Member / Inheritance classify the event and are not slots; entity-center heads reported separately |
| fillers | every argument of such a head, across the corpus; texts per `embeddings.py` (class labels, surface names, constant symbols); un-embeddable fillers (untyped skolems, numbers, strings, structured terms) excluded from the distribution |
| embeddings | out_ecmp/embeddings: Qwen3-Embedding-8B, bf16, normalized; word texts (one per class label, 1/m mass for a multi-label filler) and subtree texts (the label bag / plural form / name as one text) |
| clustering | agglomerative, average linkage on cosine distance, one tree cut at cluster cosine [0.8, 0.85, 0.9, 0.95, 1.0] (1.0 = one cluster per distinct text) |
| slot distribution | raw mass over clusters, no weighting; a slot enters comparison at n >= 3 embedded fillers |
| 'indistinguishable' | similarity, not a homogeneity test (slot sizes are far too small for one): cosine >= 0.5 with >= 2 shared clusters; the other statistic is reported beside it |
| slot pairs compared | all pairs of the same center kind; shown by bucket for reading only: same role / different class, same class / different role, different class and role |

- exact-label baseline on the same substrate (augmented arm, for reference only): 87 signals

## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)

- recall = expected lemma pairs (paraphrase variants: buy~purchase, buy~sell the converse, …) linked by ANY signal; lexical control hits = antonym / near-miss pairs linked by a same-role or cross-both signal (must be 0); swap-control hits = classes whose participant-swap control produced an Agent~object cross-role signal (informational: the swapped sentence IS role wobble by design)

| method | recall | recovered / expected | lexical control hits | swap-control hits | missed |
|---|---|---|---|---|---|
| exact label (augmented arm, cos>=0.50) | 0.769 | 20 / 26 | begin|end | 7 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful word @ 0.80 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 4 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful word @ 0.85 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 4 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful word @ 0.90 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 4 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful word @ 0.95 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 4 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful word @ 1.00 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 4 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful subtree @ 0.80 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 4 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful subtree @ 0.85 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 4 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful subtree @ 0.90 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 4 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful subtree @ 0.95 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 5 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| faithful subtree @ 1.00 (cos>=0.50) | 0.731 | 19 / 26 | begin|end | 5 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |

## Signals across the dial (gate: cosine >= 0.50)

| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw cosine criterion (event / entity) |
|---|---|---|---|---|---|---|---|
| exact label (augmented arm, cosine gate) | — | — | 50 | 14 | 22 | 1 | — |
| faithful word | 0.80 | 562 (208) | 43 | 9 | 11 | 0 | 43+9+11 / 0+0+0 |
| faithful word | 0.85 | 695 (147) | 43 | 8 | 10 | 0 | 43+8+10 / 0+0+0 |
| faithful word | 0.90 | 798 (82) | 42 | 8 | 10 | 0 | 42+8+10 / 0+0+0 |
| faithful word | 0.95 | 863 (23) | 45 | 8 | 11 | 0 | 45+8+11 / 0+0+0 |
| faithful word | 1.00 | 888 (0) | 44 | 8 | 11 | 0 | 44+8+11 / 0+0+0 |
| faithful subtree | 0.80 | 562 (208) | 42 | 8 | 11 | 0 | 42+8+11 / 0+0+0 |
| faithful subtree | 0.85 | 695 (147) | 42 | 7 | 10 | 0 | 42+7+10 / 0+0+0 |
| faithful subtree | 0.90 | 798 (82) | 40 | 7 | 10 | 0 | 40+7+10 / 0+0+0 |
| faithful subtree | 0.95 | 863 (23) | 42 | 8 | 11 | 0 | 42+8+11 / 0+0+0 |
| faithful subtree | 1.00 | 888 (0) | 42 | 8 | 11 | 0 | 42+8+11 / 0+0+0 |

## faithful word @ cluster cos 0.80

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.97 (0.97) | 0.064 | decide.Theme (9) | decision.Theme (6) | {roof, new, roof} {budget, spend} {case} | A committee decides on a new roof. | A committee makes a decision on a new roof. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | portray.Agent (6) | portray.Theme (6) | {inomaru, Kantaro Suga, Mie Sonozaki, Soichiro Akizuki} {James Woods, Jeremy Irons} {Wilson, wilson} | Portrayed by Soichiro Akizuki , Kantaro Suga is . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew, night crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.71 (0.71) | 0.311 | become.Patient (4) | become.Result (4) | {indigenous, indigenous american, indigenous, people, native american, …} {bad, lose} {lax} | Once the indigenous people had become indigenous , they would cease to be French . | The once strategic relationship between Poland and Germany now has become a bad relationsh |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child, children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.50 (0.50) | 0.406 | replace.Agent (4) | replace.Theme (4) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {governor, president} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi, Armaan Jain, Ranbir Kapoor} {gallery} {crew, night crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {winner, ward, win, well} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.71 (0.71) | 0.308 | replace.Agent (4) | succeed.Theme (3) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {governor, president} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | Henry Cole was succeeded as caretaker of Breakheart Hill by Bailey . |

## faithful word @ cluster cos 0.85

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.97 (0.97) | 0.064 | decide.Theme (9) | decision.Theme (6) | {roof, new, roof} {budget} {case} | A committee decides on a new roof. | A committee makes a decision on a new roof. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.71 (0.71) | 0.311 | become.Patient (4) | become.Result (4) | {lax} {indigenous, indigenous american, indigenous, people, native american, …} {bad} | Corruption was widespread in Persia and discipline in the army became dangerously lax . | The once strategic relationship between Poland and Germany has now become a bad relationsh |
| 0.67 (0.67) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods, Jeremy Irons} {Wilson, wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child, children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |

## faithful word @ cluster cos 0.90

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.97 (0.97) | 0.064 | decide.Theme (9) | decision.Theme (6) | {roof} {budget} {case} | A committee decides on a new roof. | A committee makes a decision on a new roof. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.71 (0.71) | 0.311 | become.Patient (4) | become.Result (4) | {lax} {indigenous, indigenous, people} {bad} | Corruption was widespread in Persia and discipline in the army became dangerously lax . | The once strategic relationship between Poland and Germany has now become a bad relationsh |
| 0.67 (0.67) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods} {Wilson, wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |

## faithful word @ cluster cos 0.95

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.97 (0.97) | 0.064 | decide.Theme (9) | decision.Theme (6) | {roof} {budget} {case} | A committee decides on a new roof. | A committee makes a decision on a new roof. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.71 (0.71) | 0.311 | become.Patient (4) | become.Result (4) | {lax} {indigenous} {bad} | Corruption was widespread in Persia and discipline in the army became dangerously lax . | The once strategic relationship between Poland and Germany has now become a bad relationsh |
| 0.65 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.65 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {physician} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.60 (0.60) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods} {Wilson} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (0.99) | 0.006 | block.Agent (4) | wait.Experiencer (3) | {automobile, automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.78 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson} {wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |

## faithful word @ cluster cos 1.00

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.97 (0.97) | 0.064 | decide.Theme (9) | decision.Theme (6) | {budget} {case} {new} | A board decides next year's budget. | A board makes a decision on next year's budget. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.71 (0.71) | 0.311 | become.Patient (4) | become.Result (4) | {bad} {indigenous} {lax} | The once strategic relationship between Poland and Germany has now become a bad relationsh | Once the indigenous people had become indigenous , they would cease to be French . |
| 0.65 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.65 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {chart} {physician} | The chart signs a physician. | A doctor signs the chart. |
| 0.60 (0.60) | 0.333 | portray.Agent (6) | portray.Theme (6) | {Wilson} {James Woods} {wilson} | Wilson won an Emmy for his portrayal of James Woods . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {bank} {editor} {loan application} | A bank rejects the loan application. | The loan application rejects a bank. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | Several crates of lemons were sold to the chef. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef purchased several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.99 (0.99) | 0.006 | block.Agent (4) | wait.Experiencer (3) | {automobile} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.95 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef bought several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {crew} {gallery} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {depot} {museum} {neighbour} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {apprentice} {child} {squad} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {coach} {elder} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {school} {trainer} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {driver} {recruit} {winner} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.78 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {Wilson} {James Woods} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | Wilson won an Emmy for his portrayal of James Woods . |

## faithful subtree @ cluster cos 0.80

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {airline} {committee, council} {teach, tutor} | An airline calls off the evening flight. | An airline cancels the evening flight. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | portray.Agent (6) | portray.Theme (6) | {inomaru, Kantaro Suga, Mie Sonozaki, Soichiro Akizuki} {James Woods, Jeremy Irons} {Wilson, wilson} | Portrayed by Soichiro Akizuki , Kantaro Suga is . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew, night crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child, children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.50 (0.50) | 0.406 | replace.Agent (4) | replace.Theme (4) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {governor, president} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi, Armaan Jain, Ranbir Kapoor} {gallery} {crew, night crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {winner, ward, win, well} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.71 (0.71) | 0.308 | replace.Agent (4) | succeed.Theme (3) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {governor, president} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | Henry Cole was succeeded as caretaker of Breakheart Hill by Bailey . |

## faithful subtree @ cluster cos 0.85

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {airline} {council} {tutor} | An airline calls off the evening flight. | An airline cancels the evening flight. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.67 (0.67) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods, Jeremy Irons} {Wilson, wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child, children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |

## faithful subtree @ cluster cos 0.90

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {airline} {council} {tutor} | An airline calls off the evening flight. | An airline cancels the evening flight. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.67 (0.67) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods} {Wilson, wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.60 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |

## faithful subtree @ cluster cos 0.95

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {airline} {council} {tutor} | An airline calls off the evening flight. | An airline cancels the evening flight. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.65 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.65 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {physician} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.60 (0.60) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods} {Wilson} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.50 (0.50) | 0.34 | buy.Agent (14) | buy.Theme (14) | {pottery studio} {crate, lemons} {chef} | The pottery studio bought a second kiln. | A second kiln bought the pottery studio. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (0.99) | 0.006 | block.Agent (4) | wait.Experiencer (3) | {automobile, automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.78 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson} {wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |

## faithful subtree @ cluster cos 1.00

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

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
| 0.96 (0.96) | 0.064 | call_off.Agent (3) | cancel.Agent (9) | {airline} {council} {tutor} | An airline calls off the evening flight. | An airline cancels the evening flight. |
| 0.96 (0.96) | 0.064 | decide.Theme (9) | decision.Theme (6) | {budget} {case} {new, roof} | A board decides next year's budget. | A board makes a decision on next year's budget. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.83 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.80 (0.80) | 0.082 | discover.Experiencer (3) | discover.Stimulus (3) | {auditor} {error} | An auditor discovers an error in the ledger. | An error discovers an auditor in the ledger. |
| 0.65 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.65 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {chart} {physician} | The chart signs a physician. | A doctor signs the chart. |
| 0.60 (0.60) | 0.333 | portray.Agent (6) | portray.Theme (6) | {Wilson} {James Woods} {wilson} | Wilson won an Emmy for his portrayal of James Woods . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {bank} {editor} {loan application} | A bank rejects the loan application. | The loan application rejects a bank. |
| 0.50 (0.50) | 0.34 | buy.Agent (14) | buy.Theme (14) | {chef} {crate, lemons} {depot} | The chef bought several crates of lemons. | Several crates of lemons bought the chef. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | Several crates of lemons were sold to the chef. |
| 1.00 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef purchased several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.94 (0.94) | 0.021 | block.Agent (4) | wait.Experiencer (3) | {automobile} {automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.94 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {crew} {gallery} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.94 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {depot} {museum} {neighbour} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.94 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef bought several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.94 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {apprentice} {children} {squad} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.94 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {coach} {elder} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.91 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {school} {trainer} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.91 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {driver} {recruit} {winner} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.78 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {Wilson} {James Woods} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | Wilson won an Emmy for his portrayal of James Woods . |
