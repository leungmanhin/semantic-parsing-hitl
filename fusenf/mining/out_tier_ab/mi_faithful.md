# §4.3.3 Mutual-Information Grouping — FAITHFUL arm (paper as written)

> "We could construct a binary feature matrix indicating which subtrees occur in which sentences, then compute pairwise mutual information between features. Pairs with very high MI but moderate individual support almost always co-occur, so they are excellent candidates for consolidation into a single feature." — FUSE-NF §4.3.3

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| features | the 2125 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees) |
| matrix | binary presence, 2352 records x 2125 units, from each unit's supporting ids (635 records carry no unit and are all-zero rows); 2256750 pairs, 48442 with any co-occurrence |
| MI | exact pairwise mutual information of the two binary presence variables, in bits, raw |
| 'very high MI' | raw MI >= 0.0293 bits = the MI of a perfect co-occurrence over 7 of the 2352 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 2256750 pairs is ~0.0054 bits); near-miss value 0.0219 (= 5 records); pairs recorded from 0.0141 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01] |
| 'moderate individual support' | both units' support <= 35 records = the 97th percentile of unit support (1.5% of the records; percentiles 50/90/95/99 = 4/9/13/46); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself |
| calibration | the ceiling x threshold table checks the paper's claim (median doc-Jaccard of the passes); the claim alone would also accept a lower threshold where perfectly co-occurring support-3..5 pairs (near-duplicate records) dominate — the record-count anchor on the threshold is what keeps them out |
| 'almost always co-occur' | the paper's consequence, shown as the doc-Jaccard column (not gated) |
| shared records | n_both = records containing both units; the distinct-sentence count beside it (by corpus equiv_class or text) exposes near-duplicate records, which share every subtree by construction |
| part-of | when one unit's atoms embed in the other's (a variable renaming), the pair restates §4.3.1 subsumption and its rule is the larger unit's own pack; flagged in the record, not gated |
| consolidation | for every pass: the two units' variables are aligned through the shared records (each unit matched in each record under the miner's abstraction; the correspondence holding in most records is taken and the count shown), the aligned conjunction is the merged feature, and the rule is (Implication (And <merged>) (Mn<Name> <vars>)) — naming provisional; units that never share a skolem give a co-occurrence conjunction with disjoint variables |

## Calibration: ceiling x threshold (cell = passes / median Jaccard / share with Jaccard >= 0.8)

| ceiling | MI >= 0.1 | MI >= 0.05 | MI >= 0.04 | MI >= 0.03 | MI >= 0.02 | MI >= 0.015 | MI >= 0.01 |
|---|---|---|---|---|---|---|---|
| 10% (235) | 9 / 0.49 / 11% | 59 / 0.66 / 31% | 128 / 0.78 / 48% | 280 / 0.70 / 40% | 1607 / 0.90 / 72% | 4126 / 0.80 / 65% | 12177 / 0.71 / 39% |
| 5% (117) | 4 / 0.68 / 25% | 46 / 0.70 / 39% | 110 / 0.82 / 55% | 257 / 0.75 / 44% | 1547 / 0.94 / 75% | 4035 / 0.80 / 67% | 11981 / 0.75 / 39% |
| 3% (70) | 2 / 0.87 / 50% | 42 / 0.74 / 43% | 104 / 0.82 / 59% | 245 / 0.77 / 46% | 1530 / 1.00 / 75% | 4001 / 0.80 / 67% | 11863 / 0.75 / 40% |
| 2% (47) | 2 / 0.87 / 50% | 41 / 0.74 / 44% | 102 / 0.84 / 60% | 237 / 0.78 / 47% | 1513 / 1.00 / 76% | 3973 / 0.80 / 68% | 11760 / 0.75 / 40% |
| 1% (23) | 0 | 16 / 1.00 / 94% | 70 / 0.92 / 83% | 165 / 0.90 / 66% | 1396 / 1.00 / 83% | 3795 / 0.83 / 71% | 11359 / 0.75 / 41% |

## The dial at the adopted ceiling (35 records)

| MI >= | all pairs | within the ceiling | of which part-of pairs |
|---|---|---|---|
| 0.1 | 18 | 1 | 1 |
| 0.05 | 75 | 32 | 23 |
| 0.04 | 149 | 89 | 63 |
| 0.03 | 311 | 205 | 147 |
| 0.02 | 1652 | 1456 | 708 |
| 0.015 | 4196 | 3893 | 1657 |
| 0.01 | 12324 | 11593 | 2467 |

