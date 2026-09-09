# §4.3.3 Mutual-Information Grouping — ADDITION: normalised-MI gate

> "We could construct a binary feature matrix indicating which subtrees occur in which sentences, then compute pairwise mutual information between features. Pairs with very high MI but moderate individual support almost always co-occur, so they are excellent candidates for consolidation into a single feature." — FUSE-NF §4.3.3

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| features | the 1454 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees) |
| matrix | binary presence, 2302 records x 1454 units, from each unit's supporting ids (687 records carry no unit and are all-zero rows); 1056331 pairs, 36399 with any co-occurrence |
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
| 0.5 | 5507 | 5507 | 1391 | 1667 | 2449 |
| 0.6 | 4823 | 4823 | 1188 | 1667 | 1968 |
| 0.7 | 4568 | 4568 | 1070 | 1667 | 1831 |
| 0.8 | 2448 | 2448 | 770 | 1667 | 11 |
| 0.9 | 2413 | 2413 | 743 | 1667 | 3 |
| 1.0 | 2407 | 2407 | 740 | 1667 | 0 |

- at the gate (NMI >= 0.8): **2448 pairs pass**, 1678 of them not contained (1667 same records = **57 families** (24 paraphrase, 33 distinct), **11 overlapping**); 1820 non-contained near misses at NMI >= 0.7 under the ceiling; 0 non-contained pairs at or above the gate but OVER the ceiling

## Same-records families (all units on one support set; kind = paraphrase | distinct)

