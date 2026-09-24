;; FUSE-NF §4.3.5 Autoencoder Analysis — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   ae_faithful.jsonl (adopted k / beta) and ae_faithful_dial/k<k>_beta<b>.jsonl   (every pair with cosine >= 0.8, whatever the floor)
;;   ae_faithful_weights/k<k>_beta<b>_seed<s>.tsv   (one encoder weight vector per unit)
;;
;; BLOCK: bottleneck 64, sparsity beta 0.5, gate cosine >= 0.85 with norm floor init — one point of the dial; the adopted setting (k 32, beta 0.5, cosine 0.85, floor init) is
;;   ../ae_faithful.metta
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   units           out_tier_b/patterns2_faithful.jsonl: 945 rooted-subtree units of the §4.3.1 faithful view, taken as-is
;;                   (subsumed units and identical columns included — the faithful arm never pre-filters)
;;   records         out_tier_b/canonical_substrate.jsonl: 1950 records
;;   vectorisation   count of each unit's matches (variable bindings) per record, recounted with the miner's enumerator
;;                   (k = 4 atoms, 28 eligible atoms per record, surface atoms excluded, constants verbatim)
;;                   and verified against the inventory (column sums = occurrences, non-zero rows = support sets);
;;                   raw counts, no scaling: 7956 non-zero cells, 363 repeat matches beyond the first
;;   autoencoder     one hidden layer of 64 sigmoid units, linear output, tied decoder x_hat = h W + c;
;;                   init W uniform(+-sqrt(6/(F+k))), b = 0, c = the column means
;;   loss            mean over records of the squared reconstruction error summed over units + 0.0001 ||W||^2
;;                   + beta 0.5 * sum_j KL(rho 0.1 || mean activation of hidden unit j)   (beta 0 = the plain shallow AE)
;;   training        full batch, Adam lr 0.01, 10000 epochs, float32, 8 thread(s), seed 0 adopted;
;;                   seeds 0..4 retrain the same model for the stability count
;;                   this block: reconstruction 1.5795 per record, R^2 0.6451, mean activation 0.1016;
;;                   reconstruction at each tenth of the epochs: 1.8657 / 1.6782 / 1.6344 / 1.6128 / 1.5976 / 1.5894 / 1.5838 / 1.5895 / 1.5891 / 1.5801
;;   ties            cosine between the two units' encoder weight vectors (the columns of W, 64-dimensional);
;;                   gate cosine >= 0.85 (dial 0.80, 0.85, 0.90, 0.95); recording floor 0.8
;;   norm floor      a unit ENTERS the comparison at encoder-vector norm >= 0.356 (init); dial none 0.000 / median 0.380 / init 0.356;
;;                   init = the initialisation norm a*sqrt(k/3), a = sqrt(6/(F+k)) — training grew the vector beyond where it
;;                   started; median = the median unit norm; 487 of 945 units enter under this block's floor
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

;; ==================== TIED PAIRS: 921 pass the gate — exclusive 5 (shape-parallel 1 = the rules), overlapping 295, nested 443, same-records 178 — among the 446040 pairs of 945 units (487 entering); 511 pairs above the cosine gate have a side below the floor; 1778 pairs recorded in the JSONL ====================

;; [exclusive, shape-parallel]  p202418 ~ p202419   cosine 0.8700 (seeds 5/5 >= 0.85)   records 4 / 4 / 0   norms 0.45 / 0.53   gate: PASS
;;   A: (And (Can $e0) (Patient $e0 $x0))   e.g. tierB-000025 tierB-001047 tierB-000299 tierB-000319
;;   B: (And (Can $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Can $e0) (Theme $e0 $x0)) (And (Can $e0) (Patient $e0 $x0)))

