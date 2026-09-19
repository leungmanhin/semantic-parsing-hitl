;; FUSE-NF §4.3.5 Autoencoder Analysis — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   ae_faithful.jsonl (adopted k / beta) and ae_faithful_dial/k<k>_beta<b>.jsonl   (every pair with cosine >= 0.8, whatever the floor)
;;   ae_faithful_weights/k<k>_beta<b>_seed<s>.tsv   (one encoder weight vector per unit)
;;
;; BLOCK: bottleneck 128, sparsity beta 0.5, gate cosine >= 0.85 with norm floor init — one point of the dial; the adopted setting (k 32, beta 0.5, cosine 0.85, floor init) is
;;   ../ae_faithful.metta
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   units           out_h/patterns2_faithful.jsonl: 1454 rooted-subtree units of the §4.3.1 faithful view, taken as-is
;;                   (subsumed units and identical columns included — the faithful arm never pre-filters)
;;   records         canonical_substrate.jsonl: 2302 records
;;   vectorisation   count of each unit's matches (variable bindings) per record, recounted with the miner's enumerator
;;                   (k = 4 atoms, 28 eligible atoms per record, surface atoms excluded, constants verbatim)
;;                   and verified against the inventory (column sums = occurrences, non-zero rows = support sets);
;;                   raw counts, no scaling: 11330 non-zero cells, 1075 repeat matches beyond the first
;;   autoencoder     one hidden layer of 128 sigmoid units, linear output, tied decoder x_hat = h W + c;
;;                   init W uniform(+-sqrt(6/(F+k))), b = 0, c = the column means
;;   loss            mean over records of the squared reconstruction error summed over units + 0.0001 ||W||^2
;;                   + beta 0.5 * sum_j KL(rho 0.1 || mean activation of hidden unit j)   (beta 0 = the plain shallow AE)
;;   training        full batch, Adam lr 0.01, 10000 epochs, float32, 8 thread(s), seed 0 adopted;
;;                   seeds 0..4 retrain the same model for the stability count
;;                   this block: reconstruction 1.4159 per record, R^2 0.7693, mean activation 0.1011;
;;                   reconstruction at each tenth of the epochs: 2.2575 / 1.6701 / 1.5186 / 1.4738 / 1.4509 / 1.4352 / 1.4336 / 1.436 / 1.4686 / 1.4165
;;   ties            cosine between the two units' encoder weight vectors (the columns of W, 128-dimensional);
;;                   gate cosine >= 0.85 (dial 0.80, 0.85, 0.90, 0.95); recording floor 0.8
;;   norm floor      a unit ENTERS the comparison at encoder-vector norm >= 0.402 (init); dial none 0.000 / median 0.585 / init 0.402;
;;                   init = the initialisation norm a*sqrt(k/3), a = sqrt(6/(F+k)) — training grew the vector beyond where it
;;                   started; median = the median unit norm; 1000 of 1454 units enter under this block's floor
;;   co-occurrence   from the units' record sets: exclusive (no shared record) / overlapping / nested / same-records;
;;                   part-of = one unit's atoms embed in the other's (§4.3.1 containment) — a FIELD, never a filter
;;   tie groups      complete linkage on the cosine distance of the entering units' weight vectors, cut at 1 - tau: every
;;                   pair inside a group passes the gate; a partition (a unit sits in one group) — the pairwise record is the JSONL
;;
;; RECORD FORMAT (every record is one pair, with its gate verdict)
;;   ;; [relation(, part-of)]  A ~ B   cosine <seed 0> (seeds <n>/<S> >= tau)   records <A> / <B> / <shared>   norms <A> / <B>   gate: PASS|FAIL
;;   ;;   A: <query A>   e.g. <witness record ids>
;;   ;;   B: <query B>
;;   ;;   substitution: <atom of B> -> <atom of A>      (shape-parallel exclusive pairs only)
;;   (Implication <B> <A>)                               (shape-parallel exclusive pairs only)
;;     = the consolidation as the rule it would become: the minority unit (smaller support) rewrites to the majority
;;     unit. Rendered ONLY for an EXCLUSIVE pair that is SHAPE-PARALLEL (owner 2026-09-18): same number of atoms and,
;;     under a renaming of variables, all atoms but one coincide, the differing atom differing only in its head symbol
;;     or a constant — so the two sides' variables line up by construction (an exclusive pair shares no record, so no
;;     alignment is observable otherwise). Every other pair carries ';;   rule: none' with the reason: an exclusive pair
;;     that is not shape-parallel records shared sentence context, not a rewrite; a co-occurring pair (overlapping /
;;     nested / same-records) corroborates §4.3.3 / §4.3.1, and a whole implying its part is a tautology.
;;     Naming and direction provisional, the gauntlet decides.
;; A is the unit with the larger support (tie: query order). PASS pairs in this order — SHAPE-PARALLEL EXCLUSIVE first (the
;; rules), then the other EXCLUSIVE pairs (the paper's interchangeability reading: the two units never share a record),
;; then OVERLAPPING, NESTED and SAME-RECORDS (co-occurrence: corroboration, not new rules) — each group by cosine;
;; near misses and the pairs above the cosine gate with a side below the floor are in the JSONL only.

;; ==================== TIED PAIRS: 1849 pass the gate — exclusive 0 (shape-parallel 0 = the rules), overlapping 365, nested 841, same-records 643 — among the 1056331 pairs of 1454 units (1000 entering); 3077 pairs above the cosine gate have a side below the floor; 5391 pairs recorded in the JSONL ====================

;; [overlapping]  p207205 ~ p207606   cosine 0.9990 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.58 / 0.55   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 way))   e.g. tierC-000261 tierC-000262
;;   B: (GroupOf $x0 sequence)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p207606 ~ p207609   cosine 0.9990 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.55 / 0.58   gate: PASS
;;   A: (GroupOf $x0 sequence)   e.g. tierC-000261 tierC-000262
;;   B: (GroupOf $x0 way)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204759 ~ p207613   cosine 0.9986 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.65 / 1.26   gate: PASS
;;   A: (Member $x0 northern)   e.g. tierC-000135 tierC-000136
;;   B: (LocatedIn $x0 india)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204766 ~ p207293   cosine 0.9982 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.53 / 0.53   gate: PASS
;;   A: (Member $x0 region)   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $e0 rule) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204766 ~ p207649   cosine 0.9982 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.53 / 0.53   gate: PASS
;;   A: (Member $x0 region)   e.g. tierC-000095 tierC-000096
;;   B: (Member $e0 rule)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204759 ~ p204775   cosine 0.9972 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.65 / 0.65   gate: PASS
;;   A: (Member $x0 northern)   e.g. tierC-000135 tierC-000136
;;   B: (Member $x0 view)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207622 ~ p207695   cosine 0.9968 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.50 / 0.50   gate: PASS
;;   A: (Member $e0 bake)   e.g. tierC-000197 tierC-000198
;;   B: (Member $x0 headquarters)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204775 ~ p207613   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.65 / 1.26   gate: PASS
;;   A: (Member $x0 view)   e.g. tierC-000135 tierC-000136
;;   B: (LocatedIn $x0 india)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206864 ~ p207702   cosine 0.9924 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.72 / 0.55   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Time $e0 night))   e.g. tierC-000283 tierC-000284
;;   B: (Member $x0 mass)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207340 ~ p207702   cosine 0.9924 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.72 / 0.55   gate: PASS
;;   A: (And (Patient $e0 $x0) (Time $e0 night))   e.g. tierC-000283 tierC-000284
;;   B: (Member $x0 mass)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204538 ~ p203766   cosine 0.9916 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.84 / 0.83   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204538 ~ p204555   cosine 0.9916 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.84 / 0.83   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202855 ~ p202890   cosine 0.9901 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 1.01 / 1.02   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 sing))   e.g. tierB-001156 tierB-001901 tierC-000127
;;   B: (And (Member $e0 sing) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207205 ~ p207227   cosine 0.9882 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.58 / 0.62   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 way))   e.g. tierC-000261 tierC-000262
;;   B: (And (In $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207227 ~ p207609   cosine 0.9882 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.62 / 0.58   gate: PASS
;;   A: (And (In $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000261 tierC-000262
;;   B: (GroupOf $x0 way)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207227 ~ p207606   cosine 0.9879 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.62 / 0.55   gate: PASS
;;   A: (And (In $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000261 tierC-000262
;;   B: (GroupOf $x0 sequence)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204766 ~ p206806   cosine 0.9844 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.53 / 0.62   gate: PASS
;;   A: (Member $x0 region)   e.g. tierC-000095 tierC-000096
;;   B: (And (Agent $e0 $x0) (Member $e0 follow) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206806 ~ p207293   cosine 0.9834 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.62 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow) (Past $e0))   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $e0 rule) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206806 ~ p207649   cosine 0.9834 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.62 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow) (Past $e0))   e.g. tierC-000095 tierC-000096
;;   B: (Member $e0 rule)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207279 ~ p207702   cosine 0.9830 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.59 / 0.55   gate: PASS
;;   A: (And (Member $e0 hold) (Patient $e0 $x0))   e.g. tierC-000283 tierC-000284
;;   B: (Member $x0 mass)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201821 ~ p202210   cosine 0.9828 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 1.08 / 1.00   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202987 ~ p203766   cosine 0.9813 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.87 / 0.83   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202987 ~ p204555   cosine 0.9813 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.87 / 0.83   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202884 ~ p204492   cosine 0.9812 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.92 / 0.79   gate: PASS
;;   A: (And (Member $e0 need) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204487 ~ p204488   cosine 0.9805 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.77 / 0.77   gate: PASS
;;   A: (And (During $e0 $e1) (Past $e0))   e.g. tierB-001782 tierB-001809 tierC-000231
;;   B: (And (During $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201820 ~ p202191   cosine 0.9801 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 1.02 / 0.93   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207249 ~ p207327   cosine 0.9764 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.53 / 1.02   gate: PASS
;;   A: (And (Manner $e0 well) (Theme $e0 $x0))   e.g. tierC-000235 tierC-000236
;;   B: (And (Member $x0 work) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201497 ~ p201823   cosine 0.9755 (seeds 5/5 >= 0.85)   records 8 / 7 / 6   norms 1.11 / 1.04   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207279 ~ p206864   cosine 0.9745 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.59 / 0.72   gate: PASS
;;   A: (And (Member $e0 hold) (Patient $e0 $x0))   e.g. tierC-000283 tierC-000284
;;   B: (And (Past $e0) (Patient $e0 $x0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p207279 ~ p207340   cosine 0.9745 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.59 / 0.72   gate: PASS
;;   A: (And (Member $e0 hold) (Patient $e0 $x0))   e.g. tierC-000283 tierC-000284
;;   B: (And (Patient $e0 $x0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203721 ~ p203757   cosine 0.9732 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.87 / 0.86   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201066 ~ p201487   cosine 0.9722 (seeds 5/5 >= 0.85)   records 10 / 8 / 7   norms 1.22 / 1.02   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202878 ~ p207293   cosine 0.9721 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.75 / 0.53   gate: PASS
;;   A: (And (Member $e0 follow) (Past $e0))   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $e0 rule) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202878 ~ p207649   cosine 0.9721 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.75 / 0.53   gate: PASS
;;   A: (And (Member $e0 follow) (Past $e0))   e.g. tierC-000095 tierC-000096
;;   B: (Member $e0 rule)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p205988 ~ p206809   cosine 0.9719 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.64 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p205988 ~ p207289   cosine 0.9719 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.64 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))   e.g. tierB-001125 tierB-001433
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207277 ~ p207306   cosine 0.9718 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.46 / 0.50   gate: PASS
;;   A: (And (Member $e0 go) (To $e0 $e1))   e.g. tierC-000209 tierC-000210
;;   B: (And (Member $e0 talk) (To $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202878 ~ p204766   cosine 0.9690 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.75 / 0.53   gate: PASS
;;   A: (And (Member $e0 follow) (Past $e0))   e.g. tierC-000095 tierC-000096
;;   B: (Member $x0 region)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202856 ~ p204539   cosine 0.9677 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 1.19 / 1.02   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 study))   e.g. tierC-000253 tierC-000254
;;   B: (And (Member $e0 study) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202880 ~ p202881   cosine 0.9675 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.72 / 0.74   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207153 ~ p207206   cosine 0.9658 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.57 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (CoAgent $e0 $x1))   e.g. tierC-000121 tierC-000122
;;   B: (And (CoAgent $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203750 ~ p204317   cosine 0.9647 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487
;;   B: (And (Member $e0 open) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203750 ~ p204531   cosine 0.9647 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487
;;   B: (And (Member $e0 open) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203006 ~ p207249   cosine 0.9638 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.56 / 0.53   gate: PASS
;;   A: (Member $x0 work)   e.g. tierC-000235 tierC-000236
;;   B: (And (Manner $e0 well) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206015 ~ p207216   cosine 0.9601 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.62 / 0.54   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $x0 door))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207216 ~ p206850   cosine 0.9601 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.54 / 0.62   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 door))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207216 ~ p207285   cosine 0.9601 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.54 / 0.62   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 door))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207216 ~ p207286   cosine 0.9601 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.54 / 0.62   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 door))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207168 ~ p207715   cosine 0.9572 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.59 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 serve))   e.g. tierC-000053 tierC-000054
;;   B: (Member $x0 president)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204507 ~ p204771   cosine 0.9549 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.67 / 0.71   gate: PASS
;;   A: (And (Location $e0 $x0) (Location $e0 $x1))   e.g. tierC-000135 tierC-000136 tierC-000279
;;   B: (Member $x0 southern)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204478 ~ p204554   cosine 0.9545 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.87 / 0.86   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202880 ~ p202882   cosine 0.9540 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.72 / 0.70   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204457 ~ p207219   cosine 0.9500 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.64 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (For $e0 $x1))   e.g. tierB-000712 tierB-001786
;;   B: (And (For $e0 $x0) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204490 ~ p207229   cosine 0.9497 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.51 / 0.41   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Like $e0 $x1))   e.g. tierB-000230 tierB-000831
;;   B: (And (Like $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202192 ~ p202878   cosine 0.9487 (seeds 5/5 >= 0.85)   records 6 / 5 / 3   norms 1.05 / 0.75   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow))   e.g. tierB-000231 tierC-000095 tierC-000096
;;   B: (And (Member $e0 follow) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202570 ~ p204311   cosine 0.9481 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 1.09 / 0.67   gate: PASS
;;   A: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202570 ~ p204519   cosine 0.9481 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 1.09 / 0.67   gate: PASS
;;   A: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202140 ~ p204298   cosine 0.9477 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.90 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202872 ~ p207206   cosine 0.9477 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.67 / 0.55   gate: PASS
;;   A: (And (Measure $e0 duration <num> year) (Past $e0))   e.g. tierC-000121 tierC-000122
;;   B: (And (CoAgent $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204545 ~ p206006   cosine 0.9472 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.23 / 0.74   gate: PASS
;;   A: (And (Member $e0 want) (Past $e0))   e.g. tierC-000311 tierC-000312
;;   B: (And (Because $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204545 ~ p207196   cosine 0.9472 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.23 / 0.74   gate: PASS
;;   A: (And (Member $e0 want) (Past $e0))   e.g. tierC-000311 tierC-000312
;;   B: (And (Because $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204545 ~ p207197   cosine 0.9472 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.23 / 0.74   gate: PASS
;;   A: (And (Member $e0 want) (Past $e0))   e.g. tierC-000311 tierC-000312
;;   B: (And (Because $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204545 ~ p207591   cosine 0.9472 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.23 / 0.74   gate: PASS
;;   A: (And (Member $e0 want) (Past $e0))   e.g. tierC-000311 tierC-000312
;;   B: (Because $e0 $e1)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204282 ~ p205981   cosine 0.9471 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 1.16 / 0.93   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204462 ~ p205981   cosine 0.9471 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 1.16 / 0.93   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201067 ~ p201489   cosine 0.9458 (seeds 5/5 >= 0.85)   records 10 / 8 / 7   norms 0.93 / 0.80   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-001582 tierB-001817 tierC-000001
;;   B: (And (Member $e0 become) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201490 ~ p201823   cosine 0.9450 (seeds 5/5 >= 0.85)   records 8 / 7 / 6   norms 1.11 / 1.04   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207227 ~ p207266   cosine 0.9434 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.62 / 0.63   gate: PASS
;;   A: (And (In $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000261 tierC-000262
;;   B: (And (Member $e0 define) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207227 ~ p207629   cosine 0.9434 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.62 / 0.63   gate: PASS
;;   A: (And (In $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000261 tierC-000262
;;   B: (Member $e0 define)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202874 ~ p205981   cosine 0.9419 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 1.20 / 0.93   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202977 ~ p205981   cosine 0.9419 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 1.20 / 0.93   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204509 ~ p204544   cosine 0.9396 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.71 / 0.68   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p207162 ~ p207259   cosine 0.9387 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 close))   e.g. tierB-000950 tierB-001926
;;   B: (And (Member $e0 close) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207266 ~ p207606   cosine 0.9373 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.63 / 0.55   gate: PASS
;;   A: (And (Member $e0 define) (Theme $e0 $x0))   e.g. tierC-000261 tierC-000262
;;   B: (GroupOf $x0 sequence)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207606 ~ p207629   cosine 0.9373 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.55 / 0.63   gate: PASS
;;   A: (GroupOf $x0 sequence)   e.g. tierC-000261 tierC-000262
;;   B: (Member $e0 define)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202761 ~ p206806   cosine 0.9371 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.94 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1))   e.g. tierC-000095 tierC-000096
;;   B: (And (Agent $e0 $x0) (Member $e0 follow) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202879 ~ p206806   cosine 0.9371 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.94 / 0.62   gate: PASS
;;   A: (And (Member $e0 follow) (Theme $e0 $x0))   e.g. tierC-000095 tierC-000096
;;   B: (And (Agent $e0 $x0) (Member $e0 follow) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207248 ~ p207327   cosine 0.9369 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.55 / 1.02   gate: PASS
;;   A: (And (Manner $e0 well) (Past $e0))   e.g. tierC-000235 tierC-000236
;;   B: (And (Member $x0 work) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207205 ~ p207266   cosine 0.9361 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.58 / 0.63   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 way))   e.g. tierC-000261 tierC-000262
;;   B: (And (Member $e0 define) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207205 ~ p207629   cosine 0.9361 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.58 / 0.63   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 way))   e.g. tierC-000261 tierC-000262
;;   B: (Member $e0 define)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207266 ~ p207609   cosine 0.9361 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.63 / 0.58   gate: PASS
;;   A: (And (Member $e0 define) (Theme $e0 $x0))   e.g. tierC-000261 tierC-000262
;;   B: (GroupOf $x0 way)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207609 ~ p207629   cosine 0.9361 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.58 / 0.63   gate: PASS
;;   A: (GroupOf $x0 way)   e.g. tierC-000261 tierC-000262
;;   B: (Member $e0 define)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202216 ~ p204311   cosine 0.9358 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 1.12 / 0.67   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202216 ~ p204519   cosine 0.9358 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 1.12 / 0.67   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202761 ~ p202878   cosine 0.9358 (seeds 5/5 >= 0.85)   records 5 / 5 / 2   norms 0.94 / 0.75   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1))   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $e0 follow) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202878 ~ p202879   cosine 0.9358 (seeds 5/5 >= 0.85)   records 5 / 5 / 2   norms 0.75 / 0.94   gate: PASS
;;   A: (And (Member $e0 follow) (Past $e0))   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $e0 follow) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202209 ~ p204522   cosine 0.9348 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 1.12 / 0.76   gate: PASS
;;   A: (And (Member $e0 change) (Patient $e0 $x0))   e.g. tierB-000139 tierB-001803 tierC-000011
;;   B: (And (Member $e0 change) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202215 ~ p207175   cosine 0.9348 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.88 / 0.53   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001813 tierB-001873
;;   B: (And (Agent $e0 $x0) (Member $e0 work))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202761 ~ p207293   cosine 0.9346 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.94 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1))   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $e0 rule) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202761 ~ p207649   cosine 0.9346 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.94 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1))   e.g. tierC-000095 tierC-000096
;;   B: (Member $e0 rule)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202879 ~ p207293   cosine 0.9346 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.94 / 0.53   gate: PASS
;;   A: (And (Member $e0 follow) (Theme $e0 $x0))   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $e0 rule) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202879 ~ p207649   cosine 0.9346 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.94 / 0.53   gate: PASS
;;   A: (And (Member $e0 follow) (Theme $e0 $x0))   e.g. tierC-000095 tierC-000096
;;   B: (Member $e0 rule)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p206830 ~ p206831   cosine 0.9342 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.57 / 0.61   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202192 ~ p207293   cosine 0.9341 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.05 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow))   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $e0 rule) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202192 ~ p207649   cosine 0.9341 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.05 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow))   e.g. tierC-000095 tierC-000096
;;   B: (Member $e0 rule)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207585 ~ p207708   cosine 0.9341 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.92 / 0.41   gate: PASS
;;   A: (Agent $e0 michael)   e.g. tierB-000252
;;   B: (Member $x0 opportunity)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201874 ~ p206006   cosine 0.9338 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 1.44 / 0.74   gate: PASS
;;   A: (Member $e0 want)   e.g. tierC-000311 tierC-000312
;;   B: (And (Because $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201874 ~ p207196   cosine 0.9338 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 1.44 / 0.74   gate: PASS
;;   A: (Member $e0 want)   e.g. tierC-000311 tierC-000312
;;   B: (And (Because $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201874 ~ p207197   cosine 0.9338 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 1.44 / 0.74   gate: PASS
;;   A: (Member $e0 want)   e.g. tierC-000311 tierC-000312
;;   B: (And (Because $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201874 ~ p207591   cosine 0.9338 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 1.44 / 0.74   gate: PASS
;;   A: (Member $e0 want)   e.g. tierC-000311 tierC-000312
;;   B: (Because $e0 $e1)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204317 ~ p207600   cosine 0.9334 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.83 / 0.41   gate: PASS
;;   A: (And (Member $e0 open) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000285 tierC-000286
;;   B: (GroupOf $x0 law)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204531 ~ p207600   cosine 0.9334 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.83 / 0.41   gate: PASS
;;   A: (And (Member $e0 open) (Past $e0))   e.g. tierC-000285 tierC-000286
;;   B: (GroupOf $x0 law)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204725 ~ p207702   cosine 0.9333 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.63 / 0.55   gate: PASS
;;   A: (Member $e0 hold)   e.g. tierC-000283 tierC-000284
;;   B: (Member $x0 mass)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202201 ~ p202884   cosine 0.9332 (seeds 5/5 >= 0.85)   records 6 / 5 / 3   norms 0.86 / 0.92   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203739 ~ p206658   cosine 0.9331 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.92 / 0.86   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204510 ~ p206658   cosine 0.9331 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.92 / 0.86   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table))   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204507 ~ p204759   cosine 0.9325 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.67 / 0.65   gate: PASS
;;   A: (And (Location $e0 $x0) (Location $e0 $x1))   e.g. tierC-000135 tierC-000136
;;   B: (Member $x0 northern)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202192 ~ p204766   cosine 0.9324 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 1.05 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow))   e.g. tierC-000095 tierC-000096
;;   B: (Member $x0 region)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202761 ~ p204766   cosine 0.9323 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.94 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1))   e.g. tierC-000095 tierC-000096
;;   B: (Member $x0 region)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202879 ~ p204766   cosine 0.9323 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.94 / 0.53   gate: PASS
;;   A: (And (Member $e0 follow) (Theme $e0 $x0))   e.g. tierC-000095 tierC-000096
;;   B: (Member $x0 region)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204507 ~ p207613   cosine 0.9323 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.67 / 1.26   gate: PASS
;;   A: (And (Location $e0 $x0) (Location $e0 $x1))   e.g. tierC-000135 tierC-000136
;;   B: (LocatedIn $x0 india)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p206803 ~ p206839   cosine 0.9322 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.67 / 0.71   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206803 ~ p207258   cosine 0.9322 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.67 / 0.71   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201241 ~ p201252   cosine 0.9317 (seeds 5/5 >= 0.85)   records 9 / 9 / 5   norms 1.02 / 1.36   gate: PASS
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1))   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Past $e0) (Recipient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202852 ~ p204521   cosine 0.9316 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.84 / 0.86   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause))   e.g. tierB-000775 tierB-001649 tierB-001875
;;   B: (And (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204507 ~ p204775   cosine 0.9304 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.67 / 0.65   gate: PASS
;;   A: (And (Location $e0 $x0) (Location $e0 $x1))   e.g. tierC-000135 tierC-000136
;;   B: (Member $x0 view)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202194 ~ p207735   cosine 0.9300 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.59 / 0.41   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773 tierB-001870
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202853 ~ p202883   cosine 0.9300 (seeds 5/5 >= 0.85)   records 5 / 5 / 2   norms 0.85 / 0.89   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 leave))   e.g. tierB-000298 tierB-000747
;;   B: (And (Member $e0 leave) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204314 ~ p204315   cosine 0.9296 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202858 ~ p207308   cosine 0.9284 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.01 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 watch))   e.g. tierB-001720 tierB-001800
;;   B: (And (Member $e0 watch) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206032 ~ p207317   cosine 0.9283 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.71 / 0.44   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))   e.g. tierB-000371
;;   B: (And (Member $x0 house) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p207237 ~ p207317   cosine 0.9283 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.71 / 0.44   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 house))   e.g. tierB-000371
;;   B: (And (Member $x0 house) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202982 ~ p204490   cosine 0.9281 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.51 / 0.51   gate: PASS
;;   A: (Member $e0 look)   e.g. tierB-000230 tierB-000831
;;   B: (And (Experiencer $e0 $x0) (Like $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206044 ~ p207625   cosine 0.9281 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.58 / 0.46   gate: PASS
;;   A: (And (Member $x0 fire) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001302
;;   B: (Member $e0 break_out)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207255 ~ p206044   cosine 0.9281 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.46 / 0.58   gate: PASS
;;   A: (And (Member $e0 break_out) (Past $e0))   e.g. tierB-001302
;;   B: (And (Member $x0 fire) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207255 ~ p207315   cosine 0.9281 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.46 / 0.58   gate: PASS
;;   A: (And (Member $e0 break_out) (Past $e0))   e.g. tierB-001302
;;   B: (And (Member $x0 fire) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207315 ~ p207625   cosine 0.9281 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.58 / 0.46   gate: PASS
;;   A: (And (Member $x0 fire) (Patient $e0 $x0))   e.g. tierB-001302
;;   B: (Member $e0 break_out)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202214 ~ p202894   cosine 0.9279 (seeds 5/5 >= 0.85)   records 6 / 5 / 4   norms 0.91 / 0.79   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201770 ~ p202142   cosine 0.9278 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 0.73 / 0.66   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204463 ~ p206845   cosine 0.9270 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.67 / 0.73   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 eat))   e.g. tierB-000338 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204463 ~ p207270   cosine 0.9270 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.67 / 0.73   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 eat))   e.g. tierB-000338 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204463 ~ p207271   cosine 0.9270 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.67 / 0.73   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 eat))   e.g. tierB-000338 tierB-001551
;;   B: (And (Member $e0 eat) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201528 ~ p202982   cosine 0.9269 (seeds 5/5 >= 0.85)   records 8 / 5 / 3   norms 0.73 / 0.51   gate: PASS
;;   A: (Like $e0 $x0)   e.g. tierB-000230 tierB-000831 tierB-001135
;;   B: (Member $e0 look)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207248 ~ p207249   cosine 0.9269 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.55 / 0.53   gate: PASS
;;   A: (And (Manner $e0 well) (Past $e0))   e.g. tierC-000235 tierC-000236
;;   B: (And (Manner $e0 well) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202872 ~ p204687   cosine 0.9268 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.67 / 0.60   gate: PASS
;;   A: (And (Measure $e0 duration <num> year) (Past $e0))   e.g. tierC-000121 tierC-000122
;;   B: (CoAgent $e0 $x0)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201087 ~ p207293   cosine 0.9267 (seeds 5/5 >= 0.85)   records 10 / 3 / 2   norms 1.27 / 0.53   gate: PASS
;;   A: (Member $e0 follow)   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $e0 rule) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201087 ~ p207649   cosine 0.9267 (seeds 5/5 >= 0.85)   records 10 / 3 / 2   norms 1.27 / 0.53   gate: PASS
;;   A: (Member $e0 follow)   e.g. tierC-000095 tierC-000096
;;   B: (Member $e0 rule)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202872 ~ p207153   cosine 0.9263 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.67 / 0.57   gate: PASS
;;   A: (And (Measure $e0 duration <num> year) (Past $e0))   e.g. tierC-000121 tierC-000122
;;   B: (And (Agent $e0 $x0) (CoAgent $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204320 ~ p206858   cosine 0.9262 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.68 / 0.55   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201067 ~ p201488   cosine 0.9250 (seeds 5/5 >= 0.85)   records 10 / 8 / 7   norms 0.93 / 0.79   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-000352 tierB-001582 tierC-000001
;;   B: (And (Member $e0 become) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206852 ~ p206862   cosine 0.9249 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.60 / 0.60   gate: PASS
;;   A: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000325 tierB-001809
;;   B: (And (Ongoing $e0) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204469 ~ p207695   cosine 0.9246 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.58 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 sell))   e.g. tierC-000197 tierC-000198
;;   B: (Member $x0 headquarters)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202201 ~ p204492   cosine 0.9243 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.86 / 0.79   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204469 ~ p207622   cosine 0.9242 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.58 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 sell))   e.g. tierC-000197 tierC-000198
;;   B: (Member $e0 bake)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202215 ~ p207213   cosine 0.9239 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.88 / 0.46   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-000419 tierB-001515
;;   B: (And (Experiencer $e0 $x0) (Member $e0 work))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201827 ~ p207600   cosine 0.9234 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 1.30 / 0.41   gate: PASS
;;   A: (And (Member $e0 open) (Patient $e0 $x0))   e.g. tierC-000285 tierC-000286
;;   B: (GroupOf $x0 law)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201087 ~ p204766   cosine 0.9227 (seeds 5/5 >= 0.85)   records 10 / 4 / 2   norms 1.27 / 0.53   gate: PASS
;;   A: (Member $e0 follow)   e.g. tierC-000095 tierC-000096
;;   B: (Member $x0 region)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206830 ~ p206860   cosine 0.9226 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.57 / 0.58   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201270 ~ p202201   cosine 0.9222 (seeds 5/5 >= 0.85)   records 9 / 6 / 3   norms 1.14 / 0.86   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202778 ~ p206047   cosine 0.9216 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.08 / 0.60   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000011 tierC-000012
;;   B: (And (Member $x0 song) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202778 ~ p207323   cosine 0.9216 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.08 / 0.60   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000011 tierC-000012
;;   B: (And (Member $x0 song) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202885 ~ p206047   cosine 0.9216 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.08 / 0.60   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0))   e.g. tierC-000011 tierC-000012
;;   B: (And (Member $x0 song) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202885 ~ p207323   cosine 0.9216 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.08 / 0.60   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0))   e.g. tierC-000011 tierC-000012
;;   B: (And (Member $x0 song) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202886 ~ p206047   cosine 0.9216 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.08 / 0.60   gate: PASS
;;   A: (And (Member $e0 present) (Theme $e0 $x0))   e.g. tierC-000011 tierC-000012
;;   B: (And (Member $x0 song) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202886 ~ p207323   cosine 0.9216 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.08 / 0.60   gate: PASS
;;   A: (And (Member $e0 present) (Theme $e0 $x0))   e.g. tierC-000011 tierC-000012
;;   B: (And (Member $x0 song) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204725 ~ p206864   cosine 0.9212 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.63 / 0.72   gate: PASS
;;   A: (Member $e0 hold)   e.g. tierC-000283 tierC-000284
;;   B: (And (Past $e0) (Patient $e0 $x0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204725 ~ p207340   cosine 0.9212 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.63 / 0.72   gate: PASS
;;   A: (Member $e0 hold)   e.g. tierC-000283 tierC-000284
;;   B: (And (Patient $e0 $x0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202289 ~ p206047   cosine 0.9208 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.12 / 0.60   gate: PASS
;;   A: (Member $e0 present)   e.g. tierC-000011 tierC-000012
;;   B: (And (Member $x0 song) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202289 ~ p207323   cosine 0.9208 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.12 / 0.60   gate: PASS
;;   A: (Member $e0 present)   e.g. tierC-000011 tierC-000012
;;   B: (And (Member $x0 song) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202207 ~ p202570   cosine 0.9197 (seeds 5/5 >= 0.85)   records 6 / 5 / 3   norms 0.74 / 1.09   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202281 ~ p202570   cosine 0.9197 (seeds 5/5 >= 0.85)   records 6 / 5 / 3   norms 0.74 / 1.09   gate: PASS
;;   A: (Member $e0 bear)   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204894 ~ p206844   cosine 0.9180 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.61 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204894 ~ p207269   cosine 0.9180 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.61 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206039 ~ p206844   cosine 0.9180 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.61 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206039 ~ p207269   cosine 0.9180 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.61 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206831 ~ p206860   cosine 0.9178 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.61 / 0.58   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204298 ~ p203739   cosine 0.9162 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.86 / 0.92   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204298 ~ p204510   cosine 0.9162 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.86 / 0.92   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204306 ~ p206034   cosine 0.9161 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.76 / 0.64   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 find) (Past $e0))   e.g. tierC-000243 tierC-000244
;;   B: (And (Location $e0 $x0) (Member $x0 bench) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204306 ~ p207235   cosine 0.9161 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.76 / 0.64   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 find) (Past $e0))   e.g. tierC-000243 tierC-000244
;;   B: (And (Location $e0 $x0) (Member $x0 bench))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204306 ~ p207669   cosine 0.9161 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.76 / 0.64   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 find) (Past $e0))   e.g. tierC-000243 tierC-000244
;;   B: (Member $x0 bench)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203006 ~ p207248   cosine 0.9159 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.56 / 0.55   gate: PASS
;;   A: (Member $x0 work)   e.g. tierC-000235 tierC-000236
;;   B: (And (Manner $e0 well) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201676 ~ p202142   cosine 0.9140 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 0.74 / 0.66   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201771 ~ p202142   cosine 0.9140 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 0.74 / 0.66   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202882 ~ p204314   cosine 0.9117 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.70 / 0.67   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204283 ~ p206819   cosine 0.9117 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.00 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204465 ~ p206819   cosine 0.9117 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.00 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204530 ~ p206819   cosine 0.9117 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.00 / 0.77   gate: PASS
;;   A: (And (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204727 ~ p206819   cosine 0.9117 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.00 / 0.77   gate: PASS
;;   A: (Member $e0 jump)   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206007 ~ p207206   cosine 0.9116 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.61 / 0.55   gate: PASS
;;   A: (And (Before $e0 $e1) (Measure $e0 duration <num> year) (Past $e1))   e.g. tierC-000121 tierC-000122
;;   B: (And (CoAgent $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207198 ~ p207206   cosine 0.9116 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.61 / 0.55   gate: PASS
;;   A: (And (Before $e0 $e1) (Measure $e0 duration <num> year))   e.g. tierC-000121 tierC-000122
;;   B: (And (CoAgent $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201490 ~ p201497   cosine 0.9114 (seeds 5/5 >= 0.85)   records 8 / 8 / 6   norms 1.11 / 1.11   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202852 ~ p206839   cosine 0.9109 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.84 / 0.71   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause))   e.g. tierB-000775 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202852 ~ p207258   cosine 0.9109 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.84 / 0.71   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause))   e.g. tierB-000775 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203712 ~ p205987   cosine 0.9103 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.62 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))   e.g. tierB-001125 tierB-001511
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204301 ~ p207172   cosine 0.9102 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.75 / 0.53   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-001219
;;   B: (And (Agent $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204498 ~ p207172   cosine 0.9102 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.75 / 0.53   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 walk))   e.g. tierB-000324 tierB-001219
;;   B: (And (Agent $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204509 ~ p206860   cosine 0.9102 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.71 / 0.58   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202207 ~ p202216   cosine 0.9090 (seeds 5/5 >= 0.85)   records 6 / 6 / 3   norms 0.74 / 1.12   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202216 ~ p202281   cosine 0.9090 (seeds 5/5 >= 0.85)   records 6 / 6 / 3   norms 1.12 / 0.74   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (Member $e0 bear)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201250 ~ p202193   cosine 0.9078 (seeds 5/5 >= 0.85)   records 9 / 6 / 3   norms 1.42 / 0.73   gate: PASS
;;   A: (And (Member $e0 use) (Theme $e0 $x0))   e.g. tierB-001243 tierC-000173 tierC-000174
;;   B: (And (Agent $e0 $x0) (Member $e0 use))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204533 ~ p207290   cosine 0.9071 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.58 / 0.43   gate: PASS
;;   A: (And (Member $e0 play) (Theme $e0 $x0))   e.g. tierB-000089 tierC-000230
;;   B: (And (Member $e0 play) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202570 ~ p206844   cosine 0.9070 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.09 / 0.53   gate: PASS
;;   A: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202570 ~ p207269   cosine 0.9070 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.09 / 0.53   gate: PASS
;;   A: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202881 ~ p204315   cosine 0.9070 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.74 / 0.67   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202725 ~ p204849   cosine 0.9060 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.85 / 0.46   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202725 ~ p206009   cosine 0.9060 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.85 / 0.46   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202770 ~ p204849   cosine 0.9060 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.85 / 0.46   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202770 ~ p206009   cosine 0.9060 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.85 / 0.46   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202771 ~ p204849   cosine 0.9060 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.85 / 0.46   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202771 ~ p206009   cosine 0.9060 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.85 / 0.46   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202869 ~ p204849   cosine 0.9060 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.85 / 0.46   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202869 ~ p206009   cosine 0.9060 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.85 / 0.46   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203765 ~ p206046   cosine 0.9049 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.65 / 0.54   gate: PASS
;;   A: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203765 ~ p207321   cosine 0.9049 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.65 / 0.54   gate: PASS
;;   A: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204550 ~ p206046   cosine 0.9049 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.65 / 0.54   gate: PASS
;;   A: (And (Of $x0 $x1) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204550 ~ p207321   cosine 0.9049 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.65 / 0.54   gate: PASS
;;   A: (And (Of $x0 $x1) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201488 ~ p201489   cosine 0.9048 (seeds 5/5 >= 0.85)   records 8 / 8 / 6   norms 0.79 / 0.80   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0))   e.g. tierB-001079 tierB-001582 tierC-000001
;;   B: (And (Member $e0 become) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201532 ~ p207715   cosine 0.9047 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 2.65 / 0.45   gate: PASS
;;   A: (Member $e0 serve)   e.g. tierC-000053 tierC-000054
;;   B: (Member $x0 president)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203007 ~ p206046   cosine 0.9044 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.68 / 0.54   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203007 ~ p207321   cosine 0.9044 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.68 / 0.54   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204311 ~ p206844   cosine 0.9037 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.67 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204311 ~ p207269   cosine 0.9037 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.67 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204519 ~ p206844   cosine 0.9037 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.67 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204519 ~ p207269   cosine 0.9037 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.67 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202881 ~ p202882   cosine 0.9029 (seeds 5/5 >= 0.85)   records 5 / 5 / 3   norms 0.74 / 0.70   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204544 ~ p206831   cosine 0.9025 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.68 / 0.61   gate: PASS
;;   A: (And (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202279 ~ p207327   cosine 0.9011 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.63 / 1.02   gate: PASS
;;   A: (Manner $e0 well)   e.g. tierC-000235 tierC-000236
;;   B: (And (Member $x0 work) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201880 ~ p202304   cosine 0.9001 (seeds 5/5 >= 0.85)   records 7 / 6 / 1   norms 0.44 / 0.60   gate: PASS
;;   A: (Member $x0 water)   e.g. tierB-000782
;;   B: (Member $x0 school)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201493 ~ p201494   cosine 0.9000 (seeds 5/5 >= 0.85)   records 8 / 8 / 5   norms 1.04 / 0.98   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201268 ~ p201497   cosine 0.8995 (seeds 5/5 >= 0.85)   records 9 / 8 / 6   norms 1.19 / 1.11   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p205989 ~ p207236   cosine 0.8992 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.55 / 1.13   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 person))   e.g. tierC-000041 tierC-000042
;;   B: (And (Location $e0 $x0) (Member $x0 couch))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202864 ~ p202891   cosine 0.8991 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.93 / 0.96   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep))   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202139 ~ p204298   cosine 0.8981 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.94 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201817 ~ p204728   cosine 0.8974 (seeds 5/5 >= 0.85)   records 7 / 4 / 2   norms 1.11 / 0.50   gate: PASS
;;   A: (And (For $e0 $x0) (Past $e0))   e.g. tierC-000161 tierC-000162
;;   B: (Member $e0 lose)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201344 ~ p207307   cosine 0.8964 (seeds 5/5 >= 0.85)   records 8 / 3 / 1   norms 1.24 / 0.71   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))   e.g. tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, part-of]  p201274 ~ p207211   cosine 0.8946 (seeds 4/5 >= 0.85)   records 9 / 3 / 2   norms 0.52 / 0.41   gate: PASS
;;   A: (Member $x0 beautiful)   e.g. tierB-000904 tierB-001920
;;   B: (And (Experiencer $e0 $x0) (Member $e0 beautiful))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, part-of]  p201274 ~ p207624   cosine 0.8946 (seeds 4/5 >= 0.85)   records 9 / 3 / 2   norms 0.52 / 0.41   gate: PASS
;;   A: (Member $x0 beautiful)   e.g. tierB-000904 tierB-001920
;;   B: (Member $e0 beautiful)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201271 ~ p207600   cosine 0.8941 (seeds 5/5 >= 0.85)   records 9 / 3 / 2   norms 1.37 / 0.41   gate: PASS
;;   A: (Member $e0 open)   e.g. tierC-000285 tierC-000286
;;   B: (GroupOf $x0 law)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202883 ~ p206015   cosine 0.8936 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.89 / 0.62   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202883 ~ p206850   cosine 0.8936 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.89 / 0.62   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202883 ~ p207285   cosine 0.8936 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.89 / 0.62   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202883 ~ p207286   cosine 0.8936 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.89 / 0.62   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201488 ~ p201676   cosine 0.8926 (seeds 5/5 >= 0.85)   records 8 / 7 / 5   norms 0.79 / 0.74   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201488 ~ p201771   cosine 0.8926 (seeds 5/5 >= 0.85)   records 8 / 7 / 5   norms 0.79 / 0.74   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203765 ~ p204763   cosine 0.8924 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.65 / 0.57   gate: PASS
;;   A: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (Member $x0 picture)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204283 ~ p204554   cosine 0.8924 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 1.00 / 0.86   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204465 ~ p204554   cosine 0.8924 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 1.00 / 0.86   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204530 ~ p204554   cosine 0.8924 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 1.00 / 0.86   gate: PASS
;;   A: (And (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204550 ~ p204763   cosine 0.8924 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.65 / 0.57   gate: PASS
;;   A: (And (Of $x0 $x1) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (Member $x0 picture)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204554 ~ p204727   cosine 0.8924 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.86 / 1.00   gate: PASS
;;   A: (And (Over $e0 $x0) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202767 ~ p202782   cosine 0.8923 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.54 / 0.51   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202767 ~ p202895   cosine 0.8923 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.54 / 0.51   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202767 ~ p202896   cosine 0.8923 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.54 / 0.51   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203007 ~ p204763   cosine 0.8921 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.68 / 0.57   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-001070 tierB-001423
;;   B: (Member $x0 picture)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204525 ~ p204894   cosine 0.8921 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.57 / 0.61   gate: PASS
;;   A: (And (Member $e0 die) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204525 ~ p206039   cosine 0.8921 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.57 / 0.61   gate: PASS
;;   A: (And (Member $e0 die) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204720 ~ p204894   cosine 0.8921 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.57 / 0.61   gate: PASS
;;   A: (Member $e0 die)   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204720 ~ p206039   cosine 0.8921 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.57 / 0.61   gate: PASS
;;   A: (Member $e0 die)   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202206 ~ p207317   cosine 0.8918 (seeds 5/5 >= 0.85)   records 6 / 3 / 1   norms 0.99 / 0.44   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live))   e.g. tierB-000371
;;   B: (And (Member $x0 house) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p205995 ~ p207735   cosine 0.8918 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 1.09 / 0.41   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207153 ~ p206007   cosine 0.8912 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.57 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (CoAgent $e0 $x1))   e.g. tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Measure $e0 duration <num> year) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207153 ~ p207198   cosine 0.8912 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.57 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (CoAgent $e0 $x1))   e.g. tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Measure $e0 duration <num> year))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204516 ~ p206794   cosine 0.8908 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.86 / 0.60   gate: PASS
;;   A: (And (Member $e0 add) (Theme $e0 $x0))   e.g. tierB-000462 tierB-001132
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202872 ~ p206007   cosine 0.8902 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.67 / 0.61   gate: PASS
;;   A: (And (Measure $e0 duration <num> year) (Past $e0))   e.g. tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Measure $e0 duration <num> year) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202872 ~ p207198   cosine 0.8902 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.67 / 0.61   gate: PASS
;;   A: (And (Measure $e0 duration <num> year) (Past $e0))   e.g. tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Measure $e0 duration <num> year))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202140 ~ p203739   cosine 0.8900 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.90 / 0.92   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202140 ~ p204510   cosine 0.8900 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.90 / 0.92   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202200 ~ p204551   cosine 0.8893 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.91 / 0.76   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Probably $e0))   e.g. tierB-001891 tierB-001945
;;   B: (And (Ongoing $e0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202211 ~ p206034   cosine 0.8893 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.90 / 0.64   gate: PASS
;;   A: (And (Member $e0 find) (Past $e0))   e.g. tierC-000243 tierC-000244
;;   B: (And (Location $e0 $x0) (Member $x0 bench) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202211 ~ p207235   cosine 0.8893 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.90 / 0.64   gate: PASS
;;   A: (And (Member $e0 find) (Past $e0))   e.g. tierC-000243 tierC-000244
;;   B: (And (Location $e0 $x0) (Member $x0 bench))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202211 ~ p207669   cosine 0.8893 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.90 / 0.64   gate: PASS
;;   A: (And (Member $e0 find) (Past $e0))   e.g. tierC-000243 tierC-000244
;;   B: (Member $x0 bench)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204558 ~ p207335   cosine 0.8889 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.44 / 0.44   gate: PASS
;;   A: (And (Patient $e0 $x0) (Time $e0 now))   e.g. tierC-000241 tierC-000242
;;   B: (And (Past $e0) (Time $e0 now))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202313 ~ p207702   cosine 0.8886 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.35 / 0.55   gate: PASS
;;   A: (Time $e0 night)   e.g. tierC-000283 tierC-000284
;;   B: (Member $x0 mass)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201676 ~ p201770   cosine 0.8880 (seeds 5/5 >= 0.85)   records 7 / 7 / 5   norms 0.74 / 0.73   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201770 ~ p201771   cosine 0.8880 (seeds 5/5 >= 0.85)   records 7 / 7 / 5   norms 0.73 / 0.74   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202214 ~ p204542   cosine 0.8874 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.91 / 0.98   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202216 ~ p206844   cosine 0.8867 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.12 / 0.53   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202216 ~ p207269   cosine 0.8867 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.12 / 0.53   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202776 ~ p206846   cosine 0.8865 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.89 / 0.57   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202776 ~ p207273   cosine 0.8865 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.89 / 0.57   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202996 ~ p207255   cosine 0.8856 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.68 / 0.46   gate: PASS
;;   A: (Member $x0 fire)   e.g. tierB-001302
;;   B: (And (Member $e0 break_out) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202996 ~ p207625   cosine 0.8856 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.68 / 0.46   gate: PASS
;;   A: (Member $x0 fire)   e.g. tierB-001302
;;   B: (Member $e0 break_out)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204687 ~ p206007   cosine 0.8856 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.60 / 0.61   gate: PASS
;;   A: (CoAgent $e0 $x0)   e.g. tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Measure $e0 duration <num> year) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204687 ~ p207198   cosine 0.8856 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.60 / 0.61   gate: PASS
;;   A: (CoAgent $e0 $x0)   e.g. tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Measure $e0 duration <num> year))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202904 ~ p207702   cosine 0.8853 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.30 / 0.55   gate: PASS
;;   A: (And (Past $e0) (Time $e0 night))   e.g. tierC-000283 tierC-000284
;;   B: (Member $x0 mass)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202279 ~ p203006   cosine 0.8844 (seeds 5/5 >= 0.85)   records 6 / 5 / 2   norms 0.63 / 0.56   gate: PASS
;;   A: (Manner $e0 well)   e.g. tierC-000235 tierC-000236
;;   B: (Member $x0 work)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201489 ~ p201770   cosine 0.8843 (seeds 5/5 >= 0.85)   records 8 / 7 / 5   norms 0.80 / 0.73   gate: PASS
;;   A: (And (Member $e0 become) (Result $e0 $e1))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202207 ~ p206844   cosine 0.8831 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.74 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202207 ~ p207269   cosine 0.8831 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.74 / 0.53   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202281 ~ p206844   cosine 0.8831 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.74 / 0.53   gate: PASS
;;   A: (Member $e0 bear)   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202281 ~ p207269   cosine 0.8831 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.74 / 0.53   gate: PASS
;;   A: (Member $e0 bear)   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201530 ~ p207317   cosine 0.8821 (seeds 5/5 >= 0.85)   records 8 / 3 / 1   norms 1.21 / 0.44   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000371
;;   B: (And (Member $x0 house) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p205993 ~ p207303   cosine 0.8820 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.79 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 family) (Past $e0))   e.g. tierC-000017 tierC-000018
;;   B: (And (Member $e0 suggest) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p205993 ~ p207656   cosine 0.8820 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.79 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 family) (Past $e0))   e.g. tierC-000017 tierC-000018
;;   B: (Member $e0 suggest)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207572 ~ p207306   cosine 0.8820 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.54 / 0.50   gate: PASS
;;   A: (Agent $e0 daniel)   e.g. tierB-000078
;;   B: (And (Member $e0 talk) (To $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201485 ~ p201822   cosine 0.8819 (seeds 5/5 >= 0.85)   records 8 / 7 / 5   norms 1.09 / 0.77   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 find))   e.g. tierB-000579 tierC-000279 tierC-000280
;;   B: (And (Member $e0 find) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202214 ~ p206858   cosine 0.8815 (seeds 4/5 >= 0.85)   records 6 / 3 / 2   norms 0.91 / 0.55   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203719 ~ p207735   cosine 0.8809 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.41   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773 tierB-001870
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201344 ~ p202989   cosine 0.8806 (seeds 5/5 >= 0.85)   records 8 / 5 / 1   norms 1.24 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))   e.g. tierB-001618
;;   B: (Member $e0 travel)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204316 ~ p206852   cosine 0.8806 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.68 / 0.60   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))   e.g. tierB-000325 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203712 ~ p205988   cosine 0.8801 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.62 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202570 ~ p204525   cosine 0.8800 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 1.09 / 0.57   gate: PASS
;;   A: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202570 ~ p204720   cosine 0.8800 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 1.09 / 0.57   gate: PASS
;;   A: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (Member $e0 die)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201492 ~ p201829   cosine 0.8796 (seeds 5/5 >= 0.85)   records 8 / 7 / 4   norms 1.20 / 1.09   gate: PASS
;;   A: (And (Member $e0 take) (Theme $e0 $x0))   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p206808 ~ p206851   cosine 0.8793 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.47 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))   e.g. tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201821 ~ p206846   cosine 0.8786 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 1.08 / 0.57   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201821 ~ p207273   cosine 0.8786 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 1.08 / 0.57   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204311 ~ p204525   cosine 0.8770 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.67 / 0.57   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204519 ~ p204525   cosine 0.8770 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.67 / 0.57   gate: PASS
;;   A: (And (Member $e0 bear) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204311 ~ p204720   cosine 0.8769 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.67 / 0.57   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (Member $e0 die)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204519 ~ p204720   cosine 0.8769 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.67 / 0.57   gate: PASS
;;   A: (And (Member $e0 bear) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (Member $e0 die)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203719 ~ p205995   cosine 0.8767 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 1.09   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p205989 ~ p206033   cosine 0.8752 (seeds 4/5 >= 0.85)   records 3 / 3 / 2   norms 0.55 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 person))   e.g. tierC-000041 tierC-000042
;;   B: (And (Location $e0 $x0) (Member $e0 sleep) (Member $x0 couch))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p205989 ~ p207681   cosine 0.8752 (seeds 4/5 >= 0.85)   records 3 / 3 / 2   norms 0.55 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 person))   e.g. tierC-000041 tierC-000042
;;   B: (Member $x0 couch)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204283 ~ p204478   cosine 0.8736 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 1.00 / 0.87   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204465 ~ p204478   cosine 0.8736 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 1.00 / 0.87   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204478 ~ p204530   cosine 0.8736 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.87 / 1.00   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204478 ~ p204727   cosine 0.8736 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.87 / 1.00   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202888 ~ p204728   cosine 0.8730 (seeds 4/5 >= 0.85)   records 5 / 4 / 2   norms 0.66 / 0.50   gate: PASS
;;   A: (And (Member $e0 run) (Past $e0))   e.g. tierC-000161 tierC-000162
;;   B: (Member $e0 lose)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202769 ~ p206794   cosine 0.8726 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.57 / 0.60   gate: PASS
;;   A: (And (Goal $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000462 tierB-001860
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204461 ~ p206794   cosine 0.8723 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.75 / 0.60   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 add))   e.g. tierB-000462 tierB-001132
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p207202 ~ p207278   cosine 0.8720 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.42 / 0.42   gate: PASS
;;   A: (And (Can $e0) (Member $e0 help))   e.g. tierB-000299 tierB-001094
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207213 ~ p207311   cosine 0.8713 (seeds 3/5 >= 0.85)   records 3 / 3 / 1   norms 0.46 / 0.43   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 work))   e.g. tierB-000144
;;   B: (And (Member $e0 work) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202280 ~ p206794   cosine 0.8701 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.08 / 0.60   gate: PASS
;;   A: (Member $e0 add)   e.g. tierB-000462 tierB-001132
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201670 ~ p202010   cosine 0.8681 (seeds 4/5 >= 0.85)   records 7 / 6 / 5   norms 0.65 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 company) (Past $e0))   e.g. tierB-000762 tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Member $x0 company) (Patient $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206824 ~ p207255   cosine 0.8665 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.62 / 0.46   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1) (Patient $e1 $x0))   e.g. tierB-001302
;;   B: (And (Member $e0 break_out) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206824 ~ p207625   cosine 0.8665 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.62 / 0.46   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1) (Patient $e1 $x0))   e.g. tierB-001302
;;   B: (Member $e0 break_out)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207200 ~ p207255   cosine 0.8665 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.62 / 0.46   gate: PASS
;;   A: (And (Before $e0 $e1) (Patient $e1 $x0))   e.g. tierB-001302
;;   B: (And (Member $e0 break_out) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207200 ~ p207625   cosine 0.8665 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.62 / 0.46   gate: PASS
;;   A: (And (Before $e0 $e1) (Patient $e1 $x0))   e.g. tierB-001302
;;   B: (Member $e0 break_out)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204475 ~ p207303   cosine 0.8662 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.88 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 family))   e.g. tierC-000017 tierC-000018
;;   B: (And (Member $e0 suggest) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204475 ~ p207656   cosine 0.8662 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.88 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 family))   e.g. tierC-000017 tierC-000018
;;   B: (Member $e0 suggest)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204316 ~ p206862   cosine 0.8658 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.68 / 0.60   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))   e.g. tierB-000325 tierB-001809
;;   B: (And (Ongoing $e0) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201769 ~ p206827   cosine 0.8645 (seeds 4/5 >= 0.85)   records 7 / 3 / 2   norms 0.96 / 0.46   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201769 ~ p207221   cosine 0.8645 (seeds 4/5 >= 0.85)   records 7 / 3 / 2   norms 0.96 / 0.46   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201063 ~ p201483   cosine 0.8629 (seeds 2/5 >= 0.85)   records 10 / 8 / 3   norms 1.00 / 0.76   gate: PASS
;;   A: (And (Agent $e0 $x0) (Future $e0))   e.g. tierB-000453 tierB-001266 tierB-001626
;;   B: (And (Future $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201240 ~ p207307   cosine 0.8627 (seeds 4/5 >= 0.85)   records 9 / 3 / 1   norms 1.50 / 0.71   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202313 ~ p207279   cosine 0.8626 (seeds 2/5 >= 0.85)   records 6 / 3 / 2   norms 1.35 / 0.59   gate: PASS
;;   A: (Time $e0 night)   e.g. tierC-000283 tierC-000284
;;   B: (And (Member $e0 hold) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204787 ~ p205995   cosine 0.8626 (seeds 1/5 >= 0.85)   records 4 / 3 / 1   norms 0.72 / 1.09   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201870 ~ p207206   cosine 0.8615 (seeds 3/5 >= 0.85)   records 7 / 3 / 2   norms 0.80 / 0.55   gate: PASS
;;   A: (Measure $e0 duration <num> year)   e.g. tierC-000121 tierC-000122
;;   B: (And (CoAgent $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203008 ~ p204283   cosine 0.8615 (seeds 3/5 >= 0.85)   records 5 / 4 / 2   norms 0.95 / 1.00   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203008 ~ p204465   cosine 0.8615 (seeds 3/5 >= 0.85)   records 5 / 4 / 2   norms 0.95 / 1.00   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Member $e0 jump))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203008 ~ p204530   cosine 0.8615 (seeds 3/5 >= 0.85)   records 5 / 4 / 2   norms 0.95 / 1.00   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203008 ~ p204727   cosine 0.8615 (seeds 3/5 >= 0.85)   records 5 / 4 / 2   norms 0.95 / 1.00   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202196 ~ p207303   cosine 0.8604 (seeds 4/5 >= 0.85)   records 6 / 3 / 2   norms 1.09 / 0.69   gate: PASS
;;   A: (And (As $e0 $x0) (Past $e0))   e.g. tierC-000017 tierC-000018
;;   B: (And (Member $e0 suggest) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202196 ~ p207656   cosine 0.8604 (seeds 4/5 >= 0.85)   records 6 / 3 / 2   norms 1.09 / 0.69   gate: PASS
;;   A: (And (As $e0 $x0) (Past $e0))   e.g. tierC-000017 tierC-000018
;;   B: (Member $e0 suggest)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202904 ~ p207279   cosine 0.8597 (seeds 2/5 >= 0.85)   records 5 / 3 / 2   norms 1.30 / 0.59   gate: PASS
;;   A: (And (Past $e0) (Time $e0 night))   e.g. tierC-000283 tierC-000284
;;   B: (And (Member $e0 hold) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204476 ~ p204843   cosine 0.8589 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.06 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 father))   e.g. tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e1 $x1) (To $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204476 ~ p204845   cosine 0.8589 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.06 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 father))   e.g. tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e0 $x1) (To $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204476 ~ p206004   cosine 0.8589 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.06 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 father))   e.g. tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e1 $x1) (To $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204476 ~ p206822   cosine 0.8589 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.06 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 father))   e.g. tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e0 $x1) (To $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204787 ~ p207735   cosine 0.8578 (seeds 1/5 >= 0.85)   records 4 / 3 / 1   norms 0.72 / 0.41   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p206815 ~ p207308   cosine 0.8566 (seeds 2/5 >= 0.85)   records 3 / 3 / 1   norms 0.69 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1))   e.g. tierB-001800
;;   B: (And (Member $e0 watch) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207308 ~ p207309   cosine 0.8566 (seeds 2/5 >= 0.85)   records 3 / 3 / 1   norms 0.52 / 0.69   gate: PASS
;;   A: (And (Member $e0 watch) (Past $e0))   e.g. tierB-001800
;;   B: (And (Member $e0 watch) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202207 ~ p204525   cosine 0.8561 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.74 / 0.57   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202207 ~ p204720   cosine 0.8561 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.74 / 0.57   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierC-000199 tierC-000200
;;   B: (Member $e0 die)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202281 ~ p204525   cosine 0.8561 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.74 / 0.57   gate: PASS
;;   A: (Member $e0 bear)   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202281 ~ p204720   cosine 0.8561 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.74 / 0.57   gate: PASS
;;   A: (Member $e0 bear)   e.g. tierC-000199 tierC-000200
;;   B: (Member $e0 die)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204515 ~ p207283   cosine 0.8552 (seeds 3/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.53   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000258
;;   B: (And (Member $e0 influence) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204515 ~ p207638   cosine 0.8552 (seeds 3/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.53   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000258
;;   B: (Member $e0 influence)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204706 ~ p207283   cosine 0.8552 (seeds 3/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.53   gate: PASS
;;   A: (Manner $e0 directly)   e.g. tierC-000257 tierC-000258
;;   B: (And (Member $e0 influence) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204706 ~ p207638   cosine 0.8552 (seeds 3/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.53   gate: PASS
;;   A: (Manner $e0 directly)   e.g. tierC-000257 tierC-000258
;;   B: (Member $e0 influence)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202853 ~ p207287   cosine 0.8551 (seeds 3/5 >= 0.85)   records 5 / 3 / 1   norms 0.85 / 0.47   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 leave))   e.g. tierB-000713
;;   B: (And (Member $e0 leave) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201067 ~ p202142   cosine 0.8545 (seeds 3/5 >= 0.85)   records 10 / 6 / 5   norms 0.93 / 0.66   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202216 ~ p204525   cosine 0.8543 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 1.12 / 0.57   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202216 ~ p204720   cosine 0.8543 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 1.12 / 0.57   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200
;;   B: (Member $e0 die)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204759 ~ p204771   cosine 0.8541 (seeds 2/5 >= 0.85)   records 4 / 4 / 2   norms 0.65 / 0.71   gate: PASS
;;   A: (Member $x0 northern)   e.g. tierC-000135 tierC-000136
;;   B: (Member $x0 southern)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p207192 ~ p207708   cosine 0.8538 (seeds 2/5 >= 0.85)   records 3 / 3 / 1   norms 0.57 / 0.41   gate: PASS
;;   A: (And (Agent $e0 michael) (Past $e0))   e.g. tierB-000252
;;   B: (Member $x0 opportunity)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204771 ~ p207613   cosine 0.8535 (seeds 2/5 >= 0.85)   records 4 / 3 / 2   norms 0.71 / 1.26   gate: PASS
;;   A: (Member $x0 southern)   e.g. tierC-000135 tierC-000136
;;   B: (LocatedIn $x0 india)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p204771 ~ p204775   cosine 0.8523 (seeds 2/5 >= 0.85)   records 4 / 4 / 2   norms 0.71 / 0.65   gate: PASS
;;   A: (Member $x0 southern)   e.g. tierC-000135 tierC-000136
;;   B: (Member $x0 view)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202883 ~ p207216   cosine 0.8515 (seeds 4/5 >= 0.85)   records 5 / 3 / 2   norms 0.89 / 0.54   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $x0 door))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201830 ~ p204544   cosine 0.8506 (seeds 4/5 >= 0.85)   records 7 / 4 / 3   norms 1.10 / 0.68   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000148 tierB-000805 tierB-000929
;;   B: (And (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202342 ~ p202571   cosine 0.8502 (seeds 4/5 >= 0.85)   records 5 / 5 / 4   norms 0.65 / 0.69   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202569 ~ p202571   cosine 0.8502 (seeds 4/5 >= 0.85)   records 5 / 5 / 4   norms 0.65 / 0.69   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201064 ~ p207622   cosine 0.8501 (seeds 1/5 >= 0.85)   records 10 / 3 / 2   norms 1.86 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 company))   e.g. tierC-000197 tierC-000198
;;   B: (Member $e0 bake)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202289 ~ p202778   cosine 0.9999 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.12 / 1.08   gate: PASS
;;   A: (Member $e0 present)   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202289 ~ p202885   cosine 0.9999 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.12 / 1.08   gate: PASS
;;   A: (Member $e0 present)   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202289 ~ p202886   cosine 0.9999 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.12 / 1.08   gate: PASS
;;   A: (Member $e0 present)   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203007 ~ p203765   cosine 0.9999 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.68 / 0.65   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-000409 tierB-001070 tierB-001262
;;   B: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203007 ~ p204550   cosine 0.9999 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.68 / 0.65   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-000409 tierB-001070 tierB-001262
;;   B: (And (Of $x0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204699 ~ p207155   cosine 0.9999 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.57 / 0.55   gate: PASS
;;   A: (GroupOf $x0 scientist)   e.g. tierB-000225 tierB-001251 tierB-001984
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202208 ~ p202775   cosine 0.9997 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.02 / 0.95   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202208 ~ p202873   cosine 0.9997 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.02 / 0.95   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202282 ~ p202775   cosine 0.9997 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.02 / 0.95   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202282 ~ p202873   cosine 0.9997 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.02 / 0.95   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201266 ~ p201476   cosine 0.9995 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 1.33 / 1.26   gate: PASS
;;   A: (Again $e0)   e.g. tierB-000147 tierB-000337 tierB-000588
;;   B: (And (Again $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201272 ~ p201491   cosine 0.9995 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 1.18 / 1.16   gate: PASS
;;   A: (Member $e0 produce)   e.g. tierB-000208 tierB-001995 tierC-000009
;;   B: (And (Member $e0 produce) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202874 ~ p204282   cosine 0.9995 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.20 / 1.16   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202874 ~ p204462   cosine 0.9995 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.20 / 1.16   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202977 ~ p204282   cosine 0.9995 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.20 / 1.16   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202977 ~ p204462   cosine 0.9995 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.20 / 1.16   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202313 ~ p202904   cosine 0.9994 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.35 / 1.30   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012 tierB-000264 tierB-001894
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202293 ~ p202858   cosine 0.9993 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.08 / 1.01   gate: PASS
;;   A: (Member $e0 watch)   e.g. tierB-000258 tierB-000520 tierB-001205
;;   B: (And (Agent $e0 $x0) (Member $e0 watch))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204520 ~ p206838   cosine 0.9993 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.22 / 1.14   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204520 ~ p207257   cosine 0.9993 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.22 / 1.14   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204713 ~ p206838   cosine 0.9993 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.22 / 1.14   gate: PASS
;;   A: (Member $e0 buy)   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204713 ~ p207257   cosine 0.9993 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.22 / 1.14   gate: PASS
;;   A: (Member $e0 buy)   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201495 ~ p201774   cosine 0.9992 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.00 / 0.96   gate: PASS
;;   A: (And (Member $e0 write) (Patient $e0 $x0))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Member $e0 write) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201495 ~ p201831   cosine 0.9992 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.00 / 0.96   gate: PASS
;;   A: (And (Member $e0 write) (Patient $e0 $x0))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Member $e0 write) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204522 ~ p206840   cosine 0.9991 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.76 / 0.68   gate: PASS
;;   A: (And (Member $e0 change) (Past $e0))   e.g. tierB-000139 tierB-001803 tierC-000011
;;   B: (And (Member $e0 change) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204729 ~ p207166   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.57 / 0.56   gate: PASS
;;   A: (Member $e0 move)   e.g. tierB-000782 tierC-000197 tierC-000198
;;   B: (And (Agent $e0 $x0) (Member $e0 move))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200321 ~ p200337   cosine 0.9989 (seeds 5/5 >= 0.85)   records 27 / 26 / 26   norms 1.06 / 1.03   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200321 ~ p200339   cosine 0.9989 (seeds 5/5 >= 0.85)   records 27 / 26 / 26   norms 1.06 / 1.03   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200327 ~ p200337   cosine 0.9989 (seeds 5/5 >= 0.85)   records 27 / 26 / 26   norms 1.06 / 1.03   gate: PASS
;;   A: (Holder $e0 $x0)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200327 ~ p200339   cosine 0.9989 (seeds 5/5 >= 0.85)   records 27 / 26 / 26   norms 1.06 / 1.03   gate: PASS
;;   A: (Holder $e0 $x0)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201491 ~ p201773   cosine 0.9987 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.16 / 1.12   gate: PASS
;;   A: (And (Member $e0 produce) (Patient $e0 $x0))   e.g. tierB-000208 tierC-000009 tierC-000010
;;   B: (And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201491 ~ p201828   cosine 0.9987 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.16 / 1.12   gate: PASS
;;   A: (And (Member $e0 produce) (Patient $e0 $x0))   e.g. tierB-000208 tierC-000009 tierC-000010
;;   B: (And (Member $e0 produce) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202855 ~ p204286   cosine 0.9987 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.01 / 0.95   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 sing))   e.g. tierB-001156 tierB-001901 tierC-000127
;;   B: (And (Agent $e0 $x0) (Member $e0 sing) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201529 ~ p202209   cosine 0.9984 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 1.24 / 1.12   gate: PASS
;;   A: (Member $e0 change)   e.g. tierB-000139 tierB-000517 tierB-001491
;;   B: (And (Member $e0 change) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201872 ~ p202890   cosine 0.9984 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.10 / 1.02   gate: PASS
;;   A: (Member $e0 sing)   e.g. tierB-000827 tierB-001156 tierB-001901
;;   B: (And (Member $e0 sing) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202305 ~ p202901   cosine 0.9984 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.79 / 0.76   gate: PASS
;;   A: (Member $x0 sound)   e.g. tierB-000805 tierB-000951 tierB-001384
;;   B: (And (Member $x0 sound) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204734 ~ p206653   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.64   gate: PASS
;;   A: (Member $e0 spend)   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204734 ~ p206810   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.64   gate: PASS
;;   A: (Member $e0 spend)   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204734 ~ p206811   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.64   gate: PASS
;;   A: (Member $e0 spend)   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204734 ~ p206853   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.64   gate: PASS
;;   A: (Member $e0 spend)   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204734 ~ p207170   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.64   gate: PASS
;;   A: (Member $e0 spend)   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204734 ~ p207296   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.64   gate: PASS
;;   A: (Member $e0 spend)   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204734 ~ p207297   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.64   gate: PASS
;;   A: (Member $e0 spend)   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201068 ~ p201104   cosine 0.9981 (seeds 5/5 >= 0.85)   records 10 / 9 / 9   norms 0.84 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201068 ~ p201168   cosine 0.9981 (seeds 5/5 >= 0.85)   records 10 / 9 / 9   norms 0.84 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201068 ~ p201222   cosine 0.9981 (seeds 5/5 >= 0.85)   records 10 / 9 / 9   norms 0.84 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201068 ~ p201245   cosine 0.9981 (seeds 5/5 >= 0.85)   records 10 / 9 / 9   norms 0.84 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201272 ~ p201773   cosine 0.9981 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.18 / 1.12   gate: PASS
;;   A: (Member $e0 produce)   e.g. tierB-000208 tierC-000009 tierC-000010
;;   B: (And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201272 ~ p201828   cosine 0.9981 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.18 / 1.12   gate: PASS
;;   A: (Member $e0 produce)   e.g. tierB-000208 tierC-000009 tierC-000010
;;   B: (And (Member $e0 produce) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202292 ~ p204537   cosine 0.9981 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.95 / 0.73   gate: PASS
;;   A: (Member $e0 speak)   e.g. tierB-001068 tierC-000023 tierC-000024
;;   B: (And (Member $e0 speak) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202905 ~ p204556   cosine 0.9978 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.32 / 1.23   gate: PASS
;;   A: (And (Past $e0) (TimeAtMost $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (And (Past $e0) (TimeAtLeast $e0 (Year <num>)))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202905 ~ p204788   cosine 0.9978 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.32 / 1.23   gate: PASS
;;   A: (And (Past $e0) (TimeAtMost $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (TimeAtLeast $e0 (Year <num>))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203013 ~ p204556   cosine 0.9978 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.32 / 1.23   gate: PASS
;;   A: (TimeAtMost $e0 (Year <num>))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (And (Past $e0) (TimeAtLeast $e0 (Year <num>)))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p203013 ~ p204788   cosine 0.9978 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.32 / 1.23   gate: PASS
;;   A: (TimeAtMost $e0 (Year <num>))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (TimeAtLeast $e0 (Year <num>))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202203 ~ p202768   cosine 0.9976 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.86 / 0.78   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 go))   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201874 ~ p204545   cosine 0.9972 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.44 / 1.23   gate: PASS
;;   A: (Member $e0 want)   e.g. tierB-000846 tierB-001988 tierC-000311
;;   B: (And (Member $e0 want) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204538 ~ p204902   cosine 0.9972 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.84 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204538 ~ p206042   cosine 0.9972 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.84 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204538 ~ p206856   cosine 0.9972 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.84 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204538 ~ p207301   cosine 0.9972 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.84 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200846 ~ p200926   cosine 0.9971 (seeds 5/5 >= 0.85)   records 12 / 11 / 11   norms 1.28 / 1.23   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000162 tierB-000665 tierB-000730
;;   B: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204492 ~ p206826   cosine 0.9969 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.79 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 need))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200292 ~ p200323   cosine 0.9968 (seeds 5/5 >= 0.85)   records 28 / 27 / 27   norms 1.26 / 1.25   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))   e.g. tierB-000004 tierB-000362 tierB-000370
;;   B: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200517 ~ p200578   cosine 0.9965 (seeds 5/5 >= 0.85)   records 17 / 16 / 16   norms 1.06 / 1.00   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))   e.g. tierB-000362 tierB-000392 tierB-000425
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201530 ~ p202206   cosine 0.9963 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 1.21 / 0.99   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202899 ~ p203721   cosine 0.9963 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.01 / 0.87   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202285 ~ p202876   cosine 0.9962 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.64 / 0.62   gate: PASS
;;   A: (Member $e0 direct)   e.g. tierC-000010 tierC-000091 tierC-000138
;;   B: (And (Member $e0 direct) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202882 ~ p204315   cosine 0.9961 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.70 / 0.67   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204687 ~ p207153   cosine 0.9961 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.60 / 0.57   gate: PASS
;;   A: (CoAgent $e0 $x0)   e.g. tierB-000160 tierC-000121 tierC-000122
;;   B: (And (Agent $e0 $x0) (CoAgent $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200178 ~ p200196   cosine 0.9960 (seeds 5/5 >= 0.85)   records 43 / 40 / 40   norms 1.43 / 1.34   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000066 tierB-000142 tierB-000162
;;   B: (And (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201480 ~ p201671   cosine 0.9959 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.50 / 1.47   gate: PASS
;;   A: (And (Agent $e0 $x0) (Possession $x0 $x1))   e.g. tierC-000017 tierC-000018 tierC-000123
;;   B: (And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203001 ~ p207736   cosine 0.9959 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.93 / 1.74   gate: PASS
;;   A: (Member $x0 line)   e.g. tierB-000172 tierC-000083 tierC-000084
;;   B: (Ordinal $x0 <num> line)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203766 ~ p204902   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203766 ~ p206042   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203766 ~ p206856   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203766 ~ p207301   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204555 ~ p204902   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204555 ~ p206042   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204555 ~ p206856   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204555 ~ p207301   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202278 ~ p204459   cosine 0.9956 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.50 / 0.46   gate: PASS
;;   A: (GroupOf $x0 student)   e.g. tierB-000387 tierB-000656 tierB-000712
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 student))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202288 ~ p204467   cosine 0.9954 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.88 / 0.80   gate: PASS
;;   A: (Member $e0 lead)   e.g. tierB-001086 tierB-001782 tierC-000019
;;   B: (And (Agent $e0 $x0) (Member $e0 lead))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204521 ~ p206839   cosine 0.9953 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.71   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204521 ~ p207258   cosine 0.9953 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.71   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202191 ~ p202760   cosine 0.9951 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.93 / 0.87   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202192 ~ p202761   cosine 0.9951 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.05 / 0.94   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow))   e.g. tierB-000584 tierC-000095 tierC-000096
;;   B: (And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202192 ~ p202879   cosine 0.9951 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.05 / 0.94   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow))   e.g. tierB-000584 tierC-000095 tierC-000096
;;   B: (And (Member $e0 follow) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201873 ~ p202214   cosine 0.9949 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 1.01 / 0.91   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200859 ~ p201068   cosine 0.9946 (seeds 5/5 >= 0.85)   records 12 / 10 / 10   norms 0.87 / 0.84   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000182
;;   B: (And (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203757 ~ p204839   cosine 0.9946 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.73   gate: PASS
;;   A: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201089 ~ p201495   cosine 0.9942 (seeds 5/5 >= 0.85)   records 10 / 8 / 8   norms 1.07 / 1.00   gate: PASS
;;   A: (Member $e0 write)   e.g. tierB-001601 tierB-001962 tierC-000089
;;   B: (And (Member $e0 write) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204298 ~ p206658   cosine 0.9940 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201270 ~ p202884   cosine 0.9935 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.14 / 0.92   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000107 tierB-000114 tierB-000339
;;   B: (And (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204745 ~ p207177   cosine 0.9934 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.43 / 0.41   gate: PASS
;;   A: (Member $x0 doctor)   e.g. tierB-000049 tierB-000339 tierB-000793
;;   B: (And (Agent $e0 $x0) (Member $x0 doctor))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204476 ~ p205994   cosine 0.9931 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.06 / 0.71   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 father))   e.g. tierB-001743 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Member $x0 father) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201089 ~ p201774   cosine 0.9930 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 1.07 / 0.96   gate: PASS
;;   A: (Member $e0 write)   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Member $e0 write) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201089 ~ p201831   cosine 0.9930 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 1.07 / 0.96   gate: PASS
;;   A: (Member $e0 write)   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Member $e0 write) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202988 ~ p204289   cosine 0.9930 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.84 / 0.79   gate: PASS
;;   A: (Member $e0 swim)   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202988 ~ p204471   cosine 0.9930 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.84 / 0.79   gate: PASS
;;   A: (Member $e0 swim)   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Agent $e0 $x0) (Member $e0 swim))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202988 ~ p204540   cosine 0.9930 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.84 / 0.79   gate: PASS
;;   A: (Member $e0 swim)   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202894 ~ p204320   cosine 0.9928 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.79 / 0.68   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0))   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204311 ~ p204894   cosine 0.9928 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.61   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204311 ~ p206039   cosine 0.9928 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.61   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204519 ~ p204894   cosine 0.9928 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.61   gate: PASS
;;   A: (And (Member $e0 bear) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204519 ~ p206039   cosine 0.9928 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.61   gate: PASS
;;   A: (And (Member $e0 bear) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201534 ~ p201830   cosine 0.9926 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.20 / 1.10   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000148 tierB-000324 tierB-000805
;;   B: (And (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202987 ~ p204538   cosine 0.9924 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.87 / 0.84   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-000125 tierB-001515
;;   B: (And (Member $e0 stop) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204542 ~ p206017   cosine 0.9923 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.98 / 0.90   gate: PASS
;;   A: (And (Member $e0 turn) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204542 ~ p206859   cosine 0.9923 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.98 / 0.90   gate: PASS
;;   A: (And (Member $e0 turn) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201489 ~ p201676   cosine 0.9920 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.80 / 0.74   gate: PASS
;;   A: (And (Member $e0 become) (Result $e0 $e1))   e.g. tierB-001582 tierB-001817 tierC-000001
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201489 ~ p201771   cosine 0.9920 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.80 / 0.74   gate: PASS
;;   A: (And (Member $e0 become) (Result $e0 $e1))   e.g. tierB-001582 tierB-001817 tierC-000001
;;   B: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201267 ~ p201821   cosine 0.9919 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.25 / 1.08   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000194 tierB-000609 tierB-000779
;;   B: (And (Member $e0 fall) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202210 ~ p202776   cosine 0.9918 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.00 / 0.89   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201488 ~ p201770   cosine 0.9915 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.79 / 0.73   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0))   e.g. tierB-000352 tierB-001582 tierC-000001
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203006 ~ p207327   cosine 0.9915 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.56 / 1.02   gate: PASS
;;   A: (Member $x0 work)   e.g. tierB-001980 tierC-000235 tierC-000236
;;   B: (And (Member $x0 work) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202276 ~ p204487   cosine 0.9910 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.91 / 0.77   gate: PASS
;;   A: (During $e0 $e1)   e.g. tierB-000867 tierB-001782 tierB-001809
;;   B: (And (During $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202862 ~ p204292   cosine 0.9909 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.12 / 0.95   gate: PASS
;;   A: (And (Already $e0) (Patient $e0 $x0))   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202862 ~ p204480   cosine 0.9909 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.12 / 0.95   gate: PASS
;;   A: (And (Already $e0) (Patient $e0 $x0))   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204473 ~ p204836   cosine 0.9907 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.63 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204473 ~ p204837   cosine 0.9907 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.63 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204473 ~ p205991   cosine 0.9907 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.63 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204473 ~ p206654   cosine 0.9907 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.63 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204473 ~ p206817   cosine 0.9907 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.63 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204473 ~ p206818   cosine 0.9907 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.63 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204488 ~ p206011   cosine 0.9905 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.77 / 0.68   gate: PASS
;;   A: (And (During $e0 $e1) (Past $e1))   e.g. tierB-001782 tierB-001809 tierC-000231
;;   B: (And (During $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200859 ~ p201104   cosine 0.9903 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.87 / 0.80   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200859 ~ p201168   cosine 0.9903 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.87 / 0.80   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200859 ~ p201222   cosine 0.9903 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.87 / 0.80   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200859 ~ p201245   cosine 0.9903 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.87 / 0.80   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202205 ~ p206825   cosine 0.9899 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.13 / 0.70   gate: PASS
;;   A: (And (In $e0 $x0) (Past $e0))   e.g. tierB-000411 tierB-001667 tierC-000014
;;   B: (And (Experiencer $e0 $x0) (In $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202205 ~ p207209   cosine 0.9899 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.13 / 0.70   gate: PASS
;;   A: (And (In $e0 $x0) (Past $e0))   e.g. tierB-000411 tierB-001667 tierC-000014
;;   B: (And (Experiencer $e0 $x0) (In $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201872 ~ p202855   cosine 0.9898 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.10 / 1.01   gate: PASS
;;   A: (Member $e0 sing)   e.g. tierB-001156 tierB-001901 tierC-000127
;;   B: (And (Agent $e0 $x0) (Member $e0 sing))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201834 ~ p202764   cosine 0.9897 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.22 / 1.02   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201834 ~ p202861   cosine 0.9897 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.22 / 1.02   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201881 ~ p202764   cosine 0.9897 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.22 / 1.02   gate: PASS
;;   A: (Through $e0 $x0)   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201881 ~ p202861   cosine 0.9897 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.22 / 1.02   gate: PASS
;;   A: (Through $e0 $x0)   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201827 ~ p204317   cosine 0.9896 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.30 / 0.83   gate: PASS
;;   A: (And (Member $e0 open) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487 tierC-000285
;;   B: (And (Member $e0 open) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201827 ~ p204531   cosine 0.9896 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.30 / 0.83   gate: PASS
;;   A: (And (Member $e0 open) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487 tierC-000285
;;   B: (And (Member $e0 open) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202890 ~ p204286   cosine 0.9890 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.02 / 0.95   gate: PASS
;;   A: (And (Member $e0 sing) (Past $e0))   e.g. tierB-001156 tierB-001901 tierC-000127
;;   B: (And (Agent $e0 $x0) (Member $e0 sing) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204321 ~ p206655   cosine 0.9890 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.65 / 0.56   gate: PASS
;;   A: (And (Ongoing $e0) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001068 tierB-001120 tierB-001961
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202211 ~ p204306   cosine 0.9889 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.90 / 0.76   gate: PASS
;;   A: (And (Member $e0 find) (Past $e0))   e.g. tierB-000579 tierB-000706 tierC-000243
;;   B: (And (Location $e0 $x0) (Member $e0 find) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201268 ~ p201490   cosine 0.9886 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 1.19 / 1.11   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000176 tierB-000189 tierB-000421
;;   B: (And (Member $e0 hear) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200861 ~ p201492   cosine 0.9885 (seeds 5/5 >= 0.85)   records 12 / 8 / 8   norms 1.54 / 1.20   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000252 tierB-000942 tierB-000978
;;   B: (And (Member $e0 take) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202857 ~ p204290   cosine 0.9885 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.77 / 0.71   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 take))   e.g. tierB-000942 tierB-000978 tierC-000071
;;   B: (And (Agent $e0 $x0) (Member $e0 take) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202908 ~ p203770   cosine 0.9884 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.69 / 0.68   gate: PASS
;;   A: (And (Theme $e0 $x0) (To $e1 $e0))   e.g. tierB-000147 tierB-000258 tierC-000123
;;   B: (And (Past $e0) (Theme $e1 $x0) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204458 ~ p205986   cosine 0.9884 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 boy))   e.g. tierB-001457 tierB-001530 tierB-001840
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200957 ~ p201066   cosine 0.9883 (seeds 5/5 >= 0.85)   records 11 / 10 / 10   norms 1.28 / 1.22   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-000128
;;   B: (And (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202142 ~ p202339   cosine 0.9881 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.66 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0) (Result $e0 $e1))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202142 ~ p202726   cosine 0.9881 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.66 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0) (Result $e0 $e1))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202987 ~ p204902   cosine 0.9879 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.87 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202987 ~ p206042   cosine 0.9879 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.87 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202987 ~ p206856   cosine 0.9879 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.87 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202987 ~ p207301   cosine 0.9879 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.87 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201821 ~ p202776   cosine 0.9876 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.08 / 0.89   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201267 ~ p202210   cosine 0.9875 (seeds 5/5 >= 0.85)   records 9 / 6 / 6   norms 1.25 / 1.00   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000609 tierB-000779
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201882 ~ p202867   cosine 0.9874 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.89 / 1.51   gate: PASS
;;   A: (Time $e0 today)   e.g. tierB-000495 tierB-000631 tierB-000808
;;   B: (And (Experiencer $e0 $x0) (Time $e0 today))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p203087   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p203088   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202782 ~ p203113   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p203730   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p203751   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p203754   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202782 ~ p204223   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p204299   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p204300   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p204497   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p204546   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202782 ~ p204746   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202895 ~ p203087   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202895 ~ p203088   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202895 ~ p203113   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202895 ~ p203730   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202895 ~ p203751   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202895 ~ p203754   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202895 ~ p204223   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202895 ~ p204299   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202895 ~ p204300   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202895 ~ p204497   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202895 ~ p204546   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202895 ~ p204746   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202896 ~ p203087   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202896 ~ p203088   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202896 ~ p203113   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202896 ~ p203730   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202896 ~ p203751   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202896 ~ p203754   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202896 ~ p204223   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202896 ~ p204299   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202896 ~ p204300   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202896 ~ p204497   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202896 ~ p204546   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202896 ~ p204746   cosine 0.9870 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201247 ~ p201772   cosine 0.9869 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.07 / 0.96   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201247 ~ p201824   cosine 0.9869 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.07 / 0.96   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201269 ~ p201772   cosine 0.9869 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.07 / 0.96   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201269 ~ p201824   cosine 0.9869 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.07 / 0.96   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204516 ~ p206837   cosine 0.9868 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.68   gate: PASS
;;   A: (And (Member $e0 add) (Theme $e0 $x0))   e.g. tierB-000462 tierC-000231 tierC-000232
;;   B: (And (Member $e0 add) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204516 ~ p207250   cosine 0.9868 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.68   gate: PASS
;;   A: (And (Member $e0 add) (Theme $e0 $x0))   e.g. tierB-000462 tierC-000231 tierC-000232
;;   B: (And (Member $e0 add) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200957 ~ p201487   cosine 0.9866 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 1.28 / 1.02   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201087 ~ p202192   cosine 0.9866 (seeds 5/5 >= 0.85)   records 10 / 6 / 6   norms 1.27 / 1.05   gate: PASS
;;   A: (Member $e0 follow)   e.g. tierB-000231 tierB-000584 tierC-000095
;;   B: (And (Agent $e0 $x0) (Member $e0 follow))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201497 ~ p202143   cosine 0.9866 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 1.11 / 0.97   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201271 ~ p201827   cosine 0.9863 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.37 / 1.30   gate: PASS
;;   A: (Member $e0 open)   e.g. tierB-000056 tierB-000302 tierB-001487
;;   B: (And (Member $e0 open) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202206 ~ p206032   cosine 0.9860 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.99 / 0.71   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live))   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202206 ~ p207237   cosine 0.9860 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.99 / 0.71   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live))   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201872 ~ p204286   cosine 0.9859 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.10 / 0.95   gate: PASS
;;   A: (Member $e0 sing)   e.g. tierB-001156 tierB-001901 tierC-000127
;;   B: (And (Agent $e0 $x0) (Member $e0 sing) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202216 ~ p202570   cosine 0.9859 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.12 / 1.09   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000353
;;   B: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202773 ~ p203096   cosine 0.9859 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.92 / 0.86   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 find) (Theme $e0 $x1))   e.g. tierC-000279 tierC-000280 tierC-000313
;;   B: (And (Location $e0 $x0) (Member $e0 find) (Member $x1 thing) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202773 ~ p203740   cosine 0.9859 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.92 / 0.86   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 find) (Theme $e0 $x1))   e.g. tierC-000279 tierC-000280 tierC-000313
;;   B: (And (Location $e0 $x0) (Member $x1 thing) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202982 ~ p207229   cosine 0.9858 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.51 / 0.41   gate: PASS
;;   A: (Member $e0 look)   e.g. tierB-000230 tierB-000831 tierB-001135
;;   B: (And (Like $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201484 ~ p202014   cosine 0.9855 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 1.00 / 0.86   gate: PASS
;;   A: (And (GroupOf $x0 person) (Patient $e0 $x0))   e.g. tierB-000196 tierB-000412 tierB-000771
;;   B: (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201240 ~ p201344   cosine 0.9853 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 1.50 / 1.24   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierB-000248 tierB-000258 tierB-000548
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201066 ~ p201769   cosine 0.9847 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 1.22 / 0.96   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202877 ~ p206805   cosine 0.9847 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.61 / 0.49   gate: PASS
;;   A: (And (Member $e0 draw) (Past $e0))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (And (Agent $e0 $x0) (Member $e0 draw) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202877 ~ p207164   cosine 0.9847 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.61 / 0.49   gate: PASS
;;   A: (And (Member $e0 draw) (Past $e0))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (And (Agent $e0 $x0) (Member $e0 draw))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202979 ~ p206805   cosine 0.9847 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.61 / 0.49   gate: PASS
;;   A: (Member $e0 draw)   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (And (Agent $e0 $x0) (Member $e0 draw) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202979 ~ p207164   cosine 0.9847 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.61 / 0.49   gate: PASS
;;   A: (Member $e0 draw)   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (And (Agent $e0 $x0) (Member $e0 draw))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202999 ~ p204477   cosine 0.9847 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.56 / 0.52   gate: PASS
;;   A: (Member $x0 government)   e.g. tierB-001800 tierB-001885 tierC-000217
;;   B: (And (Agent $e0 $x0) (Member $x0 government))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201823 ~ p202143   cosine 0.9846 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 1.04 / 0.97   gate: PASS
;;   A: (And (Member $e0 hear) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201479 ~ p201768   cosine 0.9843 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.92 / 0.88   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make))   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203008 ~ p204478   cosine 0.9843 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.95 / 0.87   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889 tierB-001205
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201876 ~ p202897   cosine 0.9842 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.72 / 0.66   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierB-001910
;;   B: (And (Member $x0 bad) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202276 ~ p204488   cosine 0.9842 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.91 / 0.77   gate: PASS
;;   A: (During $e0 $e1)   e.g. tierB-000502 tierB-001782 tierB-001809
;;   B: (And (During $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204763 ~ p206046   cosine 0.9842 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.57 / 0.54   gate: PASS
;;   A: (Member $x0 picture)   e.g. tierB-000876 tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204763 ~ p207321   cosine 0.9842 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.57 / 0.54   gate: PASS
;;   A: (Member $x0 picture)   e.g. tierB-000876 tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204467 ~ p206807   cosine 0.9841 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.80 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 lead))   e.g. tierB-001086 tierB-001782 tierC-000019
;;   B: (And (Agent $e0 $x0) (Member $e0 lead) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p204467 ~ p207284   cosine 0.9841 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.80 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 lead))   e.g. tierB-001086 tierB-001782 tierC-000019
;;   B: (And (Member $e0 lead) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201527 ~ p201816   cosine 0.9840 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.71 / 0.68   gate: PASS
;;   A: (For $e0 $e1)   e.g. tierB-000002 tierB-000239 tierB-000962
;;   B: (And (For $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201829 ~ p204319   cosine 0.9839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.09 / 0.81   gate: PASS
;;   A: (And (Member $e0 take) (Past $e0))   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201087 ~ p202761   cosine 0.9836 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.27 / 0.94   gate: PASS
;;   A: (Member $e0 follow)   e.g. tierB-000584 tierC-000095 tierC-000096
;;   B: (And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201087 ~ p202879   cosine 0.9836 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.27 / 0.94   gate: PASS
;;   A: (Member $e0 follow)   e.g. tierB-000584 tierC-000095 tierC-000096
;;   B: (And (Member $e0 follow) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202989 ~ p207307   cosine 0.9835 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.77 / 0.71   gate: PASS
;;   A: (Member $e0 travel)   e.g. tierB-000667 tierB-000995 tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202878 ~ p206806   cosine 0.9834 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.75 / 0.62   gate: PASS
;;   A: (And (Member $e0 follow) (Past $e0))   e.g. tierB-000231 tierC-000095 tierC-000096
;;   B: (And (Agent $e0 $x0) (Member $e0 follow) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202976 ~ p204517   cosine 0.9833 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.38 / 1.32   gate: PASS
;;   A: (Member $e0 appear)   e.g. tierC-000050 tierC-000128 tierC-000259
;;   B: (And (Member $e0 appear) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204487 ~ p206011   cosine 0.9833 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.77 / 0.68   gate: PASS
;;   A: (And (During $e0 $e1) (Past $e0))   e.g. tierB-001782 tierB-001809 tierC-000231
;;   B: (And (During $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202283 ~ p204521   cosine 0.9829 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.03 / 0.86   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202864 ~ p204296   cosine 0.9828 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.93 / 0.82   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep))   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202194 ~ p205995   cosine 0.9827 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.59 / 1.09   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773 tierB-001801 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202854 ~ p206809   cosine 0.9827 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.89 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202854 ~ p207289   cosine 0.9827 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.89 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200858 ~ p201067   cosine 0.9823 (seeds 5/5 >= 0.85)   records 12 / 10 / 10   norms 1.03 / 0.93   gate: PASS
;;   A: (Member $e0 become)   e.g. tierB-000352 tierB-000740 tierB-001582
;;   B: (And (Member $e0 become) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201867 ~ p202196   cosine 0.9823 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 1.15 / 1.09   gate: PASS
;;   A: (As $e0 $x0)   e.g. tierB-000252 tierB-001989 tierC-000017
;;   B: (And (As $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201088 ~ p202853   cosine 0.9820 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.47 / 0.85   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000100 tierB-000298 tierB-000713
;;   B: (And (Agent $e0 $x0) (Member $e0 leave))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204525 ~ p206844   cosine 0.9820 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.57 / 0.53   gate: PASS
;;   A: (And (Member $e0 die) (Patient $e0 $x0))   e.g. tierB-000838 tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204525 ~ p207269   cosine 0.9820 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.57 / 0.53   gate: PASS
;;   A: (And (Member $e0 die) (Patient $e0 $x0))   e.g. tierB-000838 tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204720 ~ p206844   cosine 0.9820 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.57 / 0.53   gate: PASS
;;   A: (Member $e0 die)   e.g. tierB-000838 tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204720 ~ p207269   cosine 0.9820 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.57 / 0.53   gate: PASS
;;   A: (Member $e0 die)   e.g. tierB-000838 tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200958 ~ p202856   cosine 0.9815 (seeds 5/5 >= 0.85)   records 11 / 5 / 5   norms 1.77 / 1.19   gate: PASS
;;   A: (Member $e0 study)   e.g. tierB-000225 tierB-000710 tierB-001984
;;   B: (And (Agent $e0 $x0) (Member $e0 study))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201270 ~ p204492   cosine 0.9815 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 1.14 / 0.79   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000174 tierB-000339 tierB-000455
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200433 ~ p201250   cosine 0.9812 (seeds 5/5 >= 0.85)   records 20 / 9 / 9   norms 2.27 / 1.42   gate: PASS
;;   A: (Member $e0 use)   e.g. tierB-000089 tierB-000866 tierB-000938
;;   B: (And (Member $e0 use) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201487 ~ p201769   cosine 0.9812 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.02 / 0.96   gate: PASS
;;   A: (And (Manner $e0 quickly) (Patient $e0 $x0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202207 ~ p204311   cosine 0.9808 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.74 / 0.67   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierB-001568 tierC-000199 tierC-000200
;;   B: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202207 ~ p204519   cosine 0.9808 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.74 / 0.67   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierB-001568 tierC-000199 tierC-000200
;;   B: (And (Member $e0 bear) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202281 ~ p204311   cosine 0.9808 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.74 / 0.67   gate: PASS
;;   A: (Member $e0 bear)   e.g. tierB-001568 tierC-000199 tierC-000200
;;   B: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202281 ~ p204519   cosine 0.9808 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.74 / 0.67   gate: PASS
;;   A: (Member $e0 bear)   e.g. tierB-001568 tierC-000199 tierC-000200
;;   B: (And (Member $e0 bear) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202294 ~ p202560   cosine 0.9808 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.04 / 0.94   gate: PASS
;;   A: (Member $x0 boy)   e.g. tierB-000305 tierB-000337 tierB-000340
;;   B: (And (Agent $e0 $x0) (Member $x0 boy) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202294 ~ p202859   cosine 0.9808 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.04 / 0.94   gate: PASS
;;   A: (Member $x0 boy)   e.g. tierB-000305 tierB-000337 tierB-000340
;;   B: (And (Agent $e0 $x0) (Member $x0 boy))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202773 ~ p203749   cosine 0.9807 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.92 / 0.63   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 find) (Theme $e0 $x1))   e.g. tierC-000279 tierC-000280 tierC-000313
;;   B: (And (Member $e0 find) (Member $x0 thing) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202980 ~ p206845   cosine 0.9805 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.90 / 0.73   gate: PASS
;;   A: (Member $e0 eat)   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202980 ~ p207270   cosine 0.9805 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.90 / 0.73   gate: PASS
;;   A: (Member $e0 eat)   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202980 ~ p207271   cosine 0.9805 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.90 / 0.73   gate: PASS
;;   A: (Member $e0 eat)   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204554 ~ p206819   cosine 0.9805 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.77   gate: PASS
;;   A: (And (Over $e0 $x0) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201530 ~ p206032   cosine 0.9803 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.21 / 0.71   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201530 ~ p207237   cosine 0.9803 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.21 / 0.71   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202884 ~ p206826   cosine 0.9803 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.92 / 0.71   gate: PASS
;;   A: (And (Member $e0 need) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201820 ~ p202760   cosine 0.9798 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.02 / 0.87   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202899 ~ p203757   cosine 0.9798 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.01 / 0.86   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001168 tierB-001251 tierB-001693
;;   B: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202336 ~ p203063   cosine 0.9791 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.56 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000045 tierC-000046 tierC-000291
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202336 ~ p203064   cosine 0.9791 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.56 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000045 tierC-000046 tierC-000291
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202336 ~ p203716   cosine 0.9791 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.56 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000045 tierC-000046 tierC-000291
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202976 ~ p204482   cosine 0.9786 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.38 / 1.04   gate: PASS
;;   A: (Member $e0 appear)   e.g. tierC-000050 tierC-000128 tierC-000259
;;   B: (And (Also appear $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202976 ~ p204685   cosine 0.9786 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.38 / 1.04   gate: PASS
;;   A: (Member $e0 appear)   e.g. tierC-000050 tierC-000128 tierC-000259
;;   B: (Also appear $e0)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200663 ~ p201070   cosine 0.9784 (seeds 5/5 >= 0.85)   records 14 / 10 / 10   norms 1.49 / 1.29   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201868 ~ p203724   cosine 0.9784 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.91 / 0.82   gate: PASS
;;   A: (But $e0 $e1)   e.g. tierC-000161 tierC-000162 tierC-000243
;;   B: (And (But $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201868 ~ p204483   cosine 0.9784 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.91 / 0.82   gate: PASS
;;   A: (But $e0 $e1)   e.g. tierC-000161 tierC-000162 tierC-000243
;;   B: (And (But $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201868 ~ p204484   cosine 0.9784 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.91 / 0.82   gate: PASS
;;   A: (But $e0 $e1)   e.g. tierC-000161 tierC-000162 tierC-000243
;;   B: (And (But $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203047 ~ p204824   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203047 ~ p204875   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203047 ~ p206028   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203048 ~ p204824   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p203048 ~ p204875   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203048 ~ p206028   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203070 ~ p204824   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203070 ~ p204875   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203070 ~ p206028   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203713 ~ p204824   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203713 ~ p204875   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p203713 ~ p206028   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203736 ~ p204824   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203736 ~ p204875   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203736 ~ p206028   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204502 ~ p204824   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (GroupOf $x0 view) (Theme $e0 $x0))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204502 ~ p204875   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (GroupOf $x0 view) (Theme $e0 $x0))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204502 ~ p206028   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (And (GroupOf $x0 view) (Theme $e0 $x0))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204701 ~ p204824   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (GroupOf $x0 view)   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204701 ~ p204875   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (GroupOf $x0 view)   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204701 ~ p206028   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.53 / 0.49   gate: PASS
;;   A: (GroupOf $x0 view)   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202204 ~ p202769   cosine 0.9779 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.74 / 0.57   gate: PASS
;;   A: (And (Goal $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000462 tierB-000834 tierB-001023
;;   B: (And (Goal $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200959 ~ p201494   cosine 0.9778 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 1.26 / 0.98   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200844 ~ p200900   cosine 0.9775 (seeds 5/5 >= 0.85)   records 12 / 11 / 11   norms 1.14 / 1.09   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200844 ~ p200935   cosine 0.9775 (seeds 5/5 >= 0.85)   records 12 / 11 / 11   norms 1.14 / 1.09   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204509 ~ p206831   cosine 0.9775 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.71 / 0.61   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000148 tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202288 ~ p206807   cosine 0.9772 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.88 / 0.68   gate: PASS
;;   A: (Member $e0 lead)   e.g. tierB-001086 tierB-001782 tierC-000019
;;   B: (And (Agent $e0 $x0) (Member $e0 lead) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202288 ~ p207284   cosine 0.9772 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.88 / 0.68   gate: PASS
;;   A: (Member $e0 lead)   e.g. tierB-001086 tierB-001782 tierC-000019
;;   B: (And (Member $e0 lead) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201267 ~ p202776   cosine 0.9768 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.25 / 0.89   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203008 ~ p204554   cosine 0.9764 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.95 / 0.86   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202193 ~ p206814   cosine 0.9761 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.73 / 0.46   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 use))   e.g. tierB-001243 tierC-000173 tierC-000174
;;   B: (And (Agent $e0 $x0) (Member $e0 use) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204544 ~ p206860   cosine 0.9760 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.58   gate: PASS
;;   A: (And (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805 tierB-000929
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202274 ~ p202862   cosine 0.9758 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.19 / 1.12   gate: PASS
;;   A: (Already $e0)   e.g. tierB-000034 tierB-000218 tierB-000616
;;   B: (And (Already $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201088 ~ p202883   cosine 0.9752 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.47 / 0.89   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000298 tierB-000425 tierB-000704
;;   B: (And (Member $e0 leave) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202852 ~ p206803   cosine 0.9750 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.84 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause))   e.g. tierB-000775 tierB-001649 tierB-001875
;;   B: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201498 ~ p202144   cosine 0.9745 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.86 / 0.75   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000103 tierB-000338 tierB-000725
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202202 ~ p202767   cosine 0.9744 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.57 / 0.54   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierB-000962 tierC-000277 tierC-000278
;;   B: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202283 ~ p206839   cosine 0.9742 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.71   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202283 ~ p207258   cosine 0.9742 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.71   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201271 ~ p204317   cosine 0.9738 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 1.37 / 0.83   gate: PASS
;;   A: (Member $e0 open)   e.g. tierB-000056 tierB-001487 tierC-000285
;;   B: (And (Member $e0 open) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201271 ~ p204531   cosine 0.9738 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 1.37 / 0.83   gate: PASS
;;   A: (Member $e0 open)   e.g. tierB-000056 tierB-001487 tierC-000285
;;   B: (And (Member $e0 open) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202901 ~ p203760   cosine 0.9735 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.76 / 0.63   gate: PASS
;;   A: (And (Member $x0 sound) (Patient $e0 $x0))   e.g. tierB-000805 tierB-001384 tierB-001894
;;   B: (And (Member $x0 sound) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201827 ~ p203750   cosine 0.9733 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.30 / 0.83   gate: PASS
;;   A: (And (Member $e0 open) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201270 ~ p206826   cosine 0.9732 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.14 / 0.71   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204509 ~ p206830   cosine 0.9729 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.71 / 0.57   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200899 ~ p201043   cosine 0.9727 (seeds 5/5 >= 0.85)   records 11 / 10 / 10   norms 0.77 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202854 ~ p205988   cosine 0.9723 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.89 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203721 ~ p204839   cosine 0.9722 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.87 / 0.73   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202305 ~ p203760   cosine 0.9717 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.79 / 0.63   gate: PASS
;;   A: (Member $x0 sound)   e.g. tierB-000805 tierB-001384 tierB-001894
;;   B: (And (Member $x0 sound) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204478 ~ p206819   cosine 0.9715 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.87 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202760 ~ p206645   cosine 0.9713 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.87 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202760 ~ p206793   cosine 0.9713 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.87 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202760 ~ p206828   cosine 0.9713 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.87 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202760 ~ p207222   cosine 0.9713 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.87 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204687 ~ p207206   cosine 0.9712 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.60 / 0.55   gate: PASS
;;   A: (CoAgent $e0 $x0)   e.g. tierB-001332 tierC-000121 tierC-000122
;;   B: (And (CoAgent $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202276 ~ p206011   cosine 0.9711 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.91 / 0.68   gate: PASS
;;   A: (During $e0 $e1)   e.g. tierB-001782 tierB-001809 tierC-000231
;;   B: (And (During $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202980 ~ p204463   cosine 0.9706 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.90 / 0.67   gate: PASS
;;   A: (Member $e0 eat)   e.g. tierB-000338 tierB-000410 tierB-001551
;;   B: (And (Agent $e0 $x0) (Member $e0 eat))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202284 ~ p207259   cosine 0.9705 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.54 / 0.63   gate: PASS
;;   A: (Member $e0 close)   e.g. tierB-000218 tierB-000950 tierB-001926
;;   B: (And (Member $e0 close) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202899 ~ p204839   cosine 0.9705 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.01 / 0.73   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200957 ~ p201769   cosine 0.9695 (seeds 5/5 >= 0.85)   records 11 / 7 / 7   norms 1.28 / 0.96   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202208 ~ p206652   cosine 0.9695 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.02 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202208 ~ p206801   cosine 0.9695 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.02 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202208 ~ p206802   cosine 0.9695 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.02 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202208 ~ p207161   cosine 0.9695 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.02 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202282 ~ p206652   cosine 0.9695 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.02 / 0.69   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202282 ~ p206801   cosine 0.9695 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.02 / 0.69   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202282 ~ p206802   cosine 0.9695 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.02 / 0.69   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202282 ~ p207161   cosine 0.9695 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.02 / 0.69   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201528 ~ p204490   cosine 0.9693 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 0.73 / 0.51   gate: PASS
;;   A: (Like $e0 $x0)   e.g. tierB-000230 tierB-000831 tierB-001517
;;   B: (And (Experiencer $e0 $x0) (Like $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202871 ~ p203737   cosine 0.9685 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.68 / 0.47   gate: PASS
;;   A: (And (LocatedIn $x0 $x1) (Patient $e0 $x0))   e.g. tierB-000265 tierB-000680 tierB-001359
;;   B: (And (LocatedIn $x0 $x1) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202558 ~ p203056   cosine 0.9682 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.56 / 0.51   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierB-001933 tierC-000025
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202558 ~ p204216   cosine 0.9682 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.56 / 0.51   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierB-001933 tierC-000025
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202558 ~ p204307   cosine 0.9682 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.56 / 0.51   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierB-001933 tierC-000025
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202775 ~ p206652   cosine 0.9678 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202775 ~ p206801   cosine 0.9678 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202775 ~ p206802   cosine 0.9678 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202775 ~ p207161   cosine 0.9678 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202873 ~ p206652   cosine 0.9678 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202873 ~ p206801   cosine 0.9678 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202873 ~ p206802   cosine 0.9678 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202873 ~ p207161   cosine 0.9678 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.69   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202207 ~ p204894   cosine 0.9675 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.74 / 0.61   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202207 ~ p206039   cosine 0.9675 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.74 / 0.61   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202281 ~ p204894   cosine 0.9675 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.74 / 0.61   gate: PASS
;;   A: (Member $e0 bear)   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202281 ~ p206039   cosine 0.9675 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.74 / 0.61   gate: PASS
;;   A: (Member $e0 bear)   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201271 ~ p203750   cosine 0.9671 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 1.37 / 0.83   gate: PASS
;;   A: (Member $e0 open)   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202881 ~ p204314   cosine 0.9671 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.74 / 0.67   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204508 ~ p206033   cosine 0.9671 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.62   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 sleep))   e.g. tierB-001003 tierC-000041 tierC-000042
;;   B: (And (Location $e0 $x0) (Member $e0 sleep) (Member $x0 couch))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204508 ~ p207681   cosine 0.9671 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.62   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 sleep))   e.g. tierB-001003 tierC-000041 tierC-000042
;;   B: (Member $x0 couch)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200548 ~ p201241   cosine 0.9670 (seeds 5/5 >= 0.85)   records 17 / 9 / 9   norms 1.88 / 1.02   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000485 tierB-000715 tierB-000769
;;   B: (And (Agent $e0 $x0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200960 ~ p202215   cosine 0.9669 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 1.45 / 0.88   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-000419 tierB-000867 tierB-001515
;;   B: (And (Member $e0 work) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201086 ~ p201485   cosine 0.9669 (seeds 5/5 >= 0.85)   records 10 / 8 / 8   norms 1.08 / 1.09   gate: PASS
;;   A: (Member $e0 find)   e.g. tierB-000579 tierB-000706 tierC-000243
;;   B: (And (Location $e0 $x0) (Member $e0 find))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202880 ~ p204314   cosine 0.9664 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.72 / 0.67   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202274 ~ p204292   cosine 0.9659 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.19 / 0.95   gate: PASS
;;   A: (Already $e0)   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202274 ~ p204480   cosine 0.9659 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.19 / 0.95   gate: PASS
;;   A: (Already $e0)   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204472 ~ p205992   cosine 0.9658 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.60 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204472 ~ p206813   cosine 0.9658 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.60 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202283 ~ p202852   cosine 0.9656 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.03 / 0.84   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-001089 tierB-001283
;;   B: (And (Agent $e0 $x0) (Member $e0 cause))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202279 ~ p207248   cosine 0.9651 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.63 / 0.55   gate: PASS
;;   A: (Manner $e0 well)   e.g. tierB-000049 tierC-000235 tierC-000236
;;   B: (And (Manner $e0 well) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200617 ~ p201817   cosine 0.9650 (seeds 5/5 >= 0.85)   records 15 / 7 / 7   norms 2.15 / 1.11   gate: PASS
;;   A: (For $e0 $x0)   e.g. tierB-000049 tierB-001603 tierB-001786
;;   B: (And (For $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201252 ~ p202762   cosine 0.9650 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.36 / 0.75   gate: PASS
;;   A: (And (Past $e0) (Recipient $e0 $x0))   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202858 ~ p206815   cosine 0.9647 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.01 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 watch))   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202858 ~ p207309   cosine 0.9647 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.01 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 watch))   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Member $e0 watch) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200956 ~ p202205   cosine 0.9646 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 1.81 / 1.13   gate: PASS
;;   A: (In $e0 $x0)   e.g. tierB-000411 tierB-000774 tierB-001033
;;   B: (And (In $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204475 ~ p205993   cosine 0.9640 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.88 / 0.79   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 family))   e.g. tierB-001302 tierC-000017 tierC-000018
;;   B: (And (Agent $e0 $x0) (Member $x0 family) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201493 ~ p202781   cosine 0.9638 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 1.04 / 0.75   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202284 ~ p207162   cosine 0.9632 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.54 / 0.63   gate: PASS
;;   A: (Member $e0 close)   e.g. tierB-000950 tierB-001205 tierB-001926
;;   B: (And (Agent $e0 $x0) (Member $e0 close))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204725 ~ p207279   cosine 0.9631 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.63 / 0.59   gate: PASS
;;   A: (Member $e0 hold)   e.g. tierB-000378 tierC-000283 tierC-000284
;;   B: (And (Member $e0 hold) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202213 ~ p202779   cosine 0.9629 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.83 / 0.75   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0))   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202213 ~ p202887   cosine 0.9629 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.83 / 0.75   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0))   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202290 ~ p202779   cosine 0.9629 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.83 / 0.75   gate: PASS
;;   A: (Member $e0 receive)   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202290 ~ p202887   cosine 0.9629 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.83 / 0.75   gate: PASS
;;   A: (Member $e0 receive)   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202293 ~ p206815   cosine 0.9627 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.08 / 0.69   gate: PASS
;;   A: (Member $e0 watch)   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202293 ~ p207309   cosine 0.9627 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.08 / 0.69   gate: PASS
;;   A: (Member $e0 watch)   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Member $e0 watch) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202221 ~ p202571   cosine 0.9621 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.73 / 0.69   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203729 ~ p204852   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203729 ~ p204859   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203729 ~ p204893   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203729 ~ p204903   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203729 ~ p206038   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203729 ~ p206043   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203744 ~ p204852   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203744 ~ p204859   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203744 ~ p204893   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203744 ~ p204903   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203744 ~ p206038   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203744 ~ p206043   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203753 ~ p204852   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203753 ~ p204859   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203753 ~ p204893   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203753 ~ p204903   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203753 ~ p206038   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203753 ~ p206043   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204295 ~ p204852   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204295 ~ p204859   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204295 ~ p204893   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204295 ~ p204903   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204295 ~ p206038   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204295 ~ p206043   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204491 ~ p204852   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204491 ~ p204859   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204491 ~ p204893   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204491 ~ p204903   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204491 ~ p206038   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204491 ~ p206043   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204493 ~ p204852   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204493 ~ p204859   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204493 ~ p204893   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204493 ~ p204903   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204493 ~ p206038   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204493 ~ p206043   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204518 ~ p204852   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204518 ~ p204859   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204518 ~ p204893   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204518 ~ p204903   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204518 ~ p206038   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204518 ~ p206043   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204711 ~ p204852   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (Member $e0 bad)   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204711 ~ p204859   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (Member $e0 bad)   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204711 ~ p204893   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (Member $e0 bad)   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204711 ~ p204903   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (Member $e0 bad)   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204711 ~ p206038   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (Member $e0 bad)   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204711 ~ p206043   cosine 0.9621 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.50   gate: PASS
;;   A: (Member $e0 bad)   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200613 ~ p201220   cosine 0.9620 (seeds 5/5 >= 0.85)   records 15 / 9 / 9   norms 1.56 / 1.15   gate: PASS
;;   A: (And (Ongoing $e0) (Theme $e0 $x0))   e.g. tierB-000520 tierB-000713 tierB-000784
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201822 ~ p202773   cosine 0.9614 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.77 / 0.92   gate: PASS
;;   A: (And (Member $e0 find) (Theme $e0 $x0))   e.g. tierB-000579 tierC-000279 tierC-000280
;;   B: (And (Location $e0 $x0) (Member $e0 find) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204544 ~ p206830   cosine 0.9608 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.57   gate: PASS
;;   A: (And (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204315 ~ p204854   cosine 0.9600 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204315 ~ p206013   cosine 0.9600 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204315 ~ p206020   cosine 0.9600 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204315 ~ p206661   cosine 0.9600 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204315 ~ p206848   cosine 0.9600 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204315 ~ p206863   cosine 0.9600 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201070 ~ p202015   cosine 0.9590 (seeds 5/5 >= 0.85)   records 10 / 6 / 6   norms 1.29 / 0.86   gate: PASS
;;   A: (And (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201532 ~ p207168   cosine 0.9590 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 2.65 / 0.59   gate: PASS
;;   A: (Member $e0 serve)   e.g. tierB-000864 tierC-000053 tierC-000054
;;   B: (And (Agent $e0 $x0) (Member $e0 serve))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202570 ~ p204894   cosine 0.9590 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.09 / 0.61   gate: PASS
;;   A: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202570 ~ p206039   cosine 0.9590 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.09 / 0.61   gate: PASS
;;   A: (And (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202191 ~ p206645   cosine 0.9588 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.93 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202191 ~ p206793   cosine 0.9588 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.93 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202191 ~ p206828   cosine 0.9588 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.93 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202191 ~ p207222   cosine 0.9588 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.93 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203008 ~ p206819   cosine 0.9587 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.77   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200548 ~ p201252   cosine 0.9584 (seeds 5/5 >= 0.85)   records 17 / 9 / 9   norms 1.88 / 1.36   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000150 tierB-000769 tierB-000775
;;   B: (And (Past $e0) (Recipient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200958 ~ p204539   cosine 0.9584 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 1.77 / 1.02   gate: PASS
;;   A: (Member $e0 study)   e.g. tierB-000253 tierB-000292 tierC-000253
;;   B: (And (Member $e0 study) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200535 ~ p200720   cosine 0.9583 (seeds 5/5 >= 0.85)   records 17 / 13 / 13   norms 1.36 / 1.18   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1))   e.g. tierB-000324 tierB-000387 tierB-000462
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201486 ~ p202136   cosine 0.9583 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.79 / 0.70   gate: PASS
;;   A: (And (Location $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000942 tierB-001933 tierC-000025
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201087 ~ p202878   cosine 0.9580 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.27 / 0.75   gate: PASS
;;   A: (Member $e0 follow)   e.g. tierB-000231 tierC-000076 tierC-000095
;;   B: (And (Member $e0 follow) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202898 ~ p206045   cosine 0.9567 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.57 / 0.43   gate: PASS
;;   A: (And (Member $x0 house) (Theme $e0 $x0))   e.g. tierB-000441 tierB-001690 tierC-000095
;;   B: (And (Member $x0 house) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202996 ~ p206044   cosine 0.9565 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.68 / 0.58   gate: PASS
;;   A: (Member $x0 fire)   e.g. tierB-000890 tierB-001163 tierB-001302
;;   B: (And (Member $x0 fire) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202996 ~ p207315   cosine 0.9565 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.68 / 0.58   gate: PASS
;;   A: (Member $x0 fire)   e.g. tierB-000890 tierB-001163 tierB-001302
;;   B: (And (Member $x0 fire) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200860 ~ p201820   cosine 0.9564 (seeds 5/5 >= 0.85)   records 12 / 7 / 7   norms 1.31 / 1.02   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000255 tierB-000277
;;   B: (And (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202195 ~ p202763   cosine 0.9562 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.71 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Source $e0 $x1))   e.g. tierB-000338 tierB-000693 tierB-000781
;;   B: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202902 ~ p206000   cosine 0.9560 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.86 / 0.56   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $e1))   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202902 ~ p207181   cosine 0.9560 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.86 / 0.56   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $e1))   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203011 ~ p206000   cosine 0.9560 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.86 / 0.56   gate: PASS
;;   A: (Stimulus $e0 $e1)   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203011 ~ p207181   cosine 0.9560 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.86 / 0.56   gate: PASS
;;   A: (Stimulus $e0 $e1)   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202876 ~ p204312   cosine 0.9557 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.62 / 0.55   gate: PASS
;;   A: (And (Member $e0 direct) (Patient $e0 $x0))   e.g. tierC-000010 tierC-000091 tierC-000297
;;   B: (And (Member $e0 direct) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202876 ~ p204526   cosine 0.9557 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.62 / 0.55   gate: PASS
;;   A: (And (Member $e0 direct) (Patient $e0 $x0))   e.g. tierC-000010 tierC-000091 tierC-000297
;;   B: (And (Member $e0 direct) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201065 ~ p202772   cosine 0.9545 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.33 / 0.73   gate: PASS
;;   A: (And (Instrument $e0 $x0) (Past $e0))   e.g. tierB-000392 tierB-001143 tierB-001429
;;   B: (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202140 ~ p206658   cosine 0.9545 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.90 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202880 ~ p204315   cosine 0.9543 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.72 / 0.67   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201268 ~ p201823   cosine 0.9540 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.19 / 1.04   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204747 ~ p205994   cosine 0.9540 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.47 / 0.71   gate: PASS
;;   A: (Member $x0 father)   e.g. tierB-001743 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Member $x0 father) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201067 ~ p201676   cosine 0.9534 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.93 / 0.74   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-001582 tierB-001817 tierC-000001
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201067 ~ p201771   cosine 0.9534 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.93 / 0.74   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-001582 tierB-001817 tierC-000001
;;   B: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204515 ~ p206651   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204515 ~ p206799   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204515 ~ p206800   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204515 ~ p206836   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204515 ~ p207159   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204515 ~ p207246   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204706 ~ p206651   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (Manner $e0 directly)   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204706 ~ p206799   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (Manner $e0 directly)   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204706 ~ p206800   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (Manner $e0 directly)   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204706 ~ p206836   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (Manner $e0 directly)   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204706 ~ p207159   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (Manner $e0 directly)   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204706 ~ p207246   cosine 0.9534 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.45   gate: PASS
;;   A: (Manner $e0 directly)   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202192 ~ p206806   cosine 0.9526 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.05 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow))   e.g. tierB-000231 tierC-000095 tierC-000096
;;   B: (And (Agent $e0 $x0) (Member $e0 follow) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204322 ~ p204909   cosine 0.9523 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.65 / 0.58   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202285 ~ p204312   cosine 0.9519 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.64 / 0.55   gate: PASS
;;   A: (Member $e0 direct)   e.g. tierC-000010 tierC-000091 tierC-000297
;;   B: (And (Member $e0 direct) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202285 ~ p204526   cosine 0.9519 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.64 / 0.55   gate: PASS
;;   A: (Member $e0 direct)   e.g. tierC-000010 tierC-000091 tierC-000297
;;   B: (And (Member $e0 direct) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204521 ~ p206803   cosine 0.9509 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.67   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-001649 tierB-001875
;;   B: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201528 ~ p207229   cosine 0.9502 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.73 / 0.41   gate: PASS
;;   A: (Like $e0 $x0)   e.g. tierB-000230 tierB-000831 tierB-001135
;;   B: (And (Like $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200848 ~ p202016   cosine 0.9501 (seeds 5/5 >= 0.85)   records 12 / 6 / 6   norms 1.33 / 1.14   gate: PASS
;;   A: (And (Member $x0 thing) (Patient $e0 $x0))   e.g. tierB-000389 tierB-001520 tierC-000119
;;   B: (And (Member $x0 thing) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202280 ~ p204516   cosine 0.9487 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.08 / 0.86   gate: PASS
;;   A: (Member $e0 add)   e.g. tierB-000462 tierB-001132 tierC-000231
;;   B: (And (Member $e0 add) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202013 ~ p203082   cosine 0.9484 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.62 / 0.55   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412 tierC-000181
;;   B: (And (Cardinality $x0 <num>) (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201488 ~ p202142   cosine 0.9478 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.79 / 0.66   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0))   e.g. tierB-001079 tierB-001582 tierC-000001
;;   B: (And (Member $e0 become) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201873 ~ p202894   cosine 0.9476 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.01 / 0.79   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203770 ~ p204843   cosine 0.9476 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.67   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $x0) (To $e0 $e1))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e1 $x1) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p203770 ~ p204845   cosine 0.9476 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.67   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $x0) (To $e0 $e1))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e0 $x1) (To $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203770 ~ p206004   cosine 0.9476 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.67   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $x0) (To $e0 $e1))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e1 $x1) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203770 ~ p206822   cosine 0.9476 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.67   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $x0) (To $e0 $e1))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e0 $x1) (To $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204739 ~ p207176   cosine 0.9470 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.55   gate: PASS
;;   A: (Member $x0 bus)   e.g. tierB-001430 tierB-001528 tierB-001739
;;   B: (And (Agent $e0 $x0) (Member $x0 bus))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202894 ~ p206858   cosine 0.9469 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.79 / 0.55   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0))   e.g. tierB-000476 tierB-000654 tierB-001675
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202216 ~ p204894   cosine 0.9468 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.12 / 0.61   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202216 ~ p206039   cosine 0.9468 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.12 / 0.61   gate: PASS
;;   A: (And (Member $x0 person) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200586 ~ p201069   cosine 0.9465 (seeds 5/5 >= 0.85)   records 16 / 10 / 10   norms 1.67 / 1.34   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012 tierB-000115 tierB-000204
;;   B: (And (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204314 ~ p204854   cosine 0.9463 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204314 ~ p206013   cosine 0.9463 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204314 ~ p206020   cosine 0.9463 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204314 ~ p206661   cosine 0.9463 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204314 ~ p206848   cosine 0.9463 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204314 ~ p206863   cosine 0.9463 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.67 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200499 ~ p201497   cosine 0.9461 (seeds 5/5 >= 0.85)   records 18 / 8 / 8   norms 1.57 / 1.11   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000009 tierB-000189 tierB-000421
;;   B: (And (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201490 ~ p202143   cosine 0.9461 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 1.11 / 0.97   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201870 ~ p202872   cosine 0.9460 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.80 / 0.67   gate: PASS
;;   A: (Measure $e0 duration <num> year)   e.g. tierB-000253 tierB-000778 tierB-001536
;;   B: (And (Measure $e0 duration <num> year) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200956 ~ p206825   cosine 0.9456 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.81 / 0.70   gate: PASS
;;   A: (In $e0 $x0)   e.g. tierB-000411 tierB-001667 tierC-000014
;;   B: (And (Experiencer $e0 $x0) (In $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200956 ~ p207209   cosine 0.9456 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.81 / 0.70   gate: PASS
;;   A: (In $e0 $x0)   e.g. tierB-000411 tierB-001667 tierC-000014
;;   B: (And (Experiencer $e0 $x0) (In $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202283 ~ p206803   cosine 0.9452 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.67   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-001649 tierB-001875
;;   B: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202897 ~ p203729   cosine 0.9449 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.66 / 0.61   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202897 ~ p203744   cosine 0.9449 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.66 / 0.61   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202897 ~ p203753   cosine 0.9449 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.66 / 0.61   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202897 ~ p204295   cosine 0.9449 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.66 / 0.61   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202897 ~ p204491   cosine 0.9449 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.66 / 0.61   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202897 ~ p204493   cosine 0.9449 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.66 / 0.61   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202897 ~ p204518   cosine 0.9449 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.66 / 0.61   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202897 ~ p204711   cosine 0.9449 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.66 / 0.61   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (Member $e0 bad)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200960 ~ p207175   cosine 0.9447 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.45 / 0.53   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001134 tierB-001813 tierB-001873
;;   B: (And (Agent $e0 $x0) (Member $e0 work))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200741 ~ p202899   cosine 0.9439 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 1.59 / 1.01   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001168 tierB-001251 tierB-001693
;;   B: (And (Member $x0 new) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201873 ~ p204320   cosine 0.9435 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.01 / 0.68   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200740 ~ p201064   cosine 0.9433 (seeds 5/5 >= 0.85)   records 13 / 10 / 10   norms 0.95 / 1.86   gate: PASS
;;   A: (Member $x0 company)   e.g. tierB-000762 tierB-000853 tierB-001130
;;   B: (And (Agent $e0 $x0) (Member $x0 company))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202204 ~ p206794   cosine 0.9428 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.74 / 0.60   gate: PASS
;;   A: (And (Goal $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000462 tierB-001132 tierB-001860
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201531 ~ p204469   cosine 0.9427 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 0.75 / 0.58   gate: PASS
;;   A: (Member $e0 sell)   e.g. tierB-000784 tierB-000975 tierC-000197
;;   B: (And (Agent $e0 $x0) (Member $e0 sell))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204508 ~ p207236   cosine 0.9427 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 1.13   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 sleep))   e.g. tierB-001003 tierC-000041 tierC-000042
;;   B: (And (Location $e0 $x0) (Member $x0 couch))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202280 ~ p204461   cosine 0.9425 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.08 / 0.75   gate: PASS
;;   A: (Member $e0 add)   e.g. tierB-000462 tierB-001132 tierC-000227
;;   B: (And (Agent $e0 $x0) (Member $e0 add))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200959 ~ p201493   cosine 0.9419 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 1.26 / 1.04   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000216 tierB-000400
;;   B: (And (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200960 ~ p207213   cosine 0.9410 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.45 / 0.46   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-000144 tierB-000419 tierB-001515
;;   B: (And (Experiencer $e0 $x0) (Member $e0 work))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200858 ~ p201489   cosine 0.9405 (seeds 5/5 >= 0.85)   records 12 / 8 / 8   norms 1.03 / 0.80   gate: PASS
;;   A: (Member $e0 become)   e.g. tierB-001079 tierB-001582 tierB-001817
;;   B: (And (Member $e0 become) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201087 ~ p206806   cosine 0.9395 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 1.27 / 0.62   gate: PASS
;;   A: (Member $e0 follow)   e.g. tierB-000231 tierC-000095 tierC-000096
;;   B: (And (Agent $e0 $x0) (Member $e0 follow) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201488 ~ p202339   cosine 0.9389 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 0.79 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201488 ~ p202726   cosine 0.9389 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 0.79 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201770 ~ p202339   cosine 0.9387 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.73 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201770 ~ p202726   cosine 0.9387 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.73 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201820 ~ p206645   cosine 0.9385 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.02 / 0.62   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201820 ~ p206793   cosine 0.9385 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.02 / 0.62   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201820 ~ p206828   cosine 0.9385 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.02 / 0.62   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201820 ~ p207222   cosine 0.9385 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.02 / 0.62   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200133 ~ p200209   cosine 0.9384 (seeds 5/5 >= 0.85)   records 52 / 38 / 38   norms 1.99 / 1.60   gate: PASS
;;   A: (Goal $e0 $x0)   e.g. tierB-000111 tierB-000178 tierB-000204
;;   B: (And (Goal $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201529 ~ p204522   cosine 0.9380 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 1.24 / 0.76   gate: PASS
;;   A: (Member $e0 change)   e.g. tierB-000139 tierB-001217 tierB-001803
;;   B: (And (Member $e0 change) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202882 ~ p204854   cosine 0.9370 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.70 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202882 ~ p206013   cosine 0.9370 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.70 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202882 ~ p206020   cosine 0.9370 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.70 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202882 ~ p206661   cosine 0.9370 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.70 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202882 ~ p206848   cosine 0.9370 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.70 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202882 ~ p206863   cosine 0.9370 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.70 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202293 ~ p207308   cosine 0.9365 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.08 / 0.52   gate: PASS
;;   A: (Member $e0 watch)   e.g. tierB-000651 tierB-001720 tierB-001800
;;   B: (And (Member $e0 watch) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200741 ~ p203757   cosine 0.9361 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 1.59 / 0.86   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001168 tierB-001251 tierB-001693
;;   B: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202971 ~ p204458   cosine 0.9359 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.58 / 0.51   gate: PASS
;;   A: (GroupOf $x0 boy)   e.g. tierB-001316 tierB-001457 tierB-001530
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 boy))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200858 ~ p201676   cosine 0.9350 (seeds 5/5 >= 0.85)   records 12 / 7 / 7   norms 1.03 / 0.74   gate: PASS
;;   A: (Member $e0 become)   e.g. tierB-001582 tierB-001817 tierC-000001
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200858 ~ p201771   cosine 0.9350 (seeds 5/5 >= 0.85)   records 12 / 7 / 7   norms 1.03 / 0.74   gate: PASS
;;   A: (Member $e0 become)   e.g. tierB-001582 tierB-001817 tierC-000001
;;   B: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202214 ~ p204320   cosine 0.9350 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.91 / 0.68   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204561 ~ p206053   cosine 0.9350 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.60 / 0.52   gate: PASS
;;   A: (And (Theme $e0 $e1) (Theme $e1 $x0))   e.g. tierB-000339 tierB-000400 tierB-000401
;;   B: (And (Past $e0) (Theme $e0 $e1) (Theme $e1 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202194 ~ p203719   cosine 0.9349 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.59 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001182 tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202291 ~ p202888   cosine 0.9347 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.78 / 0.66   gate: PASS
;;   A: (Member $e0 run)   e.g. tierB-000178 tierB-001153 tierB-001563
;;   B: (And (Member $e0 run) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200663 ~ p202015   cosine 0.9342 (seeds 5/5 >= 0.85)   records 14 / 6 / 6   norms 1.49 / 0.86   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200961 ~ p203719   cosine 0.9340 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 1.05 / 0.61   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001182 tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201043 ~ p201102   cosine 0.9326 (seeds 5/5 >= 0.85)   records 10 / 9 / 9   norms 0.72 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201043 ~ p201103   cosine 0.9326 (seeds 5/5 >= 0.85)   records 10 / 9 / 9   norms 0.72 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202279 ~ p207249   cosine 0.9313 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.63 / 0.53   gate: PASS
;;   A: (Manner $e0 well)   e.g. tierB-001956 tierC-000235 tierC-000236
;;   B: (And (Manner $e0 well) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200499 ~ p201823   cosine 0.9311 (seeds 5/5 >= 0.85)   records 18 / 7 / 7   norms 1.57 / 1.04   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201489 ~ p202142   cosine 0.9309 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.80 / 0.66   gate: PASS
;;   A: (And (Member $e0 become) (Result $e0 $e1))   e.g. tierB-001079 tierB-001582 tierC-000001
;;   B: (And (Member $e0 become) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200549 ~ p203009   cosine 0.9293 (seeds 5/5 >= 0.85)   records 17 / 5 / 5   norms 2.06 / 0.66   gate: PASS
;;   A: (SubsetOf $x0 $x1)   e.g. tierB-000799 tierB-001111 tierB-001628
;;   B: (ProportionOf $x0 $x1 most)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201529 ~ p206840   cosine 0.9293 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.24 / 0.68   gate: PASS
;;   A: (Member $e0 change)   e.g. tierB-000139 tierB-001803 tierC-000011
;;   B: (And (Member $e0 change) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200739 ~ p202854   cosine 0.9292 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 1.68 / 0.89   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000160 tierB-000648 tierB-001125
;;   B: (And (Agent $e0 $x0) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201870 ~ p206007   cosine 0.9290 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.80 / 0.61   gate: PASS
;;   A: (Measure $e0 duration <num> year)   e.g. tierB-001134 tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Measure $e0 duration <num> year) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201870 ~ p207198   cosine 0.9290 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.80 / 0.61   gate: PASS
;;   A: (Measure $e0 duration <num> year)   e.g. tierB-001134 tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Measure $e0 duration <num> year))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200617 ~ p204457   cosine 0.9289 (seeds 5/5 >= 0.85)   records 15 / 4 / 4   norms 2.15 / 0.64   gate: PASS
;;   A: (For $e0 $x0)   e.g. tierB-000049 tierB-000712 tierB-001663
;;   B: (And (Agent $e0 $x0) (For $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201268 ~ p202143   cosine 0.9289 (seeds 5/5 >= 0.85)   records 9 / 6 / 6   norms 1.19 / 0.97   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202201 ~ p206826   cosine 0.9288 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.86 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200965 ~ p202200   cosine 0.9277 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 1.46 / 0.91   gate: PASS
;;   A: (Probably $e0)   e.g. tierB-000495 tierB-001521 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Probably $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202209 ~ p206840   cosine 0.9267 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.12 / 0.68   gate: PASS
;;   A: (And (Member $e0 change) (Patient $e0 $x0))   e.g. tierB-000139 tierB-001803 tierC-000011
;;   B: (And (Member $e0 change) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201067 ~ p201770   cosine 0.9266 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.93 / 0.73   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-000352 tierB-001582 tierC-000001
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200741 ~ p203721   cosine 0.9259 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 1.59 / 0.87   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201166 ~ p201545   cosine 0.9247 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 0.90 / 0.80   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200433 ~ p202193   cosine 0.9244 (seeds 5/5 >= 0.85)   records 20 / 6 / 6   norms 2.27 / 0.73   gate: PASS
;;   A: (Member $e0 use)   e.g. tierB-000268 tierB-000850 tierB-001098
;;   B: (And (Agent $e0 $x0) (Member $e0 use))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202571 ~ p203111   cosine 0.9243 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.69 / 0.62   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202571 ~ p204318   cosine 0.9243 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.69 / 0.62   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200493 ~ p200925   cosine 0.9240 (seeds 5/5 >= 0.85)   records 18 / 11 / 11   norms 1.60 / 1.33   gate: PASS
;;   A: (And (Location $e0 $x0) (Patient $e0 $x1))   e.g. tierB-000034 tierB-000291 tierB-000383
;;   B: (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202280 ~ p206837   cosine 0.9240 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.08 / 0.68   gate: PASS
;;   A: (Member $e0 add)   e.g. tierB-000462 tierC-000231 tierC-000232
;;   B: (And (Member $e0 add) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202280 ~ p207250   cosine 0.9240 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.08 / 0.68   gate: PASS
;;   A: (Member $e0 add)   e.g. tierB-000462 tierC-000231 tierC-000232
;;   B: (And (Member $e0 add) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202860 ~ p205985   cosine 0.9232 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.59 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Result $e0 $e1))   e.g. tierB-000747 tierB-001920 tierB-001976
;;   B: (And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202860 ~ p206820   cosine 0.9232 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.59 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Result $e0 $e1))   e.g. tierB-000747 tierB-001920 tierB-001976
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202223 ~ p204323   cosine 0.9231 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.64 / 0.51   gate: PASS
;;   A: (And (Theme $e0 $x0) (To $e0 $e1))   e.g. tierB-000252 tierB-000730 tierC-000123
;;   B: (And (Past $e0) (Theme $e0 $x0) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202891 ~ p204296   cosine 0.9230 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.96 / 0.82   gate: PASS
;;   A: (And (Member $e0 sleep) (Ongoing $e0))   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p203087   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202767 ~ p203088   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p203113   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p203730   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p203751   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p203754   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202767 ~ p204223   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p204299   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p204300   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p204497   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p204546   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202767 ~ p204746   cosine 0.9224 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200863 ~ p207326   cosine 0.9222 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 1.04 / 0.48   gate: PASS
;;   A: (Member $x0 weather)   e.g. tierB-000517 tierB-000748 tierB-001491
;;   B: (And (Member $x0 weather) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201091 ~ p203718   cosine 0.9196 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 1.24 / 0.69   gate: PASS
;;   A: (Member $x0 cat)   e.g. tierB-000073 tierB-000381 tierB-001183
;;   B: (And (Agent $e0 $x0) (Member $x0 cat) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201091 ~ p204474   cosine 0.9196 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 1.24 / 0.69   gate: PASS
;;   A: (Member $x0 cat)   e.g. tierB-000073 tierB-000381 tierB-001183
;;   B: (And (Agent $e0 $x0) (Member $x0 cat))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202971 ~ p205986   cosine 0.9187 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.58 / 0.45   gate: PASS
;;   A: (GroupOf $x0 boy)   e.g. tierB-001457 tierB-001530 tierB-001840
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202210 ~ p206846   cosine 0.9185 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.00 / 0.57   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202210 ~ p207273   cosine 0.9185 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.00 / 0.57   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200965 ~ p204551   cosine 0.9184 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 1.46 / 0.76   gate: PASS
;;   A: (Probably $e0)   e.g. tierB-000517 tierB-001891 tierB-001910
;;   B: (And (Ongoing $e0) (Probably $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201250 ~ p206814   cosine 0.9181 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.42 / 0.46   gate: PASS
;;   A: (And (Member $e0 use) (Theme $e0 $x0))   e.g. tierB-001243 tierC-000173 tierC-000174
;;   B: (And (Agent $e0 $x0) (Member $e0 use) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200546 ~ p200937   cosine 0.9180 (seeds 5/5 >= 0.85)   records 17 / 11 / 11   norms 1.72 / 1.29   gate: PASS
;;   A: (Instrument $e0 $x0)   e.g. tierB-000016 tierB-000392 tierB-000733
;;   B: (And (Instrument $e0 $x0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202875 ~ p206804   cosine 0.9179 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.75 / 0.56   gate: PASS
;;   A: (And (Member $e0 create) (Patient $e0 $x0))   e.g. tierB-000728 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Member $e0 create) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202875 ~ p207163   cosine 0.9179 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.75 / 0.56   gate: PASS
;;   A: (And (Member $e0 create) (Patient $e0 $x0))   e.g. tierB-000728 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Member $e0 create))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202978 ~ p206804   cosine 0.9179 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.75 / 0.56   gate: PASS
;;   A: (Member $e0 create)   e.g. tierB-000728 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Member $e0 create) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202978 ~ p207163   cosine 0.9179 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.75 / 0.56   gate: PASS
;;   A: (Member $e0 create)   e.g. tierB-000728 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Member $e0 create))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201241 ~ p202762   cosine 0.9178 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.02 / 0.75   gate: PASS
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1))   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200955 ~ p202868   cosine 0.9174 (seeds 5/5 >= 0.85)   records 11 / 5 / 5   norms 1.25 / 0.98   gate: PASS
;;   A: (GroupOf $x0 thing)   e.g. tierB-000162 tierB-000483 tierB-001069
;;   B: (And (GroupOf $x0 thing) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201676 ~ p202339   cosine 0.9172 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.74 / 0.59   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201676 ~ p202726   cosine 0.9172 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.74 / 0.59   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201771 ~ p202339   cosine 0.9172 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.74 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201771 ~ p202726   cosine 0.9172 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.74 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202222 ~ p202783   cosine 0.9170 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.82 / 0.73   gate: PASS
;;   A: (And (Source $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000781 tierB-001325 tierB-001540
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201093 ~ p204549   cosine 0.9169 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 1.08 / 0.58   gate: PASS
;;   A: (Member $x0 tree)   e.g. tierB-000176 tierB-000277 tierB-001476
;;   B: (And (Member $x0 tree) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201822 ~ p203096   cosine 0.9167 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.77 / 0.86   gate: PASS
;;   A: (And (Member $e0 find) (Theme $e0 $x0))   e.g. tierC-000279 tierC-000280 tierC-000313
;;   B: (And (Location $e0 $x0) (Member $e0 find) (Member $x1 thing) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201822 ~ p203740   cosine 0.9167 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.77 / 0.86   gate: PASS
;;   A: (And (Member $e0 find) (Theme $e0 $x0))   e.g. tierC-000279 tierC-000280 tierC-000313
;;   B: (And (Location $e0 $x0) (Member $x1 thing) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200662 ~ p200844   cosine 0.9161 (seeds 5/5 >= 0.85)   records 14 / 12 / 12   norms 1.21 / 1.14   gate: PASS
;;   A: (Before $e0 $e1)   e.g. tierB-000412 tierB-000688 tierB-001134
;;   B: (And (Before $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201813 ~ p203079   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201813 ~ p203080   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p203081   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p203089   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p203725   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p203731   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p203732   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201813 ~ p204294   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p204305   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p204499   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p204503   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p204504   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201813 ~ p204702   cosine 0.9160 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200499 ~ p202143   cosine 0.9158 (seeds 5/5 >= 0.85)   records 18 / 6 / 6   norms 1.57 / 0.97   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201876 ~ p203729   cosine 0.9157 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.72 / 0.61   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201876 ~ p203744   cosine 0.9157 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.72 / 0.61   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201876 ~ p203753   cosine 0.9157 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.72 / 0.61   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201876 ~ p204295   cosine 0.9157 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.72 / 0.61   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201876 ~ p204491   cosine 0.9157 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.72 / 0.61   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201876 ~ p204493   cosine 0.9157 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.72 / 0.61   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201876 ~ p204518   cosine 0.9157 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.72 / 0.61   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201876 ~ p204711   cosine 0.9157 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.72 / 0.61   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (Member $e0 bad)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201822 ~ p203749   cosine 0.9156 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.77 / 0.63   gate: PASS
;;   A: (And (Member $e0 find) (Theme $e0 $x0))   e.g. tierC-000279 tierC-000280 tierC-000313
;;   B: (And (Member $e0 find) (Member $x0 thing) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200961 ~ p202194   cosine 0.9152 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 1.05 / 1.59   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001182 tierB-001416 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201489 ~ p202339   cosine 0.9152 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 0.80 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Result $e0 $e1))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201489 ~ p202726   cosine 0.9152 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 0.80 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Result $e0 $e1))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200739 ~ p204533   cosine 0.9148 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 1.68 / 0.58   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000089 tierB-000648 tierB-000816
;;   B: (And (Member $e0 play) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200858 ~ p201488   cosine 0.9147 (seeds 5/5 >= 0.85)   records 12 / 8 / 8   norms 1.03 / 0.79   gate: PASS
;;   A: (Member $e0 become)   e.g. tierB-000352 tierB-001079 tierB-001582
;;   B: (And (Member $e0 become) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201818 ~ p204302   cosine 0.9141 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.75 / 0.52   gate: PASS
;;   A: (And (Goal $e0 $x0) (Patient $e0 $x1))   e.g. tierB-000482 tierB-001453 tierB-001579
;;   B: (And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200860 ~ p202191   cosine 0.9139 (seeds 5/5 >= 0.85)   records 12 / 6 / 6   norms 1.31 / 0.93   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200861 ~ p201829   cosine 0.9126 (seeds 5/5 >= 0.85)   records 12 / 7 / 7   norms 1.54 / 1.09   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000252 tierB-000309 tierB-000942
;;   B: (And (Member $e0 take) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200343 ~ p201251   cosine 0.9123 (seeds 5/5 >= 0.85)   records 26 / 9 / 9   norms 2.31 / 0.93   gate: PASS
;;   A: (Obligated $e0)   e.g. tierB-000037 tierB-000080 tierB-000246
;;   B: (And (Obligated $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200433 ~ p206814   cosine 0.9123 (seeds 5/5 >= 0.85)   records 20 / 3 / 3   norms 2.27 / 0.46   gate: PASS
;;   A: (Member $e0 use)   e.g. tierB-001243 tierC-000173 tierC-000174
;;   B: (And (Agent $e0 $x0) (Member $e0 use) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200741 ~ p204839   cosine 0.9117 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 1.59 / 0.73   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201673 ~ p201892   cosine 0.9108 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 0.75 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000858 tierB-000942 tierB-001697
;;   B: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201670 ~ p202336   cosine 0.9104 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.65 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 company) (Past $e0))   e.g. tierB-000762 tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201873 ~ p206858   cosine 0.9092 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.01 / 0.55   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-001675
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p202782   cosine 0.9069 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.58 / 0.51   gate: PASS
;;   A: (Member $e0 win)   e.g. tierB-000145 tierC-000277 tierC-000278
;;   B: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p202895   cosine 0.9069 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.58 / 0.51   gate: PASS
;;   A: (Member $e0 win)   e.g. tierB-000145 tierC-000277 tierC-000278
;;   B: (And (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p202896   cosine 0.9069 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.58 / 0.51   gate: PASS
;;   A: (Member $e0 win)   e.g. tierB-000145 tierC-000277 tierC-000278
;;   B: (And (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202139 ~ p206658   cosine 0.9052 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.94 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204541 ~ p206857   cosine 0.9046 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.71 / 0.57   gate: PASS
;;   A: (And (Member $e0 try) (Ongoing $e0))   e.g. tierB-000117 tierB-000469 tierB-000487
;;   B: (And (Member $e0 try) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200343 ~ p202218   cosine 0.9036 (seeds 5/5 >= 0.85)   records 26 / 6 / 6   norms 2.31 / 0.68   gate: PASS
;;   A: (Obligated $e0)   e.g. tierB-000080 tierB-000147 tierB-001143
;;   B: (And (Obligated $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201267 ~ p206846   cosine 0.9036 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.25 / 0.57   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201267 ~ p207273   cosine 0.9036 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.25 / 0.57   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200858 ~ p201770   cosine 0.9027 (seeds 5/5 >= 0.85)   records 12 / 7 / 7   norms 1.03 / 0.73   gate: PASS
;;   A: (Member $e0 become)   e.g. tierB-000352 tierB-001582 tierC-000001
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200860 ~ p202760   cosine 0.9027 (seeds 5/5 >= 0.85)   records 12 / 5 / 5   norms 1.31 / 0.87   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200343 ~ p201496   cosine 0.9018 (seeds 5/5 >= 0.85)   records 26 / 8 / 8   norms 2.31 / 0.88   gate: PASS
;;   A: (Obligated $e0)   e.g. tierB-000813 tierB-001143 tierB-001520
;;   B: (And (Obligated $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200739 ~ p206809   cosine 0.9007 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 1.68 / 0.61   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200739 ~ p207289   cosine 0.9007 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 1.68 / 0.61   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201483 ~ p206792   cosine 0.9005 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.76 / 0.41   gate: PASS
;;   A: (And (Future $e0) (Theme $e0 $x0))   e.g. tierB-000453 tierB-001266 tierB-001626
;;   B: (And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201477 ~ p203712   cosine 0.9000 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 0.99 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-000587 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202908 ~ p204843   cosine 0.8999 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.69 / 0.67   gate: PASS
;;   A: (And (Theme $e0 $x0) (To $e1 $e0))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e1 $x1) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202908 ~ p204845   cosine 0.8999 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.69 / 0.67   gate: PASS
;;   A: (And (Theme $e0 $x0) (To $e1 $e0))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e0 $x1) (To $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202908 ~ p206004   cosine 0.8999 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.69 / 0.67   gate: PASS
;;   A: (And (Theme $e0 $x0) (To $e1 $e0))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e1 $x1) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202908 ~ p206822   cosine 0.8999 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.69 / 0.67   gate: PASS
;;   A: (And (Theme $e0 $x0) (To $e1 $e0))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e0 $x1) (To $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202313 ~ p206864   cosine 0.8980 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.35 / 0.72   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-001894 tierC-000283 tierC-000284
;;   B: (And (Past $e0) (Patient $e0 $x0) (Time $e0 night))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202313 ~ p207340   cosine 0.8980 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.35 / 0.72   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-001894 tierC-000283 tierC-000284
;;   B: (And (Patient $e0 $x0) (Time $e0 night))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202880 ~ p204854   cosine 0.8980 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202880 ~ p206013   cosine 0.8980 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202880 ~ p206020   cosine 0.8980 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202880 ~ p206661   cosine 0.8980 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202880 ~ p206848   cosine 0.8980 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202880 ~ p206863   cosine 0.8980 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200434 ~ p207317   cosine 0.8966 (seeds 5/5 >= 0.85)   records 20 / 3 / 3   norms 2.11 / 0.44   gate: PASS
;;   A: (Member $x0 house)   e.g. tierB-000371 tierB-000471 tierB-001887
;;   B: (And (Member $x0 house) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201494 ~ p202781   cosine 0.8959 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 0.98 / 0.75   gate: PASS
;;   A: (And (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200548 ~ p202762   cosine 0.8958 (seeds 5/5 >= 0.85)   records 17 / 5 / 5   norms 1.88 / 0.75   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200549 ~ p202199   cosine 0.8957 (seeds 5/5 >= 0.85)   records 17 / 6 / 6   norms 2.06 / 0.84   gate: PASS
;;   A: (SubsetOf $x0 $x1)   e.g. tierB-000133 tierB-000320 tierB-000761
;;   B: (And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202904 ~ p206864   cosine 0.8950 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.30 / 0.72   gate: PASS
;;   A: (And (Past $e0) (Time $e0 night))   e.g. tierB-001894 tierC-000283 tierC-000284
;;   B: (And (Past $e0) (Patient $e0 $x0) (Time $e0 night))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202904 ~ p207340   cosine 0.8950 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.30 / 0.72   gate: PASS
;;   A: (And (Past $e0) (Time $e0 night))   e.g. tierB-001894 tierC-000283 tierC-000284
;;   B: (And (Patient $e0 $x0) (Time $e0 night))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200662 ~ p200900   cosine 0.8948 (seeds 5/5 >= 0.85)   records 14 / 11 / 11   norms 1.21 / 1.09   gate: PASS
;;   A: (Before $e0 $e1)   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200662 ~ p200935   cosine 0.8948 (seeds 5/5 >= 0.85)   records 14 / 11 / 11   norms 1.21 / 1.09   gate: PASS
;;   A: (Before $e0 $e1)   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202892 ~ p206854   cosine 0.8940 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.97 / 0.62   gate: PASS
;;   A: (And (Member $e0 stand) (Past $e0))   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p202892 ~ p207298   cosine 0.8940 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.97 / 0.62   gate: PASS
;;   A: (And (Member $e0 stand) (Past $e0))   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202986 ~ p206854   cosine 0.8940 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.97 / 0.62   gate: PASS
;;   A: (Member $e0 stand)   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202986 ~ p207298   cosine 0.8940 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.97 / 0.62   gate: PASS
;;   A: (Member $e0 stand)   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200960 ~ p207311   cosine 0.8936 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.45 / 0.43   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-000144 tierB-000212 tierC-000079
;;   B: (And (Member $e0 work) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202865 ~ p206018   cosine 0.8928 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.52 / 0.42   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 person))   e.g. tierC-000013 tierC-000014 tierC-000121
;;   B: (And (Experiencer $e0 $x0) (Member $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202897 ~ p204852   cosine 0.8918 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.66 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202897 ~ p204859   cosine 0.8918 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.66 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202897 ~ p204893   cosine 0.8918 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.66 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202897 ~ p204903   cosine 0.8918 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.66 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202897 ~ p206038   cosine 0.8918 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.66 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202897 ~ p206043   cosine 0.8918 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.66 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200958 ~ p202893   cosine 0.8903 (seeds 5/5 >= 0.85)   records 11 / 5 / 5   norms 1.77 / 0.67   gate: PASS
;;   A: (Member $e0 study)   e.g. tierB-000203 tierB-000225 tierB-001084
;;   B: (And (Member $e0 study) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201446 ~ p202114   cosine 0.8898 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.84 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))   e.g. tierB-000063 tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201446 ~ p202137   cosine 0.8898 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.84 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))   e.g. tierB-000063 tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201478 ~ p202114   cosine 0.8898 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.84 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 build))   e.g. tierB-000063 tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201478 ~ p202137   cosine 0.8898 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.84 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 build))   e.g. tierB-000063 tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200959 ~ p202781   cosine 0.8875 (seeds 5/5 >= 0.85)   records 11 / 5 / 5   norms 1.26 / 0.75   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202881 ~ p204854   cosine 0.8858 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202881 ~ p206013   cosine 0.8858 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202881 ~ p206020   cosine 0.8858 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202881 ~ p206661   cosine 0.8858 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202881 ~ p206848   cosine 0.8858 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202881 ~ p206863   cosine 0.8858 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202202 ~ p203087   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202202 ~ p203088   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202202 ~ p203113   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202202 ~ p203730   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202202 ~ p203751   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202202 ~ p203754   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202202 ~ p204223   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202202 ~ p204299   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202202 ~ p204300   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202202 ~ p204497   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202202 ~ p204546   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202202 ~ p204746   cosine 0.8848 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.57 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202342 ~ p203111   cosine 0.8847 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.65 / 0.62   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202342 ~ p204318   cosine 0.8847 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.65 / 0.62   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202569 ~ p203111   cosine 0.8847 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.65 / 0.62   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202569 ~ p204318   cosine 0.8847 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.65 / 0.62   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p203087   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201875 ~ p203088   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p203113   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201875 ~ p203730   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p203751   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201875 ~ p203754   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p204223   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p204299   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p204300   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201875 ~ p204497   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201875 ~ p204546   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201875 ~ p204746   cosine 0.8839 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.58 / 0.49   gate: PASS
;;   A: (Member $e0 win)   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201873 ~ p204542   cosine 0.8828 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.01 / 0.98   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200861 ~ p204319   cosine 0.8821 (seeds 5/5 >= 0.85)   records 12 / 4 / 4   norms 1.54 / 0.81   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202010 ~ p202336   cosine 0.8810 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.66 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 company) (Patient $e0 $x1))   e.g. tierB-000762 tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200956 ~ p207227   cosine 0.8796 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.81 / 0.62   gate: PASS
;;   A: (In $e0 $x0)   e.g. tierC-000205 tierC-000261 tierC-000262
;;   B: (And (In $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200434 ~ p207316   cosine 0.8794 (seeds 5/5 >= 0.85)   records 20 / 3 / 3   norms 2.11 / 0.47   gate: PASS
;;   A: (Member $x0 house)   e.g. tierB-000048 tierC-000115 tierC-000116
;;   B: (And (Member $x0 house) (Member $x0 large))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200664 ~ p204496   cosine 0.8793 (seeds 4/5 >= 0.85)   records 14 / 4 / 4   norms 1.11 / 0.44   gate: PASS
;;   A: (Time $e0 now)   e.g. tierB-000144 tierB-000744 tierB-000880
;;   B: (And (Experiencer $e0 $x0) (Time $e0 now))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201088 ~ p207287   cosine 0.8791 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 1.47 / 0.47   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000704 tierB-000713 tierB-001350
;;   B: (And (Member $e0 leave) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200249 ~ p200431   cosine 0.8765 (seeds 5/5 >= 0.85)   records 32 / 20 / 20   norms 1.91 / 1.45   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000103 tierB-000138 tierB-000338
;;   B: (And (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201534 ~ p204544   cosine 0.8759 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 1.20 / 0.68   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202296 ~ p203755   cosine 0.8759 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.94 / 0.77   gate: PASS
;;   A: (Member $x0 family)   e.g. tierC-000017 tierC-000018 tierC-000121
;;   B: (And (Member $x0 family) (Member $x1 person) (Possession $x0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202296 ~ p204547   cosine 0.8759 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.94 / 0.77   gate: PASS
;;   A: (Member $x0 family)   e.g. tierC-000017 tierC-000018 tierC-000121
;;   B: (And (Member $x0 family) (Possession $x0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202221 ~ p203111   cosine 0.8754 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.73 / 0.62   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202221 ~ p204318   cosine 0.8754 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.73 / 0.62   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200434 ~ p206032   cosine 0.8751 (seeds 4/5 >= 0.85)   records 20 / 3 / 3   norms 2.11 / 0.71   gate: PASS
;;   A: (Member $x0 house)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200434 ~ p207237   cosine 0.8751 (seeds 4/5 >= 0.85)   records 20 / 3 / 3   norms 2.11 / 0.71   gate: PASS
;;   A: (Member $x0 house)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201826 ~ p204316   cosine 0.8739 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.88 / 0.68   gate: PASS
;;   A: (And (Member $e0 make) (Result $e0 $e1))   e.g. tierB-000325 tierB-001504 tierB-001594
;;   B: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201345 ~ p203082   cosine 0.8730 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 0.70 / 0.55   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412 tierC-000181
;;   B: (And (Cardinality $x0 <num>) (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201275 ~ p207312   cosine 0.8711 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 0.89 / 0.46   gate: PASS
;;   A: (Member $x0 big)   e.g. tierB-000890 tierB-001457 tierB-001831
;;   B: (And (Member $x0 big) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200739 ~ p205988   cosine 0.8709 (seeds 2/5 >= 0.85)   records 13 / 3 / 3   norms 1.68 / 0.64   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200899 ~ p201102   cosine 0.8706 (seeds 5/5 >= 0.85)   records 11 / 9 / 9   norms 0.77 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200899 ~ p201103   cosine 0.8706 (seeds 5/5 >= 0.85)   records 11 / 9 / 9   norms 0.77 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200961 ~ p205995   cosine 0.8705 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.05 / 1.09   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001773 tierB-001801 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204553 ~ p206049   cosine 0.8681 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.52   gate: PASS
;;   A: (And (Ongoing $e0) (Theme $e0 $e1))   e.g. tierB-001130 tierB-001557 tierB-001940
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201492 ~ p204319   cosine 0.8677 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 1.20 / 0.81   gate: PASS
;;   A: (And (Member $e0 take) (Theme $e0 $x0))   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201066 ~ p206827   cosine 0.8666 (seeds 4/5 >= 0.85)   records 10 / 3 / 3   norms 1.22 / 0.46   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-001563 tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201066 ~ p207221   cosine 0.8666 (seeds 4/5 >= 0.85)   records 10 / 3 / 3   norms 1.22 / 0.46   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-001563 tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200617 ~ p207219   cosine 0.8655 (seeds 4/5 >= 0.85)   records 15 / 3 / 3   norms 2.15 / 0.48   gate: PASS
;;   A: (For $e0 $x0)   e.g. tierB-000712 tierB-001786 tierB-001879
;;   B: (And (For $e0 $x0) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200863 ~ p207217   cosine 0.8654 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 1.04 / 0.41   gate: PASS
;;   A: (Member $x0 weather)   e.g. tierB-000495 tierB-000565 tierB-000748
;;   B: (And (Experiencer $e0 $x0) (Member $x0 weather))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p204827   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p204833   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p204834   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p203056 ~ p204840   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p204882   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p204883   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p206035   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p206646   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p206647   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p206656   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p206659   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p203056 ~ p206832   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p204827   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p204833   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p204834   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p204840   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p204882   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p204883   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p206035   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p206646   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p206647   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p204216 ~ p206656   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p204216 ~ p206659   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204216 ~ p206832   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p204827   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p204833   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p204834   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p204840   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204307 ~ p204882   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p204883   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p206035   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p206646   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p206647   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p206656   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204307 ~ p206659   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p204307 ~ p206832   cosine 0.8639 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.51 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201527 ~ p202202   cosine 0.8631 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.71 / 0.57   gate: PASS
;;   A: (For $e0 $e1)   e.g. tierB-000938 tierB-000962 tierC-000277
;;   B: (And (For $e0 $e1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202766 ~ p203078   cosine 0.8627 (seeds 4/5 >= 0.85)   records 5 / 4 / 4   norms 0.62 / 0.54   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierB-001773 tierC-000025
;;   B: (And (Agent $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201533 ~ p207306   cosine 0.8626 (seeds 3/5 >= 0.85)   records 8 / 3 / 3   norms 0.87 / 0.50   gate: PASS
;;   A: (Member $e0 talk)   e.g. tierB-000078 tierC-000209 tierC-000210
;;   B: (And (Member $e0 talk) (To $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200248 ~ p201063   cosine 0.8618 (seeds 3/5 >= 0.85)   records 32 / 10 / 10   norms 2.33 / 1.00   gate: PASS
;;   A: (Future $e0)   e.g. tierB-000100 tierB-000453 tierB-000930
;;   B: (And (Agent $e0 $x0) (Future $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201871 ~ p207278   cosine 0.8616 (seeds 4/5 >= 0.85)   records 7 / 3 / 3   norms 0.70 / 0.42   gate: PASS
;;   A: (Member $e0 help)   e.g. tierB-000299 tierB-000858 tierB-001094
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202214 ~ p206017   cosine 0.8574 (seeds 4/5 >= 0.85)   records 6 / 3 / 3   norms 0.91 / 0.90   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202214 ~ p206859   cosine 0.8574 (seeds 4/5 >= 0.85)   records 6 / 3 / 3   norms 0.91 / 0.90   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p204472 ~ p206812   cosine 0.8574 (seeds 4/5 >= 0.85)   records 4 / 3 / 3   norms 0.60 / 0.46   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000469 tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200326 ~ p201812   cosine 0.8563 (seeds 5/5 >= 0.85)   records 27 / 7 / 7   norms 2.34 / 0.75   gate: PASS
;;   A: (Can $e0)   e.g. tierB-000156 tierB-000556 tierB-000745
;;   B: (And (Agent $e0 $x0) (Can $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201067 ~ p202339   cosine 0.8556 (seeds 2/5 >= 0.85)   records 10 / 5 / 5   norms 0.93 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201067 ~ p202726   cosine 0.8556 (seeds 2/5 >= 0.85)   records 10 / 5 / 5   norms 0.93 / 0.59   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201273 ~ p202891   cosine 0.8554 (seeds 3/5 >= 0.85)   records 9 / 5 / 5   norms 1.25 / 0.96   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001302 tierB-001334 tierB-001753
;;   B: (And (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200547 ~ p202900   cosine 0.8531 (seeds 3/5 >= 0.85)   records 17 / 5 / 5   norms 1.91 / 1.01   gate: PASS
;;   A: (Member $x0 room)   e.g. tierB-001642 tierB-001920 tierB-001997
;;   B: (And (Member $x0 room) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201826 ~ p206852   cosine 0.8521 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.88 / 0.60   gate: PASS
;;   A: (And (Member $e0 make) (Result $e0 $e1))   e.g. tierB-000325 tierB-001754 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200653 ~ p201679   cosine 0.8519 (seeds 5/5 >= 0.85)   records 14 / 7 / 7   norms 1.32 / 1.10   gate: PASS
;;   A: (And (Possession $x0 $x1) (Theme $e0 $x0))   e.g. tierB-001836 tierB-001900 tierC-000047
;;   B: (And (Past $e0) (Possession $x0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201273 ~ p202864   cosine 0.8514 (seeds 3/5 >= 0.85)   records 9 / 5 / 5   norms 1.25 / 0.93   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001003 tierB-001334 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201477 ~ p205987   cosine 0.8512 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.99 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-001125 tierB-001245 tierB-001511
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201882 ~ p207336   cosine 0.8512 (seeds 4/5 >= 0.85)   records 7 / 3 / 3   norms 1.89 / 0.47   gate: PASS
;;   A: (Time $e0 today)   e.g. tierB-000631 tierB-000808 tierB-001762
;;   B: (And (Past $e0) (Time $e0 today))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201063 ~ p206792   cosine 0.8504 (seeds 2/5 >= 0.85)   records 10 / 3 / 3   norms 1.00 / 0.41   gate: PASS
;;   A: (And (Agent $e0 $x0) (Future $e0))   e.g. tierB-000453 tierB-001266 tierB-001626
;;   B: (And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200321 ~ p200327   cosine 1.0000 (seeds 5/5 >= 0.85)   records 27 / 27 / 27   norms 1.06 / 1.06   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200337 ~ p200339   cosine 1.0000 (seeds 5/5 >= 0.85)   records 26 / 26 / 26   norms 1.03 / 1.03   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200728 ~ p200737   cosine 1.0000 (seeds 5/5 >= 0.85)   records 13 / 13 / 13   norms 1.21 / 1.21   gate: PASS
;;   A: (And (Member $e0 build) (Patient $e0 $x0))   e.g. tierB-000063 tierB-000932 tierB-001867
;;   B: (Member $e0 build)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200785 ~ p200847   cosine 1.0000 (seeds 5/5 >= 0.85)   records 12 / 12 / 12   norms 0.82 / 0.82   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000465
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200900 ~ p200935   cosine 1.0000 (seeds 5/5 >= 0.85)   records 11 / 11 / 11   norms 1.09 / 1.09   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e0) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201102 ~ p201103   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201104 ~ p201168   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.80 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201104 ~ p201222   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.80 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201104 ~ p201245   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.80 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201105 ~ p201224   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201168 ~ p201222   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.80 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201168 ~ p201245   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.80 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201222 ~ p201245   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.80 / 0.80   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201223 ~ p201246   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Member $e0 build) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000063 tierB-000932 tierC-000045
;;   B: (And (Member $e0 build) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201247 ~ p201269   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 1.07 / 1.07   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000393 tierB-000412
;;   B: (Member $e0 kill)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p201433 ~ p201434   cosine 1.0000 (seeds 5/5 >= 0.85)   records 8 / 8 / 8   norms 1.34 / 1.34   gate: PASS
;;   A: (ConditionalProperty bicycle permitted footpath)   e.g. tierC-000317 tierC-000318 tierC-000319
;;   B: (ConditionalProperty pedestrian permitted footpath)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201433 ~ p201435   cosine 1.0000 (seeds 5/5 >= 0.85)   records 8 / 8 / 8   norms 1.34 / 1.34   gate: PASS
;;   A: (ConditionalProperty bicycle permitted footpath)   e.g. tierC-000317 tierC-000318 tierC-000319
;;   B: (Inheritance bicycle permitted) ~NEG
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201433 ~ p201436   cosine 1.0000 (seeds 5/5 >= 0.85)   records 8 / 8 / 8   norms 1.34 / 1.34   gate: PASS
;;   A: (ConditionalProperty bicycle permitted footpath)   e.g. tierC-000317 tierC-000318 tierC-000319
;;   B: (Inheritance pedestrian permitted) ~NEG
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201434 ~ p201435   cosine 1.0000 (seeds 5/5 >= 0.85)   records 8 / 8 / 8   norms 1.34 / 1.34   gate: PASS
;;   A: (ConditionalProperty pedestrian permitted footpath)   e.g. tierC-000317 tierC-000318 tierC-000319
;;   B: (Inheritance bicycle permitted) ~NEG
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201434 ~ p201436   cosine 1.0000 (seeds 5/5 >= 0.85)   records 8 / 8 / 8   norms 1.34 / 1.34   gate: PASS
;;   A: (ConditionalProperty pedestrian permitted footpath)   e.g. tierC-000317 tierC-000318 tierC-000319
;;   B: (Inheritance pedestrian permitted) ~NEG
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p201435 ~ p201436   cosine 1.0000 (seeds 5/5 >= 0.85)   records 8 / 8 / 8   norms 1.34 / 1.34   gate: PASS
;;   A: (Inheritance bicycle permitted) ~NEG   e.g. tierC-000317 tierC-000318 tierC-000319
;;   B: (Inheritance pedestrian permitted) ~NEG
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201446 ~ p201478   cosine 1.0000 (seeds 5/5 >= 0.85)   records 8 / 8 / 8   norms 0.84 / 0.84   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))   e.g. tierB-000063 tierB-001867 tierC-000045
;;   B: (And (Agent $e0 $x0) (Member $e0 build))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201481 ~ p201482   cosine 1.0000 (seeds 5/5 >= 0.85)   records 8 / 8 / 8   norms 0.88 / 0.88   gate: PASS
;;   A: (And (Agent $e0 $x0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201674 ~ p201814   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000320 tierB-000779 tierB-000838
;;   B: (And (Cardinality $x0 <num>) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201676 ~ p201771   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))   e.g. tierB-001582 tierB-001817 tierC-000001
;;   B: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201772 ~ p201824   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.96 / 0.96   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201773 ~ p201828   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 1.12 / 1.12   gate: PASS
;;   A: (And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000208 tierC-000009 tierC-000010
;;   B: (And (Member $e0 produce) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201774 ~ p201831   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.96 / 0.96   gate: PASS
;;   A: (And (Member $e0 write) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Member $e0 write) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201834 ~ p201881   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 1.22 / 1.22   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (Through $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201891 ~ p202011   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 0.95 / 0.95   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))   e.g. tierC-000017 tierC-000018 tierC-000123
;;   B: (And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202114 ~ p202137   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))   e.g. tierB-000063 tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202207 ~ p202281   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0))   e.g. tierB-000906 tierB-001568 tierB-001812
;;   B: (Member $e0 bear)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202208 ~ p202282   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (Member $e0 capture)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202213 ~ p202290   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0))   e.g. tierB-000962 tierB-001035 tierB-001595
;;   B: (Member $e0 receive)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202219 ~ p202312   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 0.58 / 0.58   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $e1))   e.g. tierB-000259 tierB-000903 tierB-001031
;;   B: (Patient $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202220 ~ p202314   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Past $e0) (Time $e0 yesterday))   e.g. tierB-000237 tierB-000327 tierB-000565
;;   B: (Time $e0 yesterday)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202333 ~ p202334   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202333 ~ p202335   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202333 ~ p202559   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202333 ~ p202724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202333 ~ p202758   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202333 ~ p202759   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202333 ~ p202851   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202334 ~ p202335   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202334 ~ p202559   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202335 ~ p202559   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202339 ~ p202726   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))   e.g. tierB-001582 tierC-000001 tierC-000158
;;   B: (And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202342 ~ p202569   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202560 ~ p202859   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.94 / 0.94   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 boy) (Past $e0))   e.g. tierB-000305 tierB-000337 tierB-000340
;;   B: (And (Agent $e0 $x0) (Member $x0 boy))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202724 ~ p202334   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202724 ~ p202335   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202724 ~ p202559   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202724 ~ p202758   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202724 ~ p202759   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202724 ~ p202851   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202725 ~ p202770   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202725 ~ p202771   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202725 ~ p202869   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202758 ~ p202334   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202758 ~ p202335   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202758 ~ p202559   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202758 ~ p202759   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202758 ~ p202851   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202759 ~ p202334   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202759 ~ p202335   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202759 ~ p202559   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202759 ~ p202851   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202761 ~ p202879   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.94 / 0.94   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1))   e.g. tierB-000584 tierC-000095 tierC-000096
;;   B: (And (Member $e0 follow) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202764 ~ p202861   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202765 ~ p202564   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.73 / 0.73   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202770 ~ p202771   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202770 ~ p202869   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202771 ~ p202869   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202775 ~ p202873   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.95 / 0.95   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202778 ~ p202885   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.08 / 1.08   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202778 ~ p202886   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.08 / 1.08   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202779 ~ p202887   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.75 / 0.75   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202782 ~ p202895   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000145 tierC-000277 tierC-000278
;;   B: (And (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202782 ~ p202896   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000145 tierC-000277 tierC-000278
;;   B: (And (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202851 ~ p202334   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202851 ~ p202335   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202851 ~ p202559   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202874 ~ p202977   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.20 / 1.20   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000454 tierB-000768
;;   B: (Member $e0 contain)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202875 ~ p202978   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.75 / 0.75   gate: PASS
;;   A: (And (Member $e0 create) (Patient $e0 $x0))   e.g. tierB-000089 tierB-000728 tierB-000863
;;   B: (Member $e0 create)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202877 ~ p202979   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Member $e0 draw) (Past $e0))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (Member $e0 draw)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202885 ~ p202886   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.08 / 1.08   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0))   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202892 ~ p202986   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.97 / 0.97   gate: PASS
;;   A: (And (Member $e0 stand) (Past $e0))   e.g. tierB-000676 tierB-000712 tierB-001299
;;   B: (Member $e0 stand)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202895 ~ p202896   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Member $e0 win) (Past $e0))   e.g. tierB-000145 tierC-000277 tierC-000278
;;   B: (And (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202902 ~ p203011   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $e1))   e.g. tierB-000176 tierB-000316 tierB-000659
;;   B: (Stimulus $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202903 ~ p203012   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.15 / 1.15   gate: PASS
;;   A: (And (Past $e0) (Time $e0 (Year <num>)))   e.g. tierB-000139 tierB-000309 tierB-000373
;;   B: (Time $e0 (Year <num>))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202905 ~ p203013   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.32 / 1.32   gate: PASS
;;   A: (And (Past $e0) (TimeAtMost $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001031
;;   B: (TimeAtMost $e0 (Year <num>))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203046 ~ p203710   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0) (Past $e1))   e.g. tierB-000688 tierC-000001 tierC-000121
;;   B: (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203046 ~ p204278   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0) (Past $e1))   e.g. tierB-000688 tierC-000001 tierC-000121
;;   B: (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203047 ~ p203048   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203047 ~ p203070   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203047 ~ p203713   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203047 ~ p203736   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203047 ~ p204502   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203047 ~ p204701   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (GroupOf $x0 view)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203048 ~ p203070   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203048 ~ p203713   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203048 ~ p203736   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203048 ~ p204502   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203048 ~ p204701   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (GroupOf $x0 view)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203056 ~ p204307   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000942 tierB-001933 tierC-000025
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203063 ~ p203064   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.55 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Past $e0))   e.g. tierC-000045 tierC-000046 tierC-000291
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203063 ~ p203716   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.55 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Past $e0))   e.g. tierC-000045 tierC-000046 tierC-000291
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203064 ~ p203716   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.55 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Patient $e0 $x1))   e.g. tierC-000045 tierC-000046 tierC-000291
;;   B: (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203066 ~ p203067   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203066 ~ p203068   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203066 ~ p203717   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203066 ~ p204222   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203066 ~ p204287   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203066 ~ p204288   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203066 ~ p204470   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203067 ~ p203068   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203067 ~ p203717   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203068 ~ p203717   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203070 ~ p203736   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203070 ~ p204502   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203070 ~ p204701   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (GroupOf $x0 view)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p203079 ~ p203080   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203079 ~ p203081   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203079 ~ p203089   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203079 ~ p203725   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203079 ~ p203731   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203079 ~ p203732   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203079 ~ p204294   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203079 ~ p204305   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203079 ~ p204499   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203079 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203079 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203079 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203080 ~ p203081   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203080 ~ p203089   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203080 ~ p203725   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203080 ~ p203731   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203080 ~ p203732   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203080 ~ p204294   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203080 ~ p204305   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203080 ~ p204499   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203080 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203080 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203080 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p203081 ~ p203089   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203081 ~ p203725   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203081 ~ p203731   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203081 ~ p203732   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203081 ~ p204305   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203081 ~ p204499   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203081 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203081 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203081 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203087 ~ p203088   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203087 ~ p203113   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203087 ~ p203730   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203087 ~ p203751   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203087 ~ p203754   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203087 ~ p204223   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203087 ~ p204299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203087 ~ p204300   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203087 ~ p204497   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203087 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203087 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203088 ~ p203113   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203088 ~ p203730   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203088 ~ p203751   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203088 ~ p203754   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203088 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203088 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203089 ~ p203731   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203089 ~ p203732   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203089 ~ p204305   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203089 ~ p204499   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203089 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203089 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203089 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203096 ~ p203740   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 find) (Member $x1 thing) (Theme $e0 $x1))   e.g. tierC-000279 tierC-000280 tierC-000313
;;   B: (And (Location $e0 $x0) (Member $x1 thing) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203111 ~ p204318   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203113 ~ p203751   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203113 ~ p203754   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203113 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203113 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203116 ~ p203759   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.77 / 0.77   gate: PASS
;;   A: (And (Member $x0 person) (Past $e0) (Possession $x1 $x0) (Theme $e0 $x1))   e.g. tierC-000047 tierC-000048 tierC-000235
;;   B: (And (Member $x0 person) (Possession $x1 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203713 ~ p203070   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203713 ~ p203736   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203713 ~ p204502   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203713 ~ p204701   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (GroupOf $x0 view)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203718 ~ p204474   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 cat) (Past $e0))   e.g. tierB-000073 tierB-000381 tierB-001183
;;   B: (And (Agent $e0 $x0) (Member $x0 cat))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203724 ~ p204483   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.82 / 0.82   gate: PASS
;;   A: (And (But $e0 $e1) (Past $e0) (Past $e1))   e.g. tierC-000161 tierC-000162 tierC-000243
;;   B: (And (But $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203724 ~ p204484   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.82 / 0.82   gate: PASS
;;   A: (And (But $e0 $e1) (Past $e0) (Past $e1))   e.g. tierC-000161 tierC-000162 tierC-000243
;;   B: (And (But $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203725 ~ p203089   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p203725 ~ p203731   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203725 ~ p203732   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203725 ~ p204305   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203725 ~ p204499   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203725 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203725 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203725 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203729 ~ p203744   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203729 ~ p203753   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203729 ~ p204493   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203729 ~ p204518   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203729 ~ p204711   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (Member $e0 bad)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203730 ~ p203113   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203730 ~ p203751   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203730 ~ p203754   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203730 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203730 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p203731 ~ p203732   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203731 ~ p204305   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203731 ~ p204499   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203731 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203731 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203731 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203732 ~ p204305   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203732 ~ p204499   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203732 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203732 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203732 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203736 ~ p204502   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203736 ~ p204701   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (GroupOf $x0 view)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203739 ~ p204510   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.92 / 0.92   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))   e.g. tierB-000047 tierB-000502 tierB-001041
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203744 ~ p203753   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203744 ~ p204518   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203744 ~ p204711   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (Member $e0 bad)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203751 ~ p203754   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203751 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203751 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203753 ~ p204711   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (Member $e0 bad)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203754 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203754 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203755 ~ p204547   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.77 / 0.77   gate: PASS
;;   A: (And (Member $x0 family) (Member $x1 person) (Possession $x0 $x1))   e.g. tierC-000017 tierC-000018 tierC-000121
;;   B: (And (Member $x0 family) (Possession $x0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203765 ~ p204550   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000409 tierB-001070 tierB-001262
;;   B: (And (Of $x0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203766 ~ p204555   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-000087 tierB-001515
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203767 ~ p204557   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1))   e.g. tierB-000196 tierB-000320 tierB-000779
;;   B: (And (Patient $e0 $x0) (SubsetOf $x0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204216 ~ p203056   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierB-001933 tierC-000025
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204216 ~ p204307   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000942 tierB-001933 tierC-000025
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204221 ~ p204284   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.72 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 kill) (Past $e0) (Patient $e0 $x1))   e.g. tierB-001197 tierB-001399 tierC-000353
;;   B: (And (Agent $e0 $x0) (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204221 ~ p204285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.72 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 kill) (Past $e0) (Patient $e0 $x1))   e.g. tierB-001197 tierB-001399 tierC-000353
;;   B: (And (Agent $e0 $x0) (Member $e0 kill) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204221 ~ p204466   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.72 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 kill) (Past $e0) (Patient $e0 $x1))   e.g. tierB-001197 tierB-001399 tierC-000353
;;   B: (And (Agent $e0 $x0) (Member $e0 kill))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204222 ~ p203067   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204222 ~ p203068   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204222 ~ p203717   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204222 ~ p204287   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204222 ~ p204288   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204222 ~ p204470   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204223 ~ p203088   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204223 ~ p203113   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204223 ~ p203730   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204223 ~ p203751   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204223 ~ p203754   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204223 ~ p204299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204223 ~ p204300   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204223 ~ p204497   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204223 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204223 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204278 ~ p203710   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0))   e.g. tierB-000688 tierC-000001 tierC-000121
;;   B: (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204282 ~ p204462   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204283 ~ p204465   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.00 / 1.00   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (And (Agent $e0 $x0) (Member $e0 jump))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204283 ~ p204530   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.00 / 1.00   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204283 ~ p204727   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.00 / 1.00   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204284 ~ p204285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.72 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 kill) (Past $e0))   e.g. tierB-001197 tierB-001399 tierC-000353
;;   B: (And (Agent $e0 $x0) (Member $e0 kill) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204284 ~ p204466   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.72 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 kill) (Past $e0))   e.g. tierB-001197 tierB-001399 tierC-000353
;;   B: (And (Agent $e0 $x0) (Member $e0 kill))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204285 ~ p204466   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.72 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 kill) (Patient $e0 $x1))   e.g. tierB-001197 tierB-001399 tierC-000353
;;   B: (And (Agent $e0 $x0) (Member $e0 kill))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204287 ~ p203067   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204287 ~ p203068   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204287 ~ p203717   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204287 ~ p204288   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204287 ~ p204470   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204288 ~ p203067   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204288 ~ p203068   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204288 ~ p203717   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204288 ~ p204470   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204289 ~ p204471   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Agent $e0 $x0) (Member $e0 swim))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204289 ~ p204540   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204292 ~ p204480   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.95 / 0.95   gate: PASS
;;   A: (And (Already $e0) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204294 ~ p203081   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204294 ~ p203089   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204294 ~ p203725   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204294 ~ p203731   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204294 ~ p203732   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204294 ~ p204305   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204294 ~ p204499   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (GroupOf $x0 child) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204294 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204294 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204294 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204295 ~ p203729   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204295 ~ p203744   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204295 ~ p203753   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204295 ~ p204491   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $e0 bad))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204295 ~ p204493   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204295 ~ p204518   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204295 ~ p204711   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (Member $e0 bad)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204299 ~ p203088   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204299 ~ p203113   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204299 ~ p203730   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204299 ~ p203751   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204299 ~ p203754   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204299 ~ p204300   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204299 ~ p204497   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204299 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204299 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Past $e0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204300 ~ p203088   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204300 ~ p203113   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204300 ~ p203730   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204300 ~ p203751   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204300 ~ p203754   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204300 ~ p204497   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $e0 win))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204300 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204300 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204301 ~ p204498   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.75 / 0.75   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204305 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204305 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204305 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204311 ~ p204519   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001568 tierC-000199 tierC-000200
;;   B: (And (Member $e0 bear) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204312 ~ p204526   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.55 / 0.55   gate: PASS
;;   A: (And (Member $e0 direct) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000010 tierC-000091 tierC-000297
;;   B: (And (Member $e0 direct) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204313 ~ p204527   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 discover) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000658 tierB-001251 tierC-000111
;;   B: (And (Member $e0 discover) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204313 ~ p204528   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 discover) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000658 tierB-001251 tierC-000111
;;   B: (And (Member $e0 discover) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204313 ~ p204721   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 discover) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000658 tierB-001251 tierC-000111
;;   B: (Member $e0 discover)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204317 ~ p204531   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Member $e0 open) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487 tierC-000285
;;   B: (And (Member $e0 open) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204465 ~ p204530   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.00 / 1.00   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204465 ~ p204727   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.00 / 1.00   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204470 ~ p203067   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204470 ~ p203068   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204470 ~ p203717   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204471 ~ p204540   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 swim))   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204483 ~ p204484   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.82 / 0.82   gate: PASS
;;   A: (And (But $e0 $e1) (Past $e0))   e.g. tierC-000161 tierC-000162 tierC-000243
;;   B: (And (But $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204491 ~ p203729   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204491 ~ p203744   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204491 ~ p203753   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204491 ~ p204493   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204491 ~ p204518   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204491 ~ p204711   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (Member $e0 bad)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204493 ~ p203744   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204493 ~ p203753   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204493 ~ p204518   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $e0 bad) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204493 ~ p204711   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (Member $e0 bad)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204497 ~ p203088   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204497 ~ p203113   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204497 ~ p203730   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204497 ~ p203751   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204497 ~ p203754   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204497 ~ p204546   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (And (Member $x0 emmy) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204497 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (For $e0 $e1) (Member $e0 win))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204499 ~ p204305   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204499 ~ p204503   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204499 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204499 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (GroupOf $x0 child) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204502 ~ p204701   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (GroupOf $x0 view) (Theme $e0 $x0))   e.g. tierC-000159 tierC-000160 tierC-000355
;;   B: (GroupOf $x0 view)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204503 ~ p204504   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Holder $e0 kristoffer) (Member $e0 have))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (And (Holder $e0 kristoffer) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204503 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Holder $e0 kristoffer) (Member $e0 have))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204504 ~ p204702   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Holder $e0 kristoffer) (Theme $e0 $x0))   e.g. tierC-000181 tierC-000182 tierC-000239
;;   B: (Holder $e0 kristoffer)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204511 ~ p204704   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.03 / 1.03   gate: PASS
;;   A: (And (Location $e0 japan) (Past $e0))   e.g. tierC-000111 tierC-000112 tierC-000121
;;   B: (Location $e0 japan)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204515 ~ p204706   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000258 tierC-000353
;;   B: (Manner $e0 directly)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204518 ~ p203753   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204518 ~ p204711   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Member $e0 bad) (Result $e1 $e0))   e.g. tierB-000748 tierB-001594 tierC-000241
;;   B: (Member $e0 bad)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204520 ~ p204713   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.22 / 1.22   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-000849
;;   B: (Member $e0 buy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204525 ~ p204720   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.57 / 0.57   gate: PASS
;;   A: (And (Member $e0 die) (Patient $e0 $x0))   e.g. tierB-000838 tierB-001967 tierC-000199
;;   B: (Member $e0 die)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204527 ~ p204528   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 discover) (Past $e0))   e.g. tierB-000658 tierB-001251 tierC-000111
;;   B: (And (Member $e0 discover) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204527 ~ p204721   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 discover) (Past $e0))   e.g. tierB-000658 tierB-001251 tierC-000111
;;   B: (Member $e0 discover)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204528 ~ p204721   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 discover) (Theme $e0 $x0))   e.g. tierB-000658 tierB-001251 tierC-000111
;;   B: (Member $e0 discover)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204530 ~ p204727   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.00 / 1.00   gate: PASS
;;   A: (And (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204532 ~ p204730   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.66 / 0.66   gate: PASS
;;   A: (And (Member $e0 pass) (Past $e0))   e.g. tierB-000649 tierB-001008 tierB-001762
;;   B: (Member $e0 pass)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204546 ~ p204746   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000277 tierC-000278 tierC-000301
;;   B: (Member $x0 emmy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204556 ~ p204788   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.23 / 1.23   gate: PASS
;;   A: (And (Past $e0) (TimeAtLeast $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (TimeAtLeast $e0 (Year <num>))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204685 ~ p204482   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.04 / 1.04   gate: PASS
;;   A: (Also appear $e0)   e.g. tierC-000050 tierC-000128 tierC-000259
;;   B: (And (Also appear $e0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204824 ~ p204875   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204824 ~ p206028   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204827 ~ p204833   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204827 ~ p204834   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204827 ~ p204840   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204827 ~ p204882   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p204827 ~ p204883   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204827 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204827 ~ p206647   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204827 ~ p206656   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204827 ~ p206659   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204827 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204833 ~ p204834   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204833 ~ p204840   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204833 ~ p204882   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204833 ~ p204883   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204833 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204833 ~ p206656   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204833 ~ p206659   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204833 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204834 ~ p204840   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204834 ~ p204882   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204834 ~ p204883   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204834 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204834 ~ p206656   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204834 ~ p206659   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204834 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204836 ~ p204837   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Past $e0))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204836 ~ p205991   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Past $e0))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204836 ~ p206654   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Past $e0))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204836 ~ p206817   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Past $e0))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204836 ~ p206818   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Past $e0))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204837 ~ p205991   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Patient $e0 $x1))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204837 ~ p206654   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Patient $e0 $x1))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204837 ~ p206817   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Patient $e0 $x1))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204837 ~ p206818   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Patient $e0 $x1))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204840 ~ p204882   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204840 ~ p204883   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204840 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204840 ~ p206659   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204840 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204843 ~ p204845   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Theme $e1 $x1) (To $e0 $e1))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e0 $x1) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204843 ~ p206004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Theme $e1 $x1) (To $e0 $e1))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e1 $x1) (To $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204843 ~ p206822   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Theme $e1 $x1) (To $e0 $e1))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e0 $x1) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204845 ~ p206004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e1) (Theme $e0 $x1) (To $e1 $e0))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e1 $x1) (To $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204845 ~ p206822   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e1) (Theme $e0 $x1) (To $e1 $e0))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e0 $x1) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204848 ~ p206008   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.57 / 0.57   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e0) (Past $e1) (Patient $e0 $x0))   e.g. tierB-000412 tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Past $e1) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204848 ~ p206823   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.57 / 0.57   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e0) (Past $e1) (Patient $e0 $x0))   e.g. tierB-000412 tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204848 ~ p207199   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.57 / 0.57   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e0) (Past $e1) (Patient $e0 $x0))   e.g. tierB-000412 tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204849 ~ p206009   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.46 / 0.46   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001348 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204852 ~ p204859   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204852 ~ p204893   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204852 ~ p204903   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204852 ~ p206038   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204852 ~ p206043   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204854 ~ p206013   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204854 ~ p206020   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204854 ~ p206661   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204854 ~ p206848   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204854 ~ p206863   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204859 ~ p204893   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204859 ~ p204903   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204859 ~ p206038   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204859 ~ p206043   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204875 ~ p206028   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000159 tierC-000160 tierC-000356
;;   B: (And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204882 ~ p204883   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204882 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204882 ~ p206659   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204882 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204883 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204883 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204893 ~ p204903   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204893 ~ p206038   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204893 ~ p206043   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204894 ~ p206039   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000199 tierC-000200 tierC-000358
;;   B: (And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204895 ~ p204896   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-001394 tierC-000025 tierC-000026
;;   B: (And (Member $e0 begin) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204895 ~ p206040   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-001394 tierC-000025 tierC-000026
;;   B: (And (Member $e0 begin) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204896 ~ p206040   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-001394 tierC-000025 tierC-000026
;;   B: (And (Member $e0 begin) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204902 ~ p206042   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204902 ~ p206856   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204902 ~ p207301   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204903 ~ p206043   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p205985 ~ p206820   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1))   e.g. tierB-000747 tierB-001920 tierB-001976
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p205991 ~ p206654   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p205991 ~ p206817   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p205991 ~ p206818   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206000 ~ p207181   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.56 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0))   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206006 ~ p207196   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Because $e0 $e1) (Past $e0) (Past $e1))   e.g. tierB-001625 tierC-000311 tierC-000312
;;   B: (And (Because $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206006 ~ p207197   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Because $e0 $e1) (Past $e0) (Past $e1))   e.g. tierB-001625 tierC-000311 tierC-000312
;;   B: (And (Because $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206006 ~ p207591   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Because $e0 $e1) (Past $e0) (Past $e1))   e.g. tierB-001625 tierC-000311 tierC-000312
;;   B: (Because $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206007 ~ p207198   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Before $e0 $e1) (Measure $e0 duration <num> year) (Past $e1))   e.g. tierB-001134 tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Measure $e0 duration <num> year))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206008 ~ p207199   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.57 / 0.57   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1) (Patient $e0 $x0))   e.g. tierB-000412 tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206013 ~ p206020   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206013 ~ p206661   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206013 ~ p206848   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206013 ~ p206863   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206015 ~ p206850   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206015 ~ p207285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206015 ~ p207286   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206017 ~ p206859   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.90 / 0.90   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206020 ~ p206661   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206020 ~ p206848   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206020 ~ p206863   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206032 ~ p207237   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206033 ~ p207681   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 sleep) (Member $x0 couch))   e.g. tierB-001003 tierC-000041 tierC-000042
;;   B: (Member $x0 couch)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206034 ~ p207235   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 bench) (Past $e0))   e.g. tierB-000305 tierC-000243 tierC-000244
;;   B: (And (Location $e0 $x0) (Member $x0 bench))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206034 ~ p207669   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 bench) (Past $e0))   e.g. tierB-000305 tierC-000243 tierC-000244
;;   B: (Member $x0 bench)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206035 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206038 ~ p204903   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206038 ~ p206043   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 bad) (Past $e1) (Result $e1 $e0))   e.g. tierB-001594 tierC-000241 tierC-000242
;;   B: (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206042 ~ p207301   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206044 ~ p207315   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.58 / 0.58   gate: PASS
;;   A: (And (Member $x0 fire) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000890 tierB-001163 tierB-001302
;;   B: (And (Member $x0 fire) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206046 ~ p207321   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.54 / 0.54   gate: PASS
;;   A: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000876 tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206047 ~ p207323   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.60 / 0.60   gate: PASS
;;   A: (And (Member $x0 song) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001156 tierC-000011 tierC-000012
;;   B: (And (Member $x0 song) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206052 ~ p207343   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.44 / 0.44   gate: PASS
;;   A: (And (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000547 tierB-001219
;;   B: (And (Recipient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206645 ~ p206793   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206645 ~ p206828   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206645 ~ p207222   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p204827   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p204833   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p204834   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p204840   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p204882   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p204883   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p206647   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p206656   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p206659   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206646 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206647 ~ p204833   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206647 ~ p204834   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206647 ~ p204840   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206647 ~ p204882   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206647 ~ p204883   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206647 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206647 ~ p206656   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206647 ~ p206659   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206647 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206651 ~ p206799   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206651 ~ p206800   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206651 ~ p206836   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206651 ~ p207159   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206651 ~ p207246   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206652 ~ p206801   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206652 ~ p206802   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206652 ~ p207161   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206653 ~ p206810   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206653 ~ p206811   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206653 ~ p206853   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206653 ~ p207170   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206653 ~ p207296   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206653 ~ p207297   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206654 ~ p206817   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0) (Patient $e0 $x1))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206654 ~ p206818   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0) (Patient $e0 $x1))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206656 ~ p204840   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206656 ~ p204882   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206656 ~ p204883   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206656 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p206656 ~ p206659   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206656 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206659 ~ p204883   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206659 ~ p206035   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206659 ~ p206832   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-000942 tierC-000025 tierC-000026
;;   B: (And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206661 ~ p206848   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206661 ~ p206863   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206793 ~ p206828   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206793 ~ p207222   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206795 ~ p207154   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (And (Agent $e0 $x0) (Goal $e0 home))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206795 ~ p207224   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (And (Goal $e0 home) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206795 ~ p207597   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (Goal $e0 home)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206799 ~ p206800   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p206799 ~ p206836   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206799 ~ p207159   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206799 ~ p207246   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206800 ~ p206836   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206800 ~ p207159   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Agent $e0 $x0) (Manner $e0 directly))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206800 ~ p207246   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206801 ~ p206802   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206801 ~ p207161   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206802 ~ p207161   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206804 ~ p207163   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.56 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 create) (Patient $e0 $x1))   e.g. tierB-000728 tierC-000025 tierC-000026
;;   B: (And (Agent $e0 $x0) (Member $e0 create))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206805 ~ p207164   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 draw) (Past $e0))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (And (Agent $e0 $x0) (Member $e0 draw))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206807 ~ p207284   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 lead) (Theme $e0 $x1))   e.g. tierB-001086 tierB-001782 tierC-000019
;;   B: (And (Member $e0 lead) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206809 ~ p207289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206810 ~ p206811   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p206810 ~ p206853   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206810 ~ p207170   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206810 ~ p207296   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206810 ~ p207297   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206811 ~ p206853   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206811 ~ p207170   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Agent $e0 $x0) (Member $e0 spend))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206811 ~ p207296   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206811 ~ p207297   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206813 ~ p205992   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206815 ~ p207309   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1))   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Member $e0 watch) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206817 ~ p206818   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 write) (Past $e0))   e.g. tierB-001962 tierC-000089 tierC-000090
;;   B: (And (Agent $e0 $x0) (Member $e0 write) (Patient $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206822 ~ p206004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e0 $x1) (To $e1 $e0))   e.g. tierB-000258 tierC-000123 tierC-000124
;;   B: (And (Agent $e0 $x0) (Theme $e1 $x1) (To $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206823 ~ p206008   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.57 / 0.57   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000412 tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Past $e1) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206823 ~ p207199   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.57 / 0.57   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000412 tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206824 ~ p207200   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1) (Patient $e1 $x0))   e.g. tierB-001134 tierB-001302 tierC-000002
;;   B: (And (Before $e0 $e1) (Patient $e1 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206825 ~ p207209   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.70 / 0.70   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (In $e0 $x1) (Past $e0))   e.g. tierB-000411 tierB-001667 tierC-000014
;;   B: (And (Experiencer $e0 $x0) (In $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206827 ~ p207221   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.46 / 0.46   gate: PASS
;;   A: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))   e.g. tierB-001563 tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206828 ~ p207222   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206829 ~ p207228   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.99 / 0.99   gate: PASS
;;   A: (And (Instrument $e0 $x0) (Member $e0 build) (Patient $e0 $x1))   e.g. tierC-000072 tierC-000213 tierC-000214
;;   B: (And (Instrument $e0 $x0) (Member $e0 build))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206836 ~ p207246   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206837 ~ p207250   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Member $e0 add) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000462 tierC-000231 tierC-000232
;;   B: (And (Member $e0 add) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206838 ~ p207257   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.14 / 1.14   gate: PASS
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206839 ~ p207258   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206841 ~ p207262   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.54 / 0.54   gate: PASS
;;   A: (And (Member $e0 compose) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001575 tierC-000131 tierC-000132
;;   B: (And (Member $e0 compose) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206841 ~ p207263   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.54 / 0.54   gate: PASS
;;   A: (And (Member $e0 compose) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001575 tierC-000131 tierC-000132
;;   B: (And (Member $e0 compose) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206841 ~ p207628   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.54 / 0.54   gate: PASS
;;   A: (And (Member $e0 compose) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001575 tierC-000131 tierC-000132
;;   B: (Member $e0 compose)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206842 ~ p207265   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.46 / 0.46   gate: PASS
;;   A: (And (Member $e0 create) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000089 tierB-000728 tierB-000863
;;   B: (And (Member $e0 create) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206843 ~ p207267   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.92 / 0.92   gate: PASS
;;   A: (And (Member $e0 design) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000119 tierC-000120 tierC-000184
;;   B: (And (Member $e0 design) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206843 ~ p207268   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.92 / 0.92   gate: PASS
;;   A: (And (Member $e0 design) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000119 tierC-000120 tierC-000184
;;   B: (And (Member $e0 design) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206843 ~ p207630   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.92 / 0.92   gate: PASS
;;   A: (And (Member $e0 design) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000119 tierC-000120 tierC-000184
;;   B: (Member $e0 design)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206844 ~ p207269   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Member $e0 die) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000838 tierC-000199 tierC-000200
;;   B: (And (Member $e0 die) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206845 ~ p207270   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.73 / 0.73   gate: PASS
;;   A: (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206845 ~ p207271   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.73 / 0.73   gate: PASS
;;   A: (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206846 ~ p207273   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.57 / 0.57   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206848 ~ p206863   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206850 ~ p207285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206850 ~ p207286   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206853 ~ p207296   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206853 ~ p207297   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206854 ~ p207298   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Member $e0 stand) (Ongoing $e0) (Past $e0))   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206855 ~ p207299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.42 / 0.42   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (And (Member $e0 stick) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206855 ~ p207300   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.42 / 0.42   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (And (Member $e0 stick) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206855 ~ p207654   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.42 / 0.42   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (Member $e0 stick)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p206856 ~ p206042   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206856 ~ p207301   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206864 ~ p207340   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.72 / 0.72   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Time $e0 night))   e.g. tierB-001894 tierC-000283 tierC-000284
;;   B: (And (Patient $e0 $x0) (Time $e0 night))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207154 ~ p207224   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (And (Goal $e0 home) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207154 ~ p207597   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (Goal $e0 home)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207159 ~ p206836   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p207159 ~ p207246   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.45 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly))   e.g. tierC-000257 tierC-000353 tierC-000354
;;   B: (And (Manner $e0 directly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207170 ~ p206853   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207170 ~ p207296   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p207170 ~ p207297   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 spend))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p207185 ~ p207186   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 david) (Ongoing $e0))   e.g. tierB-000117 tierB-000173 tierB-000827
;;   B: (And (Agent $e0 david) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207196 ~ p207197   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Because $e0 $e1) (Past $e0))   e.g. tierB-001625 tierC-000311 tierC-000312
;;   B: (And (Because $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207196 ~ p207591   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Because $e0 $e1) (Past $e0))   e.g. tierB-001625 tierC-000311 tierC-000312
;;   B: (Because $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207197 ~ p207591   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Because $e0 $e1) (Past $e1))   e.g. tierB-001625 tierC-000311 tierC-000312
;;   B: (Because $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207205 ~ p207609   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.58 / 0.58   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 way))   e.g. tierB-001985 tierC-000261 tierC-000262
;;   B: (GroupOf $x0 way)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207211 ~ p207624   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.41 / 0.41   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 beautiful))   e.g. tierB-000565 tierB-000904 tierB-001920
;;   B: (Member $e0 beautiful)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207223 ~ p207596   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Goal $e0 bed) (Member $e0 go))   e.g. tierB-000012 tierB-001418 tierB-001496
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207224 ~ p207597   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (Goal $e0 home)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207235 ~ p207669   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 bench))   e.g. tierB-000305 tierC-000243 tierC-000244
;;   B: (Member $x0 bench)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207255 ~ p207625   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.46 / 0.46   gate: PASS
;;   A: (And (Member $e0 break_out) (Past $e0))   e.g. tierB-001302 tierB-001641 tierB-001694
;;   B: (Member $e0 break_out)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207262 ~ p207263   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.54 / 0.54   gate: PASS
;;   A: (And (Member $e0 compose) (Past $e0))   e.g. tierB-001575 tierC-000131 tierC-000132
;;   B: (And (Member $e0 compose) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207262 ~ p207628   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.54 / 0.54   gate: PASS
;;   A: (And (Member $e0 compose) (Past $e0))   e.g. tierB-001575 tierC-000131 tierC-000132
;;   B: (Member $e0 compose)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207263 ~ p207628   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.54 / 0.54   gate: PASS
;;   A: (And (Member $e0 compose) (Patient $e0 $x0))   e.g. tierB-001575 tierC-000131 tierC-000132
;;   B: (Member $e0 compose)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207266 ~ p207629   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Member $e0 define) (Theme $e0 $x0))   e.g. tierB-001149 tierC-000261 tierC-000262
;;   B: (Member $e0 define)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207267 ~ p207268   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.92 / 0.92   gate: PASS
;;   A: (And (Member $e0 design) (Past $e0))   e.g. tierC-000119 tierC-000120 tierC-000184
;;   B: (And (Member $e0 design) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207267 ~ p207630   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.92 / 0.92   gate: PASS
;;   A: (And (Member $e0 design) (Past $e0))   e.g. tierC-000119 tierC-000120 tierC-000184
;;   B: (Member $e0 design)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207268 ~ p207630   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.92 / 0.92   gate: PASS
;;   A: (And (Member $e0 design) (Patient $e0 $x0))   e.g. tierC-000119 tierC-000120 tierC-000184
;;   B: (Member $e0 design)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207270 ~ p207271   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.73 / 0.73   gate: PASS
;;   A: (And (Member $e0 eat) (Past $e0))   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207283 ~ p207638   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Member $e0 influence) (Past $e0))   e.g. tierC-000257 tierC-000258 tierC-000351
;;   B: (Member $e0 influence)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207285 ~ p207286   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 0.62   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207293 ~ p207649   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Member $e0 rule) (Past $e0))   e.g. tierB-000311 tierC-000095 tierC-000096
;;   B: (Member $e0 rule)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207296 ~ p207297   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.64 / 0.64   gate: PASS
;;   A: (And (Member $e0 spend) (Past $e0))   e.g. tierB-001146 tierC-000047 tierC-000048
;;   B: (And (Member $e0 spend) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p207299 ~ p207300   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.42 / 0.42   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (And (Member $e0 stick) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207299 ~ p207654   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.42 / 0.42   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (Member $e0 stick)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207300 ~ p207654   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.42 / 0.42   gate: PASS
;;   A: (And (Member $e0 stick) (Patient $e0 $x0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (Member $e0 stick)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207303 ~ p207656   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Member $e0 suggest) (Past $e0))   e.g. tierB-000700 tierC-000017 tierC-000018
;;   B: (Member $e0 suggest)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203096 ~ p203749   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.86 / 0.63   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 find) (Member $x1 thing) (Theme $e0 $x1))   e.g. tierC-000279 tierC-000280 tierC-000313
;;   B: (And (Member $e0 find) (Member $x0 thing) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203740 ~ p203749   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.86 / 0.63   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x1 thing) (Theme $e0 $x1))   e.g. tierC-000279 tierC-000280 tierC-000313
;;   B: (And (Member $e0 find) (Member $x0 thing) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207580 ~ p207190   cosine 0.9974 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.79 / 1.21   gate: PASS
;;   A: (Agent $e0 mark)   e.g. tierB-000075 tierB-000239 tierB-000400
;;   B: (And (Agent $e0 mark) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207573 ~ p207185   cosine 0.9964 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.10 / 0.61   gate: PASS
;;   A: (Agent $e0 david)   e.g. tierB-000117 tierB-000173 tierB-000827
;;   B: (And (Agent $e0 david) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207573 ~ p207186   cosine 0.9964 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.10 / 0.61   gate: PASS
;;   A: (Agent $e0 david)   e.g. tierB-000117 tierB-000173 tierB-000827
;;   B: (And (Agent $e0 david) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204482 ~ p204517   cosine 0.9947 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.04 / 1.32   gate: PASS
;;   A: (And (Also appear $e0) (Past $e0))   e.g. tierC-000050 tierC-000128 tierC-000259
;;   B: (And (Member $e0 appear) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204685 ~ p204517   cosine 0.9947 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.04 / 1.32   gate: PASS
;;   A: (Also appear $e0)   e.g. tierC-000050 tierC-000128 tierC-000259
;;   B: (And (Member $e0 appear) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p206033 ~ p207236   cosine 0.9923 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.62 / 1.13   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 sleep) (Member $x0 couch))   e.g. tierB-001003 tierC-000041 tierC-000042
;;   B: (And (Location $e0 $x0) (Member $x0 couch))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207236 ~ p207681   cosine 0.9923 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.13 / 0.62   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 couch))   e.g. tierB-001003 tierC-000041 tierC-000042
;;   B: (Member $x0 couch)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207585 ~ p207192   cosine 0.9800 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.92 / 0.57   gate: PASS
;;   A: (Agent $e0 michael)   e.g. tierB-000252 tierB-000929 tierB-001094
;;   B: (And (Agent $e0 michael) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p207578 ~ p207188   cosine 0.9449 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.84 / 0.61   gate: PASS
;;   A: (Agent $e0 jessica)   e.g. tierB-000075 tierC-000041 tierC-000042
;;   B: (And (Agent $e0 jessica) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204476 ~ p204747   cosine 0.9372 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.06 / 0.47   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 father))   e.g. tierB-001004 tierB-001743 tierC-000123
;;   B: (Member $x0 father)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology
