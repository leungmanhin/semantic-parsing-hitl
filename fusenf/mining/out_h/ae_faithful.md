# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1454 rooted-subtree units of the §4.3.1 faithful view (`out_h/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator (k = 4, 28 eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |
| autoencoder | one hidden layer of k sigmoid units (dial [16, 32, 64], adopted 32), linear output, tied decoder x_hat = h W + c; W uniform(±sqrt(6/(F+k))), b = 0, c = column means |
| loss | mean over records of the squared reconstruction error summed over units + 0.0001·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), rho 0.1, beta dial [0.5] (0 = plain shallow AE), adopted 0.5 |
| training | full batch, Adam lr 0.01, 2000 epochs, float32, 8 thread(s); seed 0 adopted, seeds 0..4 for stability |
| ties | cosine between two units' encoder weight vectors (columns of W); gate cosine ≥ tau, dial [0.8, 0.85, 0.9, 0.95], adopted 0.85; recording floor 0.8 |
| co-occurrence | field per pair from the units' record sets: exclusive / overlapping / nested / same-records; part-of = §4.3.1 containment — never a filter |
| clusters | average linkage on the cosine distance of the weight vectors, cut at 1 − tau (rendering only; the gate is pairwise) |
| renderings | one .metta per bottleneck at the adopted gate (passes grouped by relation, exclusive first); the cosine dial is read off the records; the plain shallow AE (beta 0) is the twin run `ae_faithful_plain.*` when present |

## Count matrix

- 2302 records × 1454 units; 11330 non-zero cells (4.92 units per record on average); 1075 repeat matches beyond the first (max count 6); 2 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at 25 / 50 / 75 / 100 % of the epochs |
|---|---|---|---|---|---|---|---|
| 16 | 0.5 | 0 | 3.5725 | 0.4179 | 0.102 | 0.43 | 3.836 / 3.6438 / 3.6036 / 3.5726 |
| 16 | 0.5 | 1 | 3.5469 | 0.4221 | 0.1035 | 0.47 | 3.849 / 3.6675 / 3.5851 / 3.547 |
| 16 | 0.5 | 2 | 3.5659 | 0.419 | 0.106 | 0.48 | 3.8593 / 3.6785 / 3.5974 / 3.566 |
| 16 | 0.5 | 3 | 3.5374 | 0.4237 | 0.1031 | 0.49 | 3.8149 / 3.6278 / 3.5819 / 3.5374 |
| 16 | 0.5 | 4 | 3.5501 | 0.4216 | 0.1011 | 0.45 | 3.7869 / 3.6107 / 3.5596 / 3.5501 |
| 32 | 0.5 | 0 | 2.8754 | 0.5315 | 0.1041 | 0.57 | 3.1906 / 2.9781 / 2.914 / 2.8754 |
| 32 | 0.5 | 1 | 2.8572 | 0.5345 | 0.1039 | 0.59 | 3.1422 / 2.9515 / 2.901 / 2.8572 |
| 32 | 0.5 | 2 | 2.8577 | 0.5344 | 0.1044 | 0.58 | 3.1442 / 2.9494 / 2.8918 / 2.8578 |
| 32 | 0.5 | 3 | 2.8497 | 0.5357 | 0.1043 | 0.6 | 3.1622 / 2.952 / 2.8846 / 2.8498 |
| 32 | 0.5 | 4 | 2.8463 | 0.5363 | 0.1044 | 0.59 | 3.1191 / 2.9361 / 2.8729 / 2.8463 |
| 64 | 0.5 | 0 | 2.2013 | 0.6413 | 0.1046 | 0.62 | 2.8943 / 2.3741 / 2.247 / 2.2014 |
| 64 | 0.5 | 1 | 2.1941 | 0.6425 | 0.1045 | 0.66 | 2.8635 / 2.3553 / 2.2379 / 2.1941 |
| 64 | 0.5 | 2 | 2.1875 | 0.6436 | 0.1043 | 0.68 | 2.8742 / 2.3438 / 2.2274 / 2.1875 |
| 64 | 0.5 | 3 | 2.1978 | 0.6419 | 0.1046 | 0.63 | 2.8917 / 2.3698 / 2.2444 / 2.1979 |
| 64 | 0.5 | 4 | 2.1935 | 0.6426 | 0.1047 | 0.65 | 2.8739 / 2.3537 / 2.2346 / 2.1935 |

