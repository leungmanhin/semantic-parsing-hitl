# §4.3.1 Frequent Subtree Mining — FAITHFUL view (paper as written)

> "Here we enumerate all rooted subtrees up to a fixed size threshold in each SENF graph and count how many sentences contain each pattern. Subtrees exceeding a minimum support threshold reveal common semantic units — such as 'go to with two participants' — that should be treated as single meta-nodes." — FUSE-NF §4.3.1

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| substrate | canonical_substrate.jsonl (1950 records; 1799 carry at least one pattern) — patterns2.jsonl: 4391 patterns, the miner's inventory; this view mines nothing |
| size threshold | k = 4 atoms per pattern (the miner's --k) |
| minimum support | 3 records (document support; occurrences reported beside it) |
| pattern language | skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded |
| rooted subtree | atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded |
| constants verbatim | n_lifted = 0 only; the 3361 constant-lifted (shape-stratum) patterns are an addition |
| closure | closed = no larger faithful unit with exactly the same supporting records contains it (its atoms embed under a renaming of variables); two different units on the same records are both closed; computed within this view (the miner's own flag ranges over the full inventory, lifted patterns and joins included, and is kept as miner_dominated); closed units are the meta-node proposals, subsumed units the same evidence in fewer atoms (subsumed_by names the covering unit) |
| meta-node | (Mn<Name> <root> <other variables>) for proposals = closed units of size >= 2 — Name = the unit's heads and constants in atom order along the tree (Member / GroupOf give their constant, roles their name, Ev / Fn for an event- or function-valued filler, Of<spec> for a filler with atoms of its own, ~NEG a Neg suffix; root tokens joined with '_', tokens inside a nested spec with '-'), the pattern id appended when two units would share a name (2 here); provisional; pack rule = (Implication (And <atoms>) (Mn<Name> …)) |
| proposals | closed units of size >= 2 (flag `proposal`); a subsumed unit is the same evidence in fewer atoms and is rendered for reading only; single-atom units are subtrees by the letter and are rendered in their section without a rule, since a one-atom pack is a rename |

## Counts

- patterns in the inventory: 4391; constants-verbatim: 1030; **rooted-subtree units: 945** (808 closed, 137 subsumed); joins excluded: 85; constant-lifted excluded: 3361
- units by root kind: {'constant': 6, 'entity': 205, 'event': 734}; by depth: {0: 18, 1: 779, 2: 148}; by size: {1: 395, 2: 349, 3: 172, 4: 29}
- closed units by size: {1: 343, 2: 288, 3: 148, 4: 29}; proposals (closed, size >= 2): 465; of these at support >= 10 (a descriptive cut, not a threshold): 48; single-atom units (not proposals): 395

## Top closed units by support (size >= 2) — the meta-node proposals

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 190 (205) | 2 | event | 1 | `(And (Agent $e0 $x0) (Past $e0))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 151 (154) | 2 | event | 1 | `(And (Past $e0) (Patient $e0 $x0))` | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 114 (119) | 2 | event | 1 | `(And (Past $e0) (Theme $e0 $x0))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 89 (92) | 2 | event | 1 | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 61 (63) | 2 | event | 1 | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | tierB-000028: The nurse is dressing the wound. |
| 58 (63) | 2 | event | 1 | `(And (Location $e0 $x0) (Past $e0))` | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 56 (56) | 2 | event | 1 | `(And (Agent $e0 $x0) (Ongoing $e0))` | tierB-000028: The nurse is dressing the wound. |
| 46 (47) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 43 (45) | 2 | event | 1 | `(And (Past $e0) (Theme $e0 $e1))` | tierB-000030: Rima and Skura stopped crying. |
| 42 (46) | 2 | event | 1 | `(And (Experiencer $e0 $x0) (Past $e0))` | tierB-000124: Some of the villagers were unwilling to fight. |
| 41 (42) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 37 (37) | 2 | event | 1 | `(And (Goal $e0 $x0) (Past $e0))` | tierB-000111: Claudio escorted Isabella to the exit. |
| 37 (39) | 2 | event | 0 | `(And (Ongoing $e0) (Past $e0))` | tierB-000001: Ziri was running around constantly. |
| 35 (37) | 2 | event | 1 | `(And (Ongoing $e0) (Patient $e0 $x0))` | tierB-000028: The nurse is dressing the wound. |
| 33 (33) | 2 | event | 1 | `(And (Member $e0 have) (Theme $e0 $x0))` | tierB-000066: Having close friends is more important than being popular. |
| 27 (29) | 2 | event | 1 | `(And (Agent $e0 $x0) (Location $e0 $x1))` | tierB-000036: The ant is walking on the little balloon. |
| 25 (27) | 2 | event | 1 | `(And (Location $e0 $x0) (Ongoing $e0))` | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 24 (24) | 2 | event | 1 | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | tierB-000288: The new law restricts the sale of cigarettes to minors. |
| 23 (23) | 3 | event | 1 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | tierB-000142: This sentence has various meanings. |
| 23 (25) | 2 | event | 2 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | tierB-000004: Tom leaves the lights on all day. |
| 23 (23) | 2 | event | 1 | `(And (Past $e0) (Result $e0 $e1))` | tierB-000228: Kalman grew larger in size. |
| 22 (22) | 2 | event | 1 | `(And (Ongoing $e0) (Theme $e1 $e0))` | tierB-000075: Mark and Jessica began hanging out often. |
| 22 (24) | 2 | event | 1 | `(And (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000004: Tom leaves the lights on all day. |
| 20 (21) | 2 | event | 2 | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | tierB-000160: The child likes to play with the cats. |
| 19 (19) | 2 | event | 1 | `(And (Past $e0) (Source $e0 $x0))` | tierB-000103: The ball ricocheted off the bat. |
| 17 (17) | 3 | event | 1 | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | tierB-000075: Mark and Jessica began hanging out often. |
| 16 (17) | 3 | event | 2 | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | tierB-000166: Yair Stern made two attempts to collaborate with the Nazis. |
| 16 (16) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` | tierB-000470: The crocodile tried to pull Boris into the river. |
| 16 (16) | 2 | event | 1 | `(And (Agent $e0 $x0) (Goal $e0 $x1))` | tierB-000324: A few customers have just walked into the store. |
| 15 (17) | 2 | event | 1 | `(And (Experiencer $e0 $x0) (Ongoing $e0))` | tierB-000144: The site should be working just fine now. |

## Top closed units rooted at an entity (size >= 2)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 6 (6) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))` | tierB-000133: One of the girls was left behind. |
| 4 (4) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (LocatedIn $x0 $x1))` | tierB-000372: There are three tables in the storeroom. |
| 4 (4) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` | tierB-000615: There are some pretty flowers in the garden. |
| 4 (4) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (PartOf $x1 $x2))` | tierB-000202: The church is just on the other side of the street. |
| 3 (3) | 2 | entity | 2 | `(And (Inheritance living_room room) (Member $x0 living_room))` | tierB-001573: The living room transforms into a cozy theater. |
| 3 (3) | 2 | entity | 1 | `(And (Before $x0 $e0) (Past $e0))` | tierB-001222: After a border incident involving gluten trafficking, the dictator ordered a full scale invasion. |
| 3 (3) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 girl))` | tierB-000133: One of the girls was left behind. |
| 3 (3) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 city))` | tierB-000153: The streets of this city are narrow. |
| 3 (3) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 full))` | tierB-000796: The kitchen sink is full of dishes. |
| 3 (3) | 2 | entity | 2 | `(And (LocatedIn $x0 $x1) (Member $x1 table))` | tierB-000619: There is a camera on the table. |
| 3 (3) | 2 | entity | 1 | `(And (Member $x0 blue) (Member $x0 sky))` | tierB-000937: Go out and look at the blue sky. |
| 3 (3) | 2 | entity | 1 | `(And (Member $x0 bottom) (PartOf $x0 $x1))` | tierB-000172: Read the seventh line from the bottom of page 34. |
| 3 (3) | 2 | entity | 1 | `(And (Only $x0 $e0) (Past $e0))` | tierB-000797: The gas station only had two gas pumps. |

## Top closed units of depth >= 2 (a participant with its own links)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 23 (25) | 2 | event | 2 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | tierB-000004: Tom leaves the lights on all day. |
| 20 (21) | 2 | event | 2 | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | tierB-000160: The child likes to play with the cats. |
| 16 (17) | 3 | event | 2 | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | tierB-000166: Yair Stern made two attempts to collaborate with the Nazis. |
| 14 (14) | 2 | event | 2 | `(And (Patient $e0 $x0) (Theme $e1 $e0))` | tierB-000107: Martino needs to generate enough energy for the liftoff. |
| 13 (13) | 3 | event | 2 | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | tierB-000362: The trail has gone cold. |
| 10 (10) | 2 | event | 2 | `(And (Member $x0 door) (Patient $e0 $x0))` | tierB-000056: Rodrigo opened a vault-like door. |
| 9 (11) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person))` | tierB-000316: Stefan spotted another person in the huge gym working out. |
| 9 (10) | 2 | event | 2 | `(And (Member $x0 thing) (Theme $e0 $x0))` | tierB-000080: Something had to be said. |
| 8 (8) | 3 | event | 2 | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 8 (8) | 2 | event | 2 | `(And (Agent $e0 $x0) (GroupOf $x0 child))` | tierB-000410: Mom let the children eat cookies. |
| 8 (10) | 2 | event | 2 | `(And (Agent $e0 $x0) (GroupOf $x0 person))` | tierB-000248: The people rebelled against the king. |
| 8 (10) | 2 | event | 2 | `(And (Cardinality $x0 <num>) (Theme $e0 $x0))` | tierB-000101: A deck of cards contains four kings, four queens, and four jacks. |
| 7 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 7 (8) | 3 | event | 2 | `(And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))` | tierB-000248: The people rebelled against the king. |
| 7 (7) | 3 | event | 2 | `(And (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))` | tierB-000265: The crack in the windshield has started to disappear. |

## Largest closed units (size = k)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 9 (9) | 4 | event | 1 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |
| 7 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 7 (7) | 4 | event | 1 | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 7 (7) | 4 | event | 1 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 5 (5) | 4 | event | 2 | `(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))` | tierB-000265: The crack in the windshield has started to disappear. |
| 5 (5) | 4 | event | 1 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` | tierB-000665: That old mosque had an eerie feeling. |
| 4 (4) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000738: Both girls started to cry. |
| 4 (4) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000738: Both girls started to cry. |
| 4 (4) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))` | tierB-000738: Both girls started to cry. |
| 4 (4) | 4 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))` | tierB-000338: Someone ate all the cookies from the cookie jar. |
| 4 (4) | 4 | event | 2 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))` | tierB-000858: Hothouse conditions helped the exotic plants thrive. |
| 4 (4) | 4 | event | 1 | `(And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))` | tierB-000265: The crack in the windshield has started to disappear. |
| 4 (4) | 4 | event | 2 | `(And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))` | tierB-000265: The crack in the windshield has started to disappear. |
| 4 (4) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))` | tierB-000738: Both girls started to cry. |
| 3 (3) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |

## Excluded joins (constants verbatim, not a rooted tree) — top by support (85 total; an addition, not listed in the .metta)

| support (occ) | size | pattern | e.g. |
|---|---|---|---|
| 27 (37) | 2 | `(And (Agent $e0 $x0) (Agent $e1 $x0))` | tierB-000101: A deck of cards contains four kings, four queens, and four jacks. |
| 26 (29) | 2 | `(And (Experiencer $e0 $x0) (Patient $e1 $x0))` | tierB-000004: Tom leaves the lights on all day. |
| 23 (44) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0))` | tierB-000258: Thousands gathered to watch the event. |
| 22 (24) | 3 | `(And (Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0))` | tierB-000004: Tom leaves the lights on all day. |
| 14 (15) | 3 | `(And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0))` | tierB-000362: The trail has gone cold. |
| 12 (12) | 4 | `(And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))` | tierB-000362: The trail has gone cold. |
| 12 (14) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 12 (12) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e1))` | tierB-000470: The crocodile tried to pull Boris into the river. |
| 11 (13) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Past $e1))` | tierB-000277: Some men came and cut the tree down. |
| 10 (12) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Past $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 10 (10) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1))` | tierB-000470: The crocodile tried to pull Boris into the river. |
| 10 (10) | 2 | `(And (Patient $e0 $x0) (Patient $e1 $x0))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 8 (8) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 7 (7) | 2 | `(And (Agent $e0 $x0) (Experiencer $e1 $x0))` | tierB-000160: The child likes to play with the cats. |
| 6 (8) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Patient $e0 $x1))` | tierB-000277: Some men came and cut the tree down. |

