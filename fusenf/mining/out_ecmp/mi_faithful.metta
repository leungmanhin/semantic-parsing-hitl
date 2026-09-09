;; FUSE-NF §4.3.3 Mutual-Information Grouping — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion, and the Implication is the
;; pack rule the pair WOULD become (naming provisional; the candidate stage fixes the pack vocabulary and the
;; gauntlet decides). The record of truth is
;;   mi_faithful.jsonl          (every pair at the recording floor: statistics, verdict, alignment, rule)
;;   patterns2_faithful.jsonl   (the units and their supporting records = the binary matrix)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   features                       the 1652 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees)
;;   matrix                         binary presence, 762 records x 1652 units, from each unit's supporting ids (106 records carry no unit and are all-zero rows); 1363726 pairs, 39574 with any co-occurrence
;;   MI                             exact pairwise mutual information of the two binary presence variables, in bits, raw
;;   'very high MI'                 raw MI >= 0.0753 bits = the MI of a perfect co-occurrence over 7 of the 762 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 1363726 pairs is ~0.0162 bits); near-miss value 0.057 (= 5 records); pairs recorded from 0.0371 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01]
;;   'moderate individual support'  both units' support <= 12 records = the 97th percentile of unit support (1.6% of the records; percentiles 50/90/95/99 = 4/7/10/28); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself
;;   calibration                    the ceiling x threshold table checks the paper's claim (median doc-Jaccard of the passes); the claim alone would also accept a lower threshold where perfectly co-occurring support-3..5 pairs (near-duplicate records) dominate — the record-count anchor on the threshold is what keeps them out
;;   'almost always co-occur'       the paper's consequence, shown as the doc-Jaccard column (not gated)
;;   shared records                 n_both = records containing both units; the distinct-sentence count beside it (by corpus equiv_class or text) exposes near-duplicate records, which share every subtree by construction
;;   part-of                        when one unit's atoms embed in the other's (a variable renaming), the pair restates §4.3.1 subsumption and its rule is the larger unit's own pack; flagged in the record, not gated
;;   consolidation                  for every pass: the two units' variables are aligned through the shared records (each unit matched in each record under the miner's abstraction; the correspondence holding in most records is taken and the count shown), the aligned conjunction is the merged feature, and the rule is (Implication (And <merged>) (Mn<Name> <vars>)) — naming provisional; units that never share a skolem give a co-occurrence conjunction with disjoint variables
;;
;; RECORD FORMAT (every record is one passing pair)
;;   ;; A ~ B   records <of A> / <of B> / <shared> (<distinct sentences among the shared>)   gate: PASS
;;   ;;   MI: <bits>   Jaccard: <shared / either>   e.g. <shared record ids>
;;   ;;   A: <query A>
;;   ;;   B: <query B>
;;   ;;   alignment: <A var = B var …> (holds in <k> of <shared> records)   <note>
;;   (Implication (And <merged atoms>) (Mn<Name> <vars>))
;; A is the unit with the larger support; records sorted by the gate statistic. Near misses are in the .md and
;; the JSONL. Notes: 'B is part of A' = the pair restates §4.3.1 subsumption and the rule is A's own pack;
;; 'no shared skolem' = the units co-occur in the same sentences without touching = a co-occurrence conjunction.
;; Several pairs can yield the SAME merged feature (the same rule); a numeric suffix marks different features that
;; would share a name.

;; ==================== PASSES: 106 pairs (84 part-of, 22 genuine) ====================

;; p200326 ~ p200329   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200326 ~ p200330   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x2=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200326 ~ p200332   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x1=$x0 $x2=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200326 ~ p200338   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200326 ~ p200340   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200326 ~ p200341   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x2=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200326 ~ p200352   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (Member $e0 give)
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200329 ~ p200330   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200329 ~ p200332   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200329 ~ p200338   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1)) (MnAgent_Give_Recipient $e0 $x0 $x1))

;; p200329 ~ p200340   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1)) (MnAgent_Give_Recipient $e0 $x0 $x1))

;; p200329 ~ p200341   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; p200329 ~ p200352   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   B: (Member $e0 give)
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1)) (MnAgent_Give_Recipient $e0 $x0 $x1))

;; p200330 ~ p200332   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x1=$x1 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Give_Recipient_Theme_2 $e0 $x0 $x1 $x2))

;; p200330 ~ p200338   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1)) (MnAgent_Give_Theme $e0 $x0 $x1))

;; p200330 ~ p200340   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Give_Recipient_Theme_2 $e0 $x0 $x1 $x2))

;; p200330 ~ p200341   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1)) (MnAgent_Give_Theme $e0 $x0 $x1))

;; p200330 ~ p200352   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   B: (Member $e0 give)
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1)) (MnAgent_Give_Theme $e0 $x0 $x1))

;; p200332 ~ p200338   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x2) (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnAgent_Give_Recipient_Theme_3 $e0 $x0 $x1 $x2))

;; p200332 ~ p200340   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme $e0 $x0 $x1))

;; p200332 ~ p200341   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme $e0 $x0 $x1))

;; p200332 ~ p200352   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (Member $e0 give)
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme $e0 $x0 $x1))

;; p200338 ~ p200340   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1)) (MnAgent_Give_Recipient $e0 $x0 $x1))

;; p200338 ~ p200341   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give))
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1)) (MnAgent_Give_Theme $e0 $x0 $x1))

;; p200338 ~ p200352   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give))
;;   B: (Member $e0 give)
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give)) (MnAgent_Give $e0 $x0))

;; p200340 ~ p200341   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme $e0 $x0 $x1))

;; p200340 ~ p200352   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))
;;   B: (Member $e0 give)
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0)) (MnGive_Recipient $e0 $x0))

;; p200341 ~ p200352   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.1168   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Theme $e0 $x0))
;;   B: (Member $e0 give)
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Theme $e0 $x0)) (MnGive_Theme $e0 $x0))

;; p200402 ~ p200411   records 11 / 11 / 11 (3 distinct)   gate: PASS
;;   MI: 0.1089   Jaccard: 1.00   e.g. tierA-000222 tierA-000223 tierA-000224
;;   A: (And (Member $e0 destroy) (Patient $e0 $x0))
;;   B: (Member $e0 destroy)
;;   alignment: $e0=$e0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 8 of the shared records duplicate another
(Implication (And (Member $e0 destroy) (Patient $e0 $x0)) (MnDestroy_Patient $e0 $x0))

;; p200470 ~ p200481   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 answer))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)) (MnAgent_Answer_Theme $e0 $x0 $x1))

;; p200470 ~ p200486   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))
;;   B: (And (Member $e0 answer) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)) (MnAgent_Answer_Theme $e0 $x0 $x1))

;; p200470 ~ p200499   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))
;;   B: (Member $e0 answer)
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)) (MnAgent_Answer_Theme $e0 $x0 $x1))

;; p200471 ~ p200483   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 teach))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_Teach_Recipient $e0 $x0 $x1))

;; p200471 ~ p200489   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))
;;   B: (And (Member $e0 teach) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_Teach_Recipient $e0 $x0 $x1))

;; p200471 ~ p200503   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))
;;   B: (Member $e0 teach)
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_Teach_Recipient $e0 $x0 $x1))

;; p200481 ~ p200486   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Agent $e0 $x0) (Member $e0 answer))
;;   B: (And (Member $e0 answer) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)) (MnAgent_Answer_Theme $e0 $x0 $x1))

;; p200481 ~ p200499   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Agent $e0 $x0) (Member $e0 answer))
;;   B: (Member $e0 answer)
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 answer)) (MnAgent_Answer $e0 $x0))

;; p200483 ~ p200489   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (And (Agent $e0 $x0) (Member $e0 teach))
;;   B: (And (Member $e0 teach) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_Teach_Recipient $e0 $x0 $x1))

;; p200483 ~ p200503   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (And (Agent $e0 $x0) (Member $e0 teach))
;;   B: (Member $e0 teach)
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 teach)) (MnAgent_Teach $e0 $x0))

;; p200486 ~ p200499   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Member $e0 answer) (Theme $e0 $x0))
;;   B: (Member $e0 answer)
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Member $e0 answer) (Theme $e0 $x0)) (MnAnswer_Theme $e0 $x0))

;; p200487 ~ p200500   records 10 / 10 / 10 (5 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierC-000045 tierC-000046 tierC-000071
;;   A: (And (Member $e0 build) (Patient $e0 $x0))
;;   B: (Member $e0 build)
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 build) (Patient $e0 $x0)) (MnBuild_Patient $e0 $x0))

;; p200488 ~ p200501   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (And (Member $e0 lend) (Theme $e0 $x0))
;;   B: (Member $e0 lend)
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Member $e0 lend) (Theme $e0 $x0)) (MnLend_Theme $e0 $x0))

;; p200489 ~ p200503   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.1009   Jaccard: 1.00   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (And (Member $e0 teach) (Recipient $e0 $x0))
;;   B: (Member $e0 teach)
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Member $e0 teach) (Recipient $e0 $x0)) (MnTeach_Recipient $e0 $x0))

;; p200410 ~ p200482   records 11 / 10 / 10 (4 distinct)   gate: PASS
;;   MI: 0.0945   Jaccard: 0.91   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (Member $e0 decide)
;;   B: (And (Agent $e0 $x0) (Member $e0 decide))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide)) (MnAgent_Decide $e0 $x0))

;; p200550 ~ p200563   records 9 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0926   Jaccard: 1.00   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))
;;   B: (And (Member $e0 decide) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)) (MnAgent_Decide_Theme $e0 $x0 $x1))

;; p200551 ~ p200559   records 9 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0926   Jaccard: 1.00   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 lend))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1)) (MnAgent_Lend_Theme_1 $e0 $x0 $x1))

;; p200558 ~ p200574   records 9 / 9 / 9 (4 distinct)   gate: PASS
;;   MI: 0.0926   Jaccard: 1.00   e.g. tierA-000143 tierA-000145 tierA-000148
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel))
;;   B: (Member $e0 cancel)
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 cancel)) (MnAgent_Cancel $e0 $x0))

;; p200355 ~ p200490   records 12 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0906   Jaccard: 0.83   e.g. tierA-000262 tierA-000272 tierA-000277
;;   A: (Source $e0 $x0)
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Source $e0 $x0) (Theme $e0 $x1)) (MnSource_Theme $e0 $x0 $x1))

;; p200482 ~ p200550   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0864   Jaccard: 0.90   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (And (Agent $e0 $x0) (Member $e0 decide))
;;   B: (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)) (MnAgent_Decide_Theme $e0 $x0 $x1))

;; p200482 ~ p200563   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0864   Jaccard: 0.90   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (And (Agent $e0 $x0) (Member $e0 decide))
;;   B: (And (Member $e0 decide) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)) (MnAgent_Decide_Theme $e0 $x0 $x1))

;; p200488 ~ p200551   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0864   Jaccard: 0.90   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (And (Member $e0 lend) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 lend) (Theme $e0 $x0)) (MnAgent_Lend_Theme_2 $e0 $x0 $x1))

;; p200488 ~ p200559   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0864   Jaccard: 0.90   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (And (Member $e0 lend) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 lend))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 lend) (Theme $e0 $x0)) (MnAgent_Lend_Theme_2 $e0 $x0 $x1))

;; p200501 ~ p200551   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0864   Jaccard: 0.90   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (Member $e0 lend)
;;   B: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1)) (MnAgent_Lend_Theme_1 $e0 $x0 $x1))

;; p200501 ~ p200559   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0864   Jaccard: 0.90   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (Member $e0 lend)
;;   B: (And (Agent $e0 $x0) (Member $e0 lend))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 lend)) (MnAgent_Lend $e0 $x0))

;; p200620 ~ p200680   records 8 / 8 / 8 (2 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000008 tierA-000009 tierA-000010
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $x0 school))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1)) (MnAgentOfSchool_Theme $e0 $x0 $x1))

;; p200621 ~ p200681   records 8 / 8 / 8 (4 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierC-000017 tierC-000018 tierC-000123
;;   A: (And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1))
;;   B: (And (Agent $e0 $x0) (Possession $x0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1)) (MnAgentOfPossessionOfPerson $e0 $x0 $x1))

;; p200661 ~ p200675   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 abandon))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Abandon_Theme $e0 $x0 $x1))

