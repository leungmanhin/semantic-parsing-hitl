# §4.3.1 faithful units on `out_tier_ab` — tier split (tierA added to tierB)

A reading of the miner's own `per_tier` field: where each unit's document support comes from. Never a filter.

## Buckets

| bucket | units (all sizes) | proposals (closed, size ≥ 2) |
|---|---|---|
| tierA-only | 1032 | 390 |
| tierB-only | 833 | 416 |
| cross | 260 | 125 |
| total | 2125 | 931 |

## Proposals supported by tierA only (390): the designed alternations, and candidates for the older-prompt caveat

| support | size | unit | example (tierA) |
|---|---|---|---|
| 24 | 3 | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | A clerk gives an answer to the query. |
| 14 | 4 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | The depot bought two forklifts. |
| 12 | 4 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | A clerk gives an answer to the query. |
| 10 | 3 | `(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))` | A clerk answers the query. |
| 10 | 3 | `(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))` | A potter teaches an apprentice glazing. |
| 10 | 2 | `(And (Agent $e0 $x0) (Member $e0 decide))` | A committee decides on a new roof. |
| 10 | 2 | `(And (Member $e0 lend) (Theme $e0 $x0))` | A neighbour lends Ravi a ladder. |
| 9 | 3 | `(And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))` | A committee decides on a new roof. |
| 9 | 3 | `(And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))` | A neighbour lends Ravi a ladder. |
| 9 | 2 | `(And (Agent $e0 $x0) (Member $e0 cancel))` | An airline cancels the evening flight. |
| 9 | 2 | `(And (Agent $e0 $x0) (Member $x0 board))` | A board postpones the vote. |
| 8 | 3 | `(And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1))` | The school bought a projector for the hall. |
| 8 | 3 | `(And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))` | A rescue team abandons the search. |
| 8 | 3 | `(And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))` | An editor rejects a manuscript. |
| 8 | 3 | `(And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))` | The mechanic repaired a seized gearbox. |
| 8 | 2 | `(And (Agent $e0 $x0) (Member $x0 physician))` | A physician signs the chart. |
| 8 | 2 | `(And (Holder $e0 $x0) (Member $e0 require))` | Two eggs are required by a recipe. |
| 8 | 2 | `(And (Location $e0 $x0) (Member $x0 ledger))` | An auditor discovers an error in the ledger. |
| 7 | 3 | `(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1))` | Two forklifts bought the depot. |
| 7 | 3 | `(And (Agent $e0 $x0) (Member $x0 board) (Theme $e0 $x1))` | A board postpones the vote. |
| 7 | 3 | `(And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))` | The depot bought two forklifts. |
| 7 | 2 | `(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))` | The pottery studio bought a second kiln. |
| 7 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | The evening flight is canceled by an airline. |
| 7 | 3 | `(And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))` | A board postpones the vote. |
| 7 | 3 | `(And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))` | Ravi lends a neighbour a ladder. |

## Cross-tier proposals (125): support from both tiers (share from tierA shown)

| support | tierA / tierB | share tierA | size | unit | example (tierB) |
|---|---|---|---|---|---|
| 235 | 146 / 89 | 0.62 | 2 | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 223 | 33 / 190 | 0.15 | 2 | `(And (Agent $e0 $x0) (Past $e0))` | Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 162 | 11 / 151 | 0.07 | 2 | `(And (Past $e0) (Patient $e0 $x0))` | The Berber-speaking population quickly plummeted with the arrival of the first French sett |
| 140 | 26 / 114 | 0.19 | 2 | `(And (Past $e0) (Theme $e0 $x0))` | Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 95 | 34 / 61 | 0.36 | 2 | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | The nurse is dressing the wound. |
| 68 | 22 / 46 | 0.32 | 3 | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 52 | 11 / 41 | 0.21 | 3 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 46 | 19 / 27 | 0.41 | 2 | `(And (Agent $e0 $x0) (Location $e0 $x1))` | The ant is walking on the little balloon. |
| 37 | 28 / 9 | 0.76 | 2 | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` | The rebels began distributing food and clothing from the storehouse to the locals. |
| 33 | 9 / 24 | 0.27 | 2 | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | The new law restricts the sale of cigarettes to minors. |
| 31 | 8 / 23 | 0.26 | 2 | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | This sentence has various meanings. |
| 30 | 29 / 1 | 0.97 | 2 | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | The thief was handed over to the police. |
| 25 | 17 / 8 | 0.68 | 2 | `(And (Cardinality $x0 <num>) (Theme $e0 $x0))` | A deck of cards contains four kings, four queens, and four jacks. |
| 21 | 20 / 1 | 0.95 | 2 | `(And (Agent $e0 $x0) (Might $e0))` | That could take a while. |
| 19 | 3 / 16 | 0.16 | 2 | `(And (Agent $e0 $x0) (Goal $e0 $x1))` | A few customers have just walked into the store. |
| 18 | 7 / 11 | 0.39 | 2 | `(And (Future $e0) (Patient $e0 $x0))` | The whole thing is about to collapse. |
| 18 | 14 / 4 | 0.78 | 2 | `(And (Member $e0 buy) (Theme $e0 $x0))` | Keike bought a pair of yellow trousers and a blue shirt. |
| 17 | 14 / 3 | 0.82 | 3 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | Keike bought a pair of yellow trousers and a blue shirt. |
| 17 | 3 / 14 | 0.18 | 2 | `(And (Patient $e0 $x0) (Theme $e1 $e0))` | Martino needs to generate enough energy for the liftoff. |
| 15 | 10 / 5 | 0.67 | 2 | `(And (Agent $e0 $x0) (Cardinality $x0 <num>))` | These three parties govern together in a coalition. |
| 15 | 5 / 10 | 0.33 | 2 | `(And (Agent $e0 $x0) (Future $e0))` | The ship leaves for Honolulu tomorrow. |
| 14 | 11 / 3 | 0.79 | 3 | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))` | A deck of cards contains four kings, four queens, and four jacks. |
| 14 | 8 / 6 | 0.57 | 2 | `(And (Agent $e0 $x0) (Source $e0 $x1))` | Someone ate all the cookies from the cookie jar. |
| 14 | 3 / 11 | 0.21 | 2 | `(And (Experiencer $e0 $x0) (Location $e0 $x1))` | That young critic is in high demand in a lot of places. |
| 14 | 13 / 1 | 0.93 | 2 | `(And (Might $e0) (Theme $e0 $x0))` | That could take a while. |

## Against `out_tier_b` (465 proposals there)

- NEW proposals (pattern absent from the single-tier inventory — reach the floor only with tierA): 461: 390 tierA-only, 71 cross
- SHARED proposals (a proposal in both): 465; support unchanged for 416, raised by tierA for the rest
- DEMOTED (a proposal in the single-tier view, present but not a proposal in the mixed view — closure lost to a larger unit): 0
- LOST (single-tier proposals absent from the mixed inventory; must be 0 when the single tier is a subset): 0

### NEW cross-tier proposals (support from both tiers, absent from tierB alone)

| support | tierA / tierB | size | unit | example (tierB) |
|---|---|---|---|---|
| 30 | 29 / 1 | 2 | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | The thief was handed over to the police. |
| 21 | 20 / 1 | 2 | `(And (Agent $e0 $x0) (Might $e0))` | That could take a while. |
| 14 | 13 / 1 | 2 | `(And (Might $e0) (Theme $e0 $x0))` | That could take a while. |
| 13 | 12 / 1 | 3 | `(And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1))` | That could take a while. |
| 13 | 11 / 2 | 2 | `(And (Member $e0 destroy) (Patient $e0 $x0))` | Most of the Mayan books were destroyed by conquistadors in the 16th century. |
| 13 | 12 / 1 | 2 | `(And (Member $e0 give) (Recipient $e0 $x0))` | Vladimir gave the kids chocolate and mock champagne. |
| 13 | 12 / 1 | 2 | `(And (Member $e0 give) (Theme $e0 $x0))` | William is the type of friend who always listens and gives good advice. |
| 11 | 10 / 1 | 2 | `(And (Agent $e0 $x0) (Member $e0 teach))` | The teacher teaches the useful phrases. |
| 11 | 9 / 2 | 2 | `(And (Location $e0 $x0) (Member $e0 work))` | While in jail, Dan worked at the prison kitchen. |
| 11 | 10 / 1 | 2 | `(And (Member $e0 answer) (Theme $e0 $x0))` | Oleg always answered the questions quickly. |
| 11 | 10 / 1 | 2 | `(And (Member $e0 teach) (Recipient $e0 $x0))` | Van Bavel taught the class from inside the elevator. |
| 10 | 8 / 2 | 3 | `(And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))` | Most of the Mayan books were destroyed by conquistadors in the 16th century. |
| 10 | 8 / 2 | 2 | `(And (Agent $e0 $x0) (Member $x0 school))` | A school of fish swimming together moved gracefully through the clear water. |
| 9 | 7 / 2 | 3 | `(And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))` | Paleontologists have discovered hundreds of well-preserved pterosaur eggs. |
| 9 | 7 / 2 | 3 | `(And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))` | The concert drew attendees from the surrounding towns. |
| 9 | 8 / 1 | 2 | `(And (Member $e0 repair) (Patient $e0 $x0))` | After three years of work by volunteers, the system has been fully repaired. |
| 7 | 6 / 1 | 4 | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | The parade included six marching bands. |
| 7 | 5 / 2 | 3 | `(And (Agent $e0 $x0) (Member $x0 school) (Past $e0))` | A school of fish swimming together moved gracefully through the clear water. |
| 7 | 6 / 1 | 3 | `(And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 $x1))` | The teacher teaches the useful phrases. |
| 7 | 6 / 1 | 3 | `(And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))` | After three years of work by volunteers, the system has been fully repaired. |
| 7 | 5 / 2 | 2 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1))` | The team excavates carefully for the archaeologists. |
| 7 | 6 / 1 | 2 | `(And (Beneficiary $e0 $x0) (Past $e0))` | Two copes were made for the royal chapel. |
| 6 | 5 / 1 | 3 | `(And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e0 $x2))` | The priest will say a funeral prayer at the cemetery chapel. |
| 6 | 4 / 2 | 3 | `(And (Agent $e0 $x0) (Member $e0 order) (Theme $e0 $x1))` | The professor ordered some new books from New York. |
| 6 | 5 / 1 | 2 | `(And (Agent $e0 $x0) (CoAgent $e0 $x1))` | The child likes to play with the cats. |

### DEMOTED proposals (were proposals on tierB alone)

| support there | size | unit | now subsumed by |
|---|---|---|---|
