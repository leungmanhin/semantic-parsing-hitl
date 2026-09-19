# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1652 rooted-subtree units of the §4.3.1 faithful view (`out_ecmp/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
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

- 762 records × 1652 units; 8815 non-zero cells (11.57 units per record on average); 552 repeat matches beyond the first (max count 6); 2 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 0 | 0 | 5.5727 | 0.5792 | 0.3285 | 8.48 | 5.6755 / 5.6417 / 5.6088 / 5.5918 / 5.5991 / 5.5779 / 5.5788 / 5.571 / 5.5799 / 5.5739 |
| 32 | 0 | 1 | 5.5684 | 0.5795 | 0.2842 | 7.08 | 5.6821 / 5.6312 / 5.6114 / 5.5966 / 5.587 / 5.5831 / 5.5795 / 5.5736 / 5.579 / 5.5683 |
| 32 | 0 | 2 | 5.5719 | 0.5793 | 0.2888 | 7.06 | 5.6857 / 5.6452 / 5.6202 / 5.6013 / 5.604 / 5.5863 / 5.6221 / 5.5851 / 5.5986 / 5.5725 |
| 32 | 0 | 3 | 5.5688 | 0.5795 | 0.3134 | 8.55 | 5.6796 / 5.6413 / 5.5992 / 5.5895 / 5.5806 / 5.5714 / 5.569 / 5.5759 / 5.5659 / 5.5681 |
| 32 | 0 | 4 | 5.5891 | 0.578 | 0.3017 | 7.36 | 5.6791 / 5.6299 / 5.6241 / 5.5855 / 5.5813 / 5.5844 / 5.5746 / 5.5678 / 5.5934 / 5.5934 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 0 | 0.000 (1652) | 0.299 (826) | 0.195 (1005) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive (shape-parallel) | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init | Tier A recall | control hits |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0 | 0.80 | 18326 | 1189 (72) | 2112 | 6536 | 8489 | 3437 | 93 | 18113 | 47 (23 / 647) | 34714 / 12206 | 14226 / 241 | 18326 / 1189 | 2/26 | none |
| 32 | 0 | 0.85 | 18106 | 1098 (58) | 2022 | 6497 | 8489 | 3421 | 93 | 18018 | 50 (26 / 647) | 32064 / 9964 | 14185 / 239 | 18106 / 1098 | 2/26 | none |
| 32 | 0 | 0.90 | 17957 | 1097 (58) | 1970 | 6401 | 8489 | 3390 | 92 | 17711 | 53 (31 / 647) | 29103 / 7650 | 14059 / 239 | 17957 / 1097 | 2/26 | none |
| 32 | 0 | 0.95 | 17059 | 979 (46) | 1521 | 6070 | 8489 | 3274 | 92 | 16563 | 61 (36 / 647) | 25967 / 5892 | 13700 / 238 | 17059 / 979 | 1/26 | none |

