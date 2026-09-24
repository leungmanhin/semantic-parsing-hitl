# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 945 rooted-subtree units of the §4.3.1 faithful view (`out_tier_b/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
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

- 1950 records × 945 units; 7956 non-zero cells (4.08 units per record on average); 363 repeat matches beyond the first (max count 4); 0 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 0.5 | 0 | 2.0946 | 0.5294 | 0.1033 | 0.59 | 2.2356 / 2.1563 / 2.1209 / 2.1071 / 2.0974 / 2.0952 / 2.0955 / 2.1021 / 2.094 / 2.0948 |
| 32 | 0.5 | 1 | 2.0913 | 0.5301 | 0.1037 | 0.57 | 2.2413 / 2.1429 / 2.1166 / 2.1015 / 2.0952 / 2.0929 / 2.0907 / 2.0908 / 2.0914 / 2.0913 |
| 32 | 0.5 | 2 | 2.0919 | 0.5299 | 0.1036 | 0.59 | 2.2363 / 2.1514 / 2.1244 / 2.106 / 2.0944 / 2.0928 / 2.0922 / 2.0927 / 2.0921 / 2.092 |
| 32 | 0.5 | 3 | 2.0942 | 0.5294 | 0.1031 | 0.59 | 2.2648 / 2.1603 / 2.1257 / 2.1048 / 2.0985 / 2.0944 / 2.094 / 2.0941 / 2.095 / 2.0942 |
| 32 | 0.5 | 4 | 2.0918 | 0.53 | 0.1034 | 0.62 | 2.2238 / 2.1464 / 2.1193 / 2.1046 / 2.0978 / 2.0927 / 2.0926 / 2.0917 / 2.0919 / 2.0918 |
| 64 | 0.5 | 0 | 1.5795 | 0.6451 | 0.1016 | 0.65 | 1.8657 / 1.6782 / 1.6344 / 1.6128 / 1.5976 / 1.5894 / 1.5838 / 1.5895 / 1.5891 / 1.5801 |
| 64 | 0.5 | 1 | 1.5809 | 0.6448 | 0.1015 | 0.65 | 1.8757 / 1.6745 / 1.6319 / 1.6116 / 1.5966 / 1.5862 / 1.5843 / 1.5866 / 1.5847 / 1.5812 |
| 64 | 0.5 | 2 | 1.579 | 0.6452 | 0.1018 | 0.75 | 1.8706 / 1.6818 / 1.6337 / 1.6128 / 1.5993 / 1.5926 / 1.588 / 1.5842 / 1.581 / 1.579 |
| 64 | 0.5 | 3 | 1.5861 | 0.6436 | 0.1017 | 0.73 | 1.8645 / 1.6755 / 1.6347 / 1.6137 / 1.6014 / 1.5931 / 1.5859 / 1.5851 / 1.5827 / 1.5871 |
| 64 | 0.5 | 4 | 1.5774 | 0.6456 | 0.1019 | 0.66 | 1.866 / 1.676 / 1.6325 / 1.6108 / 1.5984 / 1.5898 / 1.5831 / 1.583 / 1.5796 / 1.5775 |
| 128 | 0.5 | 0 | 1.0457 | 0.765 | 0.1014 | 0.65 | 1.8122 / 1.2917 / 1.1402 / 1.0971 / 1.0749 / 1.0602 / 1.0518 / 1.0774 / 1.0444 / 1.0446 |
| 128 | 0.5 | 1 | 1.0414 | 0.766 | 0.1013 | 0.73 | 1.808 / 1.293 / 1.1423 / 1.099 / 1.0769 / 1.0612 / 1.0518 / 1.0484 / 1.0473 / 1.0417 |
| 128 | 0.5 | 2 | 1.0376 | 0.7668 | 0.1013 | 0.7 | 1.8084 / 1.2884 / 1.1406 / 1.0967 / 1.0739 / 1.0596 / 1.0534 / 1.0519 / 1.0522 / 1.0375 |
| 128 | 0.5 | 3 | 1.0389 | 0.7666 | 0.1011 | 0.72 | 1.8103 / 1.2907 / 1.1411 / 1.0983 / 1.0757 / 1.0614 / 1.0514 / 1.0526 / 1.0409 / 1.0397 |
| 128 | 0.5 | 4 | 1.0389 | 0.7666 | 0.1013 | 0.68 | 1.8167 / 1.2934 / 1.1406 / 1.0968 / 1.0741 / 1.0596 / 1.0537 / 1.0445 / 1.0439 / 1.0391 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 0.5 | 0.000 (945) | 0.152 (473) | 0.256 (299) |
| 64 | 0.5 | 0.000 (945) | 0.380 (473) | 0.356 (487) |
| 128 | 0.5 | 0.000 (945) | 0.777 (473) | 0.488 (723) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive (shape-parallel) | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0.5 | 0.80 | 999 | 38 (8) | 448 | 397 | 116 | 356 | 50 | 832 | 55 (37 / 646) | 2695 / 518 | 1637 / 105 | 999 / 38 |
| 32 | 0.5 | 0.85 | 861 | 18 (4) | 340 | 387 | 116 | 346 | 49 | 748 | 59 (44 / 646) | 1938 / 240 | 1293 / 49 | 861 / 18 |
| 32 | 0.5 | 0.90 | 653 | 8 (2) | 213 | 316 | 116 | 305 | 46 | 548 | 62 (61 / 646) | 1300 / 120 | 905 / 25 | 653 / 8 |
| 32 | 0.5 | 0.95 | 447 | 0 (0) | 104 | 227 | 116 | 229 | 39 | 385 | 59 (100 / 646) | 795 / 41 | 578 / 4 | 447 / 0 |
| 64 | 0.5 | 0.80 | 1040 | 12 (4) | 369 | 481 | 178 | 490 | 47 | 995 | 105 (73 / 458) | 1778 / 135 | 1015 / 11 | 1040 / 12 |
| 64 | 0.5 | 0.85 | 921 | 5 (1) | 295 | 443 | 178 | 459 | 45 | 856 | 109 (87 / 458) | 1432 / 73 | 908 / 5 | 921 / 5 |
| 64 | 0.5 | 0.90 | 736 | 0 (0) | 168 | 390 | 178 | 418 | 40 | 701 | 112 (108 / 458) | 1038 / 22 | 731 / 0 | 736 / 0 |
| 64 | 0.5 | 0.95 | 574 | 0 (0) | 88 | 308 | 178 | 343 | 32 | 542 | 110 (145 / 458) | 724 / 10 | 572 / 0 | 574 / 0 |
| 128 | 0.5 | 0.80 | 833 | 0 (0) | 178 | 424 | 231 | 509 | 35 | 780 | 191 (157 / 222) | 996 / 12 | 437 / 0 | 833 / 0 |
| 128 | 0.5 | 0.85 | 705 | 0 (0) | 104 | 370 | 231 | 466 | 34 | 678 | 193 (183 / 222) | 802 / 7 | 401 / 0 | 705 / 0 |
| 128 | 0.5 | 0.90 | 616 | 0 (0) | 59 | 326 | 231 | 431 | 32 | 588 | 180 (228 / 222) | 661 / 3 | 364 / 0 | 616 / 0 |
| 128 | 0.5 | 0.95 | 462 | 0 (0) | 23 | 208 | 231 | 329 | 26 | 454 | 156 (314 / 222) | 494 / 3 | 291 / 0 | 462 / 0 |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading; shape-parallel ones are the rules)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 0.931 | 4/5 | exclusive (shape-parallel) | 0.37 / 0.33 | `(Agent $e0 david)` (3) | `(Agent $e0 mark)` (3) | 0 | David was trying to reach Amanda. | Mark and Jessica began hanging out often. |
| 0.918 | 5/5 | exclusive (shape-parallel) | 0.47 / 0.27 | `(And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))` (6) | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` (4) | 0 | The ball ricocheted off the bat. | The concert drew attendees from the surrounding towns. |
| 0.898 | 5/5 | exclusive (shape-parallel) | 0.55 / 0.30 | `(And (Patient $e0 $x0) (Source $e0 $x1))` (8) | `(And (Source $e0 $x0) (Theme $e0 $x1))` (5) | 0 | The ball ricocheted off the bat. | Mark tried to steal a hot dog from a street vendor. |
| 0.877 | 5/5 | exclusive (shape-parallel) | 0.86 / 0.47 | `(And (Agent $e0 $x0) (GroupOf $x0 person))` (8) | `(And (GroupOf $x0 person) (Patient $e0 $x0))` (5) | 0 | The people rebelled against the king. | Some of those rescued were pretty badly burned. |
| 0.928 | 5/5 | exclusive | 0.55 / 0.27 | `(And (Patient $e0 $x0) (Source $e0 $x1))` (8) | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` (4) | 0 | The ball ricocheted off the bat. | The concert drew attendees from the surrounding towns. |
| 0.909 | 5/5 | exclusive | 0.48 / 0.61 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` (5) | `(And (Goal $e0 bed) (Member $e0 go))` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.909 | 5/5 | exclusive | 0.48 / 0.61 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` (5) | `(Goal $e0 bed)` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.905 | 5/5 | exclusive | 0.52 / 0.61 | `(And (Goal $e0 $x0) (Member $e0 go))` (6) | `(And (Goal $e0 bed) (Member $e0 go))` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.905 | 5/5 | exclusive | 0.52 / 0.61 | `(And (Goal $e0 $x0) (Member $e0 go))` (6) | `(Goal $e0 bed)` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.901 | 5/5 | exclusive | 0.48 / 0.49 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` (5) | `(Time $e0 night)` (4) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.895 | 5/5 | exclusive | 0.48 / 0.49 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` (5) | `(And (Past $e0) (Time $e0 night))` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.895 | 5/5 | exclusive | 0.52 / 0.49 | `(And (Goal $e0 $x0) (Member $e0 go))` (6) | `(Time $e0 night)` (4) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.893 | 5/5 | exclusive | 0.47 / 0.30 | `(And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))` (6) | `(And (Source $e0 $x0) (Theme $e0 $x1))` (5) | 0 | The ball ricocheted off the bat. | Mark tried to steal a hot dog from a street vendor. |
| 0.890 | 5/5 | exclusive | 0.52 / 0.49 | `(And (Goal $e0 $x0) (Member $e0 go))` (6) | `(And (Past $e0) (Time $e0 night))` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.883 | 5/5 | exclusive | 0.47 / 0.30 | `(And (GroupOf $x0 person) (Patient $e0 $x0))` (5) | `(And (Member $e0 travel) (Past $e0))` (3) | 0 | Some of those rescued were pretty badly burned. | Matthew traveled for work so much. |
| 0.878 | 5/5 | exclusive | 0.71 / 0.47 | `(And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))` (7) | `(And (GroupOf $x0 person) (Patient $e0 $x0))` (5) | 0 | The people rebelled against the king. | Some of those rescued were pretty badly burned. |
| 0.876 | 5/5 | exclusive | 0.47 / 0.30 | `(And (GroupOf $x0 person) (Patient $e0 $x0))` (5) | `(Member $e0 travel)` (5) | 0 | Some of those rescued were pretty badly burned. | Nothing is so pleasant as traveling alone. |
| 0.850 | 4/5 | exclusive | 0.37 / 0.30 | `(And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))` (3) | `(And (Member $e0 travel) (Past $e0))` (3) | 0 | Some of those rescued were pretty badly burned. | Matthew traveled for work so much. |

