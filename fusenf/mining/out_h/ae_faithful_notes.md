# §4.3.5 faithful arm — reading (analyst notes, 2026-09-17)

Companion to the generated `ae_faithful.md` (H substrate) and `../out_ecmp/ae_faithful.md` (item-E substrate with the
Tier A harness), the MeTTa renderings `ae_faithful.metta` (adopted block: bottleneck 32, sparsity beta 0.5, gate cosine
≥ 0.85; passes grouped by relation, exclusive first) and `ae_faithful_dial/k16_beta0.5.metta` / `k64_beta0.5.metta`, the
record `ae_faithful.jsonl` (+ `ae_faithful_dial/k<k>_beta0.5.jsonl`: every pair with cosine ≥ 0.8 in seed 0, with its
per-seed cosines, weight norms and co-occurrence relation), the plain-autoencoder twin `ae_faithful_plain.*` (beta 0 at
bottleneck 32), and the intermediates the owner asked for: `ae_counts.csv` (the count matrix, records × units),
`ae_faithful_weights/k<k>_beta<b>_seed<s>.tsv` (one encoder weight vector per unit) and
`clusters/clusters_ae_k<k>_beta<b>_<tau>.txt` (average-linkage clusters of the weight vectors, members as MeTTa queries).
The generated files are the record; this file is the reading. Nothing here is an addition to the method; the feature
inventory is the §4.3.1 faithful view taken as-is (owner 2026-09-16: no deduplication, no closure filter, no scaling —
those are additions to be measured as deltas).

