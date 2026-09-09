# §4.3.3 Mutual-Information Grouping — ADDITION: normalised-MI gate

> "We could construct a binary feature matrix indicating which subtrees occur in which sentences, then compute pairwise mutual information between features. Pairs with very high MI but moderate individual support almost always co-occur, so they are excellent candidates for consolidation into a single feature." — FUSE-NF §4.3.3

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| features | the 1652 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees) |
| matrix | binary presence, 762 records x 1652 units, from each unit's supporting ids (106 records carry no unit and are all-zero rows); 1363726 pairs, 39574 with any co-occurrence |
| MI | exact pairwise mutual information of the two binary presence variables, in bits |
| 'very high MI' | ADDITION: normalised MI = MI / max(H(A), H(B)) in [0, 1] (1 = identical record sets); gate NMI >= 0.8; sensitivity value 0.7; pairs recorded from 0.3; dial [0.5, 0.6, 0.7, 0.8, 0.9, 1.0] |
| 'moderate individual support' | no ceiling: the normalisation reads tightness directly; the floor of 3 inherited from the units is the only support condition |
| calibration | NMI is our reading of 'very high' (support-free); it belongs to the additions arm |
| 'almost always co-occur' | the paper's consequence, shown as the doc-Jaccard column (not gated) |
| containment | tagged, not gated: a CONTAINED pair (one unit's atoms embed in the other's under a variable renaming) restates §4.3.1 subsumption; SAME RECORDS = identical support sets, not contained; OVERLAPPING = the rest |
| families | same-records passes rendered per support set (every pair inside has NMI 1); `paraphrase` when the distinct sentences (by corpus equiv_class or text) are fewer than the unit floor of 3 or at least half the records duplicate another (near-duplicates share every subtree), `distinct` otherwise; n_distinct_sentences = the family's real support |
| consolidation | a passing non-contained pair is a proposal to treat the two subtrees as one feature (their conjunction); grouping across support sets and conditional MI are additions |

## The dial

| NMI >= | all pairs | within the ceiling | contained | same records | overlapping |
|---|---|---|---|---|---|
| 0.5 | 16614 | 16614 | 4071 | 7431 | 5112 |
| 0.6 | 14320 | 14320 | 3606 | 7431 | 3283 |
| 0.7 | 11227 | 11227 | 2875 | 7431 | 921 |
| 0.8 | 9990 | 9990 | 2543 | 7431 | 16 |
| 0.9 | 9945 | 9945 | 2514 | 7431 | 0 |
| 1.0 | 9945 | 9945 | 2514 | 7431 | 0 |

- at the gate (NMI >= 0.8): **9990 pairs pass**, 7447 of them not contained (7431 same records = **178 families** (160 paraphrase, 18 distinct), **16 overlapping**); 905 non-contained near misses at NMI >= 0.7 under the ceiling; 0 non-contained pairs at or above the gate but OVER the ceiling

## Same-records families (all units on one support set; kind = paraphrase | distinct)

