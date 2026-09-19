# §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm (paper as written)

> "Given a set of sentence pairs known to be paraphrases (e.g. via asking an LLM to rate if they are paraphrases or not?), we align their SENF graphs (via tree-edit or soft matching) and record which subtrees and roles consistently map to each other. These alignments validate which structural elements can be unified without semantic loss." — FUSE-NF §4.3.4

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| pairs | every equivalence class with ≥ 2 members in `out_ecmp/canonical_iteme.jsonl` from ../corpora/tierA.jsonl, ../corpora/tierC.jsonl: paraphrase pairs = same-polarity members (413), control pairs = same × different polarity (468); control support of a mapping = classes where it occurs in a control pair but in none of the class's paraphrase pairs (every control is paired with every same-polarity member, so a class's own lexical swap also appears in its control pairs) — a measurement column, never a filter |
| alignment | exact maximum-common-subgraph: over every injective skolem renaming within each stream (e / x / f) maximise identical atoms (term + polarity), then near-identical atoms (same arity, same variables in the same positions, one head or constant differs), then the first renaming; greedy assignment above 5040 renamings; eligible atoms = the miner's (28 cap, Implication and surface atoms excluded) |
| subtrees | the §4.3.1 faithful units (`out_ecmp/patterns2_faithful.jsonl`, k = 4) instantiated on each side; a unit maps to the canonical form of its atoms' images (raw when not in the inventory) |
| roles | binary heads on an aligned event centre, class links excluded, matched by aligned centre + filler |
| residue | an atom matched on neither side, keyed by its canonical form and the smallest unit instance around it whose other atoms are matched; `head_on_other_side` = attachment slack rather than a true add/drop |
| consistency | support = distinct equivalence classes; PASS at ≥ 3 (the inherited minimum support); identity mappings summarised per unit (self / other / lost) |
| rules | unit mapping → two implications into a provisional meta-node (`Mn…`); role mapping → minority head rewrites to majority; residue → the context unit rewrites to itself without the atom |

## Pair inventory and alignment quality

- 413 paraphrase pairs, 468 control pairs, 762 records; 0 pairs aligned greedily; 109 pairs with a tie between renamings (the first taken); 1 pairs touching a truncated record
- paraphrase pairs with identical canonical graphs: 113 (27%); alignment quality (identical atoms / larger side) median 0.8333, quartiles 0.6667 / 1.0; pairs below 0.5: 41

## Unit mappings (non-identity): 1298 recorded, 124 pass, 977 shape-parallel

