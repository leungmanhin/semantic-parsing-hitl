# §4.3.1 Frequent Subtree Mining — FAITHFUL view (paper as written)

> "Here we enumerate all rooted subtrees up to a fixed size threshold in each SENF graph and count how many sentences contain each pattern. Subtrees exceeding a minimum support threshold reveal common semantic units — such as 'go to with two participants' — that should be treated as single meta-nodes." — FUSE-NF §4.3.1

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| substrate | canonical_substrate.jsonl (2302 records; 2154 carry at least one pattern) — patterns2.jsonl: 7766 patterns, the miner's inventory; this view mines nothing |
| size threshold | k = 4 atoms per pattern (the miner's --k) |
| minimum support | 3 records (document support; occurrences reported beside it) |
| pattern language | skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded |
| rooted subtree | atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded |
| constants verbatim | n_lifted = 0 only; the 6037 constant-lifted (shape-stratum) patterns are an addition |
| closure | closed = no larger faithful unit with exactly the same supporting records contains it (its atoms embed under a renaming of variables); two different units on the same records are both closed; computed within this view (the miner's own flag ranges over the full inventory, lifted patterns and joins included, and is kept as miner_dominated); closed units are the meta-node proposals, subsumed units the same evidence in fewer atoms (subsumed_by names the covering unit) |
| meta-node | (Mn<Name> <root> <other variables>) for proposals = closed units of size >= 2 — Name = the unit's heads and constants in atom order along the tree (Member / GroupOf give their constant, roles their name, Ev / Fn for an event- or function-valued filler, Of<spec> for a filler with atoms of its own, ~NEG a Neg suffix; root tokens joined with '_', tokens inside a nested spec with '-'), the pattern id appended when two units would share a name (2 here); provisional; pack rule = (Implication (And <atoms>) (Mn<Name> …)) |
| proposals | closed units of size >= 2 (flag `proposal`); a subsumed unit is the same evidence in fewer atoms and is rendered for reading only; single-atom units are subtrees by the letter, kept in the JSONL and the counts, but a one-atom pack is a rename, so they are not rendered |

## Counts

- patterns in the inventory: 7766; constants-verbatim: 1729; **rooted-subtree units: 1454** (1140 closed, 314 subsumed); joins excluded: 275; constant-lifted excluded: 6037
- units by root kind: {'constant': 22, 'entity': 262, 'event': 1170}; by depth: {0: 19, 1: 1088, 2: 331, 3: 16}; by size: {1: 500, 2: 500, 3: 317, 4: 137}
- closed units by size: {1: 412, 2: 377, 3: 214, 4: 137}; proposals (closed, size >= 2): 728; of these at support >= 10 (a descriptive cut, not a threshold): 72; single-atom units (not proposals): 500

## Top closed units by support (size >= 2) — the meta-node proposals

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 232 (271) | 2 | event | 1 | `(And (Agent $e0 $x0) (Past $e0))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 195 (224) | 2 | event | 1 | `(And (Past $e0) (Patient $e0 $x0))` | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 154 (171) | 2 | event | 1 | `(And (Past $e0) (Theme $e0 $x0))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 114 (122) | 2 | event | 1 | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 74 (84) | 2 | event | 1 | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | tierB-000028: The nurse is dressing the wound. |
| 62 (68) | 2 | event | 1 | `(And (Location $e0 $x0) (Past $e0))` | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 60 (64) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 58 (60) | 2 | event | 1 | `(And (Agent $e0 $x0) (Ongoing $e0))` | tierB-000028: The nurse is dressing the wound. |
| 51 (58) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 46 (50) | 2 | event | 1 | `(And (Past $e0) (Theme $e0 $e1))` | tierB-000030: Rima and Skura stopped crying. |
| 45 (49) | 2 | event | 1 | `(And (Experiencer $e0 $x0) (Past $e0))` | tierB-000124: Some of the villagers were unwilling to fight. |
| 40 (40) | 2 | event | 1 | `(And (Member $e0 have) (Theme $e0 $x0))` | tierB-000066: Having close friends is more important than being popular. |
| 38 (38) | 2 | event | 1 | `(And (Goal $e0 $x0) (Past $e0))` | tierB-000111: Claudio escorted Isabella to the exit. |
| 38 (40) | 2 | event | 0 | `(And (Ongoing $e0) (Past $e0))` | tierB-000001: Ziri was running around constantly. |
| 37 (41) | 2 | event | 1 | `(And (Ongoing $e0) (Patient $e0 $x0))` | tierB-000028: The nurse is dressing the wound. |
| 33 (38) | 2 | event | 1 | `(And (Agent $e0 $x0) (Location $e0 $x1))` | tierB-000036: The ant is walking on the little balloon. |
| 30 (46) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person))` | tierB-000316: Stefan spotted another person in the huge gym working out. |
| 28 (30) | 2 | event | 2 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | tierB-000004: Tom leaves the lights on all day. |
| 28 (32) | 2 | event | 1 | `(And (Location $e0 $x0) (Ongoing $e0))` | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 27 (29) | 2 | event | 1 | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | tierB-000288: The new law restricts the sale of cigarettes to minors. |
| 27 (27) | 2 | event | 1 | `(And (Holder $e0 $x0) (Member $e0 have))` | tierB-000142: This sentence has various meanings. |
| 27 (27) | 2 | event | 1 | `(And (Past $e0) (Result $e0 $e1))` | tierB-000228: Kalman grew larger in size. |
| 27 (29) | 2 | event | 1 | `(And (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000004: Tom leaves the lights on all day. |
| 26 (26) | 3 | event | 1 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | tierB-000142: This sentence has various meanings. |
| 24 (27) | 2 | event | 2 | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | tierB-000160: The child likes to play with the cats. |
| 24 (26) | 2 | event | 1 | `(And (Ongoing $e0) (Theme $e1 $e0))` | tierB-000075: Mark and Jessica began hanging out often. |
| 20 (30) | 3 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0))` | tierB-000338: Someone ate all the cookies from the cookie jar. |
| 20 (20) | 2 | event | 1 | `(And (Past $e0) (Source $e0 $x0))` | tierB-000103: The ball ricocheted off the bat. |
| 19 (21) | 3 | event | 1 | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | tierB-000075: Mark and Jessica began hanging out often. |
| 19 (21) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` | tierB-000470: The crocodile tried to pull Boris into the river. |

