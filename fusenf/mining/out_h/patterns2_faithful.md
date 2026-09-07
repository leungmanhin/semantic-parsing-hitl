# §4.3.1 Frequent Subtree Mining — FAITHFUL view (paper as written)

> "Here we enumerate all rooted subtrees up to a fixed size threshold in each SENF graph and count how many sentences contain each pattern. Subtrees exceeding a minimum support threshold reveal common semantic units — such as 'go to with two participants' — that should be treated as single meta-nodes." — FUSE-NF §4.3.1

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| substrate | patterns2.jsonl — 7766 patterns over 2154 records (the miner's inventory; this view mines nothing) |
| size threshold | k = 4 atoms per pattern (the miner's --k) |
| minimum support | 3 records (document support; occurrences reported beside it) |
| pattern language | skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded |
| rooted subtree | atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded |
| constants verbatim | n_lifted = 0 only; the 6037 constant-lifted (shape-stratum) patterns are an addition |
| closure | closed = no larger pattern has the same supporting records (the miner's dominated flag inverted); closed units are the meta-node proposals, subsumed units the same evidence in smaller pieces |
| meta-node | (Mn_<pattern_id> <root> <other variables>) — provisional naming; pack rule = (Implication (And <atoms>) (Mn …)) |

## Counts

- patterns in the inventory: 7766; constants-verbatim: 1729; **rooted-subtree units: 1454** (480 closed, 974 subsumed); joins excluded: 275; constant-lifted excluded: 6037
- units by root kind: {'constant': 22, 'entity': 262, 'event': 1170}; by depth: {0: 19, 1: 1088, 2: 331, 3: 16}; by size: {1: 500, 2: 500, 3: 317, 4: 137}
- closed units by size: {1: 285, 2: 114, 3: 32, 4: 49}; closed units with support >= 10: 51; size >= 2 and support >= 10: 10

## Top closed units by support (size >= 2) — the meta-node proposals

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 40 (40) | 2 | event | 1 | `(And (Member $e0 have) (Theme $e0 $x0))` | tierB-000066: Having close friends is more important than being popular. |
| 27 (27) | 2 | event | 1 | `(And (Holder $e0 $x0) (Member $e0 have))` | tierB-000142: This sentence has various meanings. |
| 26 (26) | 3 | event | 1 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | tierB-000142: This sentence has various meanings. |
| 17 (17) | 2 | entity | 2 | `(And (Member $x0 person) (Possession $x1 $x0))` | tierB-000966: This room is larger than mine. |
| 15 (15) | 2 | event | 1 | `(And (Member $e0 make) (Patient $e0 $x0))` | tierB-000025: Elias can always make a difference. |
| 14 (14) | 2 | event | 1 | `(And (Member $e0 start) (Past $e0))` | tierB-000043: Skura has started high school. |
| 12 (12) | 2 | event | 1 | `(And (Member $e0 have) (Past $e0))` | tierB-000162: Boldi had a lot to mull over. |
| 11 (11) | 3 | event | 1 | `(And (Member $e0 have) (Past $e0) (Theme $e0 $x0))` | tierB-000162: Boldi had a lot to mull over. |
| 10 (12) | 2 | event | 1 | `(And (Member $e0 begin) (Past $e0))` | tierB-000075: Mark and Jessica began hanging out often. |
| 10 (11) | 2 | event | 1 | `(And (Member $e0 go) (Past $e0))` | tierB-000012: Kalman and Olivia partied that night and went to bed late. |
| 9 (11) | 4 | event | 1 | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 9 (11) | 4 | event | 1 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 9 (9) | 4 | event | 1 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |
| 9 (11) | 2 | event | 1 | `(And (Member $e0 kill) (Patient $e0 $x0))` | tierB-000067: The soldier was killed in action. |
| 9 (9) | 2 | event | 1 | `(And (Member $e0 make) (Past $e0))` | tierB-000073: The cat made a high-pitched noise. |
| 9 (9) | 2 | event | 1 | `(And (Member $e0 start) (Patient $e0 $x0))` | tierB-000192: A national fibre-optic network project has started. |
| 9 (10) | 2 | event | 1 | `(And (Member $e0 use) (Theme $e0 $x0))` | tierB-000089: Religion played a very important role in creating the various calendars still in use. |
| 8 (8) | 2 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 make))` | tierB-000073: The cat made a high-pitched noise. |
| 8 (9) | 2 | event | 1 | `(And (Location $e0 $x0) (Member $e0 find))` | tierB-000579: More than a hundred clay figurines were found in the tomb. |
| 8 (8) | 2 | event | 1 | `(And (Member $e0 become) (Past $e0))` | tierB-000352: The noise became more intense. |
| 8 (8) | 2 | event | 1 | `(And (Member $e0 hear) (Past $e0))` | tierB-000176: The tree was heard to crash to the ground. |
| 8 (8) | 2 | event | 1 | `(And (Member $e0 try) (Past $e0))` | tierB-000117: David was trying to reach Amanda. |
| 7 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))` | tierB-000338: Someone ate all the cookies from the cookie jar. |
| 7 (9) | 3 | event | 1 | `(And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))` | tierB-000067: The soldier was killed in action. |
| 7 (7) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 child))` | tierB-001685: Two children are sitting on top of the fence. |
| 7 (7) | 2 | event | 1 | `(And (Member $e0 come) (Past $e0))` | tierB-000238: The train always came early in the morning. |
| 7 (7) | 2 | event | 1 | `(And (Member $e0 fall) (Patient $e0 $x0))` | tierB-000194: The number of pupils is gradually falling. |
| 7 (7) | 2 | event | 1 | `(And (Member $e0 find) (Theme $e0 $x0))` | tierB-000579: More than a hundred clay figurines were found in the tomb. |
| 7 (7) | 2 | event | 1 | `(And (Member $e0 make) (Ongoing $e0))` | tierB-000173: David began to make progress. |
| 7 (7) | 2 | event | 1 | `(And (Member $e0 open) (Patient $e0 $x0))` | tierB-000056: Rodrigo opened a vault-like door. |

## Top closed units rooted at an entity (size >= 2)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 17 (17) | 2 | entity | 2 | `(And (Member $x0 person) (Possession $x1 $x0))` | tierB-000966: This room is larger than mine. |
| 7 (7) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 child))` | tierB-001685: Two children are sitting on top of the fence. |
| 4 (4) | 3 | entity | 2 | `(And (Member $x0 family) (Member $x1 person) (Possession $x0 $x1))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 4 (4) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 person))` | tierB-000556: With this ticket, two people can enter for free. |
| 4 (4) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` | tierB-000615: There are some pretty flowers in the garden. |
| 3 (3) | 2 | entity | 2 | `(And (Inheritance living_room room) (Member $x0 living_room))` | tierB-001573: The living room transforms into a cozy theater. |
| 3 (3) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 girl))` | tierB-000133: One of the girls was left behind. |
| 3 (3) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 way))` | tierB-001985: There are always two ways of looking at things. |
| 3 (3) | 2 | entity | 1 | `(And (LocatedIn $x0 $x1) (Member $x0 thing))` | tierB-000756: Jonas heard something in the closet. |
| 3 (3) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 city))` | tierB-000153: The streets of this city are narrow. |
| 3 (3) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 table))` | tierB-000619: There is a camera on the table. |
| 3 (3) | 2 | entity | 1 | `(And (Member $x0 blue) (Member $x0 sky))` | tierB-000937: Go out and look at the blue sky. |
| 3 (3) | 2 | entity | 1 | `(And (Member $x0 house) (Member $x0 large))` | tierB-000048: Mary lives in a large house by herself. |
| 3 (3) | 2 | entity | 2 | `(And (Member $x0 thing) (Possession $x1 $x0))` | tierB-001223: There is a strong presumption against its truth. |

## Top closed units of depth >= 2 (a participant with its own links)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 17 (17) | 2 | entity | 2 | `(And (Member $x0 person) (Possession $x1 $x0))` | tierB-000966: This room is larger than mine. |
| 7 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))` | tierB-000338: Someone ate all the cookies from the cookie jar. |
| 6 (10) | 4 | event | 3 | `(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 6 (8) | 4 | event | 2 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))` | tierB-000858: Hothouse conditions helped the exotic plants thrive. |
| 6 (8) | 4 | event | 2 | `(And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))` | tierB-000265: The crack in the windshield has started to disappear. |
| 5 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 5 (9) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | tierB-000762: That company just put up a web page. |
| 5 (5) | 4 | event | 2 | `(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))` | tierB-000265: The crack in the windshield has started to disappear. |
| 4 (4) | 4 | event | 2 | `(And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0) (Past $e1))` | tierB-000688: The fishing boat which had been missing returned safely to port. |
| 4 (6) | 4 | event | 2 | `(And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000942: The cook took the roller and started rolling the pizza dough on the peel. |
| 4 (4) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))` | tierB-000738: Both girls started to cry. |
| 4 (6) | 4 | event | 2 | `(And (Agent $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))` | tierB-000942: The cook took the roller and started rolling the pizza dough on the peel. |
| 4 (4) | 4 | event | 2 | `(And (Cardinality $x0 <num>) (Member $e0 have) (Past $e0) (Theme $e0 $x0))` | tierB-000797: The gas station only had two gas pumps. |
| 4 (4) | 4 | event | 2 | `(And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))` | tierC-000181: Together with Karen , Kristoffer had eight children . |
| 4 (5) | 4 | event | 2 | `(And (Location $e0 $x0) (Member $e0 find) (Member $x1 thing) (Theme $e0 $x1))` | tierC-000279: It is found in southern North Africa and western Europe . |