| support | control | parallel | A (support) | B (support) | example pair | A sentence | B sentence |
|---|---|---|---|---|---|---|---|
| 12 | 1 | yes | `(Agent $e0 $x0)` (301) | `(Recipient $e0 $x0)` (37) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 11 | 1 | yes | `(And (Agent $e0 $x0) (Theme $e0 $x1))` (171) | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` (29) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 10 | 0 | yes | `(Agent $e0 $x0)` (301) | `(Source $e0 $x0)` (12) | tierC-000257 tierC-000258 | His religion was directly influenced by the international balance of political p | His religion was influenced directly from the international balance of political |
| 9 | 0 | yes | `(And (Agent $e0 $x0) (Theme $e0 $x1))` (171) | `(And (Source $e0 $x0) (Theme $e0 $x1))` (10) | tierC-000257 tierC-000258 | His religion was directly influenced by the international balance of political p | His religion was influenced directly from the international balance of political |
| 8 | 0 | yes | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` (28) | `(And (Agent $e0 $x0) (Source $e0 $x1))` (9) | tierA-000261 tierA-000262 | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 7 | 0 | yes | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` (24) | `(And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))` (8) | tierA-000261 tierA-000262 | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Past $e0))` (77) | `(And (Past $e0) (Recipient $e0 $x0))` (4) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` (35) | `(And (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))` (4) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 4 | 0 | yes | `(Theme $e0 $e1)` (6) | `(Patient $e0 $e1)` (16) | tierA-000186 tierA-000187 | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))` (14) | tierA-000001 tierA-000003 | The depot bought two forklifts. | The depot acquired two forklifts. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))` (4) | tierA-000001 tierA-000002 | The depot bought two forklifts. | The depot purchased two forklifts. |
| 4 | 0 |  | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))` (4) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (4) | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))` (14) | tierA-000001 tierA-000003 | The depot bought two forklifts. | The depot acquired two forklifts. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))` (4) | tierA-000001 tierA-000002 | The depot bought two forklifts. | The depot purchased two forklifts. |
| 4 | 0 |  | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0))` (4) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))` (14) | tierA-000001 tierA-000003 | The depot bought two forklifts. | The depot acquired two forklifts. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))` (4) | tierA-000001 tierA-000002 | The depot bought two forklifts. | The depot purchased two forklifts. |
| 4 | 0 |  | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1))` (4) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 4 | 0 | yes | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (4) | `(And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))` (14) | tierA-000001 tierA-000003 | The depot bought two forklifts. | The depot acquired two forklifts. |
| 4 | 0 | yes | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))` (4) | tierA-000001 tierA-000002 | The depot bought two forklifts. | The depot purchased two forklifts. |
| 4 | 0 | yes | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 sell) (Past $e0) (Theme $e0 $x0))` (4) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Member $e0 buy))` (4) | `(And (Agent $e0 $x0) (Member $e0 acquire))` (14) | tierA-000001 tierA-000003 | The depot bought two forklifts. | The depot acquired two forklifts. |
| 4 | 0 | yes | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Agent $e0 $x0) (Member $e0 purchase))` (4) | tierA-000001 tierA-000002 | The depot bought two forklifts. | The depot purchased two forklifts. |
| 4 | 0 |  | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 sell) (Recipient $e0 $x0))` (4) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 4 | 0 | yes | `(And (Member $e0 buy) (Past $e0))` (4) | `(And (Member $e0 acquire) (Past $e0))` (14) | tierA-000001 tierA-000003 | The depot bought two forklifts. | The depot acquired two forklifts. |
| 4 | 0 | yes | `(And (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 purchase) (Past $e0))` (4) | tierA-000001 tierA-000002 | The depot bought two forklifts. | The depot purchased two forklifts. |
| 4 | 0 | yes | `(And (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 sell) (Past $e0))` (4) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| 4 | 0 | yes | `(And (Member $e0 buy) (Theme $e0 $x0))` (4) | `(And (Member $e0 acquire) (Theme $e0 $x0))` (14) | tierA-000001 tierA-000003 | The depot bought two forklifts. | The depot acquired two forklifts. |
| 4 | 0 | yes | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | `(And (Member $e0 purchase) (Theme $e0 $x0))` (4) | tierA-000001 tierA-000002 | The depot bought two forklifts. | The depot purchased two forklifts. |
| 4 | 0 | yes | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | `(And (Member $e0 sell) (Theme $e0 $x0))` (4) | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |

## Role mappings: 17 non-identity recorded (4 pass), 13 role-lost records, 27 identity heads

| support | control | majority head (occ) | minority head (occ) | example pair |
|---|---|---|---|---|
| 13 | 0 | Agent (510) | Recipient (47) | tierA-000001 tierA-000004 |
| 10 | 0 | Agent (510) | Source (24) | tierC-000257 tierC-000258 |
| 6 | 3 | Theme (391) | Patient (169) | tierC-000099 tierC-000100 |
| 3 | 5 | Agent (510) | Theme (391) | tierC-000017 tierC-000018 |
| 2 | 0 | Holder (21) | CoAgent (19) | tierC-000181 tierC-000182 |
| 2 | 3 | Theme (391) | Recipient (47) | tierA-000207 tierA-000208 |
| 1 | 1 | Agent (510) | Experiencer (69) | tierC-000079 tierC-000080 |
| 1 | 0 | Agent (510) | Holder (21) | tierA-000084 tierA-000085 |
| 1 | 5 | Agent (510) | Patient (169) | tierC-000163 tierC-000164 |
| 1 | 0 | Patient (169) | Experiencer (69) | tierC-000009 tierC-000010 |
| 1 | 0 | Theme (391) | Experiencer (69) | tierC-000069 tierC-000070 |
| 1 | 0 | Theme (391) | Goal (30) | tierC-000205 tierC-000206 |
| 1 | 2 | Theme (391) | Location (175) | tierC-000063 tierC-000064 |
| 0 | 1 | Agent (510) | Goal (30) |  |
| 0 | 1 | Agent (510) | Location (175) |  |
| 0 | 1 | Experiencer (69) | Holder (21) |  |
| 0 | 5 | Recipient (47) | Source (24) |  |

| support | control | role lost (no atom on the aligned centre + filler) |
|---|---|---|
| 12 | 2 | Agent |
| 12 | 2 | Theme |
| 5 | 2 | Location |
| 4 | 0 | CoAgent |
| 2 | 0 | Beneficiary |
| 2 | 1 | Goal |
| 2 | 0 | Source |
| 1 | 0 | As |
| 1 | 0 | Experiencer |
| 1 | 0 | In |
| 1 | 2 | Patient |
| 1 | 0 | Recipient |
| 1 | 0 | Time |

## Residue (atoms matched on neither side): 511 recorded, 12 pass

| support | control | occurrences | head on other side | atom | context unit | example pair |
|---|---|---|---|---|---|---|
| 6 | 9 | 41 | 10 | `(Agent $e0 $x0)` | — | tierC-000277 tierC-000278 |
| 6 | 2 | 25 | 25 | `(Theme $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierC-000087 tierC-000088 |
| 5 | 0 | 19 | 19 | `(Member $e0 work)` | — | tierC-000303 tierC-000304 |
| 4 | 0 | 26 | 26 | `(Member $e0 decision)` | — | tierA-000185 tierA-000186 |
| 4 | 1 | 11 | 0 | `(Patient $e0 $e1)` | `(And (Agent $e0 $x0) (Patient $e0 $e1))` | tierA-000185 tierA-000186 |
| 4 | 3 | 13 | 12 | `(Theme $e0 $e1)` | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | tierA-000185 tierA-000187 |
| 3 | 0 | 6 | 6 | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Member $e0 destroy))` | tierA-000222 tierA-000223 |
| 3 | 0 | 9 | 0 | `(Degree $x0 big very)` | — | tierA-000339 tierA-000340 |
| 3 | 0 | 10 | 10 | `(Member $e0 cause)` | — | tierA-000222 tierA-000223 |
| 3 | 0 | 7 | 7 | `(Member $e0 take)` | — | tierA-000173 tierA-000174 |
| 3 | 3 | 18 | 2 | `(Past $e0)` | — | tierC-000001 tierC-000002 |
| 3 | 0 | 8 | 0 | `(Theme $e0 $e1)` | `(And (Member $e0 destroy) (Theme $e1 $e0))` | tierA-000222 tierA-000223 |
| 2 | 0 | 2 | 2 | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Location $e0 $x1))` | tierA-000173 tierA-000174 |
| 2 | 0 | 5 | 0 | `(CoAgent $e0 $x0)` | `(And (Agent $e0 $x0) (CoAgent $e0 $x1))` | tierA-000315 tierA-000316 |
| 2 | 0 | 2 | 2 | `(ConditionalProperty bicycle allowed footpath)` | — | tierC-000325 tierC-000326 |
| 2 | 0 | 2 | 2 | `(ConditionalProperty bicycle permitted footpath)` | — | tierC-000325 tierC-000326 |
| 2 | 0 | 2 | 2 | `(ConditionalProperty pedestrian allowed footpath)` | — | tierC-000325 tierC-000326 |
| 2 | 0 | 2 | 2 | `(ConditionalProperty pedestrian permitted footpath)` | — | tierC-000325 tierC-000326 |
| 2 | 0 | 6 | 0 | `(Degree $x0 tired very)` | — | tierA-000363 tierA-000364 |
| 2 | 0 | 2 | 2 | `(Inheritance bicycle allowed) ~NEG` | — | tierC-000325 tierC-000326 |
| 2 | 0 | 2 | 2 | `(Inheritance bicycle permitted) ~NEG` | — | tierC-000325 tierC-000326 |
| 2 | 0 | 2 | 2 | `(Inheritance paper_factory factory)` | — | tierC-000045 tierC-000046 |
| 2 | 0 | 2 | 2 | `(Inheritance paper_mill mill)` | — | tierC-000045 tierC-000046 |
| 2 | 0 | 2 | 2 | `(Inheritance pedestrian allowed) ~NEG` | — | tierC-000325 tierC-000326 |
| 2 | 0 | 2 | 2 | `(Inheritance pedestrian permitted) ~NEG` | — | tierC-000325 tierC-000326 |
| 2 | 0 | 2 | 2 | `(Location $e0 $x0)` | `(And (Location $e0 $x0) (Member $e0 find))` | tierC-000279 tierC-000280 |
| 2 | 0 | 2 | 1 | `(Member $e0 become)` | — | tierC-000001 tierC-000002 |
| 2 | 1 | 8 | 8 | `(Member $x0 answer)` | — | tierA-000207 tierA-000208 |
| 2 | 0 | 2 | 2 | `(Member $x0 wilson)` | — | tierC-000277 tierC-000278 |
| 2 | 0 | 2 | 0 | `(Past $e0)` | `(And (Past $e0) (Theme $e0 $x0))` | tierC-000181 tierC-000182 |