| units | pairs | records (distinct sentences) | kind | e.g. | members (first 3) |
|---|---|---|---|---|---|
| 95 | 4023 | 4 (2 distinct; tierC-000045, tierC-000046, tierC-000291…) | paraphrase | The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . | `(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey) (Member $x0 company))` • `(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Member $x0 company))` • `(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Past $e0))` |
| 28 | 265 | 4 (2 distinct; tierC-000145, tierC-000146, tierC-000261…) | paraphrase | These algorithmically equivalent sequences can be defined in three random manners . | `(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define))` • `(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Theme $e0 $x1))` • `(And (Can $e0) (GroupOf $x0 sequence) (Manner $e0 $x1) (Theme $e0 $x0))` |
| 28 | 277 | 4 (2 distinct; tierC-000159, tierC-000160, tierC-000355…) | paraphrase | It endorsed the views of the Free Soil Party and the Republican Party . | `(And (Agent $e0 $x0) (Member $x1 view) (Past $e0) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x1 view) (Possession $x1 free_soil_party) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x1 view) (Possession $x1 republican_party) (Theme $e0 $x1))` |
| 26 | 237 | 4 (2 distinct; tierC-000277, tierC-000278, tierC-000301…) | paraphrase | A Wilson won an Emmy for his portrayal of James Woods . | `(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Past $e0))` • `(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Theme $e0 $x0))` • `(And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))` |
| 22 | 165 | 5 (1 distinct; tierA-000109, tierA-000110, tierA-000111…) | paraphrase | Two climbers abandon the north route. | `(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $x1 north_route) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $x1 north_route) (Theme $e0 $x1))` |
| 22 | 194 | 3 (1 distinct; tierA-000291, tierA-000293, tierA-000295) | paraphrase | An elder teaches the children a song. | `(And (Agent $e0 $x0) (GroupOf $x1 child) (Member $e0 teach) (Recipient $e0 $x1))` • `(And (Agent $e0 $x0) (GroupOf $x1 child) (Member $x0 elder) (Recipient $e0 $x1))` • `(And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1) (Theme $e0 $x2))` |
| 20 | 145 | 3 (2 distinct; tierC-000049, tierC-000050, tierC-000128) | paraphrase | He also appeared in music films and later in life , in comedic roles . | `(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Member $x0 person))` • `(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e0))` • `(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e1))` |
| 17 | 101 | 4 (1 distinct; tierA-000029, tierA-000030, tierA-000031…) | paraphrase | The mechanic repaired a seized gearbox. | `(And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 gearbox) (Patient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 seized) (Patient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0) (Patient $e0 $x1))` |
| 15 | 78 | 3 (1 distinct; tierA-000008, tierA-000012, tierA-000013) | paraphrase | The school bought a projector for the hall. | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school))` • `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall))` • `(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0))` |
| 15 | 86 | 3 (1 distinct; tierA-000022, tierA-000026, tierA-000028) | paraphrase | The pottery studio bought a second kiln. | `(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio))` • `(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0))` • `(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1))` |
| 15 | 77 | 3 (1 distinct; tierA-000261, tierA-000263, tierA-000265) | paraphrase | A trainer gives a recruit a whistle. | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Recipient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 recruit) (Recipient $e0 $x1))` |
| 15 | 77 | 3 (1 distinct; tierA-000281, tierA-000283, tierA-000284) | paraphrase | A potter teaches an apprentice glazing. | `(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Theme $e0 glazing))` • `(And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 apprentice) (Recipient $e0 $x1))` |
| 15 | 64 | 3 (1 distinct; tierA-000296, tierA-000298, tierA-000299) | paraphrase | A neighbour lends Ravi a ladder. | `(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 ravi))` • `(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1))` |
| 15 | 77 | 3 (1 distinct; tierA-000306, tierA-000308, tierA-000310) | paraphrase | The museum lends the gallery a painting. | `(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Recipient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 gallery) (Recipient $e0 $x1))` |
| 14 | 56 | 4 (2 distinct; tierC-000181, tierC-000182, tierC-000239…) | paraphrase | Together with Karen , Kristoffer had eight children . | `(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))` • `(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))` • `(And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))` |
| 13 | 54 | 5 (1 distinct; tierA-000008, tierA-000009, tierA-000010…) | paraphrase | The school bought a projector for the hall. | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Member $x1 hall))` • `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Past $e0))` • `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Theme $e0 $x2))` |
| 13 | 47 | 3 (1 distinct; tierA-000080, tierA-000081, tierA-000083) | paraphrase | A curator allows photography in the hall. | `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator) (Member $x1 hall))` • `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator) (Theme $e0 photography))` • `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 hall) (Theme $e0 photography))` |
| 13 | 45 | 3 (3 distinct; tierA-000223, tierA-000228, tierA-000233) | distinct | A storm causes the destruction of the greenhouse. | `(And (Agent $e0 $x0) (Member $e0 cause) (Member $e1 destroy) (Theme $e0 $e1))` • `(And (Agent $e0 $x0) (Member $e0 cause) (Patient $e1 $x1) (Theme $e0 $e1))` • `(And (Agent $e0 $x0) (Member $e1 destroy) (Patient $e1 $x1) (Theme $e0 $e1))` |
| 13 | 59 | 3 (1 distinct; tierA-000276, tierA-000278, tierA-000280) | paraphrase | A school gives the winner a medal. | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Recipient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 winner) (Recipient $e0 $x1))` |
| 13 | 50 | 3 (2 distinct; tierC-000145, tierC-000146, tierC-000261) | paraphrase | These algorithmically equivalent sequences can be defined in three random manners . | `(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random))` • `(And (Can $e0) (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))` • `(And (Can $e0) (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))` |
| 13 | 50 | 3 (2 distinct; tierC-000146, tierC-000261, tierC-000262) | paraphrase | These algorithmically equivalent sequences can be defined in three random ways . | `(And (Can $e0) (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0))` • `(And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))` • `(And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))` |
| 12 | 45 | 5 (1 distinct; tierA-000035, tierA-000036, tierA-000037…) | paraphrase | The electrician repaired the yard floodlight. | `(And (Agent $e0 $x0) (Inheritance yard_floodlight floodlight) (Member $x1 yard_floodlight) (Patient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x0 electrician) (Member $x1 yard_floodlight) (Patient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0) (Patient $e0 $x1))` |
| 12 | 55 | 3 (1 distinct; tierA-000201, tierA-000204, tierA-000206) | paraphrase | A board decides next year's budget. | `(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 budget) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 decide) (Possession $x1 next_year) (Theme $e0 $x1))` |
| 11 | 40 | 4 (1 distinct; tierA-000015, tierA-000016, tierA-000017…) | paraphrase | The chef bought several crates of lemons. | `(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x0 chef) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x1 crate) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Past $e0) (Theme $e0 $x1))` |
| 11 | 37 | 4 (1 distinct; tierA-000133, tierA-000134, tierA-000135…) | paraphrase | A diver discovers a wreck off the point. | `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Member $x1 point))` • `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Theme $e0 $x2))` • `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x2 wreck) (Theme $e0 $x2))` |
| 10 | 29 | 5 (1 distinct; tierA-000022, tierA-000023, tierA-000024…) | paraphrase | The pottery studio bought a second kiln. | `(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0))` • `(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Member $x1 kiln) (Theme $e0 $x1))` |
| 10 | 27 | 4 (1 distinct; tierA-000057, tierA-000058, tierA-000059…) | paraphrase | A hearing begins on Monday morning. | `(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)))` • `(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 morning))` • `(And (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning))` |
| 10 | 27 | 3 (1 distinct; tierA-000073, tierA-000074, tierA-000075) | paraphrase | A warden permits visitors on Sundays. | `(And (Agent $e0 $x0) (Member $x0 warden) (Theme $e0 visitor))` • `(And (Agent $e0 $x0) (Member $x0 warden) (Time $e0 (Weekday sunday)))` • `(And (Agent $e0 $x0) (Theme $e0 visitor) (Time $e0 (Weekday sunday)))` |
| 10 | 27 | 4 (1 distinct; tierA-000138, tierA-000139, tierA-000140…) | paraphrase | An intern discovers the missing file. | `(And (Agent $e0 $x0) (Member $x0 intern) (Member $x1 file) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x0 intern) (Member $x1 missing) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (Member $x1 file) (Member $x1 missing) (Theme $e0 $x1))` |
| 10 | 32 | 3 (1 distinct; tierA-000319, tierA-000321, tierA-000322) | paraphrase | A biologist works with a ranger on the survey. | `(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x0 biologist))` • `(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x1 ranger))` • `(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x2 survey))` |

