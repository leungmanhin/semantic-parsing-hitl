# §4.3.3 Mutual-Information Grouping — FAITHFUL arm (paper as written)

> "We could construct a binary feature matrix indicating which subtrees occur in which sentences, then compute pairwise mutual information between features. Pairs with very high MI but moderate individual support almost always co-occur, so they are excellent candidates for consolidation into a single feature." — FUSE-NF §4.3.3

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| features | the 1454 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees) |
| matrix | binary presence, 2302 records x 1454 units, from each unit's supporting ids (687 records carry no unit and are all-zero rows); 1056331 pairs, 36399 with any co-occurrence |
| MI | exact pairwise mutual information of the two binary presence variables, in bits |
| 'very high MI' | raw MI >= 0.0298 bits = the MI of a perfect co-occurrence over 7 of the 2302 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 1056331 pairs is ~0.0053 bits); near-miss value 0.0223 (= 5 records); pairs recorded from 0.0144 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01] |
| 'moderate individual support' | both units' support <= 27 records = the 97th percentile of unit support (1.2% of the records; percentiles 50/90/95/99 = 4/9/16/66); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself |
| calibration | the ceiling x threshold table below checks the paper's claim (median doc-Jaccard of the passes); the claim alone would also accept a lower threshold where perfectly co-occurring support-3..5 pairs (paraphrase families) dominate — the record-count anchor on the threshold is what keeps them out |
| 'almost always co-occur' | the paper's consequence, shown as the doc-Jaccard column (not gated) |
| containment | tagged, not gated: a CONTAINED pair (one unit's atoms embed in the other's under a variable renaming) restates §4.3.1 subsumption; SAME RECORDS = identical support sets, not contained; OVERLAPPING = the rest |
| families | same-records passes rendered per support set (every pair inside has NMI 1); `paraphrase` when the distinct sentences (by corpus equiv_class or text) are fewer than the unit floor of 3 or at least half the records duplicate another (near-duplicates share every subtree), `distinct` otherwise; n_distinct_sentences = the family's real support |
| consolidation | a passing non-contained pair is a proposal to treat the two subtrees as one feature (their conjunction); grouping across support sets and conditional MI are additions |

## Calibration: ceiling x threshold (cell = passes / not contained / median Jaccard / share with Jaccard >= 0.8)

| ceiling | MI >= 0.1 | MI >= 0.05 | MI >= 0.04 | MI >= 0.03 | MI >= 0.02 | MI >= 0.015 | MI >= 0.01 |
|---|---|---|---|---|---|---|---|
| 10% (230) | 8 / 0 / 0.60 / 12% | 47 / 10 / 0.63 / 21% | 80 / 17 / 0.60 / 20% | 171 / 41 / 0.64 / 30% | 530 / 136 / 0.63 / 33% | 2866 / 1757 / 1.00 / 65% | 7802 / 6599 / 0.75 / 34% |
| 5% (115) | 6 / 0 / 0.66 / 17% | 39 / 8 / 0.65 / 26% | 68 / 14 / 0.63 / 24% | 157 / 37 / 0.66 / 33% | 505 / 129 / 0.66 / 34% | 2818 / 1742 / 1.00 / 67% | 7715 / 6545 / 0.75 / 35% |
| 3% (69) | 2 / 0 / 0.83 / 50% | 30 / 8 / 0.67 / 33% | 56 / 14 / 0.65 / 29% | 140 / 37 / 0.69 / 37% | 479 / 129 / 0.67 / 36% | 2762 / 1738 / 1.00 / 68% | 7619 / 6501 / 0.75 / 35% |
| 2% (46) | 1 / 0 / 0.93 / 100% | 28 / 8 / 0.67 / 36% | 50 / 14 / 0.66 / 32% | 131 / 37 / 0.75 / 40% | 456 / 125 / 0.69 / 38% | 2726 / 1732 / 1.00 / 69% | 7535 / 6450 / 0.75 / 35% |
| 1% (23) | 0 | 2 / 1 / 0.97 / 100% | 12 / 3 / 0.92 / 67% | 75 / 19 / 0.86 / 59% | 341 / 87 / 0.78 / 48% | 2562 / 1671 / 1.00 / 73% | 7122 / 6153 / 0.75 / 37% |

## The dial at the adopted ceiling (1% = 27 records)

| MI >= | all pairs | within the ceiling | contained | same records | overlapping |
|---|---|---|---|---|---|
| 0.1 | 16 | 0 | 0 | 0 | 0 |
| 0.05 | 68 | 12 | 10 | 0 | 2 |
| 0.04 | 106 | 25 | 20 | 0 | 5 |
| 0.03 | 211 | 98 | 72 | 9 | 17 |
| 0.02 | 587 | 394 | 286 | 34 | 74 |
| 0.015 | 2945 | 2632 | 931 | 1189 | 512 |
| 0.01 | 7947 | 7320 | 1020 | 1189 | 761 |

- at the gate (MI >= 0.0298, both supports <= 27): **104 pairs pass**, 27 of them not contained (10 same records = **5 families** (1 paraphrase, 4 distinct), **17 overlapping**); 64 non-contained near misses at MI >= 0.0223 under the ceiling; 25 non-contained pairs at or above the gate but OVER the ceiling

## Same-records families (all units on one support set; kind = paraphrase | distinct)

| units | pairs | records (distinct sentences) | kind | e.g. | members (first 3) |
|---|---|---|---|---|---|
| 4 | 6 | 8 (3 distinct; tierC-000317, tierC-000318, tierC-000319…) | paraphrase | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | `(ConditionalProperty bicycle permitted footpath)` • `(ConditionalProperty pedestrian permitted footpath)` • `(Inheritance bicycle permitted) ~NEG` |
| 2 | 1 | 9 (8 distinct; tierB-000075, tierB-000173, tierB-000240…) | distinct | Mark and Jessica began hanging out often. | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` • `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` |
| 2 | 1 | 8 (6 distinct; tierB-000258, tierB-001035, tierB-001867…) | distinct | Thousands gathered to watch the event. | `(And (Agent $e0 $x0) (To $e0 $e1))` • `(And (Agent $e0 $x0) (To $e1 $e0))` |
| 2 | 1 | 9 (8 distinct; tierB-000485, tierB-000738, tierB-000942…) | distinct | The rebels began distributing food and clothing from the storehouse to the locals. | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` • `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` |
| 2 | 1 | 7 (6 distinct; tierB-001582, tierB-001817, tierC-000001…) | distinct | The earth became red with blood. | `(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))` • `(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))` |

## Overlapping passes — two subtrees short of identical records that are one feature (by MI)

| MI bits | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.0866 | 0.96 | 27 / 26 / 26 | overlapping | `(And (Holder $e0 $x0) (Member $e0 have))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | tierB-000142: This sentence has various meanings. |
| 0.0574 | 0.94 | 17 / 16 / 16 | overlapping | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000362: The trail has gone cold. |
| 0.0460 | 0.57 | 27 / 17 / 16 | overlapping | `(And (Patient $e0 $x0) (Result $e0 $e1))` | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | tierB-000362: The trail has gone cold. |
| 0.0416 | 0.92 | 12 / 11 / 11 | overlapping | `(And (Before $e0 $e1) (Past $e1))` | `(And (Before $e0 $e1) (Past $e0))` | tierB-000412: Ivan killed several people and then escaped. |
| 0.0407 | 0.61 | 19 / 18 / 14 | overlapping | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | tierB-000470: The crocodile tried to pull Boris into the river. |
| 0.0388 | 0.46 | 27 / 24 / 16 | overlapping | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | tierB-000470: The crocodile tried to pull Boris into the river. |
| 0.0382 | 0.91 | 11 / 10 / 10 | overlapping | `(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0370 | 0.42 | 27 / 27 / 16 | overlapping | `(And (Past $e0) (Result $e0 $e1))` | `(And (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000362: The trail has gone cold. |
| 0.0366 | 0.50 | 24 / 12 / 12 | overlapping | `(And (Ongoing $e0) (Theme $e1 $e0))` | `(And (Member $e0 start) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |
| 0.0365 | 0.48 | 24 / 19 / 14 | overlapping | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` | tierB-000470: The crocodile tried to pull Boris into the river. |
| 0.0358 | 0.45 | 27 / 18 / 14 | overlapping | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | tierB-000470: The crocodile tried to pull Boris into the river. |
| 0.0349 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0349 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Member $e0 begin) (Past $e0))` | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0349 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Member $e0 begin) (Past $e0))` | `(And (Member $e0 begin) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0336 | 0.82 | 11 / 9 / 9 | overlapping | `(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0327 | 0.75 | 12 / 9 / 9 | overlapping | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |
| 0.0319 | 0.69 | 13 / 9 / 9 | overlapping | `(And (Member $e0 build) (Patient $e0 $x0))` | `(And (Member $e0 build) (Past $e0))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |

## Non-contained near misses under the ceiling (MI >= 0.0223, below the gate)

| MI bits | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.0292 | 0.37 | 27 / 10 / 10 | overlapping | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0291 | 0.50 | 18 / 9 / 9 | overlapping | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0287 | 0.47 | 19 / 9 / 9 | overlapping | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0287 | 0.47 | 19 / 9 / 9 | overlapping | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0287 | 0.47 | 19 / 9 / 9 | overlapping | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |
| 0.0287 | 0.47 | 19 / 9 / 9 | overlapping | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | `(And (Member $e0 begin) (Theme $e0 $e1))` | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0287 | 0.47 | 19 / 9 / 9 | overlapping | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0280 | 0.40 | 24 / 11 / 10 | overlapping | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0280 | 0.62 | 13 / 8 / 8 | overlapping | `(And (Member $e0 build) (Patient $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 build))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 0.0279 | 0.88 | 8 / 7 / 7 | overlapping | `(And (Member $e0 produce) (Patient $e0 $x0))` | `(And (Member $e0 produce) (Past $e0))` | tierB-000208: The thin layer of oil at the top of the soup produced a mesmerizing sheen. |
| 0.0279 | 0.88 | 8 / 7 / 7 | overlapping | `(And (Member $e0 write) (Patient $e0 $x0))` | `(And (Member $e0 write) (Past $e0))` | tierB-001962: This book had been written by someone famous. |
| 0.0277 | 0.36 | 24 / 21 / 12 | overlapping | `(And (Ongoing $e0) (Theme $e1 $e0))` | `(Member $e0 start)` | tierB-000199: Karl started vomitting in disgust. |
| 0.0270 | 0.47 | 18 / 10 / 9 | overlapping | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0270 | 0.53 | 14 / 12 / 9 | overlapping | `(And (Member $e0 start) (Past $e0))` | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |
| 0.0270 | 0.53 | 14 / 12 / 9 | overlapping | `(And (Member $e0 start) (Past $e0))` | `(And (Member $e0 start) (Theme $e0 $e1))` | tierB-000199: Karl started vomitting in disgust. |

## Non-contained pairs at or above the gate but OVER the ceiling (support > 27; the paper's clause excludes them)

| MI bits | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.0893 | 0.96 | 28 / 27 / 27 | overlapping | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000004: Tom leaves the lights on all day. |
| 0.0743 | 0.63 | 43 / 27 / 27 | overlapping | `(Member $e0 have)` | `(Holder $e0 $x0)` | tierB-000142: This sentence has various meanings. |
| 0.0730 | 0.65 | 40 / 26 / 26 | overlapping | `(And (Member $e0 have) (Theme $e0 $x0))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | tierB-000142: This sentence has various meanings. |
| 0.0712 | 0.60 | 43 / 26 / 26 | overlapping | `(Member $e0 have)` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | tierB-000142: This sentence has various meanings. |
| 0.0704 | 0.63 | 40 / 27 / 26 | overlapping | `(And (Member $e0 have) (Theme $e0 $x0))` | `(And (Holder $e0 $x0) (Member $e0 have))` | tierB-000142: This sentence has various meanings. |
| 0.0704 | 0.63 | 40 / 27 / 26 | overlapping | `(And (Member $e0 have) (Theme $e0 $x0))` | `(Holder $e0 $x0)` | tierB-000142: This sentence has various meanings. |
| 0.0669 | 0.29 | 703 / 385 / 243 | overlapping | `(Past $e0)` | `(Agent $e0 $x0)` | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.0638 | 0.29 | 154 / 114 / 61 | overlapping | `(And (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.0599 | 0.22 | 232 / 74 / 56 | overlapping | `(And (Agent $e0 $x0) (Past $e0))` | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 0.0563 | 0.25 | 703 / 323 / 206 | overlapping | `(Past $e0)` | `(Patient $e0 $x0)` | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.0554 | 0.23 | 195 / 74 / 51 | overlapping | `(And (Past $e0) (Patient $e0 $x0))` | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 0.0494 | 0.22 | 232 / 114 / 63 | overlapping | `(And (Agent $e0 $x0) (Past $e0))` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.0478 | 0.57 | 28 / 16 / 16 | overlapping | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000362: The trail has gone cold. |
| 0.0477 | 0.18 | 150 / 27 / 27 | overlapping | `(Experiencer $e0 $x0)` | `(And (Patient $e0 $x0) (Result $e0 $e1))` | tierB-000004: Tom leaves the lights on all day. |
| 0.0446 | 0.13 | 316 / 43 / 40 | overlapping | `(Theme $e0 $x0)` | `(Member $e0 have)` | tierB-000066: Having close friends is more important than being popular. |

## Highest raw MI overall (the generic features: high raw MI, loose association)

| MI bits | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.3093 | 0.60 | 385 / 232 / 232 | contained | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Past $e0))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.2826 | 0.60 | 323 / 195 / 195 | contained | `(Patient $e0 $x0)` | `(And (Past $e0) (Patient $e0 $x0))` | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.2170 | 0.49 | 316 / 154 / 154 | contained | `(Theme $e0 $x0)` | `(And (Past $e0) (Theme $e0 $x0))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1921 | 0.33 | 703 / 232 / 232 | contained | `(Past $e0)` | `(And (Agent $e0 $x0) (Past $e0))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1584 | 0.28 | 703 / 195 / 195 | contained | `(Past $e0)` | `(And (Past $e0) (Patient $e0 $x0))` | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.1549 | 0.36 | 316 / 114 / 114 | contained | `(Theme $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1378 | 0.30 | 385 / 114 / 114 | contained | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1310 | 0.56 | 111 / 62 / 62 | contained | `(Location $e0 $x0)` | `(And (Location $e0 $x0) (Past $e0))` | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 0.1248 | 0.53 | 114 / 60 / 60 | contained | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1246 | 0.69 | 74 / 51 / 51 | contained | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |

