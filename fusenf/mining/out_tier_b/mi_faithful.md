# §4.3.3 Mutual-Information Grouping — FAITHFUL arm (paper as written)

> "We could construct a binary feature matrix indicating which subtrees occur in which sentences, then compute pairwise mutual information between features. Pairs with very high MI but moderate individual support almost always co-occur, so they are excellent candidates for consolidation into a single feature." — FUSE-NF §4.3.3

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| features | the 945 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees) |
| matrix | binary presence, 1950 records x 945 units, from each unit's supporting ids (622 records carry no unit and are all-zero rows); 446040 pairs, 19235 with any co-occurrence |
| MI | exact pairwise mutual information of the two binary presence variables, in bits, raw |
| 'very high MI' | raw MI >= 0.0343 bits = the MI of a perfect co-occurrence over 7 of the 1950 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 446040 pairs is ~0.0059 bits); near-miss value 0.0258 (= 5 records); pairs recorded from 0.0166 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01] |
| 'moderate individual support' | both units' support <= 29 records = the 97th percentile of unit support (1.5% of the records; percentiles 50/90/95/99 = 4/11/19/91); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself |
| calibration | the ceiling x threshold table checks the paper's claim (median doc-Jaccard of the passes); the claim alone would also accept a lower threshold where perfectly co-occurring support-3..5 pairs (near-duplicate records) dominate — the record-count anchor on the threshold is what keeps them out |
| 'almost always co-occur' | the paper's consequence, shown as the doc-Jaccard column (not gated) |
| shared records | n_both = records containing both units; the distinct-sentence count beside it (by corpus equiv_class or text) exposes near-duplicate records, which share every subtree by construction |
| part-of | when one unit's atoms embed in the other's (a variable renaming), the pair restates §4.3.1 subsumption and its rule is the larger unit's own pack; flagged in the record, not gated |
| consolidation | for every pass: the two units' variables are aligned through the shared records (each unit matched in each record under the miner's abstraction; the correspondence holding in most records is taken and the count shown), the aligned conjunction is the merged feature, and the rule is (Implication (And <merged>) (Mn<Name> <vars>)) — naming provisional; units that never share a skolem give a co-occurrence conjunction with disjoint variables |

## Calibration: ceiling x threshold (cell = passes / median Jaccard / share with Jaccard >= 0.8)

| ceiling | MI >= 0.1 | MI >= 0.05 | MI >= 0.04 | MI >= 0.03 | MI >= 0.02 | MI >= 0.015 | MI >= 0.01 |
|---|---|---|---|---|---|---|---|
| 10% (195) | 8 / 0.64 / 12% | 50 / 0.66 / 24% | 83 / 0.57 / 18% | 169 / 0.61 / 24% | 455 / 0.56 / 29% | 962 / 0.56 / 35% | 1887 / 0.40 / 18% |
| 5% (97) | 6 / 0.66 / 17% | 39 / 0.68 / 31% | 67 / 0.64 / 22% | 149 / 0.64 / 28% | 420 / 0.63 / 32% | 909 / 0.57 / 37% | 1787 / 0.43 / 19% |
| 3% (58) | 2 / 0.86 / 50% | 30 / 0.72 / 40% | 55 / 0.66 / 27% | 132 / 0.66 / 31% | 391 / 0.64 / 34% | 861 / 0.62 / 39% | 1699 / 0.43 / 20% |
| 2% (39) | 1 / 0.94 / 100% | 28 / 0.72 / 43% | 48 / 0.67 / 31% | 121 / 0.69 / 34% | 362 / 0.70 / 37% | 812 / 0.67 / 41% | 1594 / 0.44 / 21% |
| 1% (19) | 0 | 4 / 0.87 / 75% | 12 / 0.77 / 50% | 66 / 0.78 / 48% | 271 / 0.75 / 46% | 667 / 0.75 / 49% | 1314 / 0.53 / 25% |

## The dial at the adopted ceiling (29 records)

| MI >= | all pairs | within the ceiling | of which part-of pairs |
|---|---|---|---|
| 0.1 | 16 | 0 | 0 |
| 0.05 | 69 | 15 | 12 |
| 0.04 | 106 | 33 | 25 |
| 0.03 | 204 | 100 | 75 |
| 0.02 | 502 | 328 | 236 |
| 0.015 | 1023 | 757 | 353 |
| 0.01 | 1998 | 1508 | 353 |

- at the gate (MI >= 0.0343, both supports <= 29): **60 pairs pass** (45 part-of pairs, 15 genuine); 83 near misses under the ceiling at MI >= 0.0258; 90 pairs at or above the threshold but over the ceiling

## Passes (by MI)

| MI bits | Jaccard | records A / B / shared (distinct) | A | B | note | e.g. | merged rule |
|---|---|---|---|---|---|---|---|
| 0.0925 | 1.00 | 23 / 23 / 23 (23) | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Member $e0 have))` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0925 | 1.00 | 23 / 23 / 23 (23) | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0925 | 1.00 | 23 / 23 / 23 (23) | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | `(Holder $e0 $x0)` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0925 | 1.00 | 23 / 23 / 23 (23) | `(And (Holder $e0 $x0) (Member $e0 have))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` |  | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0925 | 1.00 | 23 / 23 / 23 (23) | `(And (Holder $e0 $x0) (Member $e0 have))` | `(Holder $e0 $x0)` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have)) (MnHolder_Have $e0 $x0))` |
| 0.0925 | 1.00 | 23 / 23 / 23 (23) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | `(Holder $e0 $x0)` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Theme $e0 $x1)) (MnHolder_Theme $e0 $x0 $x1))` |
| 0.0861 | 0.96 | 23 / 22 / 22 (22) | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Patient $e0 $x0) (Result $e0 $e1))` |  | tierB-000004: Tom leaves the lights on all day. | `(Implication (And (Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Patient_ResultEv $e0 $e1 $x0))` |
| 0.0634 | 0.77 | 22 / 17 / 17 (17) | `(And (Ongoing $e0) (Theme $e1 $e0))` | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | B is part of A: the rule is A's own pack | tierB-000075: Mark and Jessica began hanging out often. | `(Implication (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing $e1 $e0))` |
| 0.0612 | 0.80 | 20 / 16 / 16 (16) | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | B is part of A: the rule is A's own pack | tierB-000166: Yair Stern made two attempts to collaborate with the Nazis. | `(Implication (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent $e1 $e0 $x0))` |
| 0.0573 | 0.67 | 24 / 16 / 16 (16) | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000470: The crocodile tried to pull Boris into the river. | `(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEv $e0 $e1 $x0))` |
| 0.0549 | 0.68 | 22 / 15 / 15 (15) | `(Member $e0 make)` | `(And (Member $e0 make) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000025: Elias can always make a difference. | `(Implication (And (Member $e0 make) (Patient $e0 $x0)) (MnMake_Patient $e0 $x0))` |
| 0.0540 | 1.00 | 12 / 12 / 12 (12) | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 start) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000199: Karl started vomitting in disgust. | `(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing_1 $e0 $e1))` |
| 0.0534 | 0.74 | 19 / 14 / 14 (14) | `(Member $e0 start)` | `(And (Member $e0 start) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000043: Skura has started high school. | `(Implication (And (Member $e0 start) (Past $e0)) (MnStart_Past $e0))` |
| 0.0521 | 0.81 | 16 / 13 / 13 (13) | `(And (Agent $e0 $x0) (Goal $e0 $x1))` | `(And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000324: A few customers have just walked into the store. | `(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0)) (MnAgent_Goal_Past $e0 $x0 $x1))` |
| 0.0514 | 0.92 | 13 / 12 / 12 (12) | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` |  | tierB-000362: The trail has gone cold. | `(Implication (And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Past_Patient_ResultEv_1 $e0 $e1 $x0))` |
| 0.0476 | 0.52 | 27 / 14 / 14 (14) | `(And (Agent $e0 $x0) (Location $e0 $x1))` | `(And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000045: The plane flew over the mountain. | `(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0)) (MnAgent_Location_Past $e0 $x0 $x1))` |
| 0.0461 | 0.57 | 23 / 13 / 13 (13) | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | B is part of A: the rule is A's own pack | tierB-000362: The trail has gone cold. | `(Implication (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer_1 $e1 $e0 $x0))` |
| 0.0461 | 0.57 | 23 / 13 / 13 (13) | `(And (Past $e0) (Result $e0 $e1))` | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | B is part of A: the rule is A's own pack | tierB-000362: The trail has gone cold. | `(Implication (And (Experiencer $e1 $x0) (Past $e0) (Result $e0 $e1)) (MnPast_ResultEvOfExperiencer_2 $e0 $e1 $x0))` |
| 0.0448 | 0.63 | 19 / 12 / 12 (12) | `(Member $e0 start)` | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000199: Karl started vomitting in disgust. | `(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing_1 $e0 $e1))` |
| 0.0448 | 0.63 | 19 / 12 / 12 (12) | `(Member $e0 start)` | `(And (Member $e0 start) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000199: Karl started vomitting in disgust. | `(Implication (And (Member $e0 start) (Theme $e0 $e1)) (MnStart_ThemeEv $e0 $e1))` |
| 0.0439 | 0.91 | 11 / 10 / 10 (10) | `(Manner $e0 quickly)` | `(And (Manner $e0 quickly) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. | `(Implication (And (Manner $e0 quickly) (Past $e0)) (MnMannerQuickly_Past $e0))` |
| 0.0428 | 0.55 | 22 / 12 / 12 (12) | `(And (Ongoing $e0) (Theme $e1 $e0))` | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000199: Karl started vomitting in disgust. | `(Implication (And (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0)) (MnStart_ThemeEvOfOngoing_2 $e1 $e0))` |
| 0.0428 | 0.55 | 22 / 12 / 12 (12) | `(And (Ongoing $e0) (Theme $e1 $e0))` | `(And (Member $e0 start) (Theme $e0 $e1))` |  | tierB-000199: Karl started vomitting in disgust. | `(Implication (And (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0)) (MnStart_ThemeEvOfOngoing_2 $e1 $e0))` |
| 0.0428 | 0.55 | 22 / 12 / 12 (12) | `(And (Patient $e0 $x0) (Result $e0 $e1))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000362: The trail has gone cold. | `(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))` |
| 0.0425 | 1.00 | 9 / 9 / 9 (9) | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000199: Karl started vomitting in disgust. | `(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))` |
| 0.0423 | 0.52 | 23 / 12 / 12 (12) | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` |  | tierB-000362: The trail has gone cold. | `(Implication (And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Past_Patient_ResultEv_1 $e0 $e1 $x0))` |
| 0.0423 | 0.52 | 23 / 12 / 12 (12) | `(And (Past $e0) (Result $e0 $e1))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000362: The trail has gone cold. | `(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))` |
| 0.0407 | 0.60 | 16 / 16 / 12 (12) | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` |  | tierB-000470: The crocodile tried to pull Boris into the river. | `(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e1) (Theme $e1 $e0)) (MnAgent_Agent_Past_ThemeEv_2 $e0 $e1 $x0))` |
| 0.0404 | 0.47 | 24 / 20 / 14 (14) | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Theme $e1 $e0))` |  | tierB-000470: The crocodile tried to pull Boris into the river. | `(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e1)) (MnAgent_Agent_ThemeEv $e0 $e1 $x0))` |
| 0.0402 | 0.52 | 22 / 13 / 12 (12) | `(And (Patient $e0 $x0) (Result $e0 $e1))` | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` |  | tierB-000362: The trail has gone cold. | `(Implication (And (Experiencer $e1 $x0) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnExperiencer_Past_Patient_ResultEv_2 $e0 $e1 $x0))` |

## Near misses under the ceiling (MI >= 0.0258, below the gate)

| MI bits | Jaccard | records A / B / shared (distinct) | A | B | note | e.g. |
|---|---|---|---|---|---|---|
| 0.0338 | 0.53 | 17 / 9 / 9 (9) | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000199: Karl started vomitting in disgust. |
| 0.0338 | 0.53 | 17 / 9 / 9 (9) | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` |  | tierB-000199: Karl started vomitting in disgust. |
| 0.0337 | 0.73 | 11 / 8 / 8 (8) | `(Manner $e0 quickly)` | `(And (Manner $e0 quickly) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.0337 | 0.73 | 11 / 8 / 8 (8) | `(Member $e0 try)` | `(And (Member $e0 try) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000117: David was trying to reach Amanda. |
| 0.0337 | 0.73 | 11 / 8 / 8 (8) | `(Member $e0 try)` | `(And (Member $e0 try) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000117: David was trying to reach Amanda. |
| 0.0336 | 0.41 | 22 / 19 / 12 (12) | `(And (Ongoing $e0) (Theme $e1 $e0))` | `(Member $e0 start)` |  | tierB-000199: Karl started vomitting in disgust. |
| 0.0328 | 0.67 | 12 / 8 / 8 (8) | `(GroupOf $x0 child)` | `(And (Agent $e0 $x0) (GroupOf $x0 child))` | B is part of A: the rule is A's own pack | tierB-000410: Mom let the children eat cookies. |
| 0.0327 | 0.47 | 19 / 9 / 9 (9) | `(Member $e0 start)` | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000199: Karl started vomitting in disgust. |
| 0.0327 | 0.47 | 19 / 9 / 9 (9) | `(Member $e0 start)` | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000199: Karl started vomitting in disgust. |
| 0.0327 | 0.47 | 19 / 9 / 9 (9) | `(Member $e0 start)` | `(And (Member $e0 start) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000192: A national fibre-optic network project has started. |
| 0.0321 | 0.88 | 8 / 7 / 7 (7) | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | B is part of A: the rule is A's own pack | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0321 | 0.88 | 8 / 7 / 7 (7) | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` |  | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0321 | 0.88 | 8 / 7 / 7 (7) | `(And (Agent $e0 $x0) (GroupOf $x0 person))` | `(And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000248: The people rebelled against the king. |
| 0.0321 | 0.88 | 8 / 7 / 7 (7) | `(And (Agent $e0 $x0) (Member $e0 make))` | `(And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000073: The cat made a high-pitched noise. |
| 0.0321 | 0.88 | 8 / 7 / 7 (7) | `(And (Manner $e0 quickly) (Patient $e0 $x0))` | `(And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |

## At or above the threshold but over the ceiling (support > 29; the paper's clause excludes them)

| MI bits | Jaccard | records A / B / shared (distinct) | A | B | note | e.g. |
|---|---|---|---|---|---|---|
| 0.3029 | 0.60 | 317 / 190 / 190 (190) | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.2579 | 0.57 | 267 / 151 / 151 (151) | `(Patient $e0 $x0)` | `(And (Past $e0) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.1961 | 0.47 | 245 / 114 / 114 (114) | `(Theme $e0 $x0)` | `(And (Past $e0) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1927 | 0.33 | 569 / 190 / 190 (190) | `(Past $e0)` | `(And (Agent $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1495 | 0.27 | 569 / 151 / 151 (151) | `(Past $e0)` | `(And (Past $e0) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.1488 | 0.36 | 245 / 89 / 89 (89) | `(Theme $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1475 | 0.62 | 93 / 58 / 58 (58) | `(Location $e0 $x0)` | `(And (Location $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 0.1284 | 0.28 | 317 / 89 / 89 (89) | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1212 | 0.65 | 66 / 43 / 43 (43) | `(Theme $e0 $e1)` | `(And (Past $e0) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000030: Rima and Skura stopped crying. |
| 0.1186 | 0.67 | 61 / 41 / 41 (41) | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 0.1181 | 0.94 | 35 / 33 / 33 (33) | `(Member $e0 have)` | `(And (Member $e0 have) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000066: Having close friends is more important than being popular. |
| 0.1165 | 0.77 | 48 / 37 / 37 (37) | `(Goal $e0 $x0)` | `(And (Goal $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000111: Claudio escorted Isabella to the exit. |
| 0.1164 | 0.39 | 145 / 56 / 56 (56) | `(Ongoing $e0)` | `(And (Agent $e0 $x0) (Ongoing $e0))` | B is part of A: the rule is A's own pack | tierB-000028: The nurse is dressing the wound. |
| 0.1155 | 0.52 | 89 / 46 / 46 (46) | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1104 | 0.20 | 569 / 114 / 114 (114) | `(Past $e0)` | `(And (Past $e0) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |

## Highest raw MI overall (the generic features: high raw MI, loose association)

| MI bits | Jaccard | records A / B / shared (distinct) | A | B | note | e.g. |
|---|---|---|---|---|---|---|
| 0.3029 | 0.60 | 317 / 190 / 190 (190) | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.2579 | 0.57 | 267 / 151 / 151 (151) | `(Patient $e0 $x0)` | `(And (Past $e0) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.1961 | 0.47 | 245 / 114 / 114 (114) | `(Theme $e0 $x0)` | `(And (Past $e0) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1927 | 0.33 | 569 / 190 / 190 (190) | `(Past $e0)` | `(And (Agent $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1495 | 0.27 | 569 / 151 / 151 (151) | `(Past $e0)` | `(And (Past $e0) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000005: The Berber-speaking population quickly plummeted with the arrival of the first French settlers. |
| 0.1488 | 0.36 | 245 / 89 / 89 (89) | `(Theme $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1475 | 0.62 | 93 / 58 / 58 (58) | `(Location $e0 $x0)` | `(And (Location $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 0.1284 | 0.28 | 317 / 89 / 89 (89) | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000018: Roads turned into rivers, with vehicles swept away by the rapid currents. |
| 0.1212 | 0.65 | 66 / 43 / 43 (43) | `(Theme $e0 $e1)` | `(And (Past $e0) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000030: Rima and Skura stopped crying. |
| 0.1186 | 0.67 | 61 / 41 / 41 (41) | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000063: In Ghardaia, Mozabites built a network of wells connected by underground channels. |

