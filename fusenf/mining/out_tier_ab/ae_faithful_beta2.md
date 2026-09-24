# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 2125 rooted-subtree units of the §4.3.1 faithful view (`out_tier_ab/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
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

- 2352 records × 2125 units; 14559 non-zero cells (6.19 units per record on average); 394 repeat matches beyond the first (max count 4); 0 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 2 | 0 | 3.6663 | 0.4331 | 0.101 | 0.69 | 3.9269 / 3.7976 / 3.714 / 3.6873 / 3.6736 / 3.6727 / 3.6709 / 3.666 / 3.6654 / 3.6663 |
| 32 | 2 | 1 | 3.6657 | 0.4332 | 0.101 | 0.69 | 3.915 / 3.8052 / 3.7181 / 3.6809 / 3.6712 / 3.668 / 3.6676 / 3.6673 / 3.6686 / 3.6657 |
| 32 | 2 | 2 | 3.6653 | 0.4332 | 0.1009 | 0.7 | 3.9064 / 3.7785 / 3.7055 / 3.6774 / 3.6719 / 3.6684 / 3.6681 / 3.6663 / 3.6654 / 3.6652 |
| 32 | 2 | 3 | 3.6768 | 0.4315 | 0.101 | 0.67 | 3.9085 / 3.7892 / 3.7161 / 3.6849 / 3.677 / 3.6732 / 3.6763 / 3.6861 / 3.6696 / 3.678 |
| 32 | 2 | 4 | 3.6623 | 0.4337 | 0.1011 | 0.65 | 3.9075 / 3.7785 / 3.7122 / 3.6846 / 3.6775 / 3.6696 / 3.6693 / 3.6638 / 3.6639 / 3.6624 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 2 | 0.000 (2125) | 0.129 (1063) | 0.172 (891) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive (shape-parallel) | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 2 | 0.80 | 12496 | 1987 (115) | 2829 | 5239 | 2441 | 2459 | 166 | 11833 | 63 (38 / 1234) | 31474 / 14703 | 16299 / 4177 | 12496 / 1987 |
| 32 | 2 | 0.85 | 11918 | 1739 (106) | 2544 | 5194 | 2441 | 2422 | 152 | 11415 | 67 (48 / 1234) | 26712 / 11115 | 15162 / 3468 | 11918 / 1739 |
| 32 | 2 | 0.90 | 11255 | 1539 (95) | 2243 | 5032 | 2441 | 2351 | 149 | 10530 | 70 (61 / 1234) | 21234 / 6993 | 13748 / 2694 | 11255 / 1539 |
| 32 | 2 | 0.95 | 10157 | 1351 (73) | 1664 | 4701 | 2441 | 2213 | 141 | 9404 | 77 (82 / 1234) | 16594 / 4292 | 11881 / 2080 | 10157 / 1351 |

## Adopted block: k 32, beta 2, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading; shape-parallel ones are the rules)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.33 / 0.34 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.33 | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.33 | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.28 / 0.28 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1))` (3) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.28 / 0.28 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1))` (3) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.28 / 0.28 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))` (3) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.28 / 0.28 | `(And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))` (3) | `(And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))` (3) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.30 / 0.26 | `(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0))` (4) | `(And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0))` (3) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.31 | `(And (Member $x0 apple_harvest) (Patient $e0 $x0))` (5) | `(And (Member $x0 dress_rehearsal) (Patient $e0 $x0))` (4) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.32 | `(Inheritance apple_harvest harvest)` (5) | `(Inheritance dress_rehearsal rehearsal)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.32 | `(Member $x0 apple_harvest)` (5) | `(Member $x0 dress_rehearsal)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.32 | `(Member $x0 apple_harvest)` (5) | `(Member $x0 lunch)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.33 | `(And (Agent $e0 $x0) (Member $x0 tutor))` (5) | `(And (Agent $e0 $x0) (Member $x0 council))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.35 | `(Inheritance afternoon_session session)` (5) | `(Inheritance summer_fair fair)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.35 | `(Member $x0 afternoon_session)` (5) | `(Member $x0 council)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.35 | `(Member $x0 afternoon_session)` (5) | `(Member $x0 summer_fair)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.35 | `(Member $x0 council)` (5) | `(Member $x0 tutor)` (5) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.35 | `(Member $x0 summer_fair)` (5) | `(Member $x0 tutor)` (5) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.36 | `(Member $x0 electrician)` (6) | `(Member $x0 mechanic)` (6) | 0 | The electrician repaired the yard floodlight. | The mechanic repaired a seized gearbox. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.36 / 0.35 | `(Member $x0 mechanic)` (6) | `(Member $x0 yard_floodlight)` (6) | 0 | The mechanic repaired a seized gearbox. | The electrician repaired the yard floodlight. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.36 | `(Member $x0 electrician)` (6) | `(Member $x0 gearbox)` (5) | 0 | The electrician repaired the yard floodlight. | The mechanic repaired a seized gearbox. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.36 | `(Member $x0 electrician)` (6) | `(Member $x0 seized)` (5) | 0 | The electrician repaired the yard floodlight. | The mechanic repaired a seized gearbox. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.36 | `(Member $x0 yard_floodlight)` (6) | `(Member $x0 gearbox)` (5) | 0 | The electrician repaired the yard floodlight. | The mechanic repaired a seized gearbox. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.35 / 0.36 | `(Member $x0 yard_floodlight)` (6) | `(Member $x0 seized)` (5) | 0 | The electrician repaired the yard floodlight. | The mechanic repaired a seized gearbox. |
| 0.991 | 5/5 | exclusive (shape-parallel) | 0.30 / 0.31 | `(And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0) (Patient $e0 $x1))` (5) | `(And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0) (Patient $e0 $x1))` (4) | 0 | The electrician repaired the yard floodlight. | The mechanic repaired a seized gearbox. |

## Adopted block: k 32, beta 2, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.90 / 0.90 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.73 / 0.73 | `(And (Member $e0 buy) (Theme $e0 $x0))` (18) | `(Member $e0 buy)` (18) | 18 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.72 / 0.72 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (17) | `(And (Member $e0 buy) (Past $e0))` (17) | 17 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.63 / 0.63 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.45 / 0.45 | `(And (Member $e0 destroy) (Patient $e0 $x0))` (13) | `(Member $e0 destroy)` (13) | 13 | A storm destroys the greenhouse. | A storm destroys the greenhouse. |
| 1.000 | 5/5 | same-records (part-of) | 0.49 / 0.49 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records | 0.66 / 0.66 | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.23 / 0.23 | `(And (Member $e0 answer) (Theme $e0 $x0))` (11) | `(Member $e0 answer)` (11) | 11 | A clerk answers the query. | A clerk answers the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.23 / 0.23 | `(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))` (10) | `(And (Agent $e0 $x0) (Member $e0 answer))` (10) | 10 | A clerk answers the query. | A clerk answers the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.27 / 0.27 | `(And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))` (10) | `(And (Agent $e0 $x0) (Member $e0 destroy))` (10) | 10 | A storm destroys the greenhouse. | A storm destroys the greenhouse. |
| 1.000 | 5/5 | same-records (part-of) | 0.70 / 0.70 | `(And (Member $e0 lend) (Theme $e0 $x0))` (10) | `(Member $e0 lend)` (10) | 10 | A neighbour lends Ravi a ladder. | A neighbour lends Ravi a ladder. |
