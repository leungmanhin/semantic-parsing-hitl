# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 2125 rooted-subtree units of the §4.3.1 faithful view (`out_tier_ab/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
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

- 2352 records × 2125 units; 14559 non-zero cells (6.19 units per record on average); 394 repeat matches beyond the first (max count 4); 0 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 0 | 0 | 3.6378 | 0.4375 | 0.2655 | 2.16 | 3.6949 / 3.6557 / 3.6445 / 3.6411 / 3.6804 / 3.642 / 3.6389 / 3.6388 / 3.6363 / 3.6379 |
| 32 | 0 | 1 | 3.65 | 0.4356 | 0.2763 | 2.22 | 3.6994 / 3.6549 / 3.6643 / 3.6417 / 3.6434 / 3.6408 / 3.6406 / 3.6412 / 3.645 / 3.6486 |
| 32 | 0 | 2 | 3.6408 | 0.437 | 0.2691 | 2.7 | 3.6949 / 3.6584 / 3.6451 / 3.6549 / 3.6764 / 3.6551 / 3.641 / 3.6518 / 3.6441 / 3.64 |
| 32 | 0 | 3 | 3.6405 | 0.4371 | 0.2704 | 2.35 | 3.7011 / 3.6573 / 3.6481 / 3.6448 / 3.6451 / 3.642 / 3.6388 / 3.638 / 3.6379 / 3.6405 |
| 32 | 0 | 4 | 3.6412 | 0.437 | 0.269 | 2.25 | 3.6964 / 3.655 / 3.6455 / 3.644 / 3.6399 / 3.6381 / 3.6504 / 3.6486 / 3.6469 / 3.6399 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 0 | 0.000 (2125) | 0.114 (1063) | 0.172 (834) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive (shape-parallel) | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0 | 0.80 | 11173 | 1474 (77) | 2402 | 5050 | 2247 | 2355 | 172 | 10985 | 59 (33 / 1291) | 28970 / 12005 | 16175 / 4065 | 11173 / 1474 |
| 32 | 0 | 0.85 | 10630 | 1260 (71) | 2165 | 4958 | 2247 | 2309 | 164 | 10525 | 61 (38 / 1291) | 25324 / 9525 | 15201 / 3524 | 10630 / 1260 |
| 32 | 0 | 0.90 | 10249 | 1252 (70) | 1964 | 4786 | 2247 | 2239 | 153 | 10023 | 67 (48 / 1291) | 20993 / 6684 | 14140 / 3061 | 10249 / 1252 |
| 32 | 0 | 0.95 | 9529 | 1110 (59) | 1656 | 4516 | 2247 | 2133 | 144 | 9398 | 64 (71 / 1291) | 16405 / 4147 | 12023 / 2053 | 9529 / 1110 |

## Adopted block: k 32, beta 0, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading; shape-parallel ones are the rules)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.23 / 0.23 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.23 / 0.23 | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.23 / 0.23 | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.19 / 0.19 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1))` (3) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.19 / 0.19 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1))` (3) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.19 / 0.19 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))` (3) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.19 / 0.19 | `(And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))` (3) | `(And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))` (3) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.23 / 0.21 | `(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0))` (4) | `(And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0))` (3) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.27 / 0.26 | `(And (Member $x0 apple_harvest) (Patient $e0 $x0))` (5) | `(And (Member $x0 dress_rehearsal) (Patient $e0 $x0))` (4) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.24 / 0.23 | `(And (Agent $e0 $x0) (Member $x0 tutor))` (5) | `(And (Agent $e0 $x0) (Member $x0 council))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.24 / 0.24 | `(Inheritance afternoon_session session)` (5) | `(Inheritance summer_fair fair)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.27 / 0.27 | `(Inheritance apple_harvest harvest)` (5) | `(Inheritance dress_rehearsal rehearsal)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.24 / 0.24 | `(Member $x0 afternoon_session)` (5) | `(Member $x0 council)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.24 / 0.24 | `(Member $x0 afternoon_session)` (5) | `(Member $x0 summer_fair)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.27 / 0.27 | `(Member $x0 apple_harvest)` (5) | `(Member $x0 dress_rehearsal)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.27 / 0.27 | `(Member $x0 apple_harvest)` (5) | `(Member $x0 lunch)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.24 / 0.24 | `(Member $x0 council)` (5) | `(Member $x0 tutor)` (5) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.24 / 0.24 | `(Member $x0 summer_fair)` (5) | `(Member $x0 tutor)` (5) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 0.985 | 5/5 | exclusive (shape-parallel) | 0.43 / 0.21 | `(Member $x0 board)` (11) | `(Member $x0 case)` (7) | 0 | A board postpones the vote. | A judge decides the case. |
| 0.985 | 5/5 | exclusive (shape-parallel) | 0.43 / 0.21 | `(Member $x0 board)` (11) | `(Member $x0 judge)` (6) | 0 | A board postpones the vote. | A judge decides the case. |
| 0.984 | 5/5 | exclusive (shape-parallel) | 0.21 / 0.19 | `(And (Agent $e0 $x0) (Member $x1 generator) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1))` (3) | 0 | The depot lends the crew a generator. | The museum lends the gallery a painting. |
| 0.982 | 5/5 | exclusive (shape-parallel) | 0.21 / 0.38 | `(Member $x0 case)` (7) | `(Member $x0 budget)` (6) | 0 | A judge decides the case. | A board decides next year's budget. |
| 0.982 | 5/5 | exclusive (shape-parallel) | 0.21 / 0.38 | `(Member $x0 case)` (7) | `(Possession $x0 next_year)` (6) | 0 | A judge decides the case. | A board decides next year's budget. |
| 0.981 | 5/5 | exclusive (shape-parallel) | 0.38 / 0.21 | `(Member $x0 budget)` (6) | `(Member $x0 judge)` (6) | 0 | A board decides next year's budget. | A judge decides the case. |
| 0.981 | 5/5 | exclusive (shape-parallel) | 0.21 / 0.38 | `(Member $x0 judge)` (6) | `(Possession $x0 next_year)` (6) | 0 | A judge decides the case. | A board decides next year's budget. |

## Adopted block: k 32, beta 0, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.79 / 0.79 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.60 / 0.60 | `(And (Member $e0 buy) (Theme $e0 $x0))` (18) | `(Member $e0 buy)` (18) | 18 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.60 / 0.60 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (17) | `(And (Member $e0 buy) (Past $e0))` (17) | 17 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.54 / 0.54 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.54 / 0.54 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.54 / 0.54 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.54 / 0.54 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.54 / 0.54 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.54 / 0.54 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.38 / 0.38 | `(And (Member $e0 destroy) (Patient $e0 $x0))` (13) | `(Member $e0 destroy)` (13) | 13 | A storm destroys the greenhouse. | A storm destroys the greenhouse. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` (12) | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` (12) | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` (12) | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Member $e0 give))` (12) | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` (12) | 12 | A clerk gives an answer to the query. | A clerk gives an answer to the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.21 / 0.21 | `(And (Member $e0 answer) (Theme $e0 $x0))` (11) | `(Member $e0 answer)` (11) | 11 | A clerk answers the query. | A clerk answers the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.21 / 0.21 | `(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))` (10) | `(And (Agent $e0 $x0) (Member $e0 answer))` (10) | 10 | A clerk answers the query. | A clerk answers the query. |
| 1.000 | 5/5 | same-records (part-of) | 0.25 / 0.25 | `(And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))` (10) | `(And (Agent $e0 $x0) (Member $e0 destroy))` (10) | 10 | A storm destroys the greenhouse. | A storm destroys the greenhouse. |
| 1.000 | 5/5 | same-records (part-of) | 0.60 / 0.60 | `(And (Member $e0 lend) (Theme $e0 $x0))` (10) | `(Member $e0 lend)` (10) | 10 | A neighbour lends Ravi a ladder. | A neighbour lends Ravi a ladder. |