;; p200661 ~ p200685   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))
;;   B: (And (Member $e0 abandon) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Abandon_Theme $e0 $x0 $x1))

;; p200661 ~ p200696   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))
;;   B: (Member $e0 abandon)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Abandon_Theme $e0 $x0 $x1))

;; p200662 ~ p200676   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000222 tierA-000224 tierA-000226
;;   A: (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 destroy))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1)) (MnAgent_Destroy_Patient $e0 $x0 $x1))

;; p200663 ~ p200677   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 reject))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Reject_Theme $e0 $x0 $x1))

;; p200663 ~ p200687   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))
;;   B: (And (Member $e0 reject) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Reject_Theme $e0 $x0 $x1))

;; p200663 ~ p200699   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))
;;   B: (Member $e0 reject)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Reject_Theme $e0 $x0 $x1))

;; p200664 ~ p200678   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 repair))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Repair_Patient $e0 $x0 $x1))

;; p200664 ~ p200688   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))
;;   B: (And (Member $e0 repair) (Patient $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Repair_Patient $e0 $x0 $x1))

;; p200664 ~ p200700   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))
;;   B: (Member $e0 repair)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Repair_Patient $e0 $x0 $x1))

;; p200675 ~ p200685   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon))
;;   B: (And (Member $e0 abandon) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Abandon_Theme $e0 $x0 $x1))

;; p200675 ~ p200696   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon))
;;   B: (Member $e0 abandon)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon)) (MnAgent_Abandon $e0 $x0))

;; p200677 ~ p200687   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject))
;;   B: (And (Member $e0 reject) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Reject_Theme $e0 $x0 $x1))

;; p200677 ~ p200699   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject))
;;   B: (Member $e0 reject)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject)) (MnAgent_Reject $e0 $x0))

;; p200678 ~ p200688   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Agent $e0 $x0) (Member $e0 repair))
;;   B: (And (Member $e0 repair) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Repair_Patient $e0 $x0 $x1))

;; p200678 ~ p200700   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Agent $e0 $x0) (Member $e0 repair))
;;   B: (Member $e0 repair)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 repair)) (MnAgent_Repair $e0 $x0))

;; p200685 ~ p200696   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Member $e0 abandon) (Theme $e0 $x0))
;;   B: (Member $e0 abandon)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 abandon) (Theme $e0 $x0)) (MnAbandon_Theme $e0 $x0))

;; p200686 ~ p200698   records 8 / 8 / 8 (4 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierC-000153 tierC-000154 tierC-000181
;;   A: (And (Member $e0 have) (Theme $e0 $x0))
;;   B: (Member $e0 have)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Member $e0 have) (Theme $e0 $x0)) (MnHave_Theme $e0 $x0))

;; p200687 ~ p200699   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Member $e0 reject) (Theme $e0 $x0))
;;   B: (Member $e0 reject)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 reject) (Theme $e0 $x0)) (MnReject_Theme $e0 $x0))

;; p200688 ~ p200700   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0841   Jaccard: 1.00   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))
;;   B: (Member $e0 repair)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 repair) (Patient $e0 $x0)) (MnRepair_Patient $e0 $x0))

;; p200410 ~ p200550   records 11 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0827   Jaccard: 0.82   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (Member $e0 decide)
;;   B: (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)) (MnAgent_Decide_Theme $e0 $x0 $x1))

;; p200410 ~ p200563   records 11 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0827   Jaccard: 0.82   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (Member $e0 decide)
;;   B: (And (Member $e0 decide) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 decide) (Theme $e0 $x0)) (MnDecide_Theme $e0 $x0))

;; p200412 ~ p200560   records 11 / 9 / 9 (2 distinct)   gate: PASS
;;   MI: 0.0827   Jaccard: 0.82   e.g. tierA-000114 tierA-000115 tierA-000116
;;   A: (Member $x0 board)
;;   B: (And (Agent $e0 $x0) (Member $x0 board))
;;   alignment: $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $x0 board)) (MnAgentOfBoard $e0 $x0))