## Adopted block: k 32, beta 0.5, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.92 / 0.92 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.92 / 0.92 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.92 / 0.92 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(Holder $e0 $x0)` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records | 0.92 / 0.92 | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.92 / 0.92 | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | `(Holder $e0 $x0)` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.92 / 0.92 | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (23) | `(Holder $e0 $x0)` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.77 / 0.77 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.66 / 0.66 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` (7) | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | 7 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.73 / 0.73 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.73 / 0.73 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.73 / 0.73 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records | 0.73 / 0.73 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.73 / 0.73 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.73 / 0.73 | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.48 / 0.48 | `(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))` (5) | `(And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))` (5) | 5 | The crack in the windshield has started to disappear. | The crack in the windshield has started to disappear. |
| 1.000 | 5/5 | same-records (part-of) | 0.32 / 0.32 | `(And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))` (5) | `(And (Cardinality $x0 <num>) (Patient $e0 $x0))` (5) | 5 | One of the windows was broken. | One of the windows was broken. |
| 1.000 | 5/5 | same-records (part-of) | 0.35 / 0.35 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.35 / 0.35 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.35 / 0.35 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records | 0.35 / 0.35 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` (5) | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.35 / 0.35 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` (5) | `(And (Holder $e0 $x0) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.35 / 0.35 | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 1.03 / 1.03 | `(And (Member $e0 contain) (Theme $e0 $x0))` (5) | `(Member $e0 contain)` (5) | 5 | A deck of cards contains four kings, four queens, and four jacks. | A deck of cards contains four kings, four queens, and four jacks. |
| 1.000 | 5/5 | same-records | 0.52 / 0.52 | `(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (4) | `(And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))` (4) | 4 | Both girls started to cry. | Both girls started to cry. |
