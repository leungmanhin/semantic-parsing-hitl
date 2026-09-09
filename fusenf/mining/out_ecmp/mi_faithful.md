# §4.3.3 Mutual-Information Grouping — FAITHFUL arm (paper as written)

> "We could construct a binary feature matrix indicating which subtrees occur in which sentences, then compute pairwise mutual information between features. Pairs with very high MI but moderate individual support almost always co-occur, so they are excellent candidates for consolidation into a single feature." — FUSE-NF §4.3.3

## Implementation parameters (choices the paper leaves open; disclosed)

| parameter | choice |
|---|---|
| features | the 1652 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees) |
| matrix | binary presence, 762 records x 1652 units, from each unit's supporting ids (106 records carry no unit and are all-zero rows); 1363726 pairs, 39574 with any co-occurrence |
| MI | exact pairwise mutual information of the two binary presence variables, in bits |
| 'very high MI' | raw MI >= 0.0753 bits = the MI of a perfect co-occurrence over 7 of the 762 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 1363726 pairs is ~0.0162 bits); near-miss value 0.057 (= 5 records); pairs recorded from 0.0371 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01] |
| 'moderate individual support' | both units' support <= 12 records = the 97th percentile of unit support (1.6% of the records; percentiles 50/90/95/99 = 4/7/10/28); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself |
| calibration | the ceiling x threshold table below checks the paper's claim (median doc-Jaccard of the passes); the claim alone would also accept a lower threshold where perfectly co-occurring support-3..5 pairs (paraphrase families) dominate — the record-count anchor on the threshold is what keeps them out |
| 'almost always co-occur' | the paper's consequence, shown as the doc-Jaccard column (not gated) |
| containment | tagged, not gated: a CONTAINED pair (one unit's atoms embed in the other's under a variable renaming) restates §4.3.1 subsumption; SAME RECORDS = identical support sets, not contained; OVERLAPPING = the rest |
| families | same-records passes rendered per support set (every pair inside has NMI 1); `paraphrase` when the distinct sentences (by corpus equiv_class or text) are fewer than the unit floor of 3 or at least half the records duplicate another (near-duplicates share every subtree), `distinct` otherwise; n_distinct_sentences = the family's real support |
| consolidation | a passing non-contained pair is a proposal to treat the two subtrees as one feature (their conjunction); grouping across support sets and conditional MI are additions |

## Calibration: ceiling x threshold (cell = passes / not contained / median Jaccard / share with Jaccard >= 0.8)

| ceiling | MI >= 0.1 | MI >= 0.05 | MI >= 0.04 | MI >= 0.03 | MI >= 0.02 | MI >= 0.015 | MI >= 0.01 |
|---|---|---|---|---|---|---|---|
| 10% (76) | 87 / 21 / 1.00 / 86% | 1409 / 790 / 1.00 / 84% | 9744 / 7401 / 1.00 / 90% | 16986 / 13702 / 1.00 / 66% | 21748 / 18464 / 0.80 / 52% | 24137 / 20853 / 0.75 / 46% | 25993 / 22709 / 0.75 / 43% |
| 5% (38) | 82 / 21 / 1.00 / 91% | 1390 / 783 / 1.00 / 85% | 9716 / 7390 / 1.00 / 90% | 16912 / 13646 / 1.00 / 66% | 21208 / 17942 / 0.80 / 53% | 23345 / 20079 / 0.75 / 48% | 25044 / 21778 / 0.75 / 45% |
| 3% (22) | 74 / 20 / 1.00 / 99% | 1323 / 747 / 1.00 / 89% | 9631 / 7345 / 1.00 / 91% | 16752 / 13535 / 1.00 / 67% | 20676 / 17459 / 0.80 / 54% | 22307 / 19090 / 0.80 / 50% | 23891 / 20674 / 0.75 / 47% |
| 2% (15) | 73 / 20 / 1.00 / 100% | 1318 / 746 / 1.00 / 90% | 9617 / 7337 / 1.00 / 91% | 16703 / 13495 / 1.00 / 67% | 20417 / 17209 / 0.83 / 55% | 22038 / 18830 / 0.80 / 51% | 23603 / 20395 / 0.75 / 48% |
| 1% (7) | 0 | 1070 / 667 / 1.00 / 100% | 9192 / 7134 / 1.00 / 94% | 15695 / 12710 / 1.00 / 71% | 17003 / 14018 / 1.00 / 65% | 18005 / 15020 / 1.00 / 62% | 18532 / 15547 / 1.00 / 60% |

## The dial at the adopted ceiling (2% = 12 records)