## Overlapping passes — two subtrees short of identical records that are one feature (by NMI)

| NMI | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.86 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Agent $e0 $x0) (Member $e0 decide))` | `(And (Member $e0 decide) (Theme $e0 $x0))` | tierA-000185: A committee decides on a new roof. |
| 0.86 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Member $e0 lend) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 lend))` | tierA-000296: A neighbour lends Ravi a ladder. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))` | `(And (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))` | tierA-000022: The pottery studio bought a second kiln. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))` | `(And (Member $x0 kiln) (Theme $e0 $x0))` | tierA-000022: The pottery studio bought a second kiln. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(Inheritance pottery_studio studio)` | `(And (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))` | tierA-000022: The pottery studio bought a second kiln. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(Inheritance pottery_studio studio)` | `(And (Member $x0 kiln) (Theme $e0 $x0))` | tierA-000022: The pottery studio bought a second kiln. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1))` | tierA-000301: The depot lends the crew a generator. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(And (Beneficiary $e0 $x0) (Past $e0))` | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(And (Beneficiary $e0 $x0) (Past $e0))` | `(And (Beneficiary $e0 $x0) (Member $x0 hall))` | tierA-000008: The school bought a projector for the hall. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(And (Beneficiary $e0 $x0) (Past $e0))` | `(And (Beneficiary $e0 $x0) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(And (Cardinality $x0 <num>) (GroupOf $x0 forklift))` | `(And (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(And (Cardinality $x0 <num>) (GroupOf $x0 forklift))` | `(And (GroupOf $x0 forklift) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(Member $x0 chef)` | `(And (GroupOf $x0 lemon) (Member $x0 crate))` | tierA-000015: The chef bought several crates of lemons. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(Member $x0 chef)` | `(GroupOf $x0 lemon)` | tierA-000015: The chef bought several crates of lemons. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(Member $x0 pottery_studio)` | `(And (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))` | tierA-000022: The pottery studio bought a second kiln. |
| 0.81 | 0.86 | 7 / 6 / 6 | overlapping | `(Member $x0 pottery_studio)` | `(And (Member $x0 kiln) (Theme $e0 $x0))` | tierA-000022: The pottery studio bought a second kiln. |

