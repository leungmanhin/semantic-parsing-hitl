;; FUSE-NF §4.3.3 Mutual-Information Grouping — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   mi_faithful.jsonl          (every pair at the recording floor, with its statistics, bucket and verdict)
;;   patterns2_faithful.jsonl   (the units and their supporting records = the binary matrix)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   features                       the 1652 faithful §4.3.1 units of patterns2_faithful.jsonl (rooted subtrees, constants verbatim, support >= 3, single-atom units included: they are subtrees)
;;   matrix                         binary presence, 762 records x 1652 units, from each unit's supporting ids (106 records carry no unit and are all-zero rows); 1363726 pairs, 39574 with any co-occurrence
;;   MI                             exact pairwise mutual information of the two binary presence variables, in bits
;;   'very high MI'                 raw MI >= 0.0753 bits = the MI of a perfect co-occurrence over 7 of the 762 records (the evidence-sufficiency anchor the paper leaves implicit; the Bonferroni-significant level for 1363726 pairs is ~0.0162 bits); near-miss value 0.057 (= 5 records); pairs recorded from 0.0371 (= 3 records); dial [0.1, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01]
;;   'moderate individual support'  both units' support <= 12 records = the 97th percentile of unit support (1.6% of the records; percentiles 50/90/95/99 = 4/7/10/28); the floor of 3 is inherited from the units; raw MI cannot be high for rare pairs, so the low end excludes itself
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

;; ==================== OVERLAPPING PASSES: 2 pairs ====================

;; [overlapping]  p200482 ~ p200563   n 10 / 9 / 9   gate: PASS
;;   MI: 0.0864   Jaccard: 0.90   e.g. tierA-000185 tierA-000189 tierA-000190
(And (Agent $e0 $x0) (Member $e0 decide))
(And (Member $e0 decide) (Theme $e0 $x0))

;; [overlapping]  p200488 ~ p200559   n 10 / 9 / 9   gate: PASS
;;   MI: 0.0864   Jaccard: 0.90   e.g. tierA-000296 tierA-000298 tierA-000299
(And (Member $e0 lend) (Theme $e0 $x0))
(And (Agent $e0 $x0) (Member $e0 lend))

;; ==================== SAME-RECORDS FAMILIES: 9 families (8 paraphrase, 1 distinct) = 20 pairs ====================

;; [family: paraphrase]  6 units, 9 pairs, on 12 records (6 distinct sentences): tierA-000208 tierA-000213 tierA-000218 tierA-000261 tierA-000263 tierA-000265 tierA-000271 tierA-000273 tierA-000274 tierA-000276 tierA-000278 tierA-000280   gate: PASS
(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
(And (Agent $e0 $x0) (Member $e0 give))
(And (Member $e0 give) (Recipient $e0 $x0))
(And (Member $e0 give) (Theme $e0 $x0))

;; [family: paraphrase]  4 units, 4 pairs, on 7 records (1 distinct sentences): tierA-000022 tierA-000023 tierA-000024 tierA-000025 tierA-000026 tierA-000027 tierA-000028   gate: PASS
(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))
(Inheritance pottery_studio studio)
(Member $x0 kiln)
(Member $x0 pottery_studio)

;; [family: paraphrase]  2 units, 1 pairs, on 8 records (3 distinct sentences): tierA-000029 tierA-000032 tierA-000034 tierA-000035 tierA-000038 tierA-000039 tierA-000049 tierA-000051   gate: PASS
(And (Agent $e0 $x0) (Member $e0 repair))
(And (Member $e0 repair) (Patient $e0 $x0))

;; [family: paraphrase]  2 units, 1 pairs, on 8 records (3 distinct sentences): tierA-000099 tierA-000101 tierA-000104 tierA-000106 tierA-000108 tierA-000109 tierA-000111 tierA-000112   gate: PASS
(And (Agent $e0 $x0) (Member $e0 abandon))
(And (Member $e0 abandon) (Theme $e0 $x0))

;; [family: paraphrase]  2 units, 1 pairs, on 7 records (3 distinct sentences): tierA-000114 tierA-000116 tierA-000119 tierA-000122 tierA-000123 tierA-000125 tierA-000126   gate: PASS
(And (Agent $e0 $x0) (Member $e0 postpone))
(And (Member $e0 postpone) (Theme $e0 $x0))

;; [family: paraphrase]  2 units, 1 pairs, on 8 records (3 distinct sentences): tierA-000158 tierA-000160 tierA-000162 tierA-000163 tierA-000165 tierA-000166 tierA-000168 tierA-000170   gate: PASS
(And (Agent $e0 $x0) (Member $e0 reject))
(And (Member $e0 reject) (Theme $e0 $x0))

;; [family: paraphrase]  2 units, 1 pairs, on 10 records (3 distinct sentences): tierA-000207 tierA-000209 tierA-000210 tierA-000211 tierA-000212 tierA-000214 tierA-000215 tierA-000217 tierA-000219 tierA-000221   gate: PASS
(And (Agent $e0 $x0) (Member $e0 answer))
(And (Member $e0 answer) (Theme $e0 $x0))

;; [family: paraphrase]  2 units, 1 pairs, on 10 records (3 distinct sentences): tierA-000281 tierA-000283 tierA-000284 tierA-000285 tierA-000286 tierA-000288 tierA-000289 tierA-000291 tierA-000293 tierA-000295   gate: PASS
(And (Agent $e0 $x0) (Member $e0 teach))
(And (Member $e0 teach) (Recipient $e0 $x0))

;; [family: distinct]  2 units, 1 pairs, on 7 records (4 distinct sentences): tierC-000001 tierC-000077 tierC-000078 tierC-000109 tierC-000110 tierC-000121 tierC-000122   gate: PASS
(And (Before $e0 $e1) (Past $e0))
(And (Before $e0 $e1) (Past $e1))

;; ==================== CONTAINED PASSES: 84 pairs (§4.3.1 subsumption restated; one line each) ====================
;; p200326 ⊇ p200329   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))   ⊇   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))
;; p200326 ⊇ p200330   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))   ⊇   (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))
;; p200326 ⊇ p200332   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))   ⊇   (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))
;; p200326 ⊇ p200338   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))   ⊇   (And (Agent $e0 $x0) (Member $e0 give))
;; p200326 ⊇ p200340   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))   ⊇   (And (Member $e0 give) (Recipient $e0 $x0))
;; p200326 ⊇ p200341   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))   ⊇   (And (Member $e0 give) (Theme $e0 $x0))
;; p200326 ⊇ p200352   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))   ⊇   (Member $e0 give)
;; p200329 ⊇ p200338   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 give))
;; p200329 ⊇ p200340   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))   ⊇   (And (Member $e0 give) (Recipient $e0 $x0))
;; p200329 ⊇ p200352   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))   ⊇   (Member $e0 give)
;; p200330 ⊇ p200338   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 give))
;; p200330 ⊇ p200341   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))   ⊇   (And (Member $e0 give) (Theme $e0 $x0))
;; p200330 ⊇ p200352   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))   ⊇   (Member $e0 give)
;; p200332 ⊇ p200340   n 12 / 12 / 12   MI 0.117   (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))   ⊇   (And (Member $e0 give) (Recipient $e0 $x0))
;; p200332 ⊇ p200341   n 12 / 12 / 12   MI 0.117   (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))   ⊇   (And (Member $e0 give) (Theme $e0 $x0))
;; p200332 ⊇ p200352   n 12 / 12 / 12   MI 0.117   (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))   ⊇   (Member $e0 give)
;; p200338 ⊇ p200352   n 12 / 12 / 12   MI 0.117   (And (Agent $e0 $x0) (Member $e0 give))   ⊇   (Member $e0 give)
;; p200340 ⊇ p200352   n 12 / 12 / 12   MI 0.117   (And (Member $e0 give) (Recipient $e0 $x0))   ⊇   (Member $e0 give)
;; p200341 ⊇ p200352   n 12 / 12 / 12   MI 0.117   (And (Member $e0 give) (Theme $e0 $x0))   ⊇   (Member $e0 give)
;; p200402 ⊇ p200411   n 11 / 11 / 11   MI 0.109   (And (Member $e0 destroy) (Patient $e0 $x0))   ⊇   (Member $e0 destroy)
;; p200470 ⊇ p200481   n 10 / 10 / 10   MI 0.101   (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 answer))
;; p200470 ⊇ p200486   n 10 / 10 / 10   MI 0.101   (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))   ⊇   (And (Member $e0 answer) (Theme $e0 $x0))
;; p200470 ⊇ p200499   n 10 / 10 / 10   MI 0.101   (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))   ⊇   (Member $e0 answer)
;; p200471 ⊇ p200483   n 10 / 10 / 10   MI 0.101   (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 teach))
;; p200471 ⊇ p200489   n 10 / 10 / 10   MI 0.101   (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))   ⊇   (And (Member $e0 teach) (Recipient $e0 $x0))
;; p200471 ⊇ p200503   n 10 / 10 / 10   MI 0.101   (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))   ⊇   (Member $e0 teach)
;; p200481 ⊇ p200499   n 10 / 10 / 10   MI 0.101   (And (Agent $e0 $x0) (Member $e0 answer))   ⊇   (Member $e0 answer)
;; p200483 ⊇ p200503   n 10 / 10 / 10   MI 0.101   (And (Agent $e0 $x0) (Member $e0 teach))   ⊇   (Member $e0 teach)
;; p200486 ⊇ p200499   n 10 / 10 / 10   MI 0.101   (And (Member $e0 answer) (Theme $e0 $x0))   ⊇   (Member $e0 answer)
;; p200487 ⊇ p200500   n 10 / 10 / 10   MI 0.101   (And (Member $e0 build) (Patient $e0 $x0))   ⊇   (Member $e0 build)
;; p200488 ⊇ p200501   n 10 / 10 / 10   MI 0.101   (And (Member $e0 lend) (Theme $e0 $x0))   ⊇   (Member $e0 lend)
;; p200489 ⊇ p200503   n 10 / 10 / 10   MI 0.101   (And (Member $e0 teach) (Recipient $e0 $x0))   ⊇   (Member $e0 teach)
;; p200410 ⊇ p200482   n 11 / 10 / 10   MI 0.095   (Member $e0 decide)   ⊇   (And (Agent $e0 $x0) (Member $e0 decide))
;; p200550 ⊇ p200563   n 9 / 9 / 9   MI 0.093   (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))   ⊇   (And (Member $e0 decide) (Theme $e0 $x0))
;; p200551 ⊇ p200559   n 9 / 9 / 9   MI 0.093   (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 lend))
;; p200558 ⊇ p200574   n 9 / 9 / 9   MI 0.093   (And (Agent $e0 $x0) (Member $e0 cancel))   ⊇   (Member $e0 cancel)
;; p200355 ⊇ p200490   n 12 / 10 / 10   MI 0.091   (Source $e0 $x0)   ⊇   (And (Source $e0 $x0) (Theme $e0 $x1))
;; p200482 ⊇ p200550   n 10 / 9 / 9   MI 0.086   (And (Agent $e0 $x0) (Member $e0 decide))   ⊇   (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))
;; p200488 ⊇ p200551   n 10 / 9 / 9   MI 0.086   (And (Member $e0 lend) (Theme $e0 $x0))   ⊇   (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))
;; p200501 ⊇ p200551   n 10 / 9 / 9   MI 0.086   (Member $e0 lend)   ⊇   (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))
;; p200501 ⊇ p200559   n 10 / 9 / 9   MI 0.086   (Member $e0 lend)   ⊇   (And (Agent $e0 $x0) (Member $e0 lend))
;; p200620 ⊇ p200680   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $x0 school))
;; p200621 ⊇ p200681   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1))   ⊇   (And (Agent $e0 $x0) (Possession $x0 $x1))
;; p200661 ⊇ p200675   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 abandon))
;; p200661 ⊇ p200685   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))   ⊇   (And (Member $e0 abandon) (Theme $e0 $x0))
;; p200661 ⊇ p200696   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))   ⊇   (Member $e0 abandon)
;; p200662 ⊇ p200676   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 destroy))
;; p200663 ⊇ p200677   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 reject))
;; p200663 ⊇ p200687   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))   ⊇   (And (Member $e0 reject) (Theme $e0 $x0))
;; p200663 ⊇ p200699   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))   ⊇   (Member $e0 reject)
;; p200664 ⊇ p200678   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 repair))
;; p200664 ⊇ p200688   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))   ⊇   (And (Member $e0 repair) (Patient $e0 $x0))
;; p200664 ⊇ p200700   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))   ⊇   (Member $e0 repair)
;; p200675 ⊇ p200696   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 abandon))   ⊇   (Member $e0 abandon)
;; p200677 ⊇ p200699   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 reject))   ⊇   (Member $e0 reject)
;; p200678 ⊇ p200700   n 8 / 8 / 8   MI 0.084   (And (Agent $e0 $x0) (Member $e0 repair))   ⊇   (Member $e0 repair)
;; p200685 ⊇ p200696   n 8 / 8 / 8   MI 0.084   (And (Member $e0 abandon) (Theme $e0 $x0))   ⊇   (Member $e0 abandon)
;; p200686 ⊇ p200698   n 8 / 8 / 8   MI 0.084   (And (Member $e0 have) (Theme $e0 $x0))   ⊇   (Member $e0 have)
;; p200687 ⊇ p200699   n 8 / 8 / 8   MI 0.084   (And (Member $e0 reject) (Theme $e0 $x0))   ⊇   (Member $e0 reject)
;; p200688 ⊇ p200700   n 8 / 8 / 8   MI 0.084   (And (Member $e0 repair) (Patient $e0 $x0))   ⊇   (Member $e0 repair)
;; p200410 ⊇ p200550   n 11 / 9 / 9   MI 0.083   (Member $e0 decide)   ⊇   (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))
;; p200410 ⊇ p200563   n 11 / 9 / 9   MI 0.083   (Member $e0 decide)   ⊇   (And (Member $e0 decide) (Theme $e0 $x0))
;; p200412 ⊇ p200560   n 11 / 9 / 9   MI 0.083   (Member $x0 board)   ⊇   (And (Agent $e0 $x0) (Member $x0 board))
;; p200351 ⊇ p200564   n 12 / 9 / 9   MI 0.080   (Member $e0 discover)   ⊇   (And (Member $e0 discover) (Theme $e0 $x0))
;; p200355 ⊇ p200561   n 12 / 9 / 9   MI 0.080   (Source $e0 $x0)   ⊇   (And (Agent $e0 $x0) (Source $e0 $x1))
;; p200561 ⊇ p200665   n 9 / 8 / 8   MI 0.078   (And (Agent $e0 $x0) (Source $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))
;; p200575 ⊇ p200684   n 9 / 8 / 8   MI 0.078   (Member $x0 ledger)   ⊇   (And (Location $e0 $x0) (Member $x0 ledger))
;; p200760 ⊇ p200825   n 7 / 7 / 7   MI 0.075   (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $x0 depot))
;; p200762 ⊇ p200827   n 7 / 7 / 7   MI 0.075   (And (Before $e0 $e1) (Past $e0) (Past $e1))   ⊇   (And (Before $e0 $e1) (Past $e0))
;; p200762 ⊇ p200828   n 7 / 7 / 7   MI 0.075   (And (Before $e0 $e1) (Past $e0) (Past $e1))   ⊇   (And (Before $e0 $e1) (Past $e1))
;; p200793 ⊇ p200801   n 7 / 7 / 7   MI 0.075   (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))   ⊇   (Inheritance pottery_studio studio)
;; p200793 ⊇ p200857   n 7 / 7 / 7   MI 0.075   (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))   ⊇   (Member $x0 pottery_studio)
;; p200805 ⊇ p200834   n 7 / 7 / 7   MI 0.075   (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))   ⊇   (And (Member $e0 cancel) (Patient $e0 $x0))
;; p200806 ⊇ p200823   n 7 / 7 / 7   MI 0.075   (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 discover))
;; p200807 ⊇ p200824   n 7 / 7 / 7   MI 0.075   (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))   ⊇   (And (Agent $e0 $x0) (Member $e0 postpone))
;; p200807 ⊇ p200836   n 7 / 7 / 7   MI 0.075   (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))   ⊇   (And (Member $e0 postpone) (Theme $e0 $x0))
;; p200807 ⊇ p200854   n 7 / 7 / 7   MI 0.075   (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))   ⊇   (Member $e0 postpone)
;; p200808 ⊇ p200833   n 7 / 7 / 7   MI 0.075   (And (Member $e0 build) (Past $e0) (Patient $e0 $x0))   ⊇   (And (Member $e0 build) (Past $e0))
;; p200809 ⊇ p200835   n 7 / 7 / 7   MI 0.075   (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))   ⊇   (And (Member $e0 lend) (Recipient $e0 $x0))
;; p200822 ⊇ p200851   n 7 / 7 / 7   MI 0.075   (And (Agent $e0 $x0) (CoAgent $e0 $x1))   ⊇   (CoAgent $e0 $x0)
;; p200824 ⊇ p200854   n 7 / 7 / 7   MI 0.075   (And (Agent $e0 $x0) (Member $e0 postpone))   ⊇   (Member $e0 postpone)
;; p200829 ⊇ p200850   n 7 / 7 / 7   MI 0.075   (And (Beneficiary $e0 $x0) (Past $e0))   ⊇   (Beneficiary $e0 $x0)
;; p200830 ⊇ p200852   n 7 / 7 / 7   MI 0.075   (And (Cardinality $x0 <num>) (GroupOf $x0 forklift))   ⊇   (GroupOf $x0 forklift)
;; p200836 ⊇ p200854   n 7 / 7 / 7   MI 0.075   (And (Member $e0 postpone) (Theme $e0 $x0))   ⊇   (Member $e0 postpone)