- at the gate (MI >= 0.0293, both supports <= 35): **207 pairs pass** (149 part-of pairs, 58 genuine); 910 near misses under the ceiling at MI >= 0.0219; 116 pairs at or above the threshold but over the ceiling

## Passes (by MI)

| MI bits | Jaccard | records A / B / shared (distinct) | A | B | note | e.g. | merged rule |
|---|---|---|---|---|---|---|---|
| 0.1018 | 0.94 | 35 / 33 / 33 (33) | `(Member $e0 have)` | `(And (Member $e0 have) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack | tierB-000066: Having close friends is more important than being popular. | `(Implication (And (Member $e0 have) (Theme $e0 $x0)) (MnHave_Theme $e0 $x0))` |
| 0.0950 | 0.91 | 34 / 31 / 31 (25) | `(Holder $e0 $x0)` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 6 of the shared records duplicate another | tierA-000085: A recipe needs two eggs. | `(Implication (And (Holder $e0 $x0) (Theme $e0 $x1)) (MnHolder_Theme $e0 $x0 $x1))` |
| 0.0793 | 1.00 | 23 / 23 / 23 (23) | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Member $e0 have))` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0740 | 0.96 | 23 / 22 / 22 (22) | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Patient $e0 $x0) (Result $e0 $e1))` |  | tierB-000004: Tom leaves the lights on all day. | `(Implication (And (Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Patient_ResultEv $e0 $e1 $x0))` |
| 0.0729 | 0.80 | 30 / 24 / 24 (10) | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | B is part of A: the rule is A's own pack; 14 of the shared records duplicate another | tierA-000208: A clerk gives an answer to the query. | `(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Recipient_Theme $e0 $x0 $x1 $x2))` |
| 0.0685 | 0.74 | 31 / 23 / 23 (23) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0685 | 0.74 | 31 / 23 / 23 (23) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Member $e0 have))` |  | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0669 | 0.70 | 33 / 23 / 23 (23) | `(And (Member $e0 have) (Theme $e0 $x0))` | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0669 | 0.70 | 33 / 23 / 23 (23) | `(And (Member $e0 have) (Theme $e0 $x0))` | `(And (Holder $e0 $x0) (Member $e0 have))` |  | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0662 | 0.68 | 34 / 23 / 23 (23) | `(Holder $e0 $x0)` | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0662 | 0.68 | 34 / 23 / 23 (23) | `(Holder $e0 $x0)` | `(And (Holder $e0 $x0) (Member $e0 have))` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have)) (MnHolder_Have $e0 $x0))` |
| 0.0655 | 0.66 | 35 / 23 / 23 (23) | `(Member $e0 have)` | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0655 | 0.66 | 35 / 23 / 23 (23) | `(Member $e0 have)` | `(And (Holder $e0 $x0) (Member $e0 have))` | B is part of A: the rule is A's own pack | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have)) (MnHolder_Have $e0 $x0))` |
| 0.0648 | 1.00 | 18 / 18 / 18 (8) | `(And (Member $e0 buy) (Theme $e0 $x0))` | `(Member $e0 buy)` | B is part of A: the rule is A's own pack; 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnBuy_Theme $e0 $x0))` |
| 0.0618 | 1.00 | 17 / 17 / 17 (7) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | `(And (Member $e0 buy) (Past $e0))` | B is part of A: the rule is A's own pack; 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))` |
| 0.0610 | 0.66 | 32 / 21 / 21 (21) | `(Might $e0)` | `(And (Agent $e0 $x0) (Might $e0))` | B is part of A: the rule is A's own pack | tierA-000075: A warden might allow visitors on Sundays. | `(Implication (And (Agent $e0 $x0) (Might $e0)) (MnAgent_Might $e0 $x0))` |
| 0.0594 | 0.94 | 18 / 17 / 17 (7) | `(And (Member $e0 buy) (Theme $e0 $x0))` | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack; 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))` |
| 0.0594 | 0.94 | 18 / 17 / 17 (7) | `(And (Member $e0 buy) (Theme $e0 $x0))` | `(And (Member $e0 buy) (Past $e0))` | 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))` |
| 0.0594 | 0.94 | 18 / 17 / 17 (7) | `(Member $e0 buy)` | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack; 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))` |
| 0.0594 | 0.94 | 18 / 17 / 17 (7) | `(Member $e0 buy)` | `(And (Member $e0 buy) (Past $e0))` | B is part of A: the rule is A's own pack; 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Member $e0 buy) (Past $e0)) (MnBuy_Past $e0))` |
| 0.0561 | 0.56 | 33 / 31 / 23 (23) | `(And (Member $e0 have) (Theme $e0 $x0))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` |  | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0547 | 0.53 | 35 / 31 / 23 (23) | `(Member $e0 have)` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` |  | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0546 | 0.77 | 22 / 17 / 17 (17) | `(And (Ongoing $e0) (Theme $e1 $e0))` | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | B is part of A: the rule is A's own pack | tierB-000075: Mark and Jessica began hanging out often. | `(Implication (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing $e1 $e0))` |
| 0.0538 | 0.52 | 34 / 33 / 23 (23) | `(Holder $e0 $x0)` | `(And (Member $e0 have) (Theme $e0 $x0))` |  | tierB-000142: This sentence has various meanings. | `(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))` |
| 0.0526 | 0.80 | 20 / 16 / 16 (16) | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | B is part of A: the rule is A's own pack | tierB-000166: Yair Stern made two attempts to collaborate with the Nazis. | `(Implication (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent $e1 $e0 $x0))` |
| 0.0526 | 1.00 | 14 / 14 / 14 (4) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | B is part of A: the rule is A's own pack; 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme $e0 $x0 $x1))` |
| 0.0526 | 1.00 | 14 / 14 / 14 (4) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme $e0 $x0 $x1))` |
| 0.0526 | 1.00 | 14 / 14 / 14 (4) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 buy))` | B is part of A: the rule is A's own pack; 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme $e0 $x0 $x1))` |
| 0.0526 | 1.00 | 14 / 14 / 14 (4) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme $e0 $x0 $x1))` |
| 0.0526 | 1.00 | 14 / 14 / 14 (4) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | `(And (Agent $e0 $x0) (Member $e0 buy))` | B is part of A: the rule is A's own pack; 10 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. | `(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnAgent_Buy_Past $e0 $x0))` |

## Near misses under the ceiling (MI >= 0.0219, below the gate)

| MI bits | Jaccard | records A / B / shared (distinct) | A | B | note | e.g. |
|---|---|---|---|---|---|---|
| 0.0293 | 1.00 | 7 / 7 / 7 (7) | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` |  | tierB-000485: The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.0293 | 1.00 | 7 / 7 / 7 (7) | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0293 | 1.00 | 7 / 7 / 7 (7) | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0293 | 1.00 | 7 / 7 / 7 (7) | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0293 | 1.00 | 7 / 7 / 7 (2) | `(And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 depot))` | B is part of A: the rule is A's own pack; 5 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.0293 | 1.00 | 7 / 7 / 7 (7) | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` |  | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0293 | 1.00 | 7 / 7 / 7 (7) | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Theme $e0 $e1))` | B is part of A: the rule is A's own pack | tierB-000075: Mark and Jessica began hanging out often. |
| 0.0293 | 1.00 | 7 / 7 / 7 (1) | `(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))` | `(Inheritance pottery_studio studio)` | B is part of A: the rule is A's own pack; 6 of the shared records duplicate another | tierA-000022: The pottery studio bought a second kiln. |
| 0.0293 | 1.00 | 7 / 7 / 7 (1) | `(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))` | `(Member $x0 kiln)` | 6 of the shared records duplicate another | tierA-000022: The pottery studio bought a second kiln. |
| 0.0293 | 1.00 | 7 / 7 / 7 (1) | `(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))` | `(Member $x0 pottery_studio)` | B is part of A: the rule is A's own pack; 6 of the shared records duplicate another | tierA-000022: The pottery studio bought a second kiln. |
| 0.0293 | 1.00 | 7 / 7 / 7 (1) | `(Inheritance pottery_studio studio)` | `(Member $x0 kiln)` | 6 of the shared records duplicate another | tierA-000022: The pottery studio bought a second kiln. |
| 0.0293 | 1.00 | 7 / 7 / 7 (1) | `(Inheritance pottery_studio studio)` | `(Member $x0 pottery_studio)` | 6 of the shared records duplicate another | tierA-000022: The pottery studio bought a second kiln. |
| 0.0293 | 1.00 | 7 / 7 / 7 (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Member $e0 cancel) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack; 4 of the shared records duplicate another | tierA-000145: The evening flight is canceled by an airline. |
| 0.0293 | 1.00 | 7 / 7 / 7 (3) | `(And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 postpone))` | B is part of A: the rule is A's own pack; 4 of the shared records duplicate another | tierA-000114: A board postpones the vote. |
| 0.0293 | 1.00 | 7 / 7 / 7 (3) | `(And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))` | `(And (Member $e0 postpone) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack; 4 of the shared records duplicate another | tierA-000114: A board postpones the vote. |

## At or above the threshold but over the ceiling (support > 35; the paper's clause excludes them)

| MI bits | Jaccard | records A / B / shared (distinct) | A | B | note | e.g. |
|---|---|---|---|---|---|---|
| 0.2956 | 0.57 | 413 / 235 / 235 (128) | `(Theme $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 107 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.2381 | 0.43 | 551 / 235 / 235 (128) | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 107 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.2242 | 0.40 | 551 / 223 / 223 (196) | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack; 27 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.2227 | 0.50 | 327 / 162 / 162 (153) | `(Patient $e0 $x0)` | `(And (Past $e0) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack; 9 of the shared records duplicate another | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.2078 | 0.37 | 606 / 223 / 223 (196) | `(Past $e0)` | `(And (Agent $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack; 27 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.1633 | 0.34 | 413 / 140 / 140 (118) | `(Theme $e0 $x0)` | `(And (Past $e0) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack; 22 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.1459 | 0.27 | 606 / 162 / 162 (153) | `(Past $e0)` | `(And (Past $e0) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack; 9 of the shared records duplicate another | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.1294 | 0.49 | 140 / 68 / 68 (50) | `(And (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 18 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.1246 | 0.23 | 606 / 140 / 140 (118) | `(Past $e0)` | `(And (Past $e0) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack; 22 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.1232 | 0.29 | 327 / 95 / 95 (71) | `(Patient $e0 $x0)` | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | B is part of A: the rule is A's own pack; 24 of the shared records duplicate another | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.1135 | 0.46 | 126 / 58 / 58 (58) | `(Location $e0 $x0)` | `(And (Location $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack | tierB-000008: Ziri was hiking on a very secluded hiking path. |
| 0.1130 | 0.55 | 95 / 52 / 52 (43) | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | B is part of A: the rule is A's own pack; 9 of the shared records duplicate another | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.1048 | 0.30 | 223 / 68 / 68 (50) | `(And (Agent $e0 $x0) (Past $e0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 18 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.1030 | 0.39 | 145 / 56 / 56 (56) | `(Ongoing $e0)` | `(And (Agent $e0 $x0) (Ongoing $e0))` | B is part of A: the rule is A's own pack | tierB-000028: The nurse is dressing the wound. |
| 0.1022 | 0.29 | 235 / 68 / 68 (50) | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 18 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |

## Highest raw MI overall (the generic features: high raw MI, loose association)

| MI bits | Jaccard | records A / B / shared (distinct) | A | B | note | e.g. |
|---|---|---|---|---|---|---|
| 0.2956 | 0.57 | 413 / 235 / 235 (128) | `(Theme $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 107 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.2381 | 0.43 | 551 / 235 / 235 (128) | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 107 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.2242 | 0.40 | 551 / 223 / 223 (196) | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack; 27 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.2227 | 0.50 | 327 / 162 / 162 (153) | `(Patient $e0 $x0)` | `(And (Past $e0) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack; 9 of the shared records duplicate another | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.2078 | 0.37 | 606 / 223 / 223 (196) | `(Past $e0)` | `(And (Agent $e0 $x0) (Past $e0))` | B is part of A: the rule is A's own pack; 27 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.1633 | 0.34 | 413 / 140 / 140 (118) | `(Theme $e0 $x0)` | `(And (Past $e0) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack; 22 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.1459 | 0.27 | 606 / 162 / 162 (153) | `(Past $e0)` | `(And (Past $e0) (Patient $e0 $x0))` | B is part of A: the rule is A's own pack; 9 of the shared records duplicate another | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.1294 | 0.49 | 140 / 68 / 68 (50) | `(And (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | B is part of A: the rule is A's own pack; 18 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.1246 | 0.23 | 606 / 140 / 140 (118) | `(Past $e0)` | `(And (Past $e0) (Theme $e0 $x0))` | B is part of A: the rule is A's own pack; 22 of the shared records duplicate another | tierA-000001: The depot bought two forklifts. |
| 0.1232 | 0.29 | 327 / 95 / 95 (71) | `(Patient $e0 $x0)` | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | B is part of A: the rule is A's own pack; 24 of the shared records duplicate another | tierA-000029: The mechanic repaired a seized gearbox. |