## Unit profiles over the paraphrase pairs: 1635 units occurring; 780 ever mapped elsewhere or lost, 855 always mapped to themselves

| self | other | lost | unit |
|---|---|---|---|
| 83 | 16 | 9 | `(Agent $e0 $x0)` |
| 44 | 17 | 5 | `(And (Agent $e0 $x0) (Theme $e0 $x1))` |
| 10 | 14 | 1 | `(Recipient $e0 $x0)` |
| 7 | 11 | 3 | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` |
| 3 | 4 | 10 | `(Theme $e0 $e1)` |
| 1 | 4 | 9 | `(And (Agent $e0 $x0) (Theme $e0 $e1))` |
| 0 | 10 | 2 | `(Source $e0 $x0)` |
| 74 | 6 | 5 | `(Theme $e0 $x0)` |
| 8 | 10 | 1 | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` |
| 7 | 7 | 3 | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` |
| 0 | 9 | 1 | `(And (Source $e0 $x0) (Theme $e0 $x1))` |
| 0 | 4 | 6 | `(Patient $e0 $e1)` |
| 0 | 4 | 5 | `(And (Agent $e0 $x0) (Patient $e0 $e1))` |
| 0 | 8 | 1 | `(And (Agent $e0 $x0) (Source $e0 $x1))` |
| 26 | 6 | 2 | `(And (Agent $e0 $x0) (Past $e0))` |
| 0 | 4 | 4 | `(And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1))` |
| 0 | 4 | 4 | `(And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1))` |
| 0 | 4 | 4 | `(And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1))` |
| 0 | 4 | 4 | `(And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1))` |
| 0 | 4 | 4 | `(And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1))` |
| 0 | 4 | 4 | `(And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1))` |
| 0 | 7 | 1 | `(And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))` |
| 0 | 4 | 4 | `(And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0))` |
| 0 | 4 | 4 | `(And (Member $e0 decision) (Member $e1 reach) (Theme $e1 $e0))` |
| 0 | 4 | 4 | `(And (Member $e0 decision) (Patient $e1 $e0))` |
| 0 | 4 | 4 | `(And (Member $e0 decision) (Theme $e1 $e0))` |
| 0 | 4 | 4 | `(And (Member $e0 make) (Patient $e0 $e1))` |
| 0 | 4 | 4 | `(And (Member $e0 reach) (Theme $e0 $e1))` |
| 72 | 0 | 7 | `(Past $e0)` |
| 9 | 5 | 2 | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` |