| units | pairs | records (distinct sentences) | kind | e.g. | members (first 3) |
|---|---|---|---|---|---|
| 41 | 672 | 4 (2 distinct; tierC-000159, tierC-000160, tierC-000355…) | paraphrase | It endorsed the views of the Free Soil Party and the Republican Party . | `(And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))` • `(And (Agent $e0 $x0) (GroupOf $x1 view) (Possession $x1 free_soil_party) (Theme $e0 $x1))` |
| 30 | 351 | 4 (2 distinct; tierC-000045, tierC-000046, tierC-000291…) | paraphrase | The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . | `(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Member $x0 company))` • `(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Past $e0))` • `(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Patient $e0 $x1))` |
| 22 | 169 | 3 (2 distinct; tierC-000045, tierC-000291, tierC-000292) | paraphrase | The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . | `(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Member $x0 company))` • `(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Past $e0))` • `(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Patient $e0 $x1))` |
| 20 | 163 | 3 (2 distinct; tierC-000159, tierC-000160, tierC-000356) | paraphrase | It endorsed the views of the Free Soil Party and the Republican Party . | `(And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))` • `(And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1) (Theme $e0 $x2))` • `(And (Agent $e0 $x0) (Possession $x1 free_soil_party) (Theme $e0 $x1) (Theme $e0 $x2))` |
| 13 | 45 | 4 (2 distinct; tierC-000181, tierC-000182, tierC-000239…) | paraphrase | Together with Karen , Kristoffer had eight children . | `(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))` • `(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))` • `(And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))` |
| 12 | 58 | 3 (2 distinct; tierB-000942, tierC-000025, tierC-000026) | paraphrase | The cook took the roller and started rolling the pizza dough on the peel. | `(And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))` • `(And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))` • `(And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))` |
| 12 | 40 | 4 (2 distinct; tierC-000277, tierC-000278, tierC-000301…) | paraphrase | A Wilson won an Emmy for his portrayal of James Woods . | `(And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))` • `(And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))` • `(And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))` |
| 8 | 19 | 5 (4 distinct; tierB-000485, tierB-001052, tierB-001138…) | distinct | The rebels began distributing food and clothing from the storehouse to the locals. | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` • `(And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))` • `(And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))` |
| 8 | 19 | 4 (4 distinct; tierB-000738, tierB-000942, tierB-001169…) | distinct | Both girls started to cry. | `(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` • `(And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))` • `(And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))` |
| 7 | 17 | 4 (3 distinct; tierB-000748, tierB-001594, tierC-000241…) | distinct | The weather is getting worse. | `(And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))` • `(And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))` • `(And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))` |
| 7 | 14 | 3 (2 distinct; tierC-000277, tierC-000278, tierC-000301) | paraphrase | A Wilson won an Emmy for his portrayal of James Woods . | `(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Past $e0))` • `(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Theme $e0 $x0))` • `(And (For $e0 $e1) (Member $e1 portray) (Member $x0 emmy) (Theme $e0 $x0))` |
| 6 | 11 | 3 (3 distinct; tierB-000370, tierB-000748, tierB-001658) | distinct | Everything is getting more expensive. Only the excuses are getting cheaper. | `(And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))` • `(And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))` • `(And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))` |
| 6 | 9 | 3 (2 distinct; tierB-001146, tierC-000047, tierC-000048) | paraphrase | The giraffes spent another day without finding food. | `(And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))` • `(And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))` • `(And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))` |
| 6 | 12 | 3 (2 distinct; tierB-001594, tierC-000241, tierC-000242) | paraphrase | Lorenzo made matters much worse. | `(And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))` • `(And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))` • `(And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))` |
| 6 | 9 | 3 (2 distinct; tierB-001962, tierC-000089, tierC-000090) | paraphrase | This book had been written by someone famous. | `(And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Past $e0))` • `(And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Patient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 write) (Past $e0) (Patient $e0 $x1))` |
| 5 | 6 | 3 (2 distinct; tierC-000257, tierC-000353, tierC-000354) | paraphrase | His religion was directly influenced by the international balance of political powers . | `(And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))` • `(And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))` • `(And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))` |
| 4 | 3 | 3 (3 distinct; tierB-000004, tierB-000425, tierB-000747) | distinct | Tom leaves the lights on all day. | `(And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))` • `(And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))` • `(And (Member $e0 leave) (Patient $e0 $x0))` |
| 4 | 4 | 3 (2 distinct; tierB-000258, tierC-000123, tierC-000124) | paraphrase | Thousands gathered to watch the event. | `(And (Agent $e0 $x0) (Past $e0) (Theme $e1 $x1) (To $e0 $e1))` • `(And (Agent $e0 $x0) (Past $e1) (Theme $e0 $x1) (To $e1 $e0))` • `(And (Agent $e0 $x0) (Theme $e1 $x1) (To $e0 $e1))` |
| 4 | 6 | 8 (3 distinct; tierC-000317, tierC-000318, tierC-000319…) | paraphrase | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | `(ConditionalProperty bicycle permitted footpath)` • `(ConditionalProperty pedestrian permitted footpath)` • `(Inheritance bicycle permitted) ~NEG` |
| 3 | 2 | 4 (3 distinct; tierC-000050, tierC-000128, tierC-000259…) | distinct | He also appeared in musical films and later in life , in comedic roles . | `(And (Also appear $e0) (Past $e0))` • `(And (Member $e0 appear) (Past $e0))` • `(Also appear $e0)` |
| 3 | 2 | 3 (2 distinct; tierC-000217, tierC-000218, tierC-000245) | paraphrase | The Lessos - Kenya border section is jointly funded by the government of Uganda and JICA . | `(And (Agent $e0 jica) (Member $e0 fund))` • `(Inheritance border_section section)` • `(Member $e0 fund)` |
| 2 | 1 | 3 (3 distinct; tierB-000030, tierB-001515, tierB-001873) | distinct | Rima and Skura stopped crying. | `(And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))` • `(And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))` |
| 2 | 1 | 9 (8 distinct; tierB-000075, tierB-000173, tierB-000240…) | distinct | Mark and Jessica began hanging out often. | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` • `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` |
| 2 | 1 | 3 (3 distinct; tierB-000117, tierB-000173, tierB-000827) | distinct | David was trying to reach Amanda. | `(And (Agent $e0 david) (Ongoing $e0))` • `(And (Agent $e0 david) (Past $e0))` |
| 2 | 1 | 5 (3 distinct; tierB-000145, tierC-000277, tierC-000278…) | distinct | The horse that won the race was owned by Mr Johnson. | `(And (Member $e0 win) (Past $e0))` • `(And (Member $e0 win) (Theme $e0 $x0))` |
| 2 | 1 | 5 (4 distinct; tierB-000258, tierB-001035, tierB-001867…) | distinct | Thousands gathered to watch the event. | `(And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))` • `(And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))` |
| 2 | 1 | 8 (6 distinct; tierB-000258, tierB-001035, tierB-001867…) | distinct | Thousands gathered to watch the event. | `(And (Agent $e0 $x0) (To $e0 $e1))` • `(And (Agent $e0 $x0) (To $e1 $e0))` |
| 2 | 1 | 3 (3 distinct; tierB-000338, tierB-000616, tierB-001551) | distinct | Someone ate all the cookies from the cookie jar. | `(And (Member $e0 eat) (Past $e0))` • `(And (Member $e0 eat) (Patient $e0 $x0))` |
| 2 | 1 | 3 (3 distinct; tierB-000383, tierB-000482, tierB-001027) | distinct | The horse got stuck in deep snow. | `(And (Member $e0 stick) (Past $e0))` • `(And (Member $e0 stick) (Patient $e0 $x0))` |
| 2 | 1 | 3 (3 distinct; tierB-000387, tierB-001534, tierB-001963) | distinct | Not a few students came to the concert last Saturday. | `(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))` • `(And (Goal $e0 $x0) (Member $e0 come) (Past $e0))` |