**What the paper pins down and what we chose.** Count vectors per graph, one hidden layer, a low-dimensional bottleneck,
and the reading of ties off the encoder weights are the paper's. Ours, disclosed in every header: the unit inventory
(1,454 rooted-subtree units, counts recounted with the miner's own enumerator and verified against the inventory), the
sigmoid bottleneck with a tied linear decoder, squared error on raw counts, weight decay 1e-4, the KL sparsity term
(beta 0.5, target 0.1; beta 0 = the plain twin), full-batch Adam for 2,000 epochs (the loss is still creeping at the end:
2.98 → 2.90 → 2.87 → 2.84 per record over the four quarters at k 32), the bottleneck dial 16 / 32 / 64, the cosine gate
dial 0.80 / 0.85 / 0.90 / 0.95, the recording floor 0.8, and five seeds (seed 0 adopted, the others a stability count).
Training is byte-identical on re-run with a fixed seed and thread count.

**The count matrix.** 2,302 × 1,454; 11,330 non-zero cells (4.9 units per record), 1,075 repeat matches beyond the
first (9.5 % of the mass; the repeats sit in the near-constant single atoms and frames — Past, Agent, Patient). Column
sums and non-zero rows reproduce the inventory's occurrence totals and support sets exactly. Item-E: 762 × 1,652,
8,815 cells, 552 repeats.

## What the method delivers on the H substrate

**The tie list is large and mostly co-occurrence.** At the adopted block 8,775 of the 1,056,331 pairs pass (k 16:
14,165; k 64: 6,967; the plain twin 8,853, sharing 8,215 of its passes with the sparse run — the sparsity term barely
matters here). By relation at k 32: 2,407 same-records, 3,795 nested, 1,926 overlapping, 647 exclusive. The 2,407
same-records ties are the identical-column groups of the inventory (every pair inside a group ties at cosine 1.0 in
every seed: identical columns get identical gradients); the nested and overlapping ties are the part-whole and
co-occurrence structure of the unit lattice. 93 of the 104 §4.3.3 faithful passes are among these ties — the two
methods corroborate each other on co-occurrence, as the paper intends ("another source"), and the remaining ~7,700
co-occurrence ties are pairs below §4.3.3's mutual-information gate.

**The exclusive ties — the paper's interchangeability reading — are rare-unit context ties.** Of the 647 exclusive
passes at k 32, 617 have a side whose encoder weight vector is below the median norm and 476 have support ≤ 5 on
both sides. Weight norm tracks support (median norm 0.09 at support 3, 0.18 at 4–5, 0.21 at 6–10, 0.58 at 11–30, 1.54
above): the model spends its capacity on frequent units and leaves a rare unit's vector close to its gradient
residual, which is the mean bottleneck code of the unit's few records minus the global mean. Two rare units therefore
tie when their records have the same code, i.e. when the sentences that contain them look alike to the bottleneck,
not when the units mean the same thing: `(Inheritance regional_unit regional)` ~ `(Inheritance
metropolitan_statistical_area area)` (two Wikipedia definition templates from PAWS, cosine 1.000 in all five seeds),
`(Member $x0 beach)` ~ `(Member $x0 fact)` (norms 0.01, support 3 / 3). The rare vectors do not collapse onto one
global direction (their mean cosine to a common direction is 0.22): they form many small template groups. The
designed interchangeability case is NOT recovered: `(Member $e0 start)` ~ `(Member $e0 begin)` sits at cosine −0.32,
their aspectual frames with an ongoing complement at −0.31. Only 13 exclusive passes have both norms above the
median and hold in ≥ 4 seeds; they read as context coincidences of small supports (`(Member $x0 crowd)` ~ the
Recipient-with-clausal-Theme frame; `(GroupOf $x0 day)` ~ `(Member $x0 weather)`). The dial confirms the mechanism:
shrinking the bottleneck to 16 multiplies the exclusive ties (4,245), widening it to 64 leaves 67 (28 stable in all
seeds).

**Stability.** 7,716 of the 8,775 passes hold in all five seeds; 331 hold in two or fewer. The co-occurrence ties are
seed-independent (they are data identities); the exclusive rare-unit ties are the least stable part of the list.

## What the method delivers on the item-E substrate (Tier A harness)

The designed corpus, dominated by paraphrase templates, ties 37,062 pairs at the adopted block (15,027 exclusive,
9,945 same-records). The Tier A key: 10 of the 26 expected lemma pairs are linked at cosine ≥ 0.85 (10 at 0.80, 9 at
0.90, 8 at 0.95), every one through an exclusive pair of units in the same designed frame — begin+Patient ~
commence+Patient 0.995, reject ~ turn_down 0.998, need ~ require 0.985, postpone ~ put_off, call_off ~ cancel,
abandon ~ give_up, allow ~ permit, discover ~ find_out, begin ~ start — which is the mechanism above working as the
paper intends when the surrounding sentences are near-identical by design. The misses (buy|purchase, buy|sell,
give|receive, learn|teach, borrow|lend, decide|…, arrival|arrive, fix|repair, mend|repair, die|kick_the_bucket,
take|walk, answer|give) are lemmas whose Tier A sentences vary in frame or whose units carry enough support to have
their own code. The lexical control begin|end is linked at every gate (0.981 through the Patient frame): as in
§4.3.2, an antonym in the same frame is indistinguishable from a synonym to a method that only sees context.

## Reading

1. As written, §4.3.5 on this substrate is chiefly a co-occurrence detector with a very loose gate: nine tenths of
   its ties restate the unit lattice (identical columns, part-whole, overlap), and it corroborates 93 of §4.3.3's 104
   passes.
2. Its own claim — interchangeable subtrees — surfaces only where the corpus repeats a sentence template with one
   unit swapped (item-E by design; on H the PAWS Wikipedia definitions), and it comes entangled with the rare-unit
   effect: any two rare units from look-alike sentences tie, whatever they mean. The bottleneck size is the lever
   (16 → 4,245 exclusive ties, 64 → 67).
3. The natural next parameters to discuss are a weight-norm floor for entering the comparison (the analogue of
   §4.3.2's n ≥ 3), longer training, and the additions already planned (deduplicated columns, closed units, the Qwen3
   prior) — each as a measured delta, not a change to this run.
4. Output size is a finding in itself: at these parameters the files total 59 MB on H and 176 MB on item-E (the
   k 16 point alone records 74,476 item-E pairs at the 0.8 floor; everything is deterministic and regenerable in
   minutes). The owner decides what is committed.
