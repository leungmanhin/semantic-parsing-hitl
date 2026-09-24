# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 2125 rooted-subtree units of the §4.3.1 faithful view (`out_tier_ab/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
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

- 2352 records × 2125 units; 14559 non-zero cells (6.19 units per record on average); 394 repeat matches beyond the first (max count 4); 0 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 0.5 | 0 | 3.6665 | 0.433 | 0.1037 | 0.69 | 3.8176 / 3.7118 / 3.6886 / 3.673 / 3.6655 / 3.6644 / 3.6669 / 3.664 / 3.6659 / 3.6666 |
| 32 | 0.5 | 1 | 3.6628 | 0.4336 | 0.1038 | 0.69 | 3.8036 / 3.7095 / 3.6843 / 3.6698 / 3.6653 / 3.6633 / 3.6655 / 3.6634 / 3.663 / 3.6627 |
| 32 | 0.5 | 2 | 3.6669 | 0.433 | 0.1039 | 0.69 | 3.8102 / 3.7111 / 3.6802 / 3.6734 / 3.6676 / 3.6673 / 3.6665 / 3.6651 / 3.6692 / 3.6685 |
| 32 | 0.5 | 3 | 3.6582 | 0.4343 | 0.1039 | 0.69 | 3.8034 / 3.7096 / 3.68 / 3.671 / 3.6679 / 3.6655 / 3.6654 / 3.6635 / 3.666 / 3.6584 |
| 32 | 0.5 | 4 | 3.6618 | 0.4338 | 0.1035 | 0.7 | 3.7968 / 3.713 / 3.6884 / 3.6723 / 3.667 / 3.6626 / 3.664 / 3.6644 / 3.6616 / 3.6621 |
| 64 | 0.5 | 0 | 2.7613 | 0.573 | 0.102 | 0.87 | 3.0025 / 2.8462 / 2.8049 / 2.7884 / 2.7772 / 2.7716 / 2.7738 / 2.7718 / 2.7639 / 2.7615 |
| 64 | 0.5 | 1 | 2.7623 | 0.5729 | 0.1018 | 0.88 | 3.0153 / 2.8477 / 2.807 / 2.7875 / 2.7765 / 2.7695 / 2.7726 / 2.7638 / 2.7617 / 2.7626 |
| 64 | 0.5 | 2 | 2.7757 | 0.5708 | 0.1021 | 0.9 | 3.0387 / 2.8549 / 2.81 / 2.7922 / 2.7809 / 2.7711 / 2.7725 / 2.7748 / 2.7724 / 2.7758 |
| 64 | 0.5 | 3 | 2.7839 | 0.5695 | 0.1017 | 0.9 | 3.0256 / 2.8519 / 2.8098 / 2.7914 / 2.7784 / 2.7712 / 2.766 / 2.7721 / 2.788 / 2.7802 |
| 64 | 0.5 | 4 | 2.7754 | 0.5708 | 0.1023 | 0.89 | 3.0239 / 2.8522 / 2.8095 / 2.7906 / 2.78 / 2.7739 / 2.7734 / 2.767 / 2.7713 / 2.7742 |
| 128 | 0.5 | 0 | 1.8274 | 0.7174 | 0.1007 | 0.95 | 2.7596 / 2.0406 / 1.9032 / 1.8589 / 1.8375 / 1.8237 / 1.8204 / 1.8545 / 1.8149 / 1.8296 |
| 128 | 0.5 | 1 | 1.8282 | 0.7173 | 0.1006 | 0.93 | 2.7561 / 2.0381 / 1.9006 / 1.8564 / 1.8345 / 1.821 / 1.8229 / 1.8142 / 1.8201 / 1.8332 |
| 128 | 0.5 | 2 | 1.8041 | 0.721 | 0.101 | 0.97 | 2.7738 / 2.0413 / 1.9055 / 1.8612 / 1.8383 / 1.8226 / 1.8207 / 1.815 / 1.8071 / 1.8045 |
| 128 | 0.5 | 3 | 1.8717 | 0.7106 | 0.1007 | 0.98 | 2.7623 / 2.0462 / 1.9039 / 1.8589 / 1.8368 / 1.8238 / 1.8308 / 1.8561 / 1.8706 / 1.8769 |
| 128 | 0.5 | 4 | 1.829 | 0.7172 | 0.1003 | 1.01 | 2.7662 / 2.0471 / 1.9092 / 1.8623 / 1.8374 / 1.8216 / 1.8213 / 1.9021 / 1.8381 / 1.8323 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 0.5 | 0.000 (2125) | 0.128 (1063) | 0.172 (872) |
| 64 | 0.5 | 0.000 (2125) | 0.336 (1063) | 0.242 (1247) |
| 128 | 0.5 | 0.000 (2125) | 0.524 (1063) | 0.337 (1625) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive (shape-parallel) | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0.5 | 0.80 | 12553 | 1958 (111) | 2980 | 5228 | 2387 | 2448 | 168 | 11275 | 59 (39 / 1253) | 30042 / 12908 | 16460 / 4151 | 12553 / 1958 |
| 32 | 0.5 | 0.85 | 11813 | 1673 (103) | 2593 | 5160 | 2387 | 2400 | 155 | 10783 | 62 (49 / 1253) | 25391 / 9655 | 15275 / 3552 | 11813 / 1673 |
| 32 | 0.5 | 0.90 | 11177 | 1532 (93) | 2246 | 5012 | 2387 | 2331 | 149 | 10197 | 65 (62 / 1253) | 20645 / 6356 | 13818 / 2744 | 11177 / 1532 |
| 32 | 0.5 | 0.95 | 10255 | 1349 (75) | 1825 | 4694 | 2387 | 2187 | 139 | 9350 | 72 (80 / 1253) | 16604 / 4182 | 12143 / 2134 | 10255 / 1349 |
| 64 | 0.5 | 0.80 | 10975 | 752 (91) | 1971 | 5060 | 3192 | 2914 | 168 | 10711 | 112 (53 / 878) | 15557 / 2625 | 8392 / 155 | 10975 / 752 |
| 64 | 0.5 | 0.85 | 10452 | 718 (88) | 1783 | 4759 | 3192 | 2848 | 161 | 10160 | 117 (64 / 878) | 13877 / 2026 | 8167 / 143 | 10452 / 718 |
| 64 | 0.5 | 0.90 | 9792 | 679 (81) | 1422 | 4499 | 3192 | 2767 | 158 | 9520 | 122 (80 / 878) | 12224 / 1532 | 7910 / 129 | 9792 / 679 |
| 64 | 0.5 | 0.95 | 8667 | 636 (71) | 1009 | 3830 | 3192 | 2547 | 143 | 8467 | 131 (105 / 878) | 10025 / 972 | 6967 / 108 | 8667 / 636 |
| 128 | 0.5 | 0.80 | 8823 | 54 (15) | 1151 | 4300 | 3318 | 3055 | 161 | 8730 | 231 (106 / 500) | 10175 / 294 | 3849 / 2 | 8823 / 54 |
| 128 | 0.5 | 0.85 | 8393 | 50 (14) | 870 | 4155 | 3318 | 2956 | 152 | 8276 | 228 (137 / 500) | 9441 / 222 | 3703 / 1 | 8393 / 50 |
| 128 | 0.5 | 0.90 | 7664 | 34 (8) | 631 | 3691 | 3308 | 2775 | 116 | 7397 | 231 (186 / 500) | 8432 / 133 | 3541 / 0 | 7664 / 34 |
| 128 | 0.5 | 0.95 | 6757 | 8 (4) | 456 | 2989 | 3304 | 2492 | 98 | 6655 | 245 (237 / 500) | 7362 / 72 | 3324 / 0 | 6757 / 8 |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading; shape-parallel ones are the rules)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.33 / 0.33 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.33 / 0.33 | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.33 / 0.33 | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.28 / 0.28 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1))` (3) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.28 / 0.28 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1))` (3) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.28 / 0.28 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))` (3) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.28 / 0.28 | `(And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))` (3) | `(And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))` (3) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.33 | `(And (Agent $e0 $x0) (Member $x0 tutor))` (5) | `(And (Agent $e0 $x0) (Member $x0 council))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.34 | `(Inheritance afternoon_session session)` (5) | `(Inheritance summer_fair fair)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.34 | `(Member $x0 afternoon_session)` (5) | `(Member $x0 council)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.34 | `(Member $x0 afternoon_session)` (5) | `(Member $x0 summer_fair)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.35 | `(Member $x0 council)` (5) | `(Member $x0 tutor)` (5) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.35 | `(Member $x0 summer_fair)` (5) | `(Member $x0 tutor)` (5) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 0.997 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.34 | `(And (Member $x0 apple_harvest) (Patient $e0 $x0))` (5) | `(And (Member $x0 dress_rehearsal) (Patient $e0 $x0))` (4) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.997 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.36 | `(Inheritance apple_harvest harvest)` (5) | `(Inheritance dress_rehearsal rehearsal)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.997 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.36 | `(Member $x0 apple_harvest)` (5) | `(Member $x0 dress_rehearsal)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.997 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.36 | `(Member $x0 apple_harvest)` (5) | `(Member $x0 lunch)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.996 | 5/5 | exclusive (shape-parallel) | 0.29 / 0.28 | `(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0))` (4) | `(And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0))` (3) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.991 | 5/5 | exclusive (shape-parallel) | 0.18 / 0.18 | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Recipient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Recipient $e0 $x1))` (3) | 0 | A school gives the winner a medal. | A trainer gives a recruit a whistle. |
| 0.991 | 5/5 | exclusive (shape-parallel) | 0.18 / 0.18 | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Theme $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Theme $e0 $x1))` (3) | 0 | A school gives the winner a medal. | A trainer gives a recruit a whistle. |
| 0.991 | 5/5 | exclusive (shape-parallel) | 0.18 / 0.18 | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 recruit) (Recipient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 winner) (Recipient $e0 $x1))` (3) | 0 | A trainer gives a recruit a whistle. | A school gives the winner a medal. |
| 0.991 | 5/5 | exclusive (shape-parallel) | 0.18 / 0.18 | `(And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1) (Theme $e0 $x2))` (3) | `(And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1) (Theme $e0 $x2))` (3) | 0 | A school gives the winner a medal. | A trainer gives a recruit a whistle. |
| 0.991 | 5/5 | exclusive (shape-parallel) | 0.18 / 0.18 | `(And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1) (Theme $e0 $x2))` (3) | `(And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1) (Theme $e0 $x2))` (3) | 0 | A trainer gives a recruit a whistle. | A school gives the winner a medal. |
| 0.991 | 5/5 | exclusive (shape-parallel) | 0.18 / 0.18 | `(And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1))` (3) | `(And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1))` (3) | 0 | A trainer gives a recruit a whistle. | A school gives the winner a medal. |
| 0.991 | 5/5 | exclusive (shape-parallel) | 0.18 / 0.18 | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school))` (3) | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer))` (3) | 0 | A school gives the winner a medal. | A trainer gives a recruit a whistle. |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.89 / 0.89 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.72 / 0.72 | `(And (Member $e0 buy) (Theme $e0 $x0))` (18) | `(Member $e0 buy)` (18) | 18 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.71 / 0.71 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (17) | `(And (Member $e0 buy) (Past $e0))` (17) | 17 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.62 / 0.62 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.62 / 0.62 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.62 / 0.62 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.62 / 0.62 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.62 / 0.62 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.62 / 0.62 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.43 / 0.43 | `(And (Member $e0 destroy) (Patient $e0 $x0))` (13) | `(Member $e0 destroy)` (13) | 13 | A storm destroys the greenhouse. | A storm destroys the greenhouse. |
| 1.000 | 5/5 | same-records (part-of) | 0.59 / 0.59 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records | 0.67 / 0.67 | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.22 / 0.22 | `(And (Member $e0 answer) (Theme $e0 $x0))` (11) | `(Member $e0 answer)` (11) | 11 | A clerk answers the query. | A clerk answers the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.22 / 0.22 | `(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))` (10) | `(And (Agent $e0 $x0) (Member $e0 answer))` (10) | 10 | A clerk answers the query. | A clerk answers the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.26 / 0.26 | `(And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))` (10) | `(And (Agent $e0 $x0) (Member $e0 destroy))` (10) | 10 | A storm destroys the greenhouse. | A storm destroys the greenhouse. |
| 1.000 | 5/5 | same-records (part-of) | 0.70 / 0.70 | `(And (Member $e0 lend) (Theme $e0 $x0))` (10) | `(Member $e0 lend)` (10) | 10 | A neighbour lends Ravi a ladder. | A neighbour lends Ravi a ladder. |
