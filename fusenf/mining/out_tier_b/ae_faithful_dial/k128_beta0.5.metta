;; FUSE-NF §4.3.5 Autoencoder Analysis — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   ae_faithful.jsonl (adopted k / beta) and ae_faithful_dial/k<k>_beta<b>.jsonl   (every pair with cosine >= 0.8, whatever the floor)
;;   ae_faithful_weights/k<k>_beta<b>_seed<s>.tsv   (one encoder weight vector per unit)
;;
;; BLOCK: bottleneck 128, sparsity beta 0.5, gate cosine >= 0.85 with norm floor init — one point of the dial; the adopted setting (k 32, beta 0.5, cosine 0.85, floor init) is
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
;;   autoencoder     one hidden layer of 128 sigmoid units, linear output, tied decoder x_hat = h W + c;
;;                   init W uniform(+-sqrt(6/(F+k))), b = 0, c = the column means
;;   loss            mean over records of the squared reconstruction error summed over units + 0.0001 ||W||^2
;;                   + beta 0.5 * sum_j KL(rho 0.1 || mean activation of hidden unit j)   (beta 0 = the plain shallow AE)
;;   training        full batch, Adam lr 0.01, 10000 epochs, float32, 8 thread(s), seed 0 adopted;
;;                   seeds 0..4 retrain the same model for the stability count
;;                   this block: reconstruction 1.0457 per record, R^2 0.765, mean activation 0.1014;
;;                   reconstruction at each tenth of the epochs: 1.8122 / 1.2917 / 1.1402 / 1.0971 / 1.0749 / 1.0602 / 1.0518 / 1.0774 / 1.0444 / 1.0446
;;   ties            cosine between the two units' encoder weight vectors (the columns of W, 128-dimensional);
;;                   gate cosine >= 0.85 (dial 0.80, 0.85, 0.90, 0.95); recording floor 0.8
;;   norm floor      a unit ENTERS the comparison at encoder-vector norm >= 0.488 (init); dial none 0.000 / median 0.777 / init 0.488;
;;                   init = the initialisation norm a*sqrt(k/3), a = sqrt(6/(F+k)) — training grew the vector beyond where it
;;                   started; median = the median unit norm; 723 of 945 units enter under this block's floor
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

;; ==================== TIED PAIRS: 705 pass the gate — exclusive 0 (shape-parallel 0 = the rules), overlapping 104, nested 370, same-records 231 — among the 446040 pairs of 945 units (723 entering); 97 pairs above the cosine gate have a side below the floor; 996 pairs recorded in the JSONL ====================