## Largest closed units (size = k)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 9 (11) | 4 | event | 1 | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 9 (11) | 4 | event | 1 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 9 (9) | 4 | event | 1 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |
| 7 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))` | tierB-000338: Someone ate all the cookies from the cookie jar. |
| 6 (10) | 4 | event | 3 | `(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 6 (8) | 4 | event | 2 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))` | tierB-000858: Hothouse conditions helped the exotic plants thrive. |
| 6 (8) | 4 | event | 2 | `(And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))` | tierB-000265: The crack in the windshield has started to disappear. |
| 6 (10) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 5 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 5 (9) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | tierB-000762: That company just put up a web page. |
| 5 (5) | 4 | event | 2 | `(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))` | tierB-000265: The crack in the windshield has started to disappear. |
| 5 (5) | 4 | event | 1 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` | tierB-000665: That old mosque had an eerie feeling. |
| 5 (5) | 4 | event | 1 | `(And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` | tierB-001582: The earth became red with blood. |
| 4 (4) | 4 | event | 2 | `(And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0) (Past $e1))` | tierB-000688: The fishing boat which had been missing returned safely to port. |
| 4 (6) | 4 | event | 2 | `(And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000942: The cook took the roller and started rolling the pizza dough on the peel. |

## Excluded joins (constants verbatim, not a rooted tree) — top by support (275 total; an addition, not listed in the .metta)

| support (occ) | size | pattern | e.g. |
|---|---|---|---|
| 54 (90) | 2 | `(And (Agent $e0 $x0) (Agent $e1 $x0))` | tierB-000101: A deck of cards contains four kings, four queens, and four jacks. |
| 43 (106) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0))` | tierB-000258: Thousands gathered to watch the event. |
| 31 (35) | 2 | `(And (Experiencer $e0 $x0) (Patient $e1 $x0))` | tierB-000004: Tom leaves the lights on all day. |
| 29 (33) | 2 | `(And (Patient $e0 $x0) (Patient $e1 $x0))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 27 (35) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Past $e1))` | tierB-000277: Some men came and cut the tree down. |
| 27 (29) | 3 | `(And (Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0))` | tierB-000004: Tom leaves the lights on all day. |
| 22 (47) | 3 | `(And (Past $e0) (Patient $e0 $x0) (Patient $e1 $x0))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 18 (20) | 3 | `(And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0))` | tierB-000362: The trail has gone cold. |
| 17 (21) | 4 | `(And (Past $e0) (Past $e1) (Patient $e0 $x0) (Patient $e1 $x0))` | tierB-000654: The freedom movement started as a trickle and turned into a gusher. |
| 16 (16) | 4 | `(And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))` | tierB-000362: The trail has gone cold. |
| 16 (26) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Patient $e0 $x1))` | tierB-000277: Some men came and cut the tree down. |
| 14 (18) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 14 (16) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e1))` | tierB-000470: The crocodile tried to pull Boris into the river. |
| 14 (16) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Agent $e2 $x0))` | tierB-000101: A deck of cards contains four kings, four queens, and four jacks. |
| 13 (23) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Patient $e1 $x1))` | tierB-000277: Some men came and cut the tree down. |

