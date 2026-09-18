# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1652 rooted-subtree units of the §4.3.1 faithful view (`out_ecmp/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
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

- 762 records × 1652 units; 8815 non-zero cells (11.57 units per record on average); 552 repeat matches beyond the first (max count 6); 2 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 2 | 0 | 5.6348 | 0.5745 | 0.1016 | 1.27 | 6.1449 / 5.8824 / 5.7352 / 5.6549 / 5.6471 / 5.6388 / 5.6361 / 5.6395 / 5.6351 / 5.6348 |
| 32 | 2 | 1 | 5.6326 | 0.5747 | 0.1019 | 1.32 | 6.1707 / 5.9284 / 5.7406 / 5.6721 / 5.6405 / 5.6389 / 5.6389 / 5.6346 / 5.6324 / 5.6323 |
| 32 | 2 | 2 | 5.6256 | 0.5752 | 0.1022 | 1.29 | 6.1178 / 5.8477 / 5.7382 / 5.6747 / 5.6538 / 5.6327 / 5.6298 / 5.6253 / 5.6277 / 5.6253 |
| 32 | 2 | 3 | 5.6338 | 0.5746 | 0.102 | 1.3 | 6.1609 / 5.8635 / 5.714 / 5.6766 / 5.6457 / 5.6398 / 5.6422 / 5.6337 / 5.6426 / 5.6338 |
| 32 | 2 | 4 | 5.6471 | 0.5736 | 0.102 | 1.33 | 6.1263 / 5.8648 / 5.7731 / 5.6799 / 5.6612 / 5.654 / 5.6505 / 5.6424 / 5.6412 / 5.6479 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 2 | 0.000 (1652) | 0.333 (827) | 0.195 (1071) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init | Tier A recall | control hits |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 2 | 0.80 | 19854 | 1840 | 2386 | 6900 | 8728 | 3624 | 100 | 19446 | 52 (20 / 581) | 40411 / 17855 | 13663 / 304 | 19854 / 1840 | 3/26 | none |
| 32 | 2 | 0.85 | 19323 | 1532 | 2260 | 6803 | 8728 | 3579 | 100 | 19089 | 54 (28 / 581) | 37311 / 15248 | 13503 / 303 | 19323 / 1532 | 3/26 | none |
| 32 | 2 | 0.90 | 18990 | 1418 | 2112 | 6732 | 8728 | 3557 | 99 | 18326 | 57 (33 / 581) | 32048 / 10478 | 13402 / 303 | 18990 / 1418 | 3/26 | none |
| 32 | 2 | 0.95 | 18088 | 1334 | 1606 | 6420 | 8728 | 3451 | 99 | 17471 | 62 (42 / 581) | 27566 / 7358 | 13021 / 303 | 18088 / 1334 | 3/26 | none |

## Adopted block: k 32, beta 2, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 council))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |

## Adopted block: k 32, beta 2, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |

## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)

- an expected lemma pair counts as recovered when a PASS pair's two units mention the two lemmas as `(Member $e lemma)` atoms; lexical control pairs (antonyms / near-misses) linked the same way are control hits

- adopted block: recall 3/26; recovered: begin|commence, begin|start, cause|destroy; missed: abandon|give_up, acquire|buy, allow|permit, answer|give, arrival|arrive, borrow|lend, buy|purchase, buy|sell, call_off|cancel, decide|decision, decide|make, decide|reach, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, give|receive, learn|teach, mend|repair, need|require, postpone|put_off, reject|turn_down, take|walk; control hits: none

