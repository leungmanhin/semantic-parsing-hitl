# §4.3.5 faithful arm — reading (analyst notes; run #1 2026-09-17, run #2 2026-09-18)

Companion to the generated `ae_faithful.md` (H substrate) and `../out_ecmp/ae_faithful.md` (item-E substrate with the
Tier A harness), the MeTTa renderings `ae_faithful.metta` (adopted block: bottleneck 32, sparsity beta 0.5, gate cosine
≥ 0.85 with the initialisation norm floor; passes grouped by relation, exclusive first) and
`ae_faithful_dial/k64_beta0.5.metta` / `k128_beta0.5.metta`, the record `ae_faithful.jsonl` (+ the dial JSONL: every
pair with cosine ≥ 0.8 in seed 0, whatever the floor, with per-seed cosines, weight norms, the co-occurrence relation
and the fields `pass` / `enters` / `pass_no_floor`), the twins `ae_faithful_plain.*` (beta 0) and `ae_faithful_beta2.*`
(beta 2) at bottleneck 32, and the intermediates: `ae_counts.csv` (the count matrix), `ae_faithful_weights/` (one
encoder weight vector per unit, per bottleneck and seed) and `ties/` (tie groups = complete-linkage clustering of the
entering units' weight vectors cut at 1 − tau, so every pair inside a group passes the gate; the untied entering units
and the units below the floor listed at the end). The generated files are the record; this file is the reading. Nothing
here is an addition to the method; the feature inventory is the §4.3.1 faithful view taken as-is (owner 2026-09-16:
no deduplication, no closure filter, no scaling — those are additions to be measured as deltas).

**What the paper pins down and what we chose.** Count vectors per graph, one hidden layer, a low-dimensional
bottleneck, and the reading of ties off the encoder weights are the paper's. Ours, disclosed in every header: the unit
inventory (1,454 rooted-subtree units; counts recounted with the miner's own enumerator and verified against the
inventory), the sigmoid bottleneck with a tied linear decoder, squared error on raw counts, weight decay 1e-4, the KL
sparsity term (beta 0.5, target 0.1), full-batch Adam for 10,000 epochs, the bottleneck dial 32 / 64 / 128, the cosine
gate dial 0.80 / 0.85 / 0.90 / 0.95, the recording floor 0.8, five seeds (seed 0 adopted, the others a stability
count), and — since run #2 — the NORM FLOOR: a unit enters the comparison when its encoder-vector norm is at least the
initialisation norm a·sqrt(k/3), a = sqrt(6/(F+k)) (0.208 at k 32, 0.290 at 64, 0.402 at 128), i.e. when training grew
the vector beyond where it started; the median norm and no floor are the dial's other points. Training is
byte-identical on re-run with a fixed seed and thread count.

**Run #1 → run #2.** Run #1 (2,000 epochs, bottleneck 16 / 32 / 64, no floor; commit 46b6e1a) found the tie list
dominated by co-occurrence and its exclusive ties dominated by rare units with near-zero vectors (the loss was still
creeping at 2,000 epochs: 2.98 / 2.90 / 2.87 / 2.84 per record over the quarters at k 32). Run #2 (owner go
2026-09-18) trains five times longer, drops bottleneck 16, adds 128, adds the beta-2 twin and the norm floor.

**Convergence.** At 10,000 epochs the reconstruction per record has reached its plateau: k 32 2.978 → 2.875 → 2.850 →
2.834 → 2.818 → 2.815 → 2.815 → 2.814 → 2.809 → 2.810 (R² 0.542); k 64 → 2.096 (0.659); k 128 → 1.416 (0.769). The
plain twin and k 128 wobble by a few hundredths between checkpoints (Adam at a fixed rate near the floor of the loss),
which does not move the ties.

## What the method delivers on the H substrate

