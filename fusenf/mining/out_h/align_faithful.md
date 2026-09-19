# §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm (paper as written)

> "Given a set of sentence pairs known to be paraphrases (e.g. via asking an LLM to rate if they are paraphrases or not?), we align their SENF graphs (via tree-edit or soft matching) and record which subtrees and roles consistently map to each other. These alignments validate which structural elements can be unified without semantic loss." — FUSE-NF §4.3.4

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| pairs | every equivalence class with ≥ 2 members in `canonical_substrate.jsonl` from ../corpora/tierC.jsonl: paraphrase pairs = same-polarity members (172), control pairs = same × different polarity (0); control support of a mapping = classes where it occurs in a control pair but in none of the class's paraphrase pairs (every control is paired with every same-polarity member, so a class's own lexical swap also appears in its control pairs) — a measurement column, never a filter |
| alignment | exact maximum-common-subgraph: over every injective skolem renaming within each stream (e / x / f) maximise identical atoms (term + polarity), then near-identical atoms (same arity, same variables in the same positions, one head or constant differs), then the first renaming; greedy assignment above 5040 renamings; eligible atoms = the miner's (28 cap, Implication and surface atoms excluded) |
| subtrees | the §4.3.1 faithful units (`out_h/patterns2_faithful.jsonl`, k = 4) instantiated on each side; a unit maps to the canonical form of its atoms' images (raw when not in the inventory) |
| roles | binary heads on an aligned event centre, class links excluded, matched by aligned centre + filler |
| residue | an atom matched on neither side, keyed by its canonical form and the smallest unit instance around it whose other atoms are matched; `head_on_other_side` = attachment slack rather than a true add/drop |
| consistency | support = distinct equivalence classes; PASS at ≥ 3 (the inherited minimum support); identity mappings summarised per unit (self / other / lost) |
| rules | unit mapping → two implications into a provisional meta-node (`Mn…`); role mapping → minority head rewrites to majority; residue → the context unit rewrites to itself without the atom |

## Pair inventory and alignment quality

- 172 paraphrase pairs, 0 control pairs, 344 records; 0 pairs aligned greedily; 11 pairs with a tie between renamings (the first taken); 1 pairs touching a truncated record
- paraphrase pairs with identical canonical graphs: 26 (15%); alignment quality (identical atoms / larger side) median 0.7143, quartiles 0.5455 / 0.8846; pairs below 0.5: 35

## Unit mappings (non-identity): 124 recorded, 3 pass, 117 shape-parallel