| MI >= | all pairs | within the ceiling | contained | same records | overlapping |
|---|---|---|---|---|---|
| 0.1 | 102 | 43 | 32 | 11 | 0 |
| 0.05 | 1445 | 1283 | 548 | 480 | 255 |
| 0.04 | 9791 | 9567 | 2248 | 5832 | 1487 |
| 0.03 | 17078 | 16580 | 3175 | 7422 | 1794 |
| 0.02 | 22013 | 19857 | 3175 | 7422 | 1794 |
| 0.015 | 24781 | 21067 | 3175 | 7422 | 1794 |
| 0.01 | 27736 | 22369 | 3175 | 7422 | 1794 |

- at the gate (MI >= 0.0753, both supports <= 12): **106 pairs pass**, 22 of them not contained (20 same records = **9 families** (8 paraphrase, 1 distinct), **2 overlapping**); 490 non-contained near misses at MI >= 0.057 under the ceiling; 39 non-contained pairs at or above the gate but OVER the ceiling

## Same-records families (all units on one support set; kind = paraphrase | distinct)

| units | pairs | records (distinct sentences) | kind | e.g. | members (first 3) |
|---|---|---|---|---|---|
| 6 | 9 | 12 (6 distinct; tierA-000208, tierA-000213, tierA-000218…) | paraphrase | A clerk gives an answer to the query. | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` • `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` • `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` |
| 4 | 4 | 7 (1 distinct; tierA-000022, tierA-000023, tierA-000024…) | paraphrase | The pottery studio bought a second kiln. | `(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))` • `(Inheritance pottery_studio studio)` • `(Member $x0 kiln)` |
| 2 | 1 | 8 (3 distinct; tierA-000029, tierA-000032, tierA-000034…) | paraphrase | The mechanic repaired a seized gearbox. | `(And (Agent $e0 $x0) (Member $e0 repair))` • `(And (Member $e0 repair) (Patient $e0 $x0))` |
| 2 | 1 | 8 (3 distinct; tierA-000099, tierA-000101, tierA-000104…) | paraphrase | A rescue team abandons the search. | `(And (Agent $e0 $x0) (Member $e0 abandon))` • `(And (Member $e0 abandon) (Theme $e0 $x0))` |
| 2 | 1 | 7 (3 distinct; tierA-000114, tierA-000116, tierA-000119…) | paraphrase | A board postpones the vote. | `(And (Agent $e0 $x0) (Member $e0 postpone))` • `(And (Member $e0 postpone) (Theme $e0 $x0))` |
| 2 | 1 | 8 (3 distinct; tierA-000158, tierA-000160, tierA-000162…) | paraphrase | An editor rejects a manuscript. | `(And (Agent $e0 $x0) (Member $e0 reject))` • `(And (Member $e0 reject) (Theme $e0 $x0))` |
| 2 | 1 | 10 (3 distinct; tierA-000207, tierA-000209, tierA-000210…) | paraphrase | A clerk answers the query. | `(And (Agent $e0 $x0) (Member $e0 answer))` • `(And (Member $e0 answer) (Theme $e0 $x0))` |
| 2 | 1 | 10 (3 distinct; tierA-000281, tierA-000283, tierA-000284…) | paraphrase | A potter teaches an apprentice glazing. | `(And (Agent $e0 $x0) (Member $e0 teach))` • `(And (Member $e0 teach) (Recipient $e0 $x0))` |
| 2 | 1 | 7 (4 distinct; tierC-000001, tierC-000077, tierC-000078…) | distinct | Once the indigenous people had become indigenous , they would cease to be French . | `(And (Before $e0 $e1) (Past $e0))` • `(And (Before $e0 $e1) (Past $e1))` |

## Overlapping passes — two subtrees short of identical records that are one feature (by MI)

| MI bits | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.0864 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Agent $e0 $x0) (Member $e0 decide))` | `(And (Member $e0 decide) (Theme $e0 $x0))` | tierA-000185: A committee decides on a new roof. |
| 0.0864 | 0.90 | 10 / 9 / 9 | overlapping | `(And (Member $e0 lend) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 lend))` | tierA-000296: A neighbour lends Ravi a ladder. |

## Non-contained near misses under the ceiling (MI >= 0.057, below the gate)