;; p200351 ~ p200564   records 12 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0798   Jaccard: 0.75   e.g. tierA-000133 tierA-000135 tierA-000136
;;   A: (Member $e0 discover)
;;   B: (And (Member $e0 discover) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 discover) (Theme $e0 $x0)) (MnDiscover_Theme $e0 $x0))

;; p200355 ~ p200561   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0798   Jaccard: 0.75   e.g. tierA-000262 tierA-000272 tierA-000277
;;   A: (Source $e0 $x0)
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x1) (Source $e0 $x0)) (MnAgent_Source $e0 $x0 $x1))

;; p200561 ~ p200665   records 9 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0781   Jaccard: 0.89   e.g. tierA-000262 tierA-000272 tierA-000277
;;   A: (And (Agent $e0 $x0) (Source $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Source_Theme $e0 $x0 $x1 $x2))

;; p200575 ~ p200684   records 9 / 8 / 8 (2 distinct)   gate: PASS
;;   MI: 0.0781   Jaccard: 0.89   e.g. tierA-000128 tierA-000129 tierA-000130
;;   A: (Member $x0 ledger)
;;   B: (And (Location $e0 $x0) (Member $x0 ledger))
;;   alignment: $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Location $e0 $x0) (Member $x0 ledger)) (MnLocationOfLedger $e0 $x0))

;; p200760 ~ p200825   records 7 / 7 / 7 (2 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000001 tierA-000002 tierA-000003
;;   A: (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $x0 depot))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1)) (MnAgentOfDepot_Theme $e0 $x0 $x1))

;; p200762 ~ p200827   records 7 / 7 / 7 (4 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierC-000001 tierC-000077 tierC-000078
;;   A: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; p200762 ~ p200828   records 7 / 7 / 7 (4 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierC-000001 tierC-000077 tierC-000078
;;   A: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   B: (And (Before $e0 $e1) (Past $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; p200793 ~ p200801   records 7 / 7 / 7 (1 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000022 tierA-000023 tierA-000024
;;   A: (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))
;;   B: (Inheritance pottery_studio studio)
;;   alignment: — (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio)) (MnPotteryStudioOfInheritanceStudio $x0))

;; p200793 ~ p200856   records 7 / 7 / 7 (1 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000022 tierA-000023 tierA-000024
;;   A: (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))
;;   B: (Member $x0 kiln)
;;   alignment: — (holds in 7 of 7 records)   no shared skolem: co-occurrence conjunction; 6 of the shared records duplicate another
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Member $x1 kiln)) (MnInheritancePotteryStudioStudio_PotteryStudio_Kiln $x0 $x1))

;; p200793 ~ p200857   records 7 / 7 / 7 (1 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000022 tierA-000023 tierA-000024
;;   A: (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))
;;   B: (Member $x0 pottery_studio)
;;   alignment: $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio)) (MnPotteryStudioOfInheritanceStudio $x0))

;; p200801 ~ p200856   records 7 / 7 / 7 (1 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000022 tierA-000023 tierA-000024
;;   A: (Inheritance pottery_studio studio)
;;   B: (Member $x0 kiln)
;;   alignment: — (holds in 7 of 7 records)   no shared skolem: co-occurrence conjunction; 6 of the shared records duplicate another
(Implication (And (Inheritance pottery_studio studio) (Member $x0 kiln)) (MnInheritancePotteryStudioStudio_Kiln $x0))

;; p200801 ~ p200857   records 7 / 7 / 7 (1 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000022 tierA-000023 tierA-000024
;;   A: (Inheritance pottery_studio studio)
;;   B: (Member $x0 pottery_studio)
;;   alignment: — (holds in 7 of 7 records)   no shared skolem: co-occurrence conjunction; 6 of the shared records duplicate another
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio)) (MnPotteryStudioOfInheritanceStudio $x0))

;; p200805 ~ p200834   records 7 / 7 / 7 (3 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000145 tierA-000148 tierA-000150
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))
;;   B: (And (Member $e0 cancel) (Patient $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1)) (MnAgent_Cancel_Patient $e0 $x0 $x1))

;; p200806 ~ p200823   records 7 / 7 / 7 (2 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000133 tierA-000135 tierA-000136
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 discover))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1)) (MnAgent_Discover_Theme $e0 $x0 $x1))

