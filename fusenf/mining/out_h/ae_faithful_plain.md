# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1454 rooted-subtree units of the §4.3.1 faithful view (`out_h/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator (k = 4, 28 eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |
| autoencoder | one hidden layer of k sigmoid units (dial [32], adopted 32), linear output, tied decoder x_hat = h W + c; W uniform(±sqrt(6/(F+k))), b = 0, c = column means |
| loss | mean over records of the squared reconstruction error summed over units + 0.0001·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), rho 0.1, beta [0.0] (adopted 0; the plain AE beta 0 and beta 2 are twin runs `ae_faithful_plain_plain.*` / `ae_faithful_plain_beta2.*` when present) |
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
| 32 | 0 | 0 | 2.8163 | 0.5411 | 0.3274 | 8.64 | 2.8971 / 2.8438 / 2.8382 / 2.8094 / 2.802 / 2.7914 / 2.8401 / 2.8052 / 2.7834 / 2.8113 |
| 32 | 0 | 1 | 2.7785 | 0.5473 | 0.2855 | 7.31 | 2.8995 / 2.8481 / 2.8859 / 2.8058 / 2.7892 / 2.8284 / 2.7815 / 2.8286 / 2.8002 / 2.7785 |
| 32 | 0 | 2 | 2.7914 | 0.5452 | 0.3284 | 8.44 | 2.9007 / 2.8455 / 2.8237 / 2.8127 / 2.8061 / 2.8037 / 2.8078 / 2.7953 / 2.7977 / 2.7913 |
| 32 | 0 | 3 | 2.7867 | 0.546 | 0.3231 | 9.01 | 2.8944 / 2.8384 / 2.8201 / 2.823 / 2.8057 / 2.7973 / 2.8104 / 2.8304 / 2.8123 / 2.7859 |
| 32 | 0 | 4 | 2.7955 | 0.5445 | 0.2673 | 7.01 | 2.8989 / 2.8415 / 2.8214 / 2.8081 / 2.7962 / 2.786 / 2.7869 / 2.7897 / 2.792 / 2.794 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 0 | 0.000 (1454) | 0.131 (727) | 0.208 (568) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive (shape-parallel) | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0 | 0.80 | 7014 | 38 (4) | 1323 | 3477 | 2176 | 1277 | 84 | 6695 | 69 (38 / 886) | 10293 / 1354 | 7829 / 104 | 7014 / 38 |
| 32 | 0 | 0.85 | 6616 | 3 (0) | 1131 | 3306 | 2176 | 1205 | 81 | 6425 | 72 (45 / 886) | 8891 / 778 | 7265 / 43 | 6616 / 3 |
| 32 | 0 | 0.90 | 6300 | 0 (0) | 941 | 3183 | 2176 | 1154 | 76 | 6068 | 74 (57 / 886) | 7687 / 375 | 6725 / 5 | 6300 / 0 |
| 32 | 0 | 0.95 | 5776 | 0 (0) | 603 | 2997 | 2176 | 1058 | 66 | 5441 | 78 (79 / 886) | 6554 / 165 | 6025 / 0 | 5776 / 0 |

## Adopted block: k 32, beta 0, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading; shape-parallel ones are the rules)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 0.892 | 5/5 | exclusive | 0.32 / 0.45 | `(And (Instrument $e0 $x0) (Past $e0))` (10) | `(And (Member $x0 room) (Patient $e0 $x0))` (5) | 0 | A wild boar was caught in a snare. | The room was dimly lit. |
| 0.879 | 4/5 | exclusive | 0.22 / 0.45 | `(And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))` (5) | `(And (Member $x0 room) (Patient $e0 $x0))` (5) | 0 | James tied the bodyguards together with a rope. | The room was dimly lit. |
| 0.867 | 5/5 | exclusive | 0.26 / 0.27 | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` (9) | `(Member $x0 crowd)` (4) | 0 | The rebels began distributing food and clothing from the storehouse to the locals. | The crowd began to applaud. |

## Adopted block: k 32, beta 0, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.94 / 0.94 | `(And (Holder $e0 $x0) (Member $e0 have))` (27) | `(Holder $e0 $x0)` (27) | 27 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.92 / 0.92 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (26) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (26) | 26 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.95 / 0.95 | `(And (Member $e0 build) (Patient $e0 $x0))` (13) | `(Member $e0 build)` (13) | 13 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.75 / 0.75 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Before $e0 $e1) (Past $e0) (Past $e1))` (11) | `(And (Before $e0 $e1) (Past $e0))` (11) | 11 | Ivan killed several people and then escaped. | Ivan killed several people and then escaped. |
| 1.000 | 5/5 | same-records | 0.82 / 0.82 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` (9) | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | 9 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records | 0.93 / 0.93 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 begin) (Theme $e0 $e1))` (9) | 9 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.78 / 0.78 | `(And (Member $e0 build) (Past $e0) (Patient $e0 $x0))` (9) | `(And (Member $e0 build) (Past $e0))` (9) | 9 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records (part-of) | 0.94 / 0.94 | `(And (Member $e0 kill) (Patient $e0 $x0))` (9) | `(Member $e0 kill)` (9) | 9 | The soldier was killed in action. | The soldier was killed in action. |
| 1.000 | 5/5 | same-records (part-of) | 0.79 / 0.79 | `(And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))` (8) | `(And (Agent $e0 $x0) (Member $e0 build))` (8) | 8 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records | 0.81 / 0.81 | `(And (Agent $e0 $x0) (To $e0 $e1))` (8) | `(And (Agent $e0 $x0) (To $e1 $e0))` (8) | 8 | Thousands gathered to watch the event. | Thousands gathered to watch the event. |
| 1.000 | 5/5 | same-records (part-of) | 0.39 / 0.39 | `(And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Cardinality $x0 <num>) (Patient $e0 $x0))` (7) | 7 | One of the windows was broken. | One of the windows was broken. |
| 1.000 | 5/5 | same-records | 0.46 / 0.46 | `(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))` (7) | `(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))` (7) | 7 | The earth became red with blood. | The earth became red with blood. |
| 1.000 | 5/5 | same-records (part-of) | 0.90 / 0.90 | `(And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 kill) (Past $e0))` (7) | 7 | The soldier was killed in action. | The soldier was killed in action. |
| 1.000 | 5/5 | same-records (part-of) | 0.36 / 0.36 | `(And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 produce) (Past $e0))` (7) | 7 | The thin layer of oil at the top of the soup produced a mesmerizing sheen. | The thin layer of oil at the top of the soup produced a mesmerizing sheen. |
| 1.000 | 5/5 | same-records (part-of) | 0.23 / 0.23 | `(And (Member $e0 write) (Past $e0) (Patient $e0 $x0))` (7) | `(And (Member $e0 write) (Past $e0))` (7) | 7 | This book had been written by someone famous. | This book had been written by someone famous. |
| 1.000 | 5/5 | same-records (part-of) | 0.90 / 0.90 | `(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))` (6) | `(And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))` (6) | 6 | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  |
| 1.000 | 5/5 | same-records (part-of) | 0.78 / 0.78 | `(And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))` (6) | `(And (Agent $e0 $x0) (Member $e0 build) (Past $e0))` (6) | 6 | In Ghardaia, Mozabites built a network of wells connected by underground channels. | In Ghardaia, Mozabites built a network of wells connected by underground channels. |
| 1.000 | 5/5 | same-records | 0.77 / 0.77 | `(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (5) | `(And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))` (5) | 5 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
