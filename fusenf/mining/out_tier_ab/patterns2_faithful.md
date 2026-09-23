# §4.3.1 Frequent Subtree Mining — FAITHFUL view (paper as written)

> "Here we enumerate all rooted subtrees up to a fixed size threshold in each SENF graph and count how many sentences contain each pattern. Subtrees exceeding a minimum support threshold reveal common semantic units — such as 'go to with two participants' — that should be treated as single meta-nodes." — FUSE-NF §4.3.1

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| substrate | canonical_substrate.jsonl (2352 records; 2187 carry at least one pattern) — patterns2.jsonl: 7216 patterns, the miner's inventory; this view mines nothing |
| size threshold | k = 4 atoms per pattern (the miner's --k) |
| minimum support | 3 records (document support; occurrences reported beside it) |
| pattern language | skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded |
| rooted subtree | atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded |
| constants verbatim | n_lifted = 0 only; the 4967 constant-lifted (shape-stratum) patterns are an addition |
| closure | closed = no larger faithful unit with exactly the same supporting records contains it (its atoms embed under a renaming of variables); two different units on the same records are both closed; computed within this view (the miner's own flag ranges over the full inventory, lifted patterns and joins included, and is kept as miner_dominated); closed units are the meta-node proposals, subsumed units the same evidence in fewer atoms (subsumed_by names the covering unit) |
| meta-node | (Mn<Name> <root> <other variables>) for proposals = closed units of size >= 2 — Name = the unit's heads and constants in atom order along the tree (Member / GroupOf give their constant, roles their name, Ev / Fn for an event- or function-valued filler, Of<spec> for a filler with atoms of its own, ~NEG a Neg suffix; root tokens joined with '_', tokens inside a nested spec with '-'), the pattern id appended when two units would share a name (2 here); provisional; pack rule = (Implication (And <atoms>) (Mn<Name> …)) |
| proposals | closed units of size >= 2 (flag `proposal`); a subsumed unit is the same evidence in fewer atoms and is rendered for reading only; single-atom units are subtrees by the letter and are rendered in their section without a rule, since a one-atom pack is a rename |

## Counts

- patterns in the inventory: 7216; constants-verbatim: 2249; **rooted-subtree units: 2125** (1395 closed, 730 subsumed); joins excluded: 124; constant-lifted excluded: 4967
- units by root kind: {'constant': 27, 'entity': 394, 'event': 1704}; by depth: {0: 18, 1: 1249, 2: 810, 3: 47, 4: 1}; by size: {1: 605, 2: 655, 3: 550, 4: 315}
- closed units by size: {1: 464, 2: 383, 3: 233, 4: 315}; proposals (closed, size >= 2): 931; of these at support >= 10 (a descriptive cut, not a threshold): 86; single-atom units (not proposals): 605

## Top closed units by support (size >= 2) — the meta-node proposals

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 235 (238) | 2 | event | 1 | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 223 (238) | 2 | event | 1 | `(And (Agent $e0 $x0) (Past $e0))` | tierA-000001: The depot bought two forklifts. |
| 162 (165) | 2 | event | 1 | `(And (Past $e0) (Patient $e0 $x0))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 140 (145) | 2 | event | 1 | `(And (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 95 (97) | 2 | event | 1 | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 68 (69) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 58 (63) | 2 | event | 1 | `(And (Location $e0 $x0) (Past $e0))` | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 56 (56) | 2 | event | 1 | `(And (Agent $e0 $x0) (Ongoing $e0))` | tierB-000028: The nurse is dressing the wound. |
| 52 (53) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 46 (50) | 2 | event | 1 | `(And (Agent $e0 $x0) (Location $e0 $x1))` | tierA-000080: A curator allows photography in the hall. |
| 43 (45) | 2 | event | 1 | `(And (Past $e0) (Theme $e0 $e1))` | tierB-000030: Rima and Skura stopped crying. |
| 42 (46) | 2 | event | 1 | `(And (Experiencer $e0 $x0) (Past $e0))` | tierB-000124: Some of the villagers were unwilling to fight. |
| 37 (37) | 2 | event | 1 | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` | tierA-000208: A clerk gives an answer to the query. |
| 37 (37) | 2 | event | 1 | `(And (Goal $e0 $x0) (Past $e0))` | tierB-000111: Claudio escorted Isabella to the exit. |
| 37 (39) | 2 | event | 0 | `(And (Ongoing $e0) (Past $e0))` | tierB-000001: Ziri was running around constantly. |
| 35 (37) | 2 | event | 1 | `(And (Ongoing $e0) (Patient $e0 $x0))` | tierB-000028: The nurse is dressing the wound. |
| 33 (33) | 2 | event | 1 | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | tierA-000174: A shepherd takes a walk along the ridge. |
| 33 (33) | 2 | event | 1 | `(And (Member $e0 have) (Theme $e0 $x0))` | tierB-000066: Having close friends is more important than being popular. |
| 31 (31) | 2 | event | 1 | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | tierA-000085: A recipe needs two eggs. |
| 30 (30) | 2 | event | 1 | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | tierA-000004: Two forklifts were sold to the depot. |
| 25 (27) | 2 | event | 2 | `(And (Cardinality $x0 <num>) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 25 (27) | 2 | event | 1 | `(And (Location $e0 $x0) (Ongoing $e0))` | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 24 (24) | 3 | event | 1 | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000208: A clerk gives an answer to the query. |
| 23 (23) | 3 | event | 1 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | tierB-000142: This sentence has various meanings. |
| 23 (25) | 2 | event | 2 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | tierB-000004: Tom leaves the lights on all day. |
| 23 (23) | 2 | event | 1 | `(And (Past $e0) (Result $e0 $e1))` | tierB-000228: Kalman grew larger in size. |
| 22 (22) | 2 | event | 1 | `(And (Ongoing $e0) (Theme $e1 $e0))` | tierB-000075: Mark and Jessica began hanging out often. |
| 22 (24) | 2 | event | 1 | `(And (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000004: Tom leaves the lights on all day. |
| 21 (21) | 2 | event | 1 | `(And (Agent $e0 $x0) (Might $e0))` | tierA-000075: A warden might allow visitors on Sundays. |
| 20 (21) | 2 | event | 2 | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | tierB-000160: The child likes to play with the cats. |

## Top closed units rooted at an entity (size >= 2)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 7 (7) | 2 | entity | 2 | `(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))` | tierA-000022: The pottery studio bought a second kiln. |
| 7 (7) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 forklift))` | tierA-000001: The depot bought two forklifts. |
| 6 (6) | 2 | entity | 2 | `(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))` | tierA-000035: The electrician repaired the yard floodlight. |
| 6 (6) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 egg))` | tierA-000084: A recipe requires two eggs. |
| 6 (6) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))` | tierB-000133: One of the girls was left behind. |
| 6 (6) | 2 | entity | 1 | `(And (GroupOf $x0 lemon) (Member $x0 crate))` | tierA-000015: The chef bought several crates of lemons. |
| 6 (6) | 2 | entity | 1 | `(And (Member $x0 budget) (Possession $x0 next_year))` | tierA-000201: A board decides next year's budget. |
| 5 (5) | 3 | entity | 2 | `(And (Member $x0 firm) (Member $x1 tender) (Possession $x1 $x0))` | tierA-000104: A firm abandons its tender. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session))` | tierA-000153: A tutor cancels the afternoon session. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | tierA-000062: The dress rehearsal begins after lunch. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance evening_flight flight) (Member $x0 evening_flight))` | tierA-000143: An airline cancels the evening flight. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance loan_application application) (Member $x0 loan_application))` | tierA-000163: A bank rejects the loan application. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance rescue_team team) (Member $x0 rescue_team))` | tierA-000099: A rescue team abandons the search. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair))` | tierA-000148: A council cancels the summer fair. |
| 5 (5) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 child))` | tierA-000181: Two children walk to the pier. |

