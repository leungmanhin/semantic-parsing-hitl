# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1454 rooted-subtree units of the §4.3.1 faithful view (`out_h/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator (k = 4, 28 eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |
| autoencoder | one hidden layer of k sigmoid units (dial [32], adopted 32), linear output, tied decoder x_hat = h W + c; W uniform(±sqrt(6/(F+k))), b = 0, c = column means |
| loss | mean over records of the squared reconstruction error summed over units + 0.0001·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), rho 0.1, beta dial [0.0] (0 = plain shallow AE), adopted 0 |
| training | full batch, Adam lr 0.01, 2000 epochs, float32, 8 thread(s); seed 0 adopted, seeds 0..4 for stability |
| ties | cosine between two units' encoder weight vectors (columns of W); gate cosine ≥ tau, dial [0.8, 0.85, 0.9, 0.95], adopted 0.85; recording floor 0.8 |
| co-occurrence | field per pair from the units' record sets: exclusive / overlapping / nested / same-records; part-of = §4.3.1 containment — never a filter |
| tie groups | complete linkage on the cosine distance of the weight vectors, cut at 1 − tau: every pair inside a group passes the gate; a partition, so passing pairs can fall across groups (the pairwise record is the JSONL) |
| renderings | one .metta per bottleneck at the adopted gate (passes grouped by relation, exclusive first); the cosine dial is read off the records; the plain shallow AE (beta 0) is the twin run `ae_faithful_plain_plain.*` when present |

## Count matrix

- 2302 records × 1454 units; 11330 non-zero cells (4.92 units per record on average); 1075 repeat matches beyond the first (max count 6); 2 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at 25 / 50 / 75 / 100 % of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 0 | 0 | 2.8433 | 0.5367 | 0.4215 | 11.65 | 2.9763 / 2.8971 / 2.8672 / 2.8438 |
| 32 | 0 | 1 | 2.8475 | 0.5361 | 0.3915 | 9.42 | 2.9759 / 2.8995 / 2.8659 / 2.8481 |
| 32 | 0 | 2 | 2.8454 | 0.5364 | 0.4171 | 11.17 | 2.9847 / 2.9007 / 2.8693 / 2.8455 |
| 32 | 0 | 3 | 2.8381 | 0.5376 | 0.4056 | 11.44 | 2.9787 / 2.8944 / 2.859 / 2.8384 |
| 32 | 0 | 4 | 2.8414 | 0.537 | 0.3878 | 8.8 | 2.9814 / 2.8989 / 2.8613 / 2.8415 |

## Tied pairs across the dial

| k | beta | cosine ≥ | pass | exclusive | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | smaller side below the median norm | tie groups (untied units) | weight norm min / median |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0 | 0.80 | 10091 | 1104 | 2544 | 4036 | 2407 | 1944 | 94 | 8877 | 2291 | 259 (212) | 0.007 / 0.123 |
| 32 | 0 | 0.85 | 8853 | 587 | 2019 | 3840 | 2407 | 1814 | 93 | 7953 | 1501 | 268 (277) | 0.007 / 0.123 |
| 32 | 0 | 0.90 | 7653 | 299 | 1323 | 3624 | 2407 | 1655 | 86 | 7030 | 935 | 269 (358) | 0.007 / 0.123 |
| 32 | 0 | 0.95 | 6216 | 121 | 705 | 2983 | 2407 | 1384 | 79 | 5897 | 510 | 261 (480) | 0.007 / 0.123 |

