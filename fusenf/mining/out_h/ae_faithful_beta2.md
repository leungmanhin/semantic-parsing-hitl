# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1454 rooted-subtree units of the §4.3.1 faithful view (`out_h/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator (k = 4, 28 eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |
| autoencoder | one hidden layer of k sigmoid units (dial [32], adopted 32), linear output, tied decoder x_hat = h W + c; W uniform(±sqrt(6/(F+k))), b = 0, c = column means |
| loss | mean over records of the squared reconstruction error summed over units + 0.0001·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), rho 0.1, beta [2.0] (adopted 2; the plain AE beta 0 and beta 2 are twin runs `ae_faithful_beta2_plain.*` / `ae_faithful_beta2_beta2.*` when present) |
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
| 32 | 2 | 0 | 2.8259 | 0.5396 | 0.1006 | 0.63 | 3.2067 / 2.9792 / 2.9004 / 2.8537 / 2.8345 / 2.8336 / 2.8309 / 2.8296 / 2.8288 / 2.8258 |
| 32 | 2 | 1 | 2.803 | 0.5433 | 0.1004 | 0.63 | 3.2075 / 3.0093 / 2.9073 / 2.8608 / 2.8324 / 2.8105 / 2.8151 / 2.8094 / 2.8058 / 2.8025 |
| 32 | 2 | 2 | 2.8084 | 0.5424 | 0.1006 | 0.61 | 3.178 / 2.9733 / 2.8895 / 2.8448 / 2.8303 / 2.8176 / 2.8152 / 2.8095 / 2.8102 / 2.8085 |
| 32 | 2 | 3 | 2.8256 | 0.5396 | 0.1007 | 0.63 | 3.1646 / 2.9495 / 2.8976 / 2.838 / 2.8305 / 2.8288 / 2.8259 / 2.826 / 2.8344 / 2.8256 |
| 32 | 2 | 4 | 2.8076 | 0.5425 | 0.1006 | 0.62 | 3.1868 / 2.9852 / 2.8827 / 2.8421 / 2.8243 / 2.8135 / 2.8131 / 2.8147 / 2.8068 / 2.8076 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 2 | 0.000 (1454) | 0.141 (727) | 0.208 (606) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 2 | 0.80 | 7311 | 14 | 1469 | 3613 | 2215 | 1364 | 82 | 6852 | 69 (41 / 848) | 10218 / 1200 | 7887 / 88 | 7311 / 14 |
| 32 | 2 | 0.85 | 6960 | 7 | 1198 | 3540 | 2215 | 1326 | 82 | 6566 | 69 (53 / 848) | 8939 / 666 | 7382 / 35 | 6960 / 7 |
| 32 | 2 | 0.90 | 6412 | 3 | 881 | 3313 | 2215 | 1231 | 80 | 6077 | 81 (65 / 848) | 7645 / 354 | 6684 / 7 | 6412 / 3 |
| 32 | 2 | 0.95 | 5781 | 2 | 505 | 3059 | 2215 | 1113 | 73 | 5394 | 86 (89 / 848) | 6413 / 152 | 5895 / 2 | 5781 / 2 |

## Adopted block: k 32, beta 2, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 0.963 | 5/5 | exclusive | 0.27 / 0.24 | `(Member $x0 crowd)` (4) | `(And (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1))` (3) | 0 | The crowd began to applaud. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.963 | 5/5 | exclusive | 0.27 / 0.24 | `(Member $x0 crowd)` (4) | `(And (Recipient $e0 $x0) (Theme $e1 $e0))` (3) | 0 | The crowd began to applaud. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 0.931 | 5/5 | exclusive | 0.27 / 0.25 | `(Agent $e0 david)` (3) | `(Agent $e0 mark)` (3) | 0 | David was trying to reach Amanda. | Mark and Jessica began hanging out often. |
| 0.892 | 5/5 | exclusive | 0.29 / 0.27 | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` (9) | `(Member $x0 crowd)` (4) | 0 | The rebels began distributing food and clothing from the storehouse to the locals. | The crowd began to applaud. |
| 0.873 | 5/5 | exclusive | 0.32 / 0.27 | `(Recipient $e0 $x0)` (17) | `(Member $x0 crowd)` (4) | 0 | The thief was handed over to the police. | The crowd began to applaud. |
| 0.862 | 2/5 | exclusive | 0.27 / 0.24 | `(Agent $e0 david)` (3) | `(Agent $e0 william)` (3) | 0 | David was trying to reach Amanda. | William is the type of friend who always listens and gives good advice. |
| 0.857 | 3/5 | exclusive | 0.25 / 0.24 | `(Agent $e0 mark)` (3) | `(Agent $e0 william)` (3) | 0 | Mark and Jessica began hanging out often. | William is the type of friend who always listens and gives good advice. |

## Adopted block: k 32, beta 2, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.96 / 0.96 | `(And (Holder $e0 $x0) (Member $e0 have))` (27) | `(Holder $e0 $x0)` (27) | 27 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.95 / 0.95 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (26) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (26) | 26 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.82 / 0.82 | `(And (Member $e0 build) (Patient $e0 $x0))` (13) | `(Member $e0 build)` (13) | 13 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.80 / 0.80 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.68 / 0.68 | `(And (Before $e0 $e1) (Past $e0) (Past $e1))` (11) | `(And (Before $e0 $e1) (Past $e0))` (11) | 11 | Ivan killed several people and then escaped. | Ivan killed several people and then escaped. |
| 1.000 | 5/5 | same-records | 0.73 / 0.73 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` (9) | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | 9 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.99 / 0.99 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.99 / 0.99 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.99 / 0.99 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.69 / 0.69 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records | 0.99 / 0.99 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.99 / 0.99 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.99 / 0.99 | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.77 / 0.77 | `(And (Member $e0 build) (Past $e0) (Patient $e0 $x0))` (9) | `(And (Member $e0 build) (Past $e0))` (9) | 9 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.83 / 0.83 | `(And (Member $e0 kill) (Patient $e0 $x0))` (9) | `(Member $e0 kill)` (9) | 9 | The soldier was killed in action. | The soldier was killed in action. |
| 1.000 | 5/5 | same-records (part-of) | 0.76 / 0.76 | `(And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))` (8) | `(And (Agent $e0 $x0) (Member $e0 build))` (8) | 8 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records | 0.77 / 0.77 | `(And (Agent $e0 $x0) (To $e0 $e1))` (8) | `(And (Agent $e0 $x0) (To $e1 $e0))` (8) | 8 | Thousands gathered to watch the event. | Thousands gathered to watch the event. |
| 1.000 | 5/5 | same-records (part-of) | 0.35 / 0.35 | `(And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Cardinality $x0 <num>) (Patient $e0 $x0))` (7) | 7 | One of the windows was broken. | One of the windows was broken. |
| 1.000 | 5/5 | same-records | 0.43 / 0.43 | `(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))` (7) | `(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))` (7) | 7 | The earth became red with blood. | The earth became red with blood. |
| 1.000 | 5/5 | same-records (part-of) | 0.80 / 0.80 | `(And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 kill) (Past $e0))` (7) | 7 | The soldier was killed in action. | The soldier was killed in action. |
| 1.000 | 5/5 | same-records (part-of) | 0.30 / 0.30 | `(And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 produce) (Past $e0))` (7) | 7 | The thin layer of oil at the top of the soup produced a mesmerizing sheen. | The thin layer of oil at the top of the soup produced a mesmerizing sheen. |
| 1.000 | 5/5 | same-records (part-of) | 0.29 / 0.29 | `(And (Member $e0 write) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 write) (Past $e0))` (7) | 7 | This book had been written by someone famous. | This book had been written by someone famous. |
| 1.000 | 5/5 | same-records (part-of) | 0.95 / 0.95 | `(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))` (6) | `(And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))` (6) | 6 | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  |
| 1.000 | 5/5 | same-records (part-of) | 0.75 / 0.75 | `(And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))` (6) | `(And (Agent $e0 $x0) (Member $e0 build) (Past $e0))` (6) | 6 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.31 / 0.31 | `(And (Member $e0 receive) (Past $e0))` (6) | `(Member $e0 receive)` (6) | 6 | At the winter festival, Beth received an award for dancing the best. | At the winter festival, Beth received an award for dancing the best. |