## Overlapping passes — two subtrees short of identical records that are one feature (by NMI)

| NMI | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.94 | 0.96 | 28 / 27 / 27 | overlapping | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000004: Tom leaves the lights on all day. |
| 0.94 | 0.96 | 27 / 26 / 26 | overlapping | `(And (Holder $e0 $x0) (Member $e0 have))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | tierB-000142: This sentence has various meanings. |
| 0.91 | 0.94 | 17 / 16 / 16 | overlapping | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000362: The trail has gone cold. |
| 0.88 | 0.92 | 12 / 11 / 11 | overlapping | `(And (Before $e0 $e1) (Past $e1))` | `(And (Before $e0 $e1) (Past $e0))` | tierB-000412: Ivan killed several people and then escaped. |
| 0.87 | 0.91 | 11 / 10 / 10 | overlapping | `(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.86 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.86 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Member $e0 begin) (Past $e0))` | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 0.86 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Member $e0 begin) (Past $e0))` | `(And (Member $e0 begin) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 0.84 | 0.88 | 8 / 7 / 7 | overlapping | `(And (Member $e0 produce) (Patient $e0 $x0))` | `(And (Member $e0 produce) (Past $e0))` | tierB-000208: The thin layer of oil at the top of the soup produced a mesmerizing sheen. |
| 0.84 | 0.88 | 8 / 7 / 7 | overlapping | `(And (Member $e0 write) (Patient $e0 $x0))` | `(And (Member $e0 write) (Past $e0))` | tierB-001962: This book had been written by someone famous. |
| 0.82 | 0.86 | 7 / 6 / 6 | overlapping | `(And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))` | tierC-000017: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner . |

## Non-contained near misses under the ceiling (NMI >= 0.7, below the gate)

| NMI | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.79 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Agent $e0 $x0) (Member $e0 follow))` | `(And (Member $e0 follow) (Theme $e0 $x0))` | tierB-000584: This road follows the shoreline for the next thirty kilometers. |
| 0.79 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Member $e0 capture) (Past $e0))` | `(And (Member $e0 capture) (Theme $e0 $x0))` | tierB-000215: Spain captured many Algerian cities in the 16th century. |
| 0.79 | 0.83 | 6 / 5 / 5 | overlapping | `(And (Member $e0 receive) (Past $e0))` | `(And (Member $e0 receive) (Theme $e0 $x0))` | tierB-000962: At the winter festival, Beth received an award for dancing the best. |
| 0.77 | 0.82 | 11 / 9 / 9 | overlapping | `(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Member $x0 company))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Past $e0))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Patient $e0 $x1))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Past $e0))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Patient $e0 $x1))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 build) (Member $x1 hotel) (Patient $e0 $x1))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 company) (Member $x1 hotel) (Patient $e0 $x1))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 hotel) (Past $e0) (Patient $e0 $x1))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Member $e0 build) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |
| 0.75 | 0.80 | 5 / 4 / 4 | overlapping | `(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company))` | tierC-000045: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan . |

## Highest raw MI overall (the generic features: high raw MI, loose association)

| NMI | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.47 | 0.60 | 385 / 232 / 232 | contained | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Past $e0))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.48 | 0.60 | 323 / 195 / 195 | contained | `(Patient $e0 $x0)` | `(And (Past $e0) (Patient $e0 $x0))` | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.38 | 0.49 | 316 / 154 / 154 | contained | `(Theme $e0 $x0)` | `(And (Past $e0) (Theme $e0 $x0))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.47 | 0.56 | 111 / 62 / 62 | contained | `(Location $e0 $x0)` | `(And (Location $e0 $x0) (Past $e0))` | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 0.44 | 0.53 | 114 / 60 / 60 | contained | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.61 | 0.69 | 74 / 51 / 51 | contained | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 0.89 | 0.93 | 43 / 40 / 40 | contained | `(Member $e0 have)` | `(And (Member $e0 have) (Theme $e0 $x0))` | tierB-000066: Having close friends is more important than being popular. |
| 0.56 | 0.64 | 72 / 46 / 46 | contained | `(Theme $e0 $e1)` | `(And (Past $e0) (Theme $e0 $e1))` | tierB-000030: Rima and Skura stopped crying. |
| 0.31 | 0.39 | 154 / 60 / 60 | contained | `(And (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.31 | 0.39 | 149 / 58 / 58 | contained | `(Ongoing $e0)` | `(And (Agent $e0 $x0) (Ongoing $e0))` | tierB-000028: The nurse is dressing the wound. |