## Tied pairs across the dial

| k | beta | cosine ≥ | pass | exclusive | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | smaller side below the median norm | clusters | weight norm min / median |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 16 | 0.5 | 0.80 | 18190 | 7321 | 4012 | 4450 | 2407 | 2065 | 93 | 10784 | 7843 | 292 | 0.008 / 0.075 |
| 16 | 0.5 | 0.85 | 14165 | 4245 | 3251 | 4262 | 2407 | 1931 | 93 | 9116 | 4771 | 385 | 0.008 / 0.075 |
| 16 | 0.5 | 0.90 | 11060 | 2012 | 2584 | 4057 | 2407 | 1777 | 89 | 7744 | 2562 | 511 | 0.008 / 0.075 |
| 16 | 0.5 | 0.95 | 8203 | 718 | 1550 | 3528 | 2407 | 1529 | 85 | 6424 | 1149 | 684 | 0.008 / 0.075 |
| 32 | 0.5 | 0.80 | 9995 | 1180 | 2443 | 3965 | 2407 | 1893 | 93 | 8550 | 2374 | 417 | 0.015 / 0.152 |
| 32 | 0.5 | 0.85 | 8775 | 647 | 1926 | 3795 | 2407 | 1780 | 93 | 7716 | 1557 | 509 | 0.015 / 0.152 |
| 32 | 0.5 | 0.90 | 7616 | 380 | 1323 | 3506 | 2407 | 1604 | 88 | 6901 | 982 | 601 | 0.015 / 0.152 |
| 32 | 0.5 | 0.95 | 6073 | 161 | 551 | 2955 | 2406 | 1360 | 77 | 5869 | 501 | 729 | 0.015 / 0.152 |
| 64 | 0.5 | 0.80 | 7786 | 147 | 1682 | 3550 | 2407 | 1747 | 88 | 7117 | 4201 | 489 | 0.018 / 0.331 |
| 64 | 0.5 | 0.85 | 6967 | 67 | 1093 | 3400 | 2407 | 1656 | 85 | 6438 | 3791 | 568 | 0.018 / 0.331 |
| 64 | 0.5 | 0.90 | 6251 | 25 | 690 | 3129 | 2407 | 1536 | 80 | 5190 | 3449 | 642 | 0.018 / 0.331 |
| 64 | 0.5 | 0.95 | 4751 | 8 | 270 | 2066 | 2407 | 1308 | 67 | 4499 | 2392 | 765 | 0.018 / 0.331 |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85 — top 25 EXCLUSIVE passes (the paper's interchangeability reading)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive | 0.17 / 0.13 | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` (4) | `(And (LocatedIn $x0 $x1) (Member $x1 full))` (3) | 0 | There are some pretty flowers in the garden. | The kitchen sink is full of dishes. |
| 1.000 | 5/5 | exclusive | 0.01 / 0.01 | `(Member $x0 beach)` (3) | `(Member $x0 fact)` (3) | 0 | People go to the beach during the summer. | Nobody can deny this fact. |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(And (Inheritance metropolitan_statistical_area area) (Inheritance metropolitan_statistical_area metropolitan))` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(Inheritance metropolitan_statistical_area area)` (4) | `(Inheritance regional_unit unit)` (4) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | Methoni is a village and a former municipality in Pieria regional unit , Greece . |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(Inheritance regional_unit regional)` (4) | `(And (Inheritance metropolitan_statistical_area area) (Inheritance metropolitan_statistical_area metropolitan))` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(Inheritance regional_unit regional)` (4) | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(Inheritance regional_unit unit)` (4) | `(And (Inheritance metropolitan_statistical_area area) (Inheritance metropolitan_statistical_area metropolitan))` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(Inheritance regional_unit unit)` (4) | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(Inheritance metropolitan_statistical_area area)` (4) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(Inheritance metropolitan_statistical_area area)` (4) | `(Inheritance regional_unit regional)` (4) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | Methoni is a village and a former municipality in Pieria regional unit , Greece . |
| 1.000 | 5/5 | exclusive | 0.02 / 0.01 | `(Inheritance metropolitan_statistical_area area)` (4) | `(Member $x0 beach)` (3) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | People go to the beach during the summer. |
| 1.000 | 5/5 | exclusive | 0.02 / 0.01 | `(Inheritance metropolitan_statistical_area area)` (4) | `(Member $x0 fact)` (3) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | Nobody can deny this fact. |
| 1.000 | 5/5 | exclusive | 0.02 / 0.01 | `(And (Inheritance metropolitan_statistical_area area) (Inheritance metropolitan_statistical_area metropolitan))` (3) | `(Member $x0 beach)` (3) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | People go to the beach during the summer. |
| 1.000 | 5/5 | exclusive | 0.02 / 0.01 | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | `(Member $x0 beach)` (3) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | People go to the beach during the summer. |
| 0.999 | 5/5 | exclusive | 0.02 / 0.01 | `(And (Inheritance metropolitan_statistical_area area) (Inheritance metropolitan_statistical_area metropolitan))` (3) | `(Member $x0 fact)` (3) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | Nobody can deny this fact. |
| 0.999 | 5/5 | exclusive | 0.02 / 0.01 | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | `(Member $x0 fact)` (3) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | Nobody can deny this fact. |
| 0.999 | 5/5 | exclusive | 0.02 / 0.01 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(Member $x0 beach)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | People go to the beach during the summer. |
| 0.999 | 5/5 | exclusive | 0.02 / 0.01 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(Member $x0 fact)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Nobody can deny this fact. |
| 0.999 | 5/5 | exclusive | 0.02 / 0.01 | `(Inheritance regional_unit regional)` (4) | `(Member $x0 beach)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | People go to the beach during the summer. |
| 0.999 | 5/5 | exclusive | 0.02 / 0.01 | `(Inheritance regional_unit regional)` (4) | `(Member $x0 fact)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Nobody can deny this fact. |
| 0.999 | 5/5 | exclusive | 0.02 / 0.01 | `(Inheritance regional_unit unit)` (4) | `(Member $x0 beach)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | People go to the beach during the summer. |
| 0.999 | 5/5 | exclusive | 0.02 / 0.01 | `(Inheritance regional_unit unit)` (4) | `(Member $x0 fact)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Nobody can deny this fact. |
| 0.998 | 5/5 | exclusive | 0.13 / 0.17 | `(Member $x0 full)` (5) | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` (4) | 0 | The kitchen sink is full of dishes. | There are some pretty flowers in the garden. |
| 0.996 | 5/5 | exclusive | 0.17 / 0.12 | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` (4) | `(And (LocatedIn $x0 $x1) (Member $x1 table))` (3) | 0 | There are some pretty flowers in the garden. | There is a camera on the table. |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85 — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.94 / 0.94 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (26) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (26) | 26 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.55 / 0.55 | `(And (Before $e0 $e1) (Past $e0) (Past $e1))` (11) | `(And (Before $e0 $e1) (Past $e0))` (11) | 11 | Ivan killed several people and then escaped. | Ivan killed several people and then escaped. |
| 1.000 | 5/5 | same-records | 0.71 / 0.71 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` (9) | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | 9 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.84 / 0.84 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.84 / 0.84 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.70 / 0.70 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.84 / 0.84 | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.81 / 0.81 | `(And (Member $e0 build) (Past $e0) (Patient $e0 $x0))` (9) | `(And (Member $e0 build) (Past $e0))` (9) | 9 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.79 / 0.79 | `(And (Member $e0 kill) (Patient $e0 $x0))` (9) | `(Member $e0 kill)` (9) | 9 | The soldier was killed in action. | The soldier was killed in action. |
| 1.000 | 5/5 | same-records | 0.06 / 0.06 | `(ConditionalProperty bicycle permitted footpath)` (8) | `(ConditionalProperty pedestrian permitted footpath)` (8) | 8 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . |
| 1.000 | 5/5 | same-records | 0.06 / 0.06 | `(ConditionalProperty bicycle permitted footpath)` (8) | `(Inheritance bicycle permitted) ~NEG` (8) | 8 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . |
| 1.000 | 5/5 | same-records | 0.06 / 0.06 | `(ConditionalProperty bicycle permitted footpath)` (8) | `(Inheritance pedestrian permitted) ~NEG` (8) | 8 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . |
| 1.000 | 5/5 | same-records | 0.06 / 0.06 | `(ConditionalProperty pedestrian permitted footpath)` (8) | `(Inheritance bicycle permitted) ~NEG` (8) | 8 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . |
| 1.000 | 5/5 | same-records | 0.06 / 0.06 | `(ConditionalProperty pedestrian permitted footpath)` (8) | `(Inheritance pedestrian permitted) ~NEG` (8) | 8 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . |
| 1.000 | 5/5 | same-records | 0.06 / 0.06 | `(Inheritance bicycle permitted) ~NEG` (8) | `(Inheritance pedestrian permitted) ~NEG` (8) | 8 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . |
| 1.000 | 5/5 | same-records (part-of) | 0.81 / 0.80 | `(And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))` (8) | `(And (Agent $e0 $x0) (Member $e0 build))` (8) | 8 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records | 0.68 / 0.68 | `(And (Agent $e0 $x0) (To $e0 $e1))` (8) | `(And (Agent $e0 $x0) (To $e1 $e0))` (8) | 8 | Thousands gathered to watch the event. | Thousands gathered to watch the event. |
| 1.000 | 5/5 | same-records (part-of) | 0.77 / 0.77 | `(And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 kill) (Past $e0))` (7) | 7 | The soldier was killed in action. | The soldier was killed in action. |
| 1.000 | 5/5 | same-records (part-of) | 0.42 / 0.42 | `(And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 produce) (Past $e0))` (7) | 7 | The thin layer of oil at the top of the soup produced a mesmerizing sheen. | The thin layer of oil at the top of the soup produced a mesmerizing sheen. |
| 1.000 | 5/5 | same-records (part-of) | 0.76 / 0.76 | `(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))` (6) | `(And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))` (6) | 6 | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  |
| 1.000 | 5/5 | same-records (part-of) | 0.12 / 0.12 | `(And (Member $e0 bear) (Past $e0))` (6) | `(Member $e0 bear)` (6) | 6 | Tobias was born on this planet. | Tobias was born on this planet. |
| 1.000 | 5/5 | same-records (part-of) | 0.10 / 0.10 | `(And (Member $e0 capture) (Past $e0))` (6) | `(Member $e0 capture)` (6) | 6 | Spain captured many Algerian cities in the 16th century. | Spain captured many Algerian cities in the 16th century. |
| 1.000 | 5/5 | same-records (part-of) | 0.34 / 0.35 | `(And (Member $e0 receive) (Past $e0))` (6) | `(Member $e0 receive)` (6) | 6 | At the winter festival, Beth received an award for dancing the best. | At the winter festival, Beth received an award for dancing the best. |
| 1.000 | 5/5 | same-records (part-of) | 0.08 / 0.08 | `(And (Past $e0) (Patient $e0 $e1))` (6) | `(Patient $e0 $e1)` (6) | 6 | The game was put off till next week. | The game was put off till next week. |
| 1.000 | 5/5 | same-records (part-of) | 0.09 / 0.09 | `(And (Past $e0) (Time $e0 yesterday))` (6) | `(Time $e0 yesterday)` (6) | 6 | Go and find the driver who arrived here yesterday. | Go and find the driver who arrived here yesterday. |