| support | control | parallel | A (support) | B (support) | example pair | A sentence | B sentence |
|---|---|---|---|---|---|---|---|
| 5 | 0 | yes | `(Patient $e0 $x0)` (323) | `(Theme $e0 $x0)` (316) | tierC-000133 tierC-000134 | The Janmashtmi Festival is organised in the village and a mela is also celebrate | Janmashtmi festival is organised in the village and a Mela is also celebrated . |
| 4 | 0 | yes | `(Agent $e0 $x0)` (385) | `(Patient $e0 $x0)` (323) | tierC-000001 tierC-000002 | Once the indigenous people had become indigenous , they would cease to be French | Once the indigenous peoples had become indigenous , they would cease to be Frenc |
| 3 | 0 | yes | `(And (Past $e0) (Patient $e0 $x0))` (195) | `(And (Past $e0) (Theme $e0 $x0))` (154) | tierC-000229 tierC-000230 | Another series was played between the Boston Red Sox and the Cincinnati Reds in  | In Havana , another series between Cincinnati Reds and Boston Red Sox was played |
| 2 | 0 | yes | `(Theme $e0 $x0)` (52) | `(Goal $e0 $x0)` (316) | tierC-000019 tierC-000020 | This all leads to a big cat fight during the large homecoming game . | All this leads to a big cat fight during the great homecoming game . |
| 2 | 0 | yes | `(Member $e0 follow)` (10) | `(Member $e0 succeed)` (3) | tierC-000075 tierC-000076 | Margaret Fleming married James of Barrochan and was succeeded by Alexander , his | Margaret Fleming married James of Barrochan and was followed by Alexander , his  |
| 2 | 0 | yes | `(And (Member $e0 follow) (Past $e0))` (5) | `(And (Member $e0 succeed) (Past $e0))` (3) | tierC-000075 tierC-000076 | Margaret Fleming married James of Barrochan and was succeeded by Alexander , his | Margaret Fleming married James of Barrochan and was followed by Alexander , his  |
| 1 | 0 | yes | `(Agent $e0 $x0)` (385) | `(Theme $e0 $x0)` (316) | tierC-000113 tierC-000114 | Like many aspects of Islamic ivory this reflects the Byzantine traditions Islam  | Like many aspects of Islamic ivory , this reflects the Byzantine traditions that |
| 1 | 0 | yes | `(Agent $e0 $x0)` (385) | `(Experiencer $e0 $x0)` (150) | tierC-000121 tierC-000122 | He remained in Japan for three years before moving with his family back to Germa | He stayed in Japan for three years before moving back with his family to Germany |
| 1 | 0 | yes | `(Agent $e0 $x0)` (385) | `(Source $e0 $x0)` (32) | tierC-000257 tierC-000258 | His religion was directly influenced by the international balance of political p | His religion was influenced directly from the international balance of political |
| 1 | 0 | yes | `(Theme $e0 $x0)` (111) | `(Location $e0 $x0)` (316) | tierC-000063 tierC-000064 | Lake Sammamish enters the Issaquah Creek park . | Lake Sammamish enters Issaquah Creek in the park . |
| 1 | 0 | yes | `(And (Agent $e0 $x0) (Past $e0))` (232) | `(And (Past $e0) (Patient $e0 $x0))` (195) | tierC-000001 tierC-000002 | Once the indigenous people had become indigenous , they would cease to be French | Once the indigenous peoples had become indigenous , they would cease to be Frenc |
| 1 | 0 | yes | `(And (Agent $e0 $x0) (Past $e0))` (232) | `(And (Past $e0) (Theme $e0 $x0))` (154) | tierC-000113 tierC-000114 | Like many aspects of Islamic ivory this reflects the Byzantine traditions Islam  | Like many aspects of Islamic ivory , this reflects the Byzantine traditions that |
| 1 | 0 | yes | `(And (Agent $e0 $x0) (Past $e0))` (232) | `(And (Experiencer $e0 $x0) (Past $e0))` (45) | tierC-000121 tierC-000122 | He remained in Japan for three years before moving with his family back to Germa | He stayed in Japan for three years before moving back with his family to Germany |
| 1 | 0 | yes | `(And (Agent $e0 $x0) (Past $e0))` (232) | `(And (Past $e0) (Source $e0 $x0))` (20) | tierC-000257 tierC-000258 | His religion was directly influenced by the international balance of political p | His religion was influenced directly from the international balance of political |
| 1 | 0 | yes | `(And (Past $e0) (Theme $e0 $x0))` (38) | `(And (Goal $e0 $x0) (Past $e0))` (154) | tierC-000243 tierC-000244 | Kerr broke into the first team that season , but Couper found himself on the ben | Kerr broke this season into the first team , but Couper found himself on the ben |
| 1 | 0 | yes | `(And (Agent $e0 $x0) (Theme $e0 $x1))` (17) | `(And (Agent $e0 $x0) (Goal $e0 $x1))` (114) | tierC-000019 tierC-000020 | This all leads to a big cat fight during the large homecoming game . | All this leads to a big cat fight during the great homecoming game . |
| 1 | 0 | yes | `(Member $x0 thing)` (4) | `(Member $x0 country)` (114) | tierC-000345 tierC-000346 | It is slightly smaller than Peru and slightly larger than South Africa . | It is somewhat smaller than Peru and slightly larger than South Africa . |
| 1 | 0 | yes | `(Member $x0 thing)` (0) | `(Member $x0 ivory)` (114) | tierC-000113 tierC-000114 | Like many aspects of Islamic ivory this reflects the Byzantine traditions Islam  | Like many aspects of Islamic ivory , this reflects the Byzantine traditions that |
| 1 | 0 |  | `(And (Agent $e0 $x0) (Patient $e0 $x1))` (74) | `(And (Source $e0 $x0) (Theme $e0 $x1))` (6) | tierC-000257 tierC-000258 | His religion was directly influenced by the international balance of political p | His religion was influenced directly from the international balance of political |
| 1 | 0 | yes | `(Possession $x0 $x1)` (45) | `(PartOf $x0 $x1)` (54) | tierC-000265 tierC-000266 | They are purple , dense black-hard rocks with a considerable pyrite content . | They are purple , dense black-hard rocks with considerable content of pyrite . |
| 1 | 0 |  | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` (51) | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` (5) | tierC-000257 tierC-000258 | His religion was directly influenced by the international balance of political p | His religion was influenced directly from the international balance of political |
| 1 | 0 | yes | `(GroupOf $x0 person)` (0) | `(GroupOf $x0 people)` (34) | tierC-000001 tierC-000002 | Once the indigenous people had become indigenous , they would cease to be French | Once the indigenous peoples had become indigenous , they would cease to be Frenc |
| 1 | 0 | yes | `(GroupOf $x0 person)` (34) | `(Member $x0 expedition)` (0) | tierC-000171 tierC-000172 | Others during the expedition were Frederick William Beechy , science officer and | Others on the expedition were Frederick William Beechy , science officer and Edw |
| 1 | 0 | yes | `(And (Agent $e0 $x0) (Member $x0 person))` (30) | `(And (Member $x0 person) (Patient $e0 $x0))` (6) | tierC-000237 tierC-000238 | He is the and can become the Inomaru to borrow . | As , he is the and can become the Inomaru to borrow . |
| 1 | 0 | yes | `(And (Agent $e0 $x0) (Member $x0 person))` (30) | `(And (Experiencer $e0 $x0) (Member $x0 person))` (5) | tierC-000121 tierC-000122 | He remained in Japan for three years before moving with his family back to Germa | He stayed in Japan for three years before moving back with his family to Germany |
| 1 | 0 | yes | `(And (Agent $e0 $x0) (Member $x0 person) (Past $e0))` (20) | `(And (Experiencer $e0 $x0) (Member $x0 person) (Past $e0))` (3) | tierC-000121 tierC-000122 | He remained in Japan for three years before moving with his family back to Germa | He stayed in Japan for three years before moving back with his family to Germany |
| 1 | 0 | yes | `(Member $e0 use)` (20) | `(Theme $e0 banach_mackey_topology) ~NEG` (0) | tierC-000005 tierC-000006 | The Banach -- Mackey topology and the weak Arens space topology are relatively r | The Banach - Mackey - topology and the weak Arens - space topology are used rela |
| 1 | 0 | yes | `(Member $e0 use)` (20) | `(Theme $e0 weak_arens_space_topology) ~NEG` (0) | tierC-000005 tierC-000006 | The Banach -- Mackey topology and the weak Arens space topology are relatively r | The Banach - Mackey - topology and the weak Arens - space topology are used rela |
| 1 | 0 | yes | `(Member $x0 house)` (20) | `(Member $x0 muslim_house)` (0) | tierC-000095 tierC-000096 | The region was then followed by the Muslim house of Arakkal , ruled by Tipu Sult | The region was followed by the Muslim house of Arakkal , ruled by Tipu Sultan . |
| 1 | 0 | yes | `(And (Agent $e0 $x0) (Member $x0 thing))` (0) | `(And (Agent $e0 $x0) (Member $x0 ivory))` (19) | tierC-000113 tierC-000114 | Like many aspects of Islamic ivory this reflects the Byzantine traditions Islam  | Like many aspects of Islamic ivory , this reflects the Byzantine traditions that |

