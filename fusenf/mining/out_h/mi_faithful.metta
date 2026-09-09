;; FUSE-NF §4.3.3 Mutual-Information Grouping — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   mi_faithful.jsonl          (every pair at the recording floor, with its statistics, bucket and verdict)
;;   patterns2_faithful.jsonl   (the units and their supporting records = the binary matrix)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   features                       the 1454 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees)
;;   matrix                         binary presence, 2302 records x 1454 units, from each unit's supporting ids (687 records carry no unit and are all-zero rows); 1056331 pairs, 36399 with any co-occurrence
;;   MI                             exact pairwise mutual information of the two binary presence variables, in bits
;;   'very high MI'                 raw MI >= 0.0298 bits = the MI of a perfect co-occurrence over 7 of the 2302 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 1056331 pairs is ~0.0053 bits); near-miss value 0.0223 (= 5 records); pairs recorded from 0.0144 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01]
;;   'moderate individual support'  both units' support <= 27 records = the 97th percentile of unit support (1.2% of the records; percentiles 50/90/95/99 = 4/9/16/66); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself
;;   calibration                    the ceiling x threshold table below checks the paper's claim (median doc-Jaccard of the passes); the claim alone would also accept a lower threshold where perfectly co-occurring support-3..5 pairs (paraphrase families) dominate — the record-count anchor on the threshold is what keeps them out
;;   'almost always co-occur'       the paper's consequence, shown as the doc-Jaccard column (not gated)
;;   containment                    tagged, not gated: a CONTAINED pair (one unit's atoms embed in the other's under a variable renaming) restates §4.3.1 subsumption; SAME RECORDS = identical support sets, not contained; OVERLAPPING = the rest
;;   families                       same-records passes rendered per support set (every pair inside has NMI 1); `paraphrase` when the distinct sentences (by corpus equiv_class or text) are fewer than the unit floor of 3 or at least half the records duplicate another (near-duplicates share every subtree), `distinct` otherwise; n_distinct_sentences = the family's real support
;;   consolidation                  a passing non-contained pair is a proposal to treat the two subtrees as one feature (their conjunction); grouping across support sets and conditional MI are additions
;;
;; RECORD FORMATS
;;   pair record (OVERLAPPING PASSES): two units that are one feature, short of identical records
;;     ;; [overlapping]  A ~ B   n <records of A> / <of B> / <both>   gate: PASS
;;     ;;   MI: <bits>   Jaccard: <both / either>   e.g. <shared record ids>
;;     <query A>
;;     <query B>
;;   family record (SAME-RECORDS FAMILIES): every unit on one support set; each pair inside has NMI 1
;;     ;; [family: paraphrase|distinct]  <m> units, <p> pairs, on <n> records (<d> distinct sentences): <ids>   gate: PASS
;;     <query of each member, one per line>
;; A is the unit with the larger support. Sections sorted by MI desc (pairs) and by size (families);
;; CONTAINED PASSES restate §4.3.1 subsumption and take one line each; near misses are in the .md and the JSONL.

;; ==================== OVERLAPPING PASSES: 17 pairs ====================

;; [overlapping]  p200321 ~ p200339   n 27 / 26 / 26   gate: PASS
;;   MI: 0.0866   Jaccard: 0.96   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $e0 have))
(And (Holder $e0 $x0) (Theme $e0 $x1))

;; [overlapping]  p200517 ~ p200578   n 17 / 16 / 16   gate: PASS
;;   MI: 0.0574   Jaccard: 0.94   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; [overlapping]  p200323 ~ p200517   n 27 / 17 / 16   gate: PASS
;;   MI: 0.0460   Jaccard: 0.57   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Patient $e0 $x0) (Result $e0 $e1))
(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))

;; [overlapping]  p200844 ~ p200935   n 12 / 11 / 11   gate: PASS
;;   MI: 0.0416   Jaccard: 0.92   e.g. tierB-000412 tierB-000688 tierB-001302
(And (Before $e0 $e1) (Past $e1))
(And (Before $e0 $e1) (Past $e0))

;; [overlapping]  p200463 ~ p200480   n 19 / 18 / 14   gate: PASS
;;   MI: 0.0407   Jaccard: 0.61   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))

;; [overlapping]  p200320 ~ p200379   n 27 / 24 / 16   gate: PASS
;;   MI: 0.0388   Jaccard: 0.46   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Theme $e0 $e1))
(And (Agent $e0 $x0) (Theme $e1 $e0))

;; [overlapping]  p200899 ~ p201043   n 11 / 10 / 10   gate: PASS
;;   MI: 0.0382   Jaccard: 0.91   e.g. tierB-000485 tierB-000738 tierB-000942
(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))

;; [overlapping]  p200322 ~ p200323   n 27 / 27 / 16   gate: PASS
;;   MI: 0.0370   Jaccard: 0.42   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Past $e0) (Result $e0 $e1))
(And (Patient $e0 $x0) (Result $e0 $e1))

;; [overlapping]  p200380 ~ p200847   n 24 / 12 / 12   gate: PASS
;;   MI: 0.0366   Jaccard: 0.50   e.g. tierB-000199 tierB-000265 tierB-000465
(And (Ongoing $e0) (Theme $e1 $e0))
(And (Member $e0 start) (Theme $e0 $e1))

;; [overlapping]  p200379 ~ p200463   n 24 / 19 / 14   gate: PASS
;;   MI: 0.0365   Jaccard: 0.48   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Theme $e1 $e0))
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))

;; [overlapping]  p200320 ~ p200480   n 27 / 18 / 14   gate: PASS
;;   MI: 0.0358   Jaccard: 0.45   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Theme $e0 $e1))
(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))

;; [overlapping]  p201043 ~ p201103   n 10 / 9 / 9   gate: PASS
;;   MI: 0.0349   Jaccard: 0.90   e.g. tierB-000485 tierB-000738 tierB-000942
(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; [overlapping]  p201068 ~ p201168   n 10 / 9 / 9   gate: PASS
;;   MI: 0.0349   Jaccard: 0.90   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Member $e0 begin) (Past $e0))
(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))

;; [overlapping]  p201068 ~ p201245   n 10 / 9 / 9   gate: PASS
;;   MI: 0.0349   Jaccard: 0.90   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Member $e0 begin) (Past $e0))
(And (Member $e0 begin) (Theme $e0 $e1))

;; [overlapping]  p200899 ~ p201102   n 11 / 9 / 9   gate: PASS
;;   MI: 0.0336   Jaccard: 0.82   e.g. tierB-000485 tierB-000738 tierB-000942
(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))

;; [overlapping]  p200785 ~ p201224   n 12 / 9 / 9   gate: PASS
;;   MI: 0.0327   Jaccard: 0.75   e.g. tierB-000199 tierB-000265 tierB-000534
(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))

;; [overlapping]  p200728 ~ p201246   n 13 / 9 / 9   gate: PASS
;;   MI: 0.0319   Jaccard: 0.69   e.g. tierB-000063 tierB-000932 tierC-000045
(And (Member $e0 build) (Patient $e0 $x0))
(And (Member $e0 build) (Past $e0))

;; ==================== SAME-RECORDS FAMILIES: 5 families (1 paraphrase, 4 distinct) = 10 pairs ====================

;; [family: paraphrase]  4 units, 6 pairs, on 8 records (3 distinct sentences): tierC-000317 tierC-000318 tierC-000319 tierC-000320 tierC-000325 tierC-000326 tierC-000327 tierC-000328   gate: PASS
(ConditionalProperty bicycle permitted footpath)
(ConditionalProperty pedestrian permitted footpath)
(Inheritance bicycle permitted) ~NEG
(Inheritance pedestrian permitted) ~NEG

;; [family: distinct]  2 units, 1 pairs, on 9 records (8 distinct sentences): tierB-000075 tierB-000173 tierB-000240 tierB-000485 tierB-001052 tierB-001138 tierB-001394 tierC-000025 tierC-000026   gate: PASS
(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))

;; [family: distinct]  2 units, 1 pairs, on 8 records (6 distinct sentences): tierB-000258 tierB-001035 tierB-001867 tierC-000123 tierC-000124 tierC-000197 tierC-000198 tierC-000238   gate: PASS
(And (Agent $e0 $x0) (To $e0 $e1))
(And (Agent $e0 $x0) (To $e1 $e0))

;; [family: distinct]  2 units, 1 pairs, on 9 records (8 distinct sentences): tierB-000485 tierB-000738 tierB-000942 tierB-001052 tierB-001138 tierB-001169 tierB-001219 tierC-000025 tierC-000026   gate: PASS
(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; [family: distinct]  2 units, 1 pairs, on 7 records (6 distinct sentences): tierB-001582 tierB-001817 tierC-000001 tierC-000158 tierC-000237 tierC-000241 tierC-000242   gate: PASS
(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))
(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))