## Adopted block: k 32, beta 0, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading; shape-parallel ones are the rules)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.32 / 0.32 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` (4) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.32 / 0.32 | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.32 / 0.32 | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` (4) | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.27 / 0.27 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1))` (3) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.27 / 0.27 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1))` (3) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.27 / 0.27 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council))` (3) | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))` (3) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 1.000 | 5/5 | exclusive (shape-parallel) | 0.27 / 0.27 | `(And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))` (3) | `(And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))` (3) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.32 | `(And (Agent $e0 $x0) (Member $x0 tutor))` (5) | `(And (Agent $e0 $x0) (Member $x0 council))` (4) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.34 | `(Inheritance afternoon_session session)` (5) | `(Inheritance summer_fair fair)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.34 | `(Member $x0 afternoon_session)` (5) | `(Member $x0 council)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.34 | `(Member $x0 afternoon_session)` (5) | `(Member $x0 summer_fair)` (5) | 0 | A tutor cancels the afternoon session. | A council cancels the summer fair. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.34 | `(Member $x0 council)` (5) | `(Member $x0 tutor)` (5) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 0.999 | 5/5 | exclusive (shape-parallel) | 0.34 / 0.34 | `(Member $x0 summer_fair)` (5) | `(Member $x0 tutor)` (5) | 0 | A council cancels the summer fair. | A tutor cancels the afternoon session. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.31 / 0.34 | `(And (Member $x0 apple_harvest) (Patient $e0 $x0))` (5) | `(And (Member $x0 dress_rehearsal) (Patient $e0 $x0))` (4) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.26 / 0.27 | `(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0))` (4) | `(And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0))` (3) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.31 / 0.36 | `(Inheritance apple_harvest harvest)` (5) | `(Inheritance dress_rehearsal rehearsal)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.31 / 0.36 | `(Member $x0 apple_harvest)` (5) | `(Member $x0 dress_rehearsal)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.993 | 5/5 | exclusive (shape-parallel) | 0.31 / 0.36 | `(Member $x0 apple_harvest)` (5) | `(Member $x0 lunch)` (5) | 0 | The apple harvest begins in September. | The dress rehearsal begins after lunch. |
| 0.988 | 5/5 | exclusive (shape-parallel) | 0.23 / 0.30 | `(And (Member $e0 design) (Past $e0) (Patient $e0 $x0))` (4) | `(And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))` (4) | 0 | It was designed by architect Henry L. Taylor and built by O. R. Woodcock . | The movie was produced by Sy Weintraub and Harvey Hayutin and directed by Robert Day . |
| 0.988 | 5/5 | exclusive (shape-parallel) | 0.23 / 0.30 | `(And (Member $e0 design) (Past $e0))` (4) | `(And (Member $e0 produce) (Past $e0))` (4) | 0 | It was designed by architect Henry L. Taylor and built by O. R. Woodcock . | The movie was produced by Sy Weintraub and Harvey Hayutin and directed by Robert Day . |
| 0.976 | 5/5 | exclusive (shape-parallel) | 0.33 / 0.23 | `(And (Member $e0 produce) (Patient $e0 $x0))` (6) | `(And (Member $e0 design) (Patient $e0 $x0))` (4) | 0 | The film is a first Syrian nominated film , produced and destined for Oscar . | It was designed by architect Henry L. Taylor and built by O. R. Woodcock . |
| 0.976 | 5/5 | exclusive (shape-parallel) | 0.33 / 0.23 | `(Member $e0 produce)` (6) | `(Member $e0 design)` (4) | 0 | The film is a first Syrian nominated film , produced and destined for Oscar . | It was designed by architect Henry L. Taylor and built by O. R. Woodcock . |
| 0.976 | 5/5 | exclusive (shape-parallel) | 0.23 / 0.21 | `(And (Agent $e0 $x0) (Member $x1 generator) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1))` (3) | 0 | The depot lends the crew a generator. | The museum lends the gallery a painting. |
| 0.976 | 5/5 | exclusive (shape-parallel) | 0.23 / 0.21 | `(And (Member $x0 generator) (Theme $e0 $x0))` (4) | `(And (Member $x0 painting) (Theme $e0 $x0))` (3) | 0 | The depot lends the crew a generator. | The museum lends the gallery a painting. |
| 0.973 | 5/5 | exclusive (shape-parallel) | 0.23 / 0.22 | `(Member $x0 generator)` (5) | `(Member $x0 painting)` (4) | 0 | The depot lends the crew a generator. | The museum lends the gallery a painting. |

## Adopted block: k 32, beta 0, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (shape-parallel) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |

## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)

- an expected lemma pair counts as recovered when a PASS pair's two units mention the two lemmas as `(Member $e lemma)` atoms; lexical control pairs (antonyms / near-misses) linked the same way are control hits

- adopted block: recall 2/26; recovered: begin|start, cause|destroy; missed: abandon|give_up, acquire|buy, allow|permit, answer|give, arrival|arrive, begin|commence, borrow|lend, buy|purchase, buy|sell, call_off|cancel, decide|decision, decide|make, decide|reach, die|kick_the_bucket, discover|find_out, error|find_out, fix|repair, give|receive, learn|teach, mend|repair, need|require, postpone|put_off, reject|turn_down, take|walk; control hits: none

