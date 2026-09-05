# §4.3.2 exact-label vs embedding clusters — the dial (H, 2026-09-03)

- embeddings: mining/out_ecmp/embeddings (888 texts, dim 4096); clustering = average linkage on cosine distance, cut at cluster-cosine [0.8, 0.85, 0.9, 0.95, 1.0] (1.0 = distinct texts = the exact-label method up to rendering)
- comparison: ppmi weighting, >=2 shared informative units, cosine>=0.5, slot n>=3 (identical to the exact-label run); occurrence texts per embeddings.py (modes word, subtree)
- exact-label baseline: 87 signals ({'cross-event': 50, 'cross-role': 14, 'cross-both': 22, 'cross-entity-both': 1})

## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)

- recall = expected lemma pairs (paraphrase variants: buy~purchase, buy~sell the converse, …) linked by ANY signal; lexical control hits = antonym / near-miss pairs linked by a same-role or cross-both signal (must be 0); swap-control hits = classes whose participant-swap control produced an Agent~object cross-role signal (informational: the swapped sentence IS role wobble by design)

| method | recall | recovered / expected | lexical control hits | swap-control hits | missed |
|---|---|---|---|---|---|
| exact label | 0.769 | 20 / 26 | begin|end | 7 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed word @ 0.80 | 0.769 | 20 / 26 | begin|end | 8 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed word @ 0.85 | 0.731 | 19 / 26 | begin|end | 8 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed word @ 0.90 | 0.769 | 20 / 26 | begin|end | 8 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed word @ 0.95 | 0.769 | 20 / 26 | begin|end | 8 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed word @ 1.00 | 0.769 | 20 / 26 | begin|end | 8 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed subtree @ 0.80 | 0.769 | 20 / 26 | begin|end | 8 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed subtree @ 0.85 | 0.731 | 19 / 26 | begin|end | 8 | answer|give, arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed subtree @ 0.90 | 0.769 | 20 / 26 | begin|end | 8 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed subtree @ 0.95 | 0.769 | 20 / 26 | begin|end | 8 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |
| embed subtree @ 1.00 | 0.769 | 20 / 26 | begin|end | 8 | arrival|arrive, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, mend|repair |

## Signals across the dial

| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw criterion (event / entity) |
|---|---|---|---|---|---|---|---|
| exact label | — | — | 50 | 14 | 22 | 1 | — |
| embed word | 0.80 | 562 (208) | 44 | 15 | 21 | 2 | 49+8+11 / 3+0+0 |
| embed word | 0.85 | 695 (147) | 51 | 15 | 19 | 3 | 49+7+10 / 3+0+0 |
| embed word | 0.90 | 798 (82) | 47 | 15 | 21 | 3 | 48+7+10 / 3+0+0 |
| embed word | 0.95 | 863 (23) | 50 | 15 | 22 | 1 | 51+7+11 / 0+0+0 |
| embed word | 1.00 | 888 (0) | 50 | 15 | 22 | 1 | 50+7+11 / 0+0+0 |
| embed subtree | 0.80 | 562 (208) | 44 | 15 | 20 | 1 | 47+8+11 / 3+0+0 |
| embed subtree | 0.85 | 695 (147) | 51 | 15 | 18 | 2 | 47+7+10 / 3+0+0 |
| embed subtree | 0.90 | 798 (82) | 46 | 15 | 20 | 2 | 46+7+10 / 3+0+0 |
| embed subtree | 0.95 | 863 (23) | 48 | 15 | 21 | 0 | 48+8+11 / 0+0+0 |
| embed subtree | 1.00 | 888 (0) | 48 | 15 | 21 | 0 | 48+8+11 / 0+0+0 |

## embed word @ cluster cos 0.80

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon, crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous, indigenous american, indigenous, people, native american, …} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee, council} {family} {board, panel} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing, music} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, sign, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm, Company, company} | A rescue team abandons the search. | A rescue team gives up the search. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route, lane, way} {query, search} | A firm abandons its tender. | A firm gives up its tender. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board, panel} {ferry, ship} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vet, vote} {departure, arrive, arrival, depart, …} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 1.00 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {photography} {night delivery} {visitor} | A curator allows photography in the hall. | A curator permits photography in the hall. |
| 0.99 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal commences after lunch. |
| 0.99 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal starts after lunch. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (1.00) | 0.0 | portray.Agent (6) | portray.Theme (6) | {inomaru, Kantaro Suga, Mie Sonozaki, Soichiro Akizuki} {James Woods, Jeremy Irons} {Wilson, wilson} | Portrayed by Soichiro Akizuki , Kantaro Suga is . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.99 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.98 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew, night crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.88 (0.46) | 0.34 | buy.Agent (14) | buy.Theme (14) | {pottery studio} {lemon, crate, lemons} {chef} | The pottery studio bought a second kiln. | A second kiln bought the pottery studio. |
| 0.87 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.80 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {greenhouse} {storm, hurricane} | The archive destroys a fire. | A fire destroys the archive. |
| 0.77 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {potter} {squad} {coach, trainer} | A potter teaches an apprentice glazing. | An apprentice teaches a potter glazing. |
| 0.76 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {clerk} {caller} {query, search} | A clerk answers the query. | The query answers a clerk. |
| 0.75 (0.15) | 0.595 | form.Agent (6) | form.Patient (4) | {complex, complex, simple} {simple, easy} {Technetium} | The simple complex forms the technetium , whose potassium salt is isostructural . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi, Armaan Jain, Ranbir Kapoor} {crew, night crew} {neighbour, neighbouring} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.63 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child, children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {winner, ward, win, well} | A nurse walks through the ward. | A nurse takes a walk through the ward. |
| 0.56 (0.50) | 0.406 | replace.Agent (4) | replace.Theme (4) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {governor, president} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |
| 0.53 (0.32) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.87 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi, Armaan Jain, Ranbir Kapoor} {gallery} {crew, night crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.81 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.72 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.71 (0.23) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {lemon, crate, lemons} {forklift, forklifts} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.71 (0.23) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {lemon, crate, lemons} {forklift, forklifts} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {winner, ward, win, well} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.64 (0.27) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {pottery studio} {chef} {depot} | The pottery studio acquired a second kiln. | A second kiln bought the pottery studio. |
| 0.64 (0.27) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | The pottery studio purchased a second kiln. |
| 0.63 (0.31) | 0.613 | reject.Theme (8) | turn_down.Agent (3) | {editor} {bank} | A manuscript rejects an editor. | An editor turns down a manuscript. |
| 0.61 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |

## embed word @ cluster cos 0.85

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon, crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous, indigenous american, indigenous, people, native american, …} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | end.Time (4) | {morning, early morning} {dawn} | A hearing commences on Monday morning. | A hearing ends on Monday morning. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | start.Time (4) | {morning, early morning} {dawn} | A hearing commences on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | end.Time (4) | start.Time (4) | {morning, early morning} {dawn} | A hearing ends on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, sign, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart, leave} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {query, search} | A firm abandons its tender. | A firm gives up its tender. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.98 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.88 (0.46) | 0.34 | buy.Agent (14) | buy.Theme (14) | {pottery studio} {lemon, crate, lemons} {chef} | The pottery studio bought a second kiln. | A second kiln bought the pottery studio. |
| 0.83 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.80 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {greenhouse} {storm, hurricane} | The archive destroys a fire. | A fire destroys the archive. |
| 0.79 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {clerk} {caller} {query, search} | A clerk answers the query. | The query answers a clerk. |
| 0.77 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {potter} {squad} {coach, trainer} | A potter teaches an apprentice glazing. | An apprentice teaches a potter glazing. |
| 0.75 (0.15) | 0.595 | form.Agent (6) | form.Patient (4) | {Technetium} {complex, complex, simple} {simple} | Technetium forms the simple complex . The potassium salt is isostructural with . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi} {crew} {neighbour, neighbouring} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.65 (0.67) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods, Jeremy Irons} {Wilson, wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child, children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {ward, well} | A nurse walks through the ward. | A nurse takes a walk through the ward. |
| 0.53 (0.32) | 0.571 | work.Agent (17) | work.CoAgent (7) | {Bo, Bobby, Robbie, Roger} {Nils} {ranger} | Ana and Bo work on the mural. | Ana works with Bo on the mural. |
| 0.53 (0.32) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.81 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.79 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.72 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.71 (0.23) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {lemon, crate, lemons} {forklift, forklifts} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.71 (0.23) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {lemon, crate, lemons} {forklift, forklifts} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.64 (0.27) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {pottery studio} {chef} {depot} | The pottery studio acquired a second kiln. | A second kiln bought the pottery studio. |
| 0.64 (0.27) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | The pottery studio purchased a second kiln. |
| 0.61 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.59 (0.27) | 0.632 | buy.Theme (14) | sell.Recipient (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | A second kiln was sold to the pottery studio. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |

## embed word @ cluster cos 0.90

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous american, native american, indigenous americans, native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | end.Time (4) | {morning, early morning} {dawn} | A hearing commences on Monday morning. | A hearing ends on Monday morning. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | start.Time (4) | {morning, early morning} {dawn} | A hearing commences on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | end.Time (4) | start.Time (4) | {morning, early morning} {dawn} | A hearing ends on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {search} | A firm abandons its tender. | A firm gives up its tender. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.98 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.88 (0.46) | 0.34 | buy.Agent (14) | buy.Theme (14) | {pottery studio} {lemon} {chef} | The pottery studio bought a second kiln. | A second kiln bought the pottery studio. |
| 0.83 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.81 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {greenhouse} {storm} | The archive destroys a fire. | A fire destroys the archive. |
| 0.80 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {clerk} {caller} {query} | A clerk answers the query. | The query answers a clerk. |
| 0.78 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {potter} {squad} {coach} | A potter teaches an apprentice glazing. | An apprentice teaches a potter glazing. |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi} {crew} {neighbour, neighbouring} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.67 (0.21) | 0.595 | form.Agent (6) | form.Patient (4) | {Technetium} {complex, complex, simple} {simple} | Technetium forms the simple complex . The potassium salt is isostructural with . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.67 (0.67) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods} {Wilson, wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.60 (0.32) | 0.571 | work.Agent (17) | work.CoAgent (7) | {Bo} {Nils} {ranger} | Ana and Bo work on the mural. | Ana works with Bo on the mural. |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {ward} | A nurse walks through the ward. | A nurse takes a walk through the ward. |
| 0.53 (0.32) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.83 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.74 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.71 (0.23) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {lemon} {forklift, forklifts} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.71 (0.23) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {lemon} {forklift, forklifts} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.64 (0.27) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {pottery studio} {chef} {depot} | The pottery studio acquired a second kiln. | A second kiln bought the pottery studio. |
| 0.64 (0.27) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | The pottery studio purchased a second kiln. |
| 0.61 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.59 (0.27) | 0.632 | buy.Theme (14) | sell.Recipient (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | A second kiln was sold to the pottery studio. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |

## embed word @ cluster cos 0.95

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector} {lemon} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler} {indigenous american, native american, indigenous americans, native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {shoreline survey} {dress rehearsal} {apple harvest} | A shoreline survey commences at dawn. | A shoreline survey starts at dawn. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | end.Time (4) | {morning} {dawn} | A hearing commences on Monday morning. | A hearing ends on Monday morning. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | start.Time (4) | {morning} {dawn} | A hearing commences on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | end.Time (4) | start.Time (4) | {morning} {dawn} | A hearing ends on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg} {countersignature, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {search} | A firm abandons its tender. | A firm gives up its tender. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.88 (0.46) | 0.34 | buy.Agent (14) | buy.Theme (14) | {pottery studio} {lemon} {chef} | The pottery studio bought a second kiln. | A second kiln bought the pottery studio. |
| 0.83 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {physician} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.83 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.83 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.81 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {greenhouse} {storm} | The archive destroys a fire. | A fire destroys the archive. |
| 0.80 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {clerk} {caller} {query} | A clerk answers the query. | The query answers a clerk. |
| 0.78 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {potter} {squad} {coach} | A potter teaches an apprentice glazing. | An apprentice teaches a potter glazing. |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi} {crew} {neighbour} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.71 (0.60) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods} {Wilson} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.67 (0.21) | 0.595 | form.Agent (6) | form.Patient (4) | {Technetium} {complex} {simple} | Technetium forms the simple complex . The potassium salt is isostructural with . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.60 (0.32) | 0.571 | work.Agent (17) | work.CoAgent (7) | {Bo} {Nils} {ranger} | Ana and Bo work on the mural. | Ana works with Bo on the mural. |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {ward} | A nurse walks through the ward. | A nurse takes a walk through the ward. |
| 0.53 (0.32) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (0.99) | 0.006 | block.Agent (4) | wait.Experiencer (3) | {automobile, automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.87 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson} {wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.83 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.74 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.71 (0.23) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {lemon} {forklift, forklifts} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.71 (0.23) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {lemon} {forklift, forklifts} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.64 (0.27) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {pottery studio} {chef} {depot} | The pottery studio acquired a second kiln. | A second kiln bought the pottery studio. |
| 0.64 (0.27) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | The pottery studio purchased a second kiln. |
| 0.61 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |

## embed word @ cluster cos 1.00

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {crate} {forklift} {kiln} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler} {indigenous american} {native american} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {apple harvest} {dress rehearsal} {hearing} | The apple harvest commences in September. | The apple harvest starts in September. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | end.Time (4) | {dawn} {morning} | A shoreline survey commences at dawn. | A shoreline survey ends at dawn. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | start.Time (4) | {dawn} {morning} | A shoreline survey commences at dawn. | A shoreline survey starts at dawn. |
| 1.00 (1.00) | 0.0 | end.Time (4) | start.Time (4) | {dawn} {morning} | A shoreline survey ends at dawn. | A shoreline survey starts at dawn. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {board} {committee} {family} | A board makes a decision on next year's budget. | A board reaches a decision on next year's budget. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {climber} {firm} {rescue team} | Two climbers abandon the north route. | Two climbers give up the north route. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {glazing} {song} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {countersignature} {egg} {monthly servicing} | A permit needs a countersignature. | A permit requires a countersignature. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {board} {club} {ferry} | A board postpones the vote. | A board puts off the vote. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {departure} {tournament} {vote} | A ferry postpones its departure. | A ferry puts off its departure. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {north route} {search} {tender} | Two climbers abandon the north route. | Two climbers give up the north route. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {curator} {licence} {warden} | A curator allows photography in the hall. | A curator permits photography in the hall. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.88 (0.46) | 0.34 | buy.Agent (14) | buy.Theme (14) | {chef} {crate} {depot} | The chef bought several crates of lemons. | Several crates of lemons bought the chef. |
| 0.83 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {chart} {physician} | The chart signs a physician. | A doctor signs the chart. |
| 0.83 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.83 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {bank} {editor} {loan application} | A bank rejects the loan application. | The loan application rejects a bank. |
| 0.81 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {fire} {greenhouse} | The archive destroys a fire. | A fire causes the destruction of the archive. |
| 0.80 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {caller} {clerk} {query} | The caller answers a vet. | A vet answers the caller. |
| 0.78 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {apprentice} {coach} {potter} | An apprentice teaches a potter glazing. | A potter teaches an apprentice glazing. |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi} {crew} {depot} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.71 (0.60) | 0.333 | portray.Agent (6) | portray.Theme (6) | {Wilson} {James Woods} {wilson} | Wilson won an Emmy for his portrayal of James Woods . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.67 (0.21) | 0.595 | form.Agent (6) | form.Patient (4) | {Technetium} {complex} {simple} | Technetium forms the simple complex . The potassium salt is isostructural with . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.60 (0.32) | 0.571 | work.Agent (17) | work.CoAgent (7) | {Nils} {Bo} {fitter} | Dara and Nils work on the ledger. | Dara works with Nils on the ledger. |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {ward} | A nurse walks through the ward. | A nurse takes a walk through the ward. |
| 0.53 (0.32) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (0.99) | 0.006 | block.Agent (4) | wait.Experiencer (3) | {automobile} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef purchased several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.87 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {Wilson} {James Woods} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | Wilson won an Emmy for his portrayal of James Woods . |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {crew} {gallery} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.83 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {coach} {elder} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {depot} {museum} {neighbour} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {apprentice} {child} {squad} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.74 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {school} {trainer} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.71 (0.23) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {crate} {forklift} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.71 (0.23) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {crate} {forklift} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {driver} {recruit} {winner} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.64 (0.27) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.64 (0.27) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {chef} {depot} {pottery studio} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.61 (0.95) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef bought several crates of lemons. | Several crates of lemons were sold to the chef. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |

## embed subtree @ cluster cos 0.80

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon, crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous, indigenous american, indigenous, people, native american, …} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee, council} {family} {board, panel} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing, music} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, sign, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm, Company, company} | A rescue team abandons the search. | A rescue team gives up the search. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route, lane, way} {query, search} | A firm abandons its tender. | A firm gives up its tender. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board, panel} {ferry, ship} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vet, vote} {departure, arrive, arrival, depart, …} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |
| 1.00 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {photography} {night delivery} {visitor} | A curator allows photography in the hall. | A curator permits photography in the hall. |
| 0.99 (0.97) | 0.013 | begin.Patient (7) | commence.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal commences after lunch. |
| 0.99 (0.97) | 0.013 | begin.Patient (7) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal begins after lunch. | The dress rehearsal starts after lunch. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (1.00) | 0.0 | portray.Agent (6) | portray.Theme (6) | {inomaru, Kantaro Suga, Mie Sonozaki, Soichiro Akizuki} {James Woods, Jeremy Irons} {Wilson, wilson} | Portrayed by Soichiro Akizuki , Kantaro Suga is . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.99 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.98 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew, night crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.87 (0.47) | 0.34 | buy.Agent (14) | buy.Theme (14) | {pottery studio} {lemon, crate, lemons} {chef} | The pottery studio bought a second kiln. | A second kiln bought the pottery studio. |
| 0.87 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.80 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {greenhouse} {storm, hurricane} | The archive destroys a fire. | A fire destroys the archive. |
| 0.77 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {potter} {squad} {coach, trainer} | A potter teaches an apprentice glazing. | An apprentice teaches a potter glazing. |
| 0.76 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {clerk} {caller} {query, search} | A clerk answers the query. | The query answers a clerk. |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi, Armaan Jain, Ranbir Kapoor} {crew, night crew} {neighbour, neighbouring} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.67 (0.19) | 0.595 | form.Agent (6) | form.Patient (4) | {complex, complex, simple} {Technetium} | The simple complex forms the technetium , whose potassium salt is isostructural . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.63 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child, children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.58 (0.29) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {winner, ward, win, well} | A nurse walks through the ward. | A nurse takes a walk through the ward. |
| 0.56 (0.50) | 0.406 | replace.Agent (4) | replace.Theme (4) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {governor, president} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.87 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi, Armaan Jain, Ranbir Kapoor} {gallery} {crew, night crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.81 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.72 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.67 (0.26) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {pottery studio} {chef} {depot} | The pottery studio acquired a second kiln. | A second kiln bought the pottery studio. |
| 0.67 (0.26) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | The pottery studio purchased a second kiln. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {winner, ward, win, well} {driver} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.64 (0.26) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {lemon, crate, lemons} {forklift, forklifts} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.64 (0.26) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {lemon, crate, lemons} {forklift, forklifts} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.63 (0.31) | 0.613 | reject.Theme (8) | turn_down.Agent (3) | {editor} {bank} | A manuscript rejects an editor. | An editor turns down a manuscript. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |

## embed subtree @ cluster cos 0.85

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {lemon, crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous, indigenous american, indigenous, people, native american, …} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | end.Time (4) | {morning, early morning} {dawn} | A hearing commences on Monday morning. | A hearing ends on Monday morning. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | start.Time (4) | {morning, early morning} {dawn} | A hearing commences on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | end.Time (4) | start.Time (4) | {morning, early morning} {dawn} | A hearing ends on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, sign, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart, leave} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {query, search} | A firm abandons its tender. | A firm gives up its tender. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.98 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.87 (0.47) | 0.34 | buy.Agent (14) | buy.Theme (14) | {pottery studio} {lemon, crate, lemons} {chef} | The pottery studio bought a second kiln. | A second kiln bought the pottery studio. |
| 0.83 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.80 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {greenhouse} {storm, hurricane} | The archive destroys a fire. | A fire destroys the archive. |
| 0.79 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {clerk} {caller} {query, search} | A clerk answers the query. | The query answers a clerk. |
| 0.77 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {potter} {squad} {coach, trainer} | A potter teaches an apprentice glazing. | An apprentice teaches a potter glazing. |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi} {crew} {neighbour, neighbouring} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.67 (0.19) | 0.595 | form.Agent (6) | form.Patient (4) | {Technetium} {complex, complex, simple} | Technetium forms the simple complex . The potassium salt is isostructural with . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.65 (0.67) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods, Jeremy Irons} {Wilson, wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {child, children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.58 (0.29) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {ward, well} | A nurse walks through the ward. | A nurse takes a walk through the ward. |
| 0.53 (0.32) | 0.571 | work.Agent (17) | work.CoAgent (7) | {Bo, Bobby, Robbie, Roger} {Nils} {ranger} | Ana and Bo work on the mural. | Ana works with Bo on the mural. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.81 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach, trainer} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.79 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods, Jeremy Irons} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {child, children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.72 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {coach, trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.67 (0.26) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {pottery studio} {chef} {depot} | The pottery studio acquired a second kiln. | A second kiln bought the pottery studio. |
| 0.67 (0.26) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | The pottery studio purchased a second kiln. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.64 (0.26) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {lemon, crate, lemons} {forklift, forklifts} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.64 (0.26) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {lemon, crate, lemons} {forklift, forklifts} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.62 (0.26) | 0.632 | buy.Theme (14) | sell.Recipient (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | A second kiln was sold to the pottery studio. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |

## embed subtree @ cluster cos 0.90

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector, projectors} {crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settler, european american settlers} {indigenous american, native american, indigenous americans, native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {dress rehearsal} {apple harvest} {hearing} | The dress rehearsal commences after lunch. | The dress rehearsal starts after lunch. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | end.Time (4) | {morning, early morning} {dawn} | A hearing commences on Monday morning. | A hearing ends on Monday morning. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | start.Time (4) | {morning, early morning} {dawn} | A hearing commences on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | end.Time (4) | start.Time (4) | {morning, early morning} {dawn} | A hearing ends on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climber, climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song, sing} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {egg, eggs} {countersignature, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {search} | A firm abandons its tender. | A firm gives up its tender. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.60) | 0.189 | sign.Agent (4) | sign.Patient (4) | {physician, doctor} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.98 (0.60) | 0.189 | order.Agent (4) | order.Theme (4) | {physician, doctor} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.87 (0.47) | 0.34 | buy.Agent (14) | buy.Theme (14) | {pottery studio} {crate, lemons} {chef} | The pottery studio bought a second kiln. | A second kiln bought the pottery studio. |
| 0.83 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.81 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {greenhouse} {storm} | The archive destroys a fire. | A fire destroys the archive. |
| 0.80 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {clerk} {caller} {query} | A clerk answers the query. | The query answers a clerk. |
| 0.78 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {potter} {squad} {coach} | A potter teaches an apprentice glazing. | An apprentice teaches a potter glazing. |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi} {crew} {neighbour, neighbouring} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.67 (0.67) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods} {Wilson, wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.60 (0.32) | 0.571 | work.Agent (17) | work.CoAgent (7) | {Bo} {Nils} {ranger} | Ana and Bo work on the mural. | Ana works with Bo on the mural. |
| 0.58 (0.29) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |
| 0.58 (0.26) | 0.595 | form.Agent (6) | form.Patient (4) | {Technetium} {complex, complex, simple} | Technetium forms the simple complex . The potassium salt is isostructural with . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {ward} | A nurse walks through the ward. | A nurse takes a walk through the ward. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.83 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.82 (0.82) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson, wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour, neighbouring} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.74 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.67 (0.26) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {pottery studio} {chef} {depot} | The pottery studio acquired a second kiln. | A second kiln bought the pottery studio. |
| 0.67 (0.26) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | The pottery studio purchased a second kiln. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner, win} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.64 (0.26) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {crate, lemons} {forklift, forklifts} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.64 (0.26) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {crate, lemons} {forklift, forklifts} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.62 (0.26) | 0.632 | buy.Theme (14) | sell.Recipient (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | A second kiln was sold to the pottery studio. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |

## embed subtree @ cluster cos 0.95

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | The pottery studio purchased a second kiln. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {projector} {crate, lemons} {forklift, forklifts} | The school acquired a projector for the hall. | The school purchased a projector for the hall. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settlers} {indigenous american, native american, indigenous americans, native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {shoreline survey} {dress rehearsal} {apple harvest} | A shoreline survey commences at dawn. | A shoreline survey starts at dawn. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | end.Time (4) | {morning} {dawn} | A hearing commences on Monday morning. | A hearing ends on Monday morning. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | start.Time (4) | {morning} {dawn} | A hearing commences on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | end.Time (4) | start.Time (4) | {morning} {dawn} | A hearing ends on Monday morning. | A hearing starts on Monday morning. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {committee} {family} {board} | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {rescue team} {climbers} {firm} | A rescue team abandons the search. | A rescue team gives up the search. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {song} {glazing} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.99) | 0.003 | need.Theme (3) | require.Theme (10) | {eggs} {countersignature, countersignatures} {monthly servicing} | A recipe needs two eggs. | A recipe requires two eggs. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {club} {board} {ferry} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {tournament} {vote} {departure, depart} | A club postpones the tournament. | A club puts off the tournament. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {tender} {north route} {search} | A firm abandons its tender. | A firm gives up its tender. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {warden} {curator} {licence} | A warden might allow visitors on Sundays. | A warden permits visitors on Sundays. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.83 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {physician} {chart} | A physician signs the chart. | The chart signs a physician. |
| 0.83 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.83 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {manuscript} {editor} {loan application} | A manuscript rejects an editor. | A manuscript is rejected by an editor. |
| 0.81 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {greenhouse} {storm} | The archive destroys a fire. | A fire destroys the archive. |
| 0.81 (0.50) | 0.34 | buy.Agent (14) | buy.Theme (14) | {pottery studio} {crate, lemons} {chef} | The pottery studio bought a second kiln. | A second kiln bought the pottery studio. |
| 0.80 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {clerk} {caller} {query} | A clerk answers the query. | The query answers a clerk. |
| 0.78 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {potter} {squad} {coach} | A potter teaches an apprentice glazing. | An apprentice teaches a potter glazing. |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi} {crew} {neighbour} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.71 (0.60) | 0.333 | portray.Agent (6) | portray.Theme (6) | {James Woods} {Wilson} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.60 (0.32) | 0.571 | work.Agent (17) | work.CoAgent (7) | {Bo} {Nils} {ranger} | Ana and Bo work on the mural. | Ana works with Bo on the mural. |
| 0.58 (0.29) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |
| 0.58 (0.26) | 0.595 | form.Agent (6) | form.Patient (4) | {Technetium} {complex, simple} | Technetium forms the simple complex . The potassium salt is isostructural with . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {ward} | A nurse walks through the ward. | A nurse takes a walk through the ward. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (0.99) | 0.006 | block.Agent (4) | wait.Experiencer (3) | {automobile, automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio acquired a second kiln. | A second kiln was sold to the pottery studio. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio purchased a second kiln. | A second kiln was sold to the pottery studio. |
| 0.87 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {James Woods} {Wilson} {wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {gallery} {crew} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.83 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {potter} {coach} {elder} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {museum} {neighbour} {depot} | The gallery borrows a painting from the museum. | The museum lends the gallery a painting. |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {squad} {apprentice} {children} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.74 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {trainer} {school} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {pottery studio} {chef} {school} | The pottery studio bought a second kiln. | A second kiln was sold to the pottery studio. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {recruit} {driver} {winner} | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 0.63 (0.26) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {crate, lemons} {forklift, forklifts} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.63 (0.26) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {crate, lemons} {forklift, forklifts} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.62 (0.27) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {pottery studio} {chef} {depot} | The pottery studio acquired a second kiln. | A second kiln bought the pottery studio. |
| 0.62 (0.27) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {pottery studio} {chef} {depot} | A second kiln bought the pottery studio. | The pottery studio purchased a second kiln. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |

## embed subtree @ cluster cos 1.00

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (1.00) | 0.0 | acquire.Agent (4) | purchase.Agent (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 1.00 (1.00) | 0.0 | acquire.Theme (4) | purchase.Theme (4) | {crate, lemons} {forklifts} {kiln} | The chef acquired several crates of lemons. | The chef purchased several crates of lemons. |
| 1.00 (1.00) | 0.0 | begin.Agent (4) | create.Agent (4) | {european american settlers} {indigenous americans} {native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Some indigenous Americans and European-American settlers began to create a community aroun |
| 1.00 (1.00) | 0.0 | commence.Patient (4) | start.Patient (4) | {apple harvest} {dress rehearsal} {hearing} | The apple harvest commences in September. | The apple harvest starts in September. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | end.Time (4) | {dawn} {morning} | A shoreline survey commences at dawn. | A shoreline survey ends at dawn. |
| 1.00 (1.00) | 0.0 | commence.Time (4) | start.Time (4) | {dawn} {morning} | A shoreline survey commences at dawn. | A shoreline survey starts at dawn. |
| 1.00 (1.00) | 0.0 | end.Time (4) | start.Time (4) | {dawn} {morning} | A shoreline survey ends at dawn. | A shoreline survey starts at dawn. |
| 1.00 (1.00) | 0.0 | make.Agent (4) | reach.Agent (4) | {board} {committee} {family} | A board makes a decision on next year's budget. | A board reaches a decision on next year's budget. |
| 1.00 (0.98) | 0.006 | abandon.Agent (8) | give_up.Agent (3) | {climbers} {firm} {rescue team} | Two climbers abandon the north route. | Two climbers give up the north route. |
| 1.00 (0.99) | 0.003 | learn.Theme (3) | teach.Theme (10) | {drill} {glazing} {song} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 1.00 (0.98) | 0.007 | postpone.Agent (7) | put_off.Agent (3) | {board} {club} {ferry} | A board postpones the vote. | A board puts off the vote. |
| 1.00 (0.98) | 0.007 | postpone.Theme (7) | put_off.Theme (3) | {departure} {tournament} {vote} | A ferry postpones its departure. | A ferry puts off its departure. |
| 1.00 (0.98) | 0.006 | abandon.Theme (8) | give_up.Theme (3) | {north route} {search} {tender} | Two climbers abandon the north route. | Two climbers give up the north route. |
| 1.00 (0.94) | 0.021 | allow.Agent (4) | permit.Agent (3) | {curator} {licence} {warden} | A curator allows photography in the hall. | A curator permits photography in the hall. |
| 1.00 (0.94) | 0.021 | allow.Theme (4) | permit.Theme (3) | {night delivery} {photography} {visitor} | A licence allows night deliveries. | A licence permits night deliveries. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.97 (0.83) | 0.061 | repair.Agent (8) | repair.Patient (8) | {cracked, feed pipe} {crew} {electrician} | A cracked feed pipe repairs a crew. | The yard floodlight repaired the electrician. |
| 0.83 (0.65) | 0.25 | sign.Agent (4) | sign.Patient (4) | {chart} {physician} | The chart signs a physician. | A doctor signs the chart. |
| 0.83 (0.65) | 0.25 | order.Agent (4) | order.Theme (4) | {physician} {scan} | A physician orders a second scan. | A second scan orders a physician. |
| 0.83 (0.57) | 0.311 | reject.Agent (8) | reject.Theme (8) | {bank} {editor} {loan application} | A bank rejects the loan application. | The loan application rejects a bank. |
| 0.81 (0.50) | 0.358 | destroy.Agent (8) | destroy.Patient (11) | {archive} {fire} {greenhouse} | The archive destroys a fire. | A fire causes the destruction of the archive. |
| 0.81 (0.50) | 0.34 | buy.Agent (14) | buy.Theme (14) | {chef} {crate, lemons} {depot} | The chef bought several crates of lemons. | Several crates of lemons bought the chef. |
| 0.80 (0.42) | 0.4 | answer.Agent (10) | answer.Theme (10) | {caller} {clerk} {query} | The caller answers a vet. | A vet answers the caller. |
| 0.78 (0.42) | 0.4 | teach.Agent (10) | teach.Recipient (10) | {apprentice} {coach} {potter} | An apprentice teaches a potter glazing. | A potter teaches an apprentice glazing. |
| 0.74 (0.42) | 0.4 | lend.Agent (10) | lend.Recipient (10) | {Ravi} {crew} {depot} | Ravi lends a neighbour a ladder. | A neighbour lends Ravi a ladder. |
| 0.71 (0.60) | 0.333 | portray.Agent (6) | portray.Theme (6) | {Wilson} {James Woods} {wilson} | Wilson won an Emmy for his portrayal of James Woods . | A Wilson won an Emmy for his portrayal of James Woods . |
| 0.60 (0.60) | 0.408 | walk.Agent (5) | walk.Goal (3) | {children} {pier} | Two children walk to the pier. | Two children take a walk to the pier. |
| 0.60 (0.32) | 0.571 | work.Agent (17) | work.CoAgent (7) | {Nils} {Bo} {fitter} | Dara and Nils work on the ledger. | Dara works with Nils on the ledger. |
| 0.58 (0.29) | 0.592 | discover.Agent (7) | discover.Theme (9) | {diver} {wreck} | A diver discovers a wreck off the point. | A wreck discovers a diver off the point. |
| 0.58 (0.26) | 0.595 | form.Agent (6) | form.Patient (4) | {Technetium} {complex, simple} | Technetium forms the simple complex . The potassium salt is isostructural with . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.57 (0.45) | 0.525 | walk.Agent (5) | walk.Location (5) | {nurse} {ward} | A nurse walks through the ward. | A nurse takes a walk through the ward. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 1.00 (0.94) | 0.021 | block.Agent (4) | wait.Experiencer (3) | {automobile} {automobiles} {car} | An automobile blocks the lane. | An automobile waits at the gate. |
| 0.99 (1.00) | 0.0 | acquire.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.99 (1.00) | 0.0 | purchase.Agent (4) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef purchased several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.87 (0.78) | 0.191 | portray.Theme (6) | win.Agent (4) | {Wilson} {James Woods} {wilson} | James Woods won an Emmy for his portrayal of Wilson . | Wilson won an Emmy for his portrayal of James Woods . |
| 0.83 (0.94) | 0.113 | borrow.Agent (3) | lend.Recipient (10) | {Ravi} {crew} {gallery} | Ravi borrows a ladder from a neighbour. | A neighbour lends Ravi a ladder. |
| 0.83 (0.94) | 0.113 | learn.Source (3) | teach.Agent (10) | {coach} {elder} {potter} | The squad learns a drill from a coach. | A coach teaches the squad a drill. |
| 0.81 (0.94) | 0.113 | borrow.Source (3) | lend.Agent (10) | {depot} {museum} {neighbour} | The crew borrows a generator from the depot. | The depot lends the crew a generator. |
| 0.77 (0.94) | 0.113 | learn.Agent (3) | teach.Recipient (10) | {apprentice} {children} {squad} | An apprentice learns glazing from a potter. | A potter teaches an apprentice glazing. |
| 0.74 (0.91) | 0.196 | give.Agent (12) | receive.Source (3) | {foreman} {school} {trainer} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.67 (0.94) | 0.121 | buy.Agent (14) | sell.Recipient (4) | {chef} {depot} {pottery studio} | The chef bought several crates of lemons. | Several crates of lemons were sold to the chef. |
| 0.65 (0.91) | 0.196 | give.Recipient (12) | receive.Agent (3) | {driver} {recruit} {winner} | A foreman gives a driver the manifest. | A driver receives the manifest from a foreman. |
| 0.63 (0.26) | 0.632 | acquire.Theme (4) | buy.Agent (14) | {crate, lemons} {forklifts} {kiln} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.63 (0.26) | 0.632 | buy.Agent (14) | purchase.Theme (4) | {crate, lemons} {forklifts} {kiln} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |
| 0.62 (0.27) | 0.632 | acquire.Agent (4) | buy.Theme (14) | {chef} {depot} {pottery studio} | The chef acquired several crates of lemons. | Several crates of lemons bought the chef. |
| 0.62 (0.27) | 0.632 | buy.Theme (14) | purchase.Agent (4) | {chef} {depot} {pottery studio} | Several crates of lemons bought the chef. | The chef purchased several crates of lemons. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| become | 2 / 5 | 0.00 | 1.0 |  |
| avoid | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 2 / 1 | 0.00 | 1.0 |  |