## Tier A scorecard (key = the corpora's target_rule labels)

- lexical / converse targets recovered by a non-identity unit mapping mentioning both lemmas: **27/31** (1 of them by a mapping that also has control support)

| target | classes | recovered by |
|---|---|---|
| CoAgent~GroupOf | 4 | **MISS** |
| abandon<-give_up | 3 | `(And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))` ~ `(And (Agent $e0 $x0) (Member $e0 give_up) (Theme $e0 $x1))` (support 3, control 0) |
| allow<-permit | 3 | `(And (Agent $e0 $x0) (Member $e0 allow))` ~ `(And (Agent $e0 $x0) (Member $e0 permit))` (support 2, control 1) |
| answer<-give_an_answer | 3 | `(And (Agent $e0 $x0) (Member $e0 give))` ~ `(And (Agent $e0 $x0) (Member $e0 answer))` (support 3, control 0, provenance) |
| arrive<-arrival | 3 | `(And (Agent $e0 $x0) (Member $e0 arrive))` ~ `(And (Agent $e0 $x0) (Member $e0 arrival))` (support 2, control 0) |
| automobile<-car | 3 | `(Member $x0 automobile)` ~ `(Member $x0 car)` (support 3, control 0) |
| begin<-commence | 4 | `(Member $e0 begin)` ~ `(Member $e0 commence)` (support 4, control 0) |
| begin<-start | 4 | `(Member $e0 begin)` ~ `(Member $e0 start)` (support 4, control 0) |
| buy<-acquire | 4 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` ~ `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))` (support 4, control 0) |
| buy<-purchase | 4 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` ~ `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))` (support 4, control 0) |
| buy~sell | 4 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` ~ `(And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))` (support 4, control 0) |
| cancel<-call_off | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel))` ~ `(And (Agent $e0 $x0) (Member $e0 call_off))` (support 3, control 0) |
| decide<-decision | 4 | `(Member $e0 decide)` ~ `(Member $e0 make)` (support 4, control 0, provenance) |
| decide<-make_a_decision | 4 | `(Member $e0 decide)` ~ `(Member $e0 make)` (support 4, control 0, provenance) |
| destroy<-destruction | 3 | **MISS** |
| die<-kick_the_bucket | 3 | `(And (Member $e0 die) (Patient $e0 $x0))` ~ `(And (Member $e0 kick_the_bucket) (Patient $e0 $x0))` (support 2, control 0) |
| difficult<-hard | 3 | `(Member $x0 hard)` ~ `(Member $x0 difficult)` (support 3, control 0) |
| discover<-find_out | 3 | `(Member $e0 discover)` ~ `(Member $e0 find_out)` (support 3, control 0) |
| exhausted<-very_tired | 3 | **MISS** |
| give~receive | 4 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` ~ `(And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1) (Theme $e0 $x2))` (support 3, control 0) |
| huge<-very_big | 3 | `(Member $x0 big)` ~ `(Member $x0 huge)` (support 3, control 0, provenance) |
| large<-big | 3 | `(Member $x0 big)` ~ `(Member $x0 large)` (support 3, control 0) |
| lend~borrow | 3 | `(And (Member $e0 lend) (Theme $e0 $x0))` ~ `(And (Member $e0 borrow) (Theme $e0 $x0))` (support 3, control 0) |
| physician<-doctor | 3 | `(Member $x0 physician)` ~ `(Member $x0 doctor)` (support 3, control 0) |
| postpone<-put_off | 3 | `(And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))` ~ `(And (Agent $e0 $x0) (Member $e0 put_off) (Theme $e0 $x1))` (support 3, control 0) |
| reject<-turn_down | 3 | `(And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))` ~ `(And (Agent $e0 $x0) (Member $e0 turn_down) (Theme $e0 $x1))` (support 3, control 0) |
| repair<-fix | 4 | `(And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))` ~ `(And (Agent $e0 $x0) (Member $e0 fix) (Patient $e0 $x1))` (support 2, control 0) |
| repair<-mend | 4 | `(And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))` ~ `(And (Agent $e0 $x0) (Member $e0 mend) (Patient $e0 $x1))` (support 2, control 0) |
| require<-need | 3 | `(Member $e0 require)` ~ `(Member $e0 need)` (support 3, control 0) |
| teach~learn | 3 | `(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))` ~ `(And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1))` (support 3, control 0) |
| walk<-take_a_walk | 3 | **MISS** |

| alt target (expects identical parses) | pairs | identical |
|---|---|---|
| alt:dative | 10 | 10 |
| alt:voice | 36 | 33 |
