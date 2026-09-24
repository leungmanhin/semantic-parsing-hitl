;; FUSE-NF §4.3.5 Autoencoder Analysis — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   ae_faithful_beta2.jsonl (adopted k / beta) and ae_faithful_beta2_dial/k<k>_beta<b>.jsonl   (every pair with cosine >= 0.8, whatever the floor)
;;   ae_faithful_beta2_weights/k<k>_beta<b>_seed<s>.tsv   (one encoder weight vector per unit)
;;
;; BLOCK: bottleneck 32, sparsity beta 2, gate cosine >= 0.85 with norm floor init — the adopted setting. The other bottlenecks of the dial:
;;   ae_faithful_beta2_dial/k<k>_beta<b>.metta   (the cosine and floor dials need no extra files: every record shows
;;   its cosine and norms, and the .md counts the passes per threshold and floor)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   units           out_tier_b/patterns2_faithful.jsonl: 945 rooted-subtree units of the §4.3.1 faithful view, taken as-is
;;                   (subsumed units and identical columns included — the faithful arm never pre-filters)
;;   records         out_tier_b/canonical_substrate.jsonl: 1950 records
;;   vectorisation   count of each unit's matches (variable bindings) per record, recounted with the miner's enumerator
;;                   (k = 4 atoms, 28 eligible atoms per record, surface atoms excluded, constants verbatim)
;;                   and verified against the inventory (column sums = occurrences, non-zero rows = support sets);
;;                   raw counts, no scaling: 7956 non-zero cells, 363 repeat matches beyond the first
;;   autoencoder     one hidden layer of 32 sigmoid units, linear output, tied decoder x_hat = h W + c;
;;                   init W uniform(+-sqrt(6/(F+k))), b = 0, c = the column means
;;   loss            mean over records of the squared reconstruction error summed over units + 0.0001 ||W||^2
;;                   + beta 2 * sum_j KL(rho 0.1 || mean activation of hidden unit j)   (beta 0 = the plain shallow AE)
;;   training        full batch, Adam lr 0.01, 10000 epochs, float32, 8 thread(s), seed 0 adopted;
;;                   seeds 0..4 retrain the same model for the stability count
;;                   this block: reconstruction 2.0971 per record, R^2 0.5288, mean activation 0.1007;
;;                   reconstruction at each tenth of the epochs: 2.3184 / 2.2169 / 2.1403 / 2.1164 / 2.1037 / 2.1003 / 2.0987 / 2.0982 / 2.0974 / 2.0972
;;   ties            cosine between the two units' encoder weight vectors (the columns of W, 32-dimensional);
;;                   gate cosine >= 0.85 (dial 0.80, 0.85, 0.90, 0.95); recording floor 0.8
;;   norm floor      a unit ENTERS the comparison at encoder-vector norm >= 0.256 (init); dial none 0.000 / median 0.157 / init 0.256;
;;                   init = the initialisation norm a*sqrt(k/3), a = sqrt(6/(F+k)) — training grew the vector beyond where it
;;                   started; median = the median unit norm; 295 of 945 units enter under this block's floor
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

;; ==================== TIED PAIRS: 797 pass the gate — exclusive 13 (shape-parallel 4 = the rules), overlapping 290, nested 378, same-records 116 — among the 446040 pairs of 945 units (295 entering); 1074 pairs above the cosine gate have a side below the floor; 2599 pairs recorded in the JSONL ====================

;; [exclusive, shape-parallel]  p201313 ~ p202315   cosine 0.9108 (seeds 5/5 >= 0.85)   records 6 / 4 / 0   norms 0.48 / 0.28   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000103 tierB-000338 tierB-000781 tierB-001325
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Theme $e0 $x1) -> (Patient $e0 $x0)
(Implication (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1)) (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1)))

;; [exclusive, shape-parallel]  p200975 ~ p201769   cosine 0.8975 (seeds 5/5 >= 0.85)   records 8 / 5 / 0   norms 0.56 / 0.32   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000103 tierB-000338 tierB-000400 tierB-000781
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Theme $e0 $x1) -> (Patient $e0 $x0)
(Implication (And (Source $e0 $x0) (Theme $e0 $x1)) (And (Patient $e0 $x0) (Source $e0 $x1)))

;; [exclusive, shape-parallel]  p200869 ~ p202576   cosine 0.8926 (seeds 4/5 >= 0.85)   records 9 / 4 / 0   norms 0.38 / 0.53   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-000144 tierB-000212 tierB-000030 tierB-000502
;;   B: (Member $e0 cry)
;;   substitution: (Member $e0 cry) -> (Member $e0 work)
(Implication (Member $e0 cry) (Member $e0 work))

;; [exclusive, shape-parallel]  p200668 ~ p200965   cosine 0.8740 (seeds 2/5 >= 0.85)   records 11 / 8 / 0   norms 0.86 / 0.56   gate: PASS
;;   A: (And (Future $e0) (Patient $e0 $x0))   e.g. tierB-000082 tierB-000108 tierB-000281 tierB-000453
;;   B: (And (Future $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Future $e0) (Theme $e0 $x0)) (And (Future $e0) (Patient $e0 $x0)))

