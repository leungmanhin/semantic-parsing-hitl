# §4.3.1 Frequent Subtree Mining — FAITHFUL view (paper as written)

> "Here we enumerate all rooted subtrees up to a fixed size threshold in each SENF graph and count how many sentences contain each pattern. Subtrees exceeding a minimum support threshold reveal common semantic units — such as 'go to with two participants' — that should be treated as single meta-nodes." — FUSE-NF §4.3.1

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| substrate | canonical_iteme.jsonl (762 records; 740 carry at least one pattern) — patterns2.jsonl: 5799 patterns, the miner's inventory; this view mines nothing |
| size threshold | k = 4 atoms per pattern (the miner's --k) |
| minimum support | 3 records (document support; occurrences reported beside it) |
| pattern language | skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded |
| rooted subtree | atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded |
| constants verbatim | n_lifted = 0 only; the 3939 constant-lifted (shape-stratum) patterns are an addition |
| closure | closed = no larger faithful unit with exactly the same supporting records contains it (its atoms embed under a renaming of variables); two different units on the same records are both closed; computed within this view (the miner's own flag ranges over the full inventory, lifted patterns and joins included, and is kept as miner_dominated); closed units are the meta-node proposals, subsumed units the same evidence in fewer atoms (subsumed_by names the covering unit) |
| meta-node | (Mn<Name> <root> <other variables>) for units of size >= 2 — Name = the unit's heads and constants in atom order along the tree (Member / GroupOf give their constant, roles their name, Ev / Fn for an event- or function-valued filler, Of<spec> for a filler with atoms of its own, ~NEG a Neg suffix; root tokens joined with '_', tokens inside a nested spec with '-'), the pattern id appended when two units would share a name (0 here); provisional; pack rule = (Implication (And <atoms>) (Mn<Name> …)) |
| single-atom units | subtrees by the letter, kept in the JSONL and the counts; not proposals (a one-atom pack is a rename), so not rendered in the .metta |

## Counts

- patterns in the inventory: 5799; constants-verbatim: 1860; **rooted-subtree units: 1652** (773 closed, 879 subsumed); joins excluded: 208; constant-lifted excluded: 3939
- units by root kind: {'constant': 31, 'entity': 231, 'event': 1390}; by depth: {0: 6, 1: 764, 2: 826, 3: 54, 4: 2}; by size: {1: 324, 2: 442, 3: 497, 4: 389}
- closed units by size: {1: 159, 2: 129, 3: 96, 4: 389}; proposals (closed, size >= 2): 614; of these at support >= 10 (a descriptive cut, not a threshold): 35; single-atom units (not proposals): 324

## Top closed units by support (size >= 2) — the meta-node proposals

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 171 (171) | 2 | event | 1 | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 77 (101) | 2 | event | 1 | `(And (Agent $e0 $x0) (Past $e0))` | tierA-000001: The depot bought two forklifts. |
| 63 (71) | 2 | event | 1 | `(And (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 52 (75) | 2 | event | 1 | `(And (Past $e0) (Patient $e0 $x0))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 50 (58) | 2 | event | 1 | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 35 (35) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 29 (29) | 2 | event | 1 | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | tierA-000004: Two forklifts were sold to the depot. |
| 28 (28) | 2 | event | 1 | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` | tierA-000208: A clerk gives an answer to the query. |
| 25 (31) | 2 | event | 1 | `(And (Agent $e0 $x0) (Location $e0 $x1))` | tierA-000080: A curator allows photography in the hall. |
| 24 (24) | 3 | event | 1 | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000208: A clerk gives an answer to the query. |
| 23 (23) | 2 | event | 2 | `(And (Cardinality $x0 <num>) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 22 (28) | 3 | event | 1 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 20 (20) | 2 | event | 1 | `(And (Agent $e0 $x0) (Might $e0))` | tierA-000075: A warden might allow visitors on Sundays. |
| 18 (28) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person))` | tierC-000041: Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 14 (14) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 13 (19) | 3 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0))` | tierC-000049: He also appeared in music films and later in life , in comedic roles . |
| 13 (14) | 2 | event | 1 | `(And (Location $e0 $x0) (Theme $e0 $x1))` | tierA-000133: A diver discovers a wreck off the point. |
| 13 (13) | 2 | entity | 2 | `(And (Member $x0 person) (Possession $x1 $x0))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 13 (13) | 2 | event | 1 | `(And (Might $e0) (Theme $e0 $x0))` | tierA-000087: A recipe might require two eggs. |
| 12 (12) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000208: A clerk gives an answer to the query. |
| 12 (12) | 3 | event | 1 | `(And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1))` | tierA-000108: A firm might abandon its tender. |
| 12 (12) | 2 | event | 1 | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | tierA-000085: A recipe needs two eggs. |
| 11 (11) | 3 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 11 (13) | 2 | event | 1 | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | tierA-000174: A shepherd takes a walk along the ridge. |
| 11 (11) | 2 | event | 1 | `(And (Experiencer $e0 $x0) (Location $e0 $x1))` | tierA-000395: An automobile waits at the gate. |
| 11 (11) | 2 | event | 1 | `(And (Member $e0 destroy) (Patient $e0 $x0))` | tierA-000222: A storm destroys the greenhouse. |
| 11 (13) | 2 | event | 2 | `(And (Possession $x0 $x1) (Theme $e0 $x0))` | tierA-000104: A firm abandons its tender. |
| 10 (10) | 3 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))` | tierA-000207: A clerk answers the query. |
| 10 (10) | 3 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))` | tierA-000281: A potter teaches an apprentice glazing. |
| 10 (10) | 2 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x0 <num>))` | tierA-000006: Two forklifts bought the depot. |

