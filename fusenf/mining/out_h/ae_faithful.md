# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1454 rooted-subtree units of the §4.3.1 faithful view (`out_h/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator (k = 4, 28 eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |
| autoencoder | one hidden layer of k sigmoid units (dial [32, 64, 128], adopted 32), linear output, tied decoder x_hat = h W + c; W uniform(±sqrt(6/(F+k))), b = 0, c = column means |
| loss | mean over records of the squared reconstruction error summed over units + 0.0001·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), rho 0.1, beta [0.5] (adopted 0.5; the plain AE beta 0 and beta 2 are twin runs `ae_faithful_plain.*` / `ae_faithful_beta2.*` when present) |
| training | full batch, Adam lr 0.01, 10000 epochs, float32, 8 thread(s); seed 0 adopted, seeds 0..4 for stability |
| ties | cosine between two units' encoder weight vectors (columns of W); gate cosine ≥ tau, dial [0.8, 0.85, 0.9, 0.95], adopted 0.85; recording floor 0.8 |
| norm floor | a unit enters the comparison when its encoder-vector norm is at least the floor; dial none, median, init, adopted init (init = the initialisation norm a·sqrt(k/3), a = sqrt(6/(F+k)): training grew the vector beyond where it started; median = the median unit norm) |
| co-occurrence | field per pair from the units' record sets: exclusive / overlapping / nested / same-records; part-of = §4.3.1 containment — never a filter |
| tie groups | complete linkage on the cosine distance of the entering units' weight vectors, cut at 1 − tau: every pair inside a group passes the gate; a partition (the pairwise record is the JSONL) |
| renderings | one .metta per bottleneck at the adopted gate (passes grouped by relation, exclusive first); the cosine and floor dials are read off the records |

## Count matrix

- 2302 records × 1454 units; 11330 non-zero cells (4.92 units per record on average); 1075 repeat matches beyond the first (max count 6); 2 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 0.5 | 0 | 2.81 | 0.5422 | 0.1017 | 0.62 | 2.9781 / 2.8754 / 2.8503 / 2.834 / 2.8176 / 2.8153 / 2.8146 / 2.8135 / 2.8094 / 2.8103 |
| 32 | 0.5 | 1 | 2.8093 | 0.5423 | 0.1027 | 0.67 | 2.9515 / 2.8572 / 2.8319 / 2.8242 / 2.8139 / 2.809 / 2.8084 / 2.8106 / 2.8085 / 2.8087 |
| 32 | 0.5 | 2 | 2.8027 | 0.5433 | 0.1025 | 0.64 | 2.9494 / 2.8578 / 2.8256 / 2.8147 / 2.8091 / 2.8066 / 2.803 / 2.8061 / 2.8022 / 2.8027 |
| 32 | 0.5 | 3 | 2.7988 | 0.544 | 0.1024 | 0.66 | 2.952 / 2.8498 / 2.8204 / 2.8111 / 2.8067 / 2.8025 / 2.7993 / 2.7987 / 2.7958 / 2.7985 |
| 32 | 0.5 | 4 | 2.7927 | 0.545 | 0.1026 | 0.65 | 2.9361 / 2.8463 / 2.8164 / 2.8049 / 2.8012 / 2.8006 / 2.7991 / 2.7998 / 2.7935 / 2.7925 |
| 64 | 0.5 | 0 | 2.0959 | 0.6585 | 0.1017 | 0.92 | 2.3741 / 2.2014 / 2.1599 / 2.1394 / 2.1234 / 2.1104 / 2.1038 / 2.0996 / 2.1042 / 2.0958 |
| 64 | 0.5 | 1 | 2.0982 | 0.6581 | 0.1019 | 0.9 | 2.3553 / 2.1941 / 2.1495 / 2.1303 / 2.1157 / 2.1051 / 2.1022 / 2.0973 / 2.0986 / 2.0985 |
| 64 | 0.5 | 2 | 2.1047 | 0.6571 | 0.1018 | 0.81 | 2.3438 / 2.1875 / 2.1485 / 2.1276 / 2.1123 / 2.1062 / 2.108 / 2.1012 / 2.1026 / 2.106 |
| 64 | 0.5 | 3 | 2.098 | 0.6582 | 0.1015 | 0.89 | 2.3698 / 2.1979 / 2.1554 / 2.1351 / 2.1223 / 2.1101 / 2.1068 / 2.1072 / 2.1004 / 2.0989 |
| 64 | 0.5 | 4 | 2.097 | 0.6583 | 0.1016 | 0.83 | 2.3537 / 2.1935 / 2.1519 / 2.1301 / 2.1138 / 2.1035 / 2.104 / 2.0995 / 2.0951 / 2.0977 |
| 128 | 0.5 | 0 | 1.4159 | 0.7693 | 0.1011 | 0.89 | 2.2575 / 1.6701 / 1.5186 / 1.4738 / 1.4509 / 1.4352 / 1.4336 / 1.436 / 1.4686 / 1.4165 |
| 128 | 0.5 | 1 | 1.4274 | 0.7674 | 0.1011 | 0.84 | 2.2463 / 1.6671 / 1.52 / 1.4766 / 1.453 / 1.4376 / 1.4519 / 1.4227 / 1.4403 / 1.4262 |
| 128 | 0.5 | 2 | 1.428 | 0.7673 | 0.1015 | 0.92 | 2.2442 / 1.6673 / 1.5197 / 1.4753 / 1.4511 / 1.4364 / 1.4358 / 1.4518 / 1.424 / 1.4259 |
| 128 | 0.5 | 3 | 1.4191 | 0.7688 | 0.1015 | 0.88 | 2.2509 / 1.6721 / 1.5225 / 1.4773 / 1.4544 / 1.4392 / 1.4384 / 1.4336 / 1.4297 / 1.4185 |
| 128 | 0.5 | 4 | 1.4381 | 0.7657 | 0.1016 | 0.97 | 2.2426 / 1.6756 / 1.522 / 1.4773 / 1.4534 / 1.4368 / 1.4399 / 1.4824 / 1.4345 / 1.4332 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 0.5 | 0.000 (1454) | 0.143 (727) | 0.208 (609) |
| 64 | 0.5 | 0.000 (1454) | 0.299 (727) | 0.290 (776) |
| 128 | 0.5 | 0.000 (1454) | 0.585 (728) | 0.402 (1000) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0.5 | 0.80 | 7273 | 31 | 1507 | 3533 | 2202 | 1336 | 82 | 6911 | 69 (42 / 845) | 10393 / 1394 | 7862 / 83 | 7273 / 31 |
| 32 | 0.5 | 0.85 | 6896 | 8 | 1207 | 3479 | 2202 | 1311 | 82 | 6566 | 77 (50 / 845) | 8979 / 763 | 7342 / 26 | 6896 / 8 |
| 32 | 0.5 | 0.90 | 6467 | 3 | 915 | 3347 | 2202 | 1246 | 80 | 6047 | 85 (62 / 845) | 7803 / 393 | 6751 / 4 | 6467 / 3 |
| 32 | 0.5 | 0.95 | 5685 | 2 | 485 | 2996 | 2202 | 1091 | 72 | 5385 | 86 (89 / 845) | 6345 / 156 | 5828 / 2 | 5685 / 2 |
| 64 | 0.5 | 0.80 | 4737 | 42 | 1164 | 1727 | 1804 | 1246 | 82 | 4583 | 122 (67 / 678) | 8223 / 379 | 3998 / 34 | 4737 / 42 |
| 64 | 0.5 | 0.85 | 4230 | 16 | 898 | 1512 | 1804 | 1162 | 81 | 4071 | 129 (91 / 678) | 7224 / 186 | 3559 / 10 | 4230 / 16 |
| 64 | 0.5 | 0.90 | 3810 | 2 | 636 | 1368 | 1804 | 1105 | 76 | 3656 | 140 (108 / 678) | 6445 / 75 | 3150 / 2 | 3810 / 2 |
| 64 | 0.5 | 0.95 | 3325 | 0 | 340 | 1181 | 1804 | 996 | 68 | 3160 | 145 (150 / 678) | 5593 / 34 | 2747 / 0 | 3325 / 0 |
| 128 | 0.5 | 0.80 | 2119 | 3 | 512 | 961 | 643 | 996 | 72 | 2031 | 232 (144 / 454) | 5391 / 39 | 1262 / 0 | 2119 / 3 |
| 128 | 0.5 | 0.85 | 1849 | 0 | 365 | 841 | 643 | 918 | 69 | 1788 | 232 (188 / 454) | 4926 / 32 | 1123 / 0 | 1849 / 0 |
| 128 | 0.5 | 0.90 | 1549 | 0 | 220 | 686 | 643 | 830 | 65 | 1461 | 235 (234 / 454) | 4530 / 26 | 987 / 0 | 1549 / 0 |
| 128 | 0.5 | 0.95 | 1192 | 0 | 53 | 498 | 641 | 687 | 58 | 1149 | 221 (318 / 454) | 3345 / 21 | 758 / 0 | 1192 / 0 |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 0.959 | 5/5 | exclusive | 0.26 / 0.24 | `(Member $x0 crowd)` (4) | `(And (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1))` (3) | 0 | The crowd began to applaud. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.959 | 5/5 | exclusive | 0.26 / 0.24 | `(Member $x0 crowd)` (4) | `(And (Recipient $e0 $x0) (Theme $e1 $e0))` (3) | 0 | The crowd began to applaud. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.915 | 5/5 | exclusive | 0.32 / 0.26 | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` (9) | `(Member $x0 crowd)` (4) | 0 | The rebels began distributing food and clothing from the storehouse to the locals. | The crowd began to applaud. |
| 0.898 | 5/5 | exclusive | 0.21 / 0.22 | `(And (Goal $e0 $x0) (Patient $e0 $x1))` (7) | `(And (Goal $e0 $x0) (Theme $e0 $x1))` (6) | 0 | The lid screws onto the jar. | The cook added cloves to the sauce. |
| 0.889 | 4/5 | exclusive | 0.34 / 0.26 | `(Recipient $e0 $x0)` (17) | `(Member $x0 crowd)` (4) | 0 | The thief was handed over to the police. | The crowd began to applaud. |
| 0.884 | 4/5 | exclusive | 0.21 / 0.22 | `(And (Goal $e0 $x0) (Patient $e0 $x1))` (7) | `(And (Goal $e0 $x0) (Member $e0 go))` (6) | 0 | The lid screws onto the jar. | Mom went to the supermarket. |
| 0.874 | 5/5 | exclusive | 0.72 / 0.21 | `(And (Agent $e0 $x0) (Goal $e0 $x1))` (17) | `(And (Goal $e0 $x0) (Patient $e0 $x1))` (7) | 0 | A few customers have just walked into the store. | The lid screws onto the jar. |
| 0.860 | 4/5 | exclusive | 0.62 / 0.21 | `(And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))` (13) | `(And (Goal $e0 $x0) (Patient $e0 $x1))` (7) | 0 | A few customers have just walked into the store. | The lid screws onto the jar. |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.97 / 0.97 | `(And (Holder $e0 $x0) (Member $e0 have))` (27) | `(Holder $e0 $x0)` (27) | 27 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.95 / 0.95 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (26) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (26) | 26 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.77 / 0.77 | `(And (Member $e0 build) (Patient $e0 $x0))` (13) | `(Member $e0 build)` (13) | 13 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.83 / 0.83 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.68 / 0.68 | `(And (Before $e0 $e1) (Past $e0) (Past $e1))` (11) | `(And (Before $e0 $e1) (Past $e0))` (11) | 11 | Ivan killed several people and then escaped. | Ivan killed several people and then escaped. |
| 1.000 | 5/5 | same-records | 0.70 / 0.70 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` (9) | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | 9 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.86 / 0.86 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.86 / 0.86 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.86 / 0.86 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.71 / 0.71 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records | 0.86 / 0.86 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.86 / 0.86 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.86 / 0.86 | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.74 / 0.74 | `(And (Member $e0 build) (Past $e0) (Patient $e0 $x0))` (9) | `(And (Member $e0 build) (Past $e0))` (9) | 9 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.85 / 0.85 | `(And (Member $e0 kill) (Patient $e0 $x0))` (9) | `(Member $e0 kill)` (9) | 9 | The soldier was killed in action. | The soldier was killed in action. |
| 1.000 | 5/5 | same-records (part-of) | 0.71 / 0.71 | `(And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))` (8) | `(And (Agent $e0 $x0) (Member $e0 build))` (8) | 8 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records | 0.81 / 0.81 | `(And (Agent $e0 $x0) (To $e0 $e1))` (8) | `(And (Agent $e0 $x0) (To $e1 $e0))` (8) | 8 | Thousands gathered to watch the event. | Thousands gathered to watch the event. |
| 1.000 | 5/5 | same-records (part-of) | 0.36 / 0.36 | `(And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Cardinality $x0 <num>) (Patient $e0 $x0))` (7) | 7 | One of the windows was broken. | One of the windows was broken. |
| 1.000 | 5/5 | same-records | 0.53 / 0.53 | `(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))` (7) | `(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))` (7) | 7 | The earth became red with blood. | The earth became red with blood. |
| 1.000 | 5/5 | same-records (part-of) | 0.82 / 0.82 | `(And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 kill) (Past $e0))` (7) | 7 | The soldier was killed in action. | The soldier was killed in action. |
| 1.000 | 5/5 | same-records (part-of) | 0.32 / 0.32 | `(And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 produce) (Past $e0))` (7) | 7 | The thin layer of oil at the top of the soup produced a mesmerizing sheen. | The thin layer of oil at the top of the soup produced a mesmerizing sheen. |
| 1.000 | 5/5 | same-records (part-of) | 0.25 / 0.25 | `(And (Member $e0 write) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 write) (Past $e0))` (7) | 7 | This book had been written by someone famous. | This book had been written by someone famous. |
| 1.000 | 5/5 | same-records (part-of) | 0.85 / 0.85 | `(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))` (6) | `(And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))` (6) | 6 | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  |
| 1.000 | 5/5 | same-records (part-of) | 0.72 / 0.72 | `(And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))` (6) | `(And (Agent $e0 $x0) (Member $e0 build) (Past $e0))` (6) | 6 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.25 / 0.25 | `(And (Member $e0 receive) (Past $e0))` (6) | `(Member $e0 receive)` (6) | 6 | At the winter festival, Beth received an award for dancing the best. | At the winter festival, Beth received an award for dancing the best. |
