;; FUSE-NF §4.3.3 Mutual-Information Grouping — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion, and the Implication is the
;; pack rule the pair WOULD become (naming provisional; the candidate stage fixes the pack vocabulary and the
;; gauntlet decides). The record of truth is
;;   mi_faithful.jsonl          (every pair at the recording floor: statistics, verdict, alignment, rule)
;;   patterns2_faithful.jsonl   (the units and their supporting records = the binary matrix)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   features                       the 1454 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees)
;;   matrix                         binary presence, 2302 records x 1454 units, from each unit's supporting ids (687 records carry no unit and are all-zero rows); 1056331 pairs, 36399 with any co-occurrence
;;   MI                             exact pairwise mutual information of the two binary presence variables, in bits, raw
;;   'very high MI'                 raw MI >= 0.0298 bits = the MI of a perfect co-occurrence over 7 of the 2302 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 1056331 pairs is ~0.0053 bits); near-miss value 0.0223 (= 5 records); pairs recorded from 0.0144 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01]
;;   'moderate individual support'  both units' support <= 27 records = the 97th percentile of unit support (1.2% of the records; percentiles 50/90/95/99 = 4/9/16/66); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself
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

;; ==================== PASSES: 104 pairs — 27 genuine first, then 77 part-of ====================

;; [genuine]  p200321 ~ p200339   records 27 / 26 / 26 (25 distinct)   gate: PASS
;;   MI: 0.0866   Jaccard: 0.96   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have))
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 26 of 26 records)   1 of the shared records duplicate another
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; [genuine]  p200517 ~ p200578   records 17 / 16 / 16 (15 distinct)   gate: PASS
;;   MI: 0.0574   Jaccard: 0.94   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 16 of 16 records)   1 of the shared records duplicate another
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Past_Patient_ResultEv_1 $e0 $e1 $x0))

;; [genuine]  p200323 ~ p200517   records 27 / 17 / 16 (15 distinct)   gate: PASS
;;   MI: 0.0460   Jaccard: 0.57   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   B: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 16 of 16 records)   1 of the shared records duplicate another
(Implication (And (Experiencer $e1 $x0) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnExperiencer_Past_Patient_ResultEv_2 $e0 $e1 $x0))

;; [genuine]  p200844 ~ p200935   records 12 / 11 / 11 (7 distinct)   gate: PASS
;;   MI: 0.0416   Jaccard: 0.92   e.g. tierB-000412 tierB-000688 tierB-001302
;;   A: (And (Before $e0 $e1) (Past $e1))
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 11 of 11 records)   4 of the shared records duplicate another
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; [genuine]  p200463 ~ p200480   records 19 / 18 / 14 (13 distinct)   gate: PASS
;;   MI: 0.0407   Jaccard: 0.61   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 14 records)   1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Agent_Past_ThemeEv_1 $e0 $e1 $x0))

;; [genuine]  p200320 ~ p200379   records 27 / 24 / 16 (15 distinct)   gate: PASS
;;   MI: 0.0388   Jaccard: 0.46   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 14 of 16 records)   1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e1)) (MnAgent_Agent_ThemeEv $e0 $e1 $x0))

;; [genuine]  p200899 ~ p201043   records 11 / 10 / 10 (9 distinct)   gate: PASS
;;   MI: 0.0382   Jaccard: 0.91   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 10 of 10 records)   1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_Agent_Ongoing_ThemeEv $e0 $e1 $x0))

;; [genuine]  p200322 ~ p200323   records 27 / 27 / 16 (15 distinct)   gate: PASS
;;   MI: 0.0370   Jaccard: 0.42   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Past $e0) (Result $e0 $e1))
;;   B: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 16 of 16 records)   1 of the shared records duplicate another
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; [genuine]  p201102 ~ p201103   records 9 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 9 of 9 records)   1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnAgent_Agent_Ongoing_Past_ThemeEv_1 $e0 $e1 $x0))

;; [genuine]  p201168 ~ p201222   records 9 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [genuine]  p200380 ~ p200847   records 24 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0366   Jaccard: 0.50   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 12 of 12 records)
(Implication (And (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0)) (MnStart_ThemeEvOfOngoing_2 $e1 $e0))

;; [genuine]  p200379 ~ p200463   records 24 / 19 / 14 (13 distinct)   gate: PASS
;;   MI: 0.0365   Jaccard: 0.48   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 14 records)   1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e1) (Theme $e1 $e0)) (MnAgent_Agent_Past_ThemeEv_2 $e0 $e1 $x0))

;; [genuine]  p200320 ~ p200480   records 27 / 18 / 14 (13 distinct)   gate: PASS
;;   MI: 0.0358   Jaccard: 0.45   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 14 records)   1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Agent_Past_ThemeEv_1 $e0 $e1 $x0))

;; [genuine]  p201043 ~ p201103   records 10 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0349   Jaccard: 0.90   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 9 of 9 records)   1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnAgent_Agent_Ongoing_Past_ThemeEv_1 $e0 $e1 $x0))

;; [genuine]  p201068 ~ p201168   records 10 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0349   Jaccard: 0.90   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Past $e0))
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [genuine]  p201068 ~ p201245   records 10 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0349   Jaccard: 0.90   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Past $e0))
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEv $e0 $e1))

;; [genuine]  p200899 ~ p201102   records 11 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0336   Jaccard: 0.82   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 9 of 9 records)   1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnAgent_Agent_Ongoing_Past_ThemeEv_2 $e0 $e1 $x0))

;; [genuine]  p201433 ~ p201434   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0334   Jaccard: 1.00   e.g. tierC-000317 tierC-000318 tierC-000319
;;   A: (ConditionalProperty bicycle permitted footpath)
;;   B: (ConditionalProperty pedestrian permitted footpath)
;;   alignment: — (holds in 8 of 8 records)   no shared skolem: co-occurrence conjunction; 5 of the shared records duplicate another
(Implication (And (ConditionalProperty bicycle permitted footpath) (ConditionalProperty pedestrian permitted footpath)) (MnConditionalPropertyBicyclePermittedFootpath_ConditionalPropertyPedestrianPermittedFootpath))

;; [genuine]  p201433 ~ p201435   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0334   Jaccard: 1.00   e.g. tierC-000317 tierC-000318 tierC-000319
;;   A: (ConditionalProperty bicycle permitted footpath)
;;   B: (Inheritance bicycle permitted) ~NEG
;;   alignment: — (holds in 8 of 8 records)   no shared skolem: co-occurrence conjunction; 5 of the shared records duplicate another
(Implication (And (ConditionalProperty bicycle permitted footpath) (Inheritance bicycle permitted) ~NEG) (MnConditionalPropertyBicyclePermittedFootpath_InheritanceBicyclePermittedNeg))

;; [genuine]  p201433 ~ p201436   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0334   Jaccard: 1.00   e.g. tierC-000317 tierC-000318 tierC-000319
;;   A: (ConditionalProperty bicycle permitted footpath)
;;   B: (Inheritance pedestrian permitted) ~NEG
;;   alignment: — (holds in 8 of 8 records)   no shared skolem: co-occurrence conjunction; 5 of the shared records duplicate another
(Implication (And (ConditionalProperty bicycle permitted footpath) (Inheritance pedestrian permitted) ~NEG) (MnConditionalPropertyBicyclePermittedFootpath_InheritancePedestrianPermittedNeg))

;; [genuine]  p201434 ~ p201435   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0334   Jaccard: 1.00   e.g. tierC-000317 tierC-000318 tierC-000319
;;   A: (ConditionalProperty pedestrian permitted footpath)
;;   B: (Inheritance bicycle permitted) ~NEG
;;   alignment: — (holds in 8 of 8 records)   no shared skolem: co-occurrence conjunction; 5 of the shared records duplicate another
(Implication (And (ConditionalProperty pedestrian permitted footpath) (Inheritance bicycle permitted) ~NEG) (MnConditionalPropertyPedestrianPermittedFootpath_InheritanceBicyclePermittedNeg))

;; [genuine]  p201434 ~ p201436   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0334   Jaccard: 1.00   e.g. tierC-000317 tierC-000318 tierC-000319
;;   A: (ConditionalProperty pedestrian permitted footpath)
;;   B: (Inheritance pedestrian permitted) ~NEG
;;   alignment: — (holds in 8 of 8 records)   no shared skolem: co-occurrence conjunction; 5 of the shared records duplicate another
(Implication (And (ConditionalProperty pedestrian permitted footpath) (Inheritance pedestrian permitted) ~NEG) (MnConditionalPropertyPedestrianPermittedFootpath_InheritancePedestrianPermittedNeg))

;; [genuine]  p201435 ~ p201436   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0334   Jaccard: 1.00   e.g. tierC-000317 tierC-000318 tierC-000319
;;   A: (Inheritance bicycle permitted) ~NEG
;;   B: (Inheritance pedestrian permitted) ~NEG
;;   alignment: — (holds in 8 of 8 records)   no shared skolem: co-occurrence conjunction; 5 of the shared records duplicate another
(Implication (And (Inheritance bicycle permitted) ~NEG (Inheritance pedestrian permitted) ~NEG) (MnInheritanceBicyclePermittedNeg_InheritancePedestrianPermittedNeg))

;; [genuine]  p201481 ~ p201482   records 8 / 8 / 8 (6 distinct)   gate: PASS
;;   MI: 0.0334   Jaccard: 1.00   e.g. tierB-000258 tierB-001035 tierB-001867
;;   A: (And (Agent $e0 $x0) (To $e0 $e1))
;;   B: (And (Agent $e0 $x0) (To $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 8 of 8 records)   2 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (To $e0 $e1)) (MnAgent_Agent_ToEv $e0 $e1 $x0))

;; [genuine]  p200785 ~ p201224   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0327   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [genuine]  p200728 ~ p201246   records 13 / 9 / 9 (6 distinct)   gate: PASS
;;   MI: 0.0319   Jaccard: 0.69   e.g. tierB-000063 tierB-000932 tierC-000045
;;   A: (And (Member $e0 build) (Patient $e0 $x0))
;;   B: (And (Member $e0 build) (Past $e0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   3 of the shared records duplicate another
(Implication (And (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnBuild_Past_Patient $e0 $x0))

;; [genuine]  p201676 ~ p201771   records 7 / 7 / 7 (6 distinct)   gate: PASS
;;   MI: 0.0298   Jaccard: 1.00   e.g. tierB-001582 tierB-001817 tierC-000001
;;   A: (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))
;;   B: (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 7 of 7 records)   1 of the shared records duplicate another
(Implication (And (Experiencer $e0 $x0) (Member $e1 become) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Become_Patient_ResultEv $e0 $e1 $x0))

;; [part-of]  p200321 ~ p200327   records 27 / 27 / 27 (25 distinct)   gate: PASS
;;   MI: 0.0920   Jaccard: 1.00   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have))
;;   B: (Holder $e0 $x0)
;;   alignment: $e0=$e0 $x0=$x0 (holds in 27 of 27 records)   B is part of A: the rule is A's own pack; 2 of the shared records duplicate another
(Implication (And (Holder $e0 $x0) (Member $e0 have)) (MnHolder_Have $e0 $x0))

;; [part-of]  p200337 ~ p200339   records 26 / 26 / 26 (25 distinct)   gate: PASS
;;   MI: 0.0893   Jaccard: 1.00   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 26 of 26 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; [part-of]  p200321 ~ p200337   records 27 / 26 / 26 (25 distinct)   gate: PASS
;;   MI: 0.0866   Jaccard: 0.96   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have))
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 26 of 26 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; [part-of]  p200327 ~ p200337   records 27 / 26 / 26 (25 distinct)   gate: PASS
;;   MI: 0.0866   Jaccard: 0.96   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (Holder $e0 $x0)
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 26 of 26 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; [part-of]  p200327 ~ p200339   records 27 / 26 / 26 (25 distinct)   gate: PASS
;;   MI: 0.0866   Jaccard: 0.96   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (Holder $e0 $x0)
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 26 of 26 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Holder $e0 $x0) (Theme $e0 $x1)) (MnHolder_Theme $e0 $x0 $x1))

;; [part-of]  p200380 ~ p200451   records 24 / 19 / 19 (18 distinct)   gate: PASS
;;   MI: 0.0613   Jaccard: 0.79   e.g. tierB-000075 tierB-000173 tierB-000199
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 19 of 19 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing $e1 $e0))

;; [part-of]  p200320 ~ p200463   records 27 / 19 / 19 (18 distinct)   gate: PASS
;;   MI: 0.0587   Jaccard: 0.70   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 19 of 19 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEv $e0 $e1 $x0))

;; [part-of]  p200379 ~ p200480   records 24 / 18 / 18 (17 distinct)   gate: PASS
;;   MI: 0.0575   Jaccard: 0.75   e.g. tierB-000166 tierB-000339 tierB-000410
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 18 of 18 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent $e1 $e0 $x0))

;; [part-of]  p200322 ~ p200517   records 27 / 17 / 17 (16 distinct)   gate: PASS
;;   MI: 0.0518   Jaccard: 0.63   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Past $e0) (Result $e0 $e1))
;;   B: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 17 of 17 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Experiencer $e1 $x0) (Past $e0) (Result $e0 $e1)) (MnPast_ResultEvOfExperiencer $e0 $e1 $x0))

;; [part-of]  p200728 ~ p200737   records 13 / 13 / 13 (8 distinct)   gate: PASS
;;   MI: 0.0503   Jaccard: 1.00   e.g. tierB-000063 tierB-000932 tierB-001867
;;   A: (And (Member $e0 build) (Patient $e0 $x0))
;;   B: (Member $e0 build)
;;   alignment: $e0=$e0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 build) (Patient $e0 $x0)) (MnBuild_Patient $e0 $x0))

;; [part-of]  p200322 ~ p200578   records 27 / 16 / 16 (15 distinct)   gate: PASS
;;   MI: 0.0484   Jaccard: 0.59   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Past $e0) (Result $e0 $e1))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 16 of 16 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; [part-of]  p200323 ~ p200578   records 27 / 16 / 16 (15 distinct)   gate: PASS
;;   MI: 0.0484   Jaccard: 0.59   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 16 of 16 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; [part-of]  p200416 ~ p200612   records 22 / 15 / 15 (15 distinct)   gate: PASS
;;   MI: 0.0481   Jaccard: 0.68   e.g. tierB-000025 tierB-000073 tierB-000269
;;   A: (Member $e0 make)
;;   B: (And (Member $e0 make) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 15 of 15 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 make) (Patient $e0 $x0)) (MnMake_Patient $e0 $x0))

;; [part-of]  p200785 ~ p200847   records 12 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0470   Jaccard: 1.00   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing_1 $e0 $e1))

;; [part-of]  p200422 ~ p200652   records 21 / 14 / 14 (14 distinct)   gate: PASS
;;   MI: 0.0451   Jaccard: 0.67   e.g. tierB-000043 tierB-000192 tierB-000199
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Past $e0))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Past $e0)) (MnStart_Past $e0))

;; [part-of]  p200535 ~ p200720   records 17 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0445   Jaccard: 0.76   e.g. tierB-000324 tierB-000387 tierB-000462
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0)) (MnAgent_Goal_Past $e0 $x0 $x1))

;; [part-of]  p200900 ~ p200935   records 11 / 11 / 11 (7 distinct)   gate: PASS
;;   MI: 0.0437   Jaccard: 1.00   e.g. tierB-000412 tierB-000688 tierB-001302
;;   A: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; [part-of]  p200662 ~ p200844   records 14 / 12 / 12 (8 distinct)   gate: PASS
;;   MI: 0.0434   Jaccard: 0.86   e.g. tierB-000412 tierB-000688 tierB-001134
;;   A: (Before $e0 $e1)
;;   B: (And (Before $e0 $e1) (Past $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Before $e0 $e1) (Past $e1)) (MnBeforeEvOfPast $e0 $e1))

;; [part-of]  p200844 ~ p200900   records 12 / 11 / 11 (7 distinct)   gate: PASS
;;   MI: 0.0416   Jaccard: 0.92   e.g. tierB-000412 tierB-000688 tierB-001302
;;   A: (And (Before $e0 $e1) (Past $e1))
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; [part-of]  p200846 ~ p200926   records 12 / 11 / 11 (11 distinct)   gate: PASS
;;   MI: 0.0416   Jaccard: 0.92   e.g. tierB-000162 tierB-000665 tierB-000730
;;   A: (And (Member $e0 have) (Past $e0))
;;   B: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 have) (Past $e0) (Theme $e0 $x0)) (MnHave_Past_Theme $e0 $x0))

;; [part-of]  p200662 ~ p200900   records 14 / 11 / 11 (7 distinct)   gate: PASS
;;   MI: 0.0392   Jaccard: 0.79   e.g. tierB-000412 tierB-000688 tierB-001302
;;   A: (Before $e0 $e1)
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; [part-of]  p200662 ~ p200935   records 14 / 11 / 11 (7 distinct)   gate: PASS
;;   MI: 0.0392   Jaccard: 0.79   e.g. tierB-000412 tierB-000688 tierB-001302
;;   A: (Before $e0 $e1)
;;   B: (And (Before $e0 $e1) (Past $e0))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Before $e0 $e1) (Past $e0)) (MnBeforeEv_Past $e0 $e1))

;; [part-of]  p200957 ~ p201066   records 11 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0382   Jaccard: 0.91   e.g. tierB-000005 tierB-000094 tierB-000128
;;   A: (Manner $e0 quickly)
;;   B: (And (Manner $e0 quickly) (Past $e0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Manner $e0 quickly) (Past $e0)) (MnMannerQuickly_Past $e0))

;; [part-of]  p200422 ~ p200785   records 21 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0380   Jaccard: 0.57   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing_1 $e0 $e1))

;; [part-of]  p200422 ~ p200847   records 21 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0380   Jaccard: 0.57   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Theme $e0 $e1)) (MnStart_ThemeEv $e0 $e1))

;; [part-of]  p200858 ~ p201067   records 12 / 10 / 10 (8 distinct)   gate: PASS
;;   MI: 0.0370   Jaccard: 0.83   e.g. tierB-000352 tierB-000740 tierB-001582
;;   A: (Member $e0 become)
;;   B: (And (Member $e0 become) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 2 of the shared records duplicate another
(Implication (And (Member $e0 become) (Patient $e0 $x0)) (MnBecome_Patient $e0 $x0))

;; [part-of]  p200859 ~ p201068   records 12 / 10 / 10 (9 distinct)   gate: PASS
;;   MI: 0.0370   Jaccard: 0.83   e.g. tierB-000075 tierB-000173 tierB-000182
;;   A: (Member $e0 begin)
;;   B: (And (Member $e0 begin) (Past $e0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Past $e0)) (MnBegin_Past $e0))

;; [part-of]  p201104 ~ p201168   records 9 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201104 ~ p201222   records 9 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201104 ~ p201245   records 9 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201105 ~ p201224   records 9 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201168 ~ p201245   records 9 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1)) (MnBegin_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201222 ~ p201245   records 9 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEv $e0 $e1))

;; [part-of]  p201223 ~ p201246   records 9 / 9 / 9 (6 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000063 tierB-000932 tierC-000045
;;   A: (And (Member $e0 build) (Past $e0) (Patient $e0 $x0))
;;   B: (And (Member $e0 build) (Past $e0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnBuild_Past_Patient $e0 $x0))

;; [part-of]  p201247 ~ p201269   records 9 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 1.00   e.g. tierB-000067 tierB-000393 tierB-000412
;;   A: (And (Member $e0 kill) (Patient $e0 $x0))
;;   B: (Member $e0 kill)
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 kill) (Patient $e0 $x0)) (MnKill_Patient $e0 $x0))

;; [part-of]  p200546 ~ p200937   records 17 / 11 / 11 (10 distinct)   gate: PASS
;;   MI: 0.0368   Jaccard: 0.65   e.g. tierB-000016 tierB-000392 tierB-000733
;;   A: (Instrument $e0 $x0)
;;   B: (And (Instrument $e0 $x0) (Patient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Instrument $e0 $x0) (Patient $e0 $x1)) (MnInstrument_Patient $e0 $x0 $x1))

;; [part-of]  p200380 ~ p200785   records 24 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0366   Jaccard: 0.50   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0)) (MnStart_ThemeEvOfOngoing_2 $e1 $e0))

;; [part-of]  p200493 ~ p200925   records 18 / 11 / 11 (10 distinct)   gate: PASS
;;   MI: 0.0362   Jaccard: 0.61   e.g. tierB-000034 tierB-000291 tierB-000383
;;   A: (And (Location $e0 $x0) (Patient $e0 $x1))
;;   B: (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnLocation_Past_Patient $e0 $x0 $x1))

;; [part-of]  p200740 ~ p201064   records 13 / 10 / 10 (7 distinct)   gate: PASS
;;   MI: 0.0359   Jaccard: 0.77   e.g. tierB-000762 tierB-000853 tierB-001130
;;   A: (Member $x0 company)
;;   B: (And (Agent $e0 $x0) (Member $x0 company))
;;   alignment: $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $x0 company)) (MnAgentOfCompany $e0 $x0))

;; [part-of]  p200663 ~ p201070   records 14 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0351   Jaccard: 0.71   e.g. tierB-000056 tierB-000425 tierB-000747
;;   A: (Member $x0 door)
;;   B: (And (Member $x0 door) (Patient $e0 $x0))
;;   alignment: $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $x0 door) (Patient $e0 $x0)) (MnPatientOfDoor $e0 $x0))

;; [part-of]  p201043 ~ p201102   records 10 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0349   Jaccard: 0.90   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; [part-of]  p201068 ~ p201104   records 10 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0349   Jaccard: 0.90   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Past $e0))
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201068 ~ p201222   records 10 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0349   Jaccard: 0.90   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (And (Member $e0 begin) (Past $e0))
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEv $e0 $e1))

;; [part-of]  p200586 ~ p201069   records 16 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0337   Jaccard: 0.62   e.g. tierB-000012 tierB-000115 tierB-000204
;;   A: (Member $e0 go)
;;   B: (And (Member $e0 go) (Past $e0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 go) (Past $e0)) (MnGo_Past $e0))

;; [part-of]  p200899 ~ p201103   records 11 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0336   Jaccard: 0.82   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEvOfOngoing $e0 $e1 $x0))

;; [part-of]  p201446 ~ p201478   records 8 / 8 / 8 (5 distinct)   gate: PASS
;;   MI: 0.0334   Jaccard: 1.00   e.g. tierB-000063 tierB-001867 tierC-000045
;;   A: (And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 build))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1)) (MnAgent_Build_Patient $e0 $x0 $x1))

;; [part-of]  p200380 ~ p200899   records 24 / 11 / 11 (10 distinct)   gate: PASS
;;   MI: 0.0333   Jaccard: 0.46   e.g. tierB-000485 tierB-000738 tierB-000930
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Agent $e1 $x0) (Ongoing $e0) (Theme $e1 $e0)) (MnAgent_ThemeEvOfOngoing_2 $e1 $e0 $x0))

;; [part-of]  p200546 ~ p201065   records 17 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0331   Jaccard: 0.59   e.g. tierB-000222 tierB-000392 tierB-000444
;;   A: (Instrument $e0 $x0)
;;   B: (And (Instrument $e0 $x0) (Past $e0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Instrument $e0 $x0) (Past $e0)) (MnInstrument_Past $e0 $x0))

;; [part-of]  p200785 ~ p201105   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0327   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200847 ~ p201105   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0327   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200847 ~ p201224   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0327   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEv $e0 $e1))

;; [part-of]  p200859 ~ p201104   records 12 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0327   Jaccard: 0.75   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (Member $e0 begin)
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200859 ~ p201168   records 12 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0327   Jaccard: 0.75   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (Member $e0 begin)
;;   B: (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1)) (MnBegin_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200859 ~ p201222   records 12 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0327   Jaccard: 0.75   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (Member $e0 begin)
;;   B: (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEv $e0 $e1))

;; [part-of]  p200859 ~ p201245   records 12 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0327   Jaccard: 0.75   e.g. tierB-000075 tierB-000173 tierB-000240
;;   A: (Member $e0 begin)
;;   B: (And (Member $e0 begin) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Theme $e0 $e1)) (MnBegin_ThemeEv $e0 $e1))

;; [part-of]  p200320 ~ p200899   records 27 / 11 / 11 (10 distinct)   gate: PASS
;;   MI: 0.0323   Jaccard: 0.41   e.g. tierB-000485 tierB-000738 tierB-000930
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfOngoing_1 $e0 $e1 $x0))

;; [part-of]  p200728 ~ p201223   records 13 / 9 / 9 (6 distinct)   gate: PASS
;;   MI: 0.0319   Jaccard: 0.69   e.g. tierB-000063 tierB-000932 tierC-000045
;;   A: (And (Member $e0 build) (Patient $e0 $x0))
;;   B: (And (Member $e0 build) (Past $e0) (Patient $e0 $x0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnBuild_Past_Patient $e0 $x0))

;; [part-of]  p200737 ~ p201223   records 13 / 9 / 9 (6 distinct)   gate: PASS
;;   MI: 0.0319   Jaccard: 0.69   e.g. tierB-000063 tierB-000932 tierC-000045
;;   A: (Member $e0 build)
;;   B: (And (Member $e0 build) (Past $e0) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnBuild_Past_Patient $e0 $x0))

;; [part-of]  p200737 ~ p201246   records 13 / 9 / 9 (6 distinct)   gate: PASS
;;   MI: 0.0319   Jaccard: 0.69   e.g. tierB-000063 tierB-000932 tierC-000045
;;   A: (Member $e0 build)
;;   B: (And (Member $e0 build) (Past $e0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 build) (Past $e0)) (MnBuild_Past $e0))

;; [part-of]  p201240 ~ p201344   records 9 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0314   Jaccard: 0.89   e.g. tierB-000248 tierB-000258 tierB-000548
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0)) (MnAgentOfGroupOfPerson_Past $e0 $x0))

;; [part-of]  p201266 ~ p201476   records 9 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0314   Jaccard: 0.89   e.g. tierB-000147 tierB-000337 tierB-000588
;;   A: (Again $e0)
;;   B: (And (Again $e0) (Past $e0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack
(Implication (And (Again $e0) (Past $e0)) (MnAgain_Past $e0))

;; [part-of]  p201268 ~ p201490   records 9 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0314   Jaccard: 0.89   e.g. tierB-000176 tierB-000189 tierB-000421
;;   A: (Member $e0 hear)
;;   B: (And (Member $e0 hear) (Past $e0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 hear) (Past $e0)) (MnHear_Past $e0))

;; [part-of]  p201272 ~ p201491   records 9 / 8 / 8 (5 distinct)   gate: PASS
;;   MI: 0.0314   Jaccard: 0.89   e.g. tierB-000208 tierB-001995 tierC-000009
;;   A: (Member $e0 produce)
;;   B: (And (Member $e0 produce) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 produce) (Patient $e0 $x0)) (MnProduce_Patient $e0 $x0))

;; [part-of]  p200652 ~ p201105   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0312   Jaccard: 0.64   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Past $e0))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200652 ~ p201224   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0312   Jaccard: 0.64   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Past $e0))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEv $e0 $e1))

;; [part-of]  p200613 ~ p201220   records 15 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0306   Jaccard: 0.60   e.g. tierB-000520 tierB-000713 tierB-000784
;;   A: (And (Ongoing $e0) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x1) (Ongoing $e0) (Theme $e0 $x0)) (MnAgent_Ongoing_Theme $e0 $x0 $x1))

;; [part-of]  p201086 ~ p201485   records 10 / 8 / 8 (5 distinct)   gate: PASS
;;   MI: 0.0303   Jaccard: 0.80   e.g. tierB-000579 tierB-000706 tierC-000243
;;   A: (Member $e0 find)
;;   B: (And (Location $e0 $x0) (Member $e0 find))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Location $e0 $x0) (Member $e0 find)) (MnLocation_Find $e0 $x0))

;; [part-of]  p201089 ~ p201495   records 10 / 8 / 8 (5 distinct)   gate: PASS
;;   MI: 0.0303   Jaccard: 0.80   e.g. tierB-001601 tierB-001962 tierC-000089
;;   A: (Member $e0 write)
;;   B: (And (Member $e0 write) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 write) (Patient $e0 $x0)) (MnWrite_Patient $e0 $x0))

;; [part-of]  p200379 ~ p201043   records 24 / 10 / 10 (9 distinct)   gate: PASS
;;   MI: 0.0301   Jaccard: 0.42   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0)) (MnThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; [part-of]  p200380 ~ p201043   records 24 / 10 / 10 (9 distinct)   gate: PASS
;;   MI: 0.0301   Jaccard: 0.42   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0)) (MnThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; [part-of]  p200582 ~ p201169   records 16 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0300   Jaccard: 0.56   e.g. tierB-000265 tierB-000858 tierB-000942
;;   A: (And (Patient $e0 $x0) (Theme $e1 $e0))
;;   B: (And (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0)) (MnPast_ThemeEvOfPatient $e1 $e0 $x0))

;; [part-of]  p200582 ~ p201225   records 16 / 9 / 9 (8 distinct)   gate: PASS
;;   MI: 0.0300   Jaccard: 0.56   e.g. tierB-000265 tierB-000930 tierB-000942
;;   A: (And (Patient $e0 $x0) (Theme $e1 $e0))
;;   B: (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfOngoing-Patient $e1 $e0 $x0))

;; [part-of]  p201674 ~ p201814   records 7 / 7 / 7 (6 distinct)   gate: PASS
;;   MI: 0.0298   Jaccard: 1.00   e.g. tierB-000320 tierB-000779 tierB-000838
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))
;;   B: (And (Cardinality $x0 <num>) (Patient $e0 $x0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfCardinalityNum $e0 $x0))

;; [part-of]  p201772 ~ p201824   records 7 / 7 / 7 (6 distinct)   gate: PASS
;;   MI: 0.0298   Jaccard: 1.00   e.g. tierB-000067 tierB-000412 tierB-001197
;;   A: (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))
;;   B: (And (Member $e0 kill) (Past $e0))
;;   alignment: $e0=$e0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 1 of the shared records duplicate another
(Implication (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0)) (MnKill_Past_Patient $e0 $x0))

;; [part-of]  p201773 ~ p201828   records 7 / 7 / 7 (4 distinct)   gate: PASS
;;   MI: 0.0298   Jaccard: 1.00   e.g. tierB-000208 tierC-000009 tierC-000010
;;   A: (And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))
;;   B: (And (Member $e0 produce) (Past $e0))
;;   alignment: $e0=$e0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 produce) (Past $e0) (Patient $e0 $x0)) (MnProduce_Past_Patient $e0 $x0))

;; [part-of]  p201774 ~ p201831   records 7 / 7 / 7 (4 distinct)   gate: PASS
;;   MI: 0.0298   Jaccard: 1.00   e.g. tierB-001962 tierC-000089 tierC-000090
;;   A: (And (Member $e0 write) (Past $e0) (Patient $e0 $x0))
;;   B: (And (Member $e0 write) (Past $e0))
;;   alignment: $e0=$e0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 write) (Past $e0) (Patient $e0 $x0)) (MnWrite_Past_Patient $e0 $x0))

;; [part-of]  p201834 ~ p201881   records 7 / 7 / 7 (7 distinct)   gate: PASS
;;   MI: 0.0298   Jaccard: 1.00   e.g. tierB-000500 tierB-000656 tierB-000782
;;   A: (And (Past $e0) (Through $e0 $x0))
;;   B: (Through $e0 $x0)
;;   alignment: $e0=$e0 $x0=$x0 (holds in 7 of 7 records)   B is part of A: the rule is A's own pack
(Implication (And (Past $e0) (Through $e0 $x0)) (MnPast_Through $e0 $x0))