| MI bits | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.0719 | 0.73 | 11 / 8 / 8 | overlapping | `(And (Member $e0 destroy) (Patient $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 destroy))` | tierA-000222: A storm destroys the greenhouse. |
| 0.0687 | 0.73 | 10 / 9 / 8 | overlapping | `(And (Source $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Source $e0 $x1))` | tierA-000262: A recruit receives a whistle from a trainer. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0))` | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0))` | `(And (Beneficiary $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0))` | `(And (Beneficiary $e0 $x0) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Beneficiary $e0 $x0) (Member $x0 hall) (Theme $e0 $x1))` | `(And (Beneficiary $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))` | `(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))` | `(Member $x0 electrician)` | tierA-000035: The electrician repaired the yard floodlight. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(Inheritance yard_floodlight floodlight)` | `(Member $x0 electrician)` | tierA-000035: The electrician repaired the yard floodlight. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(Inheritance yard_floodlight floodlight)` | `(Member $x0 yard_floodlight)` | tierA-000035: The electrician repaired the yard floodlight. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))` | `(And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 $x1))` | `(And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1))` | tierA-000286: A coach teaches the squad a drill. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Beneficiary $e0 $x0) (Past $e0) (Theme $e0 $x1))` | `(And (Beneficiary $e0 $x0) (Member $x0 hall))` | tierA-000008: The school bought a projector for the hall. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Beneficiary $e0 $x0) (Member $x0 hall))` | `(And (Beneficiary $e0 $x0) (Theme $e0 $x1))` | tierA-000008: The school bought a projector for the hall. |
| 0.0663 | 1.00 | 6 / 6 / 6 | same records | `(And (Member $e0 write) (Past $e0))` | `(And (Member $e0 write) (Patient $e0 $x0))` | tierC-000089: He wrote the script in cooperation with Bianca Olsen , Laurie Aubanel and Cyril Rambour . |

## Non-contained pairs at or above the gate but OVER the ceiling (support > 12; the paper's clause excludes them)

| MI bits | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.1672 | 0.49 | 301 / 247 / 181 | overlapping | `(Agent $e0 $x0)` | `(Theme $e0 $x0)` | tierA-000001: The depot bought two forklifts. |
| 0.1549 | 0.73 | 29 / 28 / 24 | overlapping | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` | tierA-000208: A clerk gives an answer to the query. |
| 0.1322 | 1.00 | 14 / 14 / 14 | same records | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.1322 | 1.00 | 14 / 14 / 14 | same records | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.1322 | 1.00 | 14 / 14 / 14 | same records | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | `(And (Member $e0 buy) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.1322 | 1.00 | 14 / 14 / 14 | same records | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.1322 | 1.00 | 14 / 14 / 14 | same records | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | `(And (Member $e0 buy) (Past $e0))` | tierA-000001: The depot bought two forklifts. |
| 0.1322 | 1.00 | 14 / 14 / 14 | same records | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 buy))` | tierA-000001: The depot bought two forklifts. |
| 0.1322 | 1.00 | 14 / 14 / 14 | same records | `(And (Agent $e0 $x0) (Member $e0 buy))` | `(And (Member $e0 buy) (Past $e0))` | tierA-000001: The depot bought two forklifts. |
| 0.1322 | 1.00 | 14 / 14 / 14 | same records | `(And (Agent $e0 $x0) (Member $e0 buy))` | `(And (Member $e0 buy) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.1322 | 1.00 | 14 / 14 / 14 | same records | `(And (Member $e0 buy) (Past $e0))` | `(And (Member $e0 buy) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.1013 | 0.36 | 77 / 63 / 37 | overlapping | `(And (Agent $e0 $x0) (Past $e0))` | `(And (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.0876 | 0.40 | 35 / 14 / 14 | overlapping | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | tierA-000001: The depot bought two forklifts. |
| 0.0876 | 0.40 | 35 / 14 / 14 | overlapping | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.0876 | 0.40 | 35 / 14 / 14 | overlapping | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |

## Highest raw MI overall (the generic features: high raw MI, loose association)

| MI bits | Jaccard | n A / B / both | bucket | A | B | e.g. |
|---|---|---|---|---|---|---|
| 0.4795 | 0.69 | 247 / 171 / 171 | contained | `(Theme $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.3784 | 0.57 | 301 / 171 / 171 | contained | `(Agent $e0 $x0)` | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.2440 | 0.44 | 176 / 77 / 77 | contained | `(Past $e0)` | `(And (Agent $e0 $x0) (Past $e0))` | tierA-000001: The depot bought two forklifts. |
| 0.2017 | 0.43 | 122 / 52 / 52 | contained | `(Patient $e0 $x0)` | `(And (Past $e0) (Patient $e0 $x0))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.1967 | 0.78 | 37 / 29 / 29 | contained | `(Recipient $e0 $x0)` | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | tierA-000004: Two forklifts were sold to the depot. |
| 0.1942 | 0.36 | 176 / 63 / 63 | contained | `(Past $e0)` | `(And (Past $e0) (Theme $e0 $x0))` | tierA-000001: The depot bought two forklifts. |
| 0.1930 | 0.41 | 122 / 50 / 50 | contained | `(Patient $e0 $x0)` | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | tierA-000029: The mechanic repaired a seized gearbox. |
| 0.1883 | 0.76 | 37 / 28 / 28 | contained | `(Recipient $e0 $x0)` | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` | tierA-000208: A clerk gives an answer to the query. |
| 0.1869 | 0.56 | 63 / 35 / 35 | contained | `(And (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | tierA-000001: The depot bought two forklifts. |
| 0.1801 | 0.86 | 28 / 24 / 24 | contained | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | tierA-000208: A clerk gives an answer to the query. |