## Adopted block: k 32, beta 0, cosine ≥ 0.85 — top 25 EXCLUSIVE passes (the paper's interchangeability reading)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive | 0.11 / 0.08 | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` (4) | `(And (LocatedIn $x0 $x1) (Member $x1 full))` (3) | 0 | There are some pretty flowers in the garden. | The kitchen sink is full of dishes. |
| 0.999 | 5/5 | exclusive | 0.01 / 0.01 | `(Inheritance metropolitan_statistical_area area)` (4) | `(Member $x0 beach)` (3) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | People go to the beach during the summer. |
| 0.999 | 5/5 | exclusive | 0.08 / 0.11 | `(Member $x0 full)` (5) | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` (4) | 0 | The kitchen sink is full of dishes. | There are some pretty flowers in the garden. |
| 0.998 | 5/5 | exclusive | 0.01 / 0.01 | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | `(Member $x0 beach)` (3) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | People go to the beach during the summer. |
| 0.997 | 5/5 | exclusive | 0.01 / 0.01 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(Member $x0 beach)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | People go to the beach during the summer. |
| 0.997 | 5/5 | exclusive | 0.01 / 0.01 | `(Inheritance regional_unit regional)` (4) | `(Member $x0 fact)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Nobody can deny this fact. |
| 0.996 | 5/5 | exclusive | 0.01 / 0.01 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(Inheritance metropolitan_statistical_area area)` (4) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 0.996 | 5/5 | exclusive | 0.04 / 0.04 | `(Member $x0 atmosphere)` (3) | `(Member $x0 valuable)` (3) | 0 | There was a different kind of atmosphere in the headquarters. | Marco possesses a valuable stamp collection. |
| 0.995 | 5/5 | exclusive | 0.01 / 0.01 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 0.995 | 5/5 | exclusive | 0.11 / 0.08 | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` (4) | `(And (LocatedIn $x0 $x1) (Member $x1 table))` (3) | 0 | There are some pretty flowers in the garden. | There is a camera on the table. |
| 0.994 | 5/5 | exclusive | 0.08 / 0.08 | `(And (LocatedIn $x0 $x1) (Member $x1 full))` (3) | `(And (LocatedIn $x0 $x1) (Member $x1 table))` (3) | 0 | The kitchen sink is full of dishes. | There is a camera on the table. |
| 0.993 | 5/5 | exclusive | 0.08 / 0.08 | `(Member $x0 full)` (5) | `(And (LocatedIn $x0 $x1) (Member $x1 table))` (3) | 0 | The kitchen sink is full of dishes. | There is a camera on the table. |
| 0.992 | 5/5 | exclusive | 0.01 / 0.01 | `(Inheritance metropolitan_statistical_area area)` (4) | `(Inheritance regional_unit unit)` (4) | 0 | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . | Methoni is a village and a former municipality in Pieria regional unit , Greece . |
| 0.992 | 5/5 | exclusive | 0.01 / 0.01 | `(Inheritance regional_unit unit)` (4) | `(Member $x0 beach)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | People go to the beach during the summer. |
| 0.991 | 5/5 | exclusive | 0.08 / 0.08 | `(And (LocatedIn $x0 $x1) (Member $x1 city))` (3) | `(And (LocatedIn $x0 $x1) (Member $x1 full))` (3) | 0 | The streets of this city are narrow. | The kitchen sink is full of dishes. |
| 0.990 | 5/5 | exclusive | 0.01 / 0.01 | `(Inheritance regional_unit unit)` (4) | `(Member $x0 fact)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Nobody can deny this fact. |
| 0.990 | 5/5 | exclusive | 0.11 / 0.08 | `(And (LocatedIn $x0 $x1) (Member $x1 garden))` (4) | `(And (LocatedIn $x0 $x1) (Member $x1 city))` (3) | 0 | There are some pretty flowers in the garden. | The streets of this city are narrow. |
| 0.988 | 5/5 | exclusive | 0.08 / 0.08 | `(Member $x0 full)` (5) | `(And (LocatedIn $x0 $x1) (Member $x1 city))` (3) | 0 | The kitchen sink is full of dishes. | The streets of this city are narrow. |
| 0.988 | 4/5 | exclusive | 0.03 / 0.01 | `(ConditionalProperty pedestrian permitted footpath)` (8) | `(Inheritance metropolitan_statistical_area area)` (4) | 0 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 0.988 | 5/5 | exclusive | 0.03 / 0.01 | `(Inheritance pedestrian permitted) ~NEG` (8) | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | 0 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 0.988 | 5/5 | exclusive | 0.03 / 0.01 | `(ConditionalProperty bicycle permitted footpath)` (8) | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | 0 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 0.988 | 5/5 | exclusive | 0.03 / 0.01 | `(Inheritance bicycle permitted) ~NEG` (8) | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | 0 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 0.987 | 5/5 | exclusive | 0.03 / 0.01 | `(ConditionalProperty pedestrian permitted footpath)` (8) | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | 0 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 0.987 | 4/5 | exclusive | 0.03 / 0.01 | `(Inheritance pedestrian permitted) ~NEG` (8) | `(Inheritance metropolitan_statistical_area area)` (4) | 0 | Pedestrians and bicycles are not permitted , but can be allowed on a footpath . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |
| 0.987 | 5/5 | exclusive | 0.01 / 0.01 | `(Inheritance regional_unit unit)` (4) | `(Inheritance metropolitan_statistical_area metropolitan)` (3) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | Peoria is part of the Peoria County , IL Metropolitan Statistical Area . |