;; [exclusive]  p201762 ~ p202576   cosine 0.9093 (seeds 4/5 >= 0.85)   records 5 / 4 / 0   norms 0.35 / 0.53   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-000419 tierB-000867 tierB-000030 tierB-000502
;;   B: (Member $e0 cry)
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p201313 ~ p201769   cosine 0.9075 (seeds 5/5 >= 0.85)   records 6 / 5 / 0   norms 0.48 / 0.32   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000103 tierB-000338 tierB-000400 tierB-000781
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p200975 ~ p202315   cosine 0.9073 (seeds 5/5 >= 0.85)   records 8 / 4 / 0   norms 0.56 / 0.28   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000103 tierB-000338 tierB-000781 tierB-001325
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p201670 ~ p203706   cosine 0.8747 (seeds 3/5 >= 0.85)   records 5 / 3 / 0   norms 0.37 / 0.26   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))   e.g. tierB-000338 tierB-000693 tierB-000456 tierB-000779
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p201670 ~ p203997   cosine 0.8747 (seeds 3/5 >= 0.85)   records 5 / 3 / 0   norms 0.37 / 0.26   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))   e.g. tierB-000338 tierB-000693 tierB-000456 tierB-000779
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p201769 ~ p203706   cosine 0.8740 (seeds 5/5 >= 0.85)   records 5 / 3 / 0   norms 0.32 / 0.26   gate: PASS
;;   A: (And (Source $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000400 tierB-000781 tierB-000456 tierB-000779
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p201769 ~ p203997   cosine 0.8740 (seeds 5/5 >= 0.85)   records 5 / 3 / 0   norms 0.32 / 0.26   gate: PASS
;;   A: (And (Source $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000400 tierB-000781 tierB-000456 tierB-000779
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p202315 ~ p203706   cosine 0.8653 (seeds 5/5 >= 0.85)   records 4 / 3 / 0   norms 0.28 / 0.26   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000781 tierB-001325 tierB-000456 tierB-000779
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [exclusive]  p202315 ~ p203997   cosine 0.8653 (seeds 5/5 >= 0.85)   records 4 / 3 / 0   norms 0.28 / 0.26   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000781 tierB-001325 tierB-000456 tierB-000779
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units are not shape-parallel: the tie records shared sentence context, not a rewrite

;; [overlapping]  p202445 ~ p202107   cosine 0.9987 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.87 / 0.86   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202445 ~ p202458   cosine 0.9987 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.87 / 0.86   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201750 ~ p201752   cosine 0.9984 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.74 / 0.72   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202102 ~ p203612   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.80 / 0.83   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202432 ~ p203612   cosine 0.9977 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.80 / 0.83   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table))   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200969 ~ p200973   cosine 0.9971 (seeds 5/5 >= 0.85)   records 8 / 8 / 6   norms 0.93 / 0.90   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201750 ~ p201751   cosine 0.9970 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.74 / 0.71   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201830 ~ p202107   cosine 0.9965 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.88 / 0.86   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201830 ~ p202458   cosine 0.9965 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.88 / 0.86   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202303 ~ p202102   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.85 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202303 ~ p202432   cosine 0.9959 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.85 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200865 ~ p200973   cosine 0.9958 (seeds 5/5 >= 0.85)   records 9 / 8 / 6   norms 1.01 / 0.90   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201751 ~ p202308   cosine 0.9952 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.71 / 0.70   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200973 ~ p201146   cosine 0.9948 (seeds 5/5 >= 0.85)   records 8 / 7 / 6   norms 0.90 / 0.89   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202307 ~ p202308   cosine 0.9937 (seeds 5/5 >= 0.85)   records 4 / 4 / 3   norms 0.69 / 0.70   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201751 ~ p201752   cosine 0.9936 (seeds 5/5 >= 0.85)   records 5 / 5 / 3   norms 0.71 / 0.72   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200378 ~ p200865   cosine 0.9933 (seeds 5/5 >= 0.85)   records 18 / 9 / 7   norms 1.23 / 1.01   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (Member $e0 hear)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200969 ~ p201146   cosine 0.9930 (seeds 5/5 >= 0.85)   records 8 / 7 / 6   norms 0.93 / 0.89   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201310 ~ p202303   cosine 0.9928 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201310 ~ p202102   cosine 0.9927 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.86 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201310 ~ p202432   cosine 0.9927 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.86 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201752 ~ p202307   cosine 0.9915 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.72 / 0.69   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200962 ~ p204023   cosine 0.9877 (seeds 5/5 >= 0.85)   records 8 / 3 / 1   norms 0.88 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200378 ~ p200969   cosine 0.9876 (seeds 5/5 >= 0.85)   records 18 / 8 / 6   norms 1.23 / 0.93   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202296 ~ p203243   cosine 0.9872 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.92 / 0.84   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202404 ~ p203243   cosine 0.9872 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.92 / 0.84   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201054 ~ p204023   cosine 0.9871 (seeds 5/5 >= 0.85)   records 7 / 3 / 1   norms 0.71 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))   e.g. tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200961 ~ p201732   cosine 0.9857 (seeds 5/5 >= 0.85)   records 8 / 5 / 3   norms 0.41 / 0.27   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201749 ~ p203243   cosine 0.9855 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.94 / 0.84   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201824 ~ p203243   cosine 0.9855 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.94 / 0.84   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202632 ~ p203255   cosine 0.9841 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.52 / 0.68   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p204357   cosine 0.9819 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 1.03 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773 tierB-001870
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202632 ~ p204357   cosine 0.9798 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.52 / 0.29   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200359 ~ p200975   cosine 0.9787 (seeds 5/5 >= 0.85)   records 19 / 8 / 6   norms 1.21 / 0.56   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000103 tierB-000338 tierB-000725
;;   B: (And (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201313 ~ p203706   cosine 0.9785 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.48 / 0.26   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201313 ~ p203997   cosine 0.9785 (seeds 5/5 >= 0.85)   records 6 / 3 / 2   norms 0.48 / 0.26   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202309 ~ p203712   cosine 0.9784 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.35 / 0.27   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))   e.g. tierB-000325 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p202632   cosine 0.9777 (seeds 5/5 >= 0.85)   records 6 / 4 / 1   norms 1.03 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773
;;   B: (Time $e0 tonight)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202630 ~ p203960   cosine 0.9773 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.30 / 0.32   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012
;;   B: (And (Goal $e0 bed) (Member $e0 go))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p202630 ~ p204241   cosine 0.9773 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.30 / 0.32   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201144 ~ p201341   cosine 0.9772 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 0.36 / 0.34   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201309 ~ p202303   cosine 0.9768 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.90 / 0.85   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203960 ~ p204043   cosine 0.9766 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.32 / 0.30   gate: PASS
;;   A: (And (Goal $e0 bed) (Member $e0 go))   e.g. tierB-000012
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p204043 ~ p204241   cosine 0.9766 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.30 / 0.32   gate: PASS
;;   A: (And (Past $e0) (Time $e0 night))   e.g. tierB-000012
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201309 ~ p202102   cosine 0.9764 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.90 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201309 ~ p202432   cosine 0.9764 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.90 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200493 ~ p202631   cosine 0.9753 (seeds 5/5 >= 0.85)   records 14 / 4 / 1   norms 1.15 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001275
;;   B: (Time $e0 this_year)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201762 ~ p201830   cosine 0.9750 (seeds 5/5 >= 0.85)   records 5 / 5 / 2   norms 0.35 / 0.88   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001515 tierB-001873
;;   B: (Member $e0 stop)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200624 ~ p201732   cosine 0.9725 (seeds 5/5 >= 0.85)   records 12 / 5 / 3   norms 0.50 / 0.27   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (Member $e0 play))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203689 ~ p203253   cosine 0.9725 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.36 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203689 ~ p203690   cosine 0.9725 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.36 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201145 ~ p201351   cosine 0.9719 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 0.29 / 0.33   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201309 ~ p201310   cosine 0.9718 (seeds 5/5 >= 0.85)   records 6 / 6 / 3   norms 0.90 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200962 ~ p201832   cosine 0.9717 (seeds 5/5 >= 0.85)   records 8 / 5 / 1   norms 0.88 / 0.30   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierB-001618
;;   B: (Member $e0 travel)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201762 ~ p202445   cosine 0.9711 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.35 / 0.87   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201562 ~ p201563   cosine 0.9700 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.37 / 0.37   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203255 ~ p204357   cosine 0.9695 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.68 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201762 ~ p202675   cosine 0.9688 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.35 / 0.85   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201762 ~ p203277   cosine 0.9688 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.35 / 0.85   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201762 ~ p203717   cosine 0.9688 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.35 / 0.85   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201762 ~ p204021   cosine 0.9688 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.35 / 0.85   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200975 ~ p203706   cosine 0.9687 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 0.56 / 0.26   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200975 ~ p203997   cosine 0.9687 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 0.56 / 0.26   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201054 ~ p201832   cosine 0.9672 (seeds 5/5 >= 0.85)   records 7 / 5 / 1   norms 0.71 / 0.30   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))   e.g. tierB-001618
;;   B: (Member $e0 travel)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201732 ~ p202094   cosine 0.9653 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.27 / 0.30   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 play))   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200970 ~ p200971   cosine 0.9649 (seeds 5/5 >= 0.85)   records 8 / 8 / 5   norms 0.56 / 0.61   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200869 ~ p201830   cosine 0.9648 (seeds 5/5 >= 0.85)   records 9 / 5 / 2   norms 0.38 / 0.88   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001515 tierB-001873
;;   B: (Member $e0 stop)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201762 ~ p202107   cosine 0.9646 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.35 / 0.86   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201762 ~ p202458   cosine 0.9646 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.35 / 0.86   gate: PASS
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200849 ~ p201149   cosine 0.9639 (seeds 5/5 >= 0.85)   records 9 / 7 / 4   norms 0.64 / 0.53   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0))   e.g. tierB-000325 tierB-001504 tierB-001594
;;   B: (And (Member $e0 make) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200256 ~ p200343   cosine 0.9637 (seeds 5/5 >= 0.85)   records 24 / 20 / 14   norms 0.82 / 0.81   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000470 tierB-000485 tierB-000738
;;   B: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201867 ~ p203695   cosine 0.9635 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.39 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202632 ~ p203689   cosine 0.9632 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.52 / 0.36   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p204357   cosine 0.9629 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.40 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773 tierB-001870
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200470 ~ p200963   cosine 0.9624 (seeds 5/5 >= 0.85)   records 15 / 8 / 7   norms 1.02 / 0.65   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200667 ~ p202102   cosine 0.9606 (seeds 5/5 >= 0.85)   records 11 / 4 / 2   norms 0.92 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200667 ~ p202432   cosine 0.9606 (seeds 5/5 >= 0.85)   records 11 / 4 / 2   norms 0.92 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200869 ~ p202445   cosine 0.9601 (seeds 5/5 >= 0.85)   records 9 / 4 / 2   norms 0.38 / 0.87   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200667 ~ p202303   cosine 0.9593 (seeds 5/5 >= 0.85)   records 11 / 4 / 3   norms 0.92 / 0.85   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200869 ~ p202675   cosine 0.9577 (seeds 5/5 >= 0.85)   records 9 / 3 / 2   norms 0.38 / 0.85   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200869 ~ p203277   cosine 0.9577 (seeds 5/5 >= 0.85)   records 9 / 3 / 2   norms 0.38 / 0.85   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200869 ~ p203717   cosine 0.9577 (seeds 5/5 >= 0.85)   records 9 / 3 / 2   norms 0.38 / 0.85   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200869 ~ p204021   cosine 0.9577 (seeds 5/5 >= 0.85)   records 9 / 3 / 2   norms 0.38 / 0.85   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201754 ~ p203269   cosine 0.9576 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201754 ~ p203710   cosine 0.9576 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201754 ~ p204004   cosine 0.9576 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201754 ~ p204005   cosine 0.9576 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Member $e0 leave) (Past $e0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201670 ~ p202315   cosine 0.9567 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.37 / 0.28   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))   e.g. tierB-000781 tierB-001693
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202632 ~ p203253   cosine 0.9557 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.52 / 0.40   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202632 ~ p203690   cosine 0.9557 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.52 / 0.40   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202445 ~ p202576   cosine 0.9546 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.87 / 0.53   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030
;;   B: (Member $e0 cry)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202411 ~ p202632   cosine 0.9544 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.44 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-001773
;;   B: (Time $e0 tonight)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202107 ~ p202576   cosine 0.9539 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.86 / 0.53   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030
;;   B: (Member $e0 cry)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202458 ~ p202576   cosine 0.9539 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.86 / 0.53   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030
;;   B: (Member $e0 cry)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200469 ~ p200667   cosine 0.9534 (seeds 5/5 >= 0.85)   records 15 / 11 / 6   norms 0.92 / 0.92   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0))   e.g. tierB-000963 tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202576 ~ p202675   cosine 0.9533 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.53 / 0.85   gate: PASS
;;   A: (Member $e0 cry)   e.g. tierB-000030
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202576 ~ p203277   cosine 0.9533 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.53 / 0.85   gate: PASS
;;   A: (Member $e0 cry)   e.g. tierB-000030
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202576 ~ p203717   cosine 0.9533 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.53 / 0.85   gate: PASS
;;   A: (Member $e0 cry)   e.g. tierB-000030
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202576 ~ p204021   cosine 0.9533 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.53 / 0.85   gate: PASS
;;   A: (Member $e0 cry)   e.g. tierB-000030
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200869 ~ p202107   cosine 0.9528 (seeds 5/5 >= 0.85)   records 9 / 4 / 2   norms 0.38 / 0.86   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200869 ~ p202458   cosine 0.9528 (seeds 5/5 >= 0.85)   records 9 / 4 / 2   norms 0.38 / 0.86   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-001515 tierB-001873
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201830 ~ p202576   cosine 0.9521 (seeds 5/5 >= 0.85)   records 5 / 4 / 1   norms 0.88 / 0.53   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030
;;   B: (Member $e0 cry)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200849 ~ p203712   cosine 0.9518 (seeds 5/5 >= 0.85)   records 9 / 3 / 2   norms 0.64 / 0.27   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0))   e.g. tierB-000325 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200256 ~ p200423   cosine 0.9459 (seeds 5/5 >= 0.85)   records 24 / 16 / 12   norms 0.82 / 0.75   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000470 tierB-000485 tierB-000738
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200682 ~ p204357   cosine 0.9446 (seeds 5/5 >= 0.85)   records 11 / 3 / 2   norms 0.53 / 0.29   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001773 tierB-001870
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200964 ~ p202296   cosine 0.9428 (seeds 5/5 >= 0.85)   records 8 / 4 / 1   norms 0.98 / 0.92   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200964 ~ p202404   cosine 0.9428 (seeds 5/5 >= 0.85)   records 8 / 4 / 1   norms 0.98 / 0.92   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. tierB-000101
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200359 ~ p201769   cosine 0.9426 (seeds 5/5 >= 0.85)   records 19 / 5 / 4   norms 1.21 / 0.32   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000781 tierB-001325 tierB-001540
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200436 ~ p200423   cosine 0.9423 (seeds 5/5 >= 0.85)   records 16 / 16 / 12   norms 0.76 / 0.75   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000470 tierB-000485 tierB-000738
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201108 ~ p203687   cosine 0.9415 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 0.59 / 0.28   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))   e.g. tierB-001182 tierB-001457
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200831 ~ p202102   cosine 0.9409 (seeds 5/5 >= 0.85)   records 9 / 4 / 2   norms 0.86 / 0.80   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200831 ~ p202432   cosine 0.9409 (seeds 5/5 >= 0.85)   records 9 / 4 / 2   norms 0.86 / 0.80   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200499 ~ p200584   cosine 0.9408 (seeds 5/5 >= 0.85)   records 14 / 12 / 9   norms 0.79 / 0.78   gate: PASS
;;   A: (And (Member $e0 start) (Past $e0))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200499 ~ p200611   cosine 0.9408 (seeds 5/5 >= 0.85)   records 14 / 12 / 9   norms 0.79 / 0.78   gate: PASS
;;   A: (And (Member $e0 start) (Past $e0))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201435 ~ p201871   cosine 0.9405 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.50 / 0.36   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201567 ~ p201871   cosine 0.9405 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.50 / 0.36   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201670 ~ p201769   cosine 0.9403 (seeds 5/5 >= 0.85)   records 5 / 5 / 2   norms 0.37 / 0.32   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))   e.g. tierB-000781 tierB-001693
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201677 ~ p203706   cosine 0.9402 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.27 / 0.26   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201677 ~ p203997   cosine 0.9402 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.27 / 0.26   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p203687 ~ p203711   cosine 0.9397 (seeds 5/5 >= 0.85)   records 3 / 3 / 2   norms 0.28 / 0.28   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))   e.g. tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200964 ~ p201749   cosine 0.9383 (seeds 5/5 >= 0.85)   records 8 / 5 / 1   norms 0.98 / 0.94   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. tierB-000101
;;   B: (And (Member $e0 contain) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200964 ~ p201824   cosine 0.9383 (seeds 5/5 >= 0.85)   records 8 / 5 / 1   norms 0.98 / 0.94   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. tierB-000101
;;   B: (Member $e0 contain)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200867 ~ p200961   cosine 0.9374 (seeds 4/5 >= 0.85)   records 9 / 8 / 3   norms 0.30 / 0.41   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201153 ~ p201752   cosine 0.9374 (seeds 5/5 >= 0.85)   records 7 / 5 / 4   norms 0.76 / 0.72   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203689 ~ p203255   cosine 0.9366 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.36 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200850 ~ p201435   cosine 0.9357 (seeds 5/5 >= 0.85)   records 9 / 5 / 4   norms 0.57 / 0.50   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200850 ~ p201567   cosine 0.9357 (seeds 5/5 >= 0.85)   records 9 / 5 / 4   norms 0.57 / 0.50   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200975 ~ p201670   cosine 0.9344 (seeds 5/5 >= 0.85)   records 8 / 5 / 1   norms 0.56 / 0.37   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000338
;;   B: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200831 ~ p202303   cosine 0.9340 (seeds 5/5 >= 0.85)   records 9 / 4 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201351 ~ p201313   cosine 0.9340 (seeds 5/5 >= 0.85)   records 6 / 6 / 2   norms 0.33 / 0.48   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200831 ~ p201310   cosine 0.9337 (seeds 5/5 >= 0.85)   records 9 / 6 / 3   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p203255   cosine 0.9337 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.40 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200729 ~ p200965   cosine 0.9335 (seeds 4/5 >= 0.85)   records 10 / 8 / 3   norms 0.80 / 0.56   gate: PASS
;;   A: (And (Agent $e0 $x0) (Future $e0))   e.g. tierB-000453 tierB-001266 tierB-001626
;;   B: (And (Future $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200850 ~ p201570   cosine 0.9325 (seeds 5/5 >= 0.85)   records 9 / 5 / 4   norms 0.57 / 0.51   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201313 ~ p201670   cosine 0.9322 (seeds 5/5 >= 0.85)   records 6 / 5 / 1   norms 0.48 / 0.37   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000338
;;   B: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201145 ~ p203706   cosine 0.9315 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 0.29 / 0.26   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201145 ~ p203997   cosine 0.9315 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 0.29 / 0.26   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201681 ~ p202411   cosine 0.9307 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.46 / 0.44   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201869 ~ p202677   cosine 0.9300 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.46 / 0.32   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202310 ~ p202677   cosine 0.9300 (seeds 5/5 >= 0.85)   records 4 / 3 / 2   norms 0.46 / 0.32   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201153 ~ p201750   cosine 0.9297 (seeds 5/5 >= 0.85)   records 7 / 5 / 4   norms 0.76 / 0.74   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203253 ~ p204357   cosine 0.9293 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.40 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203690 ~ p204357   cosine 0.9293 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.40 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203695 ~ p204357   cosine 0.9292 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.40 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200970 ~ p202411   cosine 0.9288 (seeds 5/5 >= 0.85)   records 8 / 4 / 3   norms 0.56 / 0.44   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000469 tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p202632   cosine 0.9269 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.40 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773
;;   B: (Time $e0 tonight)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200684 ~ p201310   cosine 0.9263 (seeds 5/5 >= 0.85)   records 11 / 6 / 2   norms 0.38 / 0.86   gate: PASS
;;   A: (Member $x0 table)   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200831 ~ p201309   cosine 0.9258 (seeds 5/5 >= 0.85)   records 9 / 6 / 3   norms 0.86 / 0.90   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200684 ~ p203612   cosine 0.9255 (seeds 5/5 >= 0.85)   records 11 / 3 / 2   norms 0.38 / 0.83   gate: PASS
;;   A: (Member $x0 table)   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203253 ~ p203255   cosine 0.9255 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.40 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203690 ~ p203255   cosine 0.9255 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.40 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200624 ~ p200867   cosine 0.9251 (seeds 2/5 >= 0.85)   records 12 / 9 / 3   norms 0.50 / 0.30   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000648 tierB-001125 tierB-001433
;;   B: (Member $e0 play)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200684 ~ p202303   cosine 0.9248 (seeds 5/5 >= 0.85)   records 11 / 4 / 2   norms 0.38 / 0.85   gate: PASS
;;   A: (Member $x0 table)   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201681 ~ p203253   cosine 0.9243 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.46 / 0.40   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201681 ~ p203690   cosine 0.9243 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.46 / 0.40   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200850 ~ p201112   cosine 0.9227 (seeds 5/5 >= 0.85)   records 9 / 7 / 4   norms 0.57 / 0.55   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202411 ~ p203255   cosine 0.9227 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.44 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200507 ~ p201174   cosine 0.9215 (seeds 4/5 >= 0.85)   records 14 / 7 / 5   norms 0.52 / 0.30   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-001487
;;   B: (Member $e0 open)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200667 ~ p200831   cosine 0.9209 (seeds 5/5 >= 0.85)   records 11 / 9 / 3   norms 0.92 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200731 ~ p203960   cosine 0.9202 (seeds 5/5 >= 0.85)   records 10 / 3 / 2   norms 0.63 / 0.32   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000012 tierB-001418
;;   B: (And (Goal $e0 bed) (Member $e0 go))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200731 ~ p204241   cosine 0.9202 (seeds 5/5 >= 0.85)   records 10 / 3 / 2   norms 0.63 / 0.32   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000012 tierB-001418
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201681 ~ p203689   cosine 0.9202 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.46 / 0.36   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200864 ~ p201313   cosine 0.9193 (seeds 4/5 >= 0.85)   records 9 / 6 / 2   norms 0.35 / 0.48   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000779 tierB-001364
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200730 ~ p200967   cosine 0.9191 (seeds 5/5 >= 0.85)   records 10 / 8 / 7   norms 0.36 / 0.35   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202411 ~ p204357   cosine 0.9189 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.44 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200192 ~ p204023   cosine 0.9188 (seeds 5/5 >= 0.85)   records 30 / 3 / 1   norms 1.98 / 0.29   gate: PASS
;;   A: (GroupOf $x0 person)   e.g. tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p203689   cosine 0.9188 (seeds 5/5 >= 0.85)   records 6 / 3 / 1   norms 1.03 / 0.36   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200470 ~ p201148   cosine 0.9187 (seeds 5/5 >= 0.85)   records 15 / 7 / 3   norms 1.02 / 0.52   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-000951 tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200867 ~ p202094   cosine 0.9183 (seeds 5/5 >= 0.85)   records 9 / 4 / 2   norms 0.30 / 0.30   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201564 ~ p203253   cosine 0.9183 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.47 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201564 ~ p203690   cosine 0.9183 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.47 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200864 ~ p200975   cosine 0.9180 (seeds 5/5 >= 0.85)   records 9 / 8 / 2   norms 0.35 / 0.56   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000779 tierB-001364
;;   B: (And (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200684 ~ p200831   cosine 0.9172 (seeds 5/5 >= 0.85)   records 11 / 9 / 2   norms 0.38 / 0.86   gate: PASS
;;   A: (Member $x0 table)   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201153 ~ p201751   cosine 0.9171 (seeds 5/5 >= 0.85)   records 7 / 5 / 3   norms 0.76 / 0.71   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203689 ~ p204357   cosine 0.9156 (seeds 5/5 >= 0.85)   records 3 / 3 / 1   norms 0.36 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200733 ~ p201174   cosine 0.9154 (seeds 4/5 >= 0.85)   records 10 / 7 / 5   norms 0.48 / 0.30   gate: PASS
;;   A: (And (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-000425 tierB-001487
;;   B: (Member $e0 open)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203255 ~ p203695   cosine 0.9154 (seeds 4/5 >= 0.85)   records 3 / 3 / 1   norms 0.68 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p203253   cosine 0.9153 (seeds 5/5 >= 0.85)   records 6 / 3 / 1   norms 1.03 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p203690   cosine 0.9153 (seeds 5/5 >= 0.85)   records 6 / 3 / 1   norms 1.03 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200470 ~ p203687   cosine 0.9142 (seeds 5/5 >= 0.85)   records 15 / 3 / 2   norms 1.02 / 0.28   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-001182 tierB-001457
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200731 ~ p204043   cosine 0.9139 (seeds 5/5 >= 0.85)   records 10 / 3 / 1   norms 0.63 / 0.30   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000012
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200682 ~ p202632   cosine 0.9133 (seeds 4/5 >= 0.85)   records 11 / 4 / 1   norms 0.53 / 0.52   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001773
;;   B: (Time $e0 tonight)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201564 ~ p202632   cosine 0.9132 (seeds 5/5 >= 0.85)   records 5 / 4 / 1   norms 0.47 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (Time $e0 tonight)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202632 ~ p203695   cosine 0.9131 (seeds 5/5 >= 0.85)   records 4 / 3 / 1   norms 0.52 / 0.40   gate: PASS
;;   A: (Time $e0 tonight)   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200731 ~ p202630   cosine 0.9121 (seeds 5/5 >= 0.85)   records 10 / 4 / 1   norms 0.63 / 0.30   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000012
;;   B: (Time $e0 night)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200975 ~ p201351   cosine 0.9117 (seeds 5/5 >= 0.85)   records 8 / 6 / 2   norms 0.56 / 0.33   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201153 ~ p202307   cosine 0.9114 (seeds 5/5 >= 0.85)   records 7 / 4 / 3   norms 0.76 / 0.69   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200747 ~ p203612   cosine 0.9111 (seeds 5/5 >= 0.85)   records 10 / 3 / 1   norms 0.29 / 0.83   gate: PASS
;;   A: (Member $x0 book)   e.g. tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201435 ~ p201570   cosine 0.9107 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.50 / 0.51   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201567 ~ p201570   cosine 0.9107 (seeds 5/5 >= 0.85)   records 5 / 5 / 4   norms 0.50 / 0.51   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200747 ~ p202102   cosine 0.9100 (seeds 5/5 >= 0.85)   records 10 / 4 / 1   norms 0.29 / 0.80   gate: PASS
;;   A: (Member $x0 book)   e.g. tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200747 ~ p202432   cosine 0.9100 (seeds 5/5 >= 0.85)   records 10 / 4 / 1   norms 0.29 / 0.80   gate: PASS
;;   A: (Member $x0 book)   e.g. tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p203695   cosine 0.9100 (seeds 4/5 >= 0.85)   records 6 / 3 / 1   norms 1.03 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200747 ~ p202303   cosine 0.9099 (seeds 5/5 >= 0.85)   records 10 / 4 / 1   norms 0.29 / 0.85   gate: PASS
;;   A: (Member $x0 book)   e.g. tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201564 ~ p204357   cosine 0.9096 (seeds 5/5 >= 0.85)   records 5 / 3 / 1   norms 0.47 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p202411   cosine 0.9095 (seeds 5/5 >= 0.85)   records 6 / 4 / 1   norms 1.03 / 0.44   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200850 ~ p202677   cosine 0.9092 (seeds 5/5 >= 0.85)   records 9 / 3 / 2   norms 0.57 / 0.32   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201354 ~ p202448   cosine 0.9085 (seeds 5/5 >= 0.85)   records 6 / 4 / 3   norms 0.31 / 0.36   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200747 ~ p201309   cosine 0.9071 (seeds 5/5 >= 0.85)   records 10 / 6 / 1   norms 0.29 / 0.90   gate: PASS
;;   A: (Member $x0 book)   e.g. tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201148 ~ p201149   cosine 0.9059 (seeds 5/5 >= 0.85)   records 7 / 7 / 3   norms 0.52 / 0.53   gate: PASS
;;   A: (And (Member $e0 make) (Ongoing $e0))   e.g. tierB-000325 tierB-001754 tierB-001809
;;   B: (And (Member $e0 make) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201867 ~ p202632   cosine 0.9053 (seeds 5/5 >= 0.85)   records 4 / 4 / 1   norms 0.39 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (Time $e0 tonight)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200359 ~ p201351   cosine 0.9045 (seeds 5/5 >= 0.85)   records 19 / 6 / 3   norms 1.21 / 0.33   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200359 ~ p201343   cosine 0.9041 (seeds 5/5 >= 0.85)   records 19 / 6 / 5   norms 1.21 / 0.43   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000338 tierB-000693 tierB-000781
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201112 ~ p201359   cosine 0.9037 (seeds 5/5 >= 0.85)   records 7 / 6 / 5   norms 0.55 / 0.51   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200970 ~ p203253   cosine 0.9031 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 0.56 / 0.40   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200970 ~ p203690   cosine 0.9031 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 0.56 / 0.40   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201313 ~ p201677   cosine 0.9017 (seeds 4/5 >= 0.85)   records 6 / 5 / 2   norms 0.48 / 0.27   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201564 ~ p202411   cosine 0.9013 (seeds 5/5 >= 0.85)   records 5 / 4 / 2   norms 0.47 / 0.44   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200971 ~ p202411   cosine 0.9010 (seeds 5/5 >= 0.85)   records 8 / 4 / 3   norms 0.61 / 0.44   gate: PASS
;;   A: (And (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200469 ~ p201310   cosine 0.8999 (seeds 4/5 >= 0.85)   records 15 / 6 / 3   norms 0.92 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200668 ~ p200729   cosine 0.8997 (seeds 4/5 >= 0.85)   records 11 / 10 / 1   norms 0.86 / 0.80   gate: PASS
;;   A: (And (Future $e0) (Patient $e0 $x0))   e.g. tierB-001623
;;   B: (And (Agent $e0 $x0) (Future $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201867 ~ p204357   cosine 0.8972 (seeds 4/5 >= 0.85)   records 4 / 3 / 1   norms 0.39 / 0.29   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (Member $x0 young)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201108 ~ p203711   cosine 0.8971 (seeds 5/5 >= 0.85)   records 7 / 3 / 2   norms 0.59 / 0.28   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))   e.g. tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201343 ~ p202315   cosine 0.8961 (seeds 5/5 >= 0.85)   records 6 / 4 / 2   norms 0.43 / 0.28   gate: PASS
;;   A: (And (Agent $e0 $x0) (Source $e0 $x1))   e.g. tierB-000781 tierB-001693
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201564 ~ p203255   cosine 0.8961 (seeds 4/5 >= 0.85)   records 5 / 3 / 1   norms 0.47 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201867 ~ p203255   cosine 0.8960 (seeds 4/5 >= 0.85)   records 4 / 3 / 1   norms 0.39 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200975 ~ p201343   cosine 0.8947 (seeds 5/5 >= 0.85)   records 8 / 6 / 1   norms 0.56 / 0.43   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000338
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200747 ~ p201310   cosine 0.8946 (seeds 5/5 >= 0.85)   records 10 / 6 / 1   norms 0.29 / 0.86   gate: PASS
;;   A: (Member $x0 book)   e.g. tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200963 ~ p203711   cosine 0.8938 (seeds 5/5 >= 0.85)   records 8 / 3 / 2   norms 0.65 / 0.28   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make))   e.g. tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200469 ~ p202102   cosine 0.8928 (seeds 5/5 >= 0.85)   records 15 / 4 / 2   norms 0.92 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200469 ~ p202432   cosine 0.8928 (seeds 5/5 >= 0.85)   records 15 / 4 / 2   norms 0.92 / 0.80   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0))   e.g. tierB-001041 tierB-001078
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201149 ~ p201679   cosine 0.8925 (seeds 4/5 >= 0.85)   records 7 / 5 / 1   norms 0.53 / 0.37   gate: PASS
;;   A: (And (Member $e0 make) (Result $e0 $e1))   e.g. tierB-001594
;;   B: (And (Member $e0 make) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200359 ~ p200864   cosine 0.8912 (seeds 4/5 >= 0.85)   records 19 / 9 / 3   norms 1.21 / 0.35   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (Member $e0 fall)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200219 ~ p202631   cosine 0.8908 (seeds 1/5 >= 0.85)   records 27 / 4 / 1   norms 1.44 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1))   e.g. tierB-001275
;;   B: (Time $e0 this_year)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203253 ~ p203695   cosine 0.8889 (seeds 3/5 >= 0.85)   records 3 / 3 / 2   norms 0.40 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))   e.g. tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203690 ~ p203695   cosine 0.8889 (seeds 3/5 >= 0.85)   records 3 / 3 / 2   norms 0.40 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200187 ~ p201351   cosine 0.8882 (seeds 5/5 >= 0.85)   records 31 / 6 / 3   norms 1.60 / 0.33   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200963 ~ p201148   cosine 0.8878 (seeds 5/5 >= 0.85)   records 8 / 7 / 3   norms 0.65 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make))   e.g. tierB-001182 tierB-001457 tierB-001754
;;   B: (And (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200187 ~ p200864   cosine 0.8876 (seeds 4/5 >= 0.85)   records 31 / 9 / 3   norms 1.60 / 0.35   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (Member $e0 fall)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201145 ~ p201313   cosine 0.8874 (seeds 4/5 >= 0.85)   records 7 / 6 / 2   norms 0.29 / 0.48   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200975 ~ p201145   cosine 0.8862 (seeds 4/5 >= 0.85)   records 8 / 7 / 2   norms 0.56 / 0.29   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200849 ~ p201148   cosine 0.8861 (seeds 4/5 >= 0.85)   records 9 / 7 / 2   norms 0.64 / 0.52   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0))   e.g. tierB-000325 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200684 ~ p201309   cosine 0.8857 (seeds 5/5 >= 0.85)   records 11 / 6 / 2   norms 0.38 / 0.90   gate: PASS
;;   A: (Member $x0 table)   e.g. tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201253 ~ p203269   cosine 0.8852 (seeds 4/5 >= 0.85)   records 6 / 3 / 2   norms 0.33 / 0.26   gate: PASS
;;   A: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201253 ~ p203710   cosine 0.8852 (seeds 4/5 >= 0.85)   records 6 / 3 / 2   norms 0.33 / 0.26   gate: PASS
;;   A: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201253 ~ p204004   cosine 0.8852 (seeds 4/5 >= 0.85)   records 6 / 3 / 2   norms 0.33 / 0.26   gate: PASS
;;   A: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201253 ~ p204005   cosine 0.8852 (seeds 4/5 >= 0.85)   records 6 / 3 / 2   norms 0.33 / 0.26   gate: PASS
;;   A: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201343 ~ p201313   cosine 0.8852 (seeds 4/5 >= 0.85)   records 6 / 6 / 1   norms 0.43 / 0.48   gate: PASS
;;   A: (And (Agent $e0 $x0) (Source $e0 $x1))   e.g. tierB-000338
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200506 ~ p204043   cosine 0.8848 (seeds 5/5 >= 0.85)   records 14 / 3 / 1   norms 0.67 / 0.30   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200731 ~ p201347   cosine 0.8847 (seeds 5/5 >= 0.85)   records 10 / 6 / 5   norms 0.63 / 0.33   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200829 ~ p202094   cosine 0.8843 (seeds 2/5 >= 0.85)   records 9 / 4 / 2   norms 0.52 / 0.30   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001125 tierB-001511
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201729 ~ p202563   cosine 0.8840 (seeds 5/5 >= 0.85)   records 5 / 4 / 1   norms 0.38 / 0.28   gate: PASS
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>))   e.g. tierB-000738
;;   B: (GroupOf $x0 girl)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p200506 ~ p202630   cosine 0.8827 (seeds 5/5 >= 0.85)   records 14 / 4 / 1   norms 0.67 / 0.30   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012
;;   B: (Time $e0 night)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p201564   cosine 0.8821 (seeds 4/5 >= 0.85)   records 6 / 5 / 1   norms 1.03 / 0.47   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200850 ~ p201359   cosine 0.8815 (seeds 5/5 >= 0.85)   records 9 / 6 / 4   norms 0.57 / 0.51   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200667 ~ p200747   cosine 0.8800 (seeds 4/5 >= 0.85)   records 11 / 10 / 1   norms 0.92 / 0.29   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001078
;;   B: (Member $x0 book)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200554 ~ p201153   cosine 0.8780 (seeds 5/5 >= 0.85)   records 13 / 7 / 4   norms 0.88 / 0.76   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201867 ~ p203253   cosine 0.8780 (seeds 3/5 >= 0.85)   records 4 / 3 / 1   norms 0.39 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201867 ~ p203690   cosine 0.8780 (seeds 3/5 >= 0.85)   records 4 / 3 / 1   norms 0.39 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201342 ~ p201867   cosine 0.8777 (seeds 4/5 >= 0.85)   records 6 / 4 / 1   norms 1.03 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200192 ~ p201832   cosine 0.8775 (seeds 5/5 >= 0.85)   records 30 / 5 / 1   norms 1.98 / 0.30   gate: PASS
;;   A: (GroupOf $x0 person)   e.g. tierB-001618
;;   B: (Member $e0 travel)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201344 ~ p201565   cosine 0.8769 (seeds 5/5 >= 0.85)   records 6 / 5 / 2   norms 0.32 / 0.27   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))   e.g. tierB-000320 tierB-000779
;;   B: (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201344 ~ p201739   cosine 0.8769 (seeds 5/5 >= 0.85)   records 6 / 5 / 2   norms 0.32 / 0.27   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))   e.g. tierB-000320 tierB-000779
;;   B: (And (Cardinality $x0 <num>) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201564 ~ p203689   cosine 0.8765 (seeds 4/5 >= 0.85)   records 5 / 3 / 1   norms 0.47 / 0.36   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200975 ~ p201677   cosine 0.8751 (seeds 4/5 >= 0.85)   records 8 / 5 / 2   norms 0.56 / 0.27   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200850 ~ p201871   cosine 0.8750 (seeds 5/5 >= 0.85)   records 9 / 4 / 2   norms 0.57 / 0.36   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201108 ~ p201148   cosine 0.8749 (seeds 5/5 >= 0.85)   records 7 / 7 / 2   norms 0.59 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))   e.g. tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200667 ~ p200684   cosine 0.8737 (seeds 4/5 >= 0.85)   records 11 / 11 / 2   norms 0.92 / 0.38   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078
;;   B: (Member $x0 table)
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200469 ~ p200831   cosine 0.8718 (seeds 5/5 >= 0.85)   records 15 / 9 / 3   norms 0.92 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Location $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200971 ~ p203689   cosine 0.8714 (seeds 4/5 >= 0.85)   records 8 / 3 / 2   norms 0.61 / 0.36   gate: PASS
;;   A: (And (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202411 ~ p203695   cosine 0.8710 (seeds 3/5 >= 0.85)   records 4 / 3 / 2   norms 0.44 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200343 ~ p200436   cosine 0.8687 (seeds 2/5 >= 0.85)   records 20 / 16 / 12   norms 0.81 / 0.76   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000470 tierB-000485 tierB-000738
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p203695   cosine 0.8675 (seeds 3/5 >= 0.85)   records 4 / 3 / 1   norms 0.40 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201435 ~ p202677   cosine 0.8673 (seeds 2/5 >= 0.85)   records 5 / 3 / 2   norms 0.50 / 0.32   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201567 ~ p202677   cosine 0.8673 (seeds 2/5 >= 0.85)   records 5 / 3 / 2   norms 0.50 / 0.32   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201151 ~ p202431   cosine 0.8661 (seeds 1/5 >= 0.85)   records 7 / 4 / 3   norms 0.45 / 0.26   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000148 tierB-000805 tierB-000951
;;   B: (And (Location $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201680 ~ p202674   cosine 0.8645 (seeds 2/5 >= 0.85)   records 5 / 3 / 2   norms 0.37 / 0.33   gate: PASS
;;   A: (And (Member $e0 start) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201680 ~ p202677   cosine 0.8639 (seeds 5/5 >= 0.85)   records 5 / 3 / 2   norms 0.37 / 0.32   gate: PASS
;;   A: (And (Member $e0 start) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202411 ~ p201867   cosine 0.8637 (seeds 2/5 >= 0.85)   records 4 / 4 / 1   norms 0.44 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201570 ~ p201871   cosine 0.8620 (seeds 5/5 >= 0.85)   records 5 / 4 / 3   norms 0.51 / 0.36   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201359 ~ p201435   cosine 0.8610 (seeds 4/5 >= 0.85)   records 6 / 5 / 4   norms 0.51 / 0.50   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201359 ~ p201567   cosine 0.8610 (seeds 4/5 >= 0.85)   records 6 / 5 / 4   norms 0.51 / 0.50   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200359 ~ p201677   cosine 0.8606 (seeds 1/5 >= 0.85)   records 19 / 5 / 2   norms 1.21 / 0.27   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200470 ~ p200849   cosine 0.8597 (seeds 4/5 >= 0.85)   records 15 / 9 / 5   norms 1.02 / 0.64   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-000073 tierB-000964 tierB-001339
;;   B: (And (Member $e0 make) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200745 ~ p201253   cosine 0.8589 (seeds 3/5 >= 0.85)   records 10 / 6 / 2   norms 0.35 / 0.33   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201869 ~ p201871   cosine 0.8589 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.46 / 0.36   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202310 ~ p201871   cosine 0.8589 (seeds 5/5 >= 0.85)   records 4 / 4 / 2   norms 0.46 / 0.36   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201679 ~ p202309   cosine 0.8584 (seeds 3/5 >= 0.85)   records 5 / 4 / 1   norms 0.37 / 0.35   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0) (Patient $e0 $x0))   e.g. tierB-001594
;;   B: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping, shape-parallel]  p201343 ~ p201769   cosine 0.8575 (seeds 4/5 >= 0.85)   records 6 / 5 / 2   norms 0.43 / 0.32   gate: PASS
;;   A: (And (Agent $e0 $x0) (Source $e0 $x1))   e.g. tierB-000781 tierB-001693
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p203253   cosine 0.8562 (seeds 3/5 >= 0.85)   records 4 / 3 / 1   norms 0.40 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p203690   cosine 0.8562 (seeds 3/5 >= 0.85)   records 4 / 3 / 1   norms 0.40 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201867 ~ p203689   cosine 0.8560 (seeds 2/5 >= 0.85)   records 4 / 3 / 1   norms 0.39 / 0.36   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201680 ~ p201871   cosine 0.8548 (seeds 2/5 >= 0.85)   records 5 / 4 / 2   norms 0.37 / 0.36   gate: PASS
;;   A: (And (Member $e0 start) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p201253 ~ p201754   cosine 0.8543 (seeds 3/5 >= 0.85)   records 6 / 5 / 2   norms 0.33 / 0.26   gate: PASS
;;   A: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200682 ~ p203695   cosine 0.8542 (seeds 3/5 >= 0.85)   records 11 / 3 / 1   norms 0.53 / 0.40   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200668 ~ p201000   cosine 0.8539 (seeds 2/5 >= 0.85)   records 11 / 8 / 1   norms 0.86 / 0.26   gate: PASS
;;   A: (And (Future $e0) (Patient $e0 $x0))   e.g. tierB-000437
;;   B: (Time $e0 (Hour <num>))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200850 ~ p202674   cosine 0.8526 (seeds 2/5 >= 0.85)   records 9 / 3 / 2   norms 0.57 / 0.33   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p200470 ~ p201149   cosine 0.8522 (seeds 3/5 >= 0.85)   records 15 / 7 / 2   norms 1.02 / 0.53   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-001594 tierB-001920
;;   B: (And (Member $e0 make) (Result $e0 $e1))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p203689 ~ p203695   cosine 0.8510 (seeds 3/5 >= 0.85)   records 3 / 3 / 1   norms 0.36 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [overlapping]  p202097 ~ p203689   cosine 0.8505 (seeds 3/5 >= 0.85)   records 4 / 3 / 1   norms 0.40 / 0.36   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))   e.g. tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (overlapping): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200968 ~ p201005   cosine 0.9997 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.76 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p201055   cosine 0.9997 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.76 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200968 ~ p201111   cosine 0.9997 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.76 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p201143   cosine 0.9997 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.76 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p202308   cosine 0.9997 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.72 / 0.70   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201749 ~ p202296   cosine 0.9996 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.94 / 0.92   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p201749 ~ p202404   cosine 0.9996 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.94 / 0.92   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201824 ~ p202296   cosine 0.9996 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.94 / 0.92   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201824 ~ p202404   cosine 0.9996 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.94 / 0.92   gate: PASS
;;   A: (Member $e0 contain)   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200283 ~ p200323   cosine 0.9994 (seeds 5/5 >= 0.85)   records 23 / 22 / 22   norms 1.06 / 1.04   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))   e.g. tierB-000004 tierB-000362 tierB-000370
;;   B: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202445 ~ p202675   cosine 0.9994 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.87 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202445 ~ p203277   cosine 0.9994 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.87 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202445 ~ p203717   cosine 0.9994 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.87 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202445 ~ p204021   cosine 0.9994 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.87 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200159 ~ p200171   cosine 0.9993 (seeds 5/5 >= 0.85)   records 35 / 33 / 33   norms 1.06 / 1.05   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000066 tierB-000142 tierB-000162
;;   B: (And (Member $e0 have) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p202308   cosine 0.9992 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.74 / 0.70   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202303 ~ p203612   cosine 0.9992 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.85 / 0.83   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p202668   cosine 0.9992 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p203267   cosine 0.9992 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p203273   cosine 0.9992 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202307 ~ p203613   cosine 0.9992 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p203708   cosine 0.9992 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202307 ~ p203724   cosine 0.9992 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.69 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200530 ~ p200601   cosine 0.9990 (seeds 5/5 >= 0.85)   records 13 / 12 / 12   norms 0.74 / 0.71   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))   e.g. tierB-000362 tierB-000392 tierB-000425
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p202445   cosine 0.9990 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.88 / 0.87   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-000125 tierB-001515
;;   B: (And (Member $e0 stop) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202107 ~ p202675   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202107 ~ p203277   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202107 ~ p203717   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202107 ~ p204021   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202458 ~ p202675   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202458 ~ p203277   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202458 ~ p203717   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202458 ~ p204021   cosine 0.9990 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.86 / 0.85   gate: PASS
;;   A: (And (Past $e0) (Theme $e1 $e0))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p200968   cosine 0.9989 (seeds 5/5 >= 0.85)   records 10 / 8 / 8   norms 0.78 / 0.76   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000182
;;   B: (And (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201751 ~ p202307   cosine 0.9989 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.71 / 0.69   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201005   cosine 0.9986 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.78 / 0.74   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201055   cosine 0.9986 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.78 / 0.74   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201111   cosine 0.9986 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.78 / 0.74   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p201143   cosine 0.9986 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.78 / 0.74   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200973 ~ p201312   cosine 0.9986 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.90 / 0.81   gate: PASS
;;   A: (And (Past $e0) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201751 ~ p202668   cosine 0.9984 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201751 ~ p203267   cosine 0.9984 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201751 ~ p203273   cosine 0.9984 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201751 ~ p203613   cosine 0.9984 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201751 ~ p203708   cosine 0.9984 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201751 ~ p203724   cosine 0.9984 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.71 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200962 ~ p201054   cosine 0.9983 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.88 / 0.71   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierB-000248 tierB-000258 tierB-000548
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200865 ~ p201146   cosine 0.9982 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 1.01 / 0.89   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200963 ~ p201108   cosine 0.9982 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.65 / 0.59   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make))   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200969 ~ p201312   cosine 0.9982 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.93 / 0.81   gate: PASS
;;   A: (And (Member $e0 hear) (Past $e0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202630 ~ p204043   cosine 0.9979 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.30 / 0.30   gate: PASS
;;   A: (Time $e0 night)   e.g. tierB-000012 tierB-000264 tierB-001894
;;   B: (And (Past $e0) (Time $e0 night))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p202675   cosine 0.9975 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.88 / 0.85   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p203277   cosine 0.9975 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.88 / 0.85   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p203717   cosine 0.9975 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.88 / 0.85   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201830 ~ p204021   cosine 0.9975 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.88 / 0.85   gate: PASS
;;   A: (Member $e0 stop)   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200865 ~ p201312   cosine 0.9972 (seeds 5/5 >= 0.85)   records 9 / 6 / 6   norms 1.01 / 0.81   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200865 ~ p200969   cosine 0.9971 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 1.01 / 0.93   gate: PASS
;;   A: (Member $e0 hear)   e.g. tierB-000176 tierB-000189 tierB-000421
;;   B: (And (Member $e0 hear) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200732 ~ p200833   cosine 0.9970 (seeds 5/5 >= 0.85)   records 10 / 9 / 9   norms 0.46 / 0.44   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000162 tierB-000665 tierB-000730
;;   B: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201341 ~ p201668   cosine 0.9966 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.34 / 0.32   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 come))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201146 ~ p201312   cosine 0.9965 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 0.89 / 0.81   gate: PASS
;;   A: (And (Member $e0 hear) (Stimulus $e0 $x0))   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p202668   cosine 0.9961 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201750 ~ p203267   cosine 0.9961 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201750 ~ p203273   cosine 0.9961 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p203613   cosine 0.9961 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201750 ~ p203708   cosine 0.9961 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201750 ~ p203724   cosine 0.9961 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.74 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200378 ~ p201146   cosine 0.9959 (seeds 5/5 >= 0.85)   records 18 / 7 / 7   norms 1.23 / 0.89   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201750 ~ p202307   cosine 0.9959 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.74 / 0.69   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202308 ~ p202668   cosine 0.9955 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203267   cosine 0.9955 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203273   cosine 0.9955 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202308 ~ p203613   cosine 0.9955 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203708   cosine 0.9955 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202308 ~ p203724   cosine 0.9955 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.70 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200938 ~ p201003   cosine 0.9951 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.66 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200938 ~ p201004   cosine 0.9951 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.66 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201347 ~ p201672   cosine 0.9949 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.33 / 0.30   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 go))   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p201151   cosine 0.9945 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.46 / 0.45   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000148 tierB-000324 tierB-000805
;;   B: (And (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200869 ~ p201762   cosine 0.9944 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.38 / 0.35   gate: PASS
;;   A: (Member $e0 work)   e.g. tierB-000419 tierB-000867 tierB-001515
;;   B: (And (Member $e0 work) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202448 ~ p203271   cosine 0.9944 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.36 / 0.33   gate: PASS
;;   A: (And (Member $e0 turn) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202448 ~ p203720   cosine 0.9944 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.36 / 0.33   gate: PASS
;;   A: (And (Member $e0 turn) (Result $e0 $e1))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200800 ~ p200938   cosine 0.9939 (seeds 5/5 >= 0.85)   records 9 / 8 / 8   norms 0.65 / 0.66   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200507 ~ p200733   cosine 0.9938 (seeds 5/5 >= 0.85)   records 14 / 10 / 10   norms 0.52 / 0.48   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p202668   cosine 0.9937 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p203267   cosine 0.9937 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201752 ~ p203273   cosine 0.9937 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p203613   cosine 0.9937 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201752 ~ p203708   cosine 0.9937 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201752 ~ p203724   cosine 0.9937 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.72 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p201354   cosine 0.9927 (seeds 5/5 >= 0.85)   records 7 / 6 / 6   norms 0.33 / 0.31   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000018 tierB-000476 tierB-000654
;;   B: (And (Member $e0 turn) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200378 ~ p200973   cosine 0.9926 (seeds 5/5 >= 0.85)   records 18 / 8 / 8   norms 1.23 / 0.90   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000009 tierB-000189 tierB-000421
;;   B: (And (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201310 ~ p203612   cosine 0.9924 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.86 / 0.83   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200378 ~ p201312   cosine 0.9919 (seeds 5/5 >= 0.85)   records 18 / 6 / 6   norms 1.23 / 0.81   gate: PASS
;;   A: (Stimulus $e0 $x0)   e.g. tierB-000189 tierB-000421 tierB-000681
;;   B: (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201351 ~ p201677   cosine 0.9919 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.33 / 0.27   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200106 ~ p200140   cosine 0.9917 (seeds 5/5 >= 0.85)   records 48 / 37 / 37   norms 1.55 / 1.33   gate: PASS
;;   A: (Goal $e0 $x0)   e.g. tierB-000111 tierB-000178 tierB-000204
;;   B: (And (Goal $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200975 ~ p201313   cosine 0.9916 (seeds 5/5 >= 0.85)   records 8 / 6 / 6   norms 0.56 / 0.48   gate: PASS
;;   A: (And (Patient $e0 $x0) (Source $e0 $x1))   e.g. tierB-000103 tierB-000338 tierB-000725
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p202411 ~ p203253   cosine 0.9916 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.44 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202411 ~ p203690   cosine 0.9916 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.44 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200442 ~ p200545   cosine 0.9911 (seeds 5/5 >= 0.85)   records 16 / 13 / 13   norms 0.70 / 0.63   gate: PASS
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1))   e.g. tierB-000324 tierB-000387 tierB-000462
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201743 ~ p203274   cosine 0.9906 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.47 / 0.37   gate: PASS
;;   A: (And (GroupOf $x0 person) (Patient $e0 $x0))   e.g. tierB-000196 tierB-000412 tierB-000771
;;   B: (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p200971   cosine 0.9900 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 0.70 / 0.61   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201563 ~ p201866   cosine 0.9896 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.37 / 0.31   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201564 ~ p201867   cosine 0.9893 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.47 / 0.39   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000858 tierB-000942 tierB-001697
;;   B: (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202411 ~ p203689   cosine 0.9893 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.44 / 0.36   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try))   e.g. tierB-000469 tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201342 ~ p203255   cosine 0.9892 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 1.03 / 0.68   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001773 tierB-001801 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p201145   cosine 0.9890 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 0.35 / 0.29   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000194 tierB-000609 tierB-000779
;;   B: (And (Member $e0 fall) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200556 ~ p200846   cosine 0.9885 (seeds 5/5 >= 0.85)   records 13 / 9 / 9   norms 0.50 / 0.53   gate: PASS
;;   A: (Member $x0 person)   e.g. tierB-000316 tierB-000338 tierB-000628
;;   B: (And (Agent $e0 $x0) (Member $x0 person))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p200359   cosine 0.9879 (seeds 5/5 >= 0.85)   records 31 / 19 / 19   norms 1.60 / 1.21   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000103 tierB-000138 tierB-000338
;;   B: (And (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200667 ~ p201309   cosine 0.9879 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 0.92 / 0.90   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-000963 tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200159 ~ p200278   cosine 0.9877 (seeds 5/5 >= 0.85)   records 35 / 23 / 23   norms 1.06 / 0.93   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200159 ~ p200284   cosine 0.9877 (seeds 5/5 >= 0.85)   records 35 / 23 / 23   norms 1.06 / 0.93   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200159 ~ p200285   cosine 0.9877 (seeds 5/5 >= 0.85)   records 35 / 23 / 23   norms 1.06 / 0.93   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200159 ~ p200289   cosine 0.9877 (seeds 5/5 >= 0.85)   records 35 / 23 / 23   norms 1.06 / 0.93   gate: PASS
;;   A: (Member $e0 have)   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200171 ~ p200278   cosine 0.9875 (seeds 5/5 >= 0.85)   records 33 / 23 / 23   norms 1.05 / 0.93   gate: PASS
;;   A: (And (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p200171 ~ p200284   cosine 0.9875 (seeds 5/5 >= 0.85)   records 33 / 23 / 23   norms 1.05 / 0.93   gate: PASS
;;   A: (And (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200171 ~ p200285   cosine 0.9875 (seeds 5/5 >= 0.85)   records 33 / 23 / 23   norms 1.05 / 0.93   gate: PASS
;;   A: (And (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200171 ~ p200289   cosine 0.9875 (seeds 5/5 >= 0.85)   records 33 / 23 / 23   norms 1.05 / 0.93   gate: PASS
;;   A: (And (Member $e0 have) (Theme $e0 $x0))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p200970   cosine 0.9874 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 0.70 / 0.56   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000216 tierB-000400
;;   B: (And (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200800 ~ p201003   cosine 0.9872 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200800 ~ p201004   cosine 0.9872 (seeds 5/5 >= 0.85)   records 9 / 7 / 7   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200970 ~ p201681   cosine 0.9857 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 0.56 / 0.46   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200506 ~ p200731   cosine 0.9853 (seeds 5/5 >= 0.85)   records 14 / 10 / 10   norms 0.67 / 0.63   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012 tierB-000115 tierB-000204
;;   B: (And (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200971 ~ p201681   cosine 0.9853 (seeds 5/5 >= 0.85)   records 8 / 5 / 5   norms 0.61 / 0.46   gate: PASS
;;   A: (And (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p200967   cosine 0.9844 (seeds 5/5 >= 0.85)   records 11 / 8 / 8   norms 0.42 / 0.35   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p201681   cosine 0.9843 (seeds 5/5 >= 0.85)   records 11 / 5 / 5   norms 0.70 / 0.46   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000117 tierB-000400 tierB-000470
;;   B: (And (Member $e0 try) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p200975   cosine 0.9839 (seeds 5/5 >= 0.85)   records 31 / 8 / 8   norms 1.60 / 0.56   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000103 tierB-000338 tierB-000677
;;   B: (And (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200359 ~ p201313   cosine 0.9826 (seeds 5/5 >= 0.85)   records 19 / 6 / 6   norms 1.21 / 0.48   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000103 tierB-000338 tierB-000725
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201832 ~ p204023   cosine 0.9825 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.30 / 0.29   gate: PASS
;;   A: (Member $e0 travel)   e.g. tierB-000667 tierB-000995 tierB-001618
;;   B: (And (Member $e0 travel) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p201351   cosine 0.9824 (seeds 5/5 >= 0.85)   records 9 / 6 / 6   norms 0.35 / 0.33   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000609 tierB-000779
;;   B: (And (Member $e0 fall) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201570 ~ p201869   cosine 0.9817 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.46   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201570 ~ p202310   cosine 0.9817 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.51 / 0.46   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200499 ~ p200754   cosine 0.9814 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 0.79 / 0.67   gate: PASS
;;   A: (And (Member $e0 start) (Past $e0))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200499 ~ p200834   cosine 0.9814 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 0.79 / 0.67   gate: PASS
;;   A: (And (Member $e0 start) (Past $e0))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p200470   cosine 0.9806 (seeds 5/5 >= 0.85)   records 22 / 15 / 15   norms 1.39 / 1.02   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000025 tierB-000073 tierB-000269
;;   B: (And (Member $e0 make) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201309 ~ p203612   cosine 0.9800 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.90 / 0.83   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200833 ~ p201653   cosine 0.9798 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.44 / 0.34   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p200833 ~ p201674   cosine 0.9798 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.44 / 0.34   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200833 ~ p201675   cosine 0.9798 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.44 / 0.34   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200833 ~ p201745   cosine 0.9798 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.44 / 0.34   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200362 ~ p200584   cosine 0.9795 (seeds 5/5 >= 0.85)   records 19 / 12 / 12   norms 0.91 / 0.78   gate: PASS
;;   A: (Member $e0 start)   e.g. tierB-000199 tierB-000265 tierB-000465
;;   B: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200362 ~ p200611   cosine 0.9795 (seeds 5/5 >= 0.85)   records 19 / 12 / 12   norms 0.91 / 0.78   gate: PASS
;;   A: (Member $e0 start)   e.g. tierB-000199 tierB-000265 tierB-000465
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200730 ~ p201110   cosine 0.9790 (seeds 5/5 >= 0.85)   records 10 / 7 / 7   norms 0.36 / 0.28   gate: PASS
;;   A: (And (Manner $e0 quickly) (Past $e0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200732 ~ p201653   cosine 0.9786 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 0.46 / 0.34   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200732 ~ p201674   cosine 0.9786 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 0.46 / 0.34   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200732 ~ p201675   cosine 0.9786 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 0.46 / 0.34   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200732 ~ p201745   cosine 0.9786 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 0.46 / 0.34   gate: PASS
;;   A: (And (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p201313   cosine 0.9772 (seeds 5/5 >= 0.85)   records 31 / 6 / 6   norms 1.60 / 0.48   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000103 tierB-000338 tierB-000725
;;   B: (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201145 ~ p201677   cosine 0.9771 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.29 / 0.27   gate: PASS
;;   A: (And (Member $e0 fall) (Patient $e0 $x0))   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201144 ~ p201668   cosine 0.9762 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.36 / 0.32   gate: PASS
;;   A: (And (Member $e0 come) (Past $e0))   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201149 ~ p202309   cosine 0.9749 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.53 / 0.35   gate: PASS
;;   A: (And (Member $e0 make) (Result $e0 $e1))   e.g. tierB-000325 tierB-001504 tierB-001594
;;   B: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201112 ~ p201435   cosine 0.9729 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.55 / 0.50   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p201567   cosine 0.9729 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.55 / 0.50   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200682 ~ p202097   cosine 0.9726 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 0.53 / 0.40   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001182 tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201342 ~ p202097   cosine 0.9721 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 1.03 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 man))   e.g. tierB-001182 tierB-001773 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200624 ~ p200961   cosine 0.9716 (seeds 5/5 >= 0.85)   records 12 / 8 / 8   norms 0.50 / 0.41   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000410 tierB-000587 tierB-000648
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200667 ~ p201310   cosine 0.9716 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 0.92 / 0.86   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078 tierB-001303
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201769 ~ p202315   cosine 0.9711 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.32 / 0.28   gate: PASS
;;   A: (And (Source $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000781 tierB-001325 tierB-001540
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p201677   cosine 0.9700 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.35 / 0.27   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000609 tierB-000779 tierB-001306
;;   B: (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p201144   cosine 0.9696 (seeds 5/5 >= 0.85)   records 12 / 7 / 7   norms 0.46 / 0.36   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000255 tierB-000277
;;   B: (And (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201564 ~ p203695   cosine 0.9696 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.47 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))   e.g. tierB-000942 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201351 ~ p203706   cosine 0.9692 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.33 / 0.26   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201351 ~ p203997   cosine 0.9692 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.33 / 0.26   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200178 ~ p200668   cosine 0.9686 (seeds 5/5 >= 0.85)   records 32 / 11 / 11   norms 2.18 / 0.86   gate: PASS
;;   A: (Future $e0)   e.g. tierB-000082 tierB-000108 tierB-000378
;;   B: (And (Future $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200682 ~ p201342   cosine 0.9685 (seeds 5/5 >= 0.85)   records 11 / 6 / 6   norms 0.53 / 1.03   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001182 tierB-001416 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $x0 man))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200343 ~ p200423   cosine 0.9683 (seeds 5/5 >= 0.85)   records 20 / 16 / 16   norms 0.81 / 0.75   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000166 tierB-000339 tierB-000410
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201562 ~ p201866   cosine 0.9672 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.37 / 0.31   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200178 ~ p200729   cosine 0.9658 (seeds 4/5 >= 0.85)   records 32 / 10 / 10   norms 2.18 / 0.80   gate: PASS
;;   A: (Future $e0)   e.g. tierB-000100 tierB-000453 tierB-000930
;;   B: (And (Agent $e0 $x0) (Future $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200556 ~ p201563   cosine 0.9657 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 0.50 / 0.37   gate: PASS
;;   A: (Member $x0 person)   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200964 ~ p203243   cosine 0.9650 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.98 / 0.84   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000379 tierB-001266
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p201869   cosine 0.9649 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.55 / 0.46   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p202310   cosine 0.9649 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.55 / 0.46   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201570 ~ p202677   cosine 0.9646 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.51 / 0.32   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p201148   cosine 0.9632 (seeds 5/5 >= 0.85)   records 22 / 7 / 7   norms 1.39 / 0.52   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000173 tierB-000325 tierB-000951
;;   B: (And (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200867 ~ p201732   cosine 0.9629 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.30 / 0.27   gate: PASS
;;   A: (Member $e0 play)   e.g. tierB-000160 tierB-000648 tierB-001125
;;   B: (And (Agent $e0 $x0) (Member $e0 play))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200359 ~ p201670   cosine 0.9628 (seeds 5/5 >= 0.85)   records 19 / 5 / 5   norms 1.21 / 0.37   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000338 tierB-000693 tierB-000781
;;   B: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p201570   cosine 0.9623 (seeds 5/5 >= 0.85)   records 7 / 5 / 5   norms 0.55 / 0.51   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201149 ~ p203712   cosine 0.9623 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.53 / 0.27   gate: PASS
;;   A: (And (Member $e0 make) (Result $e0 $e1))   e.g. tierB-000325 tierB-001754 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200849 ~ p201679   cosine 0.9620 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.64 / 0.37   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0))   e.g. tierB-000073 tierB-000964 tierB-001339
;;   B: (And (Member $e0 make) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p203706   cosine 0.9618 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 0.35 / 0.26   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200864 ~ p203997   cosine 0.9618 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 0.35 / 0.26   gate: PASS
;;   A: (Member $e0 fall)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200667 ~ p203612   cosine 0.9617 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 0.92 / 0.83   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200965 ~ p203676   cosine 0.9609 (seeds 4/5 >= 0.85)   records 8 / 3 / 3   norms 0.56 / 0.27   gate: PASS
;;   A: (And (Future $e0) (Theme $e0 $x0))   e.g. tierB-000453 tierB-001266 tierB-001626
;;   B: (And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200500 ~ p200830   cosine 0.9602 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 0.53 / 0.43   gate: PASS
;;   A: (And (Ongoing $e0) (Theme $e0 $x0))   e.g. tierB-000520 tierB-000713 tierB-000784
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200850 ~ p201869   cosine 0.9595 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 0.57 / 0.46   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200850 ~ p202310   cosine 0.9595 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 0.57 / 0.46   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200849 ~ p202309   cosine 0.9591 (seeds 5/5 >= 0.85)   records 9 / 4 / 4   norms 0.64 / 0.35   gate: PASS
;;   A: (And (Member $e0 make) (Past $e0))   e.g. tierB-000325 tierB-001504 tierB-001594
;;   B: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200470 ~ p201108   cosine 0.9584 (seeds 5/5 >= 0.85)   records 15 / 7 / 7   norms 1.02 / 0.59   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201871 ~ p202674   cosine 0.9581 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.36 / 0.33   gate: PASS
;;   A: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p201670   cosine 0.9575 (seeds 5/5 >= 0.85)   records 31 / 5 / 5   norms 1.60 / 0.37   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000338 tierB-000693 tierB-000781
;;   B: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200729 ~ p203676   cosine 0.9575 (seeds 4/5 >= 0.85)   records 10 / 3 / 3   norms 0.80 / 0.27   gate: PASS
;;   A: (And (Agent $e0 $x0) (Future $e0))   e.g. tierB-000453 tierB-001266 tierB-001626
;;   B: (And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200359 ~ p203706   cosine 0.9574 (seeds 5/5 >= 0.85)   records 19 / 3 / 3   norms 1.21 / 0.26   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200359 ~ p203997   cosine 0.9574 (seeds 5/5 >= 0.85)   records 19 / 3 / 3   norms 1.21 / 0.26   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200178 ~ p200965   cosine 0.9567 (seeds 4/5 >= 0.85)   records 32 / 8 / 8   norms 2.18 / 0.56   gate: PASS
;;   A: (Future $e0)   e.g. tierB-000281 tierB-000453 tierB-000790
;;   B: (And (Future $e0) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200584 ~ p200754   cosine 0.9551 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.78 / 0.67   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200584 ~ p200834   cosine 0.9551 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.78 / 0.67   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200611 ~ p200754   cosine 0.9551 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.78 / 0.67   gate: PASS
;;   A: (And (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200611 ~ p200834   cosine 0.9551 (seeds 5/5 >= 0.85)   records 12 / 9 / 9   norms 0.78 / 0.67   gate: PASS
;;   A: (And (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200961 ~ p202094   cosine 0.9544 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 0.41 / 0.30   gate: PASS
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierB-000587 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200362 ~ p200499   cosine 0.9540 (seeds 5/5 >= 0.85)   records 19 / 14 / 14   norms 0.91 / 0.79   gate: PASS
;;   A: (Member $e0 start)   e.g. tierB-000043 tierB-000192 tierB-000199
;;   B: (And (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p201754   cosine 0.9537 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 0.35 / 0.26   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000298 tierB-000425 tierB-000704
;;   B: (And (Member $e0 leave) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200322 ~ p200390   cosine 0.9527 (seeds 5/5 >= 0.85)   records 22 / 17 / 17   norms 0.92 / 0.84   gate: PASS
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000075 tierB-000173 tierB-000199
;;   B: (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200556 ~ p201562   cosine 0.9523 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 0.50 / 0.37   gate: PASS
;;   A: (Member $x0 person)   e.g. tierB-000338 tierB-000747 tierB-001813
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p200730   cosine 0.9520 (seeds 5/5 >= 0.85)   records 11 / 10 / 10   norms 0.42 / 0.36   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-000128
;;   B: (And (Manner $e0 quickly) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200733 ~ p201253   cosine 0.9519 (seeds 5/5 >= 0.85)   records 10 / 6 / 6   norms 0.48 / 0.33   gate: PASS
;;   A: (And (Member $x0 door) (Patient $e0 $x0))   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200469 ~ p201309   cosine 0.9515 (seeds 5/5 >= 0.85)   records 15 / 6 / 6   norms 0.92 / 0.90   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0))   e.g. tierB-000963 tierB-001041 tierB-001078
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p203706   cosine 0.9495 (seeds 5/5 >= 0.85)   records 31 / 3 / 3   norms 1.60 / 0.26   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p203997   cosine 0.9495 (seeds 5/5 >= 0.85)   records 31 / 3 / 3   norms 1.60 / 0.26   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p201570   cosine 0.9493 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.51 / 0.51   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200963 ~ p203687   cosine 0.9492 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.65 / 0.28   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 make))   e.g. tierB-001182 tierB-001457 tierB-001754
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200359 ~ p202315   cosine 0.9479 (seeds 5/5 >= 0.85)   records 19 / 4 / 4   norms 1.21 / 0.28   gate: PASS
;;   A: (And (Past $e0) (Source $e0 $x0))   e.g. tierB-000781 tierB-001325 tierB-001540
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201435 ~ p201869   cosine 0.9478 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.50 / 0.46   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201435 ~ p202310   cosine 0.9478 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.50 / 0.46   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201567 ~ p201869   cosine 0.9478 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.50 / 0.46   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201567 ~ p202310   cosine 0.9478 (seeds 5/5 >= 0.85)   records 5 / 4 / 4   norms 0.50 / 0.46   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p202314   cosine 0.9474 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.51 / 0.35   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200846 ~ p201562   cosine 0.9452 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.53 / 0.37   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person))   e.g. tierB-000338 tierB-000747 tierB-001813
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200192 ~ p201743   cosine 0.9439 (seeds 5/5 >= 0.85)   records 30 / 5 / 5   norms 1.98 / 0.47   gate: PASS
;;   A: (GroupOf $x0 person)   e.g. tierB-000196 tierB-000393 tierB-000412
;;   B: (And (GroupOf $x0 person) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200508 ~ p200847   cosine 0.9433 (seeds 5/5 >= 0.85)   records 14 / 9 / 9   norms 0.42 / 0.34   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000485 tierB-000715 tierB-000769
;;   B: (And (Agent $e0 $x0) (Recipient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201435 ~ p202674   cosine 0.9413 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.50 / 0.33   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201567 ~ p202674   cosine 0.9413 (seeds 5/5 >= 0.85)   records 5 / 3 / 3   norms 0.50 / 0.33   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200624 ~ p202094   cosine 0.9400 (seeds 4/5 >= 0.85)   records 12 / 4 / 4   norms 0.50 / 0.30   gate: PASS
;;   A: (GroupOf $x0 child)   e.g. tierB-000587 tierB-001125 tierB-001433
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200556 ~ p201866   cosine 0.9389 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 0.50 / 0.31   gate: PASS
;;   A: (Member $x0 person)   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200507 ~ p201253   cosine 0.9383 (seeds 5/5 >= 0.85)   records 14 / 6 / 6   norms 0.52 / 0.33   gate: PASS
;;   A: (Member $x0 door)   e.g. tierB-000056 tierB-000425 tierB-000747
;;   B: (And (Member $x0 door) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201343 ~ p201670   cosine 0.9379 (seeds 5/5 >= 0.85)   records 6 / 5 / 5   norms 0.43 / 0.37   gate: PASS
;;   A: (And (Agent $e0 $x0) (Source $e0 $x1))   e.g. tierB-000338 tierB-000693 tierB-000781
;;   B: (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p200963   cosine 0.9370 (seeds 5/5 >= 0.85)   records 22 / 8 / 8   norms 1.39 / 0.65   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p201752   cosine 0.9363 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 0.88 / 0.72   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000206 tierB-000370 tierB-000748
;;   B: (And (Member $e0 get) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200684 ~ p202102   cosine 0.9360 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 0.38 / 0.80   gate: PASS
;;   A: (Member $x0 table)   e.g. tierB-000047 tierB-000502 tierB-001041
;;   B: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200684 ~ p202432   cosine 0.9360 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 0.38 / 0.80   gate: PASS
;;   A: (Member $x0 table)   e.g. tierB-000047 tierB-000502 tierB-001041
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p202315   cosine 0.9349 (seeds 5/5 >= 0.85)   records 31 / 4 / 4   norms 1.60 / 0.28   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000781 tierB-001325 tierB-001540
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201153 ~ p202308   cosine 0.9349 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.76 / 0.70   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200846 ~ p201563   cosine 0.9345 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.53 / 0.37   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200831 ~ p203612   cosine 0.9333 (seeds 5/5 >= 0.85)   records 9 / 3 / 3   norms 0.86 / 0.83   gate: PASS
;;   A: (And (Location $e0 $x0) (Ongoing $e0) (Past $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p202308   cosine 0.9328 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 0.88 / 0.70   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200362 ~ p200754   cosine 0.9323 (seeds 5/5 >= 0.85)   records 19 / 9 / 9   norms 0.91 / 0.67   gate: PASS
;;   A: (Member $e0 start)   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200362 ~ p200834   cosine 0.9323 (seeds 5/5 >= 0.85)   records 19 / 9 / 9   norms 0.91 / 0.67   gate: PASS
;;   A: (Member $e0 start)   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p201750   cosine 0.9322 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 0.88 / 0.74   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001185
;;   B: (And (Member $e0 get) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200682 ~ p203255   cosine 0.9320 (seeds 5/5 >= 0.85)   records 11 / 3 / 3   norms 0.53 / 0.68   gate: PASS
;;   A: (Member $x0 man)   e.g. tierB-001773 tierB-001801 tierB-001803
;;   B: (And (Agent $e0 $x0) (Member $x0 man) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p202448   cosine 0.9308 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.33 / 0.36   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200178 ~ p203676   cosine 0.9297 (seeds 4/5 >= 0.85)   records 32 / 3 / 3   norms 2.18 / 0.27   gate: PASS
;;   A: (Future $e0)   e.g. tierB-000453 tierB-001266 tierB-001626
;;   B: (And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p201343   cosine 0.9297 (seeds 5/5 >= 0.85)   records 31 / 6 / 6   norms 1.60 / 0.43   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000338 tierB-000485 tierB-000693
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p203271   cosine 0.9296 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.33 / 0.33   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201176 ~ p203720   cosine 0.9296 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.33 / 0.33   gate: PASS
;;   A: (Member $e0 turn)   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200187 ~ p201769   cosine 0.9295 (seeds 5/5 >= 0.85)   records 31 / 5 / 5   norms 1.60 / 0.32   gate: PASS
;;   A: (Source $e0 $x0)   e.g. tierB-000400 tierB-000781 tierB-001325
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p201869   cosine 0.9294 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.51 / 0.46   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p202310   cosine 0.9294 (seeds 5/5 >= 0.85)   records 6 / 4 / 4   norms 0.51 / 0.46   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200132 ~ p201765   cosine 0.9293 (seeds 5/5 >= 0.85)   records 38 / 5 / 5   norms 2.24 / 0.37   gate: PASS
;;   A: (PartOf $x0 $x1)   e.g. tierB-000229 tierB-001066 tierB-001243
;;   B: (And (PartOf $x0 $x1) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200149 ~ p200283   cosine 0.9293 (seeds 5/5 >= 0.85)   records 36 / 23 / 23   norms 1.34 / 1.06   gate: PASS
;;   A: (Result $e0 $e1)   e.g. tierB-000004 tierB-000362 tierB-000370
;;   B: (And (Experiencer $e0 $x0) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p200849   cosine 0.9278 (seeds 5/5 >= 0.85)   records 22 / 9 / 9   norms 1.39 / 0.64   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000073 tierB-000325 tierB-000539
;;   B: (And (Member $e0 make) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200850 ~ p201680   cosine 0.9277 (seeds 5/5 >= 0.85)   records 9 / 5 / 5   norms 0.57 / 0.37   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierB-000192 tierB-000265 tierB-000654
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200967 ~ p201110   cosine 0.9273 (seeds 5/5 >= 0.85)   records 8 / 7 / 7   norms 0.35 / 0.28   gate: PASS
;;   A: (And (Manner $e0 quickly) (Patient $e0 $x0))   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200149 ~ p200323   cosine 0.9271 (seeds 5/5 >= 0.85)   records 36 / 22 / 22   norms 1.34 / 1.04   gate: PASS
;;   A: (Result $e0 $e1)   e.g. tierB-000004 tierB-000362 tierB-000370
;;   B: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p201149   cosine 0.9269 (seeds 5/5 >= 0.85)   records 22 / 7 / 7   norms 1.39 / 0.53   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000325 tierB-001431 tierB-001504
;;   B: (And (Member $e0 make) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200680 ~ p201110   cosine 0.9269 (seeds 5/5 >= 0.85)   records 11 / 7 / 7   norms 0.42 / 0.28   gate: PASS
;;   A: (Manner $e0 quickly)   e.g. tierB-000005 tierB-000094 tierB-001062
;;   B: (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200286 ~ p200530   cosine 0.9268 (seeds 5/5 >= 0.85)   records 23 / 13 / 13   norms 1.01 / 0.74   gate: PASS
;;   A: (And (Past $e0) (Result $e0 $e1))   e.g. tierB-000362 tierB-000392 tierB-000425
;;   B: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p201751   cosine 0.9266 (seeds 5/5 >= 0.85)   records 13 / 5 / 5   norms 0.88 / 0.71   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-000890
;;   B: (And (Member $e0 get) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p201108   cosine 0.9262 (seeds 5/5 >= 0.85)   records 22 / 7 / 7   norms 1.39 / 0.59   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000073 tierB-000998 tierB-001182
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201359 ~ p202677   cosine 0.9257 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.51 / 0.32   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200286 ~ p200601   cosine 0.9256 (seeds 5/5 >= 0.85)   records 23 / 12 / 12   norms 1.01 / 0.71   gate: PASS
;;   A: (And (Past $e0) (Result $e0 $e1))   e.g. tierB-000362 tierB-000392 tierB-000425
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200970 ~ p203689   cosine 0.9229 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.56 / 0.36   gate: PASS
;;   A: (And (Member $e0 try) (Past $e0))   e.g. tierB-000469 tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200506 ~ p203960   cosine 0.9226 (seeds 5/5 >= 0.85)   records 14 / 3 / 3   norms 0.67 / 0.32   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012 tierB-001418 tierB-001496
;;   B: (And (Goal $e0 bed) (Member $e0 go))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, shape-parallel]  p200506 ~ p204241   cosine 0.9226 (seeds 5/5 >= 0.85)   records 14 / 3 / 3   norms 0.67 / 0.32   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000012 tierB-001418 tierB-001496
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200192 ~ p203274   cosine 0.9221 (seeds 5/5 >= 0.85)   records 30 / 3 / 3   norms 1.98 / 0.37   gate: PASS
;;   A: (GroupOf $x0 person)   e.g. tierB-000196 tierB-000412 tierB-000771
;;   B: (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p201341   cosine 0.9221 (seeds 5/5 >= 0.85)   records 12 / 6 / 6   norms 0.46 / 0.34   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201112 ~ p201871   cosine 0.9203 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.55 / 0.36   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001394
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201354 ~ p203271   cosine 0.9197 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.31 / 0.33   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201354 ~ p203720   cosine 0.9197 (seeds 5/5 >= 0.85)   records 6 / 3 / 3   norms 0.31 / 0.33   gate: PASS
;;   A: (And (Member $e0 turn) (Patient $e0 $x0))   e.g. tierB-000476 tierB-000654 tierB-000832
;;   B: (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p203269   cosine 0.9194 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.35 / 0.26   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p203710   cosine 0.9194 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.35 / 0.26   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p204004   cosine 0.9194 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.35 / 0.26   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200745 ~ p204005   cosine 0.9194 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.35 / 0.26   gate: PASS
;;   A: (Member $e0 leave)   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p201679   cosine 0.9191 (seeds 5/5 >= 0.85)   records 22 / 5 / 5   norms 1.39 / 0.37   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000073 tierB-000964 tierB-001339
;;   B: (And (Member $e0 make) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200256 ~ p200436   cosine 0.9188 (seeds 5/5 >= 0.85)   records 24 / 16 / 16   norms 0.82 / 0.76   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000470 tierB-000485 tierB-000738
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p202668   cosine 0.9180 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 0.88 / 0.65   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p203267   cosine 0.9180 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 0.88 / 0.65   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200554 ~ p203273   cosine 0.9180 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 0.88 / 0.65   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p203613   cosine 0.9180 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 0.88 / 0.65   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p203708   cosine 0.9180 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 0.88 / 0.65   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200554 ~ p203724   cosine 0.9180 (seeds 5/5 >= 0.85)   records 13 / 3 / 3   norms 0.88 / 0.65   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200625 ~ p201668   cosine 0.9173 (seeds 5/5 >= 0.85)   records 12 / 5 / 5   norms 0.46 / 0.32   gate: PASS
;;   A: (Member $e0 come)   e.g. tierB-000238 tierB-000277 tierB-000387
;;   B: (And (Agent $e0 $x0) (Member $e0 come) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200554 ~ p202307   cosine 0.9171 (seeds 5/5 >= 0.85)   records 13 / 4 / 4   norms 0.88 / 0.69   gate: PASS
;;   A: (Member $e0 get)   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201153 ~ p202668   cosine 0.9170 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.76 / 0.65   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201153 ~ p203267   cosine 0.9170 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.76 / 0.65   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201153 ~ p203273   cosine 0.9170 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.76 / 0.65   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201153 ~ p203613   cosine 0.9170 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.76 / 0.65   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201153 ~ p203708   cosine 0.9170 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.76 / 0.65   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201153 ~ p203724   cosine 0.9170 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.76 / 0.65   gate: PASS
;;   A: (And (Ongoing $e0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200219 ~ p200493   cosine 0.9164 (seeds 3/5 >= 0.85)   records 27 / 14 / 14   norms 1.44 / 1.15   gate: PASS
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1))   e.g. tierB-000045 tierB-000291 tierB-000305
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200192 ~ p200962   cosine 0.9159 (seeds 5/5 >= 0.85)   records 30 / 8 / 8   norms 1.98 / 0.88   gate: PASS
;;   A: (GroupOf $x0 person)   e.g. tierB-000248 tierB-000258 tierB-000548
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 person))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200192 ~ p201054   cosine 0.9153 (seeds 5/5 >= 0.85)   records 30 / 7 / 7   norms 1.98 / 0.71   gate: PASS
;;   A: (GroupOf $x0 person)   e.g. tierB-000248 tierB-000258 tierB-000548
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p202411   cosine 0.9114 (seeds 5/5 >= 0.85)   records 11 / 4 / 4   norms 0.70 / 0.44   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000469 tierB-000470 tierB-001130
;;   B: (And (Agent $e0 $x0) (Member $e0 try))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p202662   cosine 0.9112 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.76 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p202663   cosine 0.9112 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.76 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200968 ~ p202664   cosine 0.9112 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.76 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p203252   cosine 0.9112 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.76 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200968 ~ p203609   cosine 0.9112 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.76 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200968 ~ p203681   cosine 0.9112 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.76 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p203682   cosine 0.9112 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.76 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p200968 ~ p203906   cosine 0.9112 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.76 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p202677   cosine 0.9106 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.55 / 0.32   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p202662   cosine 0.9095 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.78 / 0.43   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p202663   cosine 0.9095 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.78 / 0.43   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p202664   cosine 0.9095 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.78 / 0.43   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p203252   cosine 0.9095 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.78 / 0.43   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p203609   cosine 0.9095 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.78 / 0.43   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p203681   cosine 0.9095 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.78 / 0.43   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p203682   cosine 0.9095 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.78 / 0.43   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200744 ~ p203906   cosine 0.9095 (seeds 5/5 >= 0.85)   records 10 / 3 / 3   norms 0.78 / 0.43   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201005 ~ p202662   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201005 ~ p202663   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201005 ~ p202664   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201005 ~ p203252   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201005 ~ p203609   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201005 ~ p203681   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201005 ~ p203682   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201005 ~ p203906   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201055 ~ p202662   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201055 ~ p202663   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201055 ~ p202664   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201055 ~ p203252   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201055 ~ p203609   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201055 ~ p203681   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201055 ~ p203682   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201055 ~ p203906   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201111 ~ p202662   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201111 ~ p202663   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201111 ~ p202664   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201111 ~ p203252   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201111 ~ p203609   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201111 ~ p203681   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201111 ~ p203682   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201111 ~ p203906   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201143 ~ p202662   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201143 ~ p202663   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201143 ~ p202664   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201143 ~ p203252   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201143 ~ p203609   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201143 ~ p203681   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201143 ~ p203682   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201143 ~ p203906   cosine 0.9081 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.74 / 0.43   gate: PASS
;;   A: (And (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200469 ~ p202303   cosine 0.9072 (seeds 5/5 >= 0.85)   records 15 / 4 / 4   norms 0.92 / 0.85   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001397
;;   B: (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200470 ~ p203711   cosine 0.9049 (seeds 5/5 >= 0.85)   records 15 / 3 / 3   norms 1.02 / 0.28   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-000951 tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200469 ~ p203612   cosine 0.9039 (seeds 5/5 >= 0.85)   records 15 / 3 / 3   norms 0.92 / 0.83   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Ongoing $e0))   e.g. tierB-001041 tierB-001078 tierB-001753
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200846 ~ p201866   cosine 0.9035 (seeds 4/5 >= 0.85)   records 9 / 4 / 4   norms 0.53 / 0.31   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 person))   e.g. tierB-000338 tierB-000747 tierB-001887
;;   B: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200971 ~ p203253   cosine 0.9016 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.61 / 0.40   gate: PASS
;;   A: (And (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200971 ~ p203690   cosine 0.9016 (seeds 5/5 >= 0.85)   records 8 / 3 / 3   norms 0.61 / 0.40   gate: PASS
;;   A: (And (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201871 ~ p202677   cosine 0.8993 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.36 / 0.32   gate: PASS
;;   A: (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200192 ~ p201345   cosine 0.8981 (seeds 5/5 >= 0.85)   records 30 / 6 / 6   norms 1.98 / 0.29   gate: PASS
;;   A: (GroupOf $x0 person)   e.g. tierB-000191 tierB-001160 tierB-001485
;;   B: (And (Experiencer $e0 $x0) (GroupOf $x0 person))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200072 ~ p200121   cosine 0.8967 (seeds 5/5 >= 0.85)   records 66 / 43 / 43   norms 1.68 / 1.16   gate: PASS
;;   A: (Theme $e0 $e1)   e.g. tierB-000030 tierB-000075 tierB-000087
;;   B: (And (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p203253   cosine 0.8956 (seeds 4/5 >= 0.85)   records 11 / 3 / 3   norms 0.70 / 0.40   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p203690   cosine 0.8956 (seeds 4/5 >= 0.85)   records 11 / 3 / 3   norms 0.70 / 0.40   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200379 ~ p200974   cosine 0.8941 (seeds 5/5 >= 0.85)   records 18 / 8 / 8   norms 0.48 / 0.33   gate: PASS
;;   A: (To $e0 $e1)   e.g. tierB-000078 tierB-000115 tierB-000147
;;   B: (And (Past $e0) (To $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p203687   cosine 0.8922 (seeds 4/5 >= 0.85)   records 22 / 3 / 3   norms 1.39 / 0.28   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-001182 tierB-001457 tierB-001754
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200506 ~ p201347   cosine 0.8913 (seeds 5/5 >= 0.85)   records 14 / 6 / 6   norms 0.67 / 0.33   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201148 ~ p203687   cosine 0.8912 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.52 / 0.28   gate: PASS
;;   A: (And (Member $e0 make) (Ongoing $e0))   e.g. tierB-001182 tierB-001457 tierB-001754
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200470 ~ p201679   cosine 0.8898 (seeds 5/5 >= 0.85)   records 15 / 5 / 5   norms 1.02 / 0.37   gate: PASS
;;   A: (And (Member $e0 make) (Patient $e0 $x0))   e.g. tierB-000073 tierB-000964 tierB-001339
;;   B: (And (Member $e0 make) (Past $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200501 ~ p201056   cosine 0.8898 (seeds 5/5 >= 0.85)   records 14 / 7 / 7   norms 0.72 / 0.49   gate: PASS
;;   A: (And (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000858 tierB-000942
;;   B: (And (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200508 ~ p200853   cosine 0.8887 (seeds 4/5 >= 0.85)   records 14 / 9 / 9   norms 0.42 / 0.30   gate: PASS
;;   A: (Recipient $e0 $x0)   e.g. tierB-000150 tierB-000769 tierB-000775
;;   B: (And (Past $e0) (Recipient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200681 ~ p203689   cosine 0.8880 (seeds 4/5 >= 0.85)   records 11 / 3 / 3   norms 0.70 / 0.36   gate: PASS
;;   A: (Member $e0 try)   e.g. tierB-000469 tierB-000470 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e0 try) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200731 ~ p201672   cosine 0.8859 (seeds 5/5 >= 0.85)   records 10 / 5 / 5   norms 0.63 / 0.30   gate: PASS
;;   A: (And (Member $e0 go) (Past $e0))   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200506 ~ p201672   cosine 0.8840 (seeds 5/5 >= 0.85)   records 14 / 5 / 5   norms 0.67 / 0.30   gate: PASS
;;   A: (Member $e0 go)   e.g. tierB-000204 tierB-000219 tierB-000576
;;   B: (And (Goal $e0 $x0) (Member $e0 go) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p202314 ~ p202677   cosine 0.8840 (seeds 5/5 >= 0.85)   records 4 / 3 / 3   norms 0.35 / 0.32   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001394 tierB-001446
;;   B: (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200115 ~ p200964   cosine 0.8819 (seeds 4/5 >= 0.85)   records 45 / 8 / 8   norms 2.10 / 0.98   gate: PASS
;;   A: (Cardinality $x0 <num>)   e.g. tierB-000101 tierB-000133 tierB-000379
;;   B: (And (Cardinality $x0 <num>) (Theme $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201151 ~ p202304   cosine 0.8807 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.45 / 0.26   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201151 ~ p202427   cosine 0.8807 (seeds 5/5 >= 0.85)   records 7 / 4 / 4   norms 0.45 / 0.26   gate: PASS
;;   A: (And (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201148 ~ p203711   cosine 0.8788 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.52 / 0.28   gate: PASS
;;   A: (And (Member $e0 make) (Ongoing $e0))   e.g. tierB-000951 tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p202304   cosine 0.8786 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 0.46 / 0.26   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p202427   cosine 0.8786 (seeds 5/5 >= 0.85)   records 8 / 4 / 4   norms 0.46 / 0.26   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200997 ~ p202431   cosine 0.8780 (seeds 1/5 >= 0.85)   records 8 / 4 / 4   norms 0.46 / 0.26   gate: PASS
;;   A: (Member $e0 walk)   e.g. tierB-000036 tierB-000148 tierB-000805
;;   B: (And (Location $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200115 ~ p201344   cosine 0.8737 (seeds 2/5 >= 0.85)   records 45 / 6 / 6   norms 2.10 / 0.32   gate: PASS
;;   A: (Cardinality $x0 <num>)   e.g. tierB-000133 tierB-000320 tierB-000761
;;   B: (And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p201148 ~ p203712   cosine 0.8722 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.52 / 0.27   gate: PASS
;;   A: (And (Member $e0 make) (Ongoing $e0))   e.g. tierB-000325 tierB-001754 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200048 ~ p200084   cosine 0.8680 (seeds 5/5 >= 0.85)   records 93 / 58 / 58   norms 1.88 / 1.51   gate: PASS
;;   A: (Location $e0 $x0)   e.g. tierB-000008 tierB-000034 tierB-000045
;;   B: (And (Location $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested]  p201112 ~ p202674   cosine 0.8638 (seeds 5/5 >= 0.85)   records 7 / 3 / 3   norms 0.55 / 0.33   gate: PASS
;;   A: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p203712   cosine 0.8635 (seeds 4/5 >= 0.85)   records 22 / 3 / 3   norms 1.39 / 0.27   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000325 tierB-001754 tierB-001809
;;   B: (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p203711   cosine 0.8627 (seeds 5/5 >= 0.85)   records 22 / 3 / 3   norms 1.39 / 0.28   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000951 tierB-001182 tierB-001457
;;   B: (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200498 ~ p200832   cosine 0.8612 (seeds 3/5 >= 0.85)   records 14 / 9 / 9   norms 0.50 / 0.36   gate: PASS
;;   A: (And (Location $e0 $x0) (Patient $e0 $x1))   e.g. tierB-000034 tierB-000291 tierB-000383
;;   B: (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200362 ~ p202674   cosine 0.8563 (seeds 4/5 >= 0.85)   records 19 / 3 / 3   norms 0.91 / 0.33   gate: PASS
;;   A: (Member $e0 start)   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200325 ~ p202309   cosine 0.8524 (seeds 3/5 >= 0.85)   records 22 / 4 / 4   norms 1.39 / 0.35   gate: PASS
;;   A: (Member $e0 make)   e.g. tierB-000325 tierB-001504 tierB-001594
;;   B: (And (Member $e0 make) (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [nested, part-of]  p200149 ~ p200286   cosine 0.8519 (seeds 2/5 >= 0.85)   records 36 / 23 / 23   norms 1.34 / 1.01   gate: PASS
;;   A: (Result $e0 $e1)   e.g. tierB-000228 tierB-000256 tierB-000325
;;   B: (And (Past $e0) (Result $e0 $e1))
;;   rule: none — the units co-occur (nested): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200278 ~ p200284   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200278 ~ p200285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200278 ~ p200289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p200284 ~ p200285   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200284 ~ p200289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200285 ~ p200289   cosine 1.0000 (seeds 5/5 >= 0.85)   records 23 / 23 / 23   norms 0.93 / 0.93   gate: PASS
;;   A: (And (Holder $e0 $x0) (Theme $e0 $x1))   e.g. tierB-000142 tierB-000408 tierB-000492
;;   B: (Holder $e0 $x0)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200584 ~ p200611   cosine 1.0000 (seeds 5/5 >= 0.85)   records 12 / 12 / 12   norms 0.78 / 0.78   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000465
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p200754 ~ p200834   cosine 1.0000 (seeds 5/5 >= 0.85)   records 9 / 9 / 9   norms 0.67 / 0.67   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000199 tierB-000265 tierB-000534
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201003 ~ p201004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000485 tierB-000738 tierB-000942
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201005 ~ p201055   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201005 ~ p201111   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201005 ~ p201143   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201055 ~ p201111   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201055 ~ p201143   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201111 ~ p201143   cosine 1.0000 (seeds 5/5 >= 0.85)   records 7 / 7 / 7   norms 0.74 / 0.74   gate: PASS
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000075 tierB-000173 tierB-000240
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201435 ~ p201567   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.50 / 0.50   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-000942 tierB-001446
;;   B: (And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201565 ~ p201739   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.27 / 0.27   gate: PASS
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))   e.g. tierB-000320 tierB-000779 tierB-000838
;;   B: (And (Cardinality $x0 <num>) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201653 ~ p201674   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.34 / 0.34   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201653 ~ p201675   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.34 / 0.34   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201653 ~ p201745   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.34 / 0.34   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201674 ~ p201675   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.34 / 0.34   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201674 ~ p201745   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.34 / 0.34   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Past $e0))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201675 ~ p201745   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.34 / 0.34   gate: PASS
;;   A: (And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierB-000665 tierB-000797 tierB-001264
;;   B: (And (Holder $e0 $x0) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201749 ~ p201824   cosine 1.0000 (seeds 5/5 >= 0.85)   records 5 / 5 / 5   norms 0.94 / 0.94   gate: PASS
;;   A: (And (Member $e0 contain) (Theme $e0 $x0))   e.g. tierB-000101 tierB-000454 tierB-000768
;;   B: (Member $e0 contain)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p202265   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201863 ~ p202298   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201863 ~ p202299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201863 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p201864 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201864 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201865 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p201869 ~ p202310   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.46 / 0.46   gate: PASS
;;   A: (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))   e.g. tierB-000265 tierB-001446 tierB-001816
;;   B: (And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202102 ~ p202432   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.80 / 0.80   gate: PASS
;;   A: (And (Location $e0 $x0) (Member $x0 table) (Past $e0))   e.g. tierB-000047 tierB-000502 tierB-001041
;;   B: (And (Location $e0 $x0) (Member $x0 table))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202107 ~ p202458   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.86 / 0.86   gate: PASS
;;   A: (And (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-000087 tierB-001515
;;   B: (And (Past $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202265 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202265 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202265 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202265 ~ p202298   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202265 ~ p202299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202265 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202296 ~ p202404   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.92 / 0.92   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))   e.g. tierB-000101 tierB-000768 tierB-001254
;;   B: (And (Agent $e0 $x0) (Member $e0 contain))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202298 ~ p202299   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202298 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Past $e0))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202299 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202299 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202299 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202299 ~ p202409   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e0 start))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202304 ~ p202427   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))   e.g. tierB-000324 tierB-000929 tierB-001044
;;   B: (And (Goal $e0 $x0) (Member $e0 walk))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202409 ~ p201864   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202409 ~ p201865   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202409 ~ p202095   cosine 1.0000 (seeds 5/5 >= 0.85)   records 4 / 4 / 4   norms 0.52 / 0.52   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 start))   e.g. tierB-000738 tierB-000942 tierB-001169
;;   B: (And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p203609   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202662 ~ p203681   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202662 ~ p203682   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202662 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p202663 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202663 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202664 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
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

;; [same-records, part-of]  p202675 ~ p203277   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202675 ~ p203717   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p202675 ~ p204021   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
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

;; [same-records]  p203269 ~ p203710   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203269 ~ p204004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203269 ~ p204005   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203271 ~ p203720   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.33 / 0.33   gate: PASS
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

;; [same-records, part-of]  p203277 ~ p204021   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203609 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203609 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203609 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203609 ~ p203681   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203609 ~ p203682   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203609 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203613 ~ p203708   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203613 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203681 ~ p203682   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203681 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203682 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203682 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203682 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203682 ~ p203906   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e0 begin))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203690 ~ p203253   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.40 / 0.40   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))   e.g. tierB-000470 tierB-001130 tierB-001773
;;   B: (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203706 ~ p203997   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Member $e0 fall) (Past $e0) (Source $e0 $x0))   e.g. tierB-000456 tierB-000779 tierB-001364
;;   B: (And (Member $e0 fall) (Source $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203708 ~ p203724   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.65 / 0.65   gate: PASS
;;   A: (And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000370 tierB-000748 tierB-001658
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203710 ~ p204004   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Patient $e0 $x0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203710 ~ p204005   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203717 ~ p203277   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203717 ~ p204021   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.85 / 0.85   gate: PASS
;;   A: (And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))   e.g. tierB-000030 tierB-001515 tierB-001873
;;   B: (And (Member $e0 stop) (Theme $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203906 ~ p202663   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203906 ~ p202664   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p203906 ~ p203252   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.43 / 0.43   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 begin))   e.g. tierB-000485 tierB-001052 tierB-001138
;;   B: (And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records, part-of]  p203960 ~ p204241   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.32 / 0.32   gate: PASS
;;   A: (And (Goal $e0 bed) (Member $e0 go))   e.g. tierB-000012 tierB-001418 tierB-001496
;;   B: (Goal $e0 bed)
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology

;; [same-records]  p204004 ~ p204005   cosine 1.0000 (seeds 5/5 >= 0.85)   records 3 / 3 / 3   norms 0.26 / 0.26   gate: PASS
;;   A: (And (Member $e0 leave) (Patient $e0 $x0))   e.g. tierB-000004 tierB-000425 tierB-000747
;;   B: (And (Member $e0 leave) (Result $e0 $e1))
;;   rule: none — the units co-occur (same-records): the pair corroborates §4.3.3 / §4.3.1; a whole implying its part is a tautology
