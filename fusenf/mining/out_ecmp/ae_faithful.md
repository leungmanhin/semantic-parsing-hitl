# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1652 rooted-subtree units of the §4.3.1 faithful view (`out_ecmp/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator (k = 4, 28 eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |
| autoencoder | one hidden layer of k sigmoid units (dial [16, 32, 64], adopted 32), linear output, tied decoder x_hat = h W + c; W uniform(±sqrt(6/(F+k))), b = 0, c = column means |
| loss | mean over records of the squared reconstruction error summed over units + 0.0001·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), rho 0.1, beta dial [0.5] (0 = plain shallow AE), adopted 0.5 |
| training | full batch, Adam lr 0.01, 2000 epochs, float32, 8 thread(s); seed 0 adopted, seeds 0..4 for stability |
| ties | cosine between two units' encoder weight vectors (columns of W); gate cosine ≥ tau, dial [0.8, 0.85, 0.9, 0.95], adopted 0.85; recording floor 0.8 |
| co-occurrence | field per pair from the units' record sets: exclusive / overlapping / nested / same-records; part-of = §4.3.1 containment — never a filter |
| clusters | average linkage on the cosine distance of the weight vectors, cut at 1 − tau (rendering only; the gate is pairwise) |
| renderings | one .metta per bottleneck at the adopted gate (passes grouped by relation, exclusive first); the cosine dial is read off the records; the plain shallow AE (beta 0) is the twin run `ae_faithful_plain.*` when present |

## Count matrix

- 762 records × 1652 units; 8815 non-zero cells (11.57 units per record on average); 552 repeat matches beyond the first (max count 6); 2 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at 25 / 50 / 75 / 100 % of the epochs |
|---|---|---|---|---|---|---|---|
| 16 | 0.5 | 0 | 7.8856 | 0.4046 | 0.1079 | 0.67 | 8.2144 / 8.0823 / 7.9124 / 7.8856 |
| 16 | 0.5 | 1 | 7.8494 | 0.4073 | 0.1069 | 0.69 | 8.1377 / 7.9428 / 7.8614 / 7.8495 |
| 16 | 0.5 | 2 | 7.8409 | 0.408 | 0.1085 | 0.67 | 8.1046 / 7.9972 / 7.9013 / 7.841 |
| 16 | 0.5 | 3 | 7.8551 | 0.4069 | 0.1115 | 0.73 | 8.1159 / 7.9423 / 7.8831 / 7.8552 |
| 16 | 0.5 | 4 | 7.8115 | 0.4102 | 0.1097 | 0.78 | 8.1864 / 7.958 / 7.877 / 7.8116 |
| 32 | 0.5 | 0 | 5.6808 | 0.5711 | 0.1093 | 1.35 | 6.0136 / 5.8009 / 5.7271 / 5.6809 |
| 32 | 0.5 | 1 | 5.6788 | 0.5712 | 0.1082 | 1.34 | 5.9484 / 5.7564 / 5.6989 / 5.6789 |
| 32 | 0.5 | 2 | 5.6758 | 0.5714 | 0.1087 | 1.32 | 5.9846 / 5.7813 / 5.7011 / 5.6758 |
| 32 | 0.5 | 3 | 5.6773 | 0.5713 | 0.1081 | 1.3 | 5.9703 / 5.7752 / 5.7046 / 5.6774 |
| 32 | 0.5 | 4 | 5.6638 | 0.5723 | 0.1084 | 1.35 | 5.9884 / 5.7698 / 5.6863 / 5.6639 |
| 64 | 0.5 | 0 | 3.284 | 0.752 | 0.1092 | 1.93 | 3.769 / 3.4382 / 3.3388 / 3.2841 |
| 64 | 0.5 | 1 | 3.2859 | 0.7519 | 0.1091 | 1.96 | 3.7412 / 3.4215 / 3.3332 / 3.286 |
| 64 | 0.5 | 2 | 3.2767 | 0.7526 | 0.1089 | 2.03 | 3.7442 / 3.4343 / 3.3336 / 3.2767 |
| 64 | 0.5 | 3 | 3.2813 | 0.7522 | 0.1089 | 2.0 | 3.744 / 3.4326 / 3.3325 / 3.2814 |
| 64 | 0.5 | 4 | 3.2727 | 0.7529 | 0.1084 | 1.99 | 3.7675 / 3.4175 / 3.3138 / 3.2728 |

## Tied pairs across the dial

| k | beta | cosine ≥ | pass | exclusive | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | smaller side below the median norm | clusters | weight norm min / median | Tier A recall | control hits |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 16 | 0.5 | 0.80 | 74476 | 50006 | 5659 | 8866 | 9945 | 5106 | 106 | 58918 | 54608 | 70 | 0.02 / 0.144 | 13/26 | begin|end |
| 16 | 0.5 | 0.85 | 65354 | 41700 | 5224 | 8485 | 9945 | 4940 | 106 | 53027 | 46437 | 84 | 0.02 / 0.144 | 11/26 | begin|end |
| 16 | 0.5 | 0.90 | 57648 | 34770 | 4684 | 8249 | 9945 | 4834 | 106 | 47279 | 39137 | 105 | 0.02 / 0.144 | 11/26 | begin|end |
| 16 | 0.5 | 0.95 | 43040 | 21480 | 3763 | 7852 | 9945 | 4661 | 106 | 36599 | 26433 | 146 | 0.02 / 0.144 | 9/26 | begin|end |
| 32 | 0.5 | 0.80 | 39787 | 17444 | 4204 | 8194 | 9945 | 4821 | 106 | 36670 | 25434 | 101 | 0.027 / 0.349 | 10/26 | begin|end |
| 32 | 0.5 | 0.85 | 37062 | 15027 | 3997 | 8093 | 9945 | 4773 | 106 | 34026 | 22765 | 115 | 0.027 / 0.349 | 10/26 | begin|end |
| 32 | 0.5 | 0.90 | 33971 | 12473 | 3656 | 7897 | 9945 | 4706 | 105 | 30985 | 19760 | 141 | 0.027 / 0.349 | 9/26 | begin|end |
| 32 | 0.5 | 0.95 | 28181 | 8195 | 2604 | 7437 | 9945 | 4526 | 105 | 25742 | 14385 | 175 | 0.027 / 0.349 | 8/26 | begin|end |
| 64 | 0.5 | 0.80 | 19843 | 1269 | 2112 | 6517 | 9945 | 4361 | 106 | 18941 | 14683 | 163 | 0.041 / 0.509 | 10/26 | none |
| 64 | 0.5 | 0.85 | 19101 | 1150 | 1901 | 6105 | 9945 | 4229 | 105 | 18206 | 14051 | 187 | 0.041 / 0.509 | 8/26 | none |
| 64 | 0.5 | 0.90 | 18056 | 1033 | 1462 | 5616 | 9945 | 4121 | 105 | 17490 | 13044 | 202 | 0.041 / 0.509 | 5/26 | none |
| 64 | 0.5 | 0.95 | 16841 | 972 | 1165 | 4759 | 9945 | 3895 | 105 | 16449 | 12046 | 233 | 0.041 / 0.509 | 3/26 | none |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85 — top 25 EXCLUSIVE passes (the paper's interchangeability reading)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 editor)` (5) | `(And (Agent $e0 $x0) (Member $x0 panel) (Member $x1 proposal) (Theme $e0 $x1))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 editor)` (5) | `(And (Agent $e0 $x0) (Member $x0 panel) (Theme $e0 $x1))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 editor)` (5) | `(And (Agent $e0 $x0) (Member $x1 proposal) (Theme $e0 $x1))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 editor)` (5) | `(And (Agent $e0 $x0) (Member $x0 panel))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 editor)` (5) | `(And (Member $x0 proposal) (Theme $e0 $x0))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.05 / 0.04 | `(Member $x0 library)` (5) | `(Member $x0 calibration)` (4) | 0 | A library gives each member a card. | The calibration is difficult. |
| 1.000 | 5/5 | exclusive | 0.05 / 0.04 | `(Member $x0 library)` (5) | `(Member $x0 descent)` (4) | 0 | A library gives each member a card. | The descent is difficult. |
| 1.000 | 5/5 | exclusive | 0.05 / 0.04 | `(Member $x0 library)` (5) | `(Member $x0 repair)` (4) | 0 | A library gives each member a card. | The repair is difficult. |
| 1.000 | 5/5 | exclusive | 0.05 / 0.03 | `(Member $x0 library)` (5) | `(Member $x0 hard)` (3) | 0 | A library gives each member a card. | The repair is hard. |
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 manuscript)` (5) | `(And (Agent $e0 $x0) (Member $x0 panel) (Member $x1 proposal) (Theme $e0 $x1))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 manuscript)` (5) | `(And (Agent $e0 $x0) (Member $x0 panel) (Theme $e0 $x1))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 manuscript)` (5) | `(And (Agent $e0 $x0) (Member $x1 proposal) (Theme $e0 $x1))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 manuscript)` (5) | `(And (Agent $e0 $x0) (Member $x0 panel))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.13 / 0.10 | `(Member $x0 manuscript)` (5) | `(And (Member $x0 proposal) (Theme $e0 $x0))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.04 / 0.04 | `(And (Inheritance night_crew crew) (Member $x0 night_crew))` (4) | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | 0 | The night crew is exhausted. | Methoni is a village and a former municipality in Pieria regional unit , Greece . |
| 1.000 | 5/5 | exclusive | 0.04 / 0.04 | `(And (Inheritance night_crew crew) (Member $x0 night_crew))` (4) | `(Inheritance regional_unit regional)` (4) | 0 | The night crew is exhausted. | Methoni is a village and a former municipality in Pieria regional unit , Greece . |
| 1.000 | 5/5 | exclusive | 0.04 / 0.04 | `(And (Inheritance night_crew crew) (Member $x0 night_crew))` (4) | `(Inheritance regional_unit unit)` (4) | 0 | The night crew is exhausted. | Methoni is a village and a former municipality in Pieria regional unit , Greece . |
| 1.000 | 5/5 | exclusive | 0.04 / 0.04 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(Inheritance night_crew crew)` (4) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | The night crew is exhausted. |
| 1.000 | 5/5 | exclusive | 0.04 / 0.04 | `(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))` (4) | `(Member $x0 night_crew)` (4) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | The night crew is exhausted. |
| 1.000 | 5/5 | exclusive | 0.04 / 0.04 | `(Inheritance night_crew crew)` (4) | `(Inheritance regional_unit regional)` (4) | 0 | The night crew is exhausted. | Methoni is a village and a former municipality in Pieria regional unit , Greece . |
| 1.000 | 5/5 | exclusive | 0.04 / 0.04 | `(Inheritance night_crew crew)` (4) | `(Inheritance regional_unit unit)` (4) | 0 | The night crew is exhausted. | Methoni is a village and a former municipality in Pieria regional unit , Greece . |
| 1.000 | 5/5 | exclusive | 0.04 / 0.04 | `(Inheritance regional_unit unit)` (4) | `(Member $x0 night_crew)` (4) | 0 | Methoni is a village and a former municipality in Pieria regional unit , Greece . | The night crew is exhausted. |
| 1.000 | 5/5 | exclusive | 0.14 / 0.14 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.14 / 0.14 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.14 / 0.14 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85 — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.61 / 0.61 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |

## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)

- an expected lemma pair counts as recovered when a PASS pair's two units mention the two lemmas as `(Member $e lemma)` atoms; lexical control pairs (antonyms / near-misses) linked the same way are control hits

- adopted block: recall 10/26; recovered: abandon|give_up, allow|permit, begin|commence, begin|start, call_off|cancel, cause|destroy, discover|find_out, need|require, postpone|put_off, reject|turn_down; missed: acquire|buy, answer|give, arrival|arrive, borrow|lend, buy|purchase, buy|sell, decide|decision, decide|make, decide|reach, die|kick_the_bucket, error|find_out, fix|repair, give|receive, learn|teach, mend|repair, take|walk; control hits: begin|end