## Adopted block: k 32, beta 0, cosine ≥ 0.85 — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.82 / 0.82 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (26) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (26) | 26 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.68 / 0.68 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records | 0.60 / 0.60 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` (9) | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | 9 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.72 / 0.72 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.72 / 0.72 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.72 / 0.72 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records | 0.72 / 0.72 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.72 / 0.72 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.72 / 0.72 | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Member $e0 build) (Past $e0) (Patient $e0 $x0))` (9) | `(And (Member $e0 build) (Past $e0))` (9) | 9 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))` (8) | `(And (Agent $e0 $x0) (Member $e0 build))` (8) | 8 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Agent $e0 $x0) (To $e0 $e1))` (8) | `(And (Agent $e0 $x0) (To $e1 $e0))` (8) | 8 | Thousands gathered to watch the event. | Thousands gathered to watch the event. |
| 1.000 | 5/5 | same-records (part-of) | 0.31 / 0.31 | `(And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Cardinality $x0 <num>) (Patient $e0 $x0))` (7) | 7 | One of the windows was broken. | One of the windows was broken. |
| 1.000 | 5/5 | same-records | 0.38 / 0.38 | `(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))` (7) | `(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))` (7) | 7 | The earth became red with blood. | The earth became red with blood. |
| 1.000 | 5/5 | same-records (part-of) | 0.68 / 0.68 | `(And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 kill) (Past $e0))` (7) | 7 | The soldier was killed in action. | The soldier was killed in action. |
| 1.000 | 5/5 | same-records (part-of) | 0.36 / 0.36 | `(And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 produce) (Past $e0))` (7) | 7 | The thin layer of oil at the top of the soup produced a mesmerizing sheen. | The thin layer of oil at the top of the soup produced a mesmerizing sheen. |
| 1.000 | 5/5 | same-records (part-of) | 0.08 / 0.08 | `(And (Member $e0 capture) (Past $e0))` (6) | `(Member $e0 capture)` (6) | 6 | Spain captured many Algerian cities in the 16th century. | Spain captured many Algerian cities in the 16th century. |
| 1.000 | 5/5 | same-records (part-of) | 0.23 / 0.23 | `(And (Member $e0 receive) (Past $e0))` (6) | `(Member $e0 receive)` (6) | 6 | At the winter festival, Beth received an award for dancing the best. | At the winter festival, Beth received an award for dancing the best. |
| 1.000 | 5/5 | same-records | 0.56 / 0.56 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (5) | `(And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))` (5) | 5 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records | 0.56 / 0.56 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (5) | `(And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))` (5) | 5 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records | 0.56 / 0.56 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (5) | `(And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))` (5) | 5 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records | 0.56 / 0.56 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (5) | `(And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (5) | 5 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records | 0.56 / 0.56 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (5) | `(And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))` (5) | 5 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.56 / 0.56 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (5) | `(And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))` (5) | 5 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.56 / 0.56 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (5) | `(And (Agent $e0 $x0) (Member $e0 begin))` (5) | 5 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