;; ==================== CONTAINED PASSES: 77 pairs (§4.3.1 subsumption restated; one line each) ====================
;; p200321 ⊇ p200327   n 27 / 27 / 27   MI 0.092   (And (Holder $e0 $x0) (Member $e0 have))   ⊇   (Holder $e0 $x0)
;; p200337 ⊇ p200339   n 26 / 26 / 26   MI 0.089   (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))   ⊇   (And (Holder $e0 $x0) (Theme $e0 $x1))
;; p200321 ⊇ p200337   n 27 / 26 / 26   MI 0.087   (And (Holder $e0 $x0) (Member $e0 have))   ⊇   (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;; p200327 ⊇ p200337   n 27 / 26 / 26   MI 0.087   (Holder $e0 $x0)   ⊇   (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))
;; p200327 ⊇ p200339   n 27 / 26 / 26   MI 0.087   (Holder $e0 $x0)   ⊇   (And (Holder $e0 $x0) (Theme $e0 $x1))
;; p200380 ⊇ p200451   n 24 / 19 / 19   MI 0.061   (And (Ongoing $e0) (Theme $e1 $e0))   ⊇   (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;; p200320 ⊇ p200463   n 27 / 19 / 19   MI 0.059   (And (Agent $e0 $x0) (Theme $e0 $e1))   ⊇   (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))
;; p200379 ⊇ p200480   n 24 / 18 / 18   MI 0.058   (And (Agent $e0 $x0) (Theme $e1 $e0))   ⊇   (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))
;; p200322 ⊇ p200517   n 27 / 17 / 17   MI 0.052   (And (Past $e0) (Result $e0 $e1))   ⊇   (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))
;; p200728 ⊇ p200737   n 13 / 13 / 13   MI 0.050   (And (Member $e0 build) (Patient $e0 $x0))   ⊇   (Member $e0 build)
;; p200322 ⊇ p200578   n 27 / 16 / 16   MI 0.048   (And (Past $e0) (Result $e0 $e1))   ⊇   (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;; p200323 ⊇ p200578   n 27 / 16 / 16   MI 0.048   (And (Patient $e0 $x0) (Result $e0 $e1))   ⊇   (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))
;; p200416 ⊇ p200612   n 22 / 15 / 15   MI 0.048   (Member $e0 make)   ⊇   (And (Member $e0 make) (Patient $e0 $x0))
;; p200785 ⊇ p200847   n 12 / 12 / 12   MI 0.047   (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   ⊇   (And (Member $e0 start) (Theme $e0 $e1))
;; p200422 ⊇ p200652   n 21 / 14 / 14   MI 0.045   (Member $e0 start)   ⊇   (And (Member $e0 start) (Past $e0))
;; p200535 ⊇ p200720   n 17 / 13 / 13   MI 0.044   (And (Agent $e0 $x0) (Goal $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))
;; p200900 ⊇ p200935   n 11 / 11 / 11   MI 0.044   (And (Before $e0 $e1) (Past $e0) (Past $e1))   ⊇   (And (Before $e0 $e1) (Past $e0))
;; p200662 ⊇ p200844   n 14 / 12 / 12   MI 0.043   (Before $e0 $e1)   ⊇   (And (Before $e0 $e1) (Past $e1))
;; p200844 ⊇ p200900   n 12 / 11 / 11   MI 0.042   (And (Before $e0 $e1) (Past $e1))   ⊇   (And (Before $e0 $e1) (Past $e0) (Past $e1))
;; p200846 ⊇ p200926   n 12 / 11 / 11   MI 0.042   (And (Member $e0 have) (Past $e0))   ⊇   (And (Member $e0 have) (Past $e0) (Theme $e0 $x0))
;; p200662 ⊇ p200900   n 14 / 11 / 11   MI 0.039   (Before $e0 $e1)   ⊇   (And (Before $e0 $e1) (Past $e0) (Past $e1))
;; p200662 ⊇ p200935   n 14 / 11 / 11   MI 0.039   (Before $e0 $e1)   ⊇   (And (Before $e0 $e1) (Past $e0))
;; p200957 ⊇ p201066   n 11 / 10 / 10   MI 0.038   (Manner $e0 quickly)   ⊇   (And (Manner $e0 quickly) (Past $e0))
;; p200422 ⊇ p200785   n 21 / 12 / 12   MI 0.038   (Member $e0 start)   ⊇   (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;; p200422 ⊇ p200847   n 21 / 12 / 12   MI 0.038   (Member $e0 start)   ⊇   (And (Member $e0 start) (Theme $e0 $e1))
;; p200858 ⊇ p201067   n 12 / 10 / 10   MI 0.037   (Member $e0 become)   ⊇   (And (Member $e0 become) (Patient $e0 $x0))
;; p200859 ⊇ p201068   n 12 / 10 / 10   MI 0.037   (Member $e0 begin)   ⊇   (And (Member $e0 begin) (Past $e0))
;; p201104 ⊇ p201168   n 9 / 9 / 9   MI 0.037   (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   ⊇   (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;; p201104 ⊇ p201222   n 9 / 9 / 9   MI 0.037   (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   ⊇   (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;; p201104 ⊇ p201245   n 9 / 9 / 9   MI 0.037   (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   ⊇   (And (Member $e0 begin) (Theme $e0 $e1))
;; p201105 ⊇ p201224   n 9 / 9 / 9   MI 0.037   (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))   ⊇   (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;; p201168 ⊇ p201245   n 9 / 9 / 9   MI 0.037   (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))   ⊇   (And (Member $e0 begin) (Theme $e0 $e1))
;; p201222 ⊇ p201245   n 9 / 9 / 9   MI 0.037   (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))   ⊇   (And (Member $e0 begin) (Theme $e0 $e1))
;; p201223 ⊇ p201246   n 9 / 9 / 9   MI 0.037   (And (Member $e0 build) (Past $e0) (Patient $e0 $x0))   ⊇   (And (Member $e0 build) (Past $e0))
;; p201247 ⊇ p201269   n 9 / 9 / 9   MI 0.037   (And (Member $e0 kill) (Patient $e0 $x0))   ⊇   (Member $e0 kill)
;; p200546 ⊇ p200937   n 17 / 11 / 11   MI 0.037   (Instrument $e0 $x0)   ⊇   (And (Instrument $e0 $x0) (Patient $e0 $x1))
;; p200380 ⊇ p200785   n 24 / 12 / 12   MI 0.037   (And (Ongoing $e0) (Theme $e1 $e0))   ⊇   (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))
;; p200493 ⊇ p200925   n 18 / 11 / 11   MI 0.036   (And (Location $e0 $x0) (Patient $e0 $x1))   ⊇   (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))
;; p200740 ⊇ p201064   n 13 / 10 / 10   MI 0.036   (Member $x0 company)   ⊇   (And (Agent $e0 $x0) (Member $x0 company))
;; p200663 ⊇ p201070   n 14 / 10 / 10   MI 0.035   (Member $x0 door)   ⊇   (And (Member $x0 door) (Patient $e0 $x0))
;; p201043 ⊇ p201102   n 10 / 9 / 9   MI 0.035   (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))   ⊇   (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))
;; p201068 ⊇ p201104   n 10 / 9 / 9   MI 0.035   (And (Member $e0 begin) (Past $e0))   ⊇   (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;; p201068 ⊇ p201222   n 10 / 9 / 9   MI 0.035   (And (Member $e0 begin) (Past $e0))   ⊇   (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;; p200586 ⊇ p201069   n 16 / 10 / 10   MI 0.034   (Member $e0 go)   ⊇   (And (Member $e0 go) (Past $e0))
;; p200899 ⊇ p201103   n 11 / 9 / 9   MI 0.034   (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))   ⊇   (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;; p201446 ⊇ p201478   n 8 / 8 / 8   MI 0.033   (And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 build))
;; p200380 ⊇ p200899   n 24 / 11 / 11   MI 0.033   (And (Ongoing $e0) (Theme $e1 $e0))   ⊇   (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
;; p200546 ⊇ p201065   n 17 / 10 / 10   MI 0.033   (Instrument $e0 $x0)   ⊇   (And (Instrument $e0 $x0) (Past $e0))
;; p200785 ⊇ p201105   n 12 / 9 / 9   MI 0.033   (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))   ⊇   (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;; p200847 ⊇ p201105   n 12 / 9 / 9   MI 0.033   (And (Member $e0 start) (Theme $e0 $e1))   ⊇   (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;; p200847 ⊇ p201224   n 12 / 9 / 9   MI 0.033   (And (Member $e0 start) (Theme $e0 $e1))   ⊇   (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;; p200859 ⊇ p201104   n 12 / 9 / 9   MI 0.033   (Member $e0 begin)   ⊇   (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;; p200859 ⊇ p201168   n 12 / 9 / 9   MI 0.033   (Member $e0 begin)   ⊇   (And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))
;; p200859 ⊇ p201222   n 12 / 9 / 9   MI 0.033   (Member $e0 begin)   ⊇   (And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))
;; p200859 ⊇ p201245   n 12 / 9 / 9   MI 0.033   (Member $e0 begin)   ⊇   (And (Member $e0 begin) (Theme $e0 $e1))
;; p200320 ⊇ p200899   n 27 / 11 / 11   MI 0.032   (And (Agent $e0 $x0) (Theme $e0 $e1))   ⊇   (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))
;; p200728 ⊇ p201223   n 13 / 9 / 9   MI 0.032   (And (Member $e0 build) (Patient $e0 $x0))   ⊇   (And (Member $e0 build) (Past $e0) (Patient $e0 $x0))
;; p200737 ⊇ p201223   n 13 / 9 / 9   MI 0.032   (Member $e0 build)   ⊇   (And (Member $e0 build) (Past $e0) (Patient $e0 $x0))
;; p200737 ⊇ p201246   n 13 / 9 / 9   MI 0.032   (Member $e0 build)   ⊇   (And (Member $e0 build) (Past $e0))
;; p201240 ⊇ p201344   n 9 / 8 / 8   MI 0.031   (And (Agent $e0 $x0) (GroupOf $x0 person))   ⊇   (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))
;; p201266 ⊇ p201476   n 9 / 8 / 8   MI 0.031   (Again $e0)   ⊇   (And (Again $e0) (Past $e0))
;; p201268 ⊇ p201490   n 9 / 8 / 8   MI 0.031   (Member $e0 hear)   ⊇   (And (Member $e0 hear) (Past $e0))
;; p201272 ⊇ p201491   n 9 / 8 / 8   MI 0.031   (Member $e0 produce)   ⊇   (And (Member $e0 produce) (Patient $e0 $x0))
;; p200652 ⊇ p201105   n 14 / 9 / 9   MI 0.031   (And (Member $e0 start) (Past $e0))   ⊇   (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))
;; p200652 ⊇ p201224   n 14 / 9 / 9   MI 0.031   (And (Member $e0 start) (Past $e0))   ⊇   (And (Member $e0 start) (Past $e0) (Theme $e0 $e1))
;; p200613 ⊇ p201220   n 15 / 9 / 9   MI 0.031   (And (Ongoing $e0) (Theme $e0 $x0))   ⊇   (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))
;; p201086 ⊇ p201485   n 10 / 8 / 8   MI 0.030   (Member $e0 find)   ⊇   (And (Location $e0 $x0) (Member $e0 find))
;; p201089 ⊇ p201495   n 10 / 8 / 8   MI 0.030   (Member $e0 write)   ⊇   (And (Member $e0 write) (Patient $e0 $x0))
;; p200379 ⊇ p201043   n 24 / 10 / 10   MI 0.030   (And (Agent $e0 $x0) (Theme $e1 $e0))   ⊇   (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;; p200380 ⊇ p201043   n 24 / 10 / 10   MI 0.030   (And (Ongoing $e0) (Theme $e1 $e0))   ⊇   (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))
;; p200582 ⊇ p201169   n 16 / 9 / 9   MI 0.030   (And (Patient $e0 $x0) (Theme $e1 $e0))   ⊇   (And (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))
;; p200582 ⊇ p201225   n 16 / 9 / 9   MI 0.030   (And (Patient $e0 $x0) (Theme $e1 $e0))   ⊇   (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))
;; p201674 ⊇ p201814   n 7 / 7 / 7   MI 0.030   (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))   ⊇   (And (Cardinality $x0 <num>) (Patient $e0 $x0))
;; p201772 ⊇ p201824   n 7 / 7 / 7   MI 0.030   (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))   ⊇   (And (Member $e0 kill) (Past $e0))
;; p201773 ⊇ p201828   n 7 / 7 / 7   MI 0.030   (And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))   ⊇   (And (Member $e0 produce) (Past $e0))
;; p201774 ⊇ p201831   n 7 / 7 / 7   MI 0.030   (And (Member $e0 write) (Past $e0) (Patient $e0 $x0))   ⊇   (And (Member $e0 write) (Past $e0))
;; p201834 ⊇ p201881   n 7 / 7 / 7   MI 0.030   (And (Past $e0) (Through $e0 $x0))   ⊇   (Through $e0 $x0)