**The floor changes the picture, the mechanism stays.** At the adopted block, 609 of the 1,454 units enter (their
vectors grew beyond the initialisation norm); the 845 that do not are the units the model left near or below their
starting length — the rare ones (in run #1 the median norm was 0.09 at support 3 against 1.54 above 30). Without the
floor 8,979 pairs pass at cosine 0.85, 763 of them exclusive; with it:

| block (cosine ≥ 0.85, init floor) | pass | same-records | nested | overlapping | exclusive | stable 5/5 | §4.3.3 passes among them |
|---|---|---|---|---|---|---|---|
| k 32, beta 0.5 (adopted) | 6,896 | 2,202 | 3,479 | 1,207 | 8 | 6,566 | 82 of 104 |
| k 64, beta 0.5 | 4,230 | 1,804 | 1,512 | 898 | 16 | 4,071 | 81 |
| k 128, beta 0.5 | 1,849 | 643 | 841 | 365 | 0 | 1,788 | 69 |
| k 32, beta 0 (plain twin) | 6,616 | 2,176 | 3,306 | 1,131 | 3 | 6,425 | 81 |
| k 32, beta 2 | 6,960 | 2,215 | 3,540 | 1,198 | 7 | 6,566 | 82 |

Nine tenths of the passes are the identical-column groups (same-records), the part-whole lattice (nested) and
co-occurrence (overlapping) — the structure §4.3.3 and §4.3.1 already describe, here corroborated (82 of §4.3.3's 104
passes tie at the adopted block). The sparsity weight barely matters (beta 0 / 0.5 / 2 share their lists almost
entirely); the bottleneck size does: widening it lets the model encode more units on their own (1,000 enter at k 128)
and the ties thin out.

**The exclusive ties — the paper's interchangeability reading — are now few and readable.** The floor removes 755 of
the 763 exclusive ties of the unfloored run: those were the rare-unit context ties (a rare unit's vector is the mean
bottleneck code of its few records minus the global mean, so look-alike sentences tie whatever the units mean). What
survives at the adopted block, all with both vectors grown and most stable in every seed:

- `(And (Goal $e0 $x0) (Patient $e0 $x1))` ~ `(And (Goal $e0 $x0) (Theme $e0 $x1))` (0.898, 7 / 6 records): the
  Patient / Theme wobble inside the Goal frame — the #23 flip family seen from the autoencoder's side, and a genuine
  interchangeability finding (the two frames never co-occur because a record has one or the other role).
- `(Member $x0 crowd)` ~ the Recipient-with-clausal-Theme frames (0.959) and ~ `(And (Agent $e0 $x0) (Recipient $e0
  $x1))` (0.915): "crowd" as the thing told or addressed — a frame association, not a synonym.
- `(And (Goal $e0 $x0) (Patient $e0 $x1))` ~ `(And (Goal $e0 $x0) (Member $e0 go))` (0.884): the go-frame beside its
  transitive Goal sibling.

At k 64 the sixteen survivors add `(And (Obligated $e0) (Theme $e0 $x0))` ~ `(And (Obligated $e0) (Patient $e0 $x0))`
(0.901, 9 / 8 records, stable 5/5) — the same Theme / Patient wobble under a modal — and swim ~ play in the Agent
frame (0.872); the beta-2 twin adds `(Agent $e0 david)` ~ `(Agent $e0 mark)` (0.931, stable 5/5): two names as
interchangeable Agent fillers, the name-cluster effect §4.3.2 reported. At k 128 no exclusive tie survives the floor
(32 without it). The designed case is still NOT recovered: `(Member $e0 start)` ~ `(Member $e0 begin)` sits at cosine
−0.34 (k 32) and −0.20 (k 128) with both vectors well above the floor — the model encodes the two verbs as distinct
directions; their aspectual complement, which is what would tie them, is a separate unit in the same records.

**Tie groups.** With the floor, 77 groups cover 559 of the 609 entering units at the adopted block (50 entering units
tie with nothing; 845 sit below the floor); the largest groups are the same-records families and the frequent frame
families around Agent / Past / Patient.

## What the method delivers on the item-E substrate (Tier A harness)

The floor trades recall for precision on the designed corpus: 1,057 of the 1,652 units enter at k 32, and the Tier A
recall falls from 10 / 26 (run #1, no floor) to 2 / 26 (begin | commence, begin | start; 4 / 26 at k 64 and 3 / 26 in
the beta-2 twin), while the control hit begin | end disappears at every point of the dial. The recovered pairs of
run #1 (reject ~ turn_down, need ~ require, postpone ~ put_off, …) were exclusive ties between low-norm units in the
same designed frame: the very mechanism the floor excludes. On a corpus built of rare, deliberately swapped units the
paper's method therefore works only in its noisy regime; the floor keeps the two aspectual pairs whose units are
frequent enough to be encoded and nothing else.

## Reading

1. As written, §4.3.5 on this substrate is chiefly a co-occurrence detector: with the floor, all but a handful of its
   6,896 ties restate the unit lattice, and it corroborates 82 of §4.3.3's 104 passes.
2. Its own claim — interchangeable subtrees — survives the floor as a short, readable list whose best members are the
   Theme / Patient role wobble inside a shared frame (Goal, Obligated) and name / activity-verb interchange: the same
   families §4.3.2 and the #23 flip audit found from the filler side. That is corroboration across methods, not a
   new rule family.
3. The floor is a precision lever with a measurable cost: on item-E it removes eight of the ten designed recoveries
   together with the control hit. Whether the pipeline wants the floored or the unfloored list is a candidate-stage
   decision; both are in the record.
4. The lexical case the paper motivates (start ~ begin) is not what a count autoencoder ties, at any bottleneck: the
   verbs get their own directions and the shared complement is a separate feature. Interchangeability at the lemma
   level is §4.3.2's and §4.3.4's business.
5. Output size at these parameters: about 65 MB on H and 152 MB on item-E; everything is deterministic and regenerable
   in about 85 minutes per pass.
