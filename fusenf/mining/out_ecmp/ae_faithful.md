# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1652 rooted-subtree units of the §4.3.1 faithful view (`out_ecmp/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
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

- 762 records × 1652 units; 8815 non-zero cells (11.57 units per record on average); 552 repeat matches beyond the first (max count 6); 2 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 0.5 | 0 | 5.6191 | 0.5757 | 0.1073 | 1.44 | 5.8009 / 5.6809 / 5.649 / 5.6328 / 5.6241 / 5.6208 / 5.6176 / 5.6179 / 5.6211 / 5.6192 |
| 32 | 0.5 | 1 | 5.6219 | 0.5755 | 0.1073 | 1.46 | 5.7564 / 5.6789 / 5.6537 / 5.6371 / 5.6266 / 5.6202 / 5.6193 / 5.6154 / 5.6163 / 5.6218 |
| 32 | 0.5 | 2 | 5.6138 | 0.5761 | 0.1075 | 1.44 | 5.7813 / 5.6758 / 5.6442 / 5.624 / 5.6205 / 5.6201 / 5.6244 / 5.6187 / 5.6201 / 5.6138 |
| 32 | 0.5 | 3 | 5.6339 | 0.5746 | 0.1065 | 1.38 | 5.7752 / 5.6774 / 5.662 / 5.6557 / 5.6483 / 5.631 / 5.639 / 5.6374 / 5.6293 / 5.632 |
| 32 | 0.5 | 4 | 5.6084 | 0.5765 | 0.1082 | 1.45 | 5.7698 / 5.6639 / 5.6414 / 5.6264 / 5.6198 / 5.6158 / 5.6112 / 5.6113 / 5.6092 / 5.6082 |
| 64 | 0.5 | 0 | 3.1942 | 0.7588 | 0.1042 | 2.0 | 3.4382 / 3.2841 / 3.2389 / 3.2188 / 3.2085 / 3.2058 / 3.2054 / 3.1982 / 3.1973 / 3.1939 |
| 64 | 0.5 | 1 | 3.1994 | 0.7584 | 0.1046 | 2.12 | 3.4215 / 3.286 / 3.2403 / 3.2165 / 3.2045 / 3.1986 / 3.2001 / 3.1959 / 3.1954 / 3.1986 |
| 64 | 0.5 | 2 | 3.1954 | 0.7587 | 0.1045 | 2.11 | 3.4343 / 3.2767 / 3.2387 / 3.2157 / 3.2051 / 3.2002 / 3.2002 / 3.2013 / 3.2045 / 3.1958 |
| 64 | 0.5 | 3 | 3.1963 | 0.7587 | 0.1044 | 2.11 | 3.4326 / 3.2814 / 3.2372 / 3.2211 / 3.2107 / 3.2062 / 3.2035 / 3.2061 / 3.1996 / 3.1965 |
| 64 | 0.5 | 4 | 3.1954 | 0.7587 | 0.1045 | 2.02 | 3.4175 / 3.2728 / 3.2311 / 3.2122 / 3.2035 / 3.2012 / 3.1971 / 3.2102 / 3.1994 / 3.1948 |
| 128 | 0.5 | 0 | 1.1993 | 0.9094 | 0.1018 | 2.2 | 1.865 / 1.3387 / 1.2377 / 1.188 / 1.1612 / 1.145 / 1.1611 / 1.1824 / 1.166 / 1.1987 |
| 128 | 0.5 | 1 | 1.1382 | 0.9141 | 0.1014 | 2.18 | 1.861 / 1.3403 / 1.2355 / 1.1827 / 1.1555 / 1.1414 / 1.139 / 1.1381 / 1.1317 / 1.1406 |
| 128 | 0.5 | 2 | 1.1304 | 0.9146 | 0.1016 | 2.28 | 1.8667 / 1.3447 / 1.2347 / 1.1848 / 1.1584 / 1.1433 / 1.1754 / 1.1326 / 1.1361 / 1.13 |
| 128 | 0.5 | 3 | 1.1221 | 0.9153 | 0.1019 | 2.32 | 1.8668 / 1.3408 / 1.23 / 1.179 / 1.1543 / 1.1391 / 1.1335 / 1.165 / 1.1345 / 1.1219 |
| 128 | 0.5 | 4 | 1.1997 | 0.9094 | 0.1016 | 2.31 | 1.8693 / 1.3448 / 1.2345 / 1.1822 / 1.1551 / 1.1394 / 1.1319 / 1.1398 / 1.2091 / 1.182 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 0.5 | 0.000 (1652) | 0.337 (827) | 0.195 (1057) |
| 64 | 0.5 | 0.000 (1652) | 0.499 (826) | 0.273 (1462) |
| 128 | 0.5 | 0.000 (1652) | 0.644 (827) | 0.379 (1555) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init | Tier A recall | control hits |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0.5 | 0.80 | 19445 | 1623 | 2289 | 6879 | 8654 | 3590 | 100 | 19115 | 47 (25 / 595) | 39258 / 16903 | 14737 / 339 | 19445 / 1623 | 2/26 | none |
| 32 | 0.5 | 0.85 | 19136 | 1482 | 2189 | 6811 | 8654 | 3553 | 100 | 18999 | 50 (27 / 595) | 36332 / 14410 | 14605 / 339 | 19136 / 1482 | 2/26 | none |
| 32 | 0.5 | 0.90 | 18984 | 1400 | 2159 | 6771 | 8654 | 3535 | 99 | 18514 | 55 (30 / 595) | 33215 / 11725 | 14535 / 323 | 18984 / 1400 | 2/26 | none |
| 32 | 0.5 | 0.95 | 17983 | 1245 | 1643 | 6441 | 8654 | 3425 | 99 | 17652 | 61 (40 / 595) | 27310 / 7248 | 14120 / 317 | 17983 / 1245 | 2/26 | none |
| 64 | 0.5 | 0.80 | 18447 | 724 | 1697 | 6301 | 9725 | 4113 | 106 | 17905 | 108 (32 / 190) | 20097 / 1572 | 5320 / 45 | 18447 / 724 | 5/26 | none |
| 64 | 0.5 | 0.85 | 18012 | 717 | 1429 | 6141 | 9725 | 4045 | 105 | 17567 | 112 (39 / 190) | 19355 / 1381 | 5249 / 45 | 18012 / 717 | 4/26 | none |
| 64 | 0.5 | 0.90 | 17126 | 712 | 1247 | 5442 | 9725 | 3888 | 105 | 16816 | 116 (48 / 190) | 18147 / 1142 | 5185 / 45 | 17126 / 712 | 2/26 | none |
| 64 | 0.5 | 0.95 | 15955 | 584 | 1064 | 4582 | 9725 | 3678 | 105 | 15567 | 130 (58 / 190) | 16828 / 913 | 4854 / 45 | 15955 / 584 | 2/26 | none |
| 128 | 0.5 | 0.80 | 9209 | 24 | 261 | 3281 | 5643 | 3358 | 106 | 8717 | 198 (54 / 97) | 12240 / 52 | 2462 / 8 | 9209 / 24 | 2/26 | none |
| 128 | 0.5 | 0.85 | 8484 | 24 | 213 | 2604 | 5643 | 3140 | 106 | 7909 | 206 (64 / 97) | 11364 / 50 | 2368 / 8 | 8484 / 24 | 2/26 | none |
| 128 | 0.5 | 0.90 | 7491 | 20 | 109 | 1807 | 5555 | 2858 | 105 | 7347 | 217 (81 / 97) | 10357 / 36 | 2211 / 8 | 7491 / 20 | 1/26 | none |
| 128 | 0.5 | 0.95 | 6859 | 17 | 45 | 1258 | 5539 | 2648 | 103 | 6747 | 231 (105 / 97) | 9719 / 33 | 2039 / 8 | 6859 / 17 | 1/26 | none |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 council))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.40 / 0.39 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive | 0.39 / 0.40 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |

## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)

- an expected lemma pair counts as recovered when a PASS pair's two units mention the two lemmas as `(Member $e lemma)` atoms; lexical control pairs (antonyms / near-misses) linked the same way are control hits

- adopted block: recall 2/26; recovered: begin|commence, begin|start; missed: abandon|give_up, acquire|buy, allow|permit, answer|give, arrival|arrive, borrow|lend, buy|purchase, buy|sell, call_off|cancel, cause|destroy, decide|decision, decide|make, decide|reach, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, give|receive, learn|teach, mend|repair, need|require, postpone|put_off, reject|turn_down, take|walk; control hits: none

