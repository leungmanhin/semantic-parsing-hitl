;; FUSE-NF §4.3.3 Mutual-Information Grouping — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion, and the Implication is the
;; pack rule the pair WOULD become (naming provisional; the candidate stage fixes the pack vocabulary and the
;; gauntlet decides). The record of truth is
;;   mi_faithful.jsonl          (every pair at the recording floor: statistics, verdict, alignment, rule)
;;   patterns2_faithful.jsonl   (the units and their supporting records = the binary matrix)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   features                       the 945 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees)
;;   matrix                         binary presence, 1950 records x 945 units, from each unit's supporting ids (622 records carry no unit and are all-zero rows); 446040 pairs, 19235 with any co-occurrence
;;   MI                             exact pairwise mutual information of the two binary presence variables, in bits, raw
;;   'very high MI'                 raw MI >= 0.0343 bits = the MI of a perfect co-occurrence over 7 of the 1950 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 446040 pairs is ~0.0059 bits); near-miss value 0.0258 (= 5 records); pairs recorded from 0.0166 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01]
;;   'moderate individual support'  both units' support <= 29 records = the 97th percentile of unit support (1.5% of the records; percentiles 50/90/95/99 = 4/11/19/91); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself
;;   calibration                    the ceiling x threshold table checks the paper's claim (median doc-Jaccard of the passes); the claim alone would also accept a lower threshold where perfectly co-occurring support-3..5 pairs (near-duplicate records) dominate — the record-count anchor on the threshold is what keeps them out
;;   'almost always co-occur'       the paper's consequence, shown as the doc-Jaccard column (not gated)
;;   shared records                 n_both = records containing both units; the distinct-sentence count beside it (by corpus equiv_class or text) exposes near-duplicate records, which share every subtree by construction
;;   part-of                        when one unit's atoms embed in the other's (a variable renaming), the pair restates §4.3.1 subsumption and its rule is the larger unit's own pack; flagged in the record, not gated
;;   consolidation                  for every pass: the two units' variables are aligned through the shared records (each unit matched in each record under the miner's abstraction; the correspondence holding in most records is taken and the count shown), the aligned conjunction is the merged feature, and the rule is (Implication (And <merged>) (Mn<Name> <vars>)) — naming provisional; units that never share a skolem give a co-occurrence conjunction with disjoint variables
;;
;; RECORD FORMAT (every record is one passing pair)
;;   ;; [genuine|part-of]  A ~ B   records <of A> / <of B> / <shared> (<distinct sentences among the shared>)   gate: PASS
;;   ;;   MI: <bits>   Jaccard: <shared / either>   e.g. <shared record ids>
;;   ;;   A: <query A>
;;   ;;   B: <query B>
;;   ;;   alignment: <A var = B var …> (holds in <k> of <shared> records)   <note>
;;   (Implication (And <merged atoms>) (Mn<Name> <vars>))
;; A is the unit with the larger support. GENUINE passes come first (neither unit is part of the other: the rule
;; is new to this method), then the PART-OF passes (B's atoms embed in A's: the pair restates §4.3.1 subsumption
;; and the rule is A's own pack); each group sorted by the gate statistic. Near misses are in the .md and the JSONL.
;; Notes: 'B is part of A' = the pair restates §4.3.1 subsumption and the rule is A's own pack;
;; 'no shared skolem' = the units co-occur in the same sentences without touching = a co-occurrence conjunction.
;; Several pairs can yield the SAME merged feature (the same rule); a numeric suffix marks different features that
;; would share a name.

;; ==================== PASSES: 60 pairs — 15 genuine first, then 45 part-of ====================

;; [genuine]  p200284 ~ p200285   records 23 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0925   Jaccard: 1.00   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have))
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 23 of 23 records)
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; [genuine]  p200283 ~ p200323   records 23 / 22 / 22 (22 distinct)   gate: PASS
;;   MI: 0.0861   Jaccard: 0.96   e.g. tierB-000004 tierB-000362 tierB-000370
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))
;;   B: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 22 of 22 records)
(Implication (And (Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Patient_ResultEv $e0 $e1 $x0))

;; [genuine]  p200530 ~ p200601   records 13 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0514   Jaccard: 0.92   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 12 records)
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Past_Patient_ResultEv $e0 $e1 $x0))

;; [genuine]  p200322 ~ p200611   records 22 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0428   Jaccard: 0.55   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 12 of 12 records)
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing $e0 $e1))

;; [genuine]  p200283 ~ p200601   records 23 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0423   Jaccard: 0.52   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 12 records)
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Past_Patient_ResultEv $e0 $e1 $x0))

;; [genuine]  p200423 ~ p200436   records 16 / 16 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0407   Jaccard: 0.60   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 10 of 12 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Agent_Past_ThemeEv $e0 $e1 $x0))

;; [genuine]  p200256 ~ p200343   records 24 / 20 / 14 (14 distinct)   gate: PASS
;;   MI: 0.0404   Jaccard: 0.47   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 14 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e1)) (MnAgent_Agent_ThemeEv $e0 $e1 $x0))

;; [genuine]  p200323 ~ p200530   records 22 / 13 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0402   Jaccard: 0.52   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   B: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 12 records)
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Past_Patient_ResultEv $e0 $e1 $x0))

;; [genuine]  p200584 ~ p200834   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0375   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [genuine]  p200343 ~ p200436   records 20 / 16 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0374   Jaccard: 0.50   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 10 of 12 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Agent_Past_ThemeEv $e0 $e1 $x0))

;; [genuine]  p200800 ~ p200938   records 9 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0361   Jaccard: 0.89   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 8 of 8 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Theme $e1 $e0)) (MnAgent_Agent_Ongoing_ThemeEv $e0 $e1 $x0))

;; [genuine]  p200256 ~ p200423   records 24 / 16 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0351   Jaccard: 0.43   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 10 of 12 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Agent_Past_ThemeEv $e0 $e1 $x0))

;; [genuine]  p200283 ~ p200286   records 23 / 23 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0345   Jaccard: 0.39   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))
;;   B: (And (Past $e0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 13 of 13 records)
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer $e1 $e0 $x0))

;; [genuine]  p201003 ~ p201004   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0343   Jaccard: 1.00   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 7 of 7 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnAgent_Agent_Ongoing_Past_ThemeEv $e0 $e1 $x0))

;; [genuine]  p201055 ~ p201111   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0343   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 7 of 7 records)
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200278 ~ p200284   records 23 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0925   Jaccard: 1.00   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; [part-of]  p200278 ~ p200285   records 23 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0925   Jaccard: 1.00   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; [part-of]  p200278 ~ p200289   records 23 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0925   Jaccard: 1.00   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   B: (Holder $e0 $x0)
;;   alignment: $e0=$e0 $x0=$x0 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; [part-of]  p200284 ~ p200289   records 23 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0925   Jaccard: 1.00   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have))
;;   B: (Holder $e0 $x0)
;;   alignment: $e0=$e0 $x0=$x0 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have)) (MnHolder_Have $e0 $x0))

;; [part-of]  p200285 ~ p200289   records 23 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0925   Jaccard: 1.00   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   B: (Holder $e0 $x0)
;;   alignment: $e0=$e0 $x0=$x0 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Theme $e0 $x1)) (MnHolder_Theme $e0 $x0 $x1))

;; [part-of]  p200322 ~ p200390   records 22 / 17 / 17 (17 distinct)   gate: PASS
;;   MI: 0.0634   Jaccard: 0.77   e.g. tierB-000075 tierB-000173 tierB-000199
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 17 of 17 records)   B is part of A: the rule is A's own pack
(Implication (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing $e1 $e0))

;; [part-of]  p200343 ~ p200423   records 20 / 16 / 16 (16 distinct)   gate: PASS
;;   MI: 0.0612   Jaccard: 0.80   e.g. tierB-000166 tierB-000339 tierB-000410
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 16 of 16 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent $e1 $e0 $x0))

;; [part-of]  p200256 ~ p200436   records 24 / 16 / 16 (16 distinct)   gate: PASS
;;   MI: 0.0573   Jaccard: 0.67   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 16 of 16 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEv $e0 $e1 $x0))

;; [part-of]  p200325 ~ p200470   records 22 / 15 / 15 (15 distinct)   gate: PASS
;;   MI: 0.0549   Jaccard: 0.68   e.g. tierB-000025 tierB-000073 tierB-000269
;;   A: (Member $e0 make)
;;   B: (And (Member $e0 make) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 15 of 15 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 make) (Patient $e0 $x0)) (MnMake_Patient $e0 $x0))

;; [part-of]  p200584 ~ p200611   records 12 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0540   Jaccard: 1.00   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200362 ~ p200499   records 19 / 14 / 14 (14 distinct)   gate: PASS
;;   MI: 0.0534   Jaccard: 0.74   e.g. tierB-000043 tierB-000192 tierB-000199
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Past $e0))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Past $e0)) (MnStart_Past $e0))

;; [part-of]  p200442 ~ p200545   records 16 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0521   Jaccard: 0.81   e.g. tierB-000324 tierB-000387 tierB-000462
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0)) (MnAgent_Goal_Past $e0 $x0 $x1))

;; [part-of]  p200219 ~ p200493   records 27 / 14 / 14 (14 distinct)   gate: PASS
;;   MI: 0.0476   Jaccard: 0.52   e.g. tierB-000045 tierB-000291 tierB-000305
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0)) (MnAgent_Location_Past $e0 $x0 $x1))

;; [part-of]  p200283 ~ p200530   records 23 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0461   Jaccard: 0.57   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))
;;   B: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer $e1 $e0 $x0))

;; [part-of]  p200286 ~ p200530   records 23 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0461   Jaccard: 0.57   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Past $e0) (Result $e0 $e1))
;;   B: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer $e1 $e0 $x0))

;; [part-of]  p200362 ~ p200584   records 19 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0448   Jaccard: 0.63   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200362 ~ p200611   records 19 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0448   Jaccard: 0.63   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Theme $e0 $e1)) (MnStart_ThemeEv $e0 $e1))

;; [part-of]  p200680 ~ p200730   records 11 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0439   Jaccard: 0.91   e.g. tierB-000005 tierB-000094 tierB-000128
;;   A: (Manner $e0 quickly)
;;   B: (And (Manner $e0 quickly) (Past $e0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Manner $e0 quickly) (Past $e0)) (MnMannerQuickly_Past $e0))

;; [part-of]  p200322 ~ p200584   records 22 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0428   Jaccard: 0.55   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200323 ~ p200601   records 22 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0428   Jaccard: 0.55   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; [part-of]  p200754 ~ p200834   records 9 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0425   Jaccard: 1.00   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200286 ~ p200601   records 23 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0423   Jaccard: 0.52   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Past $e0) (Result $e0 $e1))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; [part-of]  p200506 ~ p200731   records 14 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0402   Jaccard: 0.71   e.g. tierB-000012 tierB-000115 tierB-000204
;;   A: (Member $e0 go)
;;   B: (And (Member $e0 go) (Past $e0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 go) (Past $e0)) (MnGo_Past $e0))

;; [part-of]  p200507 ~ p200733   records 14 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0402   Jaccard: 0.71   e.g. tierB-000056 tierB-000425 tierB-000747
;;   A: (Member $x0 door)
;;   B: (And (Member $x0 door) (Patient $e0 $x0))
;;   alignment: $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $x0 door) (Patient $e0 $x0)) (MnPatientOfDoor $e0 $x0))

;; [part-of]  p200732 ~ p200833   records 10 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0401   Jaccard: 0.90   e.g. tierB-000162 tierB-000665 tierB-000730
;;   A: (And (Member $e0 have) (Past $e0))
;;   B: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 have) (Past $e0) (Theme $e0 $x0)) (MnHave_Past_Theme $e0 $x0))

;; [part-of]  p200584 ~ p200754   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0375   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200611 ~ p200754   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0375   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200611 ~ p200834   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0375   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEv $e0 $e1))

;; [part-of]  p200556 ~ p200846   records 13 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0365   Jaccard: 0.69   e.g. tierB-000316 tierB-000338 tierB-000628
;;   A: (Member $x0 person)
;;   B: (And (Agent $e0 $x0) (Member $x0 person))
;;   alignment: $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Member $x0 person)) (MnAgentOfPerson $e0 $x0))

;; [part-of]  p200865 ~ p200969   records 9 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0361   Jaccard: 0.89   e.g. tierB-000176 tierB-000189 tierB-000421
;;   A: (Member $e0 hear)
;;   B: (And (Member $e0 hear) (Past $e0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 hear) (Past $e0)) (MnHear_Past $e0))

;; [part-of]  p200498 ~ p200832   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0357   Jaccard: 0.64   e.g. tierB-000034 tierB-000291 tierB-000383
;;   A: (And (Location $e0 $x0) (Patient $e0 $x1))
;;   B: (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnLocation_Past_Patient $e0 $x0 $x1))

;; [part-of]  p200499 ~ p200754   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0357   Jaccard: 0.64   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Past $e0))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200499 ~ p200834   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0357   Jaccard: 0.64   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Past $e0))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEv $e0 $e1))

;; [part-of]  p200500 ~ p200830   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0357   Jaccard: 0.64   e.g. tierB-000520 tierB-000713 tierB-000784
;;   A: (And (Ongoing $e0) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1)) (MnAgent_Ongoing_Theme $e0 $x0 $x1))

;; [part-of]  p200505 ~ p200848   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0357   Jaccard: 0.64   e.g. tierB-000222 tierB-000392 tierB-000444
;;   A: (Instrument $e0 $x0)
;;   B: (And (Instrument $e0 $x0) (Past $e0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Instrument $e0 $x0) (Past $e0)) (MnInstrument_Past $e0 $x0))

;; [part-of]  p200508 ~ p200847   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0357   Jaccard: 0.64   e.g. tierB-000485 tierB-000715 tierB-000769
;;   A: (Recipient $e0 $x0)
;;   B: (And (Agent $e0 $x0) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1)) (MnAgent_Recipient $e0 $x0 $x1))

;; [part-of]  p200508 ~ p200853   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0357   Jaccard: 0.64   e.g. tierB-000150 tierB-000769 tierB-000775
;;   A: (Recipient $e0 $x0)
;;   B: (And (Past $e0) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Past $e0) (Recipient $e0 $x0)) (MnPast_Recipient $e0 $x0))

;; [part-of]  p200744 ~ p200968   records 10 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0347   Jaccard: 0.80   e.g. tierB-000075 tierB-000173 tierB-000182
;;   A: (Member $e0 begin)
;;   B: (And (Member $e0 begin) (Past $e0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 begin) (Past $e0)) (MnBegin_Past $e0))

;; [part-of]  p201005 ~ p201055   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0343   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201005 ~ p201111   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0343   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201005 ~ p201143   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0343   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201055 ~ p201143   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0343   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1)) (MnBegin_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201111 ~ p201143   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0343   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEv $e0 $e1))

;; [part-of]  p201147 ~ p201173   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0343   Jaccard: 1.00   e.g. tierB-000067 tierB-000393 tierB-000412
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))
;;   B: (Member $e0 kill)
;;   alignment: $e0=$e0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 kill) (Patient $e0 $x0)) (MnKill_Patient $e0 $x0))

;; [part-of]  p201154 ~ p201182   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0343   Jaccard: 1.00   e.g. tierB-000500 tierB-000656 tierB-000782
;;   A: (And (Past $e0) (Through $e0 $x0))
;;   B: (Through $e0 $x0)
;;   alignment: $e0=$e0 $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack
(Implication (And (Past $e0) (Through $e0 $x0)) (MnPast_Through $e0 $x0))