## Top closed units rooted at an entity (size >= 2)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 13 (13) | 2 | entity | 2 | `(And (Member $x0 person) (Possession $x1 $x0))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 10 (10) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 child))` | tierA-000181: Two children walk to the pier. |
| 7 (7) | 2 | entity | 2 | `(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))` | tierA-000022: The pottery studio bought a second kiln. |
| 7 (7) | 2 | entity | 1 | `(And (Cardinality $x0 <num>) (GroupOf $x0 forklift))` | tierA-000001: The depot bought two forklifts. |
| 6 (6) | 2 | entity | 2 | `(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))` | tierA-000035: The electrician repaired the yard floodlight. |
| 6 (6) | 2 | entity | 1 | `(And (GroupOf $x0 lemon) (Member $x0 crate))` | tierA-000015: The chef bought several crates of lemons. |
| 6 (6) | 2 | entity | 1 | `(And (Member $x0 budget) (Possession $x0 next_year))` | tierA-000201: A board decides next year's budget. |
| 5 (5) | 3 | entity | 2 | `(And (Member $x0 firm) (Member $x1 tender) (Possession $x1 $x0))` | tierA-000104: A firm abandons its tender. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session))` | tierA-000153: A tutor cancels the afternoon session. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | tierA-000062: The dress rehearsal begins after lunch. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance evening_flight flight) (Member $x0 evening_flight))` | tierA-000143: An airline cancels the evening flight. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance loan_application application) (Member $x0 loan_application))` | tierA-000163: A bank rejects the loan application. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance rescue_team team) (Member $x0 rescue_team))` | tierA-000099: A rescue team abandons the search. |
| 5 (5) | 2 | entity | 2 | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair))` | tierA-000148: A council cancels the summer fair. |
| 5 (5) | 2 | entity | 1 | `(And (Member $x0 file) (Member $x0 missing))` | tierA-000138: An intern discovers the missing file. |

## Top closed units of depth >= 2 (a participant with its own links)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 23 (23) | 2 | event | 2 | `(And (Cardinality $x0 <num>) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 18 (28) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person))` | tierC-000041: Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 13 (19) | 3 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0))` | tierC-000049: He also appeared in music films and later in life , in comedic roles . |
| 13 (13) | 2 | entity | 2 | `(And (Member $x0 person) (Possession $x1 $x0))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 11 (11) | 3 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 11 (13) | 2 | event | 2 | `(And (Possession $x0 $x1) (Theme $e0 $x0))` | tierA-000104: A firm abandons its tender. |
| 10 (10) | 2 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x0 <num>))` | tierA-000006: Two forklifts bought the depot. |
| 9 (9) | 3 | event | 2 | `(And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 9 (9) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 board))` | tierA-000114: A board postpones the vote. |
| 8 (8) | 3 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 8 (20) | 3 | event | 3 | `(And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 8 (8) | 2 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 physician))` | tierA-000375: A physician signs the chart. |
| 8 (9) | 2 | event | 2 | `(And (Location $e0 $x0) (Member $x0 ledger))` | tierA-000128: An auditor discovers an error in the ledger. |
| 7 (7) | 3 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1))` | tierA-000006: Two forklifts bought the depot. |
| 7 (7) | 3 | event | 2 | `(And (Agent $e0 $x0) (Member $x0 board) (Theme $e0 $x1))` | tierA-000114: A board postpones the vote. |

## Largest closed units (size = k)

| support (occ) | size | root | depth | unit | e.g. |
|---|---|---|---|---|---|
| 14 (14) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 12 (12) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000208: A clerk gives an answer to the query. |
| 6 (6) | 4 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 6 (10) | 4 | event | 3 | `(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |
| 6 (6) | 4 | event | 2 | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 6 (6) | 4 | event | 2 | `(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 6 (6) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000301: The depot lends the crew a generator. |
| 6 (6) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 6 (6) | 4 | event | 1 | `(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000286: A coach teaches the squad a drill. |
| 5 (5) | 4 | event | 2 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Member $x1 hall))` | tierA-000008: The school bought a projector for the hall. |
| 5 (5) | 4 | event | 2 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Past $e0))` | tierA-000008: The school bought a projector for the hall. |
| 5 (5) | 4 | event | 2 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Theme $e0 $x2))` | tierA-000008: The school bought a projector for the hall. |
| 5 (5) | 4 | event | 2 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Past $e0))` | tierA-000008: The school bought a projector for the hall. |
| 5 (5) | 4 | event | 2 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Theme $e0 $x2))` | tierA-000008: The school bought a projector for the hall. |
| 5 (5) | 4 | event | 2 | `(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Theme $e0 $x1))` | tierA-000109: Two climbers abandon the north route. |

## Excluded joins (constants verbatim, not a rooted tree) — top by support (208 total; an addition, not listed in the .metta)

| support (occ) | size | pattern | e.g. |
|---|---|---|---|
| 27 (47) | 2 | `(And (Agent $e0 $x0) (Agent $e1 $x0))` | tierC-000025: Some indigenous Americans and European-American settlers began to create a community around the post |
| 22 (58) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0))` | tierC-000025: Some indigenous Americans and European-American settlers began to create a community around the post |
| 18 (20) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Past $e1))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 18 (22) | 2 | `(And (Patient $e0 $x0) (Patient $e1 $x0))` | tierC-000001: Once the indigenous people had become indigenous , they would cease to be French . |
| 15 (19) | 4 | `(And (Past $e0) (Past $e1) (Patient $e0 $x0) (Patient $e1 $x0))` | tierC-000001: Once the indigenous people had become indigenous , they would cease to be French . |
| 15 (38) | 3 | `(And (Past $e0) (Patient $e0 $x0) (Patient $e1 $x0))` | tierC-000001: Once the indigenous people had become indigenous , they would cease to be French . |
| 14 (24) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Patient $e0 $x1))` | tierC-000025: Some indigenous Americans and European-American settlers began to create a community around the post |
| 13 (19) | 2 | `(And (Agent $e0 $x0) (Possession $x1 $x0))` | tierA-000104: A firm abandons its tender. |
| 12 (22) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Patient $e1 $x1))` | tierC-000025: Some indigenous Americans and European-American settlers began to create a community around the post |
| 10 (10) | 2 | `(And (Location $e0 $x0) (Location $e1 $x0))` | tierA-000316: A welder and a fitter work on the frame. |
| 10 (14) | 2 | `(And (Theme $e0 $x0) (Theme $e1 $x0))` | tierA-000312: Ana and Bo work on the mural. |
| 9 (15) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Patient $e0 $x1))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 8 (14) | 3 | `(And (Agent $e0 $x0) (Location $e0 $x1) (Location $e1 $x1))` | tierA-000316: A welder and a fitter work on the frame. |
| 8 (12) | 3 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 person))` | tierC-000049: He also appeared in music films and later in life , in comedic roles . |
| 7 (17) | 4 | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 person) (Past $e0))` | tierC-000049: He also appeared in music films and later in life , in comedic roles . |