## Role mappings: 11 non-identity recorded (4 pass), 16 role-lost records, 26 identity heads

| support | control | majority head (occ) | minority head (occ) | example pair |
|---|---|---|---|---|
| 6 | 0 | Theme (181) | Patient (97) | tierC-000099 tierC-000100 |
| 4 | 0 | Agent (252) | Patient (97) | tierC-000001 tierC-000002 |
| 4 | 0 | Agent (252) | Theme (181) | tierC-000017 tierC-000018 |
| 3 | 0 | Agent (252) | Experiencer (37) | tierC-000035 tierC-000036 |
| 2 | 0 | Holder (10) | CoAgent (10) | tierC-000181 tierC-000182 |
| 2 | 0 | Theme (181) | Goal (16) | tierC-000019 tierC-000020 |
| 2 | 0 | Theme (181) | Location (75) | tierC-000047 tierC-000048 |
| 1 | 0 | Agent (252) | Source (5) | tierC-000257 tierC-000258 |
| 1 | 0 | In (27) | During (2) | tierC-000151 tierC-000152 |
| 1 | 0 | Location (75) | At (4) | tierC-000271 tierC-000272 |
| 1 | 0 | Location (75) | In (27) | tierC-000259 tierC-000260 |

| support | control | role lost (no atom on the aligned centre + filler) |
|---|---|---|
| 13 | 0 | Theme |
| 12 | 0 | Agent |
| 8 | 0 | Location |
| 4 | 0 | Patient |
| 3 | 0 | Manner |
| 2 | 0 | As |
| 2 | 0 | Beneficiary |
| 2 | 0 | In |
| 2 | 0 | To |
| 1 | 0 | During |
| 1 | 0 | Goal |
| 1 | 0 | Instrument |
| 1 | 0 | Possession |
| 1 | 0 | Recipient |
| 1 | 0 | Source |

## Residue (atoms matched on neither side): 556 recorded, 5 pass

| support | control | occurrences | head on other side | atom | context unit | example pair |
|---|---|---|---|---|---|---|
| 6 | 0 | 7 | 5 | `(Past $e0)` | — | tierC-000009 tierC-000010 |
| 4 | 0 | 5 | 3 | `(Agent $e0 $x0)` | — | tierC-000217 tierC-000218 |
| 3 | 0 | 3 | 2 | `(LocatedIn $x0 $x1)` | — | tierC-000069 tierC-000070 |
| 3 | 0 | 3 | 2 | `(Theme $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierC-000021 tierC-000022 |
| 3 | 0 | 3 | 1 | `(Theme $e0 $x0)` | — | tierC-000069 tierC-000070 |
| 2 | 0 | 2 | 1 | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Member $x0 person))` | tierC-000237 tierC-000238 |
| 2 | 0 | 2 | 2 | `(Also $x0 $e0)` | — | tierC-000133 tierC-000134 |
| 2 | 0 | 2 | 1 | `(Experiencer $e0 $x0)` | — | tierC-000039 tierC-000040 |
| 2 | 0 | 2 | 0 | `(Inheritance metropolitan_statistical_area area)` | — | tierC-000275 tierC-000276 |
| 2 | 0 | 2 | 2 | `(Inheritance paper_factory factory)` | — | tierC-000045 tierC-000046 |
| 2 | 0 | 2 | 2 | `(Inheritance paper_mill mill)` | — | tierC-000045 tierC-000046 |
| 2 | 0 | 2 | 2 | `(Member $x0 government)` | — | tierC-000217 tierC-000218 |
| 2 | 0 | 2 | 2 | `(Member $x0 western)` | — | tierC-000143 tierC-000144 |
| 2 | 0 | 2 | 0 | `(Past $e0)` | `(And (Member $e0 have) (Past $e0))` | tierC-000181 tierC-000182 |
| 2 | 0 | 2 | 2 | `(Patient $e0 $x0)` | — | tierC-000009 tierC-000010 |
| 2 | 0 | 2 | 0 | `(Result $e0 $e1)` | `(And (Member $e0 become) (Result $e0 $e1))` | tierC-000001 tierC-000002 |
| 1 | 0 | 1 | 0 | `(Again $e0)` | `(And (Again $e0) (Past $e0))` | tierC-000229 tierC-000230 |
| 1 | 0 | 1 | 0 | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Can $e0))` | tierC-000149 tierC-000150 |
| 1 | 0 | 1 | 1 | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Member $e0 sing))` | tierC-000329 tierC-000330 |
| 1 | 0 | 1 | 1 | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Member $e0 win))` | tierC-000277 tierC-000278 |
| 1 | 0 | 3 | 0 | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Possession $x0 $x1))` | tierC-000139 tierC-000140 |
| 1 | 0 | 1 | 1 | `(Agent $e0 amateur_barbershop_harmony_society)` | — | tierC-000329 tierC-000330 |
| 1 | 0 | 1 | 1 | `(Agent $e0 gilles_thibaut)` | — | tierC-000131 tierC-000132 |
| 1 | 0 | 1 | 1 | `(Agent $e0 government_of_kenya)` | — | tierC-000245 tierC-000246 |
| 1 | 0 | 1 | 1 | `(Agent $e0 government_of_uganda)` | — | tierC-000217 tierC-000218 |
| 1 | 0 | 1 | 1 | `(Agent $e0 indooroopilly_line)` | — | tierC-000185 tierC-000186 |
| 1 | 0 | 2 | 2 | `(Agent $e0 j_augustus_knapp)` | — | tierC-000231 tierC-000232 |
| 1 | 0 | 1 | 1 | `(Agent $e0 jon_bon_jovi)` | — | tierC-000179 tierC-000180 |
| 1 | 0 | 1 | 0 | `(Agent $e0 jones)` | — | tierC-000303 tierC-000304 |
| 1 | 0 | 1 | 1 | `(Agent $e0 karen)` | — | tierC-000071 tierC-000072 |

## Unit profiles over the paraphrase pairs: 772 units occurring; 276 ever mapped elsewhere or lost, 496 always mapped to themselves

| self | other | lost | unit |
|---|---|---|---|
| 28 | 8 | 7 | `(Theme $e0 $x0)` |
| 27 | 5 | 7 | `(Agent $e0 $x0)` |
| 21 | 8 | 4 | `(Patient $e0 $x0)` |
| 17 | 3 | 5 | `(And (Past $e0) (Patient $e0 $x0))` |
| 16 | 5 | 3 | `(And (Past $e0) (Theme $e0 $x0))` |
| 62 | 0 | 6 | `(Past $e0)` |
| 17 | 3 | 3 | `(And (Agent $e0 $x0) (Past $e0))` |
| 10 | 1 | 4 | `(And (Agent $e0 $x0) (Theme $e0 $x1))` |
| 8 | 1 | 3 | `(Experiencer $e0 $x0)` |
| 18 | 2 | 1 | `(Member $x0 thing)` |
| 2 | 0 | 3 | `(LocatedIn $x0 $x1)` |
| 1 | 2 | 1 | `(And (Member $e0 direct) (Patient $e0 $x0))` |
| 1 | 2 | 1 | `(Member $e0 direct)` |
| 0 | 3 | 0 | `(And (Member $e0 succeed) (Past $e0))` |
| 0 | 3 | 0 | `(Member $e0 succeed)` |
| 10 | 1 | 1 | `(Possession $x0 $x1)` |
| 8 | 1 | 1 | `(Location $e0 $x0)` |
| 7 | 0 | 2 | `(And (Member $x0 person) (Possession $x1 $x0))` |
| 6 | 0 | 2 | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` |
| 5 | 1 | 1 | `(And (Agent $e0 $x0) (Member $x0 thing))` |
| 4 | 1 | 1 | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` |
| 2 | 2 | 0 | `(And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1))` |
| 2 | 1 | 1 | `(And (Member $x0 person) (Patient $e0 $x0))` |
| 2 | 2 | 0 | `(Member $e0 follow)` |
| 2 | 0 | 2 | `(Theme $e0 $e1)` |
| 1 | 0 | 2 | `(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))` |
| 1 | 1 | 1 | `(And (Experiencer $e0 $x0) (Member $x0 person))` |
| 1 | 0 | 2 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` |
| 1 | 0 | 2 | `(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))` |
| 1 | 0 | 2 | `(And (Member $e0 become) (Result $e0 $e1))` |