## Top closed units rooted at an entity (size >= 2)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 17 (17) | 2 | entity | 2 | `(And (Member $x0 person) (Possession $x1 $x0))` | tierB-000966: This room is larger than mine. |
| 7 (7) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 child))` | tierB-001685: Two children are sitting on top of the fence. |
| 6 (6) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))` | tierB-000133: One of the girls was left behind. |
| 5 (5) | 2 | entity | 1 | `(And (Before $x0 $e0) (Past $e0))` | tierB-001222: After a border incident involving gluten trafficking, the dictator ordered a full scale invasion. |
| 4 (4) | 3 | entity | 2 | `(And (Member $x0 family) (Member $x1 person) (Possession $x0 $x1))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 4 (4) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 person))` | tierB-000556: With this ticket, two people can enter for free. |
| 4 (4) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (LocatedIn $x0 $x1))` | tierB-000372: There are three tables in the storeroom. |
| 4 (4) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` | tierB-000615: There are some pretty flowers in the garden. |
| 4 (4) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (PartOf $x1 $x2))` | tierB-000202: The church is just on the other side of the street. |
| 3 (3) | 2 | entity | 2 | `(And (Inheritance living_room room) (Member $x0 living_room))` | tierB-001573: The living room transforms into a cozy theater. |
| 3 (3) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 girl))` | tierB-000133: One of the girls was left behind. |
| 3 (3) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 way))` | tierB-001985: There are always two ways of looking at things. |
| 3 (3) | 2 | entity | 1 | `(And (LocatedIn $x0 $x1) (Member $x0 thing))` | tierB-000756: Jonas heard something in the closet. |
| 3 (3) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 city))` | tierB-000153: The streets of this city are narrow. |
| 3 (3) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 full))` | tierB-000796: The kitchen sink is full of dishes. |

## Top closed units of depth >= 2 (a participant with its own links)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 30 (46) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person))` | tierB-000316: Stefan spotted another person in the huge gym working out. |
| 28 (30) | 2 | event | 2 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | tierB-000004: Tom leaves the lights on all day. |
| 24 (27) | 2 | event | 2 | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | tierB-000160: The child likes to play with the cats. |
| 20 (30) | 3 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0))` | tierB-000338: Someone ate all the cookies from the cookie jar. |
| 19 (21) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 thing))` | tierB-000770: This was enough to get Stefan arrested. |
| 18 (21) | 3 | event | 2 | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | tierB-000166: Yair Stern made two attempts to collaborate with the Nazis. |
| 18 (19) | 2 | event | 2 | `(And (Member $x0 thing) (Theme $e0 $x0))` | tierB-000080: Something had to be said. |
| 17 (17) | 3 | event | 2 | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | tierB-000362: The trail has gone cold. |
| 17 (17) | 2 | entity | 2 | `(And (Member $x0 person) (Possession $x1 $x0))` | tierB-000966: This room is larger than mine. |
| 16 (18) | 2 | event | 2 | `(And (Patient $e0 $x0) (Theme $e1 $e0))` | tierB-000107: Martino needs to generate enough energy for the liftoff. |
| 14 (16) | 2 | event | 2 | `(And (Possession $x0 $x1) (Theme $e0 $x0))` | tierB-000246: The pitfalls of easy generalization are to be avoided. |
| 12 (14) | 2 | event | 2 | `(And (Cardinality $x0 <num>) (Theme $e0 $x0))` | tierB-000101: A deck of cards contains four kings, four queens, and four jacks. |
| 12 (14) | 2 | event | 2 | `(And (Member $x0 thing) (Patient $e0 $x0))` | tierB-000082: The whole thing is about to collapse. |
| 10 (12) | 3 | event | 2 | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 10 (19) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 company))` | tierB-000762: That company just put up a web page. |

## Largest closed units (size = k)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 9 (11) | 4 | event | 2 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 9 (11) | 4 | event | 1 | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 9 (11) | 4 | event | 1 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 9 (9) | 4 | event | 1 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |
| 7 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))` | tierB-000338: Someone ate all the cookies from the cookie jar. |
| 6 (10) | 4 | event | 3 | `(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 6 (8) | 4 | event | 2 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))` | tierB-000858: Hothouse conditions helped the exotic plants thrive. |
| 6 (8) | 4 | event | 2 | `(And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))` | tierB-000265: The crack in the windshield has started to disappear. |
| 6 (10) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 5 (7) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 5 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 5 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 5 (9) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | tierB-000762: That company just put up a web page. |
| 5 (5) | 4 | event | 2 | `(And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))` | tierB-001582: The earth became red with blood. |
| 5 (5) | 4 | event | 2 | `(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))` | tierB-000265: The crack in the windshield has started to disappear. |

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