## Non-contained near misses under the ceiling (NMI >= 0.7, below the gate)

| NMI | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 forklift) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 depot) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $x0 depot) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 depot) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 depot) (Past $e0))` | tierA-000001: The depot bought two forklifts. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Member $x1 hall))` | tierA-000008: The school bought a projector for the hall. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Past $e0))` | tierA-000008: The school bought a projector for the hall. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Theme $e0 $x2))` | tierA-000008: The school bought a projector for the hall. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Past $e0))` | tierA-000008: The school bought a projector for the hall. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Theme $e0 $x2))` | tierA-000008: The school bought a projector for the hall. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 school) (Past $e0) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Member $x1 projector) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 0.78 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))` | `(And (Beneficiary $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |

## Highest raw MI overall (the generic features: high raw MI, loose association)

| NMI | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.53 | 0.69 | 247 / 171 / 171 | contained | `(Theme $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.39 | 0.57 | 301 / 171 / 171 | contained | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.31 | 0.44 | 176 / 77 / 77 | contained | `(Past $e0)` | `(And (Agent $e0 $x0) (Past $e0))` | tierA-000001: The depot bought two forklifts. |
| 0.32 | 0.43 | 122 / 52 / 52 | contained | `(Patient $e0 $x0)` | `(And (Past $e0) (Patient $e0 $x0))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.70 | 0.78 | 37 / 29 / 29 | contained | `(Recipient $e0 $x0)` | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | tierA-000004: Two forklifts were sold to the depot. |
| 0.30 | 0.41 | 122 / 50 / 50 | contained | `(Patient $e0 $x0)` | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.67 | 0.76 | 37 / 28 / 28 | contained | `(Recipient $e0 $x0)` | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` | tierA-000208: A clerk gives an answer to the query. |
| 0.45 | 0.56 | 63 / 35 / 35 | contained | `(And (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.79 | 0.86 | 28 / 24 / 24 | contained | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000208: A clerk gives an answer to the query. |
| 0.76 | 0.83 | 29 / 24 / 24 | contained | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000208: A clerk gives an answer to the query. |