;; p200807 ~ p200824   records 7 / 7 / 7 (3 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000114 tierA-000116 tierA-000119
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 postpone))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1)) (MnAgent_Postpone_Theme $e0 $x0 $x1))

;; p200807 ~ p200836   records 7 / 7 / 7 (3 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000114 tierA-000116 tierA-000119
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))
;;   B: (And (Member $e0 postpone) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1)) (MnAgent_Postpone_Theme $e0 $x0 $x1))

;; p200807 ~ p200854   records 7 / 7 / 7 (3 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000114 tierA-000116 tierA-000119
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))
;;   B: (Member $e0 postpone)
;;   alignment: $e0=$e0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1)) (MnAgent_Postpone_Theme $e0 $x0 $x1))

;; p200808 ~ p200833   records 7 / 7 / 7 (4 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierC-000045 tierC-000046 tierC-000072
;;   A: (And (Member $e0 build) (Past $e0) (Patient $e0 $x0))
;;   B: (And (Member $e0 build) (Past $e0))
;;   alignment: $e0=$e0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnBuild_Past_Patient $e0 $x0))

;; p200809 ~ p200835   records 7 / 7 / 7 (3 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000300 tierA-000301 tierA-000303
;;   A: (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Member $e0 lend) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnLend_Recipient_Theme $e0 $x0 $x1))

;; p200822 ~ p200851   records 7 / 7 / 7 (3 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000315 tierA-000318 tierA-000319
;;   A: (And (Agent $e0 $x0) (CoAgent $e0 $x1))
;;   B: (CoAgent $e0 $x0)
;;   alignment: $e0=$e0 $x1=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1)) (MnAgent_CoAgent $e0 $x0 $x1))

;; p200824 ~ p200836   records 7 / 7 / 7 (3 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000114 tierA-000116 tierA-000119
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone))
;;   B: (And (Member $e0 postpone) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 7 of 7 records)   4 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1)) (MnAgent_Postpone_Theme $e0 $x0 $x1))

;; p200824 ~ p200854   records 7 / 7 / 7 (3 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000114 tierA-000116 tierA-000119
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone))
;;   B: (Member $e0 postpone)
;;   alignment: $e0=$e0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 postpone)) (MnAgent_Postpone $e0 $x0))

;; p200827 ~ p200828   records 7 / 7 / 7 (4 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierC-000001 tierC-000077 tierC-000078
;;   A: (And (Before $e0 $e1) (Past $e0))
;;   B: (And (Before $e0 $e1) (Past $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 7 of 7 records)   3 of the shared records duplicate another
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; p200829 ~ p200850   records 7 / 7 / 7 (2 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000008 tierA-000009 tierA-000010
;;   A: (And (Beneficiary $e0 $x0) (Past $e0))
;;   B: (Beneficiary $e0 $x0)
;;   alignment: $e0=$e0 $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Beneficiary $e0 $x0) (Past $e0)) (MnBeneficiary_Past $e0 $x0))

;; p200830 ~ p200852   records 7 / 7 / 7 (1 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000001 tierA-000002 tierA-000003
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift))
;;   B: (GroupOf $x0 forklift)
;;   alignment: $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift)) (MnCardinalityNum_GroupOfForklift $x0))

;; p200836 ~ p200854   records 7 / 7 / 7 (3 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000114 tierA-000116 tierA-000119
;;   A: (And (Member $e0 postpone) (Theme $e0 $x0))
;;   B: (Member $e0 postpone)
;;   alignment: $e0=$e0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Member $e0 postpone) (Theme $e0 $x0)) (MnPostpone_Theme $e0 $x0))

;; p200856 ~ p200857   records 7 / 7 / 7 (1 distinct)   gate: PASS
;;   MI: 0.0754   Jaccard: 1.00   e.g. tierA-000022 tierA-000023 tierA-000024
;;   A: (Member $x0 kiln)
;;   B: (Member $x0 pottery_studio)
;;   alignment: — (holds in 7 of 7 records)   no shared skolem: co-occurrence conjunction; 6 of the shared records duplicate another
(Implication (And (Member $x0 kiln) (Member $x1 pottery_studio)) (MnKiln_PotteryStudio $x0 $x1))