## Top closed units of depth >= 2 (a participant with its own links)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 25 (27) | 2 | event | 2 | `(And (Cardinality $x0 <num>) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 23 (25) | 2 | event | 2 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | tierB-000004: Tom leaves the lights on all day. |
| 20 (21) | 2 | event | 2 | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | tierB-000160: The child likes to play with the cats. |
| 17 (17) | 2 | event | 2 | `(And (Patient $e0 $x0) (Theme $e1 $e0))` | tierA-000223: A storm causes the destruction of the greenhouse. |
| 16 (17) | 3 | event | 2 | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | tierB-000166: Yair Stern made two attempts to collaborate with the Nazis. |
| 15 (16) | 2 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x0 <num>))` | tierA-000006: Two forklifts bought the depot. |
| 14 (16) | 3 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 14 (14) | 2 | event | 2 | `(And (Possession $x0 $x1) (Theme $e0 $x0))` | tierA-000104: A firm abandons its tender. |
| 13 (13) | 3 | event | 2 | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | tierB-000362: The trail has gone cold. |
| 12 (12) | 2 | event | 2 | `(And (Agent $e0 $x0) (GroupOf $x0 child))` | tierA-000181: Two children walk to the pier. |
| 11 (11) | 3 | event | 2 | `(And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 10 (12) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 school))` | tierA-000008: The school bought a projector for the hall. |
| 10 (10) | 2 | event | 2 | `(And (Member $x0 door) (Patient $e0 $x0))` | tierB-000056: Rodrigo opened a vault-like door. |
| 9 (9) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 board))` | tierA-000114: A board postpones the vote. |
| 9 (11) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person))` | tierB-000316: Stefan spotted another person in the huge gym working out. |

## Largest closed units (size = k)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 14 (14) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 12 (12) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000208: A clerk gives an answer to the query. |
| 9 (9) | 4 | event | 1 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |
| 7 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 7 (7) | 4 | event | 2 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 7 (7) | 4 | event | 1 | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 7 (7) | 4 | event | 1 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 6 (6) | 4 | event | 2 | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 6 (6) | 4 | event | 2 | `(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 6 (6) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000301: The depot lends the crew a generator. |
| 6 (6) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 6 (6) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000286: A coach teaches the squad a drill. |
| 5 (5) | 4 | event | 2 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Member $x1 hall))` | tierA-000008: The school bought a projector for the hall. |
| 5 (5) | 4 | event | 2 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Past $e0))` | tierA-000008: The school bought a projector for the hall. |
| 5 (5) | 4 | event | 2 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Theme $e0 $x2))` | tierA-000008: The school bought a projector for the hall. |

## Excluded joins (constants verbatim, not a rooted tree) — top by support (124 total; an addition, not listed in the .metta)

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
| 12 (13) | 2 | `(And (Agent $e0 $x0) (Possession $x1 $x0))` | tierA-000104: A firm abandons its tender. |
| 11 (13) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Past $e1))` | tierB-000277: Some men came and cut the tree down. |
| 10 (12) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Past $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 10 (10) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1))` | tierB-000470: The crocodile tried to pull Boris into the river. |
| 10 (10) | 3 | `(And (Agent $e0 $x0) (Possession $x1 $x0) (Theme $e0 $x1))` | tierA-000104: A firm abandons its tender. |
| 10 (10) | 2 | `(And (Patient $e0 $x0) (Patient $e1 $x0))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 8 (8) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |

