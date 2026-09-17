# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 1652 rooted-subtree units of the §4.3.1 faithful view (`out_ecmp/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator (k = 4, 28 eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |
| autoencoder | one hidden layer of k sigmoid units (dial [32], adopted 32), linear output, tied decoder x_hat = h W + c; W uniform(±sqrt(6/(F+k))), b = 0, c = column means |
| loss | mean over records of the squared reconstruction error summed over units + 0.0001·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), rho 0.1, beta dial [0.0] (0 = plain shallow AE), adopted 0 |
| training | full batch, Adam lr 0.01, 2000 epochs, float32, 8 thread(s); seed 0 adopted, seeds 0..4 for stability |
| ties | cosine between two units' encoder weight vectors (columns of W); gate cosine ≥ tau, dial [0.8, 0.85, 0.9, 0.95], adopted 0.85; recording floor 0.8 |
| co-occurrence | field per pair from the units' record sets: exclusive / overlapping / nested / same-records; part-of = §4.3.1 containment — never a filter |
| tie groups | complete linkage on the cosine distance of the weight vectors, cut at 1 − tau: every pair inside a group passes the gate; a partition, so passing pairs can fall across groups (the pairwise record is the JSONL) |
| renderings | one .metta per bottleneck at the adopted gate (passes grouped by relation, exclusive first); the cosine dial is read off the records; the plain shallow AE (beta 0) is the twin run `ae_faithful_plain_plain.*` when present |

## Count matrix

- 762 records × 1652 units; 8815 non-zero cells (11.57 units per record on average); 552 repeat matches beyond the first (max count 6); 2 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at 25 / 50 / 75 / 100 % of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 0 | 0 | 5.6461 | 0.5737 | 0.4107 | 11.96 | 5.8302 / 5.6755 / 5.6729 / 5.6417 |
| 32 | 0 | 1 | 5.631 | 0.5748 | 0.3948 | 10.27 | 5.826 / 5.6821 / 5.6486 / 5.6312 |
| 32 | 0 | 2 | 5.645 | 0.5738 | 0.41 | 10.76 | 5.8392 / 5.6857 / 5.6576 / 5.6452 |
| 32 | 0 | 3 | 5.636 | 0.5744 | 0.3926 | 10.4 | 5.8533 / 5.6796 / 5.6428 / 5.6413 |
| 32 | 0 | 4 | 5.629 | 0.575 | 0.3895 | 9.8 | 5.8405 / 5.6791 / 5.6453 / 5.6299 |

## Tied pairs across the dial

| k | beta | cosine ≥ | pass | exclusive | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | smaller side below the median norm | tie groups (untied units) | weight norm min / median | Tier A recall | control hits |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0 | 0.80 | 34315 | 12060 | 4155 | 8155 | 9945 | 4817 | 106 | 32191 | 20153 | 91 (29) | 0.017 / 0.282 | 9/26 | begin|end |
| 32 | 0 | 0.85 | 32375 | 10392 | 3942 | 8096 | 9945 | 4786 | 106 | 30111 | 18240 | 104 (33) | 0.017 / 0.282 | 9/26 | begin|end |
| 32 | 0 | 0.90 | 30139 | 8537 | 3627 | 8030 | 9945 | 4750 | 106 | 27575 | 16035 | 113 (41) | 0.017 / 0.282 | 9/26 | begin|end |
| 32 | 0 | 0.95 | 25887 | 6062 | 2658 | 7222 | 9945 | 4456 | 105 | 24285 | 12511 | 132 (64) | 0.017 / 0.282 | 7/26 | begin|end |

## Adopted block: k 32, beta 0, cosine ≥ 0.85 — top 25 EXCLUSIVE passes (the paper's interchangeability reading)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | exclusive | 0.03 / 0.02 | `(Member $x0 library)` (5) | `(Member $x0 descent)` (4) | 0 | A library gives each member a card. | The descent is difficult. |
| 1.000 | 5/5 | exclusive | 0.09 / 0.07 | `(Member $x0 manuscript)` (5) | `(And (Agent $e0 $x0) (Member $x0 panel) (Theme $e0 $x1))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.09 / 0.07 | `(Member $x0 manuscript)` (5) | `(And (Agent $e0 $x0) (Member $x0 panel))` (4) | 0 | An editor rejects a manuscript. | A panel rejects the proposal. |
| 1.000 | 5/5 | exclusive | 0.02 / 0.02 | `(Inheritance night_crew crew)` (4) | `(Inheritance regional_unit unit)` (4) | 0 | The night crew is exhausted. | Methoni is a village and a former municipality in Pieria regional unit , Greece . |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))` (4) | `(And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))` (4) | `(And (Member $e0 purchase) (Past $e0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))` (4) | `(Member $e0 purchase)` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))` (4) | `(Member $e0 acquire)` (4) | 0 | The depot purchased two forklifts. | The depot acquired two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))` (4) | `(And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))` (4) | `(And (Member $e0 purchase) (Past $e0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))` (4) | `(And (Member $e0 purchase) (Theme $e0 $x0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))` (4) | `(And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))` (4) | `(And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))` (4) | `(And (Member $e0 purchase) (Past $e0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))` (4) | `(And (Member $e0 purchase) (Theme $e0 $x0))` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))` (4) | `(Member $e0 purchase)` (4) | 0 | The depot acquired two forklifts. | The depot purchased two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))` (4) | `(Member $e0 acquire)` (4) | 0 | The depot purchased two forklifts. | The depot acquired two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))` (4) | `(And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))` (4) | 0 | The depot purchased two forklifts. | The depot acquired two forklifts. |
| 1.000 | 5/5 | exclusive | 0.12 / 0.12 | `(And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))` (4) | `(Member $e0 acquire)` (4) | 0 | The depot purchased two forklifts. | The depot acquired two forklifts. |

## Adopted block: k 32, beta 0, cosine ≥ 0.85 — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Past $e0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(And (Member $e0 buy) (Theme $e0 $x0))` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |
| 1.000 | 5/5 | same-records (part-of) | 0.53 / 0.53 | `(And (Agent $e0 $x0) (Member $e0 buy))` (14) | `(Member $e0 buy)` (14) | 14 | The depot bought two forklifts. | The depot bought two forklifts. |

## Tier A scorecard (item-E substrate; key = mining/tierA_slot_key.py)

- an expected lemma pair counts as recovered when a PASS pair's two units mention the two lemmas as `(Member $e lemma)` atoms; lexical control pairs (antonyms / near-misses) linked the same way are control hits

- adopted block: recall 9/26; recovered: abandon|give_up, begin|commence, begin|start, call_off|cancel, cause|destroy, discover|find_out, need|require, postpone|put_off, reject|turn_down; missed: acquire|buy, allow|permit, answer|give, arrival|arrive, borrow|lend, buy|purchase, buy|sell, decide|decision, decide|make, decide|reach, die|kick_the_bucket, error|find_out, fix|repair, give|receive, learn|teach, mend|repair, take|walk; control hits: begin|end