;; [overlapping]  p202582 ~ p204359   cosine 0.9980 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.57 / 0.53   gate: PASS
;;   A: (Member $e0 good)   e.g. tierB-000495 tierB-001521
;;   B: (Probably (Member $x0 good))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203939 ~ p203940   cosine 0.9922 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.76 / 0.66   gate: PASS
;;   A: (And (Can $e0) (Member $e0 help))   e.g. tierB-000299 tierB-001094
;;   B: (And (Can $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202445 ~ p202107   cosine 0.9867 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.85 / 0.83   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202445 ~ p202458   cosine 0.9867 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.85 / 0.83   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203979 ~ p203980   cosine 0.9858 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.77 / 0.82   gate: PASS
;;   A: (And (Member $e0 become) (Past $e0))   e.g. tierB-001079 tierB-001582
;;   B: (And (Member $e0 become) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203947 ~ p203964   cosine 0.9818 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.88 / 0.98   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 look))   e.g. tierB-000230 tierB-000831
;;   B: (And (Like $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202434 ~ p203980   cosine 0.9812 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.06 / 0.82   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-001582 tierB-001817
;;   B: (And (Member $e0 become) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201755 ~ p202423   cosine 0.9749 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 1.08 / 0.92   gate: PASS
;;   A: (And (Member $e0 need) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201404 ~ p201826   cosine 0.9743 (seeds 5/5 >= 0.85)   records 6 / 5 / 3   norms 1.41 / 1.17   gate: PASS
;;   A: (Like $e0 $x0)   e.g. tierB-000230 tierB-000831 tierB-001135
;;   B: (Member $e0 look)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200998 ~ p201820   cosine 0.9716 (seeds 5/5 >= 0.85)   records 8 / 5 / 3   norms 1.63 / 0.85   gate: PASS
;;   A: (Member $x0 garden)   e.g. tierB-000615 tierB-001450 tierB-001935
;;   B: (GroupOf $x0 flower)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201830 ~ p202107   cosine 0.9684 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.89 / 0.83   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201830 ~ p202458   cosine 0.9684 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.89 / 0.83   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202422 ~ p203947   cosine 0.9680 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.11 / 0.88   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Like $e0 $x1))   e.g. tierB-000230 tierB-000831
;;   B: (And (Experiencer $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201404 ~ p203947   cosine 0.9648 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.41 / 0.88   gate: PASS
;;   A: (Like $e0 $x0)   e.g. tierB-000230 tierB-000831
;;   B: (And (Experiencer $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202434 ~ p203979   cosine 0.9639 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.06 / 0.77   gate: PASS
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierB-000352 tierB-001582
;;   B: (And (Member $e0 become) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201760 ~ p203912   cosine 0.9620 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.26 / 0.79   gate: PASS
;;   A: (And (Member $e0 study) (Ongoing $e0))   e.g. tierB-000225 tierB-001984
;;   B: (And (Agent $e0 $x0) (Member $e0 study))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201820 ~ p202428   cosine 0.9614 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.85 / 0.78   gate: PASS
;;   A: (GroupOf $x0 flower)   e.g. tierB-000615 tierB-001935
;;   B: (And (LocatedIn $x0 $x1) (Member $x1 garden))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201826 ~ p202422   cosine 0.9606 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 1.17 / 1.11   gate: PASS
;;   A: (Member $e0 look)   e.g. tierB-000230 tierB-000831
;;   B: (And (Experiencer $e0 $x0) (Like $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202422 ~ p203964   cosine 0.9600 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.11 / 0.98   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Like $e0 $x1))   e.g. tierB-000230 tierB-000831
;;   B: (And (Like $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201145 ~ p201351   cosine 0.9555 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 1.18 / 1.09   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202444 ~ p204015   cosine 0.9550 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.81 / 0.78   gate: PASS
;;   A: (And (Member $e0 say) (Past $e0))   e.g. tierB-000080 tierB-000865
;;   B: (And (Member $e0 say) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203947 ~ p204344   cosine 0.9510 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.88 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 look))   e.g. tierB-000230
;;   B: (Member $x0 spider)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203905 ~ p203977   cosine 0.9502 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.56 / 0.55   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 arrive))   e.g. tierB-000237 tierB-001992
;;   B: (And (Member $e0 arrive) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204017 ~ p204034   cosine 0.9429 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.71 / 0.94   gate: PASS
;;   A: (And (Member $e0 solve) (Patient $e0 $x0))   e.g. tierB-000935 tierB-001202
;;   B: (And (Member $x0 problem) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204034 ~ p204285   cosine 0.9429 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.94 / 0.71   gate: PASS
;;   A: (And (Member $x0 problem) (Patient $e0 $x0))   e.g. tierB-000935 tierB-001202
;;   B: (Member $e0 solve)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202567 ~ p203912   cosine 0.9388 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.83 / 0.79   gate: PASS
;;   A: (GroupOf $x0 scientist)   e.g. tierB-000225 tierB-001984
;;   B: (And (Agent $e0 $x0) (Member $e0 study))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200626 ~ p204017   cosine 0.9382 (seeds 5/5 >= 0.85)   records 12 / 3 / 2   norms 2.21 / 0.71   gate: PASS
;;   A: (Member $x0 problem)   e.g. tierB-000935 tierB-001202
;;   B: (And (Member $e0 solve) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200626 ~ p204285   cosine 0.9382 (seeds 5/5 >= 0.85)   records 12 / 3 / 2   norms 2.21 / 0.71   gate: PASS
;;   A: (Member $x0 problem)   e.g. tierB-000935 tierB-001202
;;   B: (Member $e0 solve)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203903 ~ p203912   cosine 0.9358 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.79 / 0.79   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 scientist))   e.g. tierB-000225 tierB-001984
;;   B: (And (Agent $e0 $x0) (Member $e0 study))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201826 ~ p204344   cosine 0.9352 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 1.17 / 0.50   gate: PASS
;;   A: (Member $e0 look)   e.g. tierB-000230
;;   B: (Member $x0 spider)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200730 ~ p200967   cosine 0.9342 (seeds 5/5 >= 0.85)   records 10 / 8 / 7   norms 1.22 / 1.02   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202405 ~ p203705   cosine 0.9333 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.98 / 0.93   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 eat))   e.g. tierB-000338 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202405 ~ p203994   cosine 0.9333 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.98 / 0.93   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 eat))   e.g. tierB-000338 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202405 ~ p203995   cosine 0.9333 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.98 / 0.93   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 eat))   e.g. tierB-000338 tierB-001551
;;   B: (And (Member $e0 eat) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203250 ~ p203688   cosine 0.9328 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.69 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203250 ~ p204008   cosine 0.9328 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.69 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))   e.g. tierB-001125 tierB-001433
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201750 ~ p201751   cosine 0.9318 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.76 / 0.80   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203964 ~ p204344   cosine 0.9301 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.98 / 0.50   gate: PASS
;;   A: (And (Like $e0 $x0) (Member $e0 look))   e.g. tierB-000230
;;   B: (Member $x0 spider)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201762 ~ p203916   cosine 0.9281 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.10 / 0.73   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001813 tierB-001873
;;   B: (And (Agent $e0 $x0) (Member $e0 work))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201150 ~ p201353   cosine 0.9277 (seeds 5/5 >= 0.85)   records 7 / 6 / 4   norms 1.11 / 1.04   gate: PASS
;;   A: (And (Member $e0 take) (Past $e0))   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203908 ~ p203987   cosine 0.9235 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.74 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 close))   e.g. tierB-000950 tierB-001926
;;   B: (And (Member $e0 close) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201733 ~ p204024   cosine 0.9218 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 1.24 / 0.74   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 watch))   e.g. tierB-001720 tierB-001800
;;   B: (And (Member $e0 watch) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201144 ~ p201341   cosine 0.9216 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 1.07 / 0.98   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202312 ~ p203719   cosine 0.9197 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.82 / 0.65   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202401 ~ p203956   cosine 0.9174 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.85 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (For $e0 $x1))   e.g. tierB-000049 tierB-001786
;;   B: (And (For $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202415 ~ p202457   cosine 0.9151 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.85 / 0.86   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203939 ~ p204000   cosine 0.9107 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.76 / 0.76   gate: PASS
;;   A: (And (Can $e0) (Member $e0 help))   e.g. tierB-000299 tierB-001094
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201741 ~ p201758   cosine 0.9099 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 1.08 / 1.09   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep))   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202098 ~ p202104   cosine 0.9092 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.92 / 0.93   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200973 ~ p201146   cosine 0.9087 (seeds 5/5 >= 0.85)   records 8 / 7 / 6   norms 1.08 / 1.02   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202100 ~ p202666   cosine 0.9083 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202100 ~ p203265   cosine 0.9083 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203988 ~ p203989   cosine 0.9077 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.74 / 0.71   gate: PASS
;;   A: (And (Member $e0 come) (Patient $e0 $x0))   e.g. tierB-000677 tierB-001949
;;   B: (And (Member $e0 come) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201352 ~ p203999   cosine 0.9069 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.23 / 0.55   gate: PASS
;;   A: (And (Member $e0 get) (Past $e0))   e.g. tierB-000672 tierB-001325
;;   B: (And (Member $e0 get) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203966 ~ p203709   cosine 0.9062 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.69 / 1.06   gate: PASS
;;   A: (And (LocatedIn $x0 $x1) (Member $x1 city))   e.g. tierB-000680
;;   B: (And (Member $e0 increase) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203966 ~ p204002   cosine 0.9062 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.69 / 1.06   gate: PASS
;;   A: (And (LocatedIn $x0 $x1) (Member $x1 city))   e.g. tierB-000680
;;   B: (And (Member $e0 increase) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203966 ~ p204003   cosine 0.9062 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.69 / 1.06   gate: PASS
;;   A: (And (LocatedIn $x0 $x1) (Member $x1 city))   e.g. tierB-000680
;;   B: (And (Member $e0 increase) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203699 ~ p203700   cosine 0.9042 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.66 / 0.71   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201730 ~ p202436   cosine 0.9027 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 1.14 / 1.01   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause))   e.g. tierB-000775 tierB-001649 tierB-001875
;;   B: (And (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202584 ~ p203966   cosine 0.8999 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 1.14 / 0.69   gate: PASS
;;   A: (Member $e0 increase)   e.g. tierB-000680
;;   B: (And (LocatedIn $x0 $x1) (Member $x1 city))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203685 ~ p203703   cosine 0.8999 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.86 / 0.80   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203685 ~ p203985   cosine 0.8999 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.86 / 0.80   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203269 ~ p203950   cosine 0.8989 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.71 / 0.58   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $x0 door))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203940 ~ p204000   cosine 0.8989 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.66 / 0.76   gate: PASS
;;   A: (And (Can $e0) (Past $e0))   e.g. tierB-000299 tierB-001094
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203950 ~ p203710   cosine 0.8989 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.58 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 door))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203950 ~ p204004   cosine 0.8989 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.58 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 door))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203950 ~ p204005   cosine 0.8989 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.58 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $x0 door))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202401 ~ p203955   cosine 0.8971 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.85 / 0.62   gate: PASS
;;   A: (And (Agent $e0 $x0) (For $e0 $x1))   e.g. tierB-000712 tierB-001786
;;   B: (And (For $e0 $x0) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201404 ~ p204344   cosine 0.8829 (seeds 5/5 >= 0.85)   records 6 / 3 / 1   norms 1.41 / 0.50   gate: PASS
;;   A: (Like $e0 $x0)   e.g. tierB-000230
;;   B: (Member $x0 spider)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202422 ~ p204344   cosine 0.8827 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 1.11 / 0.50   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Like $e0 $x1))   e.g. tierB-000230
;;   B: (Member $x0 spider)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203960 ~ p204043   cosine 0.8817 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 1.10 / 1.13   gate: PASS
;;   A: (And (Goal $e0 bed) (Member $e0 go))   e.g. tierB-000012
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204043 ~ p204241   cosine 0.8817 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 1.13 / 1.10   gate: PASS
;;   A: (And (Past $e0) (Time $e0 night))   e.g. tierB-000012
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201767 ~ p203986   cosine 0.8776 (seeds 3/5 >= 0.85)   records 5 / 3 / 1   norms 1.62 / 0.64   gate: PASS
;;   A: (And (Past $e0) (Time $e0 (Year <num>)))   e.g. tierB-000139
;;   B: (And (Member $e0 change) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201852 ~ p203986   cosine 0.8776 (seeds 3/5 >= 0.85)   records 5 / 3 / 1   norms 1.62 / 0.64   gate: PASS
;;   A: (Time $e0 (Year <num>))   e.g. tierB-000139
;;   B: (And (Member $e0 change) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201409 ~ p203940   cosine 0.8771 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.13 / 0.66   gate: PASS
;;   A: (Member $e0 help)   e.g. tierB-000299 tierB-001094
;;   B: (And (Can $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202106 ~ p203279   cosine 0.8747 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.09 / 0.82   gate: PASS
;;   A: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202106 ~ p204033   cosine 0.8747 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.09 / 0.82   gate: PASS
;;   A: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202453 ~ p203279   cosine 0.8747 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.09 / 0.82   gate: PASS
;;   A: (And (Of $x0 $x1) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202453 ~ p204033   cosine 0.8747 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 1.09 / 0.82   gate: PASS
;;   A: (And (Of $x0 $x1) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201760 ~ p202567   cosine 0.8741 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 1.26 / 0.83   gate: PASS
;;   A: (And (Member $e0 study) (Ongoing $e0))   e.g. tierB-000225 tierB-001984
;;   B: (GroupOf $x0 scientist)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202630 ~ p203960   cosine 0.8729 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 1.20 / 1.10   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012
;;   B: (And (Goal $e0 bed) (Member $e0 go))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202630 ~ p204241   cosine 0.8729 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 1.20 / 1.10   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201760 ~ p203903   cosine 0.8704 (seeds 4/5 >= 0.85)   records 5 / 3 / 2   norms 1.26 / 0.79   gate: PASS
;;   A: (And (Member $e0 study) (Ongoing $e0))   e.g. tierB-000225 tierB-001984
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201848 ~ p203279   cosine 0.8701 (seeds 4/5 >= 0.85)   records 5 / 3 / 2   norms 1.14 / 0.82   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201848 ~ p204033   cosine 0.8701 (seeds 4/5 >= 0.85)   records 5 / 3 / 2   norms 1.14 / 0.82   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203699 ~ p203721   cosine 0.8694 (seeds 4/5 >= 0.85)   records 3 / 3 / 2   norms 0.66 / 0.63   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203953 ~ p204359   cosine 0.8661 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.58 / 0.53   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Time $e0 today))   e.g. tierB-000495
;;   B: (Probably (Member $x0 good))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201750 ~ p201752   cosine 0.8657 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.76 / 0.74   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202582 ~ p203953   cosine 0.8644 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.57 / 0.58   gate: PASS
;;   A: (Member $e0 good)   e.g. tierB-000495
;;   B: (And (Experiencer $e0 $x0) (Time $e0 today))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203911 ~ p204014   cosine 0.8635 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.67 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 run))   e.g. tierB-001153 tierB-001563
;;   B: (And (Member $e0 run) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202099 ~ p202100   cosine 0.8630 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.78 / 0.72   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202304 ~ p203915   cosine 0.8630 (seeds 2/5 >= 0.85)   records 4 / 3 / 2   norms 0.93 / 0.62   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-001219
;;   B: (And (Agent $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202427 ~ p203915   cosine 0.8630 (seeds 2/5 >= 0.85)   records 4 / 3 / 2   norms 0.93 / 0.62   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 walk))   e.g. tierB-000324 tierB-001219
;;   B: (And (Agent $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203712 ~ p203723   cosine 0.8613 (seeds 4/5 >= 0.85)   records 3 / 3 / 2   norms 0.73 / 0.67   gate: PASS
;;   A: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000325 tierB-001809
;;   B: (And (Ongoing $e0) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202419 ~ p203940   cosine 0.8603 (seeds 3/5 >= 0.85)   records 4 / 3 / 1   norms 0.67 / 0.66   gate: PASS
;;   A: (And (Can $e0) (Theme $e0 $x0))   e.g. tierB-000299
;;   B: (And (Can $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202431 ~ p202450   cosine 0.8600 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.82 / 0.76   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201354 ~ p201761   cosine 0.8587 (seeds 5/5 >= 0.85)   records 6 / 5 / 4   norms 0.95 / 0.98   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202106 ~ p202613   cosine 0.8585 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 1.09 / 0.88   gate: PASS
;;   A: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (Member $x0 picture)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202453 ~ p202613   cosine 0.8585 (seeds 4/5 >= 0.85)   records 4 / 4 / 2   norms 1.09 / 0.88   gate: PASS
;;   A: (And (Of $x0 $x1) (Theme $e0 $x0))   e.g. tierB-001070 tierB-001423
;;   B: (Member $x0 picture)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203687 ~ p203711   cosine 0.8565 (seeds 3/5 >= 0.85)   records 3 / 3 / 2   norms 0.64 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))   e.g. tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201848 ~ p202613   cosine 0.8539 (seeds 4/5 >= 0.85)   records 5 / 4 / 2   norms 1.14 / 0.88   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-001070 tierB-001423
;;   B: (Member $x0 picture)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202419 ~ p203939   cosine 0.8539 (seeds 4/5 >= 0.85)   records 4 / 3 / 2   norms 0.67 / 0.76   gate: PASS
;;   A: (And (Can $e0) (Theme $e0 $x0))   e.g. tierB-000299 tierB-000319
;;   B: (And (Can $e0) (Member $e0 help))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203942 ~ p203943   cosine 0.8539 (seeds 4/5 >= 0.85)   records 3 / 3 / 2   norms 0.61 / 0.69   gate: PASS
;;   A: (And (During $e0 $e1) (Past $e0))   e.g. tierB-001782 tierB-001809
;;   B: (And (During $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201000 ~ p202614   cosine 0.8512 (seeds 5/5 >= 0.85)   records 8 / 4 / 2   norms 1.94 / 0.95   gate: PASS
;;   A: (Time $e0 (Hour <num>))   e.g. tierB-000298 tierB-000315
;;   B: (Member $x0 plane)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201848 ~ p202106   cosine 0.9999 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.14 / 1.09   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-000409 tierB-001070 tierB-001262
;;   B: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201848 ~ p202453   cosine 0.9999 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.14 / 1.09   gate: PASS
;;   A: (Of $x0 $x1)   e.g. tierB-000409 tierB-001070 tierB-001262
;;   B: (And (Of $x0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202567 ~ p203903   cosine 0.9998 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.79   gate: PASS
;;   A: (GroupOf $x0 scientist)   e.g. tierB-000225 tierB-001251 tierB-001984
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 scientist))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201350 ~ p201676   cosine 0.9994 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.05 / 0.98   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201350 ~ p201747   cosine 0.9994 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.05 / 0.98   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p201676   cosine 0.9994 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.05 / 0.98   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p201747   cosine 0.9994 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.05 / 0.98   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200995 ~ p201138   cosine 0.9992 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.62 / 1.53   gate: PASS
;;   A: (Again $e0)   e.g. tierB-000147 tierB-000337 tierB-000588
;;   B: (And (Again $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201749 ~ p202296   cosine 0.9990 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.22 / 1.17   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201749 ~ p202404   cosine 0.9990 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.22 / 1.17   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201824 ~ p202296   cosine 0.9990 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.22 / 1.17   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201824 ~ p202404   cosine 0.9990 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.22 / 1.17   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202588 ~ p203713   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.01 / 0.94   gate: PASS
;;   A: (Member $e0 present)   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202588 ~ p204010   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.01 / 0.94   gate: PASS
;;   A: (Member $e0 present)   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202588 ~ p204011   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.01 / 0.94   gate: PASS
;;   A: (Member $e0 present)   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201421 ~ p201764   cosine 0.9987 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.20 / 1.12   gate: PASS
;;   A: (Member $x0 sound)   e.g. tierB-000805 tierB-000951 tierB-001384
;;   B: (And (Member $x0 sound) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202435 ~ p203702   cosine 0.9985 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.22 / 1.13   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202435 ~ p203984   cosine 0.9985 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.22 / 1.13   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202574 ~ p203702   cosine 0.9985 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.22 / 1.13   gate: PASS
;;   A: (Member $e0 buy)   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202574 ~ p203984   cosine 0.9985 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.22 / 1.13   gate: PASS
;;   A: (Member $e0 buy)   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201412 ~ p201733   cosine 0.9984 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.38 / 1.24   gate: PASS
;;   A: (Member $e0 watch)   e.g. tierB-000258 tierB-000520 tierB-001205
;;   B: (And (Agent $e0 $x0) (Member $e0 watch))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202630 ~ p204043   cosine 0.9976 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.20 / 1.13   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012 tierB-000264 tierB-001894
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201347 ~ p201672   cosine 0.9970 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.16 / 1.06   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 go))   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200283 ~ p200323   cosine 0.9966 (seeds 5/5 >= 0.85)   records 23 / 22 / 22   norms 1.35 / 1.37   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))   e.g. tierB-000004 tierB-000362 tierB-000370
;;   B: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200530 ~ p200601   cosine 0.9964 (seeds 5/5 >= 0.85)   records 13 / 12 / 12   norms 1.14 / 1.08   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))   e.g. tierB-000362 tierB-000392 tierB-000425
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202439 ~ p203707   cosine 0.9963 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.25 / 1.01   gate: PASS
;;   A: (And (Member $e0 find) (Past $e0))   e.g. tierB-000579 tierB-000585 tierB-001139
;;   B: (And (Member $e0 find) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202439 ~ p203998   cosine 0.9963 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.25 / 1.01   gate: PASS
;;   A: (And (Member $e0 find) (Past $e0))   e.g. tierB-000579 tierB-000585 tierB-001139
;;   B: (And (Member $e0 find) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202579 ~ p203707   cosine 0.9963 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.25 / 1.01   gate: PASS
;;   A: (Member $e0 find)   e.g. tierB-000579 tierB-000585 tierB-001139
;;   B: (And (Member $e0 find) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202579 ~ p203998   cosine 0.9963 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.25 / 1.01   gate: PASS
;;   A: (Member $e0 find)   e.g. tierB-000579 tierB-000585 tierB-001139
;;   B: (And (Member $e0 find) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201827 ~ p202408   cosine 0.9961 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.61 / 0.58   gate: PASS
;;   A: (Member $e0 provide)   e.g. tierB-000769 tierB-001260 tierB-001262
;;   B: (And (Agent $e0 $x0) (Member $e0 provide))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200159 ~ p200171   cosine 0.9960 (seeds 5/5 >= 0.85)   records 35 / 33 / 33   norms 1.77 / 1.61   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000066 tierB-000142 tierB-000162
;;   B: (And (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201172 ~ p201748   cosine 0.9959 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.19 / 1.05   gate: PASS
;;   A: (Member $e0 change)   e.g. tierB-000139 tierB-000517 tierB-001491
;;   B: (And (Member $e0 change) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202445 ~ p202675   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.85 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202445 ~ p203277   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.85 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202445 ~ p203717   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.85 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202445 ~ p204021   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.85 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201826 ~ p203964   cosine 0.9957 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.17 / 0.98   gate: PASS
;;   A: (Member $e0 look)   e.g. tierB-000230 tierB-000831 tierB-001135
;;   B: (And (Like $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201828 ~ p204015   cosine 0.9956 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.99 / 0.78   gate: PASS
;;   A: (Member $e0 say)   e.g. tierB-000080 tierB-000865 tierB-001626
;;   B: (And (Member $e0 say) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202584 ~ p203709   cosine 0.9955 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.14 / 1.06   gate: PASS
;;   A: (Member $e0 increase)   e.g. tierB-000680 tierB-000690 tierB-000965
;;   B: (And (Member $e0 increase) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202584 ~ p204002   cosine 0.9955 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.14 / 1.06   gate: PASS
;;   A: (Member $e0 increase)   e.g. tierB-000680 tierB-000690 tierB-000965
;;   B: (And (Member $e0 increase) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202584 ~ p204003   cosine 0.9955 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.14 / 1.06   gate: PASS
;;   A: (Member $e0 increase)   e.g. tierB-000680 tierB-000690 tierB-000965
;;   B: (And (Member $e0 increase) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200968 ~ p201005   cosine 0.9951 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.83 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p201055   cosine 0.9951 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.83 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200968 ~ p201111   cosine 0.9951 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.83 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p201143   cosine 0.9951 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.83 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201823 ~ p202434   cosine 0.9947 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.26 / 1.06   gate: PASS
;;   A: (Member $e0 become)   e.g. tierB-000352 tierB-000740 tierB-001582
;;   B: (And (Member $e0 become) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200732 ~ p200833   cosine 0.9946 (seeds 5/5 >= 0.85)   records 10 / 9 / 9   norms 1.29 / 1.20   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000162 tierB-000665 tierB-000730
;;   B: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201403 ~ p202403   cosine 0.9936 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.78 / 0.69   gate: PASS
;;   A: (GroupOf $x0 student)   e.g. tierB-000387 tierB-000656 tierB-000712
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 student))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202592 ~ p203911   cosine 0.9934 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.73 / 0.67   gate: PASS
;;   A: (Member $e0 run)   e.g. tierB-000339 tierB-001153 tierB-001563
;;   B: (And (Agent $e0 $x0) (Member $e0 run))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202614 ~ p203256   cosine 0.9929 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.95 / 0.78   gate: PASS
;;   A: (Member $x0 plane)   e.g. tierB-000045 tierB-000132 tierB-000298
;;   B: (And (Agent $e0 $x0) (Member $x0 plane) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202614 ~ p203920   cosine 0.9929 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.95 / 0.78   gate: PASS
;;   A: (Member $x0 plane)   e.g. tierB-000045 tierB-000132 tierB-000298
;;   B: (And (Agent $e0 $x0) (Member $x0 plane))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202107 ~ p202675   cosine 0.9921 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202107 ~ p203277   cosine 0.9921 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202107 ~ p203717   cosine 0.9921 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202107 ~ p204021   cosine 0.9921 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202458 ~ p202675   cosine 0.9921 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202458 ~ p203277   cosine 0.9921 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202458 ~ p203717   cosine 0.9921 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202458 ~ p204021   cosine 0.9921 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201404 ~ p202422   cosine 0.9916 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.41 / 1.11   gate: PASS
;;   A: (Like $e0 $x0)   e.g. tierB-000230 tierB-000831 tierB-001517
;;   B: (And (Experiencer $e0 $x0) (Like $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201823 ~ p203980   cosine 0.9914 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.26 / 0.82   gate: PASS
;;   A: (Member $e0 become)   e.g. tierB-001079 tierB-001582 tierB-001817
;;   B: (And (Member $e0 become) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202601 ~ p203918   cosine 0.9911 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.59 / 0.56   gate: PASS
;;   A: (Member $x0 doctor)   e.g. tierB-000049 tierB-000339 tierB-000793
;;   B: (And (Agent $e0 $x0) (Member $x0 doctor))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201410 ~ p201757   cosine 0.9908 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.77 / 0.72   gate: PASS
;;   A: (Member $e0 sell)   e.g. tierB-000326 tierB-000784 tierB-000975
;;   B: (And (Member $e0 sell) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201832 ~ p204023   cosine 0.9903 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.26 / 1.12   gate: PASS
;;   A: (Member $e0 travel)   e.g. tierB-000667 tierB-000995 tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201413 ~ p201561   cosine 0.9900 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.45 / 1.37   gate: PASS
;;   A: (Member $x0 boy)   e.g. tierB-000305 tierB-000337 tierB-000340
;;   B: (And (Agent $e0 $x0) (Member $x0 boy) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201413 ~ p201734   cosine 0.9900 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.45 / 1.37   gate: PASS
;;   A: (Member $x0 boy)   e.g. tierB-000305 tierB-000337 tierB-000340
;;   B: (And (Agent $e0 $x0) (Member $x0 boy))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201761 ~ p202312   cosine 0.9900 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.98 / 0.82   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0))   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200996 ~ p201349   cosine 0.9888 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 1.76 / 1.27   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p201354   cosine 0.9887 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 1.09 / 0.95   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202423 ~ p203696   cosine 0.9884 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.92 / 0.81   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 need))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201826 ~ p203947   cosine 0.9878 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.17 / 0.88   gate: PASS
;;   A: (Member $e0 look)   e.g. tierB-000230 tierB-000297 tierB-000831
;;   B: (And (Experiencer $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p201151   cosine 0.9877 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.20 / 1.08   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000148 tierB-000324 tierB-000805
;;   B: (And (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202613 ~ p203279   cosine 0.9876 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.88 / 0.82   gate: PASS
;;   A: (Member $x0 picture)   e.g. tierB-000876 tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202613 ~ p204033   cosine 0.9876 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.88 / 0.82   gate: PASS
;;   A: (Member $x0 picture)   e.g. tierB-000876 tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202436 ~ p203703   cosine 0.9873 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.01 / 0.80   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202436 ~ p203985   cosine 0.9873 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.01 / 0.80   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201831 ~ p202300   cosine 0.9865 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.10 / 1.02   gate: PASS
;;   A: (Member $e0 swim)   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201831 ~ p202410   cosine 0.9865 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.10 / 1.02   gate: PASS
;;   A: (Member $e0 swim)   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Agent $e0 $x0) (Member $e0 swim))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201831 ~ p202446   cosine 0.9865 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.10 / 1.02   gate: PASS
;;   A: (Member $e0 swim)   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201763 ~ p202098   cosine 0.9863 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.07 / 0.92   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201147 ~ p201678   cosine 0.9862 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.28 / 1.07   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201147 ~ p201753   cosine 0.9862 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.28 / 1.07   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201173 ~ p201678   cosine 0.9862 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.28 / 1.07   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201173 ~ p201753   cosine 0.9862 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.28 / 1.07   gate: PASS
;;   A: (Member $e0 kill)   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201768 ~ p202459   cosine 0.9862 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.31 / 1.22   gate: PASS
;;   A: (And (Past $e0) (TimeAtMost $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (And (Past $e0) (TimeAtLeast $e0 (Year <num>)))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201768 ~ p202633   cosine 0.9862 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.31 / 1.22   gate: PASS
;;   A: (And (Past $e0) (TimeAtMost $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (TimeAtLeast $e0 (Year <num>))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201854 ~ p202459   cosine 0.9862 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.31 / 1.22   gate: PASS
;;   A: (TimeAtMost $e0 (Year <num>))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (And (Past $e0) (TimeAtLeast $e0 (Year <num>)))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201854 ~ p202633   cosine 0.9862 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.31 / 1.22   gate: PASS
;;   A: (TimeAtMost $e0 (Year <num>))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (TimeAtLeast $e0 (Year <num>))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201348 ~ p201673   cosine 0.9860 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.00 / 0.88   gate: PASS
;;   A: (And (Goal $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000462 tierB-000834 tierB-001023
;;   B: (And (Goal $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201743 ~ p203274   cosine 0.9854 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.22 / 1.03   gate: PASS
;;   A: (And (GroupOf $x0 person) (Patient $e0 $x0))   e.g. tierB-000196 tierB-000412 tierB-000771
;;   B: (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p200730   cosine 0.9851 (seeds 5/5 >= 0.85)   records 11 / 10 / 10   norms 1.28 / 1.22   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-000128
;;   B: (And (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p202308   cosine 0.9849 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.74 / 0.70   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202313 ~ p203611   cosine 0.9849 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.81 / 0.67   gate: PASS
;;   A: (And (Ongoing $e0) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001068 tierB-001120 tierB-001961
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201764 ~ p202105   cosine 0.9840 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.12 / 0.95   gate: PASS
;;   A: (And (Member $x0 sound) (Patient $e0 $x0))   e.g. tierB-000805 tierB-001384 tierB-001894
;;   B: (And (Member $x0 sound) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p201145   cosine 0.9839 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.38 / 1.18   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000194 tierB-000609 tierB-000779
;;   B: (And (Member $e0 fall) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202104 ~ p202665   cosine 0.9838 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.93 / 0.77   gate: PASS
;;   A: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201421 ~ p202105   cosine 0.9837 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.20 / 0.95   gate: PASS
;;   A: (Member $x0 sound)   e.g. tierB-000805 tierB-001384 tierB-001894
;;   B: (And (Member $x0 sound) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201171 ~ p201746   cosine 0.9836 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.76 / 0.61   gate: PASS
;;   A: (In $e0 $x0)   e.g. tierB-000411 tierB-000774 tierB-001033
;;   B: (And (In $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200868 ~ p201760   cosine 0.9835 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.84 / 1.26   gate: PASS
;;   A: (Member $e0 study)   e.g. tierB-000203 tierB-000225 tierB-001084
;;   B: (And (Member $e0 study) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201177 ~ p204027   cosine 0.9834 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.00 / 0.73   gate: PASS
;;   A: (Member $x0 big)   e.g. tierB-000890 tierB-001457 tierB-001831
;;   B: (And (Member $x0 big) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201351 ~ p201677   cosine 0.9834 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.09 / 0.96   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201741 ~ p202302   cosine 0.9826 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.08 / 0.97   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 sleep))   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202448 ~ p203271   cosine 0.9816 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.06 / 1.01   gate: PASS
;;   A: (And (Member $e0 turn) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202448 ~ p203720   cosine 0.9816 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.06 / 1.01   gate: PASS
;;   A: (And (Member $e0 turn) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202573 ~ p203977   cosine 0.9814 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.63 / 0.55   gate: PASS
;;   A: (Member $e0 arrive)   e.g. tierB-000237 tierB-000444 tierB-001992
;;   B: (And (Member $e0 arrive) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201823 ~ p203979   cosine 0.9812 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.26 / 0.77   gate: PASS
;;   A: (Member $e0 become)   e.g. tierB-000352 tierB-001079 tierB-001582
;;   B: (And (Member $e0 become) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p202445   cosine 0.9803 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.89 / 0.85   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-000125 tierB-001515
;;   B: (And (Member $e0 stop) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201825 ~ p203705   cosine 0.9799 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.20 / 0.93   gate: PASS
;;   A: (Member $e0 eat)   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201825 ~ p203994   cosine 0.9799 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.20 / 0.93   gate: PASS
;;   A: (Member $e0 eat)   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201825 ~ p203995   cosine 0.9799 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.20 / 0.93   gate: PASS
;;   A: (Member $e0 eat)   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201154 ~ p201671   cosine 0.9783 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.29 / 1.06   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201154 ~ p201737   cosine 0.9783 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.29 / 1.06   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201182 ~ p201671   cosine 0.9783 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.29 / 1.06   gate: PASS
;;   A: (Through $e0 $x0)   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201182 ~ p201737   cosine 0.9783 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.29 / 1.06   gate: PASS
;;   A: (Through $e0 $x0)   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202573 ~ p203905   cosine 0.9779 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.63 / 0.56   gate: PASS
;;   A: (Member $e0 arrive)   e.g. tierB-000237 tierB-001440 tierB-001992
;;   B: (And (Agent $e0 $x0) (Member $e0 arrive))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201404 ~ p203964   cosine 0.9777 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.41 / 0.98   gate: PASS
;;   A: (Like $e0 $x0)   e.g. tierB-000230 tierB-000831 tierB-001135
;;   B: (And (Like $e0 $x0) (Member $e0 look))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201732 ~ p203688   cosine 0.9775 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.00 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201732 ~ p204008   cosine 0.9775 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.00 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p200968   cosine 0.9774 (seeds 5/5 >= 0.85)   records 10 / 8 / 8   norms 0.89 / 0.83   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000182
;;   B: (And (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202560 ~ p203954   cosine 0.9768 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.75 / 0.69   gate: PASS
;;   A: (For $e0 $e1)   e.g. tierB-000002 tierB-000239 tierB-000962
;;   B: (And (For $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200967 ~ p201110   cosine 0.9765 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.02 / 0.96   gate: PASS
;;   A: (And (Manner $e0 quickly) (Patient $e0 $x0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201821 ~ p203972   cosine 0.9765 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.76 / 0.63   gate: PASS
;;   A: (Location $e0 here)   e.g. tierB-000237 tierB-000653 tierB-001705
;;   B: (And (Location $e0 here) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p202675   cosine 0.9761 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.89 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p203277   cosine 0.9761 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.89 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p203717   cosine 0.9761 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.89 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p204021   cosine 0.9761 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.89 / 0.81   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200865 ~ p200969   cosine 0.9752 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 1.15 / 1.10   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000176 tierB-000189 tierB-000421
;;   B: (And (Member $e0 hear) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200626 ~ p204034   cosine 0.9751 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 2.21 / 0.94   gate: PASS
;;   A: (Member $x0 problem)   e.g. tierB-000935 tierB-001202 tierB-001910
;;   B: (And (Member $x0 problem) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201342 ~ p203255   cosine 0.9745 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.63 / 1.13   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773 tierB-001801 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201408 ~ p202438   cosine 0.9742 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.95 / 0.83   gate: PASS
;;   A: (Member $e0 do)   e.g. tierB-001520 tierB-001721 tierB-001735
;;   B: (And (Member $e0 do) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201825 ~ p202405   cosine 0.9742 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.20 / 0.98   gate: PASS
;;   A: (Member $e0 eat)   e.g. tierB-000338 tierB-000410 tierB-001551
;;   B: (And (Agent $e0 $x0) (Member $e0 eat))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202417 ~ p203264   cosine 0.9742 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.02 / 0.87   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202417 ~ p203937   cosine 0.9742 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.02 / 0.87   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202554 ~ p203264   cosine 0.9742 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.02 / 0.87   gate: PASS
;;   A: (Before $e0 $e1)   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202554 ~ p203937   cosine 0.9742 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.02 / 0.87   gate: PASS
;;   A: (Before $e0 $e1)   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202597 ~ p203917   cosine 0.9740 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.38 / 1.20   gate: PASS
;;   A: (Member $x0 bus)   e.g. tierB-001430 tierB-001528 tierB-001739
;;   B: (And (Agent $e0 $x0) (Member $x0 bus))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201175 ~ p201758   cosine 0.9734 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.28 / 1.09   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001302 tierB-001334 tierB-001753
;;   B: (And (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201142 ~ p201311   cosine 0.9733 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 1.21 / 1.08   gate: PASS
;;   A: (And (Location $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000047 tierB-000579 tierB-000704
;;   B: (And (Location $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200746 ~ p201353   cosine 0.9726 (seeds 5/5 >= 0.85)   records 10 / 6 / 6   norms 1.45 / 1.04   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000252 tierB-000942 tierB-000978
;;   B: (And (Member $e0 take) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202563 ~ p203941   cosine 0.9726 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.81 / 0.55   gate: PASS
;;   A: (GroupOf $x0 girl)   e.g. tierB-000133 tierB-000738 tierB-000814
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 girl))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201834 ~ p204026   cosine 0.9725 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.82 / 0.65   gate: PASS
;;   A: (Member $x0 bad)   e.g. tierB-000748 tierB-001594 tierB-001910
;;   B: (And (Member $x0 bad) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p201351   cosine 0.9721 (seeds 5/5 >= 0.85)   records 9 / 6 / 6   norms 1.38 / 1.09   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000609 tierB-000779
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201174 ~ p201756   cosine 0.9721 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.23 / 1.14   gate: PASS
;;   A: (Member $e0 open)   e.g. tierB-000056 tierB-000302 tierB-001487
;;   B: (And (Member $e0 open) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201341 ~ p201668   cosine 0.9717 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.98 / 0.91   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201738 ~ p202301   cosine 0.9716 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.14 / 1.00   gate: PASS
;;   A: (And (Already $e0) (Patient $e0 $x0))   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201738 ~ p202416   cosine 0.9716 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.14 / 1.00   gate: PASS
;;   A: (And (Already $e0) (Patient $e0 $x0))   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202303 ~ p203612   cosine 0.9714 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.89 / 0.87   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200866 ~ p201755   cosine 0.9708 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.45 / 1.08   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000107 tierB-000114 tierB-000339
;;   B: (And (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201145 ~ p201677   cosine 0.9708 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.18 / 0.96   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202431 ~ p203700   cosine 0.9700 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.82 / 0.71   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000148 tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202430 ~ p203275   cosine 0.9696 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.00 / 0.72   gate: PASS
;;   A: (And (LocatedIn $x0 $x1) (Patient $e0 $x0))   e.g. tierB-000265 tierB-000680 tierB-001359
;;   B: (And (LocatedIn $x0 $x1) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200963 ~ p201108   cosine 0.9691 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.05 / 0.99   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make))   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200869 ~ p201762   cosine 0.9690 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.69 / 1.10   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-000419 tierB-000867 tierB-001515
;;   B: (And (Member $e0 work) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201146 ~ p201312   cosine 0.9685 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 1.02 / 0.96   gate: PASS
;;   A: (And (Member $e0 hear) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201849 ~ p202415   cosine 0.9684 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.95 / 0.85   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889 tierB-001205
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202450 ~ p203721   cosine 0.9680 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.76 / 0.63   gate: PASS
;;   A: (And (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000148 tierB-000805 tierB-000929
;;   B: (And (Member $e0 walk) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201755 ~ p203696   cosine 0.9669 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.08 / 0.81   gate: PASS
;;   A: (And (Member $e0 need) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201840 ~ p203278   cosine 0.9667 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.94 / 0.81   gate: PASS
;;   A: (Member $x0 fire)   e.g. tierB-000890 tierB-001163 tierB-001302
;;   B: (And (Member $x0 fire) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201840 ~ p204030   cosine 0.9667 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.94 / 0.81   gate: PASS
;;   A: (Member $x0 fire)   e.g. tierB-000890 tierB-001163 tierB-001302
;;   B: (And (Member $x0 fire) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201400 ~ p201738   cosine 0.9664 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.22 / 1.14   gate: PASS
;;   A: (Already $e0)   e.g. tierB-000034 tierB-000218 tierB-000616
;;   B: (And (Already $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201828 ~ p202444   cosine 0.9662 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.99 / 0.81   gate: PASS
;;   A: (Member $e0 say)   e.g. tierB-000080 tierB-000865 tierB-001441
;;   B: (And (Member $e0 say) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201406 ~ p202436   cosine 0.9660 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.26 / 1.01   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202433 ~ p203251   cosine 0.9655 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.76 / 0.64   gate: PASS
;;   A: (And (Location $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000942 tierB-001283 tierB-001933
;;   B: (And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200962 ~ p201054   cosine 0.9650 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 1.48 / 1.30   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierB-000248 tierB-000258 tierB-000548
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201005   cosine 0.9645 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.89 / 0.78   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201055   cosine 0.9645 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.89 / 0.78   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201111   cosine 0.9645 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.89 / 0.78   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201143   cosine 0.9645 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.89 / 0.78   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200800 ~ p200938   cosine 0.9643 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 0.87 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202402 ~ p203248   cosine 0.9642 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.83 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 boy))   e.g. tierB-001457 tierB-001530 tierB-001840
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201406 ~ p201730   cosine 0.9641 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 1.26 / 1.14   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-001089 tierB-001283
;;   B: (And (Agent $e0 $x0) (Member $e0 cause))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201350 ~ p203610   cosine 0.9633 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.05 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201350 ~ p203683   cosine 0.9633 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.05 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201350 ~ p203684   cosine 0.9633 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.05 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201350 ~ p203907   cosine 0.9633 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.05 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p203610   cosine 0.9633 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.05 / 0.74   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p203683   cosine 0.9633 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.05 / 0.74   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p203684   cosine 0.9633 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.05 / 0.74   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201405 ~ p203907   cosine 0.9633 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.05 / 0.74   gate: PASS
;;   A: (Member $e0 capture)   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202431 ~ p203699   cosine 0.9631 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.82 / 0.66   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201676 ~ p203610   cosine 0.9623 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.98 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201676 ~ p203683   cosine 0.9623 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.98 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201676 ~ p203684   cosine 0.9623 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.98 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201676 ~ p203907   cosine 0.9623 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.98 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201747 ~ p203610   cosine 0.9623 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.98 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201747 ~ p203683   cosine 0.9623 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.98 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201747 ~ p203684   cosine 0.9623 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.98 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201747 ~ p203907   cosine 0.9623 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.98 / 0.74   gate: PASS
;;   A: (And (Member $e0 capture) (Theme $e0 $x0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201150 ~ p202311   cosine 0.9619 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.11 / 0.79   gate: PASS
;;   A: (And (Member $e0 take) (Past $e0))   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201730 ~ p203685   cosine 0.9612 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.14 / 0.86   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cause))   e.g. tierB-000775 tierB-001649 tierB-001875
;;   B: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202457 ~ p203692   cosine 0.9607 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.75   gate: PASS
;;   A: (And (Over $e0 $x0) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200442 ~ p200545   cosine 0.9606 (seeds 5/5 >= 0.85)   records 16 / 13 / 13   norms 1.45 / 1.30   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1))   e.g. tierB-000324 tierB-000387 tierB-000462
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200998 ~ p202428   cosine 0.9603 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 1.63 / 0.78   gate: PASS
;;   A: (Member $x0 garden)   e.g. tierB-000615 tierB-000760 tierB-001208
;;   B: (And (LocatedIn $x0 $x1) (Member $x1 garden))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200500 ~ p200830   cosine 0.9595 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.80 / 1.32   gate: PASS
;;   A: (And (Ongoing $e0) (Theme $e0 $x0))   e.g. tierB-000520 tierB-000713 tierB-000784
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200746 ~ p201150   cosine 0.9589 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 1.45 / 1.11   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000252 tierB-000309 tierB-000942
;;   B: (And (Member $e0 take) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201849 ~ p202457   cosine 0.9586 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.95 / 0.86   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Over $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201343 ~ p201670   cosine 0.9582 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.89 / 0.84   gate: PASS
;;   A: (And (Agent $e0 $x0) (Source $e0 $x1))   e.g. tierB-000338 tierB-000693 tierB-000781
;;   B: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p200967   cosine 0.9575 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 1.28 / 1.02   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201816 ~ p203943   cosine 0.9568 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.83 / 0.69   gate: PASS
;;   A: (During $e0 $e1)   e.g. tierB-000502 tierB-001782 tierB-001809
;;   B: (And (During $e0 $e1) (Past $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201178 ~ p202414   cosine 0.9561 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.19 / 1.37   gate: PASS
;;   A: (Member $x0 company)   e.g. tierB-000762 tierB-000853 tierB-001130
;;   B: (And (Agent $e0 $x0) (Member $x0 company))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p201677   cosine 0.9560 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.38 / 0.96   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200868 ~ p203912   cosine 0.9556 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.84 / 0.79   gate: PASS
;;   A: (Member $e0 study)   e.g. tierB-000225 tierB-000710 tierB-001984
;;   B: (And (Agent $e0 $x0) (Member $e0 study))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200730 ~ p201110   cosine 0.9533 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 1.22 / 0.96   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202411 ~ p203253   cosine 0.9513 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.74 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202411 ~ p203690   cosine 0.9513 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.74 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201407 ~ p203987   cosine 0.9511 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 2.28 / 0.78   gate: PASS
;;   A: (Member $e0 close)   e.g. tierB-000218 tierB-000950 tierB-001926
;;   B: (And (Member $e0 close) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201818 ~ p202402   cosine 0.9510 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.93 / 0.83   gate: PASS
;;   A: (GroupOf $x0 boy)   e.g. tierB-001316 tierB-001457 tierB-001530
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 boy))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201756 ~ p202103   cosine 0.9502 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.14 / 0.93   gate: PASS
;;   A: (And (Member $e0 open) (Patient $e0 $x0))   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200866 ~ p202423   cosine 0.9492 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 1.45 / 0.92   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000174 tierB-000339 tierB-000455
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202099 ~ p202666   cosine 0.9484 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.78 / 0.65   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001348 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202099 ~ p203265   cosine 0.9484 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.78 / 0.65   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001348 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200507 ~ p200733   cosine 0.9479 (seeds 5/5 >= 0.85)   records 14 / 10 / 10   norms 1.51 / 1.30   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202627 ~ p204038   cosine 0.9476 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.62 / 0.53   gate: PASS
;;   A: (Might $e0)   e.g. tierB-000218 tierB-000969 tierB-001476
;;   B: (And (Might $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200678 ~ p203956   cosine 0.9471 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 2.14 / 0.62   gate: PASS
;;   A: (For $e0 $x0)   e.g. tierB-000049 tierB-001603 tierB-001786
;;   B: (And (For $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202415 ~ p203692   cosine 0.9471 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.85 / 0.75   gate: PASS
;;   A: (And (Agent $e0 $x0) (Over $e0 $x1))   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p200971   cosine 0.9463 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 1.42 / 1.04   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201766 ~ p203260   cosine 0.9463 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.30 / 0.87   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $e1))   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201766 ~ p203922   cosine 0.9463 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.30 / 0.87   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $e1))   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201851 ~ p203260   cosine 0.9463 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.30 / 0.87   gate: PASS
;;   A: (Stimulus $e0 $e1)   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201851 ~ p203922   cosine 0.9463 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.30 / 0.87   gate: PASS
;;   A: (Stimulus $e0 $e1)   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200975 ~ p201313   cosine 0.9460 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 1.05 / 0.87   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000103 tierB-000338 tierB-000725
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p201570   cosine 0.9459 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.81 / 0.73   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201763 ~ p202104   cosine 0.9453 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.07 / 0.93   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001168 tierB-001251 tierB-001693
;;   B: (And (Member $x0 new) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202442 ~ p203714   cosine 0.9453 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.05 / 0.87   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0))   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202442 ~ p204013   cosine 0.9453 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.05 / 0.87   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0))   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202590 ~ p203714   cosine 0.9453 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.05 / 0.87   gate: PASS
;;   A: (Member $e0 receive)   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202590 ~ p204013   cosine 0.9453 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.05 / 0.87   gate: PASS
;;   A: (Member $e0 receive)   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201729 ~ p203242   cosine 0.9444 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.04 / 0.60   gate: PASS
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>))   e.g. tierB-000738 tierB-000772 tierB-001534
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202436 ~ p203685   cosine 0.9438 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 1.01 / 0.86   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0))   e.g. tierB-000775 tierB-001649 tierB-001875
;;   B: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201349 ~ p203276   cosine 0.9434 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.27 / 0.78   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live))   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201349 ~ p203970   cosine 0.9434 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.27 / 0.78   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live))   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201409 ~ p204000   cosine 0.9434 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.13 / 0.76   gate: PASS
;;   A: (Member $e0 help)   e.g. tierB-000299 tierB-000858 tierB-001094
;;   B: (And (Member $e0 help) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201761 ~ p203719   cosine 0.9430 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.98 / 0.65   gate: PASS
;;   A: (And (Member $e0 turn) (Past $e0))   e.g. tierB-000476 tierB-000654 tierB-001675
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201732 ~ p203250   cosine 0.9418 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.00 / 0.69   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p201754   cosine 0.9417 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.61 / 0.94   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000298 tierB-000425 tierB-000704
;;   B: (And (Member $e0 leave) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200556 ~ p200846   cosine 0.9411 (seeds 5/5 >= 0.85)   records 13 / 9 / 9   norms 1.39 / 1.53   gate: PASS
;;   A: (Member $x0 person)   e.g. tierB-000316 tierB-000338 tierB-000628
;;   B: (And (Agent $e0 $x0) (Member $x0 person))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p201110   cosine 0.9393 (seeds 5/5 >= 0.85)   records 11 / 7 / 7   norms 1.28 / 0.96   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201759 ~ p203715   cosine 0.9387 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.25 / 0.83   gate: PASS
;;   A: (And (Member $e0 stand) (Past $e0))   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201759 ~ p204018   cosine 0.9387 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.25 / 0.83   gate: PASS
;;   A: (And (Member $e0 stand) (Past $e0))   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201829 ~ p203715   cosine 0.9387 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.25 / 0.83   gate: PASS
;;   A: (Member $e0 stand)   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201829 ~ p204018   cosine 0.9387 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.25 / 0.83   gate: PASS
;;   A: (Member $e0 stand)   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202314 ~ p202677   cosine 0.9386 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.75 / 0.66   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201400 ~ p202301   cosine 0.9382 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.22 / 1.00   gate: PASS
;;   A: (Already $e0)   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201400 ~ p202416   cosine 0.9382 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.22 / 1.00   gate: PASS
;;   A: (Already $e0)   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201407 ~ p203908   cosine 0.9382 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 2.28 / 0.74   gate: PASS
;;   A: (Member $e0 close)   e.g. tierB-000950 tierB-001205 tierB-001926
;;   B: (And (Agent $e0 $x0) (Member $e0 close))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200505 ~ p200848   cosine 0.9381 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.79 / 1.35   gate: PASS
;;   A: (Instrument $e0 $x0)   e.g. tierB-000222 tierB-000392 tierB-000444
;;   B: (And (Instrument $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201174 ~ p202103   cosine 0.9378 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.23 / 0.93   gate: PASS
;;   A: (Member $e0 open)   e.g. tierB-000056 tierB-001487 tierB-001523
;;   B: (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200678 ~ p202401   cosine 0.9374 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 2.14 / 0.85   gate: PASS
;;   A: (For $e0 $x0)   e.g. tierB-000049 tierB-000712 tierB-001663
;;   B: (And (Agent $e0 $x0) (For $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201406 ~ p203703   cosine 0.9373 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.26 / 0.80   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201406 ~ p203985   cosine 0.9373 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.26 / 0.80   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200972 ~ p203280   cosine 0.9369 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.24 / 0.60   gate: PASS
;;   A: (And (Obligated $e0) (Patient $e0 $x0))   e.g. tierB-001520 tierB-001622 tierB-001761
;;   B: (And (Member $x0 thing) (Obligated $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201733 ~ p203691   cosine 0.9358 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.24 / 0.88   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 watch))   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201733 ~ p204025   cosine 0.9358 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.24 / 0.88   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 watch))   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Member $e0 watch) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201406 ~ p203685   cosine 0.9353 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.26 / 0.86   gate: PASS
;;   A: (Member $e0 cause)   e.g. tierB-000775 tierB-001649 tierB-001875
;;   B: (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200628 ~ p203962   cosine 0.9352 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 2.26 / 0.70   gate: PASS
;;   A: (Past (LocatedIn $x0 $x1))   e.g. tierB-000126 tierB-001108 tierB-001286
;;   B: (And (GroupOf $x0 person) (Past (LocatedIn $x0 $x1)))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201412 ~ p203691   cosine 0.9352 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.38 / 0.88   gate: PASS
;;   A: (Member $e0 watch)   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201412 ~ p204025   cosine 0.9352 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.38 / 0.88   gate: PASS
;;   A: (Member $e0 watch)   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Member $e0 watch) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201763 ~ p202665   cosine 0.9341 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.07 / 0.77   gate: PASS
;;   A: (And (Member $x0 new) (Theme $e0 $x0))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200999 ~ p204028   cosine 0.9332 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.98 / 0.63   gate: PASS
;;   A: (Member $x0 sky)   e.g. tierB-000937 tierB-001124 tierB-001940
;;   B: (And (Member $x0 blue) (Member $x0 sky))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200973 ~ p201312   cosine 0.9327 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 1.08 / 0.96   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201412 ~ p204024   cosine 0.9321 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.38 / 0.74   gate: PASS
;;   A: (Member $e0 watch)   e.g. tierB-000651 tierB-001720 tierB-001800
;;   B: (And (Member $e0 watch) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p201731   cosine 0.9317 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 1.61 / 0.92   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000100 tierB-000298 tierB-000713
;;   B: (And (Agent $e0 $x0) (Member $e0 leave))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200506 ~ p200731   cosine 0.9316 (seeds 5/5 >= 0.85)   records 14 / 10 / 10   norms 1.75 / 1.49   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012 tierB-000115 tierB-000204
;;   B: (And (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200733 ~ p201253   cosine 0.9305 (seeds 5/5 >= 0.85)   records 10 / 6 / 6   norms 1.30 / 0.84   gate: PASS
;;   A: (And (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200508 ~ p200853   cosine 0.9303 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.62 / 1.30   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000150 tierB-000769 tierB-000775
;;   B: (And (Past $e0) (Recipient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201353 ~ p202311   cosine 0.9302 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.04 / 0.79   gate: PASS
;;   A: (And (Member $e0 take) (Theme $e0 $x0))   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201563 ~ p201866   cosine 0.9285 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.77 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200508 ~ p200847   cosine 0.9275 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.62 / 1.02   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000485 tierB-000715 tierB-000769
;;   B: (And (Agent $e0 $x0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201175 ~ p201741   cosine 0.9273 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.28 / 1.08   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001003 tierB-001334 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200748 ~ p202096   cosine 0.9271 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 1.76 / 1.07   gate: PASS
;;   A: (Member $x0 cat)   e.g. tierB-000073 tierB-000381 tierB-001183
;;   B: (And (Agent $e0 $x0) (Member $x0 cat) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200748 ~ p202413   cosine 0.9271 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 1.76 / 1.07   gate: PASS
;;   A: (Member $x0 cat)   e.g. tierB-000073 tierB-000381 tierB-001183
;;   B: (And (Agent $e0 $x0) (Member $x0 cat))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200505 ~ p200966   cosine 0.9263 (seeds 5/5 >= 0.85)   records 14 / 8 / 8   norms 1.79 / 1.24   gate: PASS
;;   A: (Instrument $e0 $x0)   e.g. tierB-000016 tierB-000392 tierB-000733
;;   B: (And (Instrument $e0 $x0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201144 ~ p201668   cosine 0.9263 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.07 / 0.91   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200853 ~ p201669   cosine 0.9259 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.30 / 0.74   gate: PASS
;;   A: (And (Past $e0) (Recipient $e0 $x0))   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202098 ~ p202665   cosine 0.9259 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.92 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))   e.g. tierB-001251 tierB-001693 tierB-001762
;;   B: (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201141 ~ p202305   cosine 0.9250 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.21 / 0.81   gate: PASS
;;   A: (And (Goal $e0 $x0) (Patient $e0 $x1))   e.g. tierB-000482 tierB-001453 tierB-001579
;;   B: (And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201816 ~ p203942   cosine 0.9248 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.83 / 0.61   gate: PASS
;;   A: (During $e0 $e1)   e.g. tierB-000867 tierB-001782 tierB-001809
;;   B: (And (During $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201769 ~ p202315   cosine 0.9235 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.89 / 0.80   gate: PASS
;;   A: (And (Source $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000781 tierB-001325 tierB-001540
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201736 ~ p203247   cosine 0.9226 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.90 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Result $e0 $e1))   e.g. tierB-000747 tierB-001920 tierB-001976
;;   B: (And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201736 ~ p203694   cosine 0.9226 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.90 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Result $e0 $e1))   e.g. tierB-000747 tierB-001920 tierB-001976
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201853 ~ p203953   cosine 0.9225 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.04 / 0.58   gate: PASS
;;   A: (Time $e0 today)   e.g. tierB-000495 tierB-000631 tierB-000808
;;   B: (And (Experiencer $e0 $x0) (Time $e0 today))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200627 ~ p204037   cosine 0.9217 (seeds 5/5 >= 0.85)   records 12 / 3 / 3   norms 1.76 / 0.65   gate: PASS
;;   A: (Member $x0 weather)   e.g. tierB-000517 tierB-000748 tierB-001491
;;   B: (And (Member $x0 weather) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p202307   cosine 0.9208 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.76 / 0.73   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201849 ~ p203692   cosine 0.9208 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.95 / 0.75   gate: PASS
;;   A: (Over $e0 $x0)   e.g. tierB-000871 tierB-000889 tierB-001534
;;   B: (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200407 ~ p201355   cosine 0.9202 (seeds 5/5 >= 0.85)   records 17 / 6 / 6   norms 2.43 / 1.01   gate: PASS
;;   A: (Member $e0 use)   e.g. tierB-000089 tierB-000866 tierB-000938
;;   B: (And (Member $e0 use) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200629 ~ p202426   cosine 0.9202 (seeds 5/5 >= 0.85)   records 12 / 4 / 4   norms 2.00 / 0.85   gate: PASS
;;   A: (Time $e0 now)   e.g. tierB-000144 tierB-000744 tierB-000880
;;   B: (And (Experiencer $e0 $x0) (Time $e0 now))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201342 ~ p202097   cosine 0.9184 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.63 / 0.64   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001182 tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202462 ~ p203283   cosine 0.9174 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.74 / 0.61   gate: PASS
;;   A: (And (Theme $e0 $e1) (Theme $e1 $x0))   e.g. tierB-000339 tierB-000400 tierB-000401
;;   B: (And (Past $e0) (Theme $e0 $e1) (Theme $e1 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201758 ~ p202302   cosine 0.9172 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 1.09 / 0.97   gate: PASS
;;   A: (And (Member $e0 sleep) (Ongoing $e0))   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202450 ~ p203699   cosine 0.9169 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.76 / 0.66   gate: PASS
;;   A: (And (Member $e0 walk) (Ongoing $e0))   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p200970   cosine 0.9165 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 1.42 / 1.20   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000216 tierB-000400
;;   B: (And (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200970 ~ p201681   cosine 0.9163 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 1.20 / 0.83   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201853 ~ p204044   cosine 0.9161 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 1.04 / 0.59   gate: PASS
;;   A: (Time $e0 today)   e.g. tierB-000631 tierB-000808 tierB-001762
;;   B: (And (Past $e0) (Time $e0 today))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200679 ~ p201744   cosine 0.9132 (seeds 5/5 >= 0.85)   records 11 / 5 / 5   norms 2.03 / 1.43   gate: PASS
;;   A: (GroupOf $x0 thing)   e.g. tierB-000162 tierB-000483 tierB-001069
;;   B: (And (GroupOf $x0 thing) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201818 ~ p203248   cosine 0.9131 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.93 / 0.66   gate: PASS
;;   A: (GroupOf $x0 boy)   e.g. tierB-001457 tierB-001530 tierB-001840
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200624 ~ p200961   cosine 0.9118 (seeds 5/5 >= 0.85)   records 12 / 8 / 8   norms 1.65 / 1.10   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000410 tierB-000587 tierB-000648
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200407 ~ p202412   cosine 0.9114 (seeds 5/5 >= 0.85)   records 17 / 4 / 4   norms 2.43 / 0.68   gate: PASS
;;   A: (Member $e0 use)   e.g. tierB-000268 tierB-000850 tierB-001098
;;   B: (And (Agent $e0 $x0) (Member $e0 use))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200408 ~ p202451   cosine 0.9114 (seeds 5/5 >= 0.85)   records 17 / 4 / 4   norms 2.42 / 0.73   gate: PASS
;;   A: (Member $x0 house)   e.g. tierB-000441 tierB-001005 tierB-001687
;;   B: (And (Member $x0 house) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200750 ~ p202452   cosine 0.9098 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 2.02 / 0.90   gate: PASS
;;   A: (Member $x0 tree)   e.g. tierB-000176 tierB-000277 tierB-001476
;;   B: (And (Member $x0 tree) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200866 ~ p203696   cosine 0.9098 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.45 / 0.81   gate: PASS
;;   A: (Member $e0 need)   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201409 ~ p203939   cosine 0.9096 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.13 / 0.76   gate: PASS
;;   A: (Member $e0 help)   e.g. tierB-000299 tierB-000319 tierB-001094
;;   B: (And (Can $e0) (Member $e0 help))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200627 ~ p203952   cosine 0.9083 (seeds 4/5 >= 0.85)   records 12 / 3 / 3   norms 1.76 / 0.64   gate: PASS
;;   A: (Member $x0 weather)   e.g. tierB-000495 tierB-000565 tierB-000748
;;   B: (And (Experiencer $e0 $x0) (Member $x0 weather))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201178 ~ p203254   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 1.19 / 0.68   gate: PASS
;;   A: (Member $x0 company)   e.g. tierB-000762 tierB-000853 tierB-001932
;;   B: (And (Agent $e0 $x0) (Member $x0 company) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p201761   cosine 0.9065 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 1.09 / 0.98   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202308 ~ p202668   cosine 0.9064 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203267   cosine 0.9064 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203273   cosine 0.9064 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202308 ~ p203613   cosine 0.9064 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203708   cosine 0.9064 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203724   cosine 0.9064 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200746 ~ p202311   cosine 0.9063 (seeds 5/5 >= 0.85)   records 10 / 4 / 4   norms 1.45 / 0.79   gate: PASS
;;   A: (Member $e0 take)   e.g. tierB-000252 tierB-000942 tierB-000987
;;   B: (And (Member $e0 take) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200938 ~ p201003   cosine 0.9062 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.78 / 0.73   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200938 ~ p201004   cosine 0.9062 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.78 / 0.73   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200869 ~ p203948   cosine 0.9061 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.69 / 0.68   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-000144 tierB-000419 tierB-001515
;;   B: (And (Experiencer $e0 $x0) (Member $e0 work))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p202312   cosine 0.9054 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.09 / 0.82   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200848 ~ p202306   cosine 0.9049 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 1.35 / 0.77   gate: PASS
;;   A: (And (Instrument $e0 $x0) (Past $e0))   e.g. tierB-000392 tierB-001143 tierB-001429
;;   B: (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201871 ~ p202674   cosine 0.9048 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.75 / 0.60   gate: PASS
;;   A: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200869 ~ p203916   cosine 0.9030 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.69 / 0.73   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001134 tierB-001813 tierB-001873
;;   B: (And (Agent $e0 $x0) (Member $e0 work))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200867 ~ p201732   cosine 0.9019 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.52 / 1.00   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000160 tierB-000648 tierB-001125
;;   B: (And (Agent $e0 $x0) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200872 ~ p203966   cosine 0.9019 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 1.20 / 0.69   gate: PASS
;;   A: (Member $x0 city)   e.g. tierB-000153 tierB-000546 tierB-000680
;;   B: (And (LocatedIn $x0 $x1) (Member $x1 city))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200996 ~ p203276   cosine 0.9016 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.76 / 0.78   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200996 ~ p203970   cosine 0.9016 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 1.76 / 0.78   gate: PASS
;;   A: (Member $e0 live)   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201668 ~ p203608   cosine 0.9002 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.91 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201668 ~ p203677   cosine 0.9002 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.91 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201668 ~ p203698   cosine 0.9002 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.91 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201668 ~ p203959   cosine 0.9002 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.91 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201175 ~ p202302   cosine 0.8994 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 1.28 / 0.97   gate: PASS
;;   A: (Member $e0 sleep)   e.g. tierB-001334 tierB-001753 tierB-001891
;;   B: (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200966 ~ p202306   cosine 0.8991 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 1.24 / 0.77   gate: PASS
;;   A: (And (Instrument $e0 $x0) (Patient $e0 $x1))   e.g. tierB-000392 tierB-001143 tierB-001429
;;   B: (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201751 ~ p202307   cosine 0.8947 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.80 / 0.73   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200343 ~ p200423   cosine 0.8935 (seeds 5/5 >= 0.85)   records 20 / 16 / 16   norms 1.54 / 1.44   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000166 tierB-000339 tierB-000410
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201570 ~ p201869   cosine 0.8922 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.73 / 0.65   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201570 ~ p202310   cosine 0.8922 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.73 / 0.65   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201871 ~ p202677   cosine 0.8905 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.75 / 0.66   gate: PASS
;;   A: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200498 ~ p200832   cosine 0.8886 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 1.53 / 1.20   gate: PASS
;;   A: (And (Location $e0 $x0) (Patient $e0 $x1))   e.g. tierB-000034 tierB-000291 tierB-000383
;;   B: (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200505 ~ p202306   cosine 0.8873 (seeds 5/5 >= 0.85)   records 14 / 4 / 4   norms 1.79 / 0.77   gate: PASS
;;   A: (Instrument $e0 $x0)   e.g. tierB-000392 tierB-001143 tierB-001429
;;   B: (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p201352   cosine 0.8869 (seeds 5/5 >= 0.85)   records 13 / 6 / 6   norms 1.69 / 1.23   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000577 tierB-000672 tierB-000890
;;   B: (And (Member $e0 get) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201348 ~ p203678   cosine 0.8868 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.00 / 0.57   gate: PASS
;;   A: (And (Goal $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000462 tierB-001132 tierB-001860
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200846 ~ p201562   cosine 0.8853 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.53 / 1.00   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person))   e.g. tierB-000338 tierB-000747 tierB-001813
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202456 ~ p203281   cosine 0.8843 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.82 / 0.74   gate: PASS
;;   A: (And (Ongoing $e0) (Theme $e0 $e1))   e.g. tierB-001130 tierB-001557 tierB-001940
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200847 ~ p201669   cosine 0.8824 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.02 / 0.74   gate: PASS
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1))   e.g. tierB-000769 tierB-000775 tierB-000793
;;   B: (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200851 ~ p201568   cosine 0.8823 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 1.69 / 1.00   gate: PASS
;;   A: (And (Member $x0 thing) (Theme $e0 $x0))   e.g. tierB-000080 tierB-000252 tierB-000865
;;   B: (And (Member $x0 thing) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200106 ~ p200140   cosine 0.8819 (seeds 2/5 >= 0.85)   records 48 / 37 / 37   norms 1.94 / 1.59   gate: PASS
;;   A: (Goal $e0 $x0)   e.g. tierB-000111 tierB-000178 tierB-000204
;;   B: (And (Goal $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202592 ~ p204014   cosine 0.8795 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.73 / 0.52   gate: PASS
;;   A: (Member $e0 run)   e.g. tierB-000178 tierB-001153 tierB-001563
;;   B: (And (Member $e0 run) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200865 ~ p201146   cosine 0.8793 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.15 / 1.02   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201354 ~ p202312   cosine 0.8764 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.95 / 0.82   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200965 ~ p203676   cosine 0.8762 (seeds 4/5 >= 0.85)   records 8 / 3 / 3   norms 1.09 / 0.63   gate: PASS
;;   A: (And (Future $e0) (Theme $e0 $x0))   e.g. tierB-000453 tierB-001266 tierB-001626
;;   B: (And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200507 ~ p201253   cosine 0.8755 (seeds 5/5 >= 0.85)   records 14 / 6 / 6   norms 1.51 / 0.84   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p201144   cosine 0.8735 (seeds 5/5 >= 0.85)   records 12 / 7 / 7   norms 1.52 / 1.07   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000255 tierB-000277
;;   B: (And (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201435 ~ p201869   cosine 0.8723 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201435 ~ p202310   cosine 0.8723 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201567 ~ p201869   cosine 0.8723 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201567 ~ p202310   cosine 0.8723 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200361 ~ p201728   cosine 0.8717 (seeds 5/5 >= 0.85)   records 19 / 5 / 5   norms 2.26 / 0.71   gate: PASS
;;   A: (Can $e0)   e.g. tierB-000156 tierB-000556 tierB-000745
;;   B: (And (Agent $e0 $x0) (Can $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201346 ~ p203696   cosine 0.8701 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.97 / 0.81   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000339 tierB-000455 tierB-001496
;;   B: (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p201570   cosine 0.8691 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.81 / 0.73   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201564 ~ p201867   cosine 0.8686 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.90 / 0.80   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000858 tierB-000942 tierB-001697
;;   B: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200969 ~ p201312   cosine 0.8674 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 1.10 / 0.96   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201411 ~ p203914   cosine 0.8624 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.88 / 0.49   gate: PASS
;;   A: (Member $e0 talk)   e.g. tierB-000550 tierB-001219 tierB-001666
;;   B: (And (Agent $e0 $x0) (Member $e0 talk))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p203719   cosine 0.8621 (seeds 3/5 >= 0.85)   records 7 / 3 / 3   norms 1.09 / 0.65   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-001675
;;   B: (And (Member $e0 turn) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200877 ~ p202454   cosine 0.8611 (seeds 4/5 >= 0.85)   records 9 / 4 / 4   norms 1.40 / 0.82   gate: PASS
;;   A: (Probably $e0)   e.g. tierB-000517 tierB-001891 tierB-001910
;;   B: (And (Ongoing $e0) (Probably $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p202308   cosine 0.8588 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.76 / 0.70   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200449 ~ p202629   cosine 0.8578 (seeds 4/5 >= 0.85)   records 16 / 4 / 4   norms 2.04 / 0.71   gate: PASS
;;   A: (SubsetOf $x0 $x1)   e.g. tierB-000799 tierB-001111 tierB-001628
;;   B: (ProportionOf $x0 $x1 most)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200682 ~ p202097   cosine 0.8572 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 1.25 / 0.64   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001182 tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201112 ~ p201435   cosine 0.8570 (seeds 1/5 >= 0.85)   records 7 / 5 / 5   norms 0.81 / 0.69   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p201567   cosine 0.8570 (seeds 1/5 >= 0.85)   records 7 / 5 / 5   norms 0.81 / 0.69   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200867 ~ p204009   cosine 0.8566 (seeds 2/5 >= 0.85)   records 9 / 3 / 3   norms 1.52 / 0.70   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000089 tierB-000648 tierB-000816
;;   B: (And (Member $e0 play) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201310 ~ p203612   cosine 0.8554 (seeds 3/5 >= 0.85)   records 6 / 3 / 3   norms 0.99 / 0.87   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200865 ~ p201312   cosine 0.8546 (seeds 5/5 >= 0.85)   records 9 / 6 / 6   norms 1.15 / 0.96   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200849 ~ p201679   cosine 0.8541 (seeds 3/5 >= 0.85)   records 9 / 5 / 5   norms 1.34 / 1.03   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0))   e.g. tierB-000073 tierB-000964 tierB-001339
;;   B: (And (Member $e0 make) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201411 ~ p204022   cosine 0.8527 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.88 / 0.53   gate: PASS
;;   A: (Member $e0 talk)   e.g. tierB-000327 tierB-000550 tierB-001666
;;   B: (And (Member $e0 talk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200278 ~ p200284   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 1.09 / 1.09   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200278 ~ p200285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 1.09 / 1.09   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200278 ~ p200289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 1.09 / 1.09   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p200284 ~ p200285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 1.09 / 1.09   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200284 ~ p200289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 1.09 / 1.09   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200285 ~ p200289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 1.09 / 1.09   gate: PASS
;;   A: (And (Holder $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200584 ~ p200611   cosine 1.0000 (seeds 5/5 >= 0.85)   records 12 / 12 / 12   norms 0.87 / 0.87   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000465
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200754 ~ p200834   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.82 / 0.82   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201003 ~ p201004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.73 / 0.73   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201005 ~ p201055   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201005 ~ p201111   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201005 ~ p201143   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201055 ~ p201111   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201055 ~ p201143   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201111 ~ p201143   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201147 ~ p201173   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 1.28 / 1.28   gate: PASS
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000393 tierB-000412
;;   B: (Member $e0 kill)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201154 ~ p201182   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 1.29 / 1.29   gate: PASS
;;   A: (And (Past $e0) (Through $e0 $x0))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (Through $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201350 ~ p201405   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 1.05 / 1.05   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (Member $e0 capture)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201357 ~ p201426   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 1.36 / 1.36   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $e1))   e.g. tierB-000259 tierB-000903 tierB-001031
;;   B: (Patient $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201358 ~ p201427   cosine 1.0000 (seeds 5/5 >= 0.85)   records 6 / 6 / 6   norms 1.49 / 1.49   gate: PASS
;;   A: (And (Past $e0) (Time $e0 yesterday))   e.g. tierB-000237 tierB-000327 tierB-000565
;;   B: (Time $e0 yesterday)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201435 ~ p201567   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.69 / 0.69   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201561 ~ p201734   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.37 / 1.37   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 boy) (Past $e0))   e.g. tierB-000305 tierB-000337 tierB-000340
;;   B: (And (Agent $e0 $x0) (Member $x0 boy))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201565 ~ p201739   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.00 / 1.00   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000320 tierB-000779 tierB-000838
;;   B: (And (Cardinality $x0 <num>) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201653 ~ p201674   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201653 ~ p201675   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201653 ~ p201745   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201671 ~ p201737   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.06 / 1.06   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))   e.g. tierB-000500 tierB-000656 tierB-000782
;;   B: (And (Agent $e0 $x0) (Through $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201674 ~ p201675   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201674 ~ p201745   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201675 ~ p201745   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201676 ~ p201747   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.98 / 0.98   gate: PASS
;;   A: (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000215 tierB-000636 tierB-000852
;;   B: (And (Member $e0 capture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201678 ~ p201753   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.07 / 1.07   gate: PASS
;;   A: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000067 tierB-000412 tierB-001197
;;   B: (And (Member $e0 kill) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201749 ~ p201824   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.22 / 1.22   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000454 tierB-000768
;;   B: (Member $e0 contain)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201759 ~ p201829   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.25 / 1.25   gate: PASS
;;   A: (And (Member $e0 stand) (Past $e0))   e.g. tierB-000676 tierB-000712 tierB-001299
;;   B: (Member $e0 stand)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201766 ~ p201851   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.30 / 1.30   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $e1))   e.g. tierB-000176 tierB-000316 tierB-000659
;;   B: (Stimulus $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201767 ~ p201852   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.62 / 1.62   gate: PASS
;;   A: (And (Past $e0) (Time $e0 (Year <num>)))   e.g. tierB-000139 tierB-000309 tierB-000373
;;   B: (Time $e0 (Year <num>))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201768 ~ p201854   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 1.31 / 1.31   gate: PASS
;;   A: (And (Past $e0) (TimeAtMost $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001031
;;   B: (TimeAtMost $e0 (Year <num>))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p202265   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p202298   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201863 ~ p202299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201863 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201864 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201864 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201865 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201869 ~ p202310   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202096 ~ p202413   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.07 / 1.07   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 cat) (Past $e0))   e.g. tierB-000073 tierB-000381 tierB-001183
;;   B: (And (Agent $e0 $x0) (Member $x0 cat))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202102 ~ p202432   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.13 / 1.13   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))   e.g. tierB-000047 tierB-000502 tierB-001041
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202106 ~ p202453   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.09 / 1.09   gate: PASS
;;   A: (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000409 tierB-001070 tierB-001262
;;   B: (And (Of $x0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202107 ~ p202458   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-000087 tierB-001515
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202108 ~ p202460   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.84 / 0.84   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1))   e.g. tierB-000196 tierB-000320 tierB-000779
;;   B: (And (Patient $e0 $x0) (SubsetOf $x0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202265 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202265 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202265 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202265 ~ p202298   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202265 ~ p202299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202265 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202296 ~ p202404   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.17 / 1.17   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202297 ~ p202407   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.97 / 0.97   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (And (Agent $e0 $x0) (Member $e0 jump))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202297 ~ p202440   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.97 / 0.97   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202297 ~ p202585   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.97 / 0.97   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p202299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202298 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202299 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202299 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202299 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202299 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202300 ~ p202410   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Agent $e0 $x0) (Member $e0 swim))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202300 ~ p202446   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202301 ~ p202416   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.00 / 1.00   gate: PASS
;;   A: (And (Already $e0) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000034 tierB-000616 tierB-001000
;;   B: (And (Already $e0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202304 ~ p202427   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202407 ~ p202440   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.97 / 0.97   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (And (Member $e0 jump) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202407 ~ p202585   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.97 / 0.97   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 jump))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202409 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202409 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202409 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.61 / 0.61   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202410 ~ p202446   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 swim))   e.g. tierB-000782 tierB-001008 tierB-001268
;;   B: (And (Member $e0 swim) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202417 ~ p202554   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001134
;;   B: (Before $e0 $e1)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202435 ~ p202574   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.22 / 1.22   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-000849
;;   B: (Member $e0 buy)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202437 ~ p202577   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.56 / 0.56   gate: PASS
;;   A: (And (Member $e0 decide) (Past $e0))   e.g. tierB-000401 tierB-000563 tierB-001544
;;   B: (Member $e0 decide)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202439 ~ p202579   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.25 / 1.25   gate: PASS
;;   A: (And (Member $e0 find) (Past $e0))   e.g. tierB-000579 tierB-000585 tierB-000706
;;   B: (Member $e0 find)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202440 ~ p202585   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.97 / 0.97   gate: PASS
;;   A: (And (Member $e0 jump) (Past $e0))   e.g. tierB-000871 tierB-000889 tierB-001530
;;   B: (Member $e0 jump)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202441 ~ p202587   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.73 / 0.73   gate: PASS
;;   A: (And (Member $e0 pass) (Past $e0))   e.g. tierB-000649 tierB-001008 tierB-001762
;;   B: (Member $e0 pass)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202442 ~ p202590   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.05 / 1.05   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0))   e.g. tierB-000962 tierB-001035 tierB-001595
;;   B: (Member $e0 receive)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202443 ~ p202591   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 require) (Theme $e0 $x0))   e.g. tierB-000607 tierB-001436 tierB-001566
;;   B: (Member $e0 require)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202459 ~ p202633   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 1.22 / 1.22   gate: PASS
;;   A: (And (Past $e0) (TimeAtLeast $e0 (Year <num>)))   e.g. tierB-000215 tierB-000799 tierB-001629
;;   B: (TimeAtLeast $e0 (Year <num>))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p203609   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p203681   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202662 ~ p203682   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202662 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202663 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202663 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202664 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202666 ~ p203265   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000797 tierB-001348 tierB-001412
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202668 ~ p203267   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202668 ~ p203273   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202668 ~ p203613   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202668 ~ p203708   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202668 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
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

;; [same-records]  p203247 ~ p203694   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.72 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1))   e.g. tierB-000747 tierB-001920 tierB-001976
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203256 ~ p203920   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 plane) (Past $e0))   e.g. tierB-000045 tierB-000132 tierB-000298
;;   B: (And (Agent $e0 $x0) (Member $x0 plane))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203260 ~ p203922   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.87 / 0.87   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0))   e.g. tierB-000316 tierB-001720 tierB-001911
;;   B: (And (Agent $e0 $x0) (Stimulus $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203261 ~ p203924   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.77 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203261 ~ p203925   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.77 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203264 ~ p203937   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.87 / 0.87   gate: PASS
;;   A: (And (Before $e0 $e1) (Past $e0) (Past $e1))   e.g. tierB-000412 tierB-000688 tierB-001302
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203267 ~ p203273   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203267 ~ p203613   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203267 ~ p203708   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203267 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203269 ~ p203710   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203269 ~ p204004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203269 ~ p204005   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203271 ~ p203720   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.01 / 1.01   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203273 ~ p203613   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203273 ~ p203708   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203273 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203276 ~ p203970   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))   e.g. tierB-000048 tierB-000371 tierB-000524
;;   B: (And (Location $e0 $x0) (Member $x0 house))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203277 ~ p204021   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203278 ~ p204030   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $x0 fire) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000890 tierB-001163 tierB-001302
;;   B: (And (Member $x0 fire) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203279 ~ p204033   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.82 / 0.82   gate: PASS
;;   A: (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000876 tierB-001070 tierB-001423
;;   B: (And (Member $x0 picture) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203282 ~ p204049   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.56 / 0.56   gate: PASS
;;   A: (And (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000547 tierB-001219
;;   B: (And (Recipient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203608 ~ p203677   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203608 ~ p203698   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203608 ~ p203959   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203609 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203609 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203609 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203609 ~ p203681   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203609 ~ p203682   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203609 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203610 ~ p203683   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203610 ~ p203684   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203610 ~ p203907   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203613 ~ p203708   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203613 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203677 ~ p203698   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203677 ~ p203959   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203679 ~ p203902   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (And (Agent $e0 $x0) (Goal $e0 home))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203679 ~ p203961   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (And (Goal $e0 home) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203679 ~ p204242   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (Goal $e0 home)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p203682   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203681 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203682 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203682 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203682 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203682 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203683 ~ p203684   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203683 ~ p203907   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203684 ~ p203907   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))   e.g. tierB-000852 tierB-001342 tierB-001990
;;   B: (And (Agent $e0 $x0) (Member $e0 capture))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203686 ~ p203909   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.01 / 1.01   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 draw) (Past $e0))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (And (Agent $e0 $x0) (Member $e0 draw))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203686 ~ p203993   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.01 / 1.01   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 draw) (Past $e0))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (And (Member $e0 draw) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203686 ~ p204269   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.01 / 1.01   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 draw) (Past $e0))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (Member $e0 draw)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203688 ~ p204008   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.72 / 0.72   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))   e.g. tierB-001125 tierB-001433 tierB-001840
;;   B: (And (Member $e0 play) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203690 ~ p203253   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.66 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203691 ~ p204025   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.88 / 0.88   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1))   e.g. tierB-000258 tierB-000520 tierB-001800
;;   B: (And (Member $e0 watch) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203693 ~ p203261   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.77 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203693 ~ p203924   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.77 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203693 ~ p203925   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.77 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203697 ~ p203958   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.55 / 0.55   gate: PASS
;;   A: (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))   e.g. tierB-001563 tierB-001579 tierB-001902
;;   B: (And (Goal $e0 $x0) (Manner $e0 quickly))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203698 ~ p203959   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 come) (Past $e0))   e.g. tierB-000387 tierB-001534 tierB-001963
;;   B: (And (Goal $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203702 ~ p203984   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.13 / 1.13   gate: PASS
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000367 tierB-000368 tierB-001690
;;   B: (And (Member $e0 buy) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203703 ~ p203985   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.80 / 0.80   gate: PASS
;;   A: (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000775 tierB-000805 tierB-001649
;;   B: (And (Member $e0 cause) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203704 ~ p203991   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Member $e0 create) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000089 tierB-000728 tierB-000863
;;   B: (And (Member $e0 create) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203704 ~ p203992   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Member $e0 create) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000089 tierB-000728 tierB-000863
;;   B: (And (Member $e0 create) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203704 ~ p204267   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Member $e0 create) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000089 tierB-000728 tierB-000863
;;   B: (Member $e0 create)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203705 ~ p203994   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203705 ~ p203995   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203706 ~ p203997   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.60 / 0.60   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203707 ~ p203998   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.01 / 1.01   gate: PASS
;;   A: (And (Member $e0 find) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000579 tierB-000585 tierB-001139
;;   B: (And (Member $e0 find) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203708 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.68 / 0.68   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203709 ~ p204002   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.06 / 1.06   gate: PASS
;;   A: (And (Member $e0 increase) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000680 tierB-000690 tierB-000965
;;   B: (And (Member $e0 increase) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203709 ~ p204003   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.06 / 1.06   gate: PASS
;;   A: (And (Member $e0 increase) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000680 tierB-000690 tierB-000965
;;   B: (And (Member $e0 increase) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203710 ~ p204004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203710 ~ p204005   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203713 ~ p204010   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.94 / 0.94   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203713 ~ p204011   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.94 / 0.94   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203714 ~ p204013   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.87 / 0.87   gate: PASS
;;   A: (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000962 tierB-001595 tierB-001693
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203715 ~ p204018   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.83 / 0.83   gate: PASS
;;   A: (And (Member $e0 stand) (Ongoing $e0) (Past $e0))   e.g. tierB-000676 tierB-001299 tierB-001604
;;   B: (And (Member $e0 stand) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203716 ~ p204019   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (And (Member $e0 stick) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203716 ~ p204020   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (And (Member $e0 stick) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203716 ~ p204287   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (Member $e0 stick)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203717 ~ p203277   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203717 ~ p204021   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.81 / 0.81   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203902 ~ p203961   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (And (Goal $e0 home) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203902 ~ p204242   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 home))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (Goal $e0 home)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203906 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203906 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203906 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.63 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203909 ~ p203993   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.01 / 1.01   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 draw))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (And (Member $e0 draw) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203909 ~ p204269   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.01 / 1.01   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 draw))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (Member $e0 draw)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203924 ~ p203925   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.77 / 0.77   gate: PASS
;;   A: (And (Agent $e0 $x0) (To $e0 $e1))   e.g. tierB-000258 tierB-001035 tierB-001867
;;   B: (And (Agent $e0 $x0) (To $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, shape-parallel]  p203928 ~ p203929   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.90 / 0.90   gate: PASS
;;   A: (And (Agent $e0 david) (Ongoing $e0))   e.g. tierB-000117 tierB-000173 tierB-000827
;;   B: (And (Agent $e0 david) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203936 ~ p204234   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.59 / 0.59   gate: PASS
;;   A: (And (At $e0 $x0) (Past $e0))   e.g. tierB-000340 tierB-001316 tierB-001572
;;   B: (At $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203946 ~ p204262   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e0 beautiful))   e.g. tierB-000565 tierB-000904 tierB-001920
;;   B: (Member $e0 beautiful)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203960 ~ p204241   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.10 / 1.10   gate: PASS
;;   A: (And (Goal $e0 bed) (Member $e0 go))   e.g. tierB-000012 tierB-001418 tierB-001496
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203961 ~ p204242   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.16 / 1.16   gate: PASS
;;   A: (And (Goal $e0 home) (Past $e0))   e.g. tierB-000575 tierB-001086 tierB-001743
;;   B: (Goal $e0 home)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203982 ~ p204263   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Member $e0 break_out) (Past $e0))   e.g. tierB-001302 tierB-001641 tierB-001694
;;   B: (Member $e0 break_out)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203983 ~ p204265   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.54 / 0.54   gate: PASS
;;   A: (And (Member $e0 build) (Patient $e0 $x0))   e.g. tierB-000063 tierB-000932 tierB-001867
;;   B: (Member $e0 build)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203991 ~ p203992   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Member $e0 create) (Past $e0))   e.g. tierB-000089 tierB-000728 tierB-000863
;;   B: (And (Member $e0 create) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203991 ~ p204267   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Member $e0 create) (Past $e0))   e.g. tierB-000089 tierB-000728 tierB-000863
;;   B: (Member $e0 create)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203992 ~ p204267   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.02 / 1.02   gate: PASS
;;   A: (And (Member $e0 create) (Patient $e0 $x0))   e.g. tierB-000089 tierB-000728 tierB-000863
;;   B: (Member $e0 create)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203993 ~ p204269   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.01 / 1.01   gate: PASS
;;   A: (And (Member $e0 draw) (Past $e0))   e.g. tierB-000781 tierB-001245 tierB-001250
;;   B: (Member $e0 draw)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203994 ~ p203995   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Member $e0 eat) (Past $e0))   e.g. tierB-000338 tierB-000616 tierB-001551
;;   B: (And (Member $e0 eat) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204002 ~ p204003   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.06 / 1.06   gate: PASS
;;   A: (And (Member $e0 increase) (Past $e0))   e.g. tierB-000680 tierB-000690 tierB-000965
;;   B: (And (Member $e0 increase) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204004 ~ p204005   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204010 ~ p204011   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.94 / 0.94   gate: PASS
;;   A: (And (Member $e0 present) (Past $e0))   e.g. tierB-000876 tierB-001486 tierB-001932
;;   B: (And (Member $e0 present) (Theme $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204017 ~ p204285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.71 / 0.71   gate: PASS
;;   A: (And (Member $e0 solve) (Patient $e0 $x0))   e.g. tierB-000935 tierB-001202 tierB-001970
;;   B: (Member $e0 solve)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204019 ~ p204020   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (And (Member $e0 stick) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204019 ~ p204287   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Member $e0 stick) (Past $e0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (Member $e0 stick)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204020 ~ p204287   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Member $e0 stick) (Patient $e0 $x0))   e.g. tierB-000383 tierB-000482 tierB-001027
;;   B: (Member $e0 stick)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204045 ~ p204368   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.54 / 0.54   gate: PASS
;;   A: (And (Past $e0) (With $e0 $x0))   e.g. tierB-000193 tierB-001094 tierB-001397
;;   B: (With $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202406 ~ p202580   cosine 0.9988 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.73 / 0.91   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 fly))   e.g. tierB-000045 tierB-000121 tierB-000801
;;   B: (Member $e0 fly)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204219 ~ p203928   cosine 0.9964 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.55 / 0.90   gate: PASS
;;   A: (Agent $e0 david)   e.g. tierB-000117 tierB-000173 tierB-000827
;;   B: (And (Agent $e0 david) (Ongoing $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204219 ~ p203929   cosine 0.9964 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.55 / 0.90   gate: PASS
;;   A: (Agent $e0 david)   e.g. tierB-000117 tierB-000173 tierB-000827
;;   B: (And (Agent $e0 david) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204225 ~ p203931   cosine 0.9928 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.79 / 1.26   gate: PASS
;;   A: (Agent $e0 mark)   e.g. tierB-000075 tierB-000239 tierB-000400
;;   B: (And (Agent $e0 mark) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204218 ~ p203927   cosine 0.9844 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.83 / 0.60   gate: PASS
;;   A: (Agent $e0 daniel)   e.g. tierB-000078 tierB-000201 tierB-000576
;;   B: (And (Agent $e0 daniel) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p204230 ~ p203933   cosine 0.9703 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 1.00 / 0.71   gate: PASS
;;   A: (Agent $e0 michael)   e.g. tierB-000252 tierB-000929 tierB-001094
;;   B: (And (Agent $e0 michael) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology
