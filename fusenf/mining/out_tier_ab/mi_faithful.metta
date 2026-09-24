;; FUSE-NF §4.3.3 Mutual-Information Grouping — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion, and the Implication is the
;; pack rule the pair WOULD become (naming provisional; the candidate stage fixes the pack vocabulary and the
;; gauntlet decides). The record of truth is
;;   mi_faithful.jsonl          (every pair at the recording floor: statistics, verdict, alignment, rule)
;;   patterns2_faithful.jsonl   (the units and their supporting records = the binary matrix)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   features                       the 2125 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees)
;;   matrix                         binary presence, 2352 records x 2125 units, from each unit's supporting ids (635 records carry no unit and are all-zero rows); 2256750 pairs, 48442 with any co-occurrence
;;   MI                             exact pairwise mutual information of the two binary presence variables, in bits, raw
;;   'very high MI'                 raw MI >= 0.0293 bits = the MI of a perfect co-occurrence over 7 of the 2352 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 2256750 pairs is ~0.0054 bits); near-miss value 0.0219 (= 5 records); pairs recorded from 0.0141 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01]
;;   'moderate individual support'  both units' support <= 35 records = the 97th percentile of unit support (1.5% of the records; percentiles 50/90/95/99 = 4/9/13/46); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself
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

;; ==================== PASSES: 207 pairs — 58 genuine first, then 149 part-of ====================

;; [genuine]  p200341 ~ p200379   records 23 / 22 / 22 (22 distinct)   gate: PASS
;;   MI: 0.0740   Jaccard: 0.96   e.g. tierB-000004 tierB-000362 tierB-000370
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))
;;   B: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 22 of 22 records)
(Implication (And (Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Patient_ResultEv $e0 $e1 $x0))

;; [genuine]  p200231 ~ p200342   records 31 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0685   Jaccard: 0.74   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 23 of 23 records)
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200217 ~ p200342   records 33 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0669   Jaccard: 0.70   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Member $e0 have) (Theme $e0 $x0))
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   alignment: $e0=$e0 (holds in 23 of 23 records)
(Implication (And (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0)) (MnHolder_Have_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200436 ~ p200467   records 18 / 17 / 17 (7 distinct)   gate: PASS
;;   MI: 0.0594   Jaccard: 0.94   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))
;;   B: (And (Member $e0 buy) (Past $e0))
;;   alignment: $e0=$e0 (holds in 17 of 17 records)   10 of the shared records duplicate another
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))

;; [genuine]  p200217 ~ p200231   records 33 / 31 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0561   Jaccard: 0.56   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Member $e0 have) (Theme $e0 $x0))
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 23 of 23 records)
(Implication (And (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0)) (MnHolder_Have_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200200 ~ p200231   records 35 / 31 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0547   Jaccard: 0.53   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (Member $e0 have)
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 23 of 23 records)
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200204 ~ p200217   records 34 / 33 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0538   Jaccard: 0.52   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (Holder $e0 $x0)
;;   B: (And (Member $e0 have) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 23 of 23 records)
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200583 ~ p200584   records 14 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0526   Jaccard: 1.00   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 14 of 14 records)   10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200200 ~ p200204   records 35 / 34 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0524   Jaccard: 0.50   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (Member $e0 have)
;;   B: (Holder $e0 $x0)
;;   alignment: $e0=$e0 (holds in 23 of 23 records)
(Implication (And (Holder $e0 $x0) (Member $e0 have)) (MnHolder_Have $e0 $x0))

;; [genuine]  p200461 ~ p200583   records 17 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0477   Jaccard: 0.82   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   10 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnAgent_Buy_Past_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200461 ~ p200584   records 17 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0477   Jaccard: 0.82   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 14 of 14 records)   10 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnAgent_Buy_Past_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200461 ~ p200591   records 17 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0477   Jaccard: 0.82   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   10 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnAgent_Buy_Past_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200467 ~ p200584   records 17 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0477   Jaccard: 0.82   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Past $e0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200467 ~ p200591   records 17 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0477   Jaccard: 0.82   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Past $e0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnAgent_Buy_Past $e0 $x0))

;; [genuine]  p200436 ~ p200583   records 18 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0467   Jaccard: 0.78   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   10 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnAgent_Buy_Past_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200436 ~ p200591   records 18 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0467   Jaccard: 0.78   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   10 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 buy) (Theme $e0 $x0)) (MnAgent_Buy_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200761 ~ p200762   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [genuine]  p200761 ~ p200764   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [genuine]  p200762 ~ p200764   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x1=$x1 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Give_Recipient_Theme_2 $e0 $x0 $x1 $x2))

;; [genuine]  p200764 ~ p200778   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x2) (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnAgent_Give_Recipient_Theme_5 $e0 $x0 $x1 $x2))

;; [genuine]  p200639 ~ p200765   records 13 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 12 records)
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Past_Patient_ResultEv_1 $e0 $e1 $x0))

;; [genuine]  p200672 ~ p200762   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_3 $e0 $x0 $x1 $x2))

;; [genuine]  p200672 ~ p200778   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) (MnAgent_Give_Recipient_2 $e0 $x0 $x1))

;; [genuine]  p200673 ~ p200761   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x2) (Theme $e0 $x0)) (MnAgent_Give_Recipient_Theme_4 $e0 $x0 $x1 $x2))

;; [genuine]  p200673 ~ p200778   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 give) (Theme $e0 $x0)) (MnAgent_Give_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200672 ~ p200673   records 13 / 13 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0419   Jaccard: 0.86   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200389 ~ p200596   records 21 / 14 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0386   Jaccard: 0.59   e.g. tierA-000108 tierA-000112 tierA-000122
;;   A: (And (Agent $e0 $x0) (Might $e0))
;;   B: (And (Might $e0) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 13 of 13 records)
(Implication (And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1)) (MnAgent_Might_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200846 ~ p200933   records 11 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0376   Jaccard: 0.91   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Member $e0 answer) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 answer))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   7 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 answer) (Theme $e0 $x0)) (MnAgent_Answer_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200378 ~ p200782   records 22 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 0.55   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 12 of 12 records)
(Implication (And (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0)) (MnStart_ThemeEvOfOngoing_2 $e1 $e0))

;; [genuine]  p200341 ~ p200765   records 23 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0364   Jaccard: 0.52   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 12 records)
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0)) (MnExperiencer_Past_Patient_ResultEv_1 $e0 $e1 $x0))

;; [genuine]  p201079 ~ p201086   records 9 / 9 / 9 (4 distinct)   gate: PASS
;;   MI: 0.0362   Jaccard: 1.00   e.g. tierA-000133 tierA-000135 tierA-000136
;;   A: (And (Agent $e0 $x0) (Member $e0 discover))
;;   B: (And (Member $e0 discover) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1)) (MnAgent_Discover_Theme $e0 $x0 $x1))

;; [genuine]  p200319 ~ p200761   records 24 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0360   Jaccard: 0.50   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [genuine]  p200319 ~ p200762   records 24 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0360   Jaccard: 0.50   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x2=$x1 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [genuine]  p200319 ~ p200764   records 24 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0360   Jaccard: 0.50   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x1=$x0 $x2=$x1 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [genuine]  p200319 ~ p200778   records 24 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0360   Jaccard: 0.50   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [genuine]  p200844 ~ p200848   records 11 / 11 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0355   Jaccard: 0.83   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (And (Agent $e0 $x0) (Member $e0 teach))
;;   B: (And (Member $e0 teach) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_Teach_Recipient_1 $e0 $x0 $x1))

;; [genuine]  p200671 ~ p200935   records 13 / 10 / 10 (5 distinct)   gate: PASS
;;   MI: 0.0353   Jaccard: 0.77   e.g. tierA-000222 tierA-000224 tierA-000226
;;   A: (And (Member $e0 destroy) (Patient $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 destroy))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   5 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 destroy) (Patient $e0 $x0)) (MnAgent_Destroy_Patient_2 $e0 $x0 $x1))

;; [genuine]  p200490 ~ p200500   records 16 / 16 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0352   Jaccard: 0.60   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 10 of 12 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e1) (Theme $e1 $e0)) (MnAgent_Agent_Past_ThemeEv $e0 $e1 $x0))

;; [genuine]  p200379 ~ p200639   records 22 / 13 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0347   Jaccard: 0.52   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   B: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 12 records)
(Implication (And (Experiencer $e1 $x0) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnExperiencer_Past_Patient_ResultEv_2 $e0 $e1 $x0))

;; [genuine]  p200934 ~ p201085   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0342   Jaccard: 0.90   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (And (Agent $e0 $x0) (Member $e0 decide))
;;   B: (And (Member $e0 decide) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)) (MnAgent_Decide_Theme $e0 $x0 $x1))

;; [genuine]  p200941 ~ p201080   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0342   Jaccard: 0.90   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (And (Member $e0 lend) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 lend))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 lend) (Theme $e0 $x0)) (MnAgent_Lend_Theme_2 $e0 $x0 $x1))

;; [genuine]  p200319 ~ p200672   records 24 / 13 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0338   Jaccard: 0.48   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [genuine]  p200319 ~ p200673   records 24 / 13 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0338   Jaccard: 0.48   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x2=$x0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [genuine]  p200240 ~ p200761   records 30 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0338   Jaccard: 0.40   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x2) (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnAgent_Give_Recipient_Theme_5 $e0 $x0 $x1 $x2))

;; [genuine]  p200240 ~ p200762   records 30 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0338   Jaccard: 0.40   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x1=$x1 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x2) (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnAgent_Give_Recipient_Theme_5 $e0 $x0 $x1 $x2))

;; [genuine]  p200240 ~ p200778   records 30 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0338   Jaccard: 0.40   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x2) (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnAgent_Give_Recipient_Theme_5 $e0 $x0 $x1 $x2))

;; [genuine]  p201246 ~ p201258   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon))
;;   B: (And (Member $e0 abandon) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Abandon_Theme $e0 $x0 $x1))

;; [genuine]  p201248 ~ p201261   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject))
;;   B: (And (Member $e0 reject) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Reject_Theme $e0 $x0 $x1))

;; [genuine]  p200319 ~ p200604   records 24 / 14 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0325   Jaccard: 0.46   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (Member $e0 give)
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [genuine]  p200404 ~ p200500   records 20 / 16 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0324   Jaccard: 0.50   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 10 of 12 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e1) (Theme $e1 $e0)) (MnAgent_Agent_Past_ThemeEv $e0 $e1 $x0))

;; [genuine]  p200733 ~ p201065   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0321   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [genuine]  p200240 ~ p200672   records 30 / 13 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0316   Jaccard: 0.39   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200240 ~ p200673   records 30 / 13 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0316   Jaccard: 0.39   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200216 ~ p200404   records 33 / 20 / 14 (14 distinct)   gate: PASS
;;   MI: 0.0313   Jaccard: 0.36   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 12 of 14 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e1)) (MnAgent_Agent_ThemeEv $e0 $e1 $x0))

;; [genuine]  p201016 ~ p201221   records 9 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0309   Jaccard: 0.89   e.g. tierB-000485 tierB-000738 tierB-000942
;;   A: (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 $x0=$x0 (holds in 8 of 8 records)
(Implication (And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_Agent_Ongoing_ThemeEv $e0 $e1 $x0))

;; [genuine]  p201088 ~ p201249   records 9 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0309   Jaccard: 0.89   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 repair))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   5 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 repair) (Patient $e0 $x0)) (MnAgent_Repair_Patient_2 $e0 $x0 $x1))

;; [genuine]  p200240 ~ p200604   records 30 / 14 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0303   Jaccard: 0.38   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (Member $e0 give)
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme_1 $e0 $x0 $x1))

;; [genuine]  p200341 ~ p200343   records 23 / 23 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0301   Jaccard: 0.39   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))
;;   B: (And (Past $e0) (Result $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 13 of 13 records)
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer_1 $e1 $e0 $x0))

;; [part-of]  p200200 ~ p200217   records 35 / 33 / 33 (33 distinct)   gate: PASS
;;   MI: 0.1018   Jaccard: 0.94   e.g. tierB-000066 tierB-000142 tierB-000162
;;   A: (Member $e0 have)
;;   B: (And (Member $e0 have) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 33 of 33 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 have) (Theme $e0 $x0)) (MnHave_Theme $e0 $x0))

;; [part-of]  p200204 ~ p200231   records 34 / 31 / 31 (25 distinct)   gate: PASS
;;   MI: 0.0950   Jaccard: 0.91   e.g. tierA-000085 tierA-000086 tierA-000087
;;   A: (Holder $e0 $x0)
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 31 of 31 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Holder $e0 $x0) (Theme $e0 $x1)) (MnHolder_Theme $e0 $x0 $x1))

;; [part-of]  p200338 ~ p200342   records 23 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0793   Jaccard: 1.00   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200240 ~ p200319   records 30 / 24 / 24 (10 distinct)   gate: PASS
;;   MI: 0.0729   Jaccard: 0.80   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   alignment: $e0=$e0 $x0=$x1 $x1=$x2 (holds in 24 of 24 records)   B is part of A: the rule is A's own pack; 14 of the shared records duplicate another
(Implication (And (Agent $e0 $x2) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnAgent_Recipient_Theme $e0 $x0 $x1 $x2))

;; [part-of]  p200231 ~ p200338   records 31 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0685   Jaccard: 0.74   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200217 ~ p200338   records 33 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0669   Jaccard: 0.70   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (And (Member $e0 have) (Theme $e0 $x0))
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0)) (MnHolder_Have_Theme_2 $e0 $x0 $x1))

;; [part-of]  p200204 ~ p200338   records 34 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0662   Jaccard: 0.68   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (Holder $e0 $x0)
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200204 ~ p200342   records 34 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0662   Jaccard: 0.68   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (Holder $e0 $x0)
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have)) (MnHolder_Have $e0 $x0))

;; [part-of]  p200200 ~ p200338   records 35 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0655   Jaccard: 0.66   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (Member $e0 have)
;;   B: (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200200 ~ p200342   records 35 / 23 / 23 (23 distinct)   gate: PASS
;;   MI: 0.0655   Jaccard: 0.66   e.g. tierB-000142 tierB-000408 tierB-000492
;;   A: (Member $e0 have)
;;   B: (And (Holder $e0 $x0) (Member $e0 have))
;;   alignment: $e0=$e0 (holds in 23 of 23 records)   B is part of A: the rule is A's own pack
(Implication (And (Holder $e0 $x0) (Member $e0 have)) (MnHolder_Have $e0 $x0))

;; [part-of]  p200436 ~ p200441   records 18 / 18 / 18 (8 distinct)   gate: PASS
;;   MI: 0.0648   Jaccard: 1.00   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))
;;   B: (Member $e0 buy)
;;   alignment: $e0=$e0 (holds in 18 of 18 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnBuy_Theme $e0 $x0))

;; [part-of]  p200461 ~ p200467   records 17 / 17 / 17 (7 distinct)   gate: PASS
;;   MI: 0.0618   Jaccard: 1.00   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   B: (And (Member $e0 buy) (Past $e0))
;;   alignment: $e0=$e0 (holds in 17 of 17 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))

;; [part-of]  p200224 ~ p200389   records 32 / 21 / 21 (21 distinct)   gate: PASS
;;   MI: 0.0610   Jaccard: 0.66   e.g. tierA-000075 tierA-000078 tierA-000108
;;   A: (Might $e0)
;;   B: (And (Agent $e0 $x0) (Might $e0))
;;   alignment: $e0=$e0 (holds in 21 of 21 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Might $e0)) (MnAgent_Might $e0 $x0))

;; [part-of]  p200436 ~ p200461   records 18 / 17 / 17 (7 distinct)   gate: PASS
;;   MI: 0.0594   Jaccard: 0.94   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))
;;   B: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 17 of 17 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))

;; [part-of]  p200441 ~ p200461   records 18 / 17 / 17 (7 distinct)   gate: PASS
;;   MI: 0.0594   Jaccard: 0.94   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (Member $e0 buy)
;;   B: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 17 of 17 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))

;; [part-of]  p200441 ~ p200467   records 18 / 17 / 17 (7 distinct)   gate: PASS
;;   MI: 0.0594   Jaccard: 0.94   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (Member $e0 buy)
;;   B: (And (Member $e0 buy) (Past $e0))
;;   alignment: $e0=$e0 (holds in 17 of 17 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Member $e0 buy) (Past $e0)) (MnBuy_Past $e0))

;; [part-of]  p200378 ~ p200453   records 22 / 17 / 17 (17 distinct)   gate: PASS
;;   MI: 0.0546   Jaccard: 0.77   e.g. tierB-000075 tierB-000173 tierB-000199
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 17 of 17 records)   B is part of A: the rule is A's own pack
(Implication (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing $e1 $e0))

;; [part-of]  p200404 ~ p200490   records 20 / 16 / 16 (16 distinct)   gate: PASS
;;   MI: 0.0526   Jaccard: 0.80   e.g. tierB-000166 tierB-000339 tierB-000410
;;   A: (And (Agent $e0 $x0) (Theme $e1 $e0))
;;   B: (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 16 of 16 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent $e1 $e0 $x0))

;; [part-of]  p200579 ~ p200583   records 14 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0526   Jaccard: 1.00   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200579 ~ p200584   records 14 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0526   Jaccard: 1.00   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200579 ~ p200591   records 14 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0526   Jaccard: 1.00   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200583 ~ p200591   records 14 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0526   Jaccard: 1.00   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnAgent_Buy_Past $e0 $x0))

;; [part-of]  p200584 ~ p200591   records 14 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0526   Jaccard: 1.00   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Buy_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200671 ~ p200683   records 13 / 13 / 13 (5 distinct)   gate: PASS
;;   MI: 0.0494   Jaccard: 1.00   e.g. tierA-000222 tierA-000223 tierA-000224
;;   A: (And (Member $e0 destroy) (Patient $e0 $x0))
;;   B: (Member $e0 destroy)
;;   alignment: $e0=$e0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack; 8 of the shared records duplicate another
(Implication (And (Member $e0 destroy) (Patient $e0 $x0)) (MnDestroy_Patient $e0 $x0))

;; [part-of]  p200461 ~ p200579   records 17 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0477   Jaccard: 0.82   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnAgent_Buy_Past_Theme_2 $e0 $x0 $x1))

;; [part-of]  p200467 ~ p200579   records 17 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0477   Jaccard: 0.82   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Past $e0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200467 ~ p200583   records 17 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0477   Jaccard: 0.82   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Past $e0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnAgent_Buy_Past $e0 $x0))

;; [part-of]  p200596 ~ p200663   records 14 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0472   Jaccard: 0.93   e.g. tierA-000108 tierA-000112 tierA-000122
;;   A: (And (Might $e0) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x1) (Might $e0) (Theme $e0 $x0)) (MnAgent_Might_Theme_2 $e0 $x0 $x1))

;; [part-of]  p200604 ~ p200672   records 14 / 13 / 13 (7 distinct)   gate: PASS
;;   MI: 0.0472   Jaccard: 0.93   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (Member $e0 give)
;;   B: (And (Member $e0 give) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0)) (MnGive_Recipient $e0 $x0))

;; [part-of]  p200604 ~ p200673   records 14 / 13 / 13 (7 distinct)   gate: PASS
;;   MI: 0.0472   Jaccard: 0.93   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (Member $e0 give)
;;   B: (And (Member $e0 give) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Theme $e0 $x0)) (MnGive_Theme $e0 $x0))

;; [part-of]  p200436 ~ p200579   records 18 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0467   Jaccard: 0.78   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnAgent_Buy_Past_Theme_2 $e0 $x0 $x1))

;; [part-of]  p200436 ~ p200584   records 18 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0467   Jaccard: 0.78   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 buy) (Theme $e0 $x0)) (MnAgent_Buy_Theme_2 $e0 $x0 $x1))

;; [part-of]  p200441 ~ p200579   records 18 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0467   Jaccard: 0.78   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (Member $e0 buy)
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200441 ~ p200583   records 18 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0467   Jaccard: 0.78   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (Member $e0 buy)
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnAgent_Buy_Past $e0 $x0))

;; [part-of]  p200441 ~ p200584   records 18 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0467   Jaccard: 0.78   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (Member $e0 buy)
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Buy_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200441 ~ p200591   records 18 / 14 / 14 (4 distinct)   gate: PASS
;;   MI: 0.0467   Jaccard: 0.78   e.g. tierA-000001 tierA-000005 tierA-000006
;;   A: (Member $e0 buy)
;;   B: (And (Agent $e0 $x0) (Member $e0 buy))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 10 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 buy)) (MnAgent_Buy $e0 $x0))

;; [part-of]  p200733 ~ p200782   records 12 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing_1 $e0 $e1))

;; [part-of]  p200757 ~ p200761   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [part-of]  p200757 ~ p200762   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x2=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [part-of]  p200757 ~ p200764   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x1=$x0 $x2=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [part-of]  p200757 ~ p200778   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [part-of]  p200761 ~ p200778   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1)) (MnAgent_Give_Recipient_1 $e0 $x0 $x1))

;; [part-of]  p200762 ~ p200778   records 12 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0462   Jaccard: 1.00   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1)) (MnAgent_Give_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200296 ~ p200543   records 26 / 15 / 15 (15 distinct)   gate: PASS
;;   MI: 0.0448   Jaccard: 0.58   e.g. tierB-000025 tierB-000073 tierB-000269
;;   A: (Member $e0 make)
;;   B: (And (Member $e0 make) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 15 of 15 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 make) (Patient $e0 $x0)) (MnMake_Patient $e0 $x0))

;; [part-of]  p200216 ~ p200500   records 33 / 16 / 16 (16 distinct)   gate: PASS
;;   MI: 0.0447   Jaccard: 0.48   e.g. tierB-000470 tierB-000485 tierB-000738
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))
;;   B: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 16 of 16 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEv $e0 $e1 $x0))

;; [part-of]  p200672 ~ p200757   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_3 $e0 $x0 $x1 $x2))

;; [part-of]  p200672 ~ p200761   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) (MnAgent_Give_Recipient_2 $e0 $x0 $x1))

;; [part-of]  p200672 ~ p200764   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200673 ~ p200757   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   alignment: $e0=$e0 $x0=$x2 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x2) (Theme $e0 $x0)) (MnAgent_Give_Recipient_Theme_4 $e0 $x0 $x1 $x2))

;; [part-of]  p200673 ~ p200762   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 give) (Theme $e0 $x0)) (MnAgent_Give_Theme_2 $e0 $x0 $x1))

;; [part-of]  p200673 ~ p200764   records 13 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0440   Jaccard: 0.92   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Member $e0 give) (Theme $e0 $x0))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnGive_Recipient_Theme_2 $e0 $x0 $x1))

;; [part-of]  p200345 ~ p200595   records 23 / 14 / 14 (14 distinct)   gate: PASS
;;   MI: 0.0431   Jaccard: 0.61   e.g. tierB-000043 tierB-000192 tierB-000199
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Past $e0))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Past $e0)) (MnStart_Past $e0))

;; [part-of]  p200846 ~ p200864   records 11 / 11 / 11 (4 distinct)   gate: PASS
;;   MI: 0.0429   Jaccard: 1.00   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Member $e0 answer) (Theme $e0 $x0))
;;   B: (Member $e0 answer)
;;   alignment: $e0=$e0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Member $e0 answer) (Theme $e0 $x0)) (MnAnswer_Theme $e0 $x0))

;; [part-of]  p200604 ~ p200757   records 14 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0427   Jaccard: 0.86   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (Member $e0 give)
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [part-of]  p200604 ~ p200761   records 14 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0427   Jaccard: 0.86   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (Member $e0 give)
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1)) (MnAgent_Give_Recipient_1 $e0 $x0 $x1))

;; [part-of]  p200604 ~ p200762   records 14 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0427   Jaccard: 0.86   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (Member $e0 give)
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1)) (MnAgent_Give_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200604 ~ p200764   records 14 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0427   Jaccard: 0.86   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (Member $e0 give)
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200604 ~ p200778   records 14 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0427   Jaccard: 0.86   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (Member $e0 give)
;;   B: (And (Agent $e0 $x0) (Member $e0 give))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give)) (MnAgent_Give $e0 $x0))

;; [part-of]  p200418 ~ p200662   records 19 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0421   Jaccard: 0.68   e.g. tierB-000324 tierB-000387 tierB-000462
;;   A: (And (Agent $e0 $x0) (Goal $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0)) (MnAgent_Goal_Past $e0 $x0 $x1))

;; [part-of]  p200305 ~ p200566   records 25 / 14 / 14 (10 distinct)   gate: PASS
;;   MI: 0.0420   Jaccard: 0.56   e.g. tierA-000001 tierA-000002 tierA-000003
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack; 4 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnAgent_ThemeOfCardinalityNum $e0 $x0 $x1))

;; [part-of]  p200389 ~ p200663   records 21 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0408   Jaccard: 0.62   e.g. tierA-000108 tierA-000112 tierA-000122
;;   A: (And (Agent $e0 $x0) (Might $e0))
;;   B: (And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1)) (MnAgent_Might_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200798 ~ p200844   records 12 / 11 / 11 (4 distinct)   gate: PASS
;;   MI: 0.0408   Jaccard: 0.92   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (Member $e0 teach)
;;   B: (And (Agent $e0 $x0) (Member $e0 teach))
;;   alignment: $e0=$e0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 teach)) (MnAgent_Teach $e0 $x0))

;; [part-of]  p200798 ~ p200848   records 12 / 11 / 11 (4 distinct)   gate: PASS
;;   MI: 0.0408   Jaccard: 0.92   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (Member $e0 teach)
;;   B: (And (Member $e0 teach) (Recipient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Member $e0 teach) (Recipient $e0 $x0)) (MnTeach_Recipient $e0 $x0))

;; [part-of]  p200341 ~ p200639   records 23 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0397   Jaccard: 0.57   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Experiencer $e0 $x0) (Result $e1 $e0))
;;   B: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer_1 $e1 $e0 $x0))

;; [part-of]  p200343 ~ p200639   records 23 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0397   Jaccard: 0.57   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Past $e0) (Result $e0 $e1))
;;   B: (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Experiencer $e1 $x0) (Past $e0) (Result $e0 $e1)) (MnPast_ResultEvOfExperiencer_2 $e0 $e1 $x0))

;; [part-of]  p200345 ~ p200674   records 23 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0397   Jaccard: 0.57   e.g. tierA-000053 tierA-000058 tierA-000063
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Patient $e0 $x0)) (MnStart_Patient $e0 $x0))

;; [part-of]  p200925 ~ p200933   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0396   Jaccard: 1.00   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 answer))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)) (MnAgent_Answer_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200926 ~ p200935   records 10 / 10 / 10 (5 distinct)   gate: PASS
;;   MI: 0.0396   Jaccard: 1.00   e.g. tierA-000222 tierA-000224 tierA-000226
;;   A: (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 destroy))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1)) (MnAgent_Destroy_Patient_1 $e0 $x0 $x1))

;; [part-of]  p200941 ~ p200954   records 10 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0396   Jaccard: 1.00   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (And (Member $e0 lend) (Theme $e0 $x0))
;;   B: (Member $e0 lend)
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Member $e0 lend) (Theme $e0 $x0)) (MnLend_Theme $e0 $x0))

;; [part-of]  p200224 ~ p200596   records 32 / 14 / 14 (14 distinct)   gate: PASS
;;   MI: 0.0391   Jaccard: 0.44   e.g. tierA-000087 tierA-000108 tierA-000112
;;   A: (Might $e0)
;;   B: (And (Might $e0) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 14 of 14 records)   B is part of A: the rule is A's own pack
(Implication (And (Might $e0) (Theme $e0 $x0)) (MnMight_Theme $e0 $x0))

;; [part-of]  p200606 ~ p200847   records 14 / 11 / 11 (6 distinct)   gate: PASS
;;   MI: 0.0385   Jaccard: 0.79   e.g. tierA-000084 tierA-000086 tierA-000087
;;   A: (Member $e0 require)
;;   B: (And (Member $e0 require) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 require) (Theme $e0 $x0)) (MnRequire_Theme $e0 $x0))

;; [part-of]  p200844 ~ p200927   records 11 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0376   Jaccard: 0.91   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (And (Agent $e0 $x0) (Member $e0 teach))
;;   B: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_Teach_Recipient_1 $e0 $x0 $x1))

;; [part-of]  p200846 ~ p200925   records 11 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0376   Jaccard: 0.91   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (And (Member $e0 answer) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 answer) (Theme $e0 $x0)) (MnAgent_Answer_Theme_2 $e0 $x0 $x1))

;; [part-of]  p200848 ~ p200927   records 11 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0376   Jaccard: 0.91   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (And (Member $e0 teach) (Recipient $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 teach) (Recipient $e0 $x0)) (MnAgent_Teach_Recipient_2 $e0 $x0 $x1))

;; [part-of]  p200863 ~ p200937   records 11 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0376   Jaccard: 0.91   e.g. tierB-000005 tierB-000094 tierB-000128
;;   A: (Manner $e0 quickly)
;;   B: (And (Manner $e0 quickly) (Past $e0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Manner $e0 quickly) (Past $e0)) (MnMannerQuickly_Past $e0))

;; [part-of]  p200864 ~ p200925   records 11 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0376   Jaccard: 0.91   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (Member $e0 answer)
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)) (MnAgent_Answer_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200864 ~ p200933   records 11 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0376   Jaccard: 0.91   e.g. tierA-000207 tierA-000209 tierA-000210
;;   A: (Member $e0 answer)
;;   B: (And (Agent $e0 $x0) (Member $e0 answer))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 answer)) (MnAgent_Answer $e0 $x0))

;; [part-of]  p200391 ~ p200777   records 21 / 12 / 12 (10 distinct)   gate: PASS
;;   MI: 0.0374   Jaccard: 0.57   e.g. tierA-000181 tierA-000182 tierA-000184
;;   A: (GroupOf $x0 child)
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child))
;;   alignment: $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 2 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child)) (MnAgentOfGroupOfChild $e0 $x0))

;; [part-of]  p200378 ~ p200733   records 22 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 0.55   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (And (Ongoing $e0) (Theme $e1 $e0))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e1 $e1=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0)) (MnStart_ThemeEvOfOngoing_2 $e1 $e0))

;; [part-of]  p200379 ~ p200765   records 22 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0369   Jaccard: 0.55   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Patient $e0 $x0) (Result $e0 $e1))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 $x0=$x0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; [part-of]  p200343 ~ p200765   records 23 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0364   Jaccard: 0.52   e.g. tierB-000362 tierB-000392 tierB-000425
;;   A: (And (Past $e0) (Result $e0 $e1))
;;   B: (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; [part-of]  p200345 ~ p200733   records 23 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0364   Jaccard: 0.52   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing_1 $e0 $e1))

;; [part-of]  p200345 ~ p200782   records 23 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0364   Jaccard: 0.52   e.g. tierB-000199 tierB-000265 tierB-000465
;;   A: (Member $e0 start)
;;   B: (And (Member $e0 start) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Theme $e0 $e1)) (MnStart_ThemeEv $e0 $e1))

;; [part-of]  p200798 ~ p200927   records 12 / 10 / 10 (3 distinct)   gate: PASS
;;   MI: 0.0363   Jaccard: 0.83   e.g. tierA-000281 tierA-000283 tierA-000284
;;   A: (Member $e0 teach)
;;   B: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_Teach_Recipient_1 $e0 $x0 $x1))

;; [part-of]  p200966 ~ p201065   records 9 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0362   Jaccard: 1.00   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p201057 ~ p201085   records 9 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0362   Jaccard: 1.00   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))
;;   B: (And (Member $e0 decide) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)) (MnAgent_Decide_Theme $e0 $x0 $x1))

;; [part-of]  p201058 ~ p201079   records 9 / 9 / 9 (4 distinct)   gate: PASS
;;   MI: 0.0362   Jaccard: 1.00   e.g. tierA-000133 tierA-000135 tierA-000136
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 discover))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1)) (MnAgent_Discover_Theme $e0 $x0 $x1))

;; [part-of]  p201058 ~ p201086   records 9 / 9 / 9 (4 distinct)   gate: PASS
;;   MI: 0.0362   Jaccard: 1.00   e.g. tierA-000133 tierA-000135 tierA-000136
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))
;;   B: (And (Member $e0 discover) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1)) (MnAgent_Discover_Theme $e0 $x0 $x1))

;; [part-of]  p201059 ~ p201080   records 9 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0362   Jaccard: 1.00   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 lend))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1)) (MnAgent_Lend_Theme_1 $e0 $x0 $x1))

;; [part-of]  p201078 ~ p201113   records 9 / 9 / 9 (4 distinct)   gate: PASS
;;   MI: 0.0362   Jaccard: 1.00   e.g. tierA-000143 tierA-000145 tierA-000148
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel))
;;   B: (Member $e0 cancel)
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 cancel)) (MnAgent_Cancel $e0 $x0))

;; [part-of]  p201088 ~ p201118   records 9 / 9 / 9 (4 distinct)   gate: PASS
;;   MI: 0.0362   Jaccard: 1.00   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))
;;   B: (Member $e0 repair)
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 repair) (Patient $e0 $x0)) (MnRepair_Patient $e0 $x0))

;; [part-of]  p200224 ~ p200663   records 32 / 13 / 13 (13 distinct)   gate: PASS
;;   MI: 0.0361   Jaccard: 0.41   e.g. tierA-000108 tierA-000112 tierA-000122
;;   A: (Might $e0)
;;   B: (And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 13 of 13 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1)) (MnAgent_Might_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200319 ~ p200757   records 24 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0360   Jaccard: 0.50   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 $x2=$x2 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme_1 $e0 $x0 $x1 $x2))

;; [part-of]  p200671 ~ p200926   records 13 / 10 / 10 (5 distinct)   gate: PASS
;;   MI: 0.0353   Jaccard: 0.77   e.g. tierA-000222 tierA-000224 tierA-000226
;;   A: (And (Member $e0 destroy) (Patient $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 destroy) (Patient $e0 $x0)) (MnAgent_Destroy_Patient_2 $e0 $x0 $x1))

;; [part-of]  p200683 ~ p200926   records 13 / 10 / 10 (5 distinct)   gate: PASS
;;   MI: 0.0353   Jaccard: 0.77   e.g. tierA-000222 tierA-000224 tierA-000226
;;   A: (Member $e0 destroy)
;;   B: (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1)) (MnAgent_Destroy_Patient_1 $e0 $x0 $x1))

;; [part-of]  p200683 ~ p200935   records 13 / 10 / 10 (5 distinct)   gate: PASS
;;   MI: 0.0353   Jaccard: 0.77   e.g. tierA-000222 tierA-000224 tierA-000226
;;   A: (Member $e0 destroy)
;;   B: (And (Agent $e0 $x0) (Member $e0 destroy))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 destroy)) (MnAgent_Destroy $e0 $x0))

;; [part-of]  p200296 ~ p200779   records 26 / 12 / 12 (12 distinct)   gate: PASS
;;   MI: 0.0352   Jaccard: 0.46   e.g. tierA-000186 tierA-000191 tierA-000197
;;   A: (Member $e0 make)
;;   B: (And (Agent $e0 $x0) (Member $e0 make))
;;   alignment: $e0=$e0 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Member $e0 make)) (MnAgent_Make $e0 $x0))

;; [part-of]  p200406 ~ p200845   records 20 / 11 / 11 (6 distinct)   gate: PASS
;;   MI: 0.0345   Jaccard: 0.55   e.g. tierA-000313 tierA-000315 tierA-000316
;;   A: (Member $e0 work)
;;   B: (And (Location $e0 $x0) (Member $e0 work))
;;   alignment: $e0=$e0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Location $e0 $x0) (Member $e0 work)) (MnLocation_Work $e0 $x0))

;; [part-of]  p200605 ~ p200939   records 14 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0345   Jaccard: 0.71   e.g. tierB-000012 tierB-000115 tierB-000204
;;   A: (Member $e0 go)
;;   B: (And (Member $e0 go) (Past $e0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 go) (Past $e0)) (MnGo_Past $e0))

;; [part-of]  p200607 ~ p200942   records 14 / 10 / 10 (10 distinct)   gate: PASS
;;   MI: 0.0345   Jaccard: 0.71   e.g. tierB-000056 tierB-000425 tierB-000747
;;   A: (Member $x0 door)
;;   B: (And (Member $x0 door) (Patient $e0 $x0))
;;   alignment: $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $x0 door) (Patient $e0 $x0)) (MnPatientOfDoor $e0 $x0))

;; [part-of]  p200934 ~ p201057   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0342   Jaccard: 0.90   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (And (Agent $e0 $x0) (Member $e0 decide))
;;   B: (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)) (MnAgent_Decide_Theme $e0 $x0 $x1))

;; [part-of]  p200940 ~ p201064   records 10 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0342   Jaccard: 0.90   e.g. tierB-000162 tierB-000665 tierB-000730
;;   A: (And (Member $e0 have) (Past $e0))
;;   B: (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 have) (Past $e0) (Theme $e0 $x0)) (MnHave_Past_Theme $e0 $x0))

;; [part-of]  p200941 ~ p201059   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0342   Jaccard: 0.90   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (And (Member $e0 lend) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 lend) (Theme $e0 $x0)) (MnAgent_Lend_Theme_2 $e0 $x0 $x1))

;; [part-of]  p200953 ~ p201077   records 10 / 9 / 9 (6 distinct)   gate: PASS
;;   MI: 0.0342   Jaccard: 0.90   e.g. tierA-000237 tierA-000238 tierA-000240
;;   A: (Member $e0 arrive)
;;   B: (And (Agent $e0 $x0) (Member $e0 arrive))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 arrive)) (MnAgent_Arrive $e0 $x0))

;; [part-of]  p200954 ~ p201059   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0342   Jaccard: 0.90   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (Member $e0 lend)
;;   B: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1)) (MnAgent_Lend_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200954 ~ p201080   records 10 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0342   Jaccard: 0.90   e.g. tierA-000296 tierA-000298 tierA-000299
;;   A: (Member $e0 lend)
;;   B: (And (Agent $e0 $x0) (Member $e0 lend))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 lend)) (MnAgent_Lend $e0 $x0))

;; [part-of]  p200955 ~ p201089   records 10 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0342   Jaccard: 0.90   e.g. tierA-000004 tierA-000011 tierA-000018
;;   A: (Member $e0 sell)
;;   B: (And (Member $e0 sell) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 sell) (Theme $e0 $x0)) (MnSell_Theme $e0 $x0))

;; [part-of]  p200240 ~ p200757   records 30 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0338   Jaccard: 0.40   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   alignment: $e0=$e0 $x0=$x1 $x1=$x2 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x2) (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnAgent_Give_Recipient_Theme_5 $e0 $x0 $x1 $x2))

;; [part-of]  p200240 ~ p200764   records 30 / 12 / 12 (6 distinct)   gate: PASS
;;   MI: 0.0338   Jaccard: 0.40   e.g. tierA-000208 tierA-000213 tierA-000218
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 12 of 12 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_Recipient_Theme_1 $e0 $x0 $x1))

;; [part-of]  p200546 ~ p200934   records 15 / 10 / 10 (4 distinct)   gate: PASS
;;   MI: 0.0338   Jaccard: 0.67   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (Member $e0 decide)
;;   B: (And (Agent $e0 $x0) (Member $e0 decide))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide)) (MnAgent_Decide $e0 $x0))

;; [part-of]  p200867 ~ p201081   records 11 / 9 / 9 (2 distinct)   gate: PASS
;;   MI: 0.0330   Jaccard: 0.82   e.g. tierA-000114 tierA-000115 tierA-000116
;;   A: (Member $x0 board)
;;   B: (And (Agent $e0 $x0) (Member $x0 board))
;;   alignment: $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 7 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $x0 board)) (MnAgentOfBoard $e0 $x0))

;; [part-of]  p201218 ~ p201246   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 abandon))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Abandon_Theme $e0 $x0 $x1))

;; [part-of]  p201218 ~ p201258   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))
;;   B: (And (Member $e0 abandon) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Abandon_Theme $e0 $x0 $x1))

;; [part-of]  p201218 ~ p201291   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))
;;   B: (Member $e0 abandon)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Abandon_Theme $e0 $x0 $x1))

;; [part-of]  p201219 ~ p201248   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 reject))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Reject_Theme $e0 $x0 $x1))

;; [part-of]  p201219 ~ p201261   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))
;;   B: (And (Member $e0 reject) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x1=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Reject_Theme $e0 $x0 $x1))

;; [part-of]  p201219 ~ p201295   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))
;;   B: (Member $e0 reject)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Reject_Theme $e0 $x0 $x1))

;; [part-of]  p201220 ~ p201249   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Member $e0 repair))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Repair_Patient_1 $e0 $x0 $x1))

;; [part-of]  p201246 ~ p201291   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon))
;;   B: (Member $e0 abandon)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 abandon)) (MnAgent_Abandon $e0 $x0))

;; [part-of]  p201248 ~ p201295   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Agent $e0 $x0) (Member $e0 reject))
;;   B: (Member $e0 reject)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 reject)) (MnAgent_Reject $e0 $x0))

;; [part-of]  p201258 ~ p201291   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000099 tierA-000101 tierA-000104
;;   A: (And (Member $e0 abandon) (Theme $e0 $x0))
;;   B: (Member $e0 abandon)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 abandon) (Theme $e0 $x0)) (MnAbandon_Theme $e0 $x0))

;; [part-of]  p201261 ~ p201295   records 8 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0328   Jaccard: 1.00   e.g. tierA-000158 tierA-000160 tierA-000162
;;   A: (And (Member $e0 reject) (Theme $e0 $x0))
;;   B: (Member $e0 reject)
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 reject) (Theme $e0 $x0)) (MnReject_Theme $e0 $x0))

;; [part-of]  p200474 ~ p200938   records 17 / 10 / 10 (7 distinct)   gate: PASS
;;   MI: 0.0326   Jaccard: 0.59   e.g. tierA-000052 tierA-000055 tierA-000057
;;   A: (Member $e0 begin)
;;   B: (And (Member $e0 begin) (Patient $e0 $x0))
;;   alignment: $e0=$e0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Member $e0 begin) (Patient $e0 $x0)) (MnBegin_Patient $e0 $x0))

;; [part-of]  p200477 ~ p200936   records 17 / 10 / 10 (4 distinct)   gate: PASS
;;   MI: 0.0326   Jaccard: 0.59   e.g. tierA-000008 tierA-000009 tierA-000010
;;   A: (Member $x0 school)
;;   B: (And (Agent $e0 $x0) (Member $x0 school))
;;   alignment: $x0=$x0 (holds in 10 of 10 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $x0 school)) (MnAgentOfSchool $e0 $x0))

;; [part-of]  p200305 ~ p200826   records 25 / 11 / 11 (6 distinct)   gate: PASS
;;   MI: 0.0324   Jaccard: 0.44   e.g. tierA-000001 tierA-000002 tierA-000003
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))
;;   B: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 11 of 11 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfCardinalityNum $e0 $x0))

;; [part-of]  p200733 ~ p200966   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0321   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200782 ~ p200966   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0321   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200782 ~ p201065   records 12 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0321   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Theme $e0 $e1))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 $e1=$e1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEv $e0 $e1))

;; [part-of]  p200796 ~ p201058   records 12 / 9 / 9 (4 distinct)   gate: PASS
;;   MI: 0.0321   Jaccard: 0.75   e.g. tierA-000133 tierA-000135 tierA-000136
;;   A: (Member $e0 discover)
;;   B: (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1)) (MnAgent_Discover_Theme $e0 $x0 $x1))

;; [part-of]  p200796 ~ p201079   records 12 / 9 / 9 (4 distinct)   gate: PASS
;;   MI: 0.0321   Jaccard: 0.75   e.g. tierA-000133 tierA-000135 tierA-000136
;;   A: (Member $e0 discover)
;;   B: (And (Agent $e0 $x0) (Member $e0 discover))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 discover)) (MnAgent_Discover $e0 $x0))

;; [part-of]  p200796 ~ p201086   records 12 / 9 / 9 (4 distinct)   gate: PASS
;;   MI: 0.0321   Jaccard: 0.75   e.g. tierA-000133 tierA-000135 tierA-000136
;;   A: (Member $e0 discover)
;;   B: (And (Member $e0 discover) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Member $e0 discover) (Theme $e0 $x0)) (MnDiscover_Theme $e0 $x0))

;; [part-of]  p200676 ~ p201061   records 13 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0313   Jaccard: 0.69   e.g. tierA-000262 tierA-000272 tierA-000277
;;   A: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))
;;   alignment: $e0=$e0 $x0=$x1 $x1=$x2 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x2) (Source $e0 $x0) (Theme $e0 $x1)) (MnAgent_Source_Theme_2 $e0 $x0 $x1 $x2))

;; [part-of]  p200687 ~ p201082   records 13 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0313   Jaccard: 0.69   e.g. tierB-000316 tierB-000338 tierB-000628
;;   A: (Member $x0 person)
;;   B: (And (Agent $e0 $x0) (Member $x0 person))
;;   alignment: $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Member $x0 person)) (MnAgentOfPerson $e0 $x0))

;; [part-of]  p201088 ~ p201220   records 9 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0309   Jaccard: 0.89   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x1) (Member $e0 repair) (Patient $e0 $x0)) (MnAgent_Repair_Patient_2 $e0 $x0 $x1))

;; [part-of]  p201114 ~ p201247   records 9 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0309   Jaccard: 0.89   e.g. tierA-000223 tierA-000228 tierA-000233
;;   A: (Member $e0 cause)
;;   B: (And (Agent $e0 $x0) (Member $e0 cause))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Member $e0 cause)) (MnAgent_Cause $e0 $x0))

;; [part-of]  p201116 ~ p201260   records 9 / 8 / 8 (8 distinct)   gate: PASS
;;   MI: 0.0309   Jaccard: 0.89   e.g. tierB-000176 tierB-000189 tierB-000421
;;   A: (Member $e0 hear)
;;   B: (And (Member $e0 hear) (Past $e0))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 hear) (Past $e0)) (MnHear_Past $e0))

;; [part-of]  p201118 ~ p201220   records 9 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0309   Jaccard: 0.89   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (Member $e0 repair)
;;   B: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Repair_Patient_1 $e0 $x0 $x1))

;; [part-of]  p201118 ~ p201249   records 9 / 8 / 8 (3 distinct)   gate: PASS
;;   MI: 0.0309   Jaccard: 0.89   e.g. tierA-000029 tierA-000032 tierA-000034
;;   A: (Member $e0 repair)
;;   B: (And (Agent $e0 $x0) (Member $e0 repair))
;;   alignment: $e0=$e0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 5 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 repair)) (MnAgent_Repair $e0 $x0))

;; [part-of]  p201124 ~ p201256   records 9 / 8 / 8 (2 distinct)   gate: PASS
;;   MI: 0.0309   Jaccard: 0.89   e.g. tierA-000128 tierA-000129 tierA-000130
;;   A: (Member $x0 ledger)
;;   B: (And (Location $e0 $x0) (Member $x0 ledger))
;;   alignment: $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Location $e0 $x0) (Member $x0 ledger)) (MnLocationOfLedger $e0 $x0))

;; [part-of]  p200592 ~ p201061   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0306   Jaccard: 0.64   e.g. tierA-000262 tierA-000272 tierA-000277
;;   A: (And (Agent $e0 $x0) (Source $e0 $x1))
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Source_Theme_1 $e0 $x0 $x1 $x2))

;; [part-of]  p200594 ~ p201063   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0306   Jaccard: 0.64   e.g. tierB-000034 tierB-000291 tierB-000383
;;   A: (And (Location $e0 $x0) (Patient $e0 $x1))
;;   B: (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 $x1=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnLocation_Past_Patient $e0 $x0 $x1))

;; [part-of]  p200595 ~ p200966   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0306   Jaccard: 0.64   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Past $e0))
;;   B: (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; [part-of]  p200595 ~ p201065   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0306   Jaccard: 0.64   e.g. tierB-000199 tierB-000265 tierB-000534
;;   A: (And (Member $e0 start) (Past $e0))
;;   B: (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Member $e0 start) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEv $e0 $e1))

;; [part-of]  p200597 ~ p201060   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0306   Jaccard: 0.64   e.g. tierB-000520 tierB-000713 tierB-000784
;;   A: (And (Ongoing $e0) (Theme $e0 $x0))
;;   B: (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x1 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Agent $e0 $x1) (Ongoing $e0) (Theme $e0 $x0)) (MnAgent_Ongoing_Theme $e0 $x0 $x1))

;; [part-of]  p200603 ~ p201083   records 14 / 9 / 9 (9 distinct)   gate: PASS
;;   MI: 0.0306   Jaccard: 0.64   e.g. tierB-000222 tierB-000392 tierB-000444
;;   A: (Instrument $e0 $x0)
;;   B: (And (Instrument $e0 $x0) (Past $e0))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack
(Implication (And (Instrument $e0 $x0) (Past $e0)) (MnInstrument_Past $e0 $x0))

;; [part-of]  p200546 ~ p201057   records 15 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0300   Jaccard: 0.60   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (Member $e0 decide)
;;   B: (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)) (MnAgent_Decide_Theme $e0 $x0 $x1))

;; [part-of]  p200546 ~ p201085   records 15 / 9 / 9 (3 distinct)   gate: PASS
;;   MI: 0.0300   Jaccard: 0.60   e.g. tierA-000185 tierA-000189 tierA-000190
;;   A: (Member $e0 decide)
;;   B: (And (Member $e0 decide) (Theme $e0 $x0))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Member $e0 decide) (Theme $e0 $x0)) (MnDecide_Theme $e0 $x0))

;; [part-of]  p200936 ~ p201172   records 10 / 8 / 8 (2 distinct)   gate: PASS
;;   MI: 0.0297   Jaccard: 0.80   e.g. tierA-000008 tierA-000009 tierA-000010
;;   A: (And (Agent $e0 $x0) (Member $x0 school))
;;   B: (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1))
;;   alignment: $e0=$e0 $x0=$x0 (holds in 8 of 8 records)   B is part of A: the rule is A's own pack; 6 of the shared records duplicate another
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1)) (MnAgentOfSchool_Theme $e0 $x0 $x1))

;; [part-of]  p200511 ~ p201084   records 16 / 9 / 9 (6 distinct)   gate: PASS
;;   MI: 0.0295   Jaccard: 0.56   e.g. tierA-000173 tierA-000174 tierA-000177
;;   A: (Member $e0 walk)
;;   B: (And (Location $e0 $x0) (Member $e0 walk))
;;   alignment: $e0=$e0 (holds in 9 of 9 records)   B is part of A: the rule is A's own pack; 3 of the shared records duplicate another
(Implication (And (Location $e0 $x0) (Member $e0 walk)) (MnLocation_Walk $e0 $x0))