;; [exclusive]  p201728 ~ p203939   cosine 0.8722 (seeds 5/5 >= 0.85)   records 5 / 3 / 0   norms 0.59 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Can $e0))   e.g. tierB-000156 tierB-000556 tierB-000299 tierB-000319
;;   B: (And (Can $e0) (Member $e0 help))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p202418 ~ p203939   cosine 0.8682 (seeds 5/5 >= 0.85)   records 4 / 3 / 0   norms 0.45 / 0.49   gate: PASS
;;   A: (And (Can $e0) (Patient $e0 $x0))   e.g. tierB-000025 tierB-001047 tierB-000299 tierB-000319
;;   B: (And (Can $e0) (Member $e0 help))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p201728 ~ p203940   cosine 0.8598 (seeds 5/5 >= 0.85)   records 5 / 3 / 0   norms 0.59 / 0.46   gate: PASS
;;   A: (And (Agent $e0 $x0) (Can $e0))   e.g. tierB-000156 tierB-000556 tierB-000299 tierB-001094
;;   B: (And (Can $e0) (Past $e0))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p202418 ~ p203940   cosine 0.8563 (seeds 5/5 >= 0.85)   records 4 / 3 / 0   norms 0.45 / 0.46   gate: PASS
;;   A: (And (Can $e0) (Patient $e0 $x0))   e.g. tierB-000025 tierB-001047 tierB-000299 tierB-001094
;;   B: (And (Can $e0) (Past $e0))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [overlapping]  p202445 ~ p202107   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202445 ~ p202458   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203939 ~ p203940   cosine 0.9952 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.49 / 0.46   gate: PASS
;;   A: (And (Can $e0) (Member $e0 help))   e.g. tierB-000299 tierB-001094
;;   B: (And (Can $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201145 ~ p201351   cosine 0.9918 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 1.05 / 0.97   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201144 ~ p201341   cosine 0.9915 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 1.00 / 0.91   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201830 ~ p202107   cosine 0.9883 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.86 / 0.83   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201830 ~ p202458   cosine 0.9883 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.86 / 0.83   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201750 ~ p201752   cosine 0.9860 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.72 / 0.71   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202302 ~ p202425   cosine 0.9855 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.70 / 0.58   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))   e.g. tierB-001891 tierB-001945
;;   B: (And (Experiencer $e0 $x0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202098 ~ p202104   cosine 0.9851 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.82 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200730 ~ p200967   cosine 0.9843 (seeds 5/5 >= 0.85)   records 10 / 8 / 7   norms 1.23 / 1.02   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201755 ~ p202423   cosine 0.9837 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.56 / 0.47   gate: PASS
;;   A: (And (Member $e0 need) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201741 ~ p201758   cosine 0.9830 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.78 / 0.79   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep))   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201741 ~ p202425   cosine 0.9822 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.78 / 0.58   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep))   e.g. tierB-001891 tierB-001945
;;   B: (And (Experiencer $e0 $x0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200973 ~ p201146   cosine 0.9817 (seeds 5/5 >= 0.85)   records 8 / 7 / 6   norms 0.93 / 0.90   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203250 ~ p203688   cosine 0.9810 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.54 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203250 ~ p204008   cosine 0.9810 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.54 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))   e.g. tierB-001125 tierB-001433
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200969 ~ p200973   cosine 0.9801 (seeds 5/5 >= 0.85)   records 8 / 8 / 6   norms 0.94 / 0.93   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201750 ~ p201751   cosine 0.9800 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.72 / 0.71   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201150 ~ p201353   cosine 0.9796 (seeds 5/5 >= 0.85)   records 7 / 6 / 4   norms 0.82 / 0.77   gate: PASS
;;   A: (And (Member $e0 take) (Past $e0))   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200969 ~ p201146   cosine 0.9778 (seeds 5/5 >= 0.85)   records 8 / 7 / 6   norms 0.94 / 0.90   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200848 ~ p200966   cosine 0.9777 (seeds 5/5 >= 0.85)   records 9 / 8 / 4   norms 1.28 / 1.12   gate: PASS
;;   A: (And (Instrument $e0 $x0) (Past $e0))   e.g. tierB-000392 tierB-001143 tierB-001429
;;   B: (And (Instrument $e0 $x0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200733 ~ p201174   cosine 0.9754 (seeds 5/5 >= 0.85)   records 10 / 7 / 5   norms 1.23 / 0.76   gate: PASS
;;   A: (And (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-000425 tierB-001487
;;   B: (Member $e0 open)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202431 ~ p202450   cosine 0.9748 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.66 / 0.65   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203712 ~ p203723   cosine 0.9746 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.53 / 0.56   gate: PASS
;;   A: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000325 tierB-001809
;;   B: (And (Ongoing $e0) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202309 ~ p203712   cosine 0.9740 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.53   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))   e.g. tierB-000325 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201354 ~ p201761   cosine 0.9728 (seeds 5/5 >= 0.85)   records 6 / 5 / 4   norms 0.85 / 0.67   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202102 ~ p203612   cosine 0.9700 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.82 / 0.83   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202432 ~ p203612   cosine 0.9700 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.82 / 0.83   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table))   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203269 ~ p203950   cosine 0.9697 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.44 / 0.42   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $x0 door))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203950 ~ p203710   cosine 0.9697 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.42 / 0.44   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 door))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203950 ~ p204004   cosine 0.9697 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.42 / 0.44   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 door))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203950 ~ p204005   cosine 0.9697 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.42 / 0.44   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 door))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202307 ~ p202308   cosine 0.9694 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.68 / 0.69   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p204357   cosine 0.9692 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.60 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773 tierB-001870
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201310 ~ p202303   cosine 0.9688 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.87 / 0.84   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201310 ~ p202102   cosine 0.9681 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.87 / 0.82   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201310 ~ p202432   cosine 0.9681 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.87 / 0.82   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200961 ~ p201732   cosine 0.9679 (seeds 5/5 >= 0.85)   records 8 / 5 / 3   norms 1.06 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201751 ~ p202308   cosine 0.9678 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.71 / 0.69   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202303 ~ p202102   cosine 0.9667 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.84 / 0.82   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202303 ~ p202432   cosine 0.9667 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.84 / 0.82   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203700 ~ p203721   cosine 0.9666 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.57 / 0.56   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201054 ~ p204023   cosine 0.9664 (seeds 5/5 >= 0.85)   records 7 / 3 / 1   norms 1.04 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))   e.g. tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201678 ~ p204223   cosine 0.9658 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.82 / 0.60   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (Agent $e0 ivan)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201753 ~ p204223   cosine 0.9658 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.82 / 0.60   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0))   e.g. tierB-000412
;;   B: (Agent $e0 ivan)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200865 ~ p200973   cosine 0.9655 (seeds 5/5 >= 0.85)   records 9 / 8 / 6   norms 1.01 / 0.93   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202099 ~ p202100   cosine 0.9654 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.45 / 0.44   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201758 ~ p202425   cosine 0.9653 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.79 / 0.58   gate: PASS
;;   A: (And (Member $e0 sleep) (Ongoing $e0))   e.g. tierB-001891 tierB-001945
;;   B: (And (Experiencer $e0 $x0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201754 ~ p203269   cosine 0.9649 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.49 / 0.44   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201754 ~ p203710   cosine 0.9649 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.49 / 0.44   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201754 ~ p204004   cosine 0.9649 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.49 / 0.44   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201754 ~ p204005   cosine 0.9649 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.49 / 0.44   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201346 ~ p201755   cosine 0.9630 (seeds 5/5 >= 0.85)   records 6 / 5 / 3   norms 0.58 / 0.56   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201147 ~ p204223   cosine 0.9622 (seeds 5/5 >= 0.85)   records 7 / 3 / 1   norms 1.00 / 0.60   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (Agent $e0 ivan)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201173 ~ p204223   cosine 0.9622 (seeds 5/5 >= 0.85)   records 7 / 3 / 1   norms 1.00 / 0.60   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000412
;;   B: (Agent $e0 ivan)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202431 ~ p203721   cosine 0.9620 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.66 / 0.56   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202296 ~ p203243   cosine 0.9614 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 1.15 / 0.91   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202404 ~ p203243   cosine 0.9614 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 1.15 / 0.91   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202415 ~ p202457   cosine 0.9612 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.65 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201346 ~ p202423   cosine 0.9607 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.58 / 0.47   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202094 ~ p203249   cosine 0.9605 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.44   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))   e.g. tierB-001125 tierB-001511
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203699 ~ p203721   cosine 0.9604 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.54 / 0.56   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201175 ~ p202425   cosine 0.9601 (seeds 5/5 >= 0.85)   records 7 / 4 / 2   norms 0.91 / 0.58   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001891 tierB-001945
;;   B: (And (Experiencer $e0 $x0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202100 ~ p202666   cosine 0.9601 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.44 / 0.40   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202100 ~ p203265   cosine 0.9601 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.44 / 0.40   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201354 ~ p202448   cosine 0.9586 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.85 / 0.92   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201752 ~ p202307   cosine 0.9584 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.71 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200507 ~ p201174   cosine 0.9581 (seeds 5/5 >= 0.85)   records 14 / 7 / 5   norms 1.43 / 0.76   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-001487
;;   B: (Member $e0 open)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201751 ~ p201752   cosine 0.9579 (seeds 5/5 >= 0.85)   records 5 / 5 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202094 ~ p203688   cosine 0.9575 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202094 ~ p204008   cosine 0.9575 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))   e.g. tierB-001125 tierB-001433
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201749 ~ p203243   cosine 0.9571 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 1.19 / 0.91   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201824 ~ p203243   cosine 0.9571 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 1.19 / 0.91   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202419 ~ p203939   cosine 0.9567 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.53 / 0.49   gate: PASS
;;   A: (And (Can $e0) (Theme $e0 $x0))   e.g. tierB-000299 tierB-000319
;;   B: (And (Can $e0) (Member $e0 help))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203960 ~ p204043   cosine 0.9556 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.82 / 0.68   gate: PASS
;;   A: (And (Goal $e0 bed) (Member $e0 go))   e.g. tierB-000012
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204043 ~ p204241   cosine 0.9556 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.68 / 0.82   gate: PASS
;;   A: (And (Past $e0) (Time $e0 night))   e.g. tierB-000012
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200866 ~ p201346   cosine 0.9549 (seeds 5/5 >= 0.85)   records 9 / 6 / 3   norms 0.66 / 0.58   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202630 ~ p203960   cosine 0.9540 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.71 / 0.82   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012
;;   B: (And (Goal $e0 bed) (Member $e0 go))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202630 ~ p204241   cosine 0.9540 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.71 / 0.82   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202094 ~ p203250   cosine 0.9529 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.54   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203939 ~ p204000   cosine 0.9529 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.49 / 0.41   gate: PASS
;;   A: (And (Can $e0) (Member $e0 help))   e.g. tierB-000299 tierB-001094
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203940 ~ p204000   cosine 0.9529 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.46 / 0.41   gate: PASS
;;   A: (And (Can $e0) (Past $e0))   e.g. tierB-000299 tierB-001094
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201728 ~ p202419   cosine 0.9528 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.59 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Can $e0))   e.g. tierB-000745 tierB-001888
;;   B: (And (Can $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p204357   cosine 0.9527 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773 tierB-001870
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202425 ~ p202454   cosine 0.9507 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.58 / 0.59   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Probably $e0))   e.g. tierB-001891 tierB-001945
;;   B: (And (Ongoing $e0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200493 ~ p202631   cosine 0.9504 (seeds 5/5 >= 0.85)   records 14 / 4 / 1   norms 1.46 / 0.80   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001275
;;   B: (Time $e0 this_year)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202450 ~ p203700   cosine 0.9500 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.65 / 0.57   gate: PASS
;;   A: (And (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200867 ~ p200961   cosine 0.9491 (seeds 5/5 >= 0.85)   records 9 / 8 / 3   norms 0.83 / 1.06   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202632 ~ p204357   cosine 0.9486 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.68 / 0.40   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203255 ~ p204357   cosine 0.9483 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 1.08 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203699 ~ p203700   cosine 0.9479 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.54 / 0.57   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200847 ~ p200853   cosine 0.9477 (seeds 5/5 >= 0.85)   records 9 / 9 / 5   norms 0.94 / 1.18   gate: PASS
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1))   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Past $e0) (Recipient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202309 ~ p203723   cosine 0.9477 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 0.56   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))   e.g. tierB-000325 tierB-001809
;;   B: (And (Ongoing $e0) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200877 ~ p202302   cosine 0.9463 (seeds 5/5 >= 0.85)   records 9 / 4 / 2   norms 0.84 / 0.70   gate: PASS
;;   A: (Probably $e0)   e.g. tierB-001891 tierB-001945
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201054 ~ p201832   cosine 0.9463 (seeds 5/5 >= 0.85)   records 7 / 5 / 1   norms 1.04 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))   e.g. tierB-001618
;;   B: (Member $e0 travel)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201754 ~ p203950   cosine 0.9447 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.49 / 0.42   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $x0 door))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201562 ~ p201563   cosine 0.9446 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.90 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202302 ~ p202454   cosine 0.9443 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.70 / 0.59   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))   e.g. tierB-001891 tierB-001945
;;   B: (And (Ongoing $e0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200733 ~ p201756   cosine 0.9425 (seeds 5/5 >= 0.85)   records 10 / 5 / 4   norms 1.23 / 0.61   gate: PASS
;;   A: (And (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200961 ~ p203688   cosine 0.9418 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 1.06 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200961 ~ p204008   cosine 0.9418 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 1.06 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-001125 tierB-001433
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201110 ~ p203697   cosine 0.9411 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 0.96 / 0.44   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201110 ~ p203958   cosine 0.9411 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 0.96 / 0.44   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202419 ~ p203940   cosine 0.9410 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.53 / 0.46   gate: PASS
;;   A: (And (Can $e0) (Theme $e0 $x0))   e.g. tierB-000299
;;   B: (And (Can $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201409 ~ p203940   cosine 0.9401 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.59 / 0.46   gate: PASS
;;   A: (Member $e0 help)   e.g. tierB-000299 tierB-001094
;;   B: (And (Can $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200970 ~ p200971   cosine 0.9399 (seeds 5/5 >= 0.85)   records 8 / 8 / 5   norms 0.94 / 0.88   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203271 ~ p203719   cosine 0.9387 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.84 / 0.48   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203719 ~ p203720   cosine 0.9387 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.48 / 0.84   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201354 ~ p203719   cosine 0.9386 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.85 / 0.48   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202098 ~ p202567   cosine 0.9377 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.82 / 0.47   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001251 tierB-001984
;;   B: (GroupOf $x0 scientist)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202098 ~ p203903   cosine 0.9374 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.82 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001251 tierB-001984
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201763 ~ p202567   cosine 0.9372 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.94 / 0.47   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001984
;;   B: (GroupOf $x0 scientist)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202632 ~ p203255   cosine 0.9370 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.68 / 1.08   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201763 ~ p203903   cosine 0.9367 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.94 / 0.45   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001984
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200877 ~ p201741   cosine 0.9358 (seeds 5/5 >= 0.85)   records 9 / 5 / 2   norms 0.84 / 0.78   gate: PASS
;;   A: (Probably $e0)   e.g. tierB-001891 tierB-001945
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201677 ~ p203706   cosine 0.9356 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.86 / 0.53   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201677 ~ p203997   cosine 0.9356 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.86 / 0.53   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200378 ~ p200865   cosine 0.9332 (seeds 5/5 >= 0.85)   records 18 / 9 / 7   norms 1.33 / 1.01   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (Member $e0 hear)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202312 ~ p203719   cosine 0.9320 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.58 / 0.48   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200962 ~ p204023   cosine 0.9314 (seeds 5/5 >= 0.85)   records 8 / 3 / 1   norms 1.25 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201253 ~ p203258   cosine 0.9308 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.82 / 0.40   gate: PASS
;;   A: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000747 tierB-001926
;;   B: (And (Agent $e0 $x0) (Member $x1 door) (Patient $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200507 ~ p201756   cosine 0.9306 (seeds 5/5 >= 0.85)   records 14 / 5 / 4   norms 1.43 / 0.61   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p202632   cosine 0.9303 (seeds 5/5 >= 0.85)   records 6 / 4 / 1   norms 1.60 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773
;;   B: (Time $e0 tonight)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201732 ~ p202094   cosine 0.9295 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.68 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200967 ~ p203697   cosine 0.9278 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 1.02 / 0.44   gate: PASS
;;   A: (And (Manner $e0 quickly) (Patient $e0 $x0))   e.g. tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200967 ~ p203958   cosine 0.9278 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 1.02 / 0.44   gate: PASS
;;   A: (And (Manner $e0 quickly) (Patient $e0 $x0))   e.g. tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201174 ~ p201253   cosine 0.9277 (seeds 5/5 >= 0.85)   records 7 / 6 / 3   norms 0.76 / 0.82   gate: PASS
;;   A: (Member $e0 open)   e.g. tierB-000056 tierB-000425 tierB-001487
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201741 ~ p202454   cosine 0.9270 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.78 / 0.59   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep))   e.g. tierB-001891 tierB-001945
;;   B: (And (Ongoing $e0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200624 ~ p201732   cosine 0.9263 (seeds 5/5 >= 0.85)   records 12 / 5 / 3   norms 1.39 / 0.68   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201145 ~ p203706   cosine 0.9248 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 1.05 / 0.53   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201145 ~ p203997   cosine 0.9248 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 1.05 / 0.53   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200378 ~ p200969   cosine 0.9221 (seeds 5/5 >= 0.85)   records 18 / 8 / 6   norms 1.33 / 0.94   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201653 ~ p202666   cosine 0.9212 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.79 / 0.40   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201653 ~ p203265   cosine 0.9212 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.79 / 0.40   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201674 ~ p202666   cosine 0.9212 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.79 / 0.40   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201674 ~ p203265   cosine 0.9212 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.79 / 0.40   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201675 ~ p202666   cosine 0.9212 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.79 / 0.40   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201675 ~ p203265   cosine 0.9212 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.79 / 0.40   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201745 ~ p202666   cosine 0.9212 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.79 / 0.40   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201745 ~ p203265   cosine 0.9212 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.79 / 0.40   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204223 ~ p203264   cosine 0.9199 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.60 / 0.43   gate: PASS
;;   A: (Agent $e0 ivan)   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204223 ~ p203937   cosine 0.9199 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.60 / 0.43   gate: PASS
;;   A: (Agent $e0 ivan)   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201309 ~ p202303   cosine 0.9183 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.89 / 0.84   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p203255   cosine 0.9181 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.61 / 1.08   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200555 ~ p202567   cosine 0.9145 (seeds 5/5 >= 0.85)   records 13 / 4 / 2   norms 1.36 / 0.47   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001251 tierB-001984
;;   B: (GroupOf $x0 scientist)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200555 ~ p203903   cosine 0.9143 (seeds 5/5 >= 0.85)   records 13 / 3 / 2   norms 1.36 / 0.45   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001251 tierB-001984
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200867 ~ p202094   cosine 0.9134 (seeds 5/5 >= 0.85)   records 9 / 4 / 2   norms 0.83 / 0.61   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200408 ~ p200996   cosine 0.9132 (seeds 5/5 >= 0.85)   records 17 / 8 / 3   norms 1.19 / 0.92   gate: PASS
;;   A: (Member $x0 house)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (Member $e0 live)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202417 ~ p204223   cosine 0.9129 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.48 / 0.60   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1))   e.g. tierB-000412
;;   B: (Agent $e0 ivan)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202554 ~ p204223   cosine 0.9129 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.48 / 0.60   gate: PASS
;;   A: (Before $e0 $e1)   e.g. tierB-000412
;;   B: (Agent $e0 ivan)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200408 ~ p201349   cosine 0.9122 (seeds 5/5 >= 0.85)   records 17 / 6 / 3   norms 1.19 / 0.76   gate: PASS
;;   A: (Member $x0 house)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201151 ~ p202450   cosine 0.9119 (seeds 5/5 >= 0.85)   records 7 / 4 / 3   norms 0.95 / 0.65   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000148 tierB-000805 tierB-000929
;;   B: (And (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200682 ~ p204357   cosine 0.9098 (seeds 5/5 >= 0.85)   records 11 / 3 / 2   norms 1.00 / 0.40   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001773 tierB-001870
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201761 ~ p202448   cosine 0.9080 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.67 / 0.92   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0))   e.g. tierB-000476 tierB-000654 tierB-001675
;;   B: (And (Member $e0 turn) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201151 ~ p202431   cosine 0.9070 (seeds 5/5 >= 0.85)   records 7 / 4 / 3   norms 0.95 / 0.66   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000148 tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200962 ~ p201832   cosine 0.9068 (seeds 5/5 >= 0.85)   records 8 / 5 / 1   norms 1.25 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierB-001618
;;   B: (Member $e0 travel)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200624 ~ p200867   cosine 0.9053 (seeds 5/5 >= 0.85)   records 12 / 9 / 3   norms 1.39 / 0.83   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (Member $e0 play)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200729 ~ p200965   cosine 0.9044 (seeds 5/5 >= 0.85)   records 10 / 8 / 3   norms 0.87 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Future $e0))   e.g. tierB-000453 tierB-001266 tierB-001626
;;   B: (And (Future $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200877 ~ p201758   cosine 0.9044 (seeds 5/5 >= 0.85)   records 9 / 5 / 2   norms 0.84 / 0.79   gate: PASS
;;   A: (Probably $e0)   e.g. tierB-001891 tierB-001945
;;   B: (And (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202104 ~ p203714   cosine 0.9024 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.78 / 0.39   gate: PASS
;;   A: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202104 ~ p204013   cosine 0.9024 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.78 / 0.39   gate: PASS
;;   A: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202665 ~ p203714   cosine 0.9021 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.66 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202665 ~ p204013   cosine 0.9021 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.66 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202445 ~ p202576   cosine 0.9017 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.83 / 0.60   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030
;;   B: (Member $e0 cry)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201409 ~ p202419   cosine 0.9016 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.59 / 0.53   gate: PASS
;;   A: (Member $e0 help)   e.g. tierB-000299 tierB-000319
;;   B: (And (Can $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202107 ~ p202576   cosine 0.9006 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.83 / 0.60   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030
;;   B: (Member $e0 cry)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202458 ~ p202576   cosine 0.9006 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.83 / 0.60   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030
;;   B: (Member $e0 cry)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201830 ~ p202576   cosine 0.8989 (seeds 5/5 >= 0.85)   records 5 / 4 / 1   norms 0.86 / 0.60   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030
;;   B: (Member $e0 cry)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201353 ~ p203913   cosine 0.8988 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.77 / 0.42   gate: PASS
;;   A: (And (Member $e0 take) (Theme $e0 $x0))   e.g. tierB-000942 tierB-000978
;;   B: (And (Agent $e0 $x0) (Member $e0 take))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201670 ~ p202315   cosine 0.8980 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.54 / 0.47   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))   e.g. tierB-000781 tierB-001693
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200361 ~ p201409   cosine 0.8978 (seeds 5/5 >= 0.85)   records 19 / 6 / 3   norms 2.05 / 0.59   gate: PASS
;;   A: (Can $e0)   e.g. tierB-000299 tierB-000319 tierB-001094
;;   B: (Member $e0 help)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201253 ~ p202103   cosine 0.8974 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.82 / 0.56   gate: PASS
;;   A: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487
;;   B: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202576 ~ p202675   cosine 0.8974 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.60 / 0.81   gate: PASS
;;   A: (Member $e0 cry)   e.g. tierB-000030
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202576 ~ p203277   cosine 0.8974 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.60 / 0.81   gate: PASS
;;   A: (Member $e0 cry)   e.g. tierB-000030
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202576 ~ p203717   cosine 0.8974 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.60 / 0.81   gate: PASS
;;   A: (Member $e0 cry)   e.g. tierB-000030
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202576 ~ p204021   cosine 0.8974 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.60 / 0.81   gate: PASS
;;   A: (Member $e0 cry)   e.g. tierB-000030
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203689 ~ p203253   cosine 0.8974 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.43 / 0.46   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203689 ~ p203690   cosine 0.8974 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.43 / 0.46   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200877 ~ p201175   cosine 0.8973 (seeds 5/5 >= 0.85)   records 9 / 7 / 2   norms 0.84 / 0.91   gate: PASS
;;   A: (Probably $e0)   e.g. tierB-001891 tierB-001945
;;   B: (Member $e0 sleep)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201816 ~ p203723   cosine 0.8964 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.37 / 0.56   gate: PASS
;;   A: (During $e0 $e1)   e.g. tierB-001809
;;   B: (And (Ongoing $e0) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202312 ~ p202448   cosine 0.8950 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.58 / 0.92   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201758 ~ p202454   cosine 0.8948 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.79 / 0.59   gate: PASS
;;   A: (And (Member $e0 sleep) (Ongoing $e0))   e.g. tierB-001891 tierB-001945
;;   B: (And (Ongoing $e0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203249 ~ p203250   cosine 0.8926 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.44 / 0.54   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))   e.g. tierB-001125
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200470 ~ p200963   cosine 0.8916 (seeds 5/5 >= 0.85)   records 15 / 8 / 7   norms 1.20 / 0.74   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201761 ~ p203271   cosine 0.8900 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.67 / 0.84   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201761 ~ p203720   cosine 0.8900 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.67 / 0.84   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201816 ~ p203712   cosine 0.8899 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.37 / 0.53   gate: PASS
;;   A: (During $e0 $e1)   e.g. tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200624 ~ p203688   cosine 0.8887 (seeds 5/5 >= 0.85)   records 12 / 3 / 2   norms 1.39 / 0.49   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200624 ~ p204008   cosine 0.8887 (seeds 5/5 >= 0.85)   records 12 / 3 / 2   norms 1.39 / 0.49   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-001125 tierB-001433
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200731 ~ p203960   cosine 0.8881 (seeds 5/5 >= 0.85)   records 10 / 3 / 2   norms 1.35 / 0.82   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000012 tierB-001418
;;   B: (And (Goal $e0 bed) (Member $e0 go))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200731 ~ p204241   cosine 0.8881 (seeds 5/5 >= 0.85)   records 10 / 3 / 2   norms 1.35 / 0.82   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000012 tierB-001418
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200361 ~ p204000   cosine 0.8873 (seeds 5/5 >= 0.85)   records 19 / 3 / 2   norms 2.05 / 0.41   gate: PASS
;;   A: (Can $e0)   e.g. tierB-000299 tierB-001094
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202312 ~ p203271   cosine 0.8864 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.58 / 0.84   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202312 ~ p203720   cosine 0.8864 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.58 / 0.84   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200833 ~ p202666   cosine 0.8863 (seeds 5/5 >= 0.85)   records 9 / 3 / 2   norms 1.16 / 0.40   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200833 ~ p203265   cosine 0.8863 (seeds 5/5 >= 0.85)   records 9 / 3 / 2   norms 1.16 / 0.40   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202297 ~ p203692   cosine 0.8856 (seeds 4/5 >= 0.85)   records 4 / 3 / 2   norms 0.78 / 0.57   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202407 ~ p203692   cosine 0.8856 (seeds 4/5 >= 0.85)   records 4 / 3 / 2   norms 0.78 / 0.57   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202440 ~ p203692   cosine 0.8856 (seeds 4/5 >= 0.85)   records 4 / 3 / 2   norms 0.78 / 0.57   gate: PASS
;;   A: (And (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202585 ~ p203692   cosine 0.8856 (seeds 4/5 >= 0.85)   records 4 / 3 / 2   norms 0.78 / 0.57   gate: PASS
;;   A: (Member $e0 jump)   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200732 ~ p202666   cosine 0.8855 (seeds 5/5 >= 0.85)   records 10 / 3 / 2   norms 1.20 / 0.40   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200732 ~ p203265   cosine 0.8855 (seeds 5/5 >= 0.85)   records 10 / 3 / 2   norms 1.20 / 0.40   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201175 ~ p202454   cosine 0.8845 (seeds 5/5 >= 0.85)   records 7 / 4 / 2   norms 0.91 / 0.59   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001891 tierB-001945
;;   B: (And (Ongoing $e0) (Probably $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201309 ~ p201310   cosine 0.8818 (seeds 5/5 >= 0.85)   records 6 / 6 / 3   norms 0.89 / 0.87   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201760 ~ p203903   cosine 0.8813 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.40 / 0.45   gate: PASS
;;   A: (And (Member $e0 study) (Ongoing $e0))   e.g. tierB-000225 tierB-001984
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203249 ~ p203688   cosine 0.8807 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.44 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))   e.g. tierB-001125
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203249 ~ p204008   cosine 0.8807 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.44 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))   e.g. tierB-001125
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200849 ~ p201149   cosine 0.8799 (seeds 5/5 >= 0.85)   records 9 / 7 / 4   norms 0.82 / 0.78   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0))   e.g. tierB-000325 tierB-001504 tierB-001594
;;   B: (And (Member $e0 make) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201760 ~ p202567   cosine 0.8799 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.40 / 0.47   gate: PASS
;;   A: (And (Member $e0 study) (Ongoing $e0))   e.g. tierB-000225 tierB-001984
;;   B: (GroupOf $x0 scientist)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202297 ~ p202415   cosine 0.8796 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 0.78 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202407 ~ p202415   cosine 0.8796 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 0.78 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202415 ~ p202440   cosine 0.8796 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 0.65 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202415 ~ p202585   cosine 0.8796 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 0.65 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200871 ~ p203714   cosine 0.8792 (seeds 4/5 >= 0.85)   records 9 / 3 / 1   norms 0.37 / 0.39   gate: PASS
;;   A: (Member $x0 car)   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200871 ~ p204013   cosine 0.8792 (seeds 4/5 >= 0.85)   records 9 / 3 / 1   norms 0.37 / 0.39   gate: PASS
;;   A: (Member $x0 car)   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201421 ~ p203700   cosine 0.8790 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.62 / 0.57   gate: PASS
;;   A: (Member $x0 sound)   e.g. tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201764 ~ p203700   cosine 0.8789 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.60 / 0.57   gate: PASS
;;   A: (And (Member $x0 sound) (Patient $e0 $x0))   e.g. tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203680 ~ p203913   cosine 0.8788 (seeds 1/5 >= 0.85)   records 3 / 3 / 1   norms 0.43 / 0.42   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2))   e.g. tierB-000942
;;   B: (And (Agent $e0 $x0) (Member $e0 take))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201309 ~ p202102   cosine 0.8777 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.89 / 0.82   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201309 ~ p202432   cosine 0.8777 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.89 / 0.82   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202297 ~ p202457   cosine 0.8771 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 0.78 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202407 ~ p202457   cosine 0.8771 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 0.78 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202440 ~ p202457   cosine 0.8771 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 0.78 / 0.66   gate: PASS
;;   A: (And (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202457 ~ p202585   cosine 0.8771 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 0.66 / 0.78   gate: PASS
;;   A: (And (Over $e0 $x0) (Past $e0))   e.g. tierB-000871 tierB-000889
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202419 ~ p204000   cosine 0.8767 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.53 / 0.41   gate: PASS
;;   A: (And (Can $e0) (Theme $e0 $x0))   e.g. tierB-000299
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201849 ~ p202297   cosine 0.8758 (seeds 4/5 >= 0.85)   records 5 / 4 / 2   norms 0.74 / 0.78   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201849 ~ p202407   cosine 0.8758 (seeds 4/5 >= 0.85)   records 5 / 4 / 2   norms 0.74 / 0.78   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889
;;   B: (And (Agent $e0 $x0) (Member $e0 jump))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201849 ~ p202440   cosine 0.8758 (seeds 4/5 >= 0.85)   records 5 / 4 / 2   norms 0.74 / 0.78   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201849 ~ p202585   cosine 0.8758 (seeds 4/5 >= 0.85)   records 5 / 4 / 2   norms 0.74 / 0.78   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200972 ~ p201356   cosine 0.8757 (seeds 2/5 >= 0.85)   records 8 / 6 / 2   norms 0.87 / 0.65   gate: PASS
;;   A: (And (Obligated $e0) (Patient $e0 $x0))   e.g. tierB-001143 tierB-001520
;;   B: (And (Obligated $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202104 ~ p202567   cosine 0.8756 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.78 / 0.47   gate: PASS
;;   A: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001251
;;   B: (GroupOf $x0 scientist)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202305 ~ p203697   cosine 0.8752 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.41 / 0.44   gate: PASS
;;   A: (And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1))   e.g. tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202305 ~ p203958   cosine 0.8752 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.41 / 0.44   gate: PASS
;;   A: (And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1))   e.g. tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202104 ~ p203903   cosine 0.8747 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.78 / 0.45   gate: PASS
;;   A: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001251
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200852 ~ p201356   cosine 0.8733 (seeds 3/5 >= 0.85)   records 9 / 6 / 2   norms 0.90 / 0.65   gate: PASS
;;   A: (And (Obligated $e0) (Theme $e0 $x0))   e.g. tierB-000080 tierB-001401
;;   B: (And (Obligated $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200667 ~ p202303   cosine 0.8721 (seeds 5/5 >= 0.85)   records 11 / 4 / 3   norms 0.93 / 0.84   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201149 ~ p203723   cosine 0.8717 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 0.78 / 0.56   gate: PASS
;;   A: (And (Member $e0 make) (Result $e0 $e1))   e.g. tierB-000325 tierB-001809
;;   B: (And (Ongoing $e0) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201731 ~ p201754   cosine 0.8713 (seeds 5/5 >= 0.85)   records 5 / 5 / 2   norms 0.36 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 leave))   e.g. tierB-000298 tierB-000747
;;   B: (And (Member $e0 leave) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202311 ~ p203913   cosine 0.8709 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.64 / 0.42   gate: PASS
;;   A: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000942
;;   B: (And (Agent $e0 $x0) (Member $e0 take))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200731 ~ p204043   cosine 0.8707 (seeds 5/5 >= 0.85)   records 10 / 3 / 1   norms 1.35 / 0.68   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000012
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201653 ~ p202099   cosine 0.8707 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.79 / 0.45   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201674 ~ p202099   cosine 0.8707 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.79 / 0.45   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201675 ~ p202099   cosine 0.8707 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.79 / 0.45   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201745 ~ p202099   cosine 0.8707 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.79 / 0.45   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201435 ~ p201570   cosine 0.8698 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.63 / 0.65   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201567 ~ p201570   cosine 0.8698 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.63 / 0.65   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201253 ~ p203950   cosine 0.8697 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.82 / 0.42   gate: PASS
;;   A: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $x0 door))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200731 ~ p202630   cosine 0.8693 (seeds 5/5 >= 0.85)   records 10 / 4 / 1   norms 1.35 / 0.71   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000012
;;   B: (Time $e0 night)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201678 ~ p202417   cosine 0.8693 (seeds 5/5 >= 0.85)   records 5 / 4 / 1   norms 0.82 / 0.48   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201678 ~ p202554   cosine 0.8693 (seeds 5/5 >= 0.85)   records 5 / 4 / 1   norms 0.82 / 0.48   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (Before $e0 $e1)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201753 ~ p202417   cosine 0.8693 (seeds 5/5 >= 0.85)   records 5 / 4 / 1   norms 0.82 / 0.48   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0))   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201753 ~ p202554   cosine 0.8693 (seeds 5/5 >= 0.85)   records 5 / 4 / 1   norms 0.82 / 0.48   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0))   e.g. tierB-000412
;;   B: (Before $e0 $e1)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p202632   cosine 0.8692 (seeds 2/5 >= 0.85)   records 4 / 4 / 1   norms 0.61 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773
;;   B: (Time $e0 tonight)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201763 ~ p203714   cosine 0.8691 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.94 / 0.39   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201763 ~ p204013   cosine 0.8691 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.94 / 0.39   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201678 ~ p203264   cosine 0.8687 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.82 / 0.43   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201678 ~ p203937   cosine 0.8687 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.82 / 0.43   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201753 ~ p203264   cosine 0.8687 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.82 / 0.43   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0))   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201753 ~ p203937   cosine 0.8687 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.82 / 0.43   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0))   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201150 ~ p203913   cosine 0.8682 (seeds 4/5 >= 0.85)   records 7 / 3 / 1   norms 0.82 / 0.42   gate: PASS
;;   A: (And (Member $e0 take) (Past $e0))   e.g. tierB-000942
;;   B: (And (Agent $e0 $x0) (Member $e0 take))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201151 ~ p203699   cosine 0.8677 (seeds 4/5 >= 0.85)   records 7 / 3 / 2   norms 0.95 / 0.54   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201764 ~ p202431   cosine 0.8658 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.60 / 0.66   gate: PASS
;;   A: (And (Member $x0 sound) (Patient $e0 $x0))   e.g. tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200555 ~ p203714   cosine 0.8656 (seeds 4/5 >= 0.85)   records 13 / 3 / 1   norms 1.36 / 0.39   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200555 ~ p204013   cosine 0.8656 (seeds 4/5 >= 0.85)   records 13 / 3 / 1   norms 1.36 / 0.39   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201421 ~ p202431   cosine 0.8655 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.62 / 0.66   gate: PASS
;;   A: (Member $x0 sound)   e.g. tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201670 ~ p201769   cosine 0.8644 (seeds 1/5 >= 0.85)   records 5 / 5 / 2   norms 0.54 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))   e.g. tierB-000781 tierB-001693
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202567 ~ p202665   cosine 0.8644 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.47 / 0.66   gate: PASS
;;   A: (GroupOf $x0 scientist)   e.g. tierB-001251
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202098 ~ p203714   cosine 0.8643 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.82 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202098 ~ p204013   cosine 0.8643 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.82 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203903 ~ p202665   cosine 0.8637 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.45 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 scientist))   e.g. tierB-001251
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201253 ~ p201756   cosine 0.8632 (seeds 4/5 >= 0.85)   records 6 / 5 / 2   norms 0.82 / 0.61   gate: PASS
;;   A: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487
;;   B: (And (Member $e0 open) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201147 ~ p203264   cosine 0.8630 (seeds 4/5 >= 0.85)   records 7 / 3 / 1   norms 1.00 / 0.43   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201147 ~ p203937   cosine 0.8630 (seeds 4/5 >= 0.85)   records 7 / 3 / 1   norms 1.00 / 0.43   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201173 ~ p203264   cosine 0.8630 (seeds 4/5 >= 0.85)   records 7 / 3 / 1   norms 1.00 / 0.43   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201173 ~ p203937   cosine 0.8630 (seeds 4/5 >= 0.85)   records 7 / 3 / 1   norms 1.00 / 0.43   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201420 ~ p201671   cosine 0.8611 (seeds 4/5 >= 0.85)   records 6 / 5 / 1   norms 0.39 / 0.99   gate: PASS
;;   A: (Member $x0 school)   e.g. tierB-000782
;;   B: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201420 ~ p201737   cosine 0.8611 (seeds 4/5 >= 0.85)   records 6 / 5 / 1   norms 0.39 / 0.99   gate: PASS
;;   A: (Member $x0 school)   e.g. tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201147 ~ p202417   cosine 0.8590 (seeds 4/5 >= 0.85)   records 7 / 4 / 1   norms 1.00 / 0.48   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201147 ~ p202554   cosine 0.8590 (seeds 4/5 >= 0.85)   records 7 / 4 / 1   norms 1.00 / 0.48   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (Before $e0 $e1)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201173 ~ p202417   cosine 0.8590 (seeds 4/5 >= 0.85)   records 7 / 4 / 1   norms 1.00 / 0.48   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000412
;;   B: (And (Before $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201173 ~ p202554   cosine 0.8590 (seeds 4/5 >= 0.85)   records 7 / 4 / 1   norms 1.00 / 0.48   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000412
;;   B: (Before $e0 $e1)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200970 ~ p202447   cosine 0.8579 (seeds 3/5 >= 0.85)   records 8 / 4 / 3   norms 0.94 / 0.61   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000117 tierB-000469 tierB-000487
;;   B: (And (Member $e0 try) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200745 ~ p203950   cosine 0.8570 (seeds 1/5 >= 0.85)   records 10 / 3 / 2   norms 0.68 / 0.42   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $x0 door))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200971 ~ p202447   cosine 0.8570 (seeds 2/5 >= 0.85)   records 8 / 4 / 2   norms 0.88 / 0.61   gate: PASS
;;   A: (And (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000117 tierB-001130
;;   B: (And (Member $e0 try) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200731 ~ p201347   cosine 0.8567 (seeds 5/5 >= 0.85)   records 10 / 6 / 5   norms 1.35 / 0.59   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200506 ~ p204043   cosine 0.8565 (seeds 2/5 >= 0.85)   records 14 / 3 / 1   norms 1.59 / 0.68   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201853 ~ p202104   cosine 0.8557 (seeds 5/5 >= 0.85)   records 5 / 4 / 1   norms 0.42 / 0.78   gate: PASS
;;   A: (Time $e0 today)   e.g. tierB-001762
;;   B: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200506 ~ p202630   cosine 0.8556 (seeds 2/5 >= 0.85)   records 14 / 4 / 1   norms 1.59 / 0.71   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012
;;   B: (Time $e0 night)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201112 ~ p201359   cosine 0.8541 (seeds 4/5 >= 0.85)   records 7 / 6 / 5   norms 0.73 / 0.67   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200868 ~ p203903   cosine 0.8508 (seeds 4/5 >= 0.85)   records 9 / 3 / 2   norms 0.49 / 0.45   gate: PASS
;;   A: (Member $e0 study)   e.g. tierB-000225 tierB-001984
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201732 ~ p203249   cosine 0.8508 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.68 / 0.44   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-001125
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201154 ~ p201420   cosine 0.8504 (seeds 3/5 >= 0.85)   records 7 / 6 / 1   norms 1.16 / 0.39   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000782
;;   B: (Member $x0 school)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201182 ~ p201420   cosine 0.8504 (seeds 3/5 >= 0.85)   records 7 / 6 / 1   norms 1.16 / 0.39   gate: PASS
;;   A: (Through $e0 $x0)   e.g. tierB-000782
;;   B: (Member $x0 school)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201743 ~ p204223   cosine 0.8503 (seeds 1/5 >= 0.85)   records 5 / 3 / 1   norms 0.89 / 0.60   gate: PASS
;;   A: (And (GroupOf $x0 person) (Patient $e0 $x0))   e.g. tierB-000412
;;   B: (Agent $e0 ivan)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202567 ~ p203903   cosine 0.9999 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.47 / 0.45   gate: PASS
;;   A: (GroupOf $x0 scientist)   e.g. tierB-000225 tierB-001251 tierB-001984
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201350 ~ p201676   cosine 0.9997 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.03 / 0.96   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201350 ~ p201747   cosine 0.9997 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.03 / 0.96   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p201676   cosine 0.9997 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.03 / 0.96   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p201747   cosine 0.9997 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.03 / 0.96   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201749 ~ p202296   cosine 0.9996 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.19 / 1.15   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201749 ~ p202404   cosine 0.9996 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.19 / 1.15   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201824 ~ p202296   cosine 0.9996 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.19 / 1.15   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201824 ~ p202404   cosine 0.9996 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.19 / 1.15   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202435 ~ p203702   cosine 0.9996 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.16 / 1.08   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202435 ~ p203984   cosine 0.9996 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.16 / 1.08   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202574 ~ p203702   cosine 0.9996 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.16 / 1.08   gate: PASS
;;   A: (Member $e0 buy)   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202574 ~ p203984   cosine 0.9996 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.16 / 1.08   gate: PASS
;;   A: (Member $e0 buy)   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201768 ~ p202459   cosine 0.9991 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.24 / 1.17   gate: PASS
;;   A: (And (Past $e0) (TimeAtMost $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (And (Past $e0) (TimeAtLeast $e0 (Year <num>)))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201768 ~ p202633   cosine 0.9991 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.24 / 1.17   gate: PASS
;;   A: (And (Past $e0) (TimeAtMost $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (TimeAtLeast $e0 (Year <num>))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201854 ~ p202459   cosine 0.9991 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.24 / 1.17   gate: PASS
;;   A: (TimeAtMost $e0 (Year <num>))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (And (Past $e0) (TimeAtLeast $e0 (Year <num>)))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201854 ~ p202633   cosine 0.9991 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.24 / 1.17   gate: PASS
;;   A: (TimeAtMost $e0 (Year <num>))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (TimeAtLeast $e0 (Year <num>))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202630 ~ p204043   cosine 0.9991 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.71 / 0.68   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012 tierB-000264 tierB-001894
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200968 ~ p201005   cosine 0.9990 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.78 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p201055   cosine 0.9990 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.78 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200968 ~ p201111   cosine 0.9990 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.78 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p201143   cosine 0.9990 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.78 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200732 ~ p200833   cosine 0.9988 (seeds 5/5 >= 0.85)   records 10 / 9 / 9   norms 1.20 / 1.16   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000162 tierB-000665 tierB-000730
;;   B: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p202308   cosine 0.9986 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.71 / 0.69   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201763 ~ p202098   cosine 0.9986 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.94 / 0.82   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200995 ~ p201138   cosine 0.9984 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.47 / 0.46   gate: PASS
;;   A: (Again $e0)   e.g. tierB-000147 tierB-000337 tierB-000588
;;   B: (And (Again $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202445 ~ p202675   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202445 ~ p203277   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202445 ~ p203717   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202445 ~ p204021   cosine 0.9984 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201341 ~ p201668   cosine 0.9983 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.91 / 0.85   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201421 ~ p201764   cosine 0.9983 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.62 / 0.60   gate: PASS
;;   A: (Member $x0 sound)   e.g. tierB-000805 tierB-000951 tierB-001384
;;   B: (And (Member $x0 sound) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200283 ~ p200323   cosine 0.9979 (seeds 5/5 >= 0.85)   records 23 / 22 / 22   norms 1.13 / 1.12   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))   e.g. tierB-000004 tierB-000362 tierB-000370
;;   B: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202104 ~ p202665   cosine 0.9979 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.78 / 0.66   gate: PASS
;;   A: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200159 ~ p200171   cosine 0.9978 (seeds 5/5 >= 0.85)   records 35 / 33 / 33   norms 1.06 / 1.04   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000066 tierB-000142 tierB-000162
;;   B: (And (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200996 ~ p201349   cosine 0.9978 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.92 / 0.76   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202107 ~ p202675   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202107 ~ p203277   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202107 ~ p203717   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202107 ~ p204021   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202458 ~ p202675   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202458 ~ p203277   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202458 ~ p203717   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202458 ~ p204021   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202303 ~ p203612   cosine 0.9976 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.84 / 0.83   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201412 ~ p201733   cosine 0.9974 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.42 / 0.39   gate: PASS
;;   A: (Member $e0 watch)   e.g. tierB-000258 tierB-000520 tierB-001205
;;   B: (And (Agent $e0 $x0) (Member $e0 watch))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201403 ~ p202403   cosine 0.9973 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.40 / 0.38   gate: PASS
;;   A: (GroupOf $x0 student)   e.g. tierB-000387 tierB-000656 tierB-000712
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 student))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201741 ~ p202302   cosine 0.9971 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.78 / 0.70   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep))   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200530 ~ p200601   cosine 0.9970 (seeds 5/5 >= 0.85)   records 13 / 12 / 12   norms 0.87 / 0.84   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))   e.g. tierB-000362 tierB-000392 tierB-000425
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200973 ~ p201312   cosine 0.9968 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.93 / 0.83   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p201354   cosine 0.9965 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 0.93 / 0.85   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201751 ~ p202307   cosine 0.9965 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.71 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p201145   cosine 0.9964 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.21 / 1.05   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000194 tierB-000609 tierB-000779
;;   B: (And (Member $e0 fall) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201351 ~ p201677   cosine 0.9962 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.97 / 0.86   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201347 ~ p201672   cosine 0.9961 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.59 / 0.54   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 go))   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202448 ~ p203271   cosine 0.9961 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.92 / 0.84   gate: PASS
;;   A: (And (Member $e0 turn) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202448 ~ p203720   cosine 0.9961 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.92 / 0.84   gate: PASS
;;   A: (And (Member $e0 turn) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p200967   cosine 0.9958 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 1.29 / 1.02   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p200968   cosine 0.9958 (seeds 5/5 >= 0.85)   records 10 / 8 / 8   norms 0.81 / 0.78   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000182
;;   B: (And (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201175 ~ p201758   cosine 0.9956 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.91 / 0.79   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001302 tierB-001334 tierB-001753
;;   B: (And (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200730 ~ p201110   cosine 0.9955 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 1.23 / 0.96   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p202445   cosine 0.9954 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.86 / 0.83   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-000125 tierB-001515
;;   B: (And (Member $e0 stop) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202313 ~ p203611   cosine 0.9953 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.49 / 0.45   gate: PASS
;;   A: (And (Ongoing $e0) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001068 tierB-001120 tierB-001961
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201154 ~ p201671   cosine 0.9952 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.16 / 0.99   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201154 ~ p201737   cosine 0.9952 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.16 / 0.99   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201182 ~ p201671   cosine 0.9952 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.16 / 0.99   gate: PASS
;;   A: (Through $e0 $x0)   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201182 ~ p201737   cosine 0.9952 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.16 / 0.99   gate: PASS
;;   A: (Through $e0 $x0)   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201145 ~ p201677   cosine 0.9949 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.05 / 0.86   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202423 ~ p203696   cosine 0.9949 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.47 / 0.43   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 need))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201743 ~ p203274   cosine 0.9946 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.89 / 0.73   gate: PASS
;;   A: (And (GroupOf $x0 person) (Patient $e0 $x0))   e.g. tierB-000196 tierB-000412 tierB-000771
;;   B: (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202436 ~ p203703   cosine 0.9943 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.43 / 0.39   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202436 ~ p203985   cosine 0.9943 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.43 / 0.39   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201005   cosine 0.9942 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.81 / 0.76   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201055   cosine 0.9942 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.81 / 0.76   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201111   cosine 0.9942 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.81 / 0.76   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201143   cosine 0.9942 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.81 / 0.76   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p201351   cosine 0.9941 (seeds 5/5 >= 0.85)   records 9 / 6 / 6   norms 1.21 / 0.97   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000609 tierB-000779
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201831 ~ p202300   cosine 0.9936 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.51   gate: PASS
;;   A: (Member $e0 swim)   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201831 ~ p202410   cosine 0.9936 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.51   gate: PASS
;;   A: (Member $e0 swim)   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Agent $e0 $x0) (Member $e0 swim))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201831 ~ p202446   cosine 0.9936 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.54 / 0.51   gate: PASS
;;   A: (Member $e0 swim)   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p201151   cosine 0.9932 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.03 / 0.95   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000148 tierB-000324 tierB-000805
;;   B: (And (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202402 ~ p203248   cosine 0.9932 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.41 / 0.37   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 boy))   e.g. tierB-001457 tierB-001530 tierB-001840
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201761 ~ p202312   cosine 0.9929 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.67 / 0.58   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0))   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202417 ~ p203264   cosine 0.9924 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.48 / 0.43   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202417 ~ p203937   cosine 0.9924 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.48 / 0.43   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202554 ~ p203264   cosine 0.9924 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.48 / 0.43   gate: PASS
;;   A: (Before $e0 $e1)   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202554 ~ p203937   cosine 0.9924 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.48 / 0.43   gate: PASS
;;   A: (Before $e0 $e1)   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200866 ~ p201755   cosine 0.9919 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.66 / 0.56   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000107 tierB-000114 tierB-000339
;;   B: (And (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p202675   cosine 0.9919 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.86 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p203277   cosine 0.9919 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.86 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p203717   cosine 0.9919 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.86 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p204021   cosine 0.9919 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.86 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200556 ~ p200846   cosine 0.9916 (seeds 5/5 >= 0.85)   records 13 / 9 / 9   norms 1.21 / 1.37   gate: PASS
;;   A: (Member $x0 person)   e.g. tierB-000316 tierB-000338 tierB-000628
;;   B: (And (Agent $e0 $x0) (Member $x0 person))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201147 ~ p201678   cosine 0.9915 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.00 / 0.82   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201147 ~ p201753   cosine 0.9915 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.00 / 0.82   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201173 ~ p201678   cosine 0.9915 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.00 / 0.82   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201173 ~ p201753   cosine 0.9915 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.00 / 0.82   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p200730   cosine 0.9914 (seeds 5/5 >= 0.85)   records 11 / 10 / 10   norms 1.29 / 1.23   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-000128
;;   B: (And (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201144 ~ p201668   cosine 0.9913 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.00 / 0.85   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201668 ~ p203608   cosine 0.9913 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.85 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201668 ~ p203677   cosine 0.9913 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.85 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201668 ~ p203698   cosine 0.9913 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.85 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201668 ~ p203959   cosine 0.9913 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.85 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201150 ~ p202311   cosine 0.9911 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.82 / 0.64   gate: PASS
;;   A: (And (Member $e0 take) (Past $e0))   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201849 ~ p202457   cosine 0.9907 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.74 / 0.66   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202099 ~ p202666   cosine 0.9906 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.45 / 0.40   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001348 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202099 ~ p203265   cosine 0.9906 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.45 / 0.40   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001348 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p201677   cosine 0.9905 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.21 / 0.86   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200865 ~ p200969   cosine 0.9903 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 1.01 / 0.94   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000176 tierB-000189 tierB-000421
;;   B: (And (Member $e0 hear) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200505 ~ p200966   cosine 0.9897 (seeds 5/5 >= 0.85)   records 14 / 8 / 8   norms 1.79 / 1.12   gate: PASS
;;   A: (Instrument $e0 $x0)   e.g. tierB-000016 tierB-000392 tierB-000733
;;   B: (And (Instrument $e0 $x0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p202308   cosine 0.9897 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.72 / 0.69   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200963 ~ p201108   cosine 0.9896 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.74 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make))   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201756 ~ p202103   cosine 0.9894 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.61 / 0.56   gate: PASS
;;   A: (And (Member $e0 open) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200505 ~ p200848   cosine 0.9893 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.79 / 1.28   gate: PASS
;;   A: (Instrument $e0 $x0)   e.g. tierB-000222 tierB-000392 tierB-000444
;;   B: (And (Instrument $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201349 ~ p203276   cosine 0.9889 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.76 / 0.52   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live))   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201349 ~ p203970   cosine 0.9889 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.76 / 0.52   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live))   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201732 ~ p203250   cosine 0.9887 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.68 / 0.54   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p202668   cosine 0.9885 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p203267   cosine 0.9885 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p203273   cosine 0.9885 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202307 ~ p203613   cosine 0.9885 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p203708   cosine 0.9885 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p203724   cosine 0.9885 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.68 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200746 ~ p201353   cosine 0.9884 (seeds 5/5 >= 0.85)   records 10 / 6 / 6   norms 1.01 / 0.77   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000252 tierB-000942 tierB-000978
;;   B: (And (Member $e0 take) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200853 ~ p201669   cosine 0.9884 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.18 / 0.66   gate: PASS
;;   A: (And (Past $e0) (Recipient $e0 $x0))   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202415 ~ p203692   cosine 0.9883 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.65 / 0.57   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202450 ~ p203699   cosine 0.9883 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.65 / 0.54   gate: PASS
;;   A: (And (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201763 ~ p202104   cosine 0.9882 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.94 / 0.78   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001168 tierB-001251 tierB-001693
;;   B: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201832 ~ p204023   cosine 0.9880 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.56 / 0.52   gate: PASS
;;   A: (Member $e0 travel)   e.g. tierB-000667 tierB-000995 tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201341 ~ p203608   cosine 0.9878 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.91 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201341 ~ p203677   cosine 0.9878 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.91 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201341 ~ p203698   cosine 0.9878 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.91 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201341 ~ p203959   cosine 0.9878 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.91 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201342 ~ p203255   cosine 0.9878 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.60 / 1.08   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773 tierB-001801 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201146 ~ p201312   cosine 0.9874 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 0.90 / 0.83   gate: PASS
;;   A: (And (Member $e0 hear) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200865 ~ p201146   cosine 0.9873 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.01 / 0.90   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200800 ~ p200938   cosine 0.9869 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200867 ~ p201732   cosine 0.9867 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.83 / 0.68   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000160 tierB-000648 tierB-001125
;;   B: (And (Agent $e0 $x0) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200506 ~ p200731   cosine 0.9865 (seeds 5/5 >= 0.85)   records 14 / 10 / 10   norms 1.59 / 1.35   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012 tierB-000115 tierB-000204
;;   B: (And (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200962 ~ p201054   cosine 0.9864 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.25 / 1.04   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierB-000248 tierB-000258 tierB-000548
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200967 ~ p201110   cosine 0.9863 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.02 / 0.96   gate: PASS
;;   A: (And (Manner $e0 quickly) (Patient $e0 $x0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200996 ~ p203276   cosine 0.9862 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.92 / 0.52   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200996 ~ p203970   cosine 0.9862 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.92 / 0.52   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201751 ~ p202668   cosine 0.9861 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201751 ~ p203267   cosine 0.9861 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201751 ~ p203273   cosine 0.9861 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201751 ~ p203613   cosine 0.9861 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201751 ~ p203708   cosine 0.9861 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201751 ~ p203724   cosine 0.9861 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200848 ~ p202306   cosine 0.9858 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 1.28 / 0.68   gate: PASS
;;   A: (And (Instrument $e0 $x0) (Past $e0))   e.g. tierB-000392 tierB-001143 tierB-001429
;;   B: (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p201110   cosine 0.9854 (seeds 5/5 >= 0.85)   records 11 / 7 / 7   norms 1.29 / 0.96   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p200971   cosine 0.9852 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 1.15 / 0.88   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p201144   cosine 0.9851 (seeds 5/5 >= 0.85)   records 12 / 7 / 7   norms 1.23 / 1.00   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000255 tierB-000277
;;   B: (And (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202450 ~ p203721   cosine 0.9851 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.65 / 0.56   gate: PASS
;;   A: (And (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805 tierB-000929
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200507 ~ p200733   cosine 0.9849 (seeds 5/5 >= 0.85)   records 14 / 10 / 10   norms 1.43 / 1.23   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200969 ~ p201312   cosine 0.9848 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.94 / 0.83   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202431 ~ p203700   cosine 0.9848 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.57   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000148 tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200833 ~ p201653   cosine 0.9842 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.16 / 0.79   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p200833 ~ p201674   cosine 0.9842 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.16 / 0.79   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200833 ~ p201675   cosine 0.9842 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.16 / 0.79   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200833 ~ p201745   cosine 0.9842 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.16 / 0.79   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201732 ~ p203688   cosine 0.9842 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.68 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201732 ~ p204008   cosine 0.9842 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.68 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201175 ~ p201741   cosine 0.9839 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.91 / 0.78   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001003 tierB-001334 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201763 ~ p202665   cosine 0.9838 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.94 / 0.66   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202098 ~ p202665   cosine 0.9838 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.82 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201755 ~ p203696   cosine 0.9835 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.56 / 0.43   gate: PASS
;;   A: (And (Member $e0 need) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200500 ~ p200830   cosine 0.9834 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.14 / 1.00   gate: PASS
;;   A: (And (Ongoing $e0) (Theme $e0 $x0))   e.g. tierB-000520 tierB-000713 tierB-000784
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200866 ~ p202423   cosine 0.9831 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 0.66 / 0.47   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000174 tierB-000339 tierB-000455
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200732 ~ p201653   cosine 0.9828 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.20 / 0.79   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200732 ~ p201674   cosine 0.9828 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.20 / 0.79   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200732 ~ p201675   cosine 0.9828 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.20 / 0.79   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200732 ~ p201745   cosine 0.9828 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.20 / 0.79   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p202307   cosine 0.9827 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.72 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200508 ~ p200847   cosine 0.9826 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.51 / 0.94   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000485 tierB-000715 tierB-000769
;;   B: (And (Agent $e0 $x0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202431 ~ p203699   cosine 0.9825 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.54   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201758 ~ p202302   cosine 0.9818 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.79 / 0.70   gate: PASS
;;   A: (And (Member $e0 sleep) (Ongoing $e0))   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200555 ~ p201763   cosine 0.9817 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 1.36 / 0.94   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001168 tierB-001251 tierB-001693
;;   B: (And (Member $x0 new) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200877 ~ p202454   cosine 0.9813 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 0.84 / 0.59   gate: PASS
;;   A: (Probably $e0)   e.g. tierB-000517 tierB-001891 tierB-001910
;;   B: (And (Ongoing $e0) (Probably $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202308 ~ p202668   cosine 0.9813 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203267   cosine 0.9813 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203273   cosine 0.9813 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202308 ~ p203613   cosine 0.9813 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203708   cosine 0.9813 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203724   cosine 0.9813 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200508 ~ p200853   cosine 0.9807 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.51 / 1.18   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000150 tierB-000769 tierB-000775
;;   B: (And (Past $e0) (Recipient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p201761   cosine 0.9801 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.93 / 0.67   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201764 ~ p202105   cosine 0.9797 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.60 / 0.48   gate: PASS
;;   A: (And (Member $x0 sound) (Patient $e0 $x0))   e.g. tierB-000805 tierB-001384 tierB-001894
;;   B: (And (Member $x0 sound) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201350 ~ p203610   cosine 0.9795 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201350 ~ p203683   cosine 0.9795 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201350 ~ p203684   cosine 0.9795 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201350 ~ p203907   cosine 0.9795 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p203610   cosine 0.9795 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.70   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p203683   cosine 0.9795 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.70   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p203684   cosine 0.9795 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.70   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p203907   cosine 0.9795 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.70   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201353 ~ p202311   cosine 0.9794 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.77 / 0.64   gate: PASS
;;   A: (And (Member $e0 take) (Theme $e0 $x0))   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201175 ~ p202302   cosine 0.9792 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.91 / 0.70   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200867 ~ p203250   cosine 0.9790 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 0.83 / 0.54   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201174 ~ p201756   cosine 0.9789 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.76 / 0.61   gate: PASS
;;   A: (Member $e0 open)   e.g. tierB-000056 tierB-000302 tierB-001487
;;   B: (And (Member $e0 open) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200555 ~ p202098   cosine 0.9787 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 1.36 / 0.82   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201409 ~ p204000   cosine 0.9786 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.59 / 0.41   gate: PASS
;;   A: (Member $e0 help)   e.g. tierB-000299 tierB-000858 tierB-001094
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201174 ~ p202103   cosine 0.9783 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.76 / 0.56   gate: PASS
;;   A: (Member $e0 open)   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200975 ~ p201313   cosine 0.9782 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.68 / 0.60   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000103 tierB-000338 tierB-000725
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202433 ~ p203251   cosine 0.9782 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.45 / 0.41   gate: PASS
;;   A: (And (Location $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000942 tierB-001283 tierB-001933
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201676 ~ p203907   cosine 0.9778 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.96 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201676 ~ p203610   cosine 0.9777 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.96 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201676 ~ p203683   cosine 0.9777 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.96 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201676 ~ p203684   cosine 0.9777 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.96 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201747 ~ p203610   cosine 0.9777 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.96 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201747 ~ p203683   cosine 0.9777 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.96 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201747 ~ p203684   cosine 0.9777 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.96 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201747 ~ p203907   cosine 0.9777 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.96 / 0.70   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201849 ~ p202415   cosine 0.9777 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.74 / 0.65   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889 tierB-001205
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200733 ~ p201253   cosine 0.9774 (seeds 5/5 >= 0.85)   records 10 / 6 / 6   norms 1.23 / 0.82   gate: PASS
;;   A: (And (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201421 ~ p202105   cosine 0.9774 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.62 / 0.48   gate: PASS
;;   A: (Member $x0 sound)   e.g. tierB-000805 tierB-001384 tierB-001894
;;   B: (And (Member $x0 sound) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201142 ~ p201311   cosine 0.9773 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Location $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000047 tierB-000579 tierB-000704
;;   B: (And (Location $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200938 ~ p201003   cosine 0.9770 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.67 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200938 ~ p201004   cosine 0.9770 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.67 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200746 ~ p201150   cosine 0.9768 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 1.01 / 0.82   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000252 tierB-000309 tierB-000942
;;   B: (And (Member $e0 take) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200970 ~ p201681   cosine 0.9767 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 0.94 / 0.67   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200966 ~ p202306   cosine 0.9754 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 1.12 / 0.68   gate: PASS
;;   A: (And (Instrument $e0 $x0) (Patient $e0 $x1))   e.g. tierB-000392 tierB-001143 tierB-001429
;;   B: (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201354 ~ p202312   cosine 0.9752 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.85 / 0.58   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200361 ~ p202419   cosine 0.9748 (seeds 5/5 >= 0.85)   records 19 / 4 / 4   norms 2.05 / 0.53   gate: PASS
;;   A: (Can $e0)   e.g. tierB-000299 tierB-000319 tierB-000745
;;   B: (And (Can $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201144 ~ p203608   cosine 0.9748 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.00 / 0.61   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201144 ~ p203677   cosine 0.9748 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.00 / 0.61   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201144 ~ p203698   cosine 0.9748 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.00 / 0.61   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201144 ~ p203959   cosine 0.9748 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.00 / 0.61   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201570 ~ p201869   cosine 0.9741 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.65 / 0.59   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201570 ~ p202310   cosine 0.9741 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.65 / 0.59   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202411 ~ p203253   cosine 0.9738 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.54 / 0.46   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202411 ~ p203690   cosine 0.9738 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.54 / 0.46   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200508 ~ p201669   cosine 0.9730 (seeds 5/5 >= 0.85)   records 14 / 5 / 5   norms 1.51 / 0.66   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p202668   cosine 0.9729 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201750 ~ p203267   cosine 0.9729 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201750 ~ p203273   cosine 0.9729 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p203613   cosine 0.9729 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201750 ~ p203708   cosine 0.9729 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201750 ~ p203724   cosine 0.9729 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p202312   cosine 0.9728 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.93 / 0.58   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202457 ~ p203692   cosine 0.9727 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.66 / 0.57   gate: PASS
;;   A: (And (Over $e0 $x0) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200555 ~ p202104   cosine 0.9726 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 1.36 / 0.78   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001168 tierB-001251 tierB-001693
;;   B: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201310 ~ p203612   cosine 0.9726 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.87 / 0.83   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p202668   cosine 0.9725 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p203267   cosine 0.9725 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201752 ~ p203273   cosine 0.9725 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p203613   cosine 0.9725 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p203708   cosine 0.9725 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201752 ~ p203724   cosine 0.9725 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200865 ~ p201312   cosine 0.9723 (seeds 5/5 >= 0.85)   records 9 / 6 / 6   norms 1.01 / 0.83   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200505 ~ p202306   cosine 0.9718 (seeds 5/5 >= 0.85)   records 14 / 4 / 4   norms 1.79 / 0.68   gate: PASS
;;   A: (Instrument $e0 $x0)   e.g. tierB-000392 tierB-001143 tierB-001429
;;   B: (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200866 ~ p203696   cosine 0.9716 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 0.66 / 0.43   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200867 ~ p203688   cosine 0.9716 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 0.83 / 0.49   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200867 ~ p204008   cosine 0.9716 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 0.83 / 0.49   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p201570   cosine 0.9711 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.67 / 0.65   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201112 ~ p201435   cosine 0.9707 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.73 / 0.63   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p201567   cosine 0.9707 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.73 / 0.63   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201563 ~ p201866   cosine 0.9707 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.66 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200868 ~ p201760   cosine 0.9691 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.49 / 0.40   gate: PASS
;;   A: (Member $e0 study)   e.g. tierB-000203 tierB-000225 tierB-001084
;;   B: (And (Member $e0 study) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200961 ~ p203250   cosine 0.9691 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.06 / 0.54   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201849 ~ p203692   cosine 0.9686 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.57   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p200970   cosine 0.9683 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 1.15 / 0.94   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000216 tierB-000400
;;   B: (And (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200106 ~ p200140   cosine 0.9682 (seeds 5/5 >= 0.85)   records 48 / 37 / 37   norms 1.58 / 1.33   gate: PASS
;;   A: (Goal $e0 $x0)   e.g. tierB-000111 tierB-000178 tierB-000204
;;   B: (And (Goal $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200624 ~ p200961   cosine 0.9669 (seeds 5/5 >= 0.85)   records 12 / 8 / 8   norms 1.39 / 1.06   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000410 tierB-000587 tierB-000648
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200667 ~ p201309   cosine 0.9669 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 0.93 / 0.89   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-000963 tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200555 ~ p202665   cosine 0.9668 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 1.36 / 0.66   gate: PASS
;;   A: (Member $x0 new)   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201871 ~ p202674   cosine 0.9661 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.54 / 0.46   gate: PASS
;;   A: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201342 ~ p202097   cosine 0.9659 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.60 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001182 tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p201341   cosine 0.9655 (seeds 5/5 >= 0.85)   records 12 / 6 / 6   norms 1.23 / 0.91   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200361 ~ p203939   cosine 0.9653 (seeds 5/5 >= 0.85)   records 19 / 3 / 3   norms 2.05 / 0.49   gate: PASS
;;   A: (Can $e0)   e.g. tierB-000299 tierB-000319 tierB-001094
;;   B: (And (Can $e0) (Member $e0 help))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200442 ~ p200545   cosine 0.9653 (seeds 5/5 >= 0.85)   records 16 / 13 / 13   norms 0.89 / 0.84   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1))   e.g. tierB-000324 tierB-000387 tierB-000462
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201562 ~ p201866   cosine 0.9648 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.90 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200682 ~ p202097   cosine 0.9643 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 1.00 / 0.61   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001182 tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200378 ~ p201146   cosine 0.9639 (seeds 5/5 >= 0.85)   records 18 / 7 / 7   norms 1.33 / 0.90   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p202448   cosine 0.9625 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.93 / 0.92   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200846 ~ p201562   cosine 0.9622 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.37 / 0.90   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person))   e.g. tierB-000338 tierB-000747 tierB-001813
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p201668   cosine 0.9618 (seeds 5/5 >= 0.85)   records 12 / 5 / 5   norms 1.23 / 0.85   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201149 ~ p202309   cosine 0.9618 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.78 / 0.61   gate: PASS
;;   A: (And (Member $e0 make) (Result $e0 $e1))   e.g. tierB-000325 tierB-001504 tierB-001594
;;   B: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200847 ~ p201669   cosine 0.9601 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.94 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1))   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200556 ~ p201562   cosine 0.9597 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 1.21 / 0.90   gate: PASS
;;   A: (Member $x0 person)   e.g. tierB-000338 tierB-000747 tierB-001813
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200877 ~ p202425   cosine 0.9595 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 0.84 / 0.58   gate: PASS
;;   A: (Probably $e0)   e.g. tierB-000495 tierB-001521 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Probably $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200746 ~ p202311   cosine 0.9594 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 1.01 / 0.64   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200733 ~ p202103   cosine 0.9591 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 1.23 / 0.56   gate: PASS
;;   A: (And (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200232 ~ p200852   cosine 0.9588 (seeds 5/5 >= 0.85)   records 26 / 9 / 9   norms 2.35 / 0.90   gate: PASS
;;   A: (Obligated $e0)   e.g. tierB-000037 tierB-000080 tierB-000246
;;   B: (And (Obligated $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200379 ~ p200974   cosine 0.9588 (seeds 5/5 >= 0.85)   records 18 / 8 / 8   norms 1.59 / 0.91   gate: PASS
;;   A: (To $e0 $e1)   e.g. tierB-000078 tierB-000115 tierB-000147
;;   B: (And (Past $e0) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200507 ~ p201253   cosine 0.9587 (seeds 5/5 >= 0.85)   records 14 / 6 / 6   norms 1.43 / 0.82   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200682 ~ p201342   cosine 0.9584 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 1.00 / 1.60   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001182 tierB-001416 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200179 ~ p201155   cosine 0.9578 (seeds 5/5 >= 0.85)   records 32 / 7 / 7   norms 2.62 / 0.67   gate: PASS
;;   A: (Possession $x0 $x1)   e.g. tierB-000246 tierB-000423 tierB-000722
;;   B: (And (Possession $x0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201769 ~ p202315   cosine 0.9574 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.55 / 0.47   gate: PASS
;;   A: (And (Source $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000781 tierB-001325 tierB-001540
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200361 ~ p203940   cosine 0.9564 (seeds 5/5 >= 0.85)   records 19 / 3 / 3   norms 2.05 / 0.46   gate: PASS
;;   A: (Can $e0)   e.g. tierB-000299 tierB-001094 tierB-001767
;;   B: (And (Can $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201346 ~ p203696   cosine 0.9561 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.58 / 0.43   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200800 ~ p201003   cosine 0.9558 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 0.67 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200800 ~ p201004   cosine 0.9558 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 0.67 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202448 ~ p203719   cosine 0.9551 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.92 / 0.48   gate: PASS
;;   A: (And (Member $e0 turn) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654 tierB-001675
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p201754   cosine 0.9549 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 0.68 / 0.49   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000298 tierB-000425 tierB-000704
;;   B: (And (Member $e0 leave) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201354 ~ p203271   cosine 0.9548 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.85 / 0.84   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201354 ~ p203720   cosine 0.9548 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.85 / 0.84   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201409 ~ p203939   cosine 0.9547 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.59 / 0.49   gate: PASS
;;   A: (Member $e0 help)   e.g. tierB-000299 tierB-000319 tierB-001094
;;   B: (And (Can $e0) (Member $e0 help))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200378 ~ p200973   cosine 0.9539 (seeds 5/5 >= 0.85)   records 18 / 8 / 8   norms 1.33 / 0.93   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000009 tierB-000189 tierB-000421
;;   B: (And (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201351 ~ p203706   cosine 0.9534 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.97 / 0.53   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201351 ~ p203997   cosine 0.9534 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.97 / 0.53   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201343 ~ p201670   cosine 0.9531 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.59 / 0.54   gate: PASS
;;   A: (And (Agent $e0 $x0) (Source $e0 $x1))   e.g. tierB-000338 tierB-000693 tierB-000781
;;   B: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p203719   cosine 0.9518 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.93 / 0.48   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-001675
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p203271   cosine 0.9517 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.93 / 0.84   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p203720   cosine 0.9517 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.93 / 0.84   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200378 ~ p201312   cosine 0.9512 (seeds 5/5 >= 0.85)   records 18 / 6 / 6   norms 1.33 / 0.83   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200507 ~ p202103   cosine 0.9508 (seeds 5/5 >= 0.85)   records 14 / 4 / 4   norms 1.43 / 0.56   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201761 ~ p203719   cosine 0.9506 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.67 / 0.48   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0))   e.g. tierB-000476 tierB-000654 tierB-001675
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p200359   cosine 0.9477 (seeds 5/5 >= 0.85)   records 31 / 19 / 19   norms 1.78 / 1.26   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000103 tierB-000138 tierB-000338
;;   B: (And (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200343 ~ p200423   cosine 0.9473 (seeds 5/5 >= 0.85)   records 20 / 16 / 16   norms 1.10 / 1.00   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000166 tierB-000339 tierB-000410
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201406 ~ p202436   cosine 0.9472 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.50 / 0.43   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p203721   cosine 0.9461 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.03 / 0.56   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000148 tierB-000805 tierB-000929
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p201731   cosine 0.9458 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 0.68 / 0.36   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000100 tierB-000298 tierB-000713
;;   B: (And (Agent $e0 $x0) (Member $e0 leave))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200869 ~ p201762   cosine 0.9450 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.51 / 0.43   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-000419 tierB-000867 tierB-001515
;;   B: (And (Member $e0 work) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p201869   cosine 0.9449 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.67 / 0.59   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p202310   cosine 0.9449 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.67 / 0.59   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200730 ~ p203697   cosine 0.9447 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 1.23 / 0.44   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-001563 tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200730 ~ p203958   cosine 0.9447 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 1.23 / 0.44   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-001563 tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200971 ~ p201681   cosine 0.9428 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 0.88 / 0.67   gate: PASS
;;   A: (And (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200361 ~ p201728   cosine 0.9425 (seeds 5/5 >= 0.85)   records 19 / 5 / 5   norms 2.05 / 0.59   gate: PASS
;;   A: (Can $e0)   e.g. tierB-000156 tierB-000556 tierB-000745
;;   B: (And (Agent $e0 $x0) (Can $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202447 ~ p203718   cosine 0.9425 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.61 / 0.48   gate: PASS
;;   A: (And (Member $e0 try) (Ongoing $e0))   e.g. tierB-000117 tierB-000469 tierB-000487
;;   B: (And (Member $e0 try) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p202450   cosine 0.9408 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 1.03 / 0.65   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200961 ~ p202094   cosine 0.9403 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 1.06 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-000587 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202314 ~ p202677   cosine 0.9402 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.47 / 0.44   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201736 ~ p203247   cosine 0.9385 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.43 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Result $e0 $e1))   e.g. tierB-000747 tierB-001920 tierB-001976
;;   B: (And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201736 ~ p203694   cosine 0.9385 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.43 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Result $e0 $e1))   e.g. tierB-000747 tierB-001920 tierB-001976
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p201681   cosine 0.9377 (seeds 5/5 >= 0.85)   records 11 / 5 / 5   norms 1.15 / 0.67   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p203706   cosine 0.9375 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.21 / 0.53   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p203997   cosine 0.9375 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.21 / 0.53   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201151 ~ p203721   cosine 0.9365 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.95 / 0.56   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000148 tierB-000805 tierB-000929
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200556 ~ p201563   cosine 0.9359 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 1.21 / 0.66   gate: PASS
;;   A: (Member $x0 person)   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p203608   cosine 0.9359 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 1.23 / 0.61   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p203677   cosine 0.9359 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 1.23 / 0.61   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p203698   cosine 0.9359 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 1.23 / 0.61   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p203959   cosine 0.9359 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 1.23 / 0.61   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200624 ~ p203250   cosine 0.9354 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 1.39 / 0.54   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200232 ~ p201356   cosine 0.9352 (seeds 5/5 >= 0.85)   records 26 / 6 / 6   norms 2.35 / 0.65   gate: PASS
;;   A: (Obligated $e0)   e.g. tierB-000080 tierB-000147 tierB-001143
;;   B: (And (Obligated $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201149 ~ p203712   cosine 0.9348 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.78 / 0.53   gate: PASS
;;   A: (And (Member $e0 make) (Result $e0 $e1))   e.g. tierB-000325 tierB-001754 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p203697   cosine 0.9345 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.29 / 0.44   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-001563 tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p203958   cosine 0.9345 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.29 / 0.44   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-001563 tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p202431   cosine 0.9329 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 1.03 / 0.66   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200361 ~ p202418   cosine 0.9319 (seeds 5/5 >= 0.85)   records 19 / 4 / 4   norms 2.05 / 0.45   gate: PASS
;;   A: (Can $e0)   e.g. tierB-000025 tierB-001047 tierB-001246
;;   B: (And (Can $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p203700   cosine 0.9308 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.03 / 0.57   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000148 tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201406 ~ p203703   cosine 0.9306 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.50 / 0.39   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201406 ~ p203985   cosine 0.9306 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.50 / 0.39   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200362 ~ p200499   cosine 0.9304 (seeds 5/5 >= 0.85)   records 19 / 14 / 14   norms 1.04 / 0.93   gate: PASS
;;   A: (Member $e0 start)   e.g. tierB-000043 tierB-000192 tierB-000199
;;   B: (And (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200232 ~ p200972   cosine 0.9297 (seeds 5/5 >= 0.85)   records 26 / 8 / 8   norms 2.35 / 0.87   gate: PASS
;;   A: (Obligated $e0)   e.g. tierB-000813 tierB-001143 tierB-001520
;;   B: (And (Obligated $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202442 ~ p203714   cosine 0.9285 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.48 / 0.39   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0))   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202442 ~ p204013   cosine 0.9285 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.48 / 0.39   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0))   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202590 ~ p203714   cosine 0.9285 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.48 / 0.39   gate: PASS
;;   A: (Member $e0 receive)   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202590 ~ p204013   cosine 0.9285 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.48 / 0.39   gate: PASS
;;   A: (Member $e0 receive)   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201564 ~ p201867   cosine 0.9276 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.60 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000858 tierB-000942 tierB-001697
;;   B: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201309 ~ p203612   cosine 0.9262 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.89 / 0.83   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200179 ~ p202424   cosine 0.9243 (seeds 5/5 >= 0.85)   records 32 / 4 / 4   norms 2.62 / 0.38   gate: PASS
;;   A: (Possession $x0 $x1)   e.g. tierB-000919 tierB-001384 tierB-001519
;;   B: (And (Experiencer $e0 $x0) (Possession $x0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201151 ~ p203700   cosine 0.9243 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.95 / 0.57   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000148 tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200733 ~ p203258   cosine 0.9240 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 1.23 / 0.40   gate: PASS
;;   A: (And (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000747 tierB-000950 tierB-001926
;;   B: (And (Agent $e0 $x0) (Member $x1 door) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200178 ~ p200729   cosine 0.9237 (seeds 5/5 >= 0.85)   records 32 / 10 / 10   norms 2.24 / 0.87   gate: PASS
;;   A: (Future $e0)   e.g. tierB-000100 tierB-000453 tierB-000930
;;   B: (And (Agent $e0 $x0) (Future $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200846 ~ p201563   cosine 0.9233 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.37 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201818 ~ p202402   cosine 0.9229 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.45 / 0.41   gate: PASS
;;   A: (GroupOf $x0 boy)   e.g. tierB-001316 tierB-001457 tierB-001530
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 boy))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200408 ~ p203276   cosine 0.9225 (seeds 5/5 >= 0.85)   records 17 / 3 / 3   norms 1.19 / 0.52   gate: PASS
;;   A: (Member $x0 house)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200408 ~ p203970   cosine 0.9225 (seeds 5/5 >= 0.85)   records 17 / 3 / 3   norms 1.19 / 0.52   gate: PASS
;;   A: (Member $x0 house)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200682 ~ p203255   cosine 0.9219 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.00 / 1.08   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001773 tierB-001801 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202411 ~ p203689   cosine 0.9217 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.54 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000469 tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201141 ~ p202305   cosine 0.9201 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.50 / 0.41   gate: PASS
;;   A: (And (Goal $e0 $x0) (Patient $e0 $x1))   e.g. tierB-000482 tierB-001453 tierB-001579
;;   B: (And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201818 ~ p203248   cosine 0.9201 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.45 / 0.37   gate: PASS
;;   A: (GroupOf $x0 boy)   e.g. tierB-001457 tierB-001530 tierB-001840
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200556 ~ p201866   cosine 0.9183 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 1.21 / 0.56   gate: PASS
;;   A: (Member $x0 person)   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p202447   cosine 0.9183 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 1.15 / 0.61   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000469 tierB-000487
;;   B: (And (Member $e0 try) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200178 ~ p200965   cosine 0.9164 (seeds 5/5 >= 0.85)   records 32 / 8 / 8   norms 2.24 / 0.65   gate: PASS
;;   A: (Future $e0)   e.g. tierB-000281 tierB-000453 tierB-000790
;;   B: (And (Future $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201564 ~ p203695   cosine 0.9160 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.60 / 0.47   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p203269   cosine 0.9152 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.68 / 0.44   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p203710   cosine 0.9152 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.68 / 0.44   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p204004   cosine 0.9152 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.68 / 0.44   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p204005   cosine 0.9152 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.68 / 0.44   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201178 ~ p202414   cosine 0.9136 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.40 / 0.55   gate: PASS
;;   A: (Member $x0 company)   e.g. tierB-000762 tierB-000853 tierB-001130
;;   B: (And (Agent $e0 $x0) (Member $x0 company))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200506 ~ p203960   cosine 0.9129 (seeds 5/5 >= 0.85)   records 14 / 3 / 3   norms 1.59 / 0.82   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012 tierB-001418 tierB-001496
;;   B: (And (Goal $e0 bed) (Member $e0 go))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p200506 ~ p204241   cosine 0.9129 (seeds 5/5 >= 0.85)   records 14 / 3 / 3   norms 1.59 / 0.82   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012 tierB-001418 tierB-001496
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200974 ~ p203261   cosine 0.9082 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.91 / 0.49   gate: PASS
;;   A: (And (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200974 ~ p203693   cosine 0.9082 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.91 / 0.49   gate: PASS
;;   A: (And (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200974 ~ p203924   cosine 0.9082 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.91 / 0.49   gate: PASS
;;   A: (And (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200974 ~ p203925   cosine 0.9082 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.91 / 0.49   gate: PASS
;;   A: (And (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200507 ~ p203258   cosine 0.9064 (seeds 5/5 >= 0.85)   records 14 / 3 / 3   norms 1.43 / 0.40   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000747 tierB-000950 tierB-001926
;;   B: (And (Agent $e0 $x0) (Member $x1 door) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p203699   cosine 0.9059 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.03 / 0.54   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200498 ~ p200832   cosine 0.9042 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.17 / 0.85   gate: PASS
;;   A: (And (Location $e0 $x0) (Patient $e0 $x1))   e.g. tierB-000034 tierB-000291 tierB-000383
;;   B: (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200846 ~ p201866   cosine 0.9028 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 1.37 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200584 ~ p200754   cosine 0.9026 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.80 / 0.74   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200584 ~ p200834   cosine 0.9026 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.80 / 0.74   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200611 ~ p200754   cosine 0.9026 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.80 / 0.74   gate: PASS
;;   A: (And (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200611 ~ p200834   cosine 0.9026 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.80 / 0.74   gate: PASS
;;   A: (And (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200322 ~ p200390   cosine 0.9015 (seeds 5/5 >= 0.85)   records 22 / 17 / 17   norms 0.97 / 0.96   gate: PASS
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000075 tierB-000173 tierB-000199
;;   B: (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200961 ~ p203249   cosine 0.9004 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.06 / 0.44   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-001125 tierB-001245 tierB-001511
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200970 ~ p203718   cosine 0.8979 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.94 / 0.48   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000117 tierB-000469 tierB-000487
;;   B: (And (Member $e0 try) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200850 ~ p201680   cosine 0.8971 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.76 / 0.53   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000192 tierB-000265 tierB-000654
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200624 ~ p202094   cosine 0.8962 (seeds 5/5 >= 0.85)   records 12 / 4 / 4   norms 1.39 / 0.61   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000587 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200748 ~ p202096   cosine 0.8918 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 0.64 / 0.42   gate: PASS
;;   A: (Member $x0 cat)   e.g. tierB-000073 tierB-000381 tierB-001183
;;   B: (And (Agent $e0 $x0) (Member $x0 cat) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200748 ~ p202413   cosine 0.8918 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 0.64 / 0.42   gate: PASS
;;   A: (Member $x0 cat)   e.g. tierB-000073 tierB-000381 tierB-001183
;;   B: (And (Agent $e0 $x0) (Member $x0 cat))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201400 ~ p201738   cosine 0.8918 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.50 / 0.37   gate: PASS
;;   A: (Already $e0)   e.g. tierB-000034 tierB-000218 tierB-000616
;;   B: (And (Already $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200470 ~ p201108   cosine 0.8917 (seeds 5/5 >= 0.85)   records 15 / 7 / 7   norms 1.20 / 0.72   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200178 ~ p200668   cosine 0.8913 (seeds 5/5 >= 0.85)   records 32 / 11 / 11   norms 2.24 / 0.89   gate: PASS
;;   A: (Future $e0)   e.g. tierB-000082 tierB-000108 tierB-000378
;;   B: (And (Future $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200746 ~ p203913   cosine 0.8908 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 1.01 / 0.42   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000942 tierB-000978 tierB-001726
;;   B: (And (Agent $e0 $x0) (Member $e0 take))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200499 ~ p200754   cosine 0.8905 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 0.93 / 0.74   gate: PASS
;;   A: (And (Member $e0 start) (Past $e0))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200499 ~ p200834   cosine 0.8905 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 0.93 / 0.74   gate: PASS
;;   A: (And (Member $e0 start) (Past $e0))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200667 ~ p201310   cosine 0.8900 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 0.93 / 0.87   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078 tierB-001303
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p201570   cosine 0.8891 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.73 / 0.65   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p202314   cosine 0.8881 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.67 / 0.47   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p203718   cosine 0.8867 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 1.15 / 0.48   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000469 tierB-000487
;;   B: (And (Member $e0 try) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201151 ~ p202304   cosine 0.8867 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.95 / 0.47   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201151 ~ p202427   cosine 0.8867 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.95 / 0.47   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200362 ~ p200584   cosine 0.8865 (seeds 5/5 >= 0.85)   records 19 / 12 / 12   norms 1.04 / 0.80   gate: PASS
;;   A: (Member $e0 start)   e.g. tierB-000199 tierB-000265 tierB-000465
;;   B: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200362 ~ p200611   cosine 0.8865 (seeds 5/5 >= 0.85)   records 19 / 12 / 12   norms 1.04 / 0.80   gate: PASS
;;   A: (Member $e0 start)   e.g. tierB-000199 tierB-000265 tierB-000465
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201570 ~ p202677   cosine 0.8852 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.65 / 0.44   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200449 ~ p202108   cosine 0.8840 (seeds 5/5 >= 0.85)   records 16 / 4 / 4   norms 1.29 / 0.56   gate: PASS
;;   A: (SubsetOf $x0 $x1)   e.g. tierB-000196 tierB-000320 tierB-000779
;;   B: (And (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200449 ~ p202460   cosine 0.8840 (seeds 5/5 >= 0.85)   records 16 / 4 / 4   norms 1.29 / 0.56   gate: PASS
;;   A: (SubsetOf $x0 $x1)   e.g. tierB-000196 tierB-000320 tierB-000779
;;   B: (And (Patient $e0 $x0) (SubsetOf $x0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200667 ~ p203612   cosine 0.8833 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 0.93 / 0.83   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200964 ~ p203243   cosine 0.8775 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.01 / 0.91   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000379 tierB-001266
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p201752   cosine 0.8770 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 0.93 / 0.71   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000206 tierB-000370 tierB-000748
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200171 ~ p200278   cosine 0.8757 (seeds 4/5 >= 0.85)   records 33 / 23 / 23   norms 1.04 / 0.98   gate: PASS
;;   A: (And (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p200171 ~ p200284   cosine 0.8757 (seeds 4/5 >= 0.85)   records 33 / 23 / 23   norms 1.04 / 0.98   gate: PASS
;;   A: (And (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200171 ~ p200285   cosine 0.8757 (seeds 4/5 >= 0.85)   records 33 / 23 / 23   norms 1.04 / 0.98   gate: PASS
;;   A: (And (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200171 ~ p200289   cosine 0.8757 (seeds 4/5 >= 0.85)   records 33 / 23 / 23   norms 1.04 / 0.98   gate: PASS
;;   A: (And (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201435 ~ p201869   cosine 0.8724 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201435 ~ p202310   cosine 0.8724 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201567 ~ p201869   cosine 0.8724 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201567 ~ p202310   cosine 0.8724 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.63 / 0.59   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200192 ~ p201345   cosine 0.8701 (seeds 4/5 >= 0.85)   records 30 / 6 / 6   norms 2.26 / 0.36   gate: PASS
;;   A: (GroupOf $x0 person)   e.g. tierB-000191 tierB-001160 tierB-001485
;;   B: (And (Experiencer $e0 $x0) (GroupOf $x0 person))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p202308   cosine 0.8680 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 0.93 / 0.69   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p202677   cosine 0.8675 (seeds 4/5 >= 0.85)   records 6 / 3 / 3   norms 0.67 / 0.44   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200449 ~ p201344   cosine 0.8665 (seeds 4/5 >= 0.85)   records 16 / 6 / 6   norms 1.29 / 0.66   gate: PASS
;;   A: (SubsetOf $x0 $x1)   e.g. tierB-000133 tierB-000320 tierB-000761
;;   B: (And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p201750   cosine 0.8660 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 0.93 / 0.72   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p202304   cosine 0.8653 (seeds 4/5 >= 0.85)   records 8 / 4 / 4   norms 1.03 / 0.47   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p202427   cosine 0.8653 (seeds 4/5 >= 0.85)   records 8 / 4 / 4   norms 1.03 / 0.47   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200256 ~ p200436   cosine 0.8646 (seeds 4/5 >= 0.85)   records 24 / 16 / 16   norms 1.09 / 0.87   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000470 tierB-000485 tierB-000738
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200159 ~ p200278   cosine 0.8598 (seeds 4/5 >= 0.85)   records 35 / 23 / 23   norms 1.06 / 0.98   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200159 ~ p200284   cosine 0.8598 (seeds 4/5 >= 0.85)   records 35 / 23 / 23   norms 1.06 / 0.98   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200159 ~ p200285   cosine 0.8598 (seeds 4/5 >= 0.85)   records 35 / 23 / 23   norms 1.06 / 0.98   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200159 ~ p200289   cosine 0.8598 (seeds 4/5 >= 0.85)   records 35 / 23 / 23   norms 1.06 / 0.98   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201406 ~ p201730   cosine 0.8588 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.50 / 0.36   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-001089 tierB-001283
;;   B: (And (Agent $e0 $x0) (Member $e0 cause))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200624 ~ p203249   cosine 0.8584 (seeds 3/5 >= 0.85)   records 12 / 3 / 3   norms 1.39 / 0.44   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-001125 tierB-001245 tierB-001511
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201435 ~ p202674   cosine 0.8578 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.63 / 0.46   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201567 ~ p202674   cosine 0.8578 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.63 / 0.46   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200731 ~ p201672   cosine 0.8561 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.35 / 0.54   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200830 ~ p203611   cosine 0.8530 (seeds 3/5 >= 0.85)   records 9 / 3 / 3   norms 1.00 / 0.45   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))   e.g. tierB-001068 tierB-001120 tierB-001961
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200379 ~ p202464   cosine 0.8526 (seeds 5/5 >= 0.85)   records 18 / 4 / 4   norms 1.59 / 0.44   gate: PASS
;;   A: (To $e0 $e1)   e.g. tierB-000229 tierB-000252 tierB-000730
;;   B: (And (Theme $e0 $x0) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200849 ~ p202309   cosine 0.8507 (seeds 2/5 >= 0.85)   records 9 / 4 / 4   norms 0.82 / 0.61   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0))   e.g. tierB-000325 tierB-001504 tierB-001594
;;   B: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200278 ~ p200284   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.98 / 0.98   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200278 ~ p200285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.98 / 0.98   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200278 ~ p200289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.98 / 0.98   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p200284 ~ p200285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.98 / 0.98   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200284 ~ p200289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.98 / 0.98   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200285 ~ p200289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.98 / 0.98   gate: PASS
;;   A: (And (Holder $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200584 ~ p200611   cosine 1.0000 (seeds 5/5 >= 0.85)   records 12 / 12 / 12   norms 0.80 / 0.80   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000465
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200754 ~ p200834   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201003 ~ p201004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201005 ~ p201055   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.76 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201005 ~ p201111   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.76 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201005 ~ p201143   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.76 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201055 ~ p201111   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.76 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201055 ~ p201143   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.76 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201111 ~ p201143   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.76 / 0.76   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201147 ~ p201173   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 1.00 / 1.00   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000393 tierB-000412
;;   B: (Member $e0 kill)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201154 ~ p201182   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (Through $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201350 ~ p201405   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 1.03 / 1.03   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (Member $e0 capture)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201435 ~ p201567   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201565 ~ p201739   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000320 tierB-000779 tierB-000838
;;   B: (And (Cardinality $x0 <num>) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201653 ~ p201674   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201653 ~ p201675   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201653 ~ p201745   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201671 ~ p201737   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.99 / 0.99   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201674 ~ p201675   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201674 ~ p201745   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201675 ~ p201745   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201676 ~ p201747   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.96 / 0.96   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201678 ~ p201753   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.82 / 0.82   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201749 ~ p201824   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.19 / 1.19   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000454 tierB-000768
;;   B: (Member $e0 contain)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201759 ~ p201829   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.38 / 0.38   gate: PASS
;;   A: (And (Member $e0 stand) (Past $e0))   e.g. tierB-000676 tierB-000712 tierB-001299
;;   B: (Member $e0 stand)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201766 ~ p201851   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.42 / 0.42   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $e1))   e.g. tierB-000176 tierB-000316 tierB-000659
;;   B: (Stimulus $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201768 ~ p201854   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.24 / 1.24   gate: PASS
;;   A: (And (Past $e0) (TimeAtMost $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001031
;;   B: (TimeAtMost $e0 (Year <num>))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p202265   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p202298   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201863 ~ p202299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201863 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201864 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201864 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201865 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201869 ~ p202310   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.59 / 0.59   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202096 ~ p202413   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.42 / 0.42   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 cat) (Past $e0))   e.g. tierB-000073 tierB-000381 tierB-001183
;;   B: (And (Agent $e0 $x0) (Member $x0 cat))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202102 ~ p202432   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.82 / 0.82   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))   e.g. tierB-000047 tierB-000502 tierB-001041
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202107 ~ p202458   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-000087 tierB-001515
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202108 ~ p202460   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.56 / 0.56   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1))   e.g. tierB-000196 tierB-000320 tierB-000779
;;   B: (And (Patient $e0 $x0) (SubsetOf $x0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202265 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202265 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202265 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202265 ~ p202298   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202265 ~ p202299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202265 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202296 ~ p202404   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.15 / 1.15   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202297 ~ p202407   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (And (Agent $e0 $x0) (Member $e0 jump))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202297 ~ p202440   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202297 ~ p202585   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p202299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202298 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202299 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202299 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202299 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202299 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202300 ~ p202410   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Agent $e0 $x0) (Member $e0 swim))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202300 ~ p202446   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202304 ~ p202427   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.47 / 0.47   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202407 ~ p202440   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202407 ~ p202585   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202409 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202409 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202409 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202410 ~ p202446   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 swim))   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202417 ~ p202554   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001134
;;   B: (Before $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202435 ~ p202574   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-000849
;;   B: (Member $e0 buy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202440 ~ p202585   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202442 ~ p202590   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.48 / 0.48   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0))   e.g. tierB-000962 tierB-001035 tierB-001595
;;   B: (Member $e0 receive)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202459 ~ p202633   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.17 / 1.17   gate: PASS
;;   A: (And (Past $e0) (TimeAtLeast $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (TimeAtLeast $e0 (Year <num>))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p203609   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p203681   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202662 ~ p203682   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202662 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202663 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202663 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202664 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202666 ~ p203265   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.40 / 0.40   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001348 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202668 ~ p203267   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202668 ~ p203273   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202668 ~ p203613   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202668 ~ p203708   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202668 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202675 ~ p203277   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202675 ~ p203717   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202675 ~ p204021   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203247 ~ p203694   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.39 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1))   e.g. tierB-000747 tierB-001920 tierB-001976
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203261 ~ p203924   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203261 ~ p203925   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203264 ~ p203937   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e0) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203267 ~ p203273   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203267 ~ p203613   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203267 ~ p203708   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203267 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203269 ~ p203710   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.44 / 0.44   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203269 ~ p204004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.44 / 0.44   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203269 ~ p204005   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.44 / 0.44   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203271 ~ p203720   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.84 / 0.84   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203273 ~ p203613   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203273 ~ p203708   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203273 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203276 ~ p203970   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203277 ~ p204021   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203608 ~ p203677   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203608 ~ p203698   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203608 ~ p203959   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203609 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203609 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203609 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203609 ~ p203681   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203609 ~ p203682   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203609 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203610 ~ p203683   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.70 / 0.70   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203610 ~ p203684   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.70 / 0.70   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203610 ~ p203907   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.70 / 0.70   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203613 ~ p203708   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203613 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203677 ~ p203698   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203677 ~ p203959   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203679 ~ p203902   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.10 / 1.10   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (And (Agent $e0 $x0) (Goal $e0 home))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203679 ~ p203961   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.10 / 1.10   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (And (Goal $e0 home) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203679 ~ p204242   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.10 / 1.10   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (Goal $e0 home)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p203682   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203681 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203682 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203682 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203682 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203682 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203683 ~ p203684   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.70 / 0.70   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203683 ~ p203907   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.70 / 0.70   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203684 ~ p203907   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.70 / 0.70   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203688 ~ p204008   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203690 ~ p203253   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.46 / 0.46   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203693 ~ p203261   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203693 ~ p203924   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203693 ~ p203925   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203697 ~ p203958   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.44 / 0.44   gate: PASS
;;   A: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))   e.g. tierB-001563 tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203698 ~ p203959   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203702 ~ p203984   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.08 / 1.08   gate: PASS
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203703 ~ p203985   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.39 / 0.39   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203706 ~ p203997   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.53 / 0.53   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203708 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203710 ~ p204004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.44 / 0.44   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203710 ~ p204005   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.44 / 0.44   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203714 ~ p204013   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.39 / 0.39   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203717 ~ p203277   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203717 ~ p204021   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203902 ~ p203961   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.10 / 1.10   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (And (Goal $e0 home) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203902 ~ p204242   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.10 / 1.10   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (Goal $e0 home)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203906 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203906 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203906 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203924 ~ p203925   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.49 / 0.49   gate: PASS
;;   A: (And (Agent $e0 $x0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p203928 ~ p203929   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.41 / 0.41   gate: PASS
;;   A: (And (Agent $e0 david) (Ongoing $e0))   e.g. tierB-000117 tierB-000173 tierB-000827
;;   B: (And (Agent $e0 david) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203960 ~ p204241   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.82 / 0.82   gate: PASS
;;   A: (And (Goal $e0 bed) (Member $e0 go))   e.g. tierB-000012 tierB-001418 tierB-001496
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203961 ~ p204242   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.10 / 1.10   gate: PASS
;;   A: (And (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (Goal $e0 home)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204004 ~ p204005   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.44 / 0.44   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204219 ~ p203928   cosine 0.9981 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.41   gate: PASS
;;   A: (Agent $e0 david)   e.g. tierB-000117 tierB-000173 tierB-000827
;;   B: (And (Agent $e0 david) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204219 ~ p203929   cosine 0.9981 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.41   gate: PASS
;;   A: (Agent $e0 david)   e.g. tierB-000117 tierB-000173 tierB-000827
;;   B: (And (Agent $e0 david) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204225 ~ p203931   cosine 0.9947 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.70 / 0.43   gate: PASS
;;   A: (Agent $e0 mark)   e.g. tierB-000075 tierB-000239 tierB-000400
;;   B: (And (Agent $e0 mark) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204230 ~ p203933   cosine 0.9763 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.58 / 0.39   gate: PASS
;;   A: (Agent $e0 michael)   e.g. tierB-000252 tierB-000929 tierB-001094
;;   B: (And (Agent $e0 michael) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology
