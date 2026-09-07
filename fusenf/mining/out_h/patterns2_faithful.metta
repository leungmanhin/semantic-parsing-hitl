;; FUSE-NF §4.3.1 Frequent Subtree Mining — FAITHFUL view — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   patterns2_faithful.jsonl  (every unit with its fields and supporting record ids)
;;   patterns2.jsonl           (the miner's full inventory this view is cut from)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate           patterns2.jsonl — 7766 patterns over 2154 records (the miner's inventory; this view mines nothing)
;;   size threshold      k = 4 atoms per pattern (the miner's --k)
;;   minimum support     3 records (document support; occurrences reported beside it)
;;   pattern language    skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded
;;   rooted subtree      atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded
;;   constants verbatim  n_lifted = 0 only; the 6037 constant-lifted (shape-stratum) patterns are an addition
;;   closure             closed = no larger pattern has the same supporting records (the miner's dominated flag inverted); closed units are the meta-node proposals, subsumed units the same evidence in smaller pieces
;;   meta-node           (Mn_<pattern_id> <root> <other variables>) — provisional naming; pack rule = (Implication (And <atoms>) (Mn …))
;;
;; RECORD FORMAT (every record is one unit = one rooted subtree)
;;   ;; <pattern id>  support <records> (occ <matches>)  size <atoms>  root <variable> (<kind>)  depth <d>
;;   ;;   e.g. <up to three supporting record ids>
;;   ;;   meta-node: (Mn_<id> <root> <other variables>)
;;   <the unit as a conjunctive query>
;; Sections: CLOSED UNITS (the meta-node proposals) then SUBSUMED UNITS (a larger unit has the same
;; supporting records); each sorted by support desc, then pattern id.

;; ==================== CLOSED UNITS: 480 of 1454 rooted-subtree units (k = 4, support >= 3 of 2154 records) ====================

;; p200012  support 316 (occ 345)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000021 tierB-000037
;;   meta-node: (Mn_p200012 $e0 $x0)
(Theme $e0 $x0)

;; p200049  support 114 (occ 115)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000023 tierB-000055 tierB-000080
;;   meta-node: (Mn_p200049 $x0)
(Member $x0 thing)

;; p200083  support 69 (occ 72)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000019 tierB-000032 tierB-000116
;;   meta-node: (Mn_p200083 $x0 $x1)
(LocatedIn $x0 $x1)

;; p200114  support 58 (occ 58)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000316 tierB-000338 tierB-000628
;;   meta-node: (Mn_p200114 $x0)
(Member $x0 person)

;; p200128  support 54 (occ 54)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000122 tierB-000246 tierB-000423
;;   meta-node: (Mn_p200128 $x0 $x1)
(Possession $x0 $x1)

;; p200164  support 45 (occ 48)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000172 tierB-000202
;;   meta-node: (Mn_p200164 $x0 $x1)
(PartOf $x0 $x1)

;; p200178  support 43 (occ 43)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000066 tierB-000142 tierB-000162
;;   meta-node: (Mn_p200178 $e0)
(Member $e0 have)

;; p200196  support 40 (occ 40)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000066 tierB-000142 tierB-000162
;;   meta-node: (Mn_p200196 $e0 $x0)
(And (Member $e0 have) (Theme $e0 $x0))

;; p200233  support 34 (occ 37)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000040 tierB-000126 tierB-000191
;;   meta-node: (Mn_p200233 $x0)
(GroupOf $x0 person)

;; p200321  support 27 (occ 27)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
;;   meta-node: (Mn_p200321 $e0 $x0)
(And (Holder $e0 $x0) (Member $e0 have))

;; p200337  support 26 (occ 26)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
;;   meta-node: (Mn_p200337 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))

;; p200416  support 22 (occ 22)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-000073 tierB-000173
;;   meta-node: (Mn_p200416 $e0)
(Member $e0 make)

;; p200422  support 21 (occ 22)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000043 tierB-000192 tierB-000199
;;   meta-node: (Mn_p200422 $e0)
(Member $e0 start)

;; p200432  support 20 (occ 21)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000410 tierB-000587 tierB-000634
;;   meta-node: (Mn_p200432 $x0)
(GroupOf $x0 child)

;; p200433  support 20 (occ 21)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000268 tierB-000282
;;   meta-node: (Mn_p200433 $e0)
(Member $e0 use)

;; p200434  support 20 (occ 20)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000048 tierB-000293 tierB-000371
;;   meta-node: (Mn_p200434 $x0)
(Member $x0 house)

;; p200536  support 17 (occ 17)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierB-000966 tierC-000017 tierC-000018
;;   meta-node: (Mn_p200536 $x1 $x0)
(And (Member $x0 person) (Possession $x1 $x0))

;; p200547  support 17 (occ 18)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000263 tierB-000344 tierB-000670
;;   meta-node: (Mn_p200547 $x0)
(Member $x0 room)

;; p200586  support 16 (occ 17)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000115 tierB-000204
;;   meta-node: (Mn_p200586 $e0)
(Member $e0 go)

;; p200612  support 15 (occ 15)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-000073 tierB-000269
;;   meta-node: (Mn_p200612 $e0 $x0)
(And (Member $e0 make) (Patient $e0 $x0))

;; p200652  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000043 tierB-000192 tierB-000199
;;   meta-node: (Mn_p200652 $e0)
(And (Member $e0 start) (Past $e0))

;; p200663  support 14 (occ 14)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000056 tierB-000425 tierB-000446
;;   meta-node: (Mn_p200663 $x0)
(Member $x0 door)

;; p200738  support 13 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000370 tierB-000418
;;   meta-node: (Mn_p200738 $e0)
(Member $e0 get)

;; p200739  support 13 (occ 13)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000160 tierB-000648
;;   meta-node: (Mn_p200739 $e0)
(Member $e0 play)

;; p200740  support 13 (occ 13)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000762 tierB-000853 tierB-000986
;;   meta-node: (Mn_p200740 $x0)
(Member $x0 company)

;; p200741  support 13 (occ 13)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000288 tierB-000728 tierB-000958
;;   meta-node: (Mn_p200741 $x0)
(Member $x0 new)

;; p200846  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000162 tierB-000665 tierB-000730
;;   meta-node: (Mn_p200846 $e0)
(And (Member $e0 have) (Past $e0))

;; p200858  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-000740 tierB-001079
;;   meta-node: (Mn_p200858 $e0)
(Member $e0 become)

;; p200859  support 12 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000182
;;   meta-node: (Mn_p200859 $e0)
(Member $e0 begin)

;; p200860  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000152 tierB-000238 tierB-000255
;;   meta-node: (Mn_p200860 $e0)
(Member $e0 come)

;; p200861  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000309 tierB-000942
;;   meta-node: (Mn_p200861 $e0)
(Member $e0 take)

;; p200862  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000307 tierB-000650 tierB-000843
;;   meta-node: (Mn_p200862 $x0)
(Member $x0 problem)

;; p200863  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000205 tierB-000351 tierB-000429
;;   meta-node: (Mn_p200863 $x0)
(Member $x0 weather)

;; p200864  support 12 (occ 12)  size 1  root (LocatedIn (constant)  depth 1
;;   e.g. tierB-000016 tierB-000126 tierB-000285
;;   meta-node: (Mn_p200864 (LocatedIn $x0 $x1)
(Past (LocatedIn $x0 $x1))

;; p200926  support 11 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000162 tierB-000665 tierB-000730
;;   meta-node: (Mn_p200926 $e0 $x0)
(And (Member $e0 have) (Past $e0) (Theme $e0 $x0))

;; p200955  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000162 tierB-000483 tierB-001020
;;   meta-node: (Mn_p200955 $x0)
(GroupOf $x0 thing)

;; p200958  support 11 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000203 tierB-000225 tierB-000253
;;   meta-node: (Mn_p200958 $e0)
(Member $e0 study)

;; p200959  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000216 tierB-000400
;;   meta-node: (Mn_p200959 $e0)
(Member $e0 try)

;; p200960  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000212 tierB-000419
;;   meta-node: (Mn_p200960 $e0)
(Member $e0 work)

;; p200961  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000793 tierB-001182 tierB-001316
;;   meta-node: (Mn_p200961 $x0)
(Member $x0 man)

;; p200962  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000494 tierB-000576 tierB-000589
;;   meta-node: (Mn_p200962 $x0)
(Member $x0 place)

;; p200963  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000016 tierB-000047 tierB-000335
;;   meta-node: (Mn_p200963 $x0)
(Member $x0 table)

;; p201068  support 10 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000182
;;   meta-node: (Mn_p201068 $e0)
(And (Member $e0 begin) (Past $e0))

;; p201069  support 10 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000115 tierB-000204
;;   meta-node: (Mn_p201069 $e0)
(And (Member $e0 go) (Past $e0))

;; p201086  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-000706
;;   meta-node: (Mn_p201086 $e0)
(Member $e0 find)

;; p201087  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000026 tierB-000231 tierB-000584
;;   meta-node: (Mn_p201087 $e0)
(Member $e0 follow)

;; p201088  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000100 tierB-000298
;;   meta-node: (Mn_p201088 $e0)
(Member $e0 leave)

;; p201089  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000971 tierB-001004 tierB-001601
;;   meta-node: (Mn_p201089 $e0)
(Member $e0 write)

;; p201090  support 10 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000295 tierB-000458 tierB-000703
;;   meta-node: (Mn_p201090 $x0)
(Member $x0 book)

;; p201091  support 10 (occ 10)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000024 tierB-000073 tierB-000250
;;   meta-node: (Mn_p201091 $x0)
(Member $x0 cat)

;; p201093  support 10 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000176 tierB-000277 tierB-000668
;;   meta-node: (Mn_p201093 $x0)
(Member $x0 tree)

;; p201103  support 9 (occ 11)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000738 tierB-000942
;;   meta-node: (Mn_p201103 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; p201104  support 9 (occ 11)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   meta-node: (Mn_p201104 $e0 $e1)
(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; p201105  support 9 (occ 9)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000534
;;   meta-node: (Mn_p201105 $e0 $e1)
(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; p201247  support 9 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000393 tierB-000412
;;   meta-node: (Mn_p201247 $e0 $x0)
(And (Member $e0 kill) (Patient $e0 $x0))

;; p201248  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000325 tierB-000539
;;   meta-node: (Mn_p201248 $e0)
(And (Member $e0 make) (Past $e0))

;; p201249  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000192 tierB-000265 tierB-000654
;;   meta-node: (Mn_p201249 $e0 $x0)
(And (Member $e0 start) (Patient $e0 $x0))

;; p201250  support 9 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000866 tierB-000938
;;   meta-node: (Mn_p201250 $e0 $x0)
(And (Member $e0 use) (Theme $e0 $x0))

;; p201267  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000456 tierB-000609
;;   meta-node: (Mn_p201267 $e0)
(Member $e0 fall)

;; p201268  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000189 tierB-000421
;;   meta-node: (Mn_p201268 $e0)
(Member $e0 hear)

;; p201270  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000061 tierB-000086 tierB-000107
;;   meta-node: (Mn_p201270 $e0)
(Member $e0 need)

;; p201271  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-000302 tierB-000425
;;   meta-node: (Mn_p201271 $e0)
(Member $e0 open)

;; p201272  support 9 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000208 tierB-001358 tierB-001995
;;   meta-node: (Mn_p201272 $e0)
(Member $e0 produce)

;; p201273  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001003 tierB-001302 tierB-001334
;;   meta-node: (Mn_p201273 $e0)
(Member $e0 sleep)

;; p201274  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000872 tierB-000904 tierB-001016
;;   meta-node: (Mn_p201274 $x0)
(Member $x0 beautiful)

;; p201275  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000746 tierB-000890
;;   meta-node: (Mn_p201275 $x0)
(Member $x0 big)

;; p201276  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000190 tierB-000327
;;   meta-node: (Mn_p201276 $x0)
(Member $x0 car)

;; p201277  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000153 tierB-000546 tierB-000680
;;   meta-node: (Mn_p201277 $x0)
(Member $x0 city)

;; p201278  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000340 tierB-000537 tierB-000871
;;   meta-node: (Mn_p201278 $x0)
(Member $x0 dog)

;; p201280  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000294 tierB-000468 tierB-000582
;;   meta-node: (Mn_p201280 $x0)
(Member $x0 road)

;; p201479  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000998 tierB-001182
;;   meta-node: (Mn_p201479 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 make))

;; p201485  support 8 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000706 tierC-000243
;;   meta-node: (Mn_p201485 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 find))

;; p201488  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-001079 tierB-001582
;;   meta-node: (Mn_p201488 $e0)
(And (Member $e0 become) (Past $e0))

;; p201490  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000189 tierB-000421
;;   meta-node: (Mn_p201490 $e0)
(And (Member $e0 hear) (Past $e0))

;; p201493  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000216 tierB-000400
;;   meta-node: (Mn_p201493 $e0)
(And (Member $e0 try) (Past $e0))

;; p201529  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000098 tierB-000139 tierB-000517
;;   meta-node: (Mn_p201529 $e0)
(Member $e0 change)

;; p201530  support 8 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000048 tierB-000371 tierB-000524
;;   meta-node: (Mn_p201530 $e0)
(Member $e0 live)

;; p201531  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000257 tierB-000326 tierB-000784
;;   meta-node: (Mn_p201531 $e0)
(Member $e0 sell)

;; p201532  support 8 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000864 tierB-000910 tierB-000915
;;   meta-node: (Mn_p201532 $e0)
(Member $e0 serve)

;; p201533  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000327 tierB-000550
;;   meta-node: (Mn_p201533 $e0)
(Member $e0 talk)

;; p201534  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000324
;;   meta-node: (Mn_p201534 $e0)
(Member $e0 walk)

;; p201535  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000322 tierB-000615 tierB-000677
;;   meta-node: (Mn_p201535 $x0)
(Member $x0 garden)

;; p201536  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000149 tierB-000767 tierB-000836
;;   meta-node: (Mn_p201536 $x0)
(Member $x0 hotel)

;; p201537  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000456 tierB-000722 tierB-000937
;;   meta-node: (Mn_p201537 $x0)
(Member $x0 sky)

;; p201538  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000768 tierB-001156 tierB-001556
;;   meta-node: (Mn_p201538 $x0)
(Member $x0 song)

;; p201545  support 7 (occ 7)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001887
;;   meta-node: (Mn_p201545 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))

;; p201772  support 7 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000412 tierB-001197
;;   meta-node: (Mn_p201772 $e0 $x0)
(And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))

;; p201813  support 7 (occ 7)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-001685 tierC-000181 tierC-000182
;;   meta-node: (Mn_p201813 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child))

;; p201820  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000255 tierB-000277
;;   meta-node: (Mn_p201820 $e0)
(And (Member $e0 come) (Past $e0))

;; p201821  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000609 tierB-000779
;;   meta-node: (Mn_p201821 $e0 $x0)
(And (Member $e0 fall) (Patient $e0 $x0))

;; p201822  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-001139
;;   meta-node: (Mn_p201822 $e0 $x0)
(And (Member $e0 find) (Theme $e0 $x0))

;; p201825  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000173 tierB-000325 tierB-000951
;;   meta-node: (Mn_p201825 $e0)
(And (Member $e0 make) (Ongoing $e0))

;; p201827  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-000302 tierB-001487
;;   meta-node: (Mn_p201827 $e0 $x0)
(And (Member $e0 open) (Patient $e0 $x0))

;; p201829  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000309 tierB-000942
;;   meta-node: (Mn_p201829 $e0)
(And (Member $e0 take) (Past $e0))

;; p201830  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000324 tierB-000805
;;   meta-node: (Mn_p201830 $e0)
(And (Member $e0 walk) (Past $e0))

;; p201869  support 7 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-000622 tierB-001271
;;   meta-node: (Mn_p201869 $x0 $x1)
(From $x0 $x1)

;; p201871  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-000858
;;   meta-node: (Mn_p201871 $e0)
(Member $e0 help)

;; p201872  support 7 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000827 tierB-001156 tierB-001901
;;   meta-node: (Mn_p201872 $e0)
(Member $e0 sing)

;; p201873  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
;;   meta-node: (Mn_p201873 $e0)
(Member $e0 turn)

;; p201874  support 7 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000250 tierB-000626 tierB-000846
;;   meta-node: (Mn_p201874 $e0)
(Member $e0 want)

;; p201875  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierB-000730 tierB-001345
;;   meta-node: (Mn_p201875 $e0)
(Member $e0 win)

;; p201877  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000009 tierB-000368 tierB-000403
;;   meta-node: (Mn_p201877 $x0)
(Member $x0 food)

;; p201878  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000569 tierB-001239 tierB-001331
;;   meta-node: (Mn_p201878 $x0)
(Member $x0 park)

;; p201879  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000408 tierB-000739 tierB-001058
;;   meta-node: (Mn_p201879 $x0)
(Member $x0 town)

;; p201880  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000032 tierB-000618 tierB-000650
;;   meta-node: (Mn_p201880 $x0)
(Member $x0 water)

;; p201891  support 6 (occ 10)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   meta-node: (Mn_p201891 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))

;; p201892  support 6 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000858 tierB-000942 tierB-001697
;;   meta-node: (Mn_p201892 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p201893  support 6 (occ 8)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001394
;;   meta-node: (Mn_p201893 $e1 $e0 $x0)
(And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))

;; p202114  support 6 (occ 10)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierC-000045 tierC-000046
;;   meta-node: (Mn_p202114 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))

;; p202191  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000277 tierB-000387
;;   meta-node: (Mn_p202191 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 come))

;; p202192  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierB-000584 tierC-000095
;;   meta-node: (Mn_p202192 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 follow))

;; p202193  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000268 tierB-000850 tierB-001098
;;   meta-node: (Mn_p202193 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 use))

;; p202207  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000906 tierB-001568 tierB-001812
;;   meta-node: (Mn_p202207 $e0)
(And (Member $e0 bear) (Past $e0))

;; p202208  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
;;   meta-node: (Mn_p202208 $e0)
(And (Member $e0 capture) (Past $e0))

;; p202210  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000609 tierB-000779
;;   meta-node: (Mn_p202210 $e0)
(And (Member $e0 fall) (Past $e0))

;; p202211  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-000706
;;   meta-node: (Mn_p202211 $e0)
(And (Member $e0 find) (Past $e0))

;; p202212  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000577 tierB-000672 tierB-000890
;;   meta-node: (Mn_p202212 $e0)
(And (Member $e0 get) (Past $e0))

;; p202213  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001035 tierB-001595
;;   meta-node: (Mn_p202213 $e0)
(And (Member $e0 receive) (Past $e0))

;; p202214  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
;;   meta-node: (Mn_p202214 $e0 $x0)
(And (Member $e0 turn) (Patient $e0 $x0))

;; p202215  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000419 tierB-000867 tierB-001515
;;   meta-node: (Mn_p202215 $e0)
(And (Member $e0 work) (Past $e0))

;; p202278  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000387 tierB-000656 tierB-000712
;;   meta-node: (Mn_p202278 $x0)
(GroupOf $x0 student)

;; p202280  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-001132 tierC-000227
;;   meta-node: (Mn_p202280 $e0)
(Member $e0 add)

;; p202283  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001089
;;   meta-node: (Mn_p202283 $e0)
(Member $e0 cause)

;; p202284  support 6 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000079 tierB-000188 tierB-000218
;;   meta-node: (Mn_p202284 $e0)
(Member $e0 close)

;; p202285  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001087 tierC-000010 tierC-000091
;;   meta-node: (Mn_p202285 $e0)
(Member $e0 direct)

;; p202286  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001236 tierB-001520 tierB-001721
;;   meta-node: (Mn_p202286 $e0)
(Member $e0 do)

;; p202287  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000163 tierB-000450 tierB-000556
;;   meta-node: (Mn_p202287 $e0)
(Member $e0 enter)

;; p202288  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000040 tierB-000105 tierB-001086
;;   meta-node: (Mn_p202288 $e0)
(Member $e0 lead)

;; p202289  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001683
;;   meta-node: (Mn_p202289 $e0)
(Member $e0 present)

;; p202291  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000178 tierB-000339 tierB-001153
;;   meta-node: (Mn_p202291 $e0)
(Member $e0 run)

;; p202292  support 6 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000053 tierB-000271 tierB-001068
;;   meta-node: (Mn_p202292 $e0)
(Member $e0 speak)

;; p202293  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-000651
;;   meta-node: (Mn_p202293 $e0)
(Member $e0 watch)

;; p202294  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000305 tierB-000337 tierB-000340
;;   meta-node: (Mn_p202294 $x0)
(Member $x0 boy)

;; p202295  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000160 tierB-001021 tierB-001114
;;   meta-node: (Mn_p202295 $x0)
(Member $x0 child)

;; p202296  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000520 tierB-001302 tierC-000017
;;   meta-node: (Mn_p202296 $x0)
(Member $x0 family)

;; p202297  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000687 tierB-000792 tierB-000798
;;   meta-node: (Mn_p202297 $x0)
(Member $x0 floor)

;; p202298  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000145 tierB-000383 tierB-000981
;;   meta-node: (Mn_p202298 $x0)
(Member $x0 horse)

;; p202301  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000561 tierB-000685 tierB-000708
;;   meta-node: (Mn_p202301 $x0)
(Member $x0 light)

;; p202302  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000520 tierB-001253 tierB-001555
;;   meta-node: (Mn_p202302 $x0)
(Member $x0 movie)

;; p202303  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000180 tierB-000498 tierB-000841
;;   meta-node: (Mn_p202303 $x0)
(Member $x0 rain)

;; p202304  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000297 tierB-000546 tierB-000782
;;   meta-node: (Mn_p202304 $x0)
(Member $x0 school)

;; p202305  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000805 tierB-000951 tierB-001384
;;   meta-node: (Mn_p202305 $x0)
(Member $x0 sound)

;; p202306  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000202 tierB-000882 tierB-001111
;;   meta-node: (Mn_p202306 $x0)
(Member $x0 street)

;; p202307  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000116 tierB-001317 tierB-001706
;;   meta-node: (Mn_p202307 $x0)
(Member $x0 village)

;; p202308  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000261 tierB-000343 tierB-000560
;;   meta-node: (Mn_p202308 $x0)
(Member $x0 wall)

;; p202310  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000090 tierB-000108 tierB-001275
;;   meta-node: (Mn_p202310 $x0)
(Member $x0 world)

;; p202335  support 5 (occ 7)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   meta-node: (Mn_p202335 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))

;; p202336  support 5 (occ 9)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierC-000045 tierC-000046
;;   meta-node: (Mn_p202336 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))

;; p202342  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
;;   meta-node: (Mn_p202342 $e0 $e1 $x0)
(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202725  support 5 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   meta-node: (Mn_p202725 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))

;; p202726  support 5 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001582 tierC-000001 tierC-000158
;;   meta-node: (Mn_p202726 $e0 $e1 $x0)
(And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p202760  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000277 tierB-000387
;;   meta-node: (Mn_p202760 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 come) (Past $e0))

;; p202761  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000584 tierC-000095 tierC-000096
;;   meta-node: (Mn_p202761 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1))

;; p202773  support 5 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierC-000279 tierC-000280
;;   meta-node: (Mn_p202773 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $e0 find) (Theme $e0 $x1))

;; p202775  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
;;   meta-node: (Mn_p202775 $e0 $x0)
(And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))

;; p202776  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000609 tierB-000779 tierB-001306
;;   meta-node: (Mn_p202776 $e0 $x0)
(And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))

;; p202777  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000964 tierB-001339
;;   meta-node: (Mn_p202777 $e0 $x0)
(And (Member $e0 make) (Past $e0) (Patient $e0 $x0))

;; p202852  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-001089 tierB-001283
;;   meta-node: (Mn_p202852 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 cause))

;; p202854  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierB-000648 tierB-001125
;;   meta-node: (Mn_p202854 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 play))

;; p202855  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001156 tierB-001901 tierC-000127
;;   meta-node: (Mn_p202855 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 sing))

;; p202856  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000225 tierB-000710 tierB-001984
;;   meta-node: (Mn_p202856 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 study))

;; p202858  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001205
;;   meta-node: (Mn_p202858 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 watch))

;; p202864  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001003 tierB-001334 tierB-001753
;;   meta-node: (Mn_p202864 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 sleep))

;; p202874  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000454 tierB-000768
;;   meta-node: (Mn_p202874 $e0 $x0)
(And (Member $e0 contain) (Theme $e0 $x0))

;; p202877  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   meta-node: (Mn_p202877 $e0)
(And (Member $e0 draw) (Past $e0))

;; p202878  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierC-000076 tierC-000095
;;   meta-node: (Mn_p202878 $e0)
(And (Member $e0 follow) (Past $e0))

;; p202880  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001185
;;   meta-node: (Mn_p202880 $e0)
(And (Member $e0 get) (Ongoing $e0))

;; p202883  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000298 tierB-000425 tierB-000704
;;   meta-node: (Mn_p202883 $e0)
(And (Member $e0 leave) (Past $e0))

;; p202888  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000178 tierB-001153 tierB-001563
;;   meta-node: (Mn_p202888 $e0)
(And (Member $e0 run) (Past $e0))

;; p202889  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000326 tierB-000784 tierB-000975
;;   meta-node: (Mn_p202889 $e0 $x0)
(And (Member $e0 sell) (Theme $e0 $x0))

;; p202890  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000827 tierB-001156 tierB-001901
;;   meta-node: (Mn_p202890 $e0)
(And (Member $e0 sing) (Past $e0))

;; p202891  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001334 tierB-001753
;;   meta-node: (Mn_p202891 $e0)
(And (Member $e0 sleep) (Ongoing $e0))

;; p202892  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-000712 tierB-001299
;;   meta-node: (Mn_p202892 $e0)
(And (Member $e0 stand) (Past $e0))

;; p202893  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000203 tierB-000225 tierB-001084
;;   meta-node: (Mn_p202893 $e0)
(And (Member $e0 study) (Ongoing $e0))

;; p202894  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
;;   meta-node: (Mn_p202894 $e0)
(And (Member $e0 turn) (Past $e0))

;; p202970  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000295 tierB-000705 tierB-000959
;;   meta-node: (Mn_p202970 $x0)
(GroupOf $x0 book)

;; p202971  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001316 tierB-001457 tierB-001530
;;   meta-node: (Mn_p202971 $x0)
(GroupOf $x0 boy)

;; p202972  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000207 tierB-001260 tierB-001730
;;   meta-node: (Mn_p202972 $x0)
(GroupOf $x0 city)

;; p202973  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001252 tierB-001284 tierB-001697
;;   meta-node: (Mn_p202973 $x0)
(GroupOf $x0 cloud)

;; p202974  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000085 tierB-000615 tierB-001450
;;   meta-node: (Mn_p202974 $x0)
(GroupOf $x0 flower)

;; p202976  support 5 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001940 tierC-000050 tierC-000128
;;   meta-node: (Mn_p202976 $e0)
(Member $e0 appear)

;; p202980  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000410 tierB-000616
;;   meta-node: (Mn_p202980 $e0)
(Member $e0 eat)

;; p202981  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000780 tierC-000163 tierC-000164
;;   meta-node: (Mn_p202981 $e0)
(Member $e0 form)

;; p202982  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000297 tierB-000831
;;   meta-node: (Mn_p202982 $e0)
(Member $e0 look)

;; p202984  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-001260 tierB-001262
;;   meta-node: (Mn_p202984 $e0)
(Member $e0 provide)

;; p202985  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001441
;;   meta-node: (Mn_p202985 $e0)
(Member $e0 say)

;; p202987  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000125 tierB-000792
;;   meta-node: (Mn_p202987 $e0)
(Member $e0 stop)

;; p202988  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000313 tierB-000782 tierB-001008
;;   meta-node: (Mn_p202988 $e0)
(Member $e0 swim)

;; p202989  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000434 tierB-000667 tierB-000830
;;   meta-node: (Mn_p202989 $e0)
(Member $e0 travel)

;; p202990  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000302 tierB-000931 tierB-001435
;;   meta-node: (Mn_p202990 $x0)
(Member $x0 bank)

;; p202991  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000476 tierB-000541 tierB-001509
;;   meta-node: (Mn_p202991 $x0)
(Member $x0 black)

;; p202993  support 5 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000475 tierB-000541
;;   meta-node: (Mn_p202993 $x0)
(Member $x0 box)

;; p202994  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000081 tierB-000912 tierB-001821
;;   meta-node: (Mn_p202994 $x0)
(Member $x0 corner)

;; p202995  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000505 tierB-001017 tierB-001295
;;   meta-node: (Mn_p202995 $x0)
(Member $x0 film)

;; p202996  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000838 tierB-000890 tierB-000922
;;   meta-node: (Mn_p202996 $x0)
(Member $x0 fire)

;; p202997  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000233 tierB-000369 tierB-000386
;;   meta-node: (Mn_p202997 $x0)
(Member $x0 fridge)

;; p202999  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000548 tierB-001800 tierB-001885
;;   meta-node: (Mn_p202999 $x0)
(Member $x0 government)

;; p203000  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000122 tierB-000608 tierB-000728
;;   meta-node: (Mn_p203000 $x0)
(Member $x0 language)

;; p203001  support 5 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001120 tierB-001383
;;   meta-node: (Mn_p203001 $x0)
(Member $x0 line)

;; p203002  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000646 tierB-001152 tierB-001381
;;   meta-node: (Mn_p203002 $x0)
(Member $x0 party)

;; p203003  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000238 tierB-000808 tierB-000900
;;   meta-node: (Mn_p203003 $x0)
(Member $x0 train)

;; p203004  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000138 tierB-001190 tierB-001459
;;   meta-node: (Mn_p203004 $x0)
(Member $x0 way)

;; p203005  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000062 tierB-001163 tierB-001306
;;   meta-node: (Mn_p203005 $x0)
(Member $x0 wind)

;; p203006  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000879 tierB-001389 tierB-001980
;;   meta-node: (Mn_p203006 $x0)
(Member $x0 work)

;; p203007  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000409 tierB-001070 tierB-001262
;;   meta-node: (Mn_p203007 $x0 $x1)
(Of $x0 $x1)

;; p203014  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000081 tierB-000913 tierB-001673
;;   meta-node: (Mn_p203014 $x0 $x1)
(To $x0 $x1)

;; p203015  support 5 (occ 5)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000224 tierB-000439 tierB-000726
;;   meta-node: (Mn_p203015 $e0)
(Yet $e0)

;; p203046  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000688 tierC-000001 tierC-000121
;;   meta-node: (Mn_p203046 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0) (Past $e1))

;; p203056  support 4 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierB-001933 tierC-000025
;;   meta-node: (Mn_p203056 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1))

;; p203068  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   meta-node: (Mn_p203068 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))

;; p203078  support 4 (occ 6)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001773 tierC-000025
;;   meta-node: (Mn_p203078 $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))

;; p203082  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001412 tierC-000181
;;   meta-node: (Mn_p203082 $e0 $x0)
(And (Cardinality $x0 <num>) (Member $e0 have) (Past $e0) (Theme $e0 $x0))

;; p203089  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203089 $e0 $x0)
(And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p203096  support 4 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000279 tierC-000280 tierC-000313
;;   meta-node: (Mn_p203096 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $e0 find) (Member $x1 thing) (Theme $e0 $x1))

;; p203107  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203107 $e0 $x0)
(And (Member $e0 build) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p203113  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203113 $e0 $x0)
(And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p203116  support 4 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000047 tierC-000048 tierC-000235
;;   meta-node: (Mn_p203116 $e0 $x0 $x1)
(And (Member $x0 person) (Past $e0) (Possession $x1 $x0) (Theme $e0 $x1))

;; p203120  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203120 $e0 $x0)
(And (Member republican_party party) (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203733  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000393 tierB-000412 tierC-000353
;;   meta-node: (Mn_p203733 $e0 $x0)
(And (GroupOf $x0 person) (Member $e0 kill) (Patient $e0 $x0))

;; p203750  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-001487 tierB-001523
;;   meta-node: (Mn_p203750 $e0 $x0)
(And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))

;; p203755  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000121
;;   meta-node: (Mn_p203755 $x0 $x1)
(And (Member $x0 family) (Member $x1 person) (Possession $x0 $x1))

;; p204178  support 4 (occ 4)  size 1  root Married (constant)  depth 0
;;   e.g. tierC-000079 tierC-000080 tierC-000335
;;   meta-node: (Mn_p204178 Married)
(Symmetric Married)

;; p204217  support 4 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000291 tierB-001649 tierC-000353
;;   meta-node: (Mn_p204217 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0) (Patient $e0 $x2))

;; p204221  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001197 tierB-001399 tierC-000353
;;   meta-node: (Mn_p204221 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 kill) (Past $e0) (Patient $e0 $x1))

;; p204283  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   meta-node: (Mn_p204283 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))

;; p204286  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001156 tierB-001901 tierC-000127
;;   meta-node: (Mn_p204286 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 sing) (Past $e0))

;; p204289  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
;;   meta-node: (Mn_p204289 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))

;; p204296  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001334 tierB-001753 tierB-001891
;;   meta-node: (Mn_p204296 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))

;; p204313  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000658 tierB-001251 tierC-000111
;;   meta-node: (Mn_p204313 $e0 $x0)
(And (Member $e0 discover) (Past $e0) (Theme $e0 $x0))

;; p204317  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-001487 tierC-000285
;;   meta-node: (Mn_p204317 $e0 $x0)
(And (Member $e0 open) (Past $e0) (Patient $e0 $x0))

;; p204320  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
;;   meta-node: (Mn_p204320 $e0 $x0)
(And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))

;; p204461  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-001132 tierC-000227
;;   meta-node: (Mn_p204461 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 add))

;; p204463  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000410 tierB-001551
;;   meta-node: (Mn_p204463 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 eat))

;; p204464  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000121 tierB-000801
;;   meta-node: (Mn_p204464 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 fly))

;; p204468  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-001260 tierB-001262
;;   meta-node: (Mn_p204468 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 provide))

;; p204485  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000556 tierB-001266 tierC-000353
;;   meta-node: (Mn_p204485 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 person))

;; p204492  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000174 tierB-000339 tierB-000455
;;   meta-node: (Mn_p204492 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 need))

;; p204505  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000615 tierB-000760 tierB-001208
;;   meta-node: (Mn_p204505 $x0 $x1)
(And (LocatedIn $x0 $x1) (Member $x1 garden))

;; p204516  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-001132 tierC-000231
;;   meta-node: (Mn_p204516 $e0 $x0)
(And (Member $e0 add) (Theme $e0 $x0))

;; p204521  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
;;   meta-node: (Mn_p204521 $e0)
(And (Member $e0 cause) (Past $e0))

;; p204522  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-001217 tierB-001803
;;   meta-node: (Mn_p204522 $e0)
(And (Member $e0 change) (Past $e0))

;; p204523  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000177 tierC-000284 tierC-000341
;;   meta-node: (Mn_p204523 $e0)
(And (Member $e0 conduct) (Past $e0))

;; p204525  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000838 tierB-001967 tierC-000199
;;   meta-node: (Mn_p204525 $e0 $x0)
(And (Member $e0 die) (Patient $e0 $x0))

;; p204529  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001520 tierB-001721 tierB-001735
;;   meta-node: (Mn_p204529 $e0 $x0)
(And (Member $e0 do) (Patient $e0 $x0))

;; p204532  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000649 tierB-001008 tierB-001762
;;   meta-node: (Mn_p204532 $e0)
(And (Member $e0 pass) (Past $e0))

;; p204534  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000099 tierC-000100 tierC-000359
;;   meta-node: (Mn_p204534 $e0)
(And (Member $e0 replace) (Past $e0))

;; p204535  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000607 tierB-001436 tierB-001566
;;   meta-node: (Mn_p204535 $e0 $x0)
(And (Member $e0 require) (Theme $e0 $x0))

;; p204536  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001441
;;   meta-node: (Mn_p204536 $e0)
(And (Member $e0 say) (Past $e0))

;; p204537  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierC-000023 tierC-000024
;;   meta-node: (Mn_p204537 $e0)
(And (Member $e0 speak) (Past $e0))

;; p204538  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000125 tierB-001515
;;   meta-node: (Mn_p204538 $e0)
(And (Member $e0 stop) (Past $e0))

;; p204539  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000253 tierB-000292 tierC-000253
;;   meta-node: (Mn_p204539 $e0)
(And (Member $e0 study) (Past $e0))

;; p204541  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000469 tierB-000487
;;   meta-node: (Mn_p204541 $e0)
(And (Member $e0 try) (Ongoing $e0))

;; p204544  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
;;   meta-node: (Mn_p204544 $e0)
(And (Member $e0 walk) (Ongoing $e0))

;; p204688  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000407 tierB-000518 tierB-000604
;;   meta-node: (Mn_p204688 $x0)
(Degree $x0 quantity excessive)

;; p204693  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000463 tierB-000513 tierB-001553
;;   meta-node: (Mn_p204693 $x0)
(GroupOf $x0 day)

;; p204694  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000066 tierB-000267 tierB-000550
;;   meta-node: (Mn_p204694 $x0)
(GroupOf $x0 friend)

;; p204695  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000738 tierB-000814
;;   meta-node: (Mn_p204695 $x0)
(GroupOf $x0 girl)

;; p204696  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000098 tierB-000832 tierB-001246
;;   meta-node: (Mn_p204696 $x0)
(GroupOf $x0 leaf)

;; p204697  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000243 tierB-000277 tierB-001068
;;   meta-node: (Mn_p204697 $x0)
(GroupOf $x0 man)

;; p204698  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000194 tierB-000794 tierB-001080
;;   meta-node: (Mn_p204698 $x0)
(GroupOf $x0 pupil)

;; p204699  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000225 tierB-000533 tierB-001251
;;   meta-node: (Mn_p204699 $x0)
(GroupOf $x0 scientist)

;; p204700  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000274 tierB-001058 tierB-001695
;;   meta-node: (Mn_p204700 $x0)
(GroupOf $x0 soldier)

;; p204703  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000518 tierB-000972 tierB-001495
;;   meta-node: (Mn_p204703 $x0)
(LocatedIn $x0 here)

;; p204709  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000444 tierB-001440
;;   meta-node: (Mn_p204709 $e0)
(Member $e0 arrive)

;; p204710  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000171 tierB-000246 tierB-000674
;;   meta-node: (Mn_p204710 $e0)
(Member $e0 avoid)

;; p204712  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000427 tierB-000636 tierB-001013
;;   meta-node: (Mn_p204712 $e0)
(Member $e0 bring)

;; p204715  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-001071 tierC-000037
;;   meta-node: (Mn_p204715 $e0)
(Member $e0 connect)

;; p204716  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001300 tierB-001863 tierC-000233
;;   meta-node: (Mn_p204716 $e0)
(Member $e0 consider)

;; p204717  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000702 tierB-000809 tierB-001166
;;   meta-node: (Mn_p204717 $e0)
(Member $e0 cover)

;; p204718  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000502 tierB-000738
;;   meta-node: (Mn_p204718 $e0)
(Member $e0 cry)

;; p204723  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000999 tierB-001238
;;   meta-node: (Mn_p204723 $e0)
(Member $e0 good)

;; p204724  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000087 tierB-001363 tierB-001708
;;   meta-node: (Mn_p204724 $e0)
(Member $e0 happen)

;; p204725  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000378 tierB-001266 tierC-000283
;;   meta-node: (Mn_p204725 $e0)
(Member $e0 hold)

;; p204726  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   meta-node: (Mn_p204726 $e0)
(Member $e0 increase)

;; p204728  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000236 tierB-000795 tierC-000161
;;   meta-node: (Mn_p204728 $e0)
(Member $e0 lose)

;; p204729  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001570 tierC-000197
;;   meta-node: (Mn_p204729 $e0)
(Member $e0 move)

;; p204731  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000044 tierB-000168 tierB-000916
;;   meta-node: (Mn_p204731 $e0)
(Member $e0 ready)

;; p204734  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000883 tierB-001146 tierC-000047
;;   meta-node: (Mn_p204734 $e0)
(Member $e0 spend)

;; p204735  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000742 tierB-000745 tierC-000035
;;   meta-node: (Mn_p204735 $e0)
(Member $e0 tell)

;; p204736  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000624 tierB-001536 tierB-001621
;;   meta-node: (Mn_p204736 $e0)
(Member $e0 war)

;; p204737  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001787 tierB-001868 tierC-000087
;;   meta-node: (Mn_p204737 $e0)
(Member $e0 welcome)

;; p204738  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000376 tierB-000678 tierB-001503
;;   meta-node: (Mn_p204738 $x0)
(Member $x0 beauty)

;; p204739  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000712 tierB-001430 tierB-001528
;;   meta-node: (Mn_p204739 $x0)
(Member $x0 bus)

;; p204740  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000794 tierB-000814 tierB-001612
;;   meta-node: (Mn_p204740 $x0)
(Member $x0 class)

;; p204741  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001867 tierB-001902 tierC-000025
;;   meta-node: (Mn_p204741 $x0)
(Member $x0 community)

;; p204742  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000504 tierB-000849 tierB-001177
;;   meta-node: (Mn_p204742 $x0)
(Member $x0 computer)

;; p204743  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000207 tierB-001546 tierB-001928
;;   meta-node: (Mn_p204743 $x0)
(Member $x0 country)

;; p204744  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001052 tierB-001108 tierB-001169
;;   meta-node: (Mn_p204744 $x0)
(Member $x0 crowd)

;; p204745  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000049 tierB-000339 tierB-000666
;;   meta-node: (Mn_p204745 $x0)
(Member $x0 doctor)

;; p204749  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000319 tierB-000783 tierB-001280
;;   meta-node: (Mn_p204749 $x0)
(Member $x0 girl)

;; p204751  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000176 tierB-000474 tierB-001308
;;   meta-node: (Mn_p204751 $x0)
(Member $x0 ground)

;; p204752  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001357 tierB-001525 tierC-000109
;;   meta-node: (Mn_p204752 $x0)
(Member $x0 group)

;; p204753  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000394 tierB-001234 tierB-001246
;;   meta-node: (Mn_p204753 $x0)
(Member $x0 ivy)

;; p204754  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001114 tierB-001208 tierB-001480
;;   meta-node: (Mn_p204754 $x0)
(Member $x0 lady)

;; p204756  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000938 tierB-001996 tierC-000315
;;   meta-node: (Mn_p204756 $x0)
(Member $x0 machine)

;; p204757  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000119 tierB-000244 tierB-000574
;;   meta-node: (Mn_p204757 $x0)
(Member $x0 matter)

;; p204758  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000141 tierB-000524 tierB-001257
;;   meta-node: (Mn_p204758 $x0)
(Member $x0 middle)

;; p204760  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000567 tierB-000932 tierB-000992
;;   meta-node: (Mn_p204760 $x0)
(Member $x0 original)

;; p204762  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000358 tierB-001462 tierC-000227
;;   meta-node: (Mn_p204762 $x0)
(Member $x0 personality)

;; p204763  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000876 tierB-001070 tierB-001077
;;   meta-node: (Mn_p204763 $x0)
(Member $x0 picture)

;; p204764  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000045 tierB-000132 tierB-000298
;;   meta-node: (Mn_p204764 $x0)
(Member $x0 plane)

;; p204766  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000095 tierC-000096 tierC-000223
;;   meta-node: (Mn_p204766 $x0)
(Member $x0 region)

;; p204767  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000416 tierB-000468 tierB-000470
;;   meta-node: (Mn_p204767 $x0)
(Member $x0 river)

;; p204768  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000134 tierB-000767 tierB-001296
;;   meta-node: (Mn_p204768 $x0)
(Member $x0 sea)

;; p204769  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000100 tierB-000605 tierB-000835
;;   meta-node: (Mn_p204769 $x0)
(Member $x0 ship)

;; p204770  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000154 tierB-000383 tierB-000445
;;   meta-node: (Mn_p204770 $x0)
(Member $x0 snow)

;; p204772  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000218 tierB-000324 tierB-001044
;;   meta-node: (Mn_p204772 $x0)
(Member $x0 store)

;; p204773  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000825 tierB-001218 tierB-001838
;;   meta-node: (Mn_p204773 $x0)
(Member $x0 sun)

;; p204774  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000932 tierB-001134 tierB-001447
;;   meta-node: (Mn_p204774 $x0)
(Member $x0 system)

;; p204776  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001204 tierB-001324 tierB-001444
;;   meta-node: (Mn_p204776 $x0)
(Member $x0 war)

;; p204778  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000265 tierB-000984 tierB-001161
;;   meta-node: (Mn_p204778 $x0)
(Member $x0 windshield)

;; p204783  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000124 tierB-000196 tierB-000723
;;   meta-node: (Mn_p204783 $x0 $x1)
(ProportionOf $x0 $x1 some)

;; p204839  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001251 tierB-001693 tierB-001762
;;   meta-node: (Mn_p204839 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))

;; p204845  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierC-000123 tierC-000124
;;   meta-node: (Mn_p204845 $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e1) (Theme $e0 $x1) (To $e1 $e0))

;; p204848  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierC-000001 tierC-000002
;;   meta-node: (Mn_p204848 $e0 $e1 $x0)
(And (Before $e0 $e1) (Past $e0) (Past $e1) (Patient $e0 $x0))

;; p204849  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
;;   meta-node: (Mn_p204849 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))

;; p204850  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000838 tierC-000353 tierC-000354
;;   meta-node: (Mn_p204850 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Location $e0 $x1) (Past $e0) (Patient $e0 $x0))

;; p204864  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204864 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e1 portray) (Past $e0) (Theme $e0 $x0))

;; p204865  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000412 tierC-000353 tierC-000354
;;   meta-node: (Mn_p204865 $e0 $x0)
(And (GroupOf $x0 person) (Member $e0 kill) (Past $e0) (Patient $e0 $x0))

;; p204883  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p204883 $e1 $e0 $x0 $x1)
(And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0))

;; p204890  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p204890 $e0 $x0)
(And (Location $e0 eskisehir) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p204894  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000199 tierC-000200 tierC-000358
;;   meta-node: (Mn_p204894 $e0 $x0)
(And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0))

;; p204896  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001394 tierC-000025 tierC-000026
;;   meta-node: (Mn_p204896 $e0 $e1 $x0)
(And (Member $e0 begin) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p204901  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
;;   meta-node: (Mn_p204901 $e0 $e1 $x0)
(And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p204902  support 3 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   meta-node: (Mn_p204902 $e0 $e1)
(And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))

;; p204903  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
;;   meta-node: (Mn_p204903 $e0 $e1 $x0)
(And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p204913  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204913 $e0 $x0 $x1)
(And (Possession $x0 free_soil_party) (Possession $x1 republican_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p205988  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000648 tierB-001125 tierB-001433
;;   meta-node: (Mn_p205988 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))

;; p206033  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001003 tierC-000041 tierC-000042
;;   meta-node: (Mn_p206033 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 sleep) (Member $x0 couch))

;; p206419  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-001573 tierB-001670 tierB-001938
;;   meta-node: (Mn_p206419 $x0)
(And (Inheritance living_room room) (Member $x0 living_room))

;; p206590  support 3 (occ 3)  size 1  root dung_beetle (constant)  depth 1
;;   e.g. tierB-000059 tierB-001735 tierB-001833
;;   meta-node: (Mn_p206590 dung_beetle)
(Inheritance dung_beetle beetle)

;; p206645  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   meta-node: (Mn_p206645 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))

;; p206651  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   meta-node: (Mn_p206651 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1))

;; p206652  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   meta-node: (Mn_p206652 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))

;; p206653  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   meta-node: (Mn_p206653 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 spend) (Past $e0) (Theme $e0 $x1))

;; p206654  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   meta-node: (Mn_p206654 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 write) (Past $e0) (Patient $e0 $x1))

;; p206655  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierB-001120 tierB-001961
;;   meta-node: (Mn_p206655 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Ongoing $e0) (Past $e0) (Theme $e0 $x1))

;; p206658  support 3 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001753
;;   meta-node: (Mn_p206658 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))

;; p206661  support 3 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   meta-node: (Mn_p206661 $e0 $e1 $x0)
(And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p206805  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   meta-node: (Mn_p206805 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 draw) (Past $e0))

;; p206808  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001182 tierB-001457 tierB-001754
;;   meta-node: (Mn_p206808 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))

;; p206815  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001800
;;   meta-node: (Mn_p206815 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1))

;; p206816  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001868 tierC-000087 tierC-000088
;;   meta-node: (Mn_p206816 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 welcome) (Past $e0))

;; p206839  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
;;   meta-node: (Mn_p206839 $e0 $x0)
(And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))

;; p206841  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001575 tierC-000131 tierC-000132
;;   meta-node: (Mn_p206841 $e0 $x0)
(And (Member $e0 compose) (Past $e0) (Patient $e0 $x0))

;; p206844  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000838 tierC-000199 tierC-000200
;;   meta-node: (Mn_p206844 $e0 $x0)
(And (Member $e0 die) (Past $e0) (Patient $e0 $x0))

;; p206845  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
;;   meta-node: (Mn_p206845 $e0 $x0)
(And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))

;; p206847  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-001139
;;   meta-node: (Mn_p206847 $e0 $x0)
(And (Member $e0 find) (Past $e0) (Theme $e0 $x0))

;; p206849  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   meta-node: (Mn_p206849 $e0 $x0)
(And (Member $e0 increase) (Past $e0) (Patient $e0 $x0))

;; p206857  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000469 tierB-000487
;;   meta-node: (Mn_p206857 $e0)
(And (Member $e0 try) (Ongoing $e0) (Past $e0))

;; p207165  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001183 tierB-001496 tierB-001628
;;   meta-node: (Mn_p207165 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 go))

;; p207171  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000550 tierB-001219 tierB-001666
;;   meta-node: (Mn_p207171 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 talk))

;; p207172  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000324 tierB-001219
;;   meta-node: (Mn_p207172 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 walk))

;; p207175  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierB-001813 tierB-001873
;;   meta-node: (Mn_p207175 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 work))

;; p207189  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p207189 $e0)
(And (Agent $e0 jica) (Member $e0 fund))

;; p207202  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-001094
;;   meta-node: (Mn_p207202 $e0)
(And (Can $e0) (Member $e0 help))

;; p207204  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000738 tierB-000814
;;   meta-node: (Mn_p207204 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 girl))

;; p207205  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-001985 tierC-000261 tierC-000262
;;   meta-node: (Mn_p207205 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 way))

;; p207223  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-001418 tierB-001496
;;   meta-node: (Mn_p207223 $e0)
(And (Goal $e0 bed) (Member $e0 go))

;; p207230  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000756 tierC-000343 tierC-000344
;;   meta-node: (Mn_p207230 $x0 $x1)
(And (LocatedIn $x0 $x1) (Member $x0 thing))

;; p207231  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000153 tierB-000546 tierB-000680
;;   meta-node: (Mn_p207231 $x0 $x1)
(And (LocatedIn $x0 $x1) (Member $x1 city))

;; p207233  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000619 tierB-001410 tierB-001492
;;   meta-node: (Mn_p207233 $x0 $x1)
(And (LocatedIn $x0 $x1) (Member $x1 table))

;; p207252  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000444 tierB-001992
;;   meta-node: (Mn_p207252 $e0)
(And (Member $e0 arrive) (Past $e0))

;; p207253  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000246 tierB-000674 tierC-000124
;;   meta-node: (Mn_p207253 $e0 $x0)
(And (Member $e0 avoid) (Theme $e0 $x0))

;; p207254  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000182 tierB-001048 tierB-001394
;;   meta-node: (Mn_p207254 $e0 $x0)
(And (Member $e0 begin) (Patient $e0 $x0))

;; p207255  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001641 tierB-001694
;;   meta-node: (Mn_p207255 $e0)
(And (Member $e0 break_out) (Past $e0))

;; p207256  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000427 tierB-000636 tierC-000351
;;   meta-node: (Mn_p207256 $e0)
(And (Member $e0 bring) (Past $e0))

;; p207260  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000677 tierB-001697 tierB-001949
;;   meta-node: (Mn_p207260 $e0 $x0)
(And (Member $e0 come) (Patient $e0 $x0))

;; p207261  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000677 tierB-001774 tierB-001949
;;   meta-node: (Mn_p207261 $e0 $x0)
(And (Member $e0 come) (Source $e0 $x0))

;; p207266  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001149 tierC-000261 tierC-000262
;;   meta-node: (Mn_p207266 $e0 $x0)
(And (Member $e0 define) (Theme $e0 $x0))

;; p207272  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000456 tierB-001905
;;   meta-node: (Mn_p207272 $e0)
(And (Member $e0 fall) (Ongoing $e0))

;; p207274  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000780 tierC-000179 tierC-000180
;;   meta-node: (Mn_p207274 $e0)
(And (Member $e0 form) (Past $e0))

;; p207278  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000858 tierB-001094
;;   meta-node: (Mn_p207278 $e0)
(And (Member $e0 help) (Past $e0))

;; p207279  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000378 tierC-000283 tierC-000284
;;   meta-node: (Mn_p207279 $e0 $x0)
(And (Member $e0 hold) (Patient $e0 $x0))

;; p207280  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000329 tierB-000692 tierB-001801
;;   meta-node: (Mn_p207280 $e0)
(And (Member $e0 hold_up) (Past $e0))

;; p207283  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000258 tierC-000351
;;   meta-node: (Mn_p207283 $e0)
(And (Member $e0 influence) (Past $e0))

;; p207288  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000334 tierB-001040 tierB-001072
;;   meta-node: (Mn_p207288 $e0)
(And (Member $e0 pick_up) (Past $e0))

;; p207295  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000935 tierB-001202 tierB-001970
;;   meta-node: (Mn_p207295 $e0 $x0)
(And (Member $e0 solve) (Patient $e0 $x0))

;; p207303  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000700 tierC-000017 tierC-000018
;;   meta-node: (Mn_p207303 $e0)
(And (Member $e0 suggest) (Past $e0))

;; p207304  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001234 tierC-000109 tierC-000110
;;   meta-node: (Mn_p207304 $e0)
(And (Member $e0 take_over) (Past $e0))

;; p207305  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000327 tierB-000550 tierB-001666
;;   meta-node: (Mn_p207305 $e0)
(And (Member $e0 talk) (Past $e0))

;; p207307  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-000995 tierB-001618
;;   meta-node: (Mn_p207307 $e0)
(And (Member $e0 travel) (Past $e0))

;; p207308  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000651 tierB-001720 tierB-001800
;;   meta-node: (Mn_p207308 $e0)
(And (Member $e0 watch) (Past $e0))

;; p207311  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000212 tierC-000079
;;   meta-node: (Mn_p207311 $e0)
(And (Member $e0 work) (Ongoing $e0))

;; p207313  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000937 tierB-001124 tierB-001940
;;   meta-node: (Mn_p207313 $x0)
(And (Member $x0 blue) (Member $x0 sky))

;; p207316  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000048 tierC-000115 tierC-000116
;;   meta-node: (Mn_p207316 $x0)
(And (Member $x0 house) (Member $x0 large))

;; p207324  support 3 (occ 3)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierB-001223 tierC-000339 tierC-000340
;;   meta-node: (Mn_p207324 $x1 $x0)
(And (Member $x0 thing) (Possession $x1 $x0))

;; p207598  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000335 tierB-000338 tierB-000815
;;   meta-node: (Mn_p207598 $x0)
(GroupOf $x0 cookie)

;; p207599  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000796 tierB-001519 tierB-001955
;;   meta-node: (Mn_p207599 $x0)
(GroupOf $x0 dish)

;; p207600  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001928 tierC-000285 tierC-000286
;;   meta-node: (Mn_p207600 $x0)
(GroupOf $x0 law)

;; p207601  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000120 tierB-000409 tierB-001591
;;   meta-node: (Mn_p207601 $x0)
(GroupOf $x0 measure)

;; p207602  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000193 tierB-000414 tierB-001479
;;   meta-node: (Mn_p207602 $x0)
(GroupOf $x0 noise)

;; p207603  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001351 tierB-001426 tierB-001449
;;   meta-node: (Mn_p207603 $x0)
(GroupOf $x0 question)

;; p207604  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000018 tierB-000913 tierB-001699
;;   meta-node: (Mn_p207604 $x0)
(GroupOf $x0 road)

;; p207605  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000760 tierC-000265 tierC-000266
;;   meta-node: (Mn_p207605 $x0)
(GroupOf $x0 rock)

;; p207606  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000145 tierC-000261 tierC-000262
;;   meta-node: (Mn_p207606 $x0)
(GroupOf $x0 sequence)

;; p207607  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001362 tierC-000127 tierC-000128
;;   meta-node: (Mn_p207607 $x0)
(GroupOf $x0 sister)

;; p207608  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001394 tierB-001632 tierB-001886
;;   meta-node: (Mn_p207608 $x0)
(GroupOf $x0 tree)

;; p207610  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000864 tierB-001295 tierB-001760
;;   meta-node: (Mn_p207610 $x0)
(GroupOf $x0 woman)

;; p207612  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000040 tierB-001616 tierC-000206
;;   meta-node: (Mn_p207612 $x0 $x1)
(In $x0 $x1)

;; p207613  support 3 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001173 tierC-000135 tierC-000136
;;   meta-node: (Mn_p207613 $x0)
(LocatedIn $x0 india)

;; p207619  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000080 tierC-000201 tierC-000202
;;   meta-node: (Mn_p207619 $e0)
(Member $e0 active)

;; p207621  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000345 tierB-000673 tierB-001688
;;   meta-node: (Mn_p207621 $e0)
(Member $e0 attack)

;; p207622  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000464 tierC-000197 tierC-000198
;;   meta-node: (Mn_p207622 $e0)
(Member $e0 bake)

;; p207623  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001605 tierB-001610 tierB-001928
;;   meta-node: (Mn_p207623 $e0)
(Member $e0 base)

;; p207626  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000303 tierC-000133 tierC-000134
;;   meta-node: (Mn_p207626 $e0)
(Member $e0 celebrate)

;; p207627  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000344 tierB-000930 tierB-001735
;;   meta-node: (Mn_p207627 $e0)
(Member $e0 climb)

;; p207631  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000925 tierB-001535 tierB-001648
;;   meta-node: (Mn_p207631 $e0)
(Member $e0 difficult)

;; p207632  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000946 tierB-000993
;;   meta-node: (Mn_p207632 $e0)
(Member $e0 drink)

;; p207634  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000137 tierB-001046 tierC-000111
;;   meta-node: (Mn_p207634 $e0)
(Member $e0 give)

;; p207635  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000228 tierB-001384 tierB-001512
;;   meta-node: (Mn_p207635 $e0)
(Member $e0 grow)

;; p207637  support 3 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000379 tierB-001878 tierC-000139
;;   meta-node: (Mn_p207637 $e0)
(Member $e0 include)

;; p207639  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000689 tierB-001449 tierB-001843
;;   meta-node: (Mn_p207639 $e0)
(Member $e0 know)

;; p207640  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000229 tierB-000282 tierB-000608
;;   meta-node: (Mn_p207640 $e0)
(Member $e0 learn)

;; p207642  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000759 tierB-001149 tierB-001989
;;   meta-node: (Mn_p207642 $e0)
(Member $e0 mean)

;; p207643  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000455 tierC-000293 tierC-000294
;;   meta-node: (Mn_p207643 $e0)
(Member $e0 paint)

;; p207645  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-001120 tierB-001386
;;   meta-node: (Mn_p207645 $e0)
(Member $e0 pull)

;; p207646  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-001082 tierB-001488
;;   meta-node: (Mn_p207646 $e0)
(Member $e0 reach)

;; p207650  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000115 tierB-000686 tierB-000980
;;   meta-node: (Mn_p207650 $e0)
(Member $e0 see)

;; p207651  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001218 tierB-001933 tierB-001977
;;   meta-node: (Mn_p207651 $e0)
(Member $e0 shine)

;; p207652  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000256 tierB-000813 tierB-001813
;;   meta-node: (Mn_p207652 $e0)
(Member $e0 shoot)

;; p207657  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000132 tierB-000147 tierB-001471
;;   meta-node: (Mn_p207657 $e0)
(Member $e0 take_off)

;; p207660  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000114 tierB-000816 tierB-001909
;;   meta-node: (Mn_p207660 $e0)
(Member $e0 understand)

;; p207661  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000712 tierB-001557
;;   meta-node: (Mn_p207661 $e0)
(Member $e0 wait)

;; p207662  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001318 tierB-001396 tierB-001801
;;   meta-node: (Mn_p207662 $e0)
(Member $e0 wear)

;; p207663  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000033 tierB-000692 tierB-001806
;;   meta-node: (Mn_p207663 $x0)
(Member $x0 accident)

;; p207664  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000411 tierB-000913 tierC-000158
;;   meta-node: (Mn_p207664 $x0)
(Member $x0 army)

;; p207665  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000285 tierB-000360 tierB-001043
;;   meta-node: (Mn_p207665 $x0)
(Member $x0 atmosphere)

;; p207666  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000170 tierB-001843 tierB-001964
;;   meta-node: (Mn_p207666 $x0)
(Member $x0 author)

;; p207667  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000103 tierB-000343 tierB-001092
;;   meta-node: (Mn_p207667 $x0)
(Member $x0 ball)

;; p207668  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000221 tierB-001081 tierB-001775
;;   meta-node: (Mn_p207668 $x0)
(Member $x0 beach)

;; p207672  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000676 tierB-001385 tierB-001688
;;   meta-node: (Mn_p207672 $x0)
(Member $x0 building)

;; p207673  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000330 tierB-000619 tierB-001040
;;   meta-node: (Mn_p207673 $x0)
(Member $x0 camera)

;; p207674  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000476 tierB-000687 tierB-001925
;;   meta-node: (Mn_p207674 $x0)
(Member $x0 ceiling)

;; p207675  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000143 tierB-000202 tierB-000739
;;   meta-node: (Mn_p207675 $x0)
(Member $x0 church)

;; p207679  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000387 tierB-000781 tierB-001000
;;   meta-node: (Mn_p207679 $x0)
(Member $x0 concert)

;; p207680  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000462 tierB-000942 tierB-001663
;;   meta-node: (Mn_p207680 $x0)
(Member $x0 cook)

;; p207682  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000251 tierB-001146 tierB-001519
;;   meta-node: (Mn_p207682 $x0)
(Member $x0 day)

;; p207683  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001002 tierB-001053 tierB-001186
;;   meta-node: (Mn_p207683 $x0)
(Member $x0 desk)

;; p207684  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000025 tierB-001455 tierB-001831
;;   meta-node: (Mn_p207684 $x0)
(Member $x0 difference)

;; p207685  support 3 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000285 tierB-001022 tierB-001529
;;   meta-node: (Mn_p207685 $x0)
(Member $x0 different)

;; p207686  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000021 tierB-001587 tierB-001634
;;   meta-node: (Mn_p207686 $x0)
(Member $x0 dress)

;; p207687  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001259 tierB-001322 tierB-001582
;;   meta-node: (Mn_p207687 $x0)
(Member $x0 earth)

;; p207689  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000949 tierB-001232 tierB-001336
;;   meta-node: (Mn_p207689 $x0)
(Member $x0 fact)

;; p207690  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000774 tierB-001153 tierB-001490
;;   meta-node: (Mn_p207690 $x0)
(Member $x0 field)

;; p207691  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000872 tierB-000923 tierB-000977
;;   meta-node: (Mn_p207691 $x0)
(Member $x0 flower)

;; p207692  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000141 tierB-000609 tierB-000929
;;   meta-node: (Mn_p207692 $x0)
(Member $x0 forest)

;; p207693  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000423 tierB-000871 tierB-001399
;;   meta-node: (Mn_p207693 $x0)
(Member $x0 fox)

;; p207694  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000498 tierB-001610 tierB-001845
;;   meta-node: (Mn_p207694 $x0)
(Member $x0 game)

;; p207695  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000285 tierC-000197 tierC-000198
;;   meta-node: (Mn_p207695 $x0)
(Member $x0 headquarters)

;; p207698  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000248 tierB-000551 tierB-000664
;;   meta-node: (Mn_p207698 $x0)
(Member $x0 king)

;; p207699  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000604 tierB-001291 tierB-001403
;;   meta-node: (Mn_p207699 $x0)
(Member $x0 kitchen)

;; p207702  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000243 tierC-000283 tierC-000284
;;   meta-node: (Mn_p207702 $x0)
(Member $x0 mass)

;; p207703  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000625 tierC-000061 tierC-000062
;;   meta-node: (Mn_p207703 $x0)
(Member $x0 method)

;; p207704  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001423 tierB-001647 tierB-001653
;;   meta-node: (Mn_p207704 $x0)
(Member $x0 museum)

;; p207705  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000139 tierC-000111 tierC-000112
;;   meta-node: (Mn_p207705 $x0)
(Member $x0 name)

;; p207707  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000573 tierB-000722 tierB-001257
;;   meta-node: (Mn_p207707 $x0)
(Member $x0 ocean)

;; p207708  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000252 tierB-000332 tierB-001572
;;   meta-node: (Mn_p207708 $x0)
(Member $x0 opportunity)

;; p207710  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001250 tierB-001638
;;   meta-node: (Mn_p207710 $x0)
(Member $x0 page)

;; p207711  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000049 tierB-001263 tierB-001498
;;   meta-node: (Mn_p207711 $x0)
(Member $x0 patient)

;; p207712  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000394 tierB-000535 tierB-000714
;;   meta-node: (Mn_p207712 $x0)
(Member $x0 plant)

;; p207713  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000150 tierB-000256 tierB-000547
;;   meta-node: (Mn_p207713 $x0)
(Member $x0 police)

;; p207715  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001726 tierC-000053 tierC-000054
;;   meta-node: (Mn_p207715 $x0)
(Member $x0 president)

;; p207716  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000145 tierC-000029 tierC-000030
;;   meta-node: (Mn_p207716 $x0)
(Member $x0 race)

;; p207717  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000224 tierB-000306 tierB-000777
;;   meta-node: (Mn_p207717 $x0)
(Member $x0 report)

;; p207718  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000521 tierB-000902 tierB-001180
;;   meta-node: (Mn_p207718 $x0)
(Member $x0 right)

;; p207719  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000633 tierB-001110 tierB-001919
;;   meta-node: (Mn_p207719 $x0)
(Member $x0 roof)

;; p207721  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000647 tierB-000975 tierB-001651
;;   meta-node: (Mn_p207721 $x0)
(Member $x0 small)

;; p207722  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000230 tierB-000503 tierB-000734
;;   meta-node: (Mn_p207722 $x0)
(Member $x0 spider)

;; p207723  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000081 tierB-000706 tierB-001699
;;   meta-node: (Mn_p207723 $x0)
(Member $x0 station)

;; p207724  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000134 tierB-000775 tierB-001531
;;   meta-node: (Mn_p207724 $x0)
(Member $x0 storm)

;; p207725  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001280 tierC-000177 tierC-000178
;;   meta-node: (Mn_p207725 $x0)
(Member $x0 story)

;; p207727  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000700 tierB-000749 tierB-001219
;;   meta-node: (Mn_p207727 $x0)
(Member $x0 teacher)

;; p207728  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001108 tierB-001266 tierB-001573
;;   meta-node: (Mn_p207728 $x0)
(Member $x0 theater)

;; p207729  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000208 tierB-000356 tierB-001166
;;   meta-node: (Mn_p207729 $x0)
(Member $x0 top)

;; p207730  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000128 tierB-000437 tierB-001878
;;   meta-node: (Mn_p207730 $x0)
(Member $x0 treaty)

;; p207731  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000694 tierB-000745 tierB-001223
;;   meta-node: (Mn_p207731 $x0)
(Member $x0 truth)

;; p207733  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000039 tierB-001055 tierB-001752
;;   meta-node: (Mn_p207733 $x0)
(Member $x0 wood)

;; p207737  support 3 (occ 3)  size 1  root (LocatedIn (constant)  depth 1
;;   e.g. tierB-000664 tierB-001207 tierB-001292
;;   meta-node: (Mn_p207737 (LocatedIn $x0)
(Past (LocatedIn $x0 there))

;; p207738  support 3 (occ 3)  size 1  root (Member (constant)  depth 1
;;   e.g. tierB-000495 tierB-001170 tierB-001521
;;   meta-node: (Mn_p207738 (Member $x0)
(Probably (Member $x0 good))

;; ==================== SUBSUMED UNITS: 974 of 1454 rooted-subtree units (k = 4, support >= 3 of 2154 records) ====================

;; p200004  support 703 (occ 847)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000001 tierB-000002 tierB-000005
;;   meta-node: (Mn_p200004 $e0)
(Past $e0)

;; p200009  support 385 (occ 476)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000018 tierB-000028
;;   meta-node: (Mn_p200009 $e0 $x0)
(Agent $e0 $x0)

;; p200011  support 323 (occ 366)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000005 tierB-000016
;;   meta-node: (Mn_p200011 $e0 $x0)
(Patient $e0 $x0)

;; p200025  support 232 (occ 271)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000045 tierB-000049
;;   meta-node: (Mn_p200025 $e0 $x0)
(And (Agent $e0 $x0) (Past $e0))

;; p200030  support 195 (occ 224)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000018 tierB-000034
;;   meta-node: (Mn_p200030 $e0 $x0)
(And (Past $e0) (Patient $e0 $x0))

;; p200036  support 154 (occ 171)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000021 tierB-000047
;;   meta-node: (Mn_p200036 $e0 $x0)
(And (Past $e0) (Theme $e0 $x0))

;; p200038  support 150 (occ 165)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000040 tierB-000124
;;   meta-node: (Mn_p200038 $e0 $x0)
(Experiencer $e0 $x0)

;; p200040  support 149 (occ 155)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000001 tierB-000008 tierB-000013
;;   meta-node: (Mn_p200040 $e0)
(Ongoing $e0)

;; p200048  support 114 (occ 122)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000091 tierB-000101
;;   meta-node: (Mn_p200048 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Theme $e0 $x1))

;; p200051  support 111 (occ 124)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000034 tierB-000036
;;   meta-node: (Mn_p200051 $e0 $x0)
(Location $e0 $x0)

;; p200075  support 74 (occ 84)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000063 tierB-000073
;;   meta-node: (Mn_p200075 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Patient $e0 $x1))

;; p200080  support 72 (occ 77)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000075 tierB-000087
;;   meta-node: (Mn_p200080 $e0 $e1)
(Theme $e0 $e1)

;; p200093  support 64 (occ 66)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000101 tierB-000133 tierB-000267
;;   meta-node: (Mn_p200093 $x0)
(Cardinality $x0 <num>)

;; p200100  support 62 (occ 68)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000034 tierB-000045
;;   meta-node: (Mn_p200100 $e0 $x0)
(And (Location $e0 $x0) (Past $e0))

;; p200105  support 60 (occ 64)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000091 tierB-000145
;;   meta-node: (Mn_p200105 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p200112  support 58 (occ 60)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000036 tierB-000098
;;   meta-node: (Mn_p200112 $e0 $x0)
(And (Agent $e0 $x0) (Ongoing $e0))

;; p200133  support 52 (occ 52)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000040 tierB-000111 tierB-000135
;;   meta-node: (Mn_p200133 $e0 $x0)
(Goal $e0 $x0)

;; p200137  support 51 (occ 58)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000073 tierB-000170
;;   meta-node: (Mn_p200137 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p200160  support 46 (occ 50)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000075 tierB-000087
;;   meta-node: (Mn_p200160 $e0 $e1)
(And (Past $e0) (Theme $e0 $e1))

;; p200163  support 45 (occ 49)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000124 tierB-000134 tierB-000191
;;   meta-node: (Mn_p200163 $e0 $x0)
(And (Experiencer $e0 $x0) (Past $e0))

;; p200192  support 41 (occ 43)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000206 tierB-000228
;;   meta-node: (Mn_p200192 $e0 $e1)
(Result $e0 $e1)

;; p200209  support 38 (occ 38)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000111 tierB-000178 tierB-000204
;;   meta-node: (Mn_p200209 $e0 $x0)
(And (Goal $e0 $x0) (Past $e0))

;; p200210  support 38 (occ 40)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000001 tierB-000008 tierB-000117
;;   meta-node: (Mn_p200210 $e0)
(And (Ongoing $e0) (Past $e0))

;; p200214  support 37 (occ 41)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000062 tierB-000154
;;   meta-node: (Mn_p200214 $e0 $x0)
(And (Ongoing $e0) (Patient $e0 $x0))

;; p200243  support 33 (occ 38)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000045 tierB-000121
;;   meta-node: (Mn_p200243 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1))

;; p200248  support 32 (occ 32)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000082 tierB-000100 tierB-000108
;;   meta-node: (Mn_p200248 $e0)
(Future $e0)

;; p200249  support 32 (occ 32)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000138 tierB-000230
;;   meta-node: (Mn_p200249 $e0 $x0)
(Source $e0 $x0)

;; p200263  support 30 (occ 46)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000316 tierB-000338 tierB-000628
;;   meta-node: (Mn_p200263 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 person))

;; p200292  support 28 (occ 30)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000004 tierB-000362 tierB-000370
;;   meta-node: (Mn_p200292 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Result $e1 $e0))

;; p200293  support 28 (occ 32)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000036 tierB-000096
;;   meta-node: (Mn_p200293 $e0 $x0)
(And (Location $e0 $x0) (Ongoing $e0))

;; p200320  support 27 (occ 29)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000288 tierB-000470 tierB-000485
;;   meta-node: (Mn_p200320 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Theme $e0 $e1))

;; p200322  support 27 (occ 27)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000228 tierB-000256 tierB-000325
;;   meta-node: (Mn_p200322 $e0 $e1)
(And (Past $e0) (Result $e0 $e1))

;; p200323  support 27 (occ 29)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000362 tierB-000370
;;   meta-node: (Mn_p200323 $e0 $e1 $x0)
(And (Patient $e0 $x0) (Result $e0 $e1))

;; p200326  support 27 (occ 27)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000025 tierB-000156 tierB-000299
;;   meta-node: (Mn_p200326 $e0)
(Can $e0)

;; p200327  support 27 (occ 27)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
;;   meta-node: (Mn_p200327 $e0 $x0)
(Holder $e0 $x0)

;; p200339  support 26 (occ 26)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
;;   meta-node: (Mn_p200339 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Theme $e0 $x1))

;; p200343  support 26 (occ 26)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000037 tierB-000080 tierB-000144
;;   meta-node: (Mn_p200343 $e0)
(Obligated $e0)

;; p200359  support 25 (occ 27)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000115 tierB-000147
;;   meta-node: (Mn_p200359 $e0 $e1)
(To $e0 $e1)

;; p200379  support 24 (occ 27)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000160 tierB-000166 tierB-000339
;;   meta-node: (Mn_p200379 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Theme $e1 $e0))

;; p200380  support 24 (occ 26)  size 2  root $e1 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000199
;;   meta-node: (Mn_p200380 $e1 $e0)
(And (Ongoing $e0) (Theme $e1 $e0))

;; p200425  support 20 (occ 30)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001813
;;   meta-node: (Mn_p200425 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 person) (Past $e0))

;; p200431  support 20 (occ 20)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000138 tierB-000338
;;   meta-node: (Mn_p200431 $e0 $x0)
(And (Past $e0) (Source $e0 $x0))

;; p200451  support 19 (occ 21)  size 3  root $e1 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000199
;;   meta-node: (Mn_p200451 $e1 $e0)
(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))

;; p200463  support 19 (occ 21)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-000485 tierB-000738
;;   meta-node: (Mn_p200463 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))

;; p200466  support 19 (occ 21)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000770 tierB-000978 tierB-001507
;;   meta-node: (Mn_p200466 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 thing))

;; p200480  support 18 (occ 21)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000166 tierB-000339 tierB-000410
;;   meta-node: (Mn_p200480 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))

;; p200493  support 18 (occ 21)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000217 tierB-000291
;;   meta-node: (Mn_p200493 $e0 $x0 $x1)
(And (Location $e0 $x0) (Patient $e0 $x1))

;; p200494  support 18 (occ 19)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000080 tierB-000252 tierB-000865
;;   meta-node: (Mn_p200494 $e0 $x0)
(And (Member $x0 thing) (Theme $e0 $x0))

;; p200499  support 18 (occ 18)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000009 tierB-000114 tierB-000174
;;   meta-node: (Mn_p200499 $e0 $x0)
(Stimulus $e0 $x0)

;; p200517  support 17 (occ 17)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000362 tierB-000392 tierB-000425
;;   meta-node: (Mn_p200517 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))

;; p200535  support 17 (occ 17)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000387 tierB-000462
;;   meta-node: (Mn_p200535 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Goal $e0 $x1))

;; p200546  support 17 (occ 19)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000016 tierB-000222 tierB-000392
;;   meta-node: (Mn_p200546 $e0 $x0)
(Instrument $e0 $x0)

;; p200548  support 17 (occ 18)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000150 tierB-000485 tierB-000547
;;   meta-node: (Mn_p200548 $e0 $x0)
(Recipient $e0 $x0)

;; p200549  support 17 (occ 17)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000124 tierB-000133 tierB-000196
;;   meta-node: (Mn_p200549 $x0 $x1)
(SubsetOf $x0 $x1)

;; p200577  support 16 (occ 19)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000291 tierB-000305
;;   meta-node: (Mn_p200577 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0))

;; p200578  support 16 (occ 16)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000362 tierB-000392 tierB-000425
;;   meta-node: (Mn_p200578 $e0 $e1 $x0)
(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p200582  support 16 (occ 18)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000107 tierB-000265 tierB-000455
;;   meta-node: (Mn_p200582 $e1 $e0 $x0)
(And (Patient $e0 $x0) (Theme $e1 $e0))

;; p200611  support 15 (occ 17)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000963 tierB-000997
;;   meta-node: (Mn_p200611 $e0 $x0)
(And (Experiencer $e0 $x0) (Ongoing $e0))

;; p200613  support 15 (occ 15)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000416 tierB-000520 tierB-000574
;;   meta-node: (Mn_p200613 $e0 $x0)
(And (Ongoing $e0) (Theme $e0 $x0))

;; p200617  support 15 (occ 16)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000044 tierB-000049 tierB-000107
;;   meta-node: (Mn_p200617 $e0 $x0)
(For $e0 $x0)

;; p200651  support 14 (occ 15)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000047 tierB-000579 tierB-000704
;;   meta-node: (Mn_p200651 $e0 $x0 $x1)
(And (Location $e0 $x0) (Theme $e0 $x1))

;; p200653  support 14 (occ 16)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000246 tierB-000423 tierB-000722
;;   meta-node: (Mn_p200653 $e0 $x0 $x1)
(And (Possession $x0 $x1) (Theme $e0 $x0))

;; p200662  support 14 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001134
;;   meta-node: (Mn_p200662 $e0 $e1)
(Before $e0 $e1)

;; p200664  support 14 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000744 tierB-000880
;;   meta-node: (Mn_p200664 $e0)
(Time $e0 now)

;; p200720  support 13 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000387 tierB-000462
;;   meta-node: (Mn_p200720 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))

;; p200727  support 13 (occ 17)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000602 tierB-000963 tierB-001003
;;   meta-node: (Mn_p200727 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1))

;; p200728  support 13 (occ 18)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierB-001867
;;   meta-node: (Mn_p200728 $e0 $x0)
(And (Member $e0 build) (Patient $e0 $x0))

;; p200737  support 13 (occ 18)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierB-001867
;;   meta-node: (Mn_p200737 $e0)
(Member $e0 build)

;; p200785  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000465
;;   meta-node: (Mn_p200785 $e0 $e1)
(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))

;; p200830  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierB-000381 tierB-000426
;;   meta-node: (Mn_p200830 $e0 $x0)
(And (Agent $e0 $x0) (Ongoing $e0) (Past $e0))

;; p200844  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001134
;;   meta-node: (Mn_p200844 $e0 $e1)
(And (Before $e0 $e1) (Past $e1))

;; p200845  support 12 (occ 14)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000101 tierB-000133 tierB-000379
;;   meta-node: (Mn_p200845 $e0 $x0)
(And (Cardinality $x0 <num>) (Theme $e0 $x0))

;; p200847  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000465
;;   meta-node: (Mn_p200847 $e0 $e1)
(And (Member $e0 start) (Theme $e0 $e1))

;; p200848  support 12 (occ 14)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000082 tierB-000370 tierB-000389
;;   meta-node: (Mn_p200848 $e0 $x0)
(And (Member $x0 thing) (Patient $e0 $x0))

;; p200899  support 11 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000738 tierB-000930
;;   meta-node: (Mn_p200899 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))

;; p200900  support 11 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001302
;;   meta-node: (Mn_p200900 $e0 $e1)
(And (Before $e0 $e1) (Past $e0) (Past $e1))

;; p200924  support 11 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000316 tierB-000381
;;   meta-node: (Mn_p200924 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0))

;; p200925  support 11 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000291 tierB-000383
;;   meta-node: (Mn_p200925 $e0 $x0 $x1)
(And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p200935  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001302
;;   meta-node: (Mn_p200935 $e0 $e1)
(And (Before $e0 $e1) (Past $e0))

;; p200936  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000082 tierB-000108 tierB-000378
;;   meta-node: (Mn_p200936 $e0 $x0)
(And (Future $e0) (Patient $e0 $x0))

;; p200937  support 11 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000016 tierB-000392 tierB-000733
;;   meta-node: (Mn_p200937 $e0 $x0 $x1)
(And (Instrument $e0 $x0) (Patient $e0 $x1))

;; p200956  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000774 tierB-001033
;;   meta-node: (Mn_p200956 $e0 $x0)
(In $e0 $x0)

;; p200957  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-000128
;;   meta-node: (Mn_p200957 $e0)
(Manner $e0 quickly)

;; p200964  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000370 tierB-000792 tierB-000797
;;   meta-node: (Mn_p200964 $x0 $e0)
(Only $x0 $e0)

;; p200965  support 11 (occ 11)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000495 tierB-000517 tierB-001521
;;   meta-node: (Mn_p200965 $e0)
(Probably $e0)

;; p201043  support 10 (occ 12)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000738 tierB-000942
;;   meta-node: (Mn_p201043 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))

;; p201063  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000453 tierB-000930
;;   meta-node: (Mn_p201063 $e0 $x0)
(And (Agent $e0 $x0) (Future $e0))

;; p201064  support 10 (occ 19)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-000853 tierB-001130
;;   meta-node: (Mn_p201064 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 company))

;; p201065  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000222 tierB-000392 tierB-000444
;;   meta-node: (Mn_p201065 $e0 $x0)
(And (Instrument $e0 $x0) (Past $e0))

;; p201066  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-000128
;;   meta-node: (Mn_p201066 $e0)
(And (Manner $e0 quickly) (Past $e0))

;; p201067  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-000740 tierB-001582
;;   meta-node: (Mn_p201067 $e0 $x0)
(And (Member $e0 become) (Patient $e0 $x0))

;; p201070  support 10 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-000425 tierB-000747
;;   meta-node: (Mn_p201070 $e0 $x0)
(And (Member $x0 door) (Patient $e0 $x0))

;; p201071  support 10 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000115 tierB-000147
;;   meta-node: (Mn_p201071 $e0 $e1)
(And (Past $e0) (To $e0 $e1))

;; p201092  support 10 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000024 tierB-000137 tierB-000527
;;   meta-node: (Mn_p201092 $x0)
(Member $x0 good)

;; p201094  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000093 tierB-000240 tierB-000734
;;   meta-node: (Mn_p201094 $e0 $x0)
(To $e0 $x0)

;; p201102  support 9 (occ 11)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000738 tierB-000942
;;   meta-node: (Mn_p201102 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))

;; p201166  support 9 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001887
;;   meta-node: (Mn_p201166 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))

;; p201167  support 9 (occ 12)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000978 tierB-001661 tierB-001881
;;   meta-node: (Mn_p201167 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1))

;; p201168  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   meta-node: (Mn_p201168 $e0 $e1)
(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))

;; p201169  support 9 (occ 11)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000858 tierB-000942
;;   meta-node: (Mn_p201169 $e0 $e1 $x0)
(And (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201219  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000942 tierB-001182
;;   meta-node: (Mn_p201219 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1))

;; p201220  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000520 tierB-000713 tierB-000784
;;   meta-node: (Mn_p201220 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))

;; p201221  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000148 tierB-000381
;;   meta-node: (Mn_p201221 $e0 $x0)
(And (Location $e0 $x0) (Ongoing $e0) (Past $e0))

;; p201222  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   meta-node: (Mn_p201222 $e0 $e1)
(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))

;; p201223  support 9 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierC-000045
;;   meta-node: (Mn_p201223 $e0 $x0)
(And (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p201224  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000534
;;   meta-node: (Mn_p201224 $e0 $e1)
(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))

;; p201225  support 9 (occ 11)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000265 tierB-000930 tierB-000942
;;   meta-node: (Mn_p201225 $e1 $e0 $x0)
(And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))

;; p201240  support 9 (occ 11)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000248 tierB-000258 tierB-000548
;;   meta-node: (Mn_p201240 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 person))

;; p201241  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000715 tierB-000769
;;   meta-node: (Mn_p201241 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Recipient $e0 $x1))

;; p201244  support 9 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000370 tierB-000842 tierB-000960
;;   meta-node: (Mn_p201244 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 thing))

;; p201245  support 9 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   meta-node: (Mn_p201245 $e0 $e1)
(And (Member $e0 begin) (Theme $e0 $e1))

;; p201246  support 9 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierC-000045
;;   meta-node: (Mn_p201246 $e0)
(And (Member $e0 build) (Past $e0))

;; p201251  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000080 tierB-000246
;;   meta-node: (Mn_p201251 $e0 $x0)
(And (Obligated $e0) (Theme $e0 $x0))

;; p201252  support 9 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000150 tierB-000769 tierB-000775
;;   meta-node: (Mn_p201252 $e0 $x0)
(And (Past $e0) (Recipient $e0 $x0))

;; p201266  support 9 (occ 9)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000147 tierB-000337 tierB-000588
;;   meta-node: (Mn_p201266 $e0)
(Again $e0)

;; p201269  support 9 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000393 tierB-000412
;;   meta-node: (Mn_p201269 $e0)
(Member $e0 kill)

;; p201279  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000267 tierB-000334 tierB-000471
;;   meta-node: (Mn_p201279 $x0)
(Member $x0 old)

;; p201344  support 8 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000248 tierB-000258 tierB-000548
;;   meta-node: (Mn_p201344 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))

;; p201345  support 8 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
;;   meta-node: (Mn_p201345 $e0 $x0)
(And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))

;; p201433  support 8 (occ 8)  size 1  root bicycle (constant)  depth 1
;;   e.g. tierC-000317 tierC-000318 tierC-000319
;;   meta-node: (Mn_p201433 bicycle)
(ConditionalProperty bicycle permitted footpath)

;; p201434  support 8 (occ 8)  size 1  root pedestrian (constant)  depth 1
;;   e.g. tierC-000317 tierC-000318 tierC-000319
;;   meta-node: (Mn_p201434 pedestrian)
(ConditionalProperty pedestrian permitted footpath)

;; p201435  support 8 (occ 8)  size 1  root bicycle (constant)  depth 1
;;   e.g. tierC-000317 tierC-000318 tierC-000319
;;   meta-node: (Mn_p201435 bicycle)
(Inheritance bicycle permitted) ~NEG

;; p201436  support 8 (occ 8)  size 1  root pedestrian (constant)  depth 1
;;   e.g. tierC-000317 tierC-000318 tierC-000319
;;   meta-node: (Mn_p201436 pedestrian)
(Inheritance pedestrian permitted) ~NEG

;; p201446  support 8 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-001867 tierC-000045
;;   meta-node: (Mn_p201446 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))

;; p201476  support 8 (occ 8)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000147 tierB-000337 tierB-000588
;;   meta-node: (Mn_p201476 $e0)
(And (Again $e0) (Past $e0))

;; p201477  support 8 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000410 tierB-000587 tierB-000648
;;   meta-node: (Mn_p201477 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 child))

;; p201478  support 8 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-001867 tierC-000045
;;   meta-node: (Mn_p201478 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 build))

;; p201480  support 8 (occ 18)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001512 tierC-000017 tierC-000018
;;   meta-node: (Mn_p201480 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Possession $x0 $x1))

;; p201481  support 8 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-001035 tierB-001867
;;   meta-node: (Mn_p201481 $e0 $e1 $x0)
(And (Agent $e0 $x0) (To $e0 $e1))

;; p201482  support 8 (occ 10)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierB-001035 tierB-001867
;;   meta-node: (Mn_p201482 $e1 $e0 $x0)
(And (Agent $e0 $x0) (To $e1 $e0))

;; p201483  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000281 tierB-000453 tierB-000790
;;   meta-node: (Mn_p201483 $e0 $x0)
(And (Future $e0) (Theme $e0 $x0))

;; p201484  support 8 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000393 tierB-000412
;;   meta-node: (Mn_p201484 $e0 $x0)
(And (GroupOf $x0 person) (Patient $e0 $x0))

;; p201486  support 8 (occ 10)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001257 tierB-001283
;;   meta-node: (Mn_p201486 $e1 $e0 $x0)
(And (Location $e0 $x0) (Theme $e1 $e0))

;; p201487  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-001062
;;   meta-node: (Mn_p201487 $e0 $x0)
(And (Manner $e0 quickly) (Patient $e0 $x0))

;; p201489  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001079 tierB-001582 tierB-001817
;;   meta-node: (Mn_p201489 $e0 $e1)
(And (Member $e0 become) (Result $e0 $e1))

;; p201491  support 8 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000208 tierB-001995 tierC-000009
;;   meta-node: (Mn_p201491 $e0 $x0)
(And (Member $e0 produce) (Patient $e0 $x0))

;; p201492  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000942 tierB-000978
;;   meta-node: (Mn_p201492 $e0 $x0)
(And (Member $e0 take) (Theme $e0 $x0))

;; p201494  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000400 tierB-000470
;;   meta-node: (Mn_p201494 $e0 $e1)
(And (Member $e0 try) (Theme $e0 $e1))

;; p201495  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001601 tierB-001962 tierC-000089
;;   meta-node: (Mn_p201495 $e0 $x0)
(And (Member $e0 write) (Patient $e0 $x0))

;; p201496  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000813 tierB-001143 tierB-001520
;;   meta-node: (Mn_p201496 $e0 $x0)
(And (Obligated $e0) (Patient $e0 $x0))

;; p201497  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000009 tierB-000189 tierB-000421
;;   meta-node: (Mn_p201497 $e0 $x0)
(And (Past $e0) (Stimulus $e0 $x0))

;; p201498  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000338 tierB-000677
;;   meta-node: (Mn_p201498 $e0 $x0 $x1)
(And (Patient $e0 $x0) (Source $e0 $x1))

;; p201527  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000239 tierB-000938
;;   meta-node: (Mn_p201527 $e0 $e1)
(For $e0 $e1)

;; p201528  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001135
;;   meta-node: (Mn_p201528 $e0 $x0)
(Like $e0 $x0)

;; p201539  support 8 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000298 tierB-000302 tierB-000315
;;   meta-node: (Mn_p201539 $e0)
(Time $e0 (Hour <num>))

;; p201670  support 7 (occ 11)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-000853 tierB-001932
;;   meta-node: (Mn_p201670 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 company) (Past $e0))

;; p201671  support 7 (occ 17)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   meta-node: (Mn_p201671 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1))

;; p201673  support 7 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000858 tierB-000942 tierB-001130
;;   meta-node: (Mn_p201673 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p201674  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000320 tierB-000779 tierB-000838
;;   meta-node: (Mn_p201674 $e0 $x0)
(And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))

;; p201676  support 7 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-001582 tierB-001817 tierC-000001
;;   meta-node: (Mn_p201676 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))

;; p201677  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000080 tierB-000252 tierB-000865
;;   meta-node: (Mn_p201677 $e0 $x0)
(And (Member $x0 thing) (Past $e0) (Theme $e0 $x0))

;; p201679  support 7 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001836 tierB-001900 tierC-000047
;;   meta-node: (Mn_p201679 $e0 $x0 $x1)
(And (Past $e0) (Possession $x0 $x1) (Theme $e0 $x0))

;; p201767  support 7 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000291 tierB-000942 tierB-001649
;;   meta-node: (Mn_p201767 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2))

;; p201768  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000998 tierB-001182
;;   meta-node: (Mn_p201768 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))

;; p201769  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-001062
;;   meta-node: (Mn_p201769 $e0 $x0)
(And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))

;; p201770  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-001582 tierC-000001
;;   meta-node: (Mn_p201770 $e0 $x0)
(And (Member $e0 become) (Past $e0) (Patient $e0 $x0))

;; p201771  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001582 tierB-001817 tierC-000001
;;   meta-node: (Mn_p201771 $e0 $e1 $x0)
(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))

;; p201773  support 7 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000208 tierC-000009 tierC-000010
;;   meta-node: (Mn_p201773 $e0 $x0)
(And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))

;; p201774  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   meta-node: (Mn_p201774 $e0 $x0)
(And (Member $e0 write) (Past $e0) (Patient $e0 $x0))

;; p201812  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000156 tierB-000556 tierB-000745
;;   meta-node: (Mn_p201812 $e0 $x0)
(And (Agent $e0 $x0) (Can $e0))

;; p201814  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000320 tierB-000779 tierB-000838
;;   meta-node: (Mn_p201814 $e0 $x0)
(And (Cardinality $x0 <num>) (Patient $e0 $x0))

;; p201815  support 7 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000191 tierB-001160 tierB-001485
;;   meta-node: (Mn_p201815 $e0 $x0)
(And (Experiencer $e0 $x0) (GroupOf $x0 person))

;; p201816  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000239 tierB-000962
;;   meta-node: (Mn_p201816 $e0 $e1)
(And (For $e0 $e1) (Past $e0))

;; p201817  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-001603 tierB-001786
;;   meta-node: (Mn_p201817 $e0 $x0)
(And (For $e0 $x0) (Past $e0))

;; p201818  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000135 tierB-000176 tierB-000482
;;   meta-node: (Mn_p201818 $e0 $x0 $x1)
(And (Goal $e0 $x0) (Patient $e0 $x1))

;; p201823  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000189 tierB-000421 tierB-000681
;;   meta-node: (Mn_p201823 $e0 $x0)
(And (Member $e0 hear) (Stimulus $e0 $x0))

;; p201824  support 7 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000412 tierB-001197
;;   meta-node: (Mn_p201824 $e0)
(And (Member $e0 kill) (Past $e0))

;; p201826  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001431 tierB-001504
;;   meta-node: (Mn_p201826 $e0 $e1)
(And (Member $e0 make) (Result $e0 $e1))

;; p201828  support 7 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000208 tierC-000009 tierC-000010
;;   meta-node: (Mn_p201828 $e0)
(And (Member $e0 produce) (Past $e0))

;; p201831  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   meta-node: (Mn_p201831 $e0)
(And (Member $e0 write) (Past $e0))

;; p201832  support 7 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-000370 tierB-000748
;;   meta-node: (Mn_p201832 $e0 $e1)
(And (Ongoing $e0) (Result $e0 $e1))

;; p201833  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000229 tierB-001066 tierB-001243
;;   meta-node: (Mn_p201833 $e0 $x0 $x1)
(And (PartOf $x0 $x1) (Theme $e0 $x0))

;; p201834  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
;;   meta-node: (Mn_p201834 $e0 $x0)
(And (Past $e0) (Through $e0 $x0))

;; p201867  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-001989 tierC-000017
;;   meta-node: (Mn_p201867 $e0 $x0)
(As $e0 $x0)

;; p201868  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000463 tierB-001314 tierB-001337
;;   meta-node: (Mn_p201868 $e0 $e1)
(But $e0 $e1)

;; p201870  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000253 tierB-000778 tierB-001084
;;   meta-node: (Mn_p201870 $e0)
(Measure $e0 duration <num> year)

;; p201876  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000748 tierB-000790 tierB-001594
;;   meta-node: (Mn_p201876 $x0)
(Member $x0 bad)

;; p201881  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
;;   meta-node: (Mn_p201881 $e0 $x0)
(Through $e0 $x0)

;; p201882  support 7 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000631 tierB-000808
;;   meta-node: (Mn_p201882 $e0)
(Time $e0 today)

;; p202010  support 6 (occ 10)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-001130 tierC-000045
;;   meta-node: (Mn_p202010 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 company) (Patient $e0 $x1))

;; p202011  support 6 (occ 10)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   meta-node: (Mn_p202011 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))

;; p202013  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000133 tierB-000379 tierB-000797
;;   meta-node: (Mn_p202013 $e0 $x0)
(And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))

;; p202014  support 6 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000412 tierB-000771
;;   meta-node: (Mn_p202014 $e0 $x0)
(And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))

;; p202015  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-000425 tierB-000747
;;   meta-node: (Mn_p202015 $e0 $x0)
(And (Member $x0 door) (Past $e0) (Patient $e0 $x0))

;; p202016  support 6 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000389 tierB-001520 tierC-000119
;;   meta-node: (Mn_p202016 $e0 $x0)
(And (Member $x0 thing) (Past $e0) (Patient $e0 $x0))

;; p202136  support 6 (occ 8)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001933 tierC-000025
;;   meta-node: (Mn_p202136 $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e1 $e0))

;; p202137  support 6 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierC-000045 tierC-000046
;;   meta-node: (Mn_p202137 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 build) (Past $e0))

;; p202139  support 6 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000963 tierB-001041 tierB-001078
;;   meta-node: (Mn_p202139 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))

;; p202140  support 6 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001303
;;   meta-node: (Mn_p202140 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))

;; p202141  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000047 tierB-000579 tierB-000704
;;   meta-node: (Mn_p202141 $e0 $x0 $x1)
(And (Location $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p202142  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001079 tierB-001582 tierC-000001
;;   meta-node: (Mn_p202142 $e0 $e1)
(And (Member $e0 become) (Past $e0) (Result $e0 $e1))

;; p202143  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000189 tierB-000421 tierB-000681
;;   meta-node: (Mn_p202143 $e0 $x0)
(And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))

;; p202144  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000338 tierB-000725
;;   meta-node: (Mn_p202144 $e0 $x0 $x1)
(And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))

;; p202190  support 6 (occ 6)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000688 tierC-000001 tierC-000121
;;   meta-node: (Mn_p202190 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Before $e1 $e0))

;; p202194  support 6 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001182 tierB-001416 tierB-001773
;;   meta-node: (Mn_p202194 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 man))

;; p202195  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000485 tierB-000693
;;   meta-node: (Mn_p202195 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Source $e0 $x1))

;; p202196  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-001989 tierC-000017
;;   meta-node: (Mn_p202196 $e0 $x0)
(And (As $e0 $x0) (Past $e0))

;; p202197  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-001047 tierB-001246
;;   meta-node: (Mn_p202197 $e0 $x0)
(And (Can $e0) (Patient $e0 $x0))

;; p202198  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-000745
;;   meta-node: (Mn_p202198 $e0 $x0)
(And (Can $e0) (Theme $e0 $x0))

;; p202199  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000320 tierB-000761
;;   meta-node: (Mn_p202199 $x0 $x1)
(And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))

;; p202200  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-001521 tierB-001891
;;   meta-node: (Mn_p202200 $e0 $x0)
(And (Experiencer $e0 $x0) (Probably $e0))

;; p202201  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierB-000339 tierB-000455
;;   meta-node: (Mn_p202201 $e0 $e1 $x0)
(And (Experiencer $e0 $x0) (Theme $e0 $e1))

;; p202202  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000938 tierB-000962 tierC-000277
;;   meta-node: (Mn_p202202 $e0 $e1 $x0)
(And (For $e0 $e1) (Theme $e0 $x0))

;; p202203  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000204 tierB-000219 tierB-000576
;;   meta-node: (Mn_p202203 $e0 $x0)
(And (Goal $e0 $x0) (Member $e0 go))

;; p202204  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-000834 tierB-001023
;;   meta-node: (Mn_p202204 $e0 $x0 $x1)
(And (Goal $e0 $x0) (Theme $e0 $x1))

;; p202205  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000774 tierB-001033
;;   meta-node: (Mn_p202205 $e0 $x0)
(And (In $e0 $x0) (Past $e0))

;; p202206  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000048 tierB-000371 tierB-000524
;;   meta-node: (Mn_p202206 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 live))

;; p202209  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000517 tierB-001491
;;   meta-node: (Mn_p202209 $e0 $x0)
(And (Member $e0 change) (Patient $e0 $x0))

;; p202216  support 6 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000199 tierC-000200 tierC-000237
;;   meta-node: (Mn_p202216 $e0 $x0)
(And (Member $x0 person) (Patient $e0 $x0))

;; p202217  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000041 tierC-000042 tierC-000099
;;   meta-node: (Mn_p202217 $e0 $x0)
(And (Member $x0 person) (Theme $e0 $x0))

;; p202218  support 6 (occ 6)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000080 tierB-000147 tierB-001143
;;   meta-node: (Mn_p202218 $e0)
(And (Obligated $e0) (Past $e0))

;; p202219  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000259 tierB-000903 tierB-001031
;;   meta-node: (Mn_p202219 $e0 $e1)
(And (Past $e0) (Patient $e0 $e1))

;; p202220  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000327 tierB-000565
;;   meta-node: (Mn_p202220 $e0)
(And (Past $e0) (Time $e0 yesterday))

;; p202221  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
;;   meta-node: (Mn_p202221 $e0 $e1 $x0)
(And (Patient $e0 $x0) (Theme $e0 $e1))

;; p202222  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000400 tierB-000781 tierB-001325
;;   meta-node: (Mn_p202222 $e0 $x0 $x1)
(And (Source $e0 $x0) (Theme $e0 $x1))

;; p202223  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000229 tierB-000252 tierB-000730
;;   meta-node: (Mn_p202223 $e0 $e1 $x0)
(And (Theme $e0 $x0) (To $e0 $e1))

;; p202273  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000805 tierB-000969 tierB-001547
;;   meta-node: (Mn_p202273 $e0 $e1)
(Agent $e0 $e1)

;; p202274  support 6 (occ 6)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000034 tierB-000218 tierB-000616
;;   meta-node: (Mn_p202274 $e0)
(Already $e0)

;; p202275  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001130 tierB-001222 tierB-001531
;;   meta-node: (Mn_p202275 $x0 $e0)
(Before $x0 $e0)

;; p202276  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000502 tierB-000867 tierB-001782
;;   meta-node: (Mn_p202276 $e0 $e1)
(During $e0 $e1)

;; p202277  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000599 tierB-000892 tierB-001212
;;   meta-node: (Mn_p202277 $x0 $x1)
(For $x0 $x1)

;; p202279  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-000921 tierB-001766
;;   meta-node: (Mn_p202279 $e0)
(Manner $e0 well)

;; p202281  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000906 tierB-001568 tierB-001812
;;   meta-node: (Mn_p202281 $e0)
(Member $e0 bear)

;; p202282  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
;;   meta-node: (Mn_p202282 $e0)
(Member $e0 capture)

;; p202290  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001035 tierB-001595
;;   meta-node: (Mn_p202290 $e0)
(Member $e0 receive)

;; p202299  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000230 tierB-000316 tierB-000576
;;   meta-node: (Mn_p202299 $x0)
(Member $x0 huge)

;; p202300  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000048 tierB-001666 tierB-001925
;;   meta-node: (Mn_p202300 $x0)
(Member $x0 large)

;; p202309  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000082 tierB-001123 tierB-001169
;;   meta-node: (Mn_p202309 $x0)
(Member $x0 whole)

;; p202311  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000097 tierB-000201 tierB-000790
;;   meta-node: (Mn_p202311 $e0 $x0)
(On $e0 $x0)

;; p202312  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000259 tierB-000903 tierB-001031
;;   meta-node: (Mn_p202312 $e0 $e1)
(Patient $e0 $e1)

;; p202313  support 6 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000264 tierB-000917
;;   meta-node: (Mn_p202313 $e0)
(Time $e0 night)

;; p202314  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000327 tierB-000565
;;   meta-node: (Mn_p202314 $e0)
(Time $e0 yesterday)

;; p202333  support 5 (occ 7)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   meta-node: (Mn_p202333 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))

;; p202334  support 5 (occ 7)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   meta-node: (Mn_p202334 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))

;; p202339  support 5 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-001582 tierC-000001 tierC-000158
;;   meta-node: (Mn_p202339 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))

;; p202558  support 5 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierB-001283 tierB-001933
;;   meta-node: (Mn_p202558 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1))

;; p202559  support 5 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   meta-node: (Mn_p202559 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))

;; p202560  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000337 tierB-000340
;;   meta-node: (Mn_p202560 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 boy) (Past $e0))

;; p202561  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000745 tierC-000047 tierC-000048
;;   meta-node: (Mn_p202561 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 person) (Theme $e0 $x1))

;; p202562  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001994 tierC-000159 tierC-000160
;;   meta-node: (Mn_p202562 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 thing) (Past $e0))

;; p202564  support 5 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierB-001035 tierB-001867
;;   meta-node: (Mn_p202564 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))

;; p202569  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
;;   meta-node: (Mn_p202569 $e0 $e1 $x0)
(And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202570  support 5 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000199 tierC-000200 tierC-000353
;;   meta-node: (Mn_p202570 $e0 $x0)
(And (Member $x0 person) (Past $e0) (Patient $e0 $x0))

;; p202571  support 5 (occ 5)  size 3  root $e1 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
;;   meta-node: (Mn_p202571 $e1 $e0 $x0)
(And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))

;; p202724  support 5 (occ 7)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   meta-node: (Mn_p202724 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))

;; p202758  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   meta-node: (Mn_p202758 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))

;; p202759  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   meta-node: (Mn_p202759 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))

;; p202762  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-000775 tierB-000793
;;   meta-node: (Mn_p202762 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))

;; p202763  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000693 tierB-000781
;;   meta-node: (Mn_p202763 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))

;; p202764  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
;;   meta-node: (Mn_p202764 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))

;; p202765  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-001035 tierB-001867
;;   meta-node: (Mn_p202765 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))

;; p202766  support 5 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001130 tierB-001773
;;   meta-node: (Mn_p202766 $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p202767  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierC-000277 tierC-000278
;;   meta-node: (Mn_p202767 $e0 $e1 $x0)
(And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))

;; p202768  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000204 tierB-000219 tierB-000576
;;   meta-node: (Mn_p202768 $e0 $x0)
(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))

;; p202769  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-000834 tierB-001023
;;   meta-node: (Mn_p202769 $e0 $x0 $x1)
(And (Goal $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p202770  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   meta-node: (Mn_p202770 $e0 $x0)
(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))

;; p202771  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   meta-node: (Mn_p202771 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p202772  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000392 tierB-001143 tierB-001429
;;   meta-node: (Mn_p202772 $e0 $x0 $x1)
(And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p202774  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000217 tierB-000942 tierB-001893
;;   meta-node: (Mn_p202774 $e0 $x0 $x1)
(And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1))

;; p202778  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
;;   meta-node: (Mn_p202778 $e0 $x0)
(And (Member $e0 present) (Past $e0) (Theme $e0 $x0))

;; p202779  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001595 tierB-001693
;;   meta-node: (Mn_p202779 $e0 $x0)
(And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))

;; p202780  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000192 tierB-000265 tierB-000654
;;   meta-node: (Mn_p202780 $e0 $x0)
(And (Member $e0 start) (Past $e0) (Patient $e0 $x0))

;; p202781  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000400 tierB-000470
;;   meta-node: (Mn_p202781 $e0 $e1)
(And (Member $e0 try) (Past $e0) (Theme $e0 $e1))

;; p202782  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierC-000277 tierC-000278
;;   meta-node: (Mn_p202782 $e0 $x0)
(And (Member $e0 win) (Past $e0) (Theme $e0 $x0))

;; p202783  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001325 tierB-001540
;;   meta-node: (Mn_p202783 $e0 $x0 $x1)
(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))

;; p202849  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierB-001302 tierC-000122
;;   meta-node: (Mn_p202849 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Before $e0 $e1))

;; p202850  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000359 tierB-000556 tierB-000738
;;   meta-node: (Mn_p202850 $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>))

;; p202851  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   meta-node: (Mn_p202851 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 begin))

;; p202853  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000298 tierB-000713
;;   meta-node: (Mn_p202853 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 leave))

;; p202857  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000942 tierB-000978 tierB-001726
;;   meta-node: (Mn_p202857 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 take))

;; p202859  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000337 tierB-000340
;;   meta-node: (Mn_p202859 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 boy))

;; p202860  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000256 tierB-000747 tierB-001754
;;   meta-node: (Mn_p202860 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Result $e0 $e1))

;; p202861  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
;;   meta-node: (Mn_p202861 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Through $e0 $x1))

;; p202862  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000218 tierB-000616
;;   meta-node: (Mn_p202862 $e0 $x0)
(And (Already $e0) (Patient $e0 $x0))

;; p202863  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-001222 tierB-001531 tierB-001544
;;   meta-node: (Mn_p202863 $x0 $e0)
(And (Before $x0 $e0) (Past $e0))

;; p202865  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001258 tierC-000013 tierC-000014
;;   meta-node: (Mn_p202865 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 person))

;; p202866  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000744 tierB-000826
;;   meta-node: (Mn_p202866 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Source $e0 $x1))

;; p202867  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000631 tierB-000808
;;   meta-node: (Mn_p202867 $e0 $x0)
(And (Experiencer $e0 $x0) (Time $e0 today))

;; p202868  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000162 tierB-000483 tierB-001069
;;   meta-node: (Mn_p202868 $e0 $x0)
(And (GroupOf $x0 thing) (Theme $e0 $x0))

;; p202869  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   meta-node: (Mn_p202869 $e0 $x0)
(And (Holder $e0 $x0) (Past $e0))

;; p202870  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000524 tierB-001257
;;   meta-node: (Mn_p202870 $e0 $x0 $x1)
(And (LocatedIn $x0 $x1) (Location $e0 $x0))

;; p202871  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000680 tierB-001295
;;   meta-node: (Mn_p202871 $e0 $x0 $x1)
(And (LocatedIn $x0 $x1) (Patient $e0 $x0))

;; p202872  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000253 tierB-000778 tierB-001536
;;   meta-node: (Mn_p202872 $e0)
(And (Measure $e0 duration <num> year) (Past $e0))

;; p202873  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
;;   meta-node: (Mn_p202873 $e0 $x0)
(And (Member $e0 capture) (Theme $e0 $x0))

;; p202875  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   meta-node: (Mn_p202875 $e0 $x0)
(And (Member $e0 create) (Patient $e0 $x0))

;; p202876  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000010 tierC-000091 tierC-000138
;;   meta-node: (Mn_p202876 $e0 $x0)
(And (Member $e0 direct) (Patient $e0 $x0))

;; p202879  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000584 tierC-000095 tierC-000096
;;   meta-node: (Mn_p202879 $e0 $x0)
(And (Member $e0 follow) (Theme $e0 $x0))

;; p202881  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-000890
;;   meta-node: (Mn_p202881 $e0 $x0)
(And (Member $e0 get) (Patient $e0 $x0))

;; p202882  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000370 tierB-000748
;;   meta-node: (Mn_p202882 $e0 $e1)
(And (Member $e0 get) (Result $e0 $e1))

;; p202884  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000107 tierB-000114 tierB-000339
;;   meta-node: (Mn_p202884 $e0 $e1)
(And (Member $e0 need) (Theme $e0 $e1))

;; p202885  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
;;   meta-node: (Mn_p202885 $e0)
(And (Member $e0 present) (Past $e0))

;; p202886  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
;;   meta-node: (Mn_p202886 $e0 $x0)
(And (Member $e0 present) (Theme $e0 $x0))

;; p202887  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001595 tierB-001693
;;   meta-node: (Mn_p202887 $e0 $x0)
(And (Member $e0 receive) (Theme $e0 $x0))

;; p202895  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierC-000277 tierC-000278
;;   meta-node: (Mn_p202895 $e0)
(And (Member $e0 win) (Past $e0))

;; p202896  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierC-000277 tierC-000278
;;   meta-node: (Mn_p202896 $e0 $x0)
(And (Member $e0 win) (Theme $e0 $x0))

;; p202897  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierB-001910
;;   meta-node: (Mn_p202897 $e0 $x0)
(And (Member $x0 bad) (Patient $e0 $x0))

;; p202898  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000441 tierB-001005 tierB-001687
;;   meta-node: (Mn_p202898 $e0 $x0)
(And (Member $x0 house) (Theme $e0 $x0))

;; p202899  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001168 tierB-001251 tierB-001693
;;   meta-node: (Mn_p202899 $e0 $x0)
(And (Member $x0 new) (Theme $e0 $x0))

;; p202900  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001642 tierB-001920 tierB-001997
;;   meta-node: (Mn_p202900 $e0 $x0)
(And (Member $x0 room) (Patient $e0 $x0))

;; p202901  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000805 tierB-000951 tierB-001384
;;   meta-node: (Mn_p202901 $e0 $x0)
(And (Member $x0 sound) (Patient $e0 $x0))

;; p202902  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000316 tierB-000659
;;   meta-node: (Mn_p202902 $e0 $e1)
(And (Past $e0) (Stimulus $e0 $e1))

;; p202903  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000309 tierB-000373
;;   meta-node: (Mn_p202903 $e0)
(And (Past $e0) (Time $e0 (Year <num>)))

;; p202904  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000264 tierB-001894
;;   meta-node: (Mn_p202904 $e0)
(And (Past $e0) (Time $e0 night))

;; p202905  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001031
;;   meta-node: (Mn_p202905 $e0)
(And (Past $e0) (TimeAtMost $e0 (Year <num>)))

;; p202908  support 5 (occ 7)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000147 tierB-000258 tierB-001396
;;   meta-node: (Mn_p202908 $e1 $e0 $x0)
(And (Theme $e0 $x0) (To $e1 $e0))

;; p202975  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000378 tierB-000653
;;   meta-node: (Mn_p202975 $e0)
(Location $e0 here)

;; p202977  support 5 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000454 tierB-000768
;;   meta-node: (Mn_p202977 $e0)
(Member $e0 contain)

;; p202978  support 5 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   meta-node: (Mn_p202978 $e0)
(Member $e0 create)

;; p202979  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   meta-node: (Mn_p202979 $e0)
(Member $e0 draw)

;; p202983  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000247 tierC-000248 tierC-000277
;;   meta-node: (Mn_p202983 $e0)
(Member $e0 portray)

;; p202986  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-000712 tierB-001299
;;   meta-node: (Mn_p202986 $e0)
(Member $e0 stand)

;; p202992  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000367 tierB-000937 tierB-001124
;;   meta-node: (Mn_p202992 $x0)
(Member $x0 blue)

;; p202998  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000796 tierB-000861 tierB-000918
;;   meta-node: (Mn_p202998 $x0)
(Member $x0 full)

;; p203008  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001205
;;   meta-node: (Mn_p203008 $e0 $x0)
(Over $e0 $x0)

;; p203009  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000799 tierB-001111 tierB-001628
;;   meta-node: (Mn_p203009 $x0 $x1)
(ProportionOf $x0 $x1 most)

;; p203010  support 5 (occ 5)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000089 tierB-000919 tierB-001016
;;   meta-node: (Mn_p203010 $e0)
(Still $e0)

;; p203011  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000316 tierB-000659
;;   meta-node: (Mn_p203011 $e0 $e1)
(Stimulus $e0 $e1)

;; p203012  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000309 tierB-000373
;;   meta-node: (Mn_p203012 $e0)
(Time $e0 (Year <num>))

;; p203013  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001031
;;   meta-node: (Mn_p203013 $e0)
(TimeAtMost $e0 (Year <num>))

;; p203047  support 4 (occ 7)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203047 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1))

;; p203048  support 4 (occ 7)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203048 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1))

;; p203049  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203049 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 view) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p203050  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203050 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 view) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p203053  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203053 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Member $x0 company))

;; p203054  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203054 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Past $e0))

;; p203055  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203055 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Patient $e0 $x1))

;; p203063  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203063 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Past $e0))

;; p203064  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203064 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Patient $e0 $x1))

;; p203065  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203065 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x1 hotel) (Patient $e0 $x1))

;; p203066  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   meta-node: (Mn_p203066 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))

;; p203067  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   meta-node: (Mn_p203067 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))

;; p203069  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203069 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 company) (Member $x1 hotel) (Patient $e0 $x1))

;; p203070  support 4 (occ 7)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203070 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1))

;; p203071  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203071 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 thing) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p203072  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203072 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 thing) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p203073  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203073 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 hotel) (Past $e0) (Patient $e0 $x1))

;; p203074  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203074 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member free_soil_party party) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p203075  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203075 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member republican_party party) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p203076  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203076 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p203077  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203077 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p203079  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203079 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p203080  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203080 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))

;; p203081  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203081 $e0 $x0)
(And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p203087  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203087 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))

;; p203088  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203088 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p203092  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203092 $e0 $x0)
(And (GroupOf $x0 view) (Member free_soil_party party) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203093  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203093 $e0 $x0)
(And (GroupOf $x0 view) (Member republican_party party) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203094  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203094 $e0 $x0)
(And (GroupOf $x0 view) (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203095  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203095 $e0 $x0)
(And (GroupOf $x0 view) (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203111  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001446 tierB-001816
;;   meta-node: (Mn_p203111 $e0 $e1 $x0)
(And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))

;; p203119  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203119 $e0 $x0)
(And (Member free_soil_party party) (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203710  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000688 tierC-000001 tierC-000121
;;   meta-node: (Mn_p203710 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Before $e1 $e0) (Past $e1))

;; p203712  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000587 tierB-001125 tierB-001433
;;   meta-node: (Mn_p203712 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))

;; p203713  support 4 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203713 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))

;; p203714  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203714 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company))

;; p203716  support 4 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203716 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company))

;; p203717  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   meta-node: (Mn_p203717 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))

;; p203718  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000073 tierB-000381 tierB-001183
;;   meta-node: (Mn_p203718 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 cat) (Past $e0))

;; p203719  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001182 tierB-001773 tierB-001803
;;   meta-node: (Mn_p203719 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))

;; p203720  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203720 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 hotel) (Patient $e0 $x1))

;; p203721  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001251 tierB-001693 tierB-001762
;;   meta-node: (Mn_p203721 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))

;; p203722  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203722 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p203723  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203723 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p203724  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   meta-node: (Mn_p203724 $e0 $e1)
(And (But $e0 $e1) (Past $e0) (Past $e1))

;; p203725  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203725 $e0 $x0)
(And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p203729  support 4 (occ 4)  size 3  root $e1 (event)  depth 3
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   meta-node: (Mn_p203729 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0))

;; p203730  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203730 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))

;; p203731  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203731 $e0 $x0)
(And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p203732  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203732 $e0 $x0)
(And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))

;; p203734  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203734 $x0)
(And (GroupOf $x0 view) (Member free_soil_party party) (Possession $x0 free_soil_party))

;; p203735  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203735 $x0)
(And (GroupOf $x0 view) (Member republican_party party) (Possession $x0 republican_party))

;; p203736  support 4 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203736 $e0 $x0)
(And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))

;; p203737  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000680 tierB-001359
;;   meta-node: (Mn_p203737 $e0 $x0 $x1)
(And (LocatedIn $x0 $x1) (Past $e0) (Patient $e0 $x0))

;; p203739  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000047 tierB-000502 tierB-001041
;;   meta-node: (Mn_p203739 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 table) (Past $e0))

;; p203740  support 4 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000279 tierC-000280 tierC-000313
;;   meta-node: (Mn_p203740 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $x1 thing) (Theme $e0 $x1))

;; p203744  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   meta-node: (Mn_p203744 $e1 $e0 $x0)
(And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0))

;; p203746  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203746 $e0 $x0)
(And (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))

;; p203749  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000279 tierC-000280 tierC-000313
;;   meta-node: (Mn_p203749 $e0 $x0)
(And (Member $e0 find) (Member $x0 thing) (Theme $e0 $x0))

;; p203751  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203751 $e0 $x0)
(And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))

;; p203753  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   meta-node: (Mn_p203753 $e0 $e1 $x0)
(And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1))

;; p203754  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203754 $e0 $x0)
(And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p203756  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203756 $e0 $x0)
(And (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p203757  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001168 tierB-001251 tierB-001693
;;   meta-node: (Mn_p203757 $e0 $x0)
(And (Member $x0 new) (Past $e0) (Theme $e0 $x0))

;; p203758  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000099 tierC-000100 tierC-000123
;;   meta-node: (Mn_p203758 $e0 $x0)
(And (Member $x0 person) (Past $e0) (Theme $e0 $x0))

;; p203759  support 4 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000047 tierC-000048 tierC-000235
;;   meta-node: (Mn_p203759 $e0 $x0 $x1)
(And (Member $x0 person) (Possession $x1 $x0) (Theme $e0 $x1))

;; p203760  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000805 tierB-001384 tierB-001894
;;   meta-node: (Mn_p203760 $e0 $x0)
(And (Member $x0 sound) (Past $e0) (Patient $e0 $x0))

;; p203763  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203763 $e0 $x0)
(And (Member free_soil_party party) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203764  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203764 $e0 $x0)
(And (Member republican_party party) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203765  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000409 tierB-001070 tierB-001262
;;   meta-node: (Mn_p203765 $e0 $x0 $x1)
(And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))

;; p203766  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000087 tierB-001515
;;   meta-node: (Mn_p203766 $e0 $e1)
(And (Past $e0) (Past $e1) (Theme $e0 $e1))

;; p203767  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000320 tierB-000779
;;   meta-node: (Mn_p203767 $e0 $x0 $x1)
(And (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p203768  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203768 $e0 $x0)
(And (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203769  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203769 $e0 $x0)
(And (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203770  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000147 tierB-000258 tierC-000123
;;   meta-node: (Mn_p203770 $e0 $e1 $x0)
(And (Past $e0) (Theme $e1 $x0) (To $e0 $e1))

;; p203992  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203992 $x0)
(And (Member free_soil_party party) (Possession $x0 free_soil_party))

;; p203993  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203993 $x0)
(And (Member republican_party party) (Possession $x0 republican_party))

;; p204124  support 4 (occ 4)  size 2  root regional_unit (constant)  depth 1
;;   e.g. tierC-000031 tierC-000032 tierC-000081
;;   meta-node: (Mn_p204124 regional_unit)
(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))

;; p204173  support 4 (occ 4)  size 1  root metropolitan_statistical_area (constant)  depth 1
;;   e.g. tierC-000249 tierC-000250 tierC-000275
;;   meta-node: (Mn_p204173 metropolitan_statistical_area)
(Inheritance metropolitan_statistical_area area)

;; p204174  support 4 (occ 4)  size 1  root regional_unit (constant)  depth 1
;;   e.g. tierC-000031 tierC-000032 tierC-000081
;;   meta-node: (Mn_p204174 regional_unit)
(Inheritance regional_unit regional)

;; p204175  support 4 (occ 4)  size 1  root regional_unit (constant)  depth 1
;;   e.g. tierC-000031 tierC-000032 tierC-000081
;;   meta-node: (Mn_p204175 regional_unit)
(Inheritance regional_unit unit)

;; p204176  support 4 (occ 4)  size 1  root free_soil_party (constant)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204176 free_soil_party)
(Member free_soil_party party)

;; p204177  support 4 (occ 4)  size 1  root republican_party (constant)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204177 republican_party)
(Member republican_party party)

;; p204216  support 4 (occ 6)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001933 tierC-000025
;;   meta-node: (Mn_p204216 $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0))

;; p204218  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204218 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Past $e0))

;; p204219  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204219 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Patient $e0 $x1))

;; p204220  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204220 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Past $e0) (Patient $e0 $x1))

;; p204222  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   meta-node: (Mn_p204222 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))

;; p204223  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204223 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))

;; p204224  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204224 $e0 $x0)
(And (Location $e0 kazakhstan) (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p204278  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000688 tierC-000001 tierC-000121
;;   meta-node: (Mn_p204278 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0))

;; p204279  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204279 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build))

;; p204280  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204280 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Past $e0))

;; p204281  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204281 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Patient $e0 $x1))

;; p204282  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000768 tierB-001254
;;   meta-node: (Mn_p204282 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))

;; p204284  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001197 tierB-001399 tierC-000353
;;   meta-node: (Mn_p204284 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 kill) (Past $e0))

;; p204285  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001197 tierB-001399 tierC-000353
;;   meta-node: (Mn_p204285 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 kill) (Patient $e0 $x1))

;; p204287  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   meta-node: (Mn_p204287 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 start) (Past $e0))

;; p204288  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   meta-node: (Mn_p204288 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))

;; p204290  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000942 tierB-000978 tierC-000071
;;   meta-node: (Mn_p204290 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 take) (Theme $e0 $x1))

;; p204292  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000616 tierB-001000
;;   meta-node: (Mn_p204292 $e0 $x0)
(And (Already $e0) (Past $e0) (Patient $e0 $x0))

;; p204294  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p204294 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))

;; p204295  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   meta-node: (Mn_p204295 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0))

;; p204298  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001397
;;   meta-node: (Mn_p204298 $e0 $x0)
(And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))

;; p204299  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204299 $e0 $e1)
(And (For $e0 $e1) (Member $e0 win) (Past $e0))

;; p204300  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204300 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))

;; p204301  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000929 tierB-001044
;;   meta-node: (Mn_p204301 $e0 $x0)
(And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))

;; p204302  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000482 tierB-001453 tierB-001579
;;   meta-node: (Mn_p204302 $e0 $x0 $x1)
(And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p204303  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204303 $e0 $x0)
(And (GroupOf $x0 view) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p204304  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204304 $e0 $x0)
(And (GroupOf $x0 view) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p204305  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p204305 $e0 $x0)
(And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p204306  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000706 tierC-000243
;;   meta-node: (Mn_p204306 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 find) (Past $e0))

;; p204307  support 4 (occ 6)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001933 tierC-000025
;;   meta-node: (Mn_p204307 $e1 $e0 $x0)
(And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))

;; p204308  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204308 $e0)
(And (Location $e0 kazakhstan) (Member $e0 build) (Past $e0))

;; p204309  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204309 $e0 $x0)
(And (Location $e0 kazakhstan) (Member $e0 build) (Patient $e0 $x0))

;; p204310  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204310 $e0 $x0)
(And (Location $e0 kazakhstan) (Past $e0) (Patient $e0 $x0))

;; p204311  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001568 tierC-000199 tierC-000200
;;   meta-node: (Mn_p204311 $e0 $x0)
(And (Member $e0 bear) (Past $e0) (Patient $e0 $x0))

;; p204312  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000010 tierC-000091 tierC-000297
;;   meta-node: (Mn_p204312 $e0 $x0)
(And (Member $e0 direct) (Past $e0) (Patient $e0 $x0))

;; p204314  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   meta-node: (Mn_p204314 $e0 $x0)
(And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))

;; p204315  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001185
;;   meta-node: (Mn_p204315 $e0 $e1)
(And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))

;; p204316  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001504 tierB-001594
;;   meta-node: (Mn_p204316 $e0 $e1)
(And (Member $e0 make) (Past $e0) (Result $e0 $e1))

;; p204318  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001446 tierB-001816
;;   meta-node: (Mn_p204318 $e0 $e1 $x0)
(And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))

;; p204319  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000942 tierB-000987
;;   meta-node: (Mn_p204319 $e0 $x0)
(And (Member $e0 take) (Past $e0) (Theme $e0 $x0))

;; p204321  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierB-001120 tierB-001221
;;   meta-node: (Mn_p204321 $e0 $x0)
(And (Ongoing $e0) (Past $e0) (Theme $e0 $x0))

;; p204322  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
;;   meta-node: (Mn_p204322 $e0 $e1 $x0)
(And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))

;; p204323  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000730 tierC-000123
;;   meta-node: (Mn_p204323 $e0 $e1 $x0)
(And (Past $e0) (Theme $e0 $x0) (To $e0 $e1))

;; p204457  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-000712 tierB-001663
;;   meta-node: (Mn_p204457 $e0 $x0 $x1)
(And (Agent $e0 $x0) (For $e0 $x1))

;; p204458  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001316 tierB-001457 tierB-001530
;;   meta-node: (Mn_p204458 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 boy))

;; p204459  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000387 tierB-000656 tierB-000712
;;   meta-node: (Mn_p204459 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 student))

;; p204460  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204460 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan))

;; p204462  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000768 tierB-001254
;;   meta-node: (Mn_p204462 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 contain))

;; p204465  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   meta-node: (Mn_p204465 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 jump))

;; p204466  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001197 tierB-001399 tierC-000353
;;   meta-node: (Mn_p204466 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 kill))

;; p204467  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001086 tierB-001782 tierC-000019
;;   meta-node: (Mn_p204467 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 lead))

;; p204469  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000784 tierB-000975 tierC-000197
;;   meta-node: (Mn_p204469 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 sell))

;; p204470  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   meta-node: (Mn_p204470 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 start))

;; p204471  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
;;   meta-node: (Mn_p204471 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 swim))

;; p204472  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000469 tierB-000470 tierB-001130
;;   meta-node: (Mn_p204472 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 try))

;; p204473  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001004 tierB-001962 tierC-000089
;;   meta-node: (Mn_p204473 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 write))

;; p204474  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000073 tierB-000381 tierB-001183
;;   meta-node: (Mn_p204474 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 cat))

;; p204475  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000520 tierB-001302 tierC-000017
;;   meta-node: (Mn_p204475 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 family))

;; p204476  support 4 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001004 tierB-001743 tierC-000123
;;   meta-node: (Mn_p204476 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 father))

;; p204477  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001800 tierB-001885 tierC-000217
;;   meta-node: (Mn_p204477 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 government))

;; p204478  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001205
;;   meta-node: (Mn_p204478 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Over $e0 $x1))

;; p204480  support 4 (occ 4)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000034 tierB-000616 tierB-001000
;;   meta-node: (Mn_p204480 $e0)
(And (Already $e0) (Past $e0))

;; p204482  support 4 (occ 5)  size 2  root appear (constant)  depth 1
;;   e.g. tierC-000050 tierC-000128 tierC-000259
;;   meta-node: (Mn_p204482 appear $e0)
(And (Also appear $e0) (Past $e0))

;; p204483  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   meta-node: (Mn_p204483 $e0 $e1)
(And (But $e0 $e1) (Past $e0))

;; p204484  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   meta-node: (Mn_p204484 $e0 $e1)
(And (But $e0 $e1) (Past $e1))

;; p204486  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000372 tierB-000794 tierB-000814
;;   meta-node: (Mn_p204486 $x0 $x1)
(And (Cardinality $x0 <num>) (LocatedIn $x0 $x1))

;; p204487  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000867 tierB-001782 tierB-001809
;;   meta-node: (Mn_p204487 $e0 $e1)
(And (During $e0 $e1) (Past $e0))

;; p204488  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000502 tierB-001782 tierB-001809
;;   meta-node: (Mn_p204488 $e0 $e1)
(And (During $e0 $e1) (Past $e1))

;; p204489  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000844 tierB-001017
;;   meta-node: (Mn_p204489 $e0 $x0)
(And (During $e0 $x0) (Past $e0))

;; p204490  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001517
;;   meta-node: (Mn_p204490 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Like $e0 $x1))

;; p204491  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   meta-node: (Mn_p204491 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 bad))

;; p204493  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   meta-node: (Mn_p204493 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 bad))

;; p204494  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000919 tierB-001384 tierB-001519
;;   meta-node: (Mn_p204494 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Possession $x0 $x1))

;; p204495  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-001515 tierB-001977 tierC-000001
;;   meta-node: (Mn_p204495 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Theme $e1 $e0))

;; p204496  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000744 tierB-000880
;;   meta-node: (Mn_p204496 $e0 $x0)
(And (Experiencer $e0 $x0) (Time $e0 now))

;; p204497  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204497 $e0 $e1)
(And (For $e0 $e1) (Member $e0 win))

;; p204498  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000929 tierB-001044
;;   meta-node: (Mn_p204498 $e0 $x0)
(And (Goal $e0 $x0) (Member $e0 walk))

;; p204499  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p204499 $e0 $x0)
(And (GroupOf $x0 child) (Theme $e0 $x0))

;; p204500  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204500 $x0)
(And (GroupOf $x0 view) (Possession $x0 free_soil_party))

;; p204501  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204501 $x0)
(And (GroupOf $x0 view) (Possession $x0 republican_party))

;; p204502  support 4 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204502 $e0 $x0)
(And (GroupOf $x0 view) (Theme $e0 $x0))

;; p204503  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p204503 $e0)
(And (Holder $e0 kristoffer) (Member $e0 have))

;; p204504  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p204504 $e0 $x0)
(And (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p204506  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000202 tierB-000208 tierB-000524
;;   meta-node: (Mn_p204506 $x0 $x1 $x2)
(And (LocatedIn $x0 $x1) (PartOf $x1 $x2))

;; p204507  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001091 tierC-000135 tierC-000136
;;   meta-node: (Mn_p204507 $e0 $x0 $x1)
(And (Location $e0 $x0) (Location $e0 $x1))

;; p204508  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001003 tierB-001753 tierC-000041
;;   meta-node: (Mn_p204508 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 sleep))

;; p204509  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
;;   meta-node: (Mn_p204509 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 walk))

;; p204510  support 4 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000047 tierB-000502 tierB-001041
;;   meta-node: (Mn_p204510 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 table))

;; p204511  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000111 tierC-000112 tierC-000121
;;   meta-node: (Mn_p204511 $e0)
(And (Location $e0 japan) (Past $e0))

;; p204512  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204512 $e0)
(And (Location $e0 kazakhstan) (Member $e0 build))

;; p204513  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204513 $e0)
(And (Location $e0 kazakhstan) (Past $e0))

;; p204514  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204514 $e0 $x0)
(And (Location $e0 kazakhstan) (Patient $e0 $x0))

;; p204515  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000258 tierC-000353
;;   meta-node: (Mn_p204515 $e0)
(And (Manner $e0 directly) (Past $e0))

;; p204517  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000050 tierC-000128 tierC-000259
;;   meta-node: (Mn_p204517 $e0)
(And (Member $e0 appear) (Past $e0))

;; p204518  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   meta-node: (Mn_p204518 $e1 $e0)
(And (Member $e0 bad) (Result $e1 $e0))

;; p204519  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001568 tierC-000199 tierC-000200
;;   meta-node: (Mn_p204519 $e0 $x0)
(And (Member $e0 bear) (Patient $e0 $x0))

;; p204520  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-000849
;;   meta-node: (Mn_p204520 $e0 $x0)
(And (Member $e0 buy) (Theme $e0 $x0))

;; p204524  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000401 tierB-000563 tierB-001544
;;   meta-node: (Mn_p204524 $e0)
(And (Member $e0 decide) (Past $e0))

;; p204526  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000010 tierC-000091 tierC-000297
;;   meta-node: (Mn_p204526 $e0)
(And (Member $e0 direct) (Past $e0))

;; p204527  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000658 tierB-001251 tierC-000111
;;   meta-node: (Mn_p204527 $e0)
(And (Member $e0 discover) (Past $e0))

;; p204528  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000658 tierB-001251 tierC-000111
;;   meta-node: (Mn_p204528 $e0 $x0)
(And (Member $e0 discover) (Theme $e0 $x0))

;; p204530  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   meta-node: (Mn_p204530 $e0)
(And (Member $e0 jump) (Past $e0))

;; p204531  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-001487 tierC-000285
;;   meta-node: (Mn_p204531 $e0)
(And (Member $e0 open) (Past $e0))

;; p204533  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000648 tierB-000816
;;   meta-node: (Mn_p204533 $e0 $x0)
(And (Member $e0 play) (Theme $e0 $x0))

;; p204540  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
;;   meta-node: (Mn_p204540 $e0)
(And (Member $e0 swim) (Ongoing $e0))

;; p204542  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-000832
;;   meta-node: (Mn_p204542 $e0 $e1)
(And (Member $e0 turn) (Result $e0 $e1))

;; p204543  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000282 tierB-000404 tierB-001304
;;   meta-node: (Mn_p204543 $e0 $e1)
(And (Member $e0 use) (To $e0 $e1))

;; p204545  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000846 tierB-001988 tierC-000311
;;   meta-node: (Mn_p204545 $e0)
(And (Member $e0 want) (Past $e0))

;; p204546  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204546 $e0 $x0)
(And (Member $x0 emmy) (Theme $e0 $x0))

;; p204547  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000017 tierC-000018 tierC-000121
;;   meta-node: (Mn_p204547 $x0 $x1)
(And (Member $x0 family) (Possession $x0 $x1))

;; p204548  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204548 $e0 $x0)
(And (Member $x0 hotel) (Patient $e0 $x0))

;; p204549  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000176 tierB-000277 tierB-001476
;;   meta-node: (Mn_p204549 $e0 $x0)
(And (Member $x0 tree) (Patient $e0 $x0))

;; p204550  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000409 tierB-001070 tierB-001262
;;   meta-node: (Mn_p204550 $e0 $x0 $x1)
(And (Of $x0 $x1) (Theme $e0 $x0))

;; p204551  support 4 (occ 4)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000517 tierB-001891 tierB-001910
;;   meta-node: (Mn_p204551 $e0)
(And (Ongoing $e0) (Probably $e0))

;; p204552  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000485 tierB-000677
;;   meta-node: (Mn_p204552 $e0 $x0)
(And (Ongoing $e0) (Source $e0 $x0))

;; p204553  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-001130 tierB-001557
;;   meta-node: (Mn_p204553 $e0 $e1)
(And (Ongoing $e0) (Theme $e0 $e1))

;; p204554  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001534
;;   meta-node: (Mn_p204554 $e0 $x0)
(And (Over $e0 $x0) (Past $e0))

;; p204555  support 4 (occ 5)  size 2  root $e1 (event)  depth 1
;;   e.g. tierB-000030 tierB-000087 tierB-001515
;;   meta-node: (Mn_p204555 $e1 $e0)
(And (Past $e0) (Theme $e1 $e0))

;; p204556  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001629
;;   meta-node: (Mn_p204556 $e0)
(And (Past $e0) (TimeAtLeast $e0 (Year <num>)))

;; p204557  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000320 tierB-000779
;;   meta-node: (Mn_p204557 $e0 $x0 $x1)
(And (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p204558  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001064 tierB-001624 tierC-000241
;;   meta-node: (Mn_p204558 $e0 $x0)
(And (Patient $e0 $x0) (Time $e0 now))

;; p204559  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204559 $e0 $x0)
(And (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p204560  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204560 $e0 $x0)
(And (Possession $x0 republican_party) (Theme $e0 $x0))

;; p204561  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000339 tierB-000400 tierB-000401
;;   meta-node: (Mn_p204561 $e0 $e1 $x0)
(And (Theme $e0 $e1) (Theme $e1 $x0))

;; p204683  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p204683 $e0)
(Agent $e0 jica)

;; p204684  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000842 tierB-001878 tierC-000133
;;   meta-node: (Mn_p204684 $x0 $e0)
(Also $x0 $e0)

;; p204685  support 4 (occ 5)  size 1  root appear (constant)  depth 1
;;   e.g. tierC-000050 tierC-000128 tierC-000259
;;   meta-node: (Mn_p204685 appear $e0)
(Also appear $e0)

;; p204686  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000374 tierB-001696 tierB-001867
;;   meta-node: (Mn_p204686 $e0 $x0)
(Beneficiary $e0 $x0)

;; p204687  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierB-001332 tierC-000121
;;   meta-node: (Mn_p204687 $e0 $x0)
(CoAgent $e0 $x0)

;; p204690  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000844 tierB-001017
;;   meta-node: (Mn_p204690 $e0 $x0)
(During $e0 $x0)

;; p204691  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000238 tierB-000313
;;   meta-node: (Mn_p204691 $e0)
(Every $e0 <num> day)

;; p204692  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000308 tierB-000555 tierB-001455
;;   meta-node: (Mn_p204692 $x0 $e0)
(For $x0 $e0)

;; p204701  support 4 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204701 $x0)
(GroupOf $x0 view)

;; p204702  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p204702 $e0)
(Holder $e0 kristoffer)

;; p204704  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000111 tierC-000112 tierC-000121
;;   meta-node: (Mn_p204704 $e0)
(Location $e0 japan)

;; p204705  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p204705 $e0)
(Location $e0 kazakhstan)

;; p204706  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000258 tierC-000353
;;   meta-node: (Mn_p204706 $e0)
(Manner $e0 directly)

;; p204707  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000666 tierB-001496 tierB-001572
;;   meta-node: (Mn_p204707 $e0)
(Manner $e0 immediately)

;; p204708  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000407 tierB-000947
;;   meta-node: (Mn_p204708 $e0)
(Manner $e0 often)

;; p204711  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   meta-node: (Mn_p204711 $e0)
(Member $e0 bad)

;; p204713  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-000849
;;   meta-node: (Mn_p204713 $e0)
(Member $e0 buy)

;; p204714  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000177 tierC-000284 tierC-000341
;;   meta-node: (Mn_p204714 $e0)
(Member $e0 conduct)

;; p204719  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000401 tierB-000563 tierB-001544
;;   meta-node: (Mn_p204719 $e0)
(Member $e0 decide)

;; p204720  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000838 tierB-001967 tierC-000199
;;   meta-node: (Mn_p204720 $e0)
(Member $e0 die)

;; p204721  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000658 tierB-001251 tierC-000111
;;   meta-node: (Mn_p204721 $e0)
(Member $e0 discover)

;; p204722  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000121 tierB-000801
;;   meta-node: (Mn_p204722 $e0)
(Member $e0 fly)

;; p204727  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   meta-node: (Mn_p204727 $e0)
(Member $e0 jump)

;; p204730  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000649 tierB-001008 tierB-001762
;;   meta-node: (Mn_p204730 $e0)
(Member $e0 pass)

;; p204732  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000099 tierC-000100 tierC-000359
;;   meta-node: (Mn_p204732 $e0)
(Member $e0 replace)

;; p204733  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000607 tierB-001436 tierB-001566
;;   meta-node: (Mn_p204733 $e0)
(Member $e0 require)

;; p204746  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204746 $x0)
(Member $x0 emmy)

;; p204747  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001004 tierB-001743 tierC-000123
;;   meta-node: (Mn_p204747 $x0)
(Member $x0 father)

;; p204748  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001442 tierC-000116 tierC-000167
;;   meta-node: (Mn_p204748 $x0)
(Member $x0 former)

;; p204750  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000522 tierB-001329 tierB-001470
;;   meta-node: (Mn_p204750 $x0)
(Member $x0 great)

;; p204755  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000036 tierB-000783 tierB-001280
;;   meta-node: (Mn_p204755 $x0)
(Member $x0 little)

;; p204759  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000135 tierC-000136 tierC-000211
;;   meta-node: (Mn_p204759 $x0)
(Member $x0 northern)

;; p204761  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000202 tierB-000792 tierB-001738
;;   meta-node: (Mn_p204761 $x0)
(Member $x0 other)

;; p204765  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000019 tierB-000832 tierB-001268
;;   meta-node: (Mn_p204765 $x0)
(Member $x0 red)

;; p204771  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000135 tierC-000136 tierC-000279
;;   meta-node: (Mn_p204771 $x0)
(Member $x0 southern)

;; p204775  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000979 tierB-001466 tierC-000135
;;   meta-node: (Mn_p204775 $x0)
(Member $x0 view)

;; p204777  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000097 tierC-000098 tierC-000177
;;   meta-node: (Mn_p204777 $x0)
(Member $x0 widespread)

;; p204779  support 4 (occ 4)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000218 tierB-000969 tierB-000978
;;   meta-node: (Mn_p204779 $e0)
(Might $e0)

;; p204780  support 4 (occ 4)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000450 tierB-000971 tierB-001687
;;   meta-node: (Mn_p204780 $e0)
(Permitted $e0)

;; p204781  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204781 $x0)
(Possession $x0 free_soil_party)

;; p204782  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p204782 $x0)
(Possession $x0 republican_party)

;; p204784  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000251 tierB-000828 tierB-000903
;;   meta-node: (Mn_p204784 $e0 $x0)
(Time $e0 $x0)

;; p204785  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000193 tierC-000194 tierC-000315
;;   meta-node: (Mn_p204785 $e0)
(Time $e0 later)

;; p204786  support 4 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001171 tierB-001275 tierB-001387
;;   meta-node: (Mn_p204786 $e0)
(Time $e0 this_year)

;; p204787  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000212 tierB-000686 tierB-001588
;;   meta-node: (Mn_p204787 $e0)
(Time $e0 tonight)

;; p204788  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001629
;;   meta-node: (Mn_p204788 $e0)
(TimeAtLeast $e0 (Year <num>))

;; p204824  support 3 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204824 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2))

;; p204827  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p204827 $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0))

;; p204829  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p204829 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Member $x0 company))

;; p204830  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p204830 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Past $e0))

;; p204831  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p204831 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Patient $e0 $x1))

;; p204832  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p204832 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x1 hotel) (Patient $e0 $x1))

;; p204833  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p204833 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1))

;; p204834  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p204834 $e0 $e1 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1))

;; p204836  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   meta-node: (Mn_p204836 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Past $e0))

;; p204837  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   meta-node: (Mn_p204837 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Patient $e0 $x1))

;; p204838  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204838 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1) (Theme $e0 $x2))

;; p204840  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p204840 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1))

;; p204843  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000258 tierC-000123 tierC-000124
;;   meta-node: (Mn_p204843 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Theme $e1 $x1) (To $e0 $e1))

;; p204846  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204846 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Possession $x1 free_soil_party) (Theme $e0 $x1) (Theme $e0 $x2))

;; p204847  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204847 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Possession $x1 republican_party) (Theme $e0 $x1) (Theme $e0 $x2))

;; p204852  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
;;   meta-node: (Mn_p204852 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0))

;; p204854  support 3 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   meta-node: (Mn_p204854 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))

;; p204859  support 3 (occ 3)  size 4  root $e1 (event)  depth 3
;;   e.g. tierB-001594 tierC-000241 tierC-000242
;;   meta-node: (Mn_p204859 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0))

;; p204861  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204861 $e0 $e1)
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Past $e0))

;; p204862  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204862 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Theme $e0 $x0))

;; p204863  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p204863 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e1 portray) (Member $x0 emmy) (Theme $e0 $x0))

;; p204875  support 3 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204875 $e0 $x0 $x1)
(And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))

;; p204876  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204876 $e0 $x0 $x1)
(And (GroupOf $x0 view) (Possession $x0 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p204877  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204877 $e0 $x0 $x1)
(And (GroupOf $x0 view) (Possession $x0 republican_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p204878  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204878 $e0 $x0 $x1)
(And (GroupOf $x0 view) (Possession $x1 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p204879  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204879 $e0 $x0 $x1)
(And (GroupOf $x0 view) (Possession $x1 republican_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p204882  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p204882 $e1 $e0 $x0)
(And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))

;; p204889  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p204889 $e0 $x0)
(And (Location $e0 eskisehir) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))

;; p204893  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
;;   meta-node: (Mn_p204893 $e1 $e0 $x0)
(And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))

;; p204895  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001394 tierC-000025 tierC-000026
;;   meta-node: (Mn_p204895 $e0 $e1 $x0)
(And (Member $e0 begin) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))

;; p204905  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204905 $e0 $x0 $x1)
(And (Member free_soil_party party) (Possession $x0 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p204906  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204906 $e0 $x0 $x1)
(And (Member republican_party party) (Possession $x0 republican_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p204909  support 3 (occ 3)  size 4  root $e1 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
;;   meta-node: (Mn_p204909 $e1 $e0 $x0)
(And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))

;; p204911  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204911 $e0 $x0 $x1)
(And (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p204912  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p204912 $e0 $x0 $x1)
(And (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p205979  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierB-001302 tierC-000122
;;   meta-node: (Mn_p205979 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Before $e0 $e1) (Past $e1))

;; p205980  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000738 tierB-000772 tierB-001534
;;   meta-node: (Mn_p205980 $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0))

;; p205981  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000101 tierB-000379 tierB-001266
;;   meta-node: (Mn_p205981 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))

;; p205985  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000747 tierB-001920 tierB-001976
;;   meta-node: (Mn_p205985 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1))

;; p205986  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001457 tierB-001530 tierB-001840
;;   meta-node: (Mn_p205986 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0))

;; p205987  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001125 tierB-001245 tierB-001511
;;   meta-node: (Mn_p205987 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))

;; p205989  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000316 tierC-000041 tierC-000042
;;   meta-node: (Mn_p205989 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 person))

;; p205990  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p205990 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company))

;; p205991  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   meta-node: (Mn_p205991 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person))

;; p205992  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000470 tierB-001130 tierB-001773
;;   meta-node: (Mn_p205992 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))

;; p205993  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001302 tierC-000017 tierC-000018
;;   meta-node: (Mn_p205993 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 family) (Past $e0))

;; p205994  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001743 tierC-000123 tierC-000124
;;   meta-node: (Mn_p205994 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 father) (Past $e0))

;; p205995  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001773 tierB-001801 tierB-001803
;;   meta-node: (Mn_p205995 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 man) (Past $e0))

;; p205996  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000045 tierB-000132 tierB-000298
;;   meta-node: (Mn_p205996 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 plane) (Past $e0))

;; p205997  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000747 tierB-000950 tierB-001926
;;   meta-node: (Mn_p205997 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 door) (Patient $e0 $x1))

;; p205998  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001040 tierC-000123 tierC-000124
;;   meta-node: (Mn_p205998 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 thing) (Theme $e0 $x1))

;; p205999  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001066 tierB-001243 tierB-001586
;;   meta-node: (Mn_p205999 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (PartOf $x1 $x2) (Theme $e0 $x1))

;; p206000  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000316 tierB-001720 tierB-001911
;;   meta-node: (Mn_p206000 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0))

;; p206002  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001900 tierC-000117 tierC-000118
;;   meta-node: (Mn_p206002 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Possession $x1 $x2) (Theme $e0 $x1))

;; p206004  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000258 tierC-000123 tierC-000124
;;   meta-node: (Mn_p206004 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Theme $e1 $x1) (To $e0 $e1))

;; p206006  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001625 tierC-000311 tierC-000312
;;   meta-node: (Mn_p206006 $e0 $e1)
(And (Because $e0 $e1) (Past $e0) (Past $e1))

;; p206007  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierC-000121 tierC-000122
;;   meta-node: (Mn_p206007 $e0 $e1)
(And (Before $e0 $e1) (Measure $e0 duration <num> year) (Past $e1))

;; p206008  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierC-000001 tierC-000002
;;   meta-node: (Mn_p206008 $e0 $e1 $x0)
(And (Before $e0 $e1) (Past $e1) (Patient $e0 $x0))

;; p206009  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
;;   meta-node: (Mn_p206009 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))

;; p206010  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000838 tierC-000353 tierC-000354
;;   meta-node: (Mn_p206010 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Location $e0 $x1) (Patient $e0 $x0))

;; p206011  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001782 tierB-001809 tierC-000231
;;   meta-node: (Mn_p206011 $e0 $e1)
(And (During $e0 $e1) (Past $e0) (Past $e1))

;; p206013  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   meta-node: (Mn_p206013 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))

;; p206015  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   meta-node: (Mn_p206015 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))

;; p206017  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000476 tierB-000654 tierB-000832
;;   meta-node: (Mn_p206017 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))

;; p206018  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000013 tierC-000014 tierC-000121
;;   meta-node: (Mn_p206018 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 person) (Past $e0))

;; p206020  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   meta-node: (Mn_p206020 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))

;; p206021  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-001515 tierB-001977 tierC-000001
;;   meta-node: (Mn_p206021 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Past $e1) (Theme $e1 $e0))

;; p206022  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p206022 $e0 $e1)
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray))

;; p206023  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p206023 $e0 $e1)
(And (For $e0 $e1) (Member $e1 portray) (Past $e0))

;; p206024  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p206024 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e1 portray) (Theme $e0 $x0))

;; p206028  support 3 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p206028 $e0 $x0 $x1)
(And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))

;; p206032  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000048 tierB-000371 tierB-000524
;;   meta-node: (Mn_p206032 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))

;; p206034  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierC-000243 tierC-000244
;;   meta-node: (Mn_p206034 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 bench) (Past $e0))

;; p206035  support 3 (occ 5)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p206035 $e1 $e0 $x0)
(And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))

;; p206037  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206037 $e0 $x0)
(And (Location $e0 eskisehir) (Member $x0 hotel) (Patient $e0 $x0))

;; p206038  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
;;   meta-node: (Mn_p206038 $e1 $e0)
(And (Member $e0 bad) (Past $e1) (Result $e1 $e0))

;; p206039  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000199 tierC-000200 tierC-000358
;;   meta-node: (Mn_p206039 $e0 $x0)
(And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))

;; p206040  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001394 tierC-000025 tierC-000026
;;   meta-node: (Mn_p206040 $e0 $e1 $x0)
(And (Member $e0 begin) (Patient $e1 $x0) (Theme $e0 $e1))

;; p206042  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   meta-node: (Mn_p206042 $e0 $e1)
(And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))

;; p206043  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
;;   meta-node: (Mn_p206043 $e0 $x0)
(And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))

;; p206044  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001163 tierB-001302
;;   meta-node: (Mn_p206044 $e0 $x0)
(And (Member $x0 fire) (Past $e0) (Patient $e0 $x0))

;; p206045  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000441 tierB-001690 tierC-000095
;;   meta-node: (Mn_p206045 $e0 $x0)
(And (Member $x0 house) (Past $e0) (Theme $e0 $x0))

;; p206046  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000876 tierB-001070 tierB-001423
;;   meta-node: (Mn_p206046 $e0 $x0)
(And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))

;; p206047  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001156 tierC-000011 tierC-000012
;;   meta-node: (Mn_p206047 $e0 $x0)
(And (Member $x0 song) (Past $e0) (Theme $e0 $x0))

;; p206048  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001520 tierB-001622 tierB-001761
;;   meta-node: (Mn_p206048 $e0 $x0)
(And (Member $x0 thing) (Obligated $e0) (Patient $e0 $x0))

;; p206049  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001130 tierB-001557 tierB-001940
;;   meta-node: (Mn_p206049 $e0 $e1 $x0)
(And (Ongoing $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p206052  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000485 tierB-000547 tierB-001219
;;   meta-node: (Mn_p206052 $e0 $e1 $x0)
(And (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1))

;; p206053  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000339 tierB-000400 tierB-000401
;;   meta-node: (Mn_p206053 $e0 $e1 $x0)
(And (Past $e0) (Theme $e0 $e1) (Theme $e1 $x0))

;; p206054  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p206054 $e0 $x0 $x1)
(And (Possession $x0 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p206055  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p206055 $e0 $x0 $x1)
(And (Possession $x0 republican_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p206538  support 3 (occ 3)  size 2  root metropolitan_statistical_area (constant)  depth 1
;;   e.g. tierC-000249 tierC-000250 tierC-000275
;;   meta-node: (Mn_p206538 metropolitan_statistical_area)
(And (Inheritance metropolitan_statistical_area area) (Inheritance metropolitan_statistical_area metropolitan))

;; p206589  support 3 (occ 3)  size 1  root border_section (constant)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p206589 border_section)
(Inheritance border_section section)

;; p206591  support 3 (occ 3)  size 1  root living_room (constant)  depth 1
;;   e.g. tierB-001573 tierB-001670 tierB-001938
;;   meta-node: (Mn_p206591 living_room)
(Inheritance living_room room)

;; p206592  support 3 (occ 3)  size 1  root metropolitan_statistical_area (constant)  depth 1
;;   e.g. tierC-000249 tierC-000250 tierC-000275
;;   meta-node: (Mn_p206592 metropolitan_statistical_area)
(Inheritance metropolitan_statistical_area metropolitan)

;; p206646  support 3 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p206646 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2))

;; p206647  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p206647 $e1 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0))

;; p206648  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206648 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Past $e0))

;; p206649  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206649 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x1))

;; p206650  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206650 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x1))

;; p206656  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p206656 $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p206657  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p206657 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1) (Theme $e0 $x2))

;; p206659  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p206659 $e1 $e0 $x0 $x1)
(And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p206660  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206660 $e0 $x0)
(And (Location $e0 eskisehir) (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p206792  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000453 tierB-001266 tierB-001626
;;   meta-node: (Mn_p206792 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1))

;; p206793  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   meta-node: (Mn_p206793 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))

;; p206794  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-001132 tierB-001860
;;   meta-node: (Mn_p206794 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2))

;; p206795  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   meta-node: (Mn_p206795 $e0 $x0)
(And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))

;; p206796  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206796 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build))

;; p206797  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206797 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0))

;; p206798  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206798 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Patient $e0 $x1))

;; p206799  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   meta-node: (Mn_p206799 $e0 $x0)
(And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))

;; p206800  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   meta-node: (Mn_p206800 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))

;; p206801  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   meta-node: (Mn_p206801 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))

;; p206802  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   meta-node: (Mn_p206802 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))

;; p206803  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-001649 tierB-001875
;;   meta-node: (Mn_p206803 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))

;; p206804  support 3 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000728 tierC-000025 tierC-000026
;;   meta-node: (Mn_p206804 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 create) (Patient $e0 $x1))

;; p206806  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierC-000095 tierC-000096
;;   meta-node: (Mn_p206806 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 follow) (Past $e0))

;; p206807  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001086 tierB-001782 tierC-000019
;;   meta-node: (Mn_p206807 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lead) (Theme $e0 $x1))

;; p206809  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001125 tierB-001433 tierB-001840
;;   meta-node: (Mn_p206809 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))

;; p206810  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   meta-node: (Mn_p206810 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))

;; p206811  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   meta-node: (Mn_p206811 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))

;; p206812  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000469 tierB-000470 tierB-001773
;;   meta-node: (Mn_p206812 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 try) (Past $e0))

;; p206813  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-001130 tierB-001773
;;   meta-node: (Mn_p206813 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))

;; p206814  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001243 tierC-000173 tierC-000174
;;   meta-node: (Mn_p206814 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 use) (Theme $e0 $x1))

;; p206817  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   meta-node: (Mn_p206817 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 write) (Past $e0))

;; p206818  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   meta-node: (Mn_p206818 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 write) (Patient $e0 $x1))

;; p206819  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001534
;;   meta-node: (Mn_p206819 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))

;; p206820  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000747 tierB-001920 tierB-001976
;;   meta-node: (Mn_p206820 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1))

;; p206821  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p206821 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Theme $e0 $x1) (Theme $e0 $x2))

;; p206822  support 3 (occ 5)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierC-000123 tierC-000124
;;   meta-node: (Mn_p206822 $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Theme $e0 $x1) (To $e1 $e0))

;; p206823  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierC-000001 tierC-000002
;;   meta-node: (Mn_p206823 $e0 $e1 $x0)
(And (Before $e0 $e1) (Past $e0) (Patient $e0 $x0))

;; p206824  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001134 tierB-001302 tierC-000002
;;   meta-node: (Mn_p206824 $e0 $e1 $x0)
(And (Before $e0 $e1) (Past $e1) (Patient $e1 $x0))

;; p206825  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-001667 tierC-000014
;;   meta-node: (Mn_p206825 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (In $e0 $x1) (Past $e0))

;; p206826  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000339 tierB-000455 tierB-001496
;;   meta-node: (Mn_p206826 $e0 $e1 $x0)
(And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))

;; p206827  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001563 tierB-001579 tierB-001902
;;   meta-node: (Mn_p206827 $e0 $x0)
(And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))

;; p206828  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   meta-node: (Mn_p206828 $e0 $x0)
(And (Goal $e0 $x0) (Member $e0 come) (Past $e0))

;; p206829  support 3 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000072 tierC-000213 tierC-000214
;;   meta-node: (Mn_p206829 $e0 $x0 $x1)
(And (Instrument $e0 $x0) (Member $e0 build) (Patient $e0 $x1))

;; p206830  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
;;   meta-node: (Mn_p206830 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))

;; p206831  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000805 tierB-000951
;;   meta-node: (Mn_p206831 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 walk) (Past $e0))

;; p206832  support 3 (occ 5)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   meta-node: (Mn_p206832 $e1 $e0 $x0 $x1)
(And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p206833  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206833 $e0)
(And (Location $e0 eskisehir) (Member $e0 build) (Past $e0))

;; p206834  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206834 $e0 $x0)
(And (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x0))

;; p206835  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p206835 $e0 $x0)
(And (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x0))

;; p206836  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   meta-node: (Mn_p206836 $e0 $x0)
(And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))

;; p206837  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierC-000231 tierC-000232
;;   meta-node: (Mn_p206837 $e0 $x0)
(And (Member $e0 add) (Past $e0) (Theme $e0 $x0))

;; p206838  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-001690
;;   meta-node: (Mn_p206838 $e0 $x0)
(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))

;; p206840  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-001803 tierC-000011
;;   meta-node: (Mn_p206840 $e0 $x0)
(And (Member $e0 change) (Past $e0) (Patient $e0 $x0))

;; p206842  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   meta-node: (Mn_p206842 $e0 $x0)
(And (Member $e0 create) (Past $e0) (Patient $e0 $x0))

;; p206843  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000184
;;   meta-node: (Mn_p206843 $e0 $x0)
(And (Member $e0 design) (Past $e0) (Patient $e0 $x0))

;; p206846  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000779 tierB-001364
;;   meta-node: (Mn_p206846 $e0 $x0)
(And (Member $e0 fall) (Past $e0) (Source $e0 $x0))

;; p206848  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   meta-node: (Mn_p206848 $e0 $e1 $x0)
(And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))

;; p206850  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   meta-node: (Mn_p206850 $e0 $e1 $x0)
(And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))

;; p206851  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000951 tierB-001182 tierB-001457
;;   meta-node: (Mn_p206851 $e0 $x0)
(And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))

;; p206852  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001754 tierB-001809
;;   meta-node: (Mn_p206852 $e0 $e1)
(And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))

;; p206853  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   meta-node: (Mn_p206853 $e0 $x0)
(And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))

;; p206854  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-001299 tierB-001604
;;   meta-node: (Mn_p206854 $e0)
(And (Member $e0 stand) (Ongoing $e0) (Past $e0))

;; p206855  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   meta-node: (Mn_p206855 $e0 $x0)
(And (Member $e0 stick) (Past $e0) (Patient $e0 $x0))

;; p206856  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   meta-node: (Mn_p206856 $e0 $e1)
(And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))

;; p206858  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-001675
;;   meta-node: (Mn_p206858 $e0 $e1)
(And (Member $e0 turn) (Past $e0) (Result $e0 $e1))

;; p206859  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-000832
;;   meta-node: (Mn_p206859 $e0 $e1 $x0)
(And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))

;; p206860  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000805 tierB-000929
;;   meta-node: (Mn_p206860 $e0)
(And (Member $e0 walk) (Ongoing $e0) (Past $e0))

;; p206861  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001110 tierB-001359 tierB-001765
;;   meta-node: (Mn_p206861 $e0 $x0)
(And (Ongoing $e0) (Past $e0) (Patient $e0 $x0))

;; p206862  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001185 tierB-001809
;;   meta-node: (Mn_p206862 $e0 $e1)
(And (Ongoing $e0) (Past $e0) (Result $e0 $e1))

;; p206863  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   meta-node: (Mn_p206863 $e0 $e1 $x0)
(And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p206864  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001894 tierC-000283 tierC-000284
;;   meta-node: (Mn_p206864 $e0 $x0)
(And (Past $e0) (Patient $e0 $x0) (Time $e0 night))

;; p206865  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p206865 $e0 $x0 $x1)
(And (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))

;; p207152  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000969 tierB-001589 tierB-001980
;;   meta-node: (Mn_p207152 $e0 $e1 $x0)
(And (Agent $e0 $e1) (Theme $e1 $x0))

;; p207153  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierC-000121 tierC-000122
;;   meta-node: (Mn_p207153 $e0 $x0 $x1)
(And (Agent $e0 $x0) (CoAgent $e0 $x1))

;; p207154  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   meta-node: (Mn_p207154 $e0 $x0)
(And (Agent $e0 $x0) (Goal $e0 home))

;; p207155  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000225 tierB-001251 tierB-001984
;;   meta-node: (Mn_p207155 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 scientist))

;; p207156  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000274 tierB-001058 tierB-001695
;;   meta-node: (Mn_p207156 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 soldier))

;; p207157  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000556 tierB-001250 tierC-000072
;;   meta-node: (Mn_p207157 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Instrument $e0 $x1))

;; p207158  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p207158 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir))

;; p207159  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   meta-node: (Mn_p207159 $e0 $x0)
(And (Agent $e0 $x0) (Manner $e0 directly))

;; p207160  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-001440 tierB-001992
;;   meta-node: (Mn_p207160 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 arrive))

;; p207161  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   meta-node: (Mn_p207161 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 capture))

;; p207162  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000950 tierB-001205 tierB-001926
;;   meta-node: (Mn_p207162 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 close))

;; p207163  support 3 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000728 tierC-000025 tierC-000026
;;   meta-node: (Mn_p207163 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 create))

;; p207164  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   meta-node: (Mn_p207164 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 draw))

;; p207166  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierC-000197 tierC-000198
;;   meta-node: (Mn_p207166 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 move))

;; p207167  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000339 tierB-001153 tierB-001563
;;   meta-node: (Mn_p207167 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 run))

;; p207168  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000864 tierC-000053 tierC-000054
;;   meta-node: (Mn_p207168 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 serve))

;; p207169  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierC-000041 tierC-000042
;;   meta-node: (Mn_p207169 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 sleep))

;; p207170  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   meta-node: (Mn_p207170 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 spend))

;; p207173  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001868 tierC-000087 tierC-000088
;;   meta-node: (Mn_p207173 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 welcome))

;; p207174  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierB-001345 tierC-000277
;;   meta-node: (Mn_p207174 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 win))

;; p207176  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001430 tierB-001528 tierB-001739
;;   meta-node: (Mn_p207176 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 bus))

;; p207177  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000049 tierB-000339 tierB-000793
;;   meta-node: (Mn_p207177 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 doctor))

;; p207178  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001086 tierB-001551 tierB-001892
;;   meta-node: (Mn_p207178 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 dog))

;; p207179  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000045 tierB-000132 tierB-000298
;;   meta-node: (Mn_p207179 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 plane))

;; p207180  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000268 tierB-001507 tierB-001976
;;   meta-node: (Mn_p207180 $e0 $x0)
(And (Agent $e0 $x0) (Obligated $e0))

;; p207181  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000316 tierB-001720 tierB-001911
;;   meta-node: (Mn_p207181 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Stimulus $e1 $e0))

;; p207182  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000772 tierB-001035 tierB-001628
;;   meta-node: (Mn_p207182 $e0 $x0 $x1)
(And (Agent $e0 $x0) (SubsetOf $x0 $x1))

;; p207183  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000651 tierB-001538
;;   meta-node: (Mn_p207183 $e0)
(And (Agent $e0 baya) (Past $e0))

;; p207184  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000201 tierB-000576
;;   meta-node: (Mn_p207184 $e0)
(And (Agent $e0 daniel) (Past $e0))

;; p207185  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
;;   meta-node: (Mn_p207185 $e0)
(And (Agent $e0 david) (Ongoing $e0))

;; p207186  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
;;   meta-node: (Mn_p207186 $e0)
(And (Agent $e0 david) (Past $e0))

;; p207187  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000389 tierB-000487
;;   meta-node: (Mn_p207187 $e0)
(And (Agent $e0 felix) (Past $e0))

;; p207188  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierC-000041 tierC-000042
;;   meta-node: (Mn_p207188 $e0 $e1)
(And (Agent $e0 jessica) (Theme $e0 $e1))

;; p207190  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000239 tierB-000400
;;   meta-node: (Mn_p207190 $e0)
(And (Agent $e0 mark) (Past $e0))

;; p207191  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-001023 tierB-001418
;;   meta-node: (Mn_p207191 $e0)
(And (Agent $e0 matthew) (Past $e0))

;; p207192  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000929 tierB-001094
;;   meta-node: (Mn_p207192 $e0)
(And (Agent $e0 michael) (Past $e0))

;; p207193  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000138 tierB-000706 tierB-001172
;;   meta-node: (Mn_p207193 $e0)
(And (Agent $e0 pietro) (Past $e0))

;; p207194  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000001 tierB-000008 tierB-000013
;;   meta-node: (Mn_p207194 $e0)
(And (Agent $e0 ziri) (Ongoing $e0))

;; p207195  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000340 tierB-001316 tierB-001572
;;   meta-node: (Mn_p207195 $e0 $x0)
(And (At $e0 $x0) (Past $e0))

;; p207196  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001625 tierC-000311 tierC-000312
;;   meta-node: (Mn_p207196 $e0 $e1)
(And (Because $e0 $e1) (Past $e0))

;; p207197  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001625 tierC-000311 tierC-000312
;;   meta-node: (Mn_p207197 $e0 $e1)
(And (Because $e0 $e1) (Past $e1))

;; p207198  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierC-000121 tierC-000122
;;   meta-node: (Mn_p207198 $e0 $e1)
(And (Before $e0 $e1) (Measure $e0 duration <num> year))

;; p207199  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierC-000001 tierC-000002
;;   meta-node: (Mn_p207199 $e0 $e1 $x0)
(And (Before $e0 $e1) (Patient $e0 $x0))

;; p207200  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001134 tierB-001302 tierC-000002
;;   meta-node: (Mn_p207200 $e0 $e1 $x0)
(And (Before $e0 $e1) (Patient $e1 $x0))

;; p207201  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001696 tierB-001867 tierC-000179
;;   meta-node: (Mn_p207201 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Patient $e0 $x1))

;; p207203  support 3 (occ 3)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000299 tierB-001094 tierB-001767
;;   meta-node: (Mn_p207203 $e0)
(And (Can $e0) (Past $e0))

;; p207206  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001332 tierC-000121 tierC-000122
;;   meta-node: (Mn_p207206 $e0 $x0)
(And (CoAgent $e0 $x0) (Past $e0))

;; p207207  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000168 tierB-000916 tierB-001320
;;   meta-node: (Mn_p207207 $e0 $x0)
(And (Experiencer $e0 $x0) (Future $e0))

;; p207208  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001496 tierB-001685 tierB-001945
;;   meta-node: (Mn_p207208 $e0 $x0)
(And (Experiencer $e0 $x0) (GroupOf $x0 child))

;; p207209  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-001667 tierC-000014
;;   meta-node: (Mn_p207209 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (In $e0 $x1))

;; p207210  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000419 tierC-000097 tierC-000098
;;   meta-node: (Mn_p207210 $e0 $x0)
(And (Experiencer $e0 $x0) (Location $e0 europe))

;; p207211  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000565 tierB-000904 tierB-001920
;;   meta-node: (Mn_p207211 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 beautiful))

;; p207212  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000297 tierB-000831
;;   meta-node: (Mn_p207212 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 look))

;; p207213  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000419 tierB-001515
;;   meta-node: (Mn_p207213 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 work))

;; p207214  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000227 tierC-000125 tierC-000126
;;   meta-node: (Mn_p207214 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 bridge))

;; p207215  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000250 tierB-001003 tierB-001334
;;   meta-node: (Mn_p207215 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 cat))

;; p207216  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000425 tierB-000747 tierB-000880
;;   meta-node: (Mn_p207216 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 door))

;; p207217  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000495 tierB-000565 tierB-000748
;;   meta-node: (Mn_p207217 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 weather))

;; p207218  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p207218 $e0 $e1)
(And (For $e0 $e1) (Member $e1 portray))

;; p207219  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000712 tierB-001786 tierB-001879
;;   meta-node: (Mn_p207219 $e0 $x0)
(And (For $e0 $x0) (Ongoing $e0))

;; p207220  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000378 tierB-001726
;;   meta-node: (Mn_p207220 $e0)
(And (Future $e0) (Time $e0 tomorrow))

;; p207221  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001563 tierB-001579 tierB-001902
;;   meta-node: (Mn_p207221 $e0 $x0)
(And (Goal $e0 $x0) (Manner $e0 quickly))

;; p207222  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   meta-node: (Mn_p207222 $e0 $x0)
(And (Goal $e0 $x0) (Member $e0 come))

;; p207224  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   meta-node: (Mn_p207224 $e0)
(And (Goal $e0 home) (Past $e0))

;; p207225  support 3 (occ 3)  size 2  root (LocatedIn (constant)  depth 2
;;   e.g. tierB-000126 tierB-001108 tierB-001286
;;   meta-node: (Mn_p207225 (LocatedIn $x0 $x1)
(And (GroupOf $x0 person) (Past (LocatedIn $x0 $x1)))

;; p207226  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001721 tierB-001816 tierB-001893
;;   meta-node: (Mn_p207226 $e0 $x0)
(And (GroupOf $x0 thing) (Patient $e0 $x0))

;; p207227  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000205 tierC-000261 tierC-000262
;;   meta-node: (Mn_p207227 $e0 $x0 $x1)
(And (In $e0 $x0) (Theme $e0 $x1))

;; p207228  support 3 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000072 tierC-000213 tierC-000214
;;   meta-node: (Mn_p207228 $e0 $x0)
(And (Instrument $e0 $x0) (Member $e0 build))

;; p207229  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001135
;;   meta-node: (Mn_p207229 $e0 $x0)
(And (Like $e0 $x0) (Member $e0 look))

;; p207232  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000796 tierB-001196 tierB-001760
;;   meta-node: (Mn_p207232 $x0 $x1)
(And (LocatedIn $x0 $x1) (Member $x1 full))

;; p207234  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000975 tierB-001416 tierB-001638
;;   meta-node: (Mn_p207234 $e0 $x0 $x1)
(And (LocatedIn $x0 $x1) (Theme $e0 $x0))

;; p207235  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierC-000243 tierC-000244
;;   meta-node: (Mn_p207235 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 bench))

;; p207236  support 3 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001003 tierC-000041 tierC-000042
;;   meta-node: (Mn_p207236 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 couch))

;; p207237  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000048 tierB-000371 tierB-000524
;;   meta-node: (Mn_p207237 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 house))

;; p207238  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001706 tierC-000133 tierC-000134
;;   meta-node: (Mn_p207238 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 village))

;; p207240  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000618 tierB-001125 tierB-001925
;;   meta-node: (Mn_p207240 $e0 $x0 $x1)
(And (Location $e0 $x0) (PartOf $x0 $x1))

;; p207241  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p207241 $e0)
(And (Location $e0 eskisehir) (Member $e0 build))

;; p207242  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p207242 $e0)
(And (Location $e0 eskisehir) (Past $e0))

;; p207243  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p207243 $e0 $x0)
(And (Location $e0 eskisehir) (Patient $e0 $x0))

;; p207244  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000653 tierB-001705
;;   meta-node: (Mn_p207244 $e0)
(And (Location $e0 here) (Past $e0))

;; p207245  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000378 tierB-000653 tierB-001705
;;   meta-node: (Mn_p207245 $e0 $x0)
(And (Location $e0 here) (Patient $e0 $x0))

;; p207246  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   meta-node: (Mn_p207246 $e0 $x0)
(And (Manner $e0 directly) (Patient $e0 $x0))

;; p207247  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000666 tierB-001572 tierB-001743
;;   meta-node: (Mn_p207247 $e0)
(And (Manner $e0 immediately) (Past $e0))

;; p207248  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierC-000235 tierC-000236
;;   meta-node: (Mn_p207248 $e0)
(And (Manner $e0 well) (Past $e0))

;; p207249  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001956 tierC-000235 tierC-000236
;;   meta-node: (Mn_p207249 $e0 $x0)
(And (Manner $e0 well) (Theme $e0 $x0))

;; p207250  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierC-000231 tierC-000232
;;   meta-node: (Mn_p207250 $e0)
(And (Member $e0 add) (Past $e0))

;; p207251  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000128 tierB-000974
;;   meta-node: (Mn_p207251 $e0 $x0)
(And (Member $e0 approve) (Theme $e0 $x0))

;; p207257  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-001690
;;   meta-node: (Mn_p207257 $e0)
(And (Member $e0 buy) (Past $e0))

;; p207258  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
;;   meta-node: (Mn_p207258 $e0 $x0)
(And (Member $e0 cause) (Patient $e0 $x0))

;; p207259  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000218 tierB-000950 tierB-001926
;;   meta-node: (Mn_p207259 $e0 $x0)
(And (Member $e0 close) (Patient $e0 $x0))

;; p207262  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001575 tierC-000131 tierC-000132
;;   meta-node: (Mn_p207262 $e0)
(And (Member $e0 compose) (Past $e0))

;; p207263  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001575 tierC-000131 tierC-000132
;;   meta-node: (Mn_p207263 $e0 $x0)
(And (Member $e0 compose) (Patient $e0 $x0))

;; p207264  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000809 tierB-001166 tierB-001541
;;   meta-node: (Mn_p207264 $e0 $x0)
(And (Member $e0 cover) (Patient $e0 $x0))

;; p207265  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   meta-node: (Mn_p207265 $e0)
(And (Member $e0 create) (Past $e0))

;; p207267  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000184
;;   meta-node: (Mn_p207267 $e0)
(And (Member $e0 design) (Past $e0))

;; p207268  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000184
;;   meta-node: (Mn_p207268 $e0 $x0)
(And (Member $e0 design) (Patient $e0 $x0))

;; p207269  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000838 tierC-000199 tierC-000200
;;   meta-node: (Mn_p207269 $e0)
(And (Member $e0 die) (Past $e0))

;; p207270  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
;;   meta-node: (Mn_p207270 $e0)
(And (Member $e0 eat) (Past $e0))

;; p207271  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
;;   meta-node: (Mn_p207271 $e0 $x0)
(And (Member $e0 eat) (Patient $e0 $x0))

;; p207273  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000779 tierB-001364
;;   meta-node: (Mn_p207273 $e0 $x0)
(And (Member $e0 fall) (Source $e0 $x0))

;; p207275  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000780 tierC-000163 tierC-000179
;;   meta-node: (Mn_p207275 $e0 $x0)
(And (Member $e0 form) (Patient $e0 $x0))

;; p207276  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000418 tierB-000672 tierB-001325
;;   meta-node: (Mn_p207276 $e0 $x0)
(And (Member $e0 get) (Theme $e0 $x0))

;; p207277  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000115 tierC-000209 tierC-000210
;;   meta-node: (Mn_p207277 $e0 $e1)
(And (Member $e0 go) (To $e0 $e1))

;; p207281  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   meta-node: (Mn_p207281 $e0)
(And (Member $e0 increase) (Past $e0))

;; p207282  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   meta-node: (Mn_p207282 $e0 $x0)
(And (Member $e0 increase) (Patient $e0 $x0))

;; p207284  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001086 tierB-001782 tierC-000019
;;   meta-node: (Mn_p207284 $e0 $x0)
(And (Member $e0 lead) (Theme $e0 $x0))

;; p207285  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   meta-node: (Mn_p207285 $e0 $x0)
(And (Member $e0 leave) (Patient $e0 $x0))

;; p207286  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   meta-node: (Mn_p207286 $e0 $e1)
(And (Member $e0 leave) (Result $e0 $e1))

;; p207287  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000704 tierB-000713 tierB-001350
;;   meta-node: (Mn_p207287 $e0 $x0)
(And (Member $e0 leave) (Theme $e0 $x0))

;; p207289  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001125 tierB-001433 tierB-001840
;;   meta-node: (Mn_p207289 $e0)
(And (Member $e0 play) (Ongoing $e0))

;; p207290  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierC-000229 tierC-000230
;;   meta-node: (Mn_p207290 $e0)
(And (Member $e0 play) (Past $e0))

;; p207291  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-001221 tierB-001637
;;   meta-node: (Mn_p207291 $e0 $x0)
(And (Member $e0 read) (Theme $e0 $x0))

;; p207292  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000688 tierC-000255 tierC-000256
;;   meta-node: (Mn_p207292 $e0)
(And (Member $e0 return) (Past $e0))

;; p207293  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000311 tierC-000095 tierC-000096
;;   meta-node: (Mn_p207293 $e0)
(And (Member $e0 rule) (Past $e0))

;; p207294  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001626
;;   meta-node: (Mn_p207294 $e0 $x0)
(And (Member $e0 say) (Theme $e0 $x0))

;; p207296  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   meta-node: (Mn_p207296 $e0)
(And (Member $e0 spend) (Past $e0))

;; p207297  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   meta-node: (Mn_p207297 $e0 $x0)
(And (Member $e0 spend) (Theme $e0 $x0))

;; p207298  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-001299 tierB-001604
;;   meta-node: (Mn_p207298 $e0)
(And (Member $e0 stand) (Ongoing $e0))

;; p207299  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   meta-node: (Mn_p207299 $e0)
(And (Member $e0 stick) (Past $e0))

;; p207300  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   meta-node: (Mn_p207300 $e0 $x0)
(And (Member $e0 stick) (Patient $e0 $x0))

;; p207301  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   meta-node: (Mn_p207301 $e0 $e1)
(And (Member $e0 stop) (Theme $e0 $e1))

;; p207302  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000075 tierC-000100 tierC-000338
;;   meta-node: (Mn_p207302 $e0)
(And (Member $e0 succeed) (Past $e0))

;; p207306  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000078 tierC-000209 tierC-000210
;;   meta-node: (Mn_p207306 $e1 $e0)
(And (Member $e0 talk) (To $e1 $e0))

;; p207309  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001800
;;   meta-node: (Mn_p207309 $e0 $x0)
(And (Member $e0 watch) (Theme $e0 $x0))

;; p207310  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001868 tierC-000087 tierC-000088
;;   meta-node: (Mn_p207310 $e0)
(And (Member $e0 welcome) (Past $e0))

;; p207312  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001457 tierB-001831
;;   meta-node: (Mn_p207312 $e0 $x0)
(And (Member $x0 big) (Patient $e0 $x0))

;; p207314  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001586 tierB-001638
;;   meta-node: (Mn_p207314 $x0 $x1)
(And (Member $x0 bottom) (PartOf $x0 $x1))

;; p207315  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001163 tierB-001302
;;   meta-node: (Mn_p207315 $e0 $x0)
(And (Member $x0 fire) (Patient $e0 $x0))

;; p207317  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000371 tierB-000471 tierB-001887
;;   meta-node: (Mn_p207317 $e0 $x0)
(And (Member $x0 house) (Patient $e0 $x0))

;; p207318  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000685 tierB-001106 tierB-001756
;;   meta-node: (Mn_p207318 $e0 $x0)
(And (Member $x0 light) (Patient $e0 $x0))

;; p207320  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001087 tierC-000341 tierC-000342
;;   meta-node: (Mn_p207320 $e0 $x0)
(And (Member $x0 orchestra) (Theme $e0 $x0))

;; p207321  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000876 tierB-001070 tierB-001423
;;   meta-node: (Mn_p207321 $e0 $x0)
(And (Member $x0 picture) (Theme $e0 $x0))

;; p207322  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000935 tierB-001202 tierB-001910
;;   meta-node: (Mn_p207322 $e0 $x0)
(And (Member $x0 problem) (Patient $e0 $x0))

;; p207323  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001156 tierC-000011 tierC-000012
;;   meta-node: (Mn_p207323 $e0 $x0)
(And (Member $x0 song) (Theme $e0 $x0))

;; p207325  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000756 tierB-000759 tierB-000865
;;   meta-node: (Mn_p207325 $e0 $x0)
(And (Member $x0 thing) (Stimulus $e0 $x0))

;; p207326  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000517 tierB-000748 tierB-001491
;;   meta-node: (Mn_p207326 $e0 $x0)
(And (Member $x0 weather) (Patient $e0 $x0))

;; p207327  support 3 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001980 tierC-000235 tierC-000236
;;   meta-node: (Mn_p207327 $e0 $x0)
(And (Member $x0 work) (Theme $e0 $x0))

;; p207328  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000218 tierB-000969 tierB-001476
;;   meta-node: (Mn_p207328 $e0 $x0)
(And (Might $e0) (Patient $e0 $x0))

;; p207329  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000797 tierB-001452 tierB-001809
;;   meta-node: (Mn_p207329 $x0 $e0)
(And (Only $x0 $e0) (Past $e0))

;; p207332  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001246 tierB-001926 tierB-001964
;;   meta-node: (Mn_p207332 $e0 $x0 $x1)
(And (PartOf $x0 $x1) (Patient $e0 $x0))

;; p207334  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000193 tierC-000194 tierC-000316
;;   meta-node: (Mn_p207334 $e0)
(And (Past $e0) (Time $e0 later))

;; p207335  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001486 tierC-000241 tierC-000242
;;   meta-node: (Mn_p207335 $e0)
(And (Past $e0) (Time $e0 now))

;; p207336  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000631 tierB-000808 tierB-001762
;;   meta-node: (Mn_p207336 $e0)
(And (Past $e0) (Time $e0 today))

;; p207337  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000193 tierB-001094 tierB-001397
;;   meta-node: (Mn_p207337 $e0 $x0)
(And (Past $e0) (With $e0 $x0))

;; p207338  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001130 tierB-001384 tierC-000257
;;   meta-node: (Mn_p207338 $e0 $x0 $x1)
(And (Patient $e0 $x0) (Possession $x0 $x1))

;; p207339  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000517 tierB-001588 tierB-001910
;;   meta-node: (Mn_p207339 $e0 $x0)
(And (Patient $e0 $x0) (Probably $e0))

;; p207340  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001894 tierC-000283 tierC-000284
;;   meta-node: (Mn_p207340 $e0 $x0)
(And (Patient $e0 $x0) (Time $e0 night))

;; p207341  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000371 tierB-001304 tierB-001867
;;   meta-node: (Mn_p207341 $e1 $e0 $x0)
(And (Patient $e0 $x0) (To $e1 $e0))

;; p207343  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000547 tierB-001219
;;   meta-node: (Mn_p207343 $e1 $e0 $x0)
(And (Recipient $e0 $x0) (Theme $e1 $e0))

;; p207344  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   meta-node: (Mn_p207344 $e0 $x0 $x1)
(And (Theme $e0 $x0) (Theme $e0 $x1))

;; p207345  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001177 tierB-001566 tierB-001922
;;   meta-node: (Mn_p207345 $e0 $x0 $x1)
(And (Theme $e0 $x0) (To $e0 $x1))

;; p207568  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000248 tierB-000343 tierB-000786
;;   meta-node: (Mn_p207568 $e0 $x0)
(Against $e0 $x0)

;; p207569  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001044 tierB-001117 tierB-001767
;;   meta-node: (Mn_p207569 $e0)
(Agent $e0 adriano)

;; p207570  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001270 tierC-000075 tierC-000076
;;   meta-node: (Mn_p207570 $e0)
(Agent $e0 alexander)

;; p207571  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000651 tierB-001538
;;   meta-node: (Mn_p207571 $e0)
(Agent $e0 baya)

;; p207572  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000201 tierB-000576
;;   meta-node: (Mn_p207572 $e0)
(Agent $e0 daniel)

;; p207573  support 3 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
;;   meta-node: (Mn_p207573 $e0)
(Agent $e0 david)

;; p207574  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-000524 tierB-000563
;;   meta-node: (Mn_p207574 $e0)
(Agent $e0 elias)

;; p207575  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000389 tierB-000487
;;   meta-node: (Mn_p207575 $e0)
(Agent $e0 felix)

;; p207576  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000791 tierB-000987 tierB-001675
;;   meta-node: (Mn_p207576 $e0)
(Agent $e0 gustavo)

;; p207577  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000406 tierB-000412 tierB-000564
;;   meta-node: (Mn_p207577 $e0)
(Agent $e0 ivan)

;; p207578  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierC-000041 tierC-000042
;;   meta-node: (Mn_p207578 $e0)
(Agent $e0 jessica)

;; p207579  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000313 tierB-000327 tierB-001449
;;   meta-node: (Mn_p207579 $e0)
(Agent $e0 linda)

;; p207580  support 3 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000239 tierB-000400
;;   meta-node: (Mn_p207580 $e0)
(Agent $e0 mark)

;; p207581  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000107 tierB-000450 tierB-000588
;;   meta-node: (Mn_p207581 $e0)
(Agent $e0 martino)

;; p207582  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000021 tierB-000048
;;   meta-node: (Mn_p207582 $e0)
(Agent $e0 mary)

;; p207583  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-001023 tierB-001418
;;   meta-node: (Mn_p207583 $e0)
(Agent $e0 matthew)

;; p207584  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000219 tierB-000257
;;   meta-node: (Mn_p207584 $e0)
(Agent $e0 mennad)

;; p207585  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000929 tierB-001094
;;   meta-node: (Mn_p207585 $e0)
(Agent $e0 michael)

;; p207586  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000138 tierB-000706 tierB-001172
;;   meta-node: (Mn_p207586 $e0)
(Agent $e0 pietro)

;; p207587  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000995 tierC-000269 tierC-000270
;;   meta-node: (Mn_p207587 $e0)
(Agent $e0 roger)

;; p207588  support 3 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000137 tierB-000240 tierB-000273
;;   meta-node: (Mn_p207588 $e0)
(Agent $e0 william)

;; p207589  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000001 tierB-000008 tierB-000013
;;   meta-node: (Mn_p207589 $e0)
(Agent $e0 ziri)

;; p207590  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000340 tierB-001316 tierB-001572
;;   meta-node: (Mn_p207590 $e0 $x0)
(At $e0 $x0)

;; p207591  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001625 tierC-000311 tierC-000312
;;   meta-node: (Mn_p207591 $e0 $e1)
(Because $e0 $e1)

;; p207592  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000925 tierB-000964 tierB-001832
;;   meta-node: (Mn_p207592 $e0 $x0)
(But $e0 $x0)

;; p207593  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000791 tierB-000917 tierB-001051
;;   meta-node: (Mn_p207593 $e0)
(Every $e0 <num> week)

;; p207594  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000393 tierB-000559 tierB-001967
;;   meta-node: (Mn_p207594 $e0)
(Every $e0 <num> year)

;; p207595  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001016 tierB-001523 tierB-001966
;;   meta-node: (Mn_p207595 $e0 $e1)
(Experiencer $e0 $e1)

;; p207596  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-001418 tierB-001496
;;   meta-node: (Mn_p207596 $e0)
(Goal $e0 bed)

;; p207597  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   meta-node: (Mn_p207597 $e0)
(Goal $e0 home)

;; p207609  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001985 tierC-000261 tierC-000262
;;   meta-node: (Mn_p207609 $x0)
(GroupOf $x0 way)

;; p207611  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-000816 tierB-001909
;;   meta-node: (Mn_p207611 $e0 $e1)
(In $e0 $e1)

;; p207614  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   meta-node: (Mn_p207614 $e0)
(Location $e0 eskisehir)

;; p207615  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000419 tierC-000097 tierC-000098
;;   meta-node: (Mn_p207615 $e0)
(Location $e0 europe)

;; p207616  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000374 tierB-000398 tierB-001800
;;   meta-node: (Mn_p207616 $e0)
(Manner $e0 carefully)

;; p207617  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000465 tierB-000466 tierB-001149
;;   meta-node: (Mn_p207617 $e0)
(Manner $e0 really)

;; p207618  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000593 tierB-000647
;;   meta-node: (Mn_p207618 $e0)
(Measure $e0 duration <num> day)

;; p207620  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000128 tierB-000974
;;   meta-node: (Mn_p207620 $e0)
(Member $e0 approve)

;; p207624  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000565 tierB-000904 tierB-001920
;;   meta-node: (Mn_p207624 $e0)
(Member $e0 beautiful)

;; p207625  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001641 tierB-001694
;;   meta-node: (Mn_p207625 $e0)
(Member $e0 break_out)

;; p207628  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001575 tierC-000131 tierC-000132
;;   meta-node: (Mn_p207628 $e0)
(Member $e0 compose)

;; p207629  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001149 tierC-000261 tierC-000262
;;   meta-node: (Mn_p207629 $e0)
(Member $e0 define)

;; p207630  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000184
;;   meta-node: (Mn_p207630 $e0)
(Member $e0 design)

;; p207633  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p207633 $e0)
(Member $e0 fund)

;; p207636  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000329 tierB-000692 tierB-001801
;;   meta-node: (Mn_p207636 $e0)
(Member $e0 hold_up)

;; p207638  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000258 tierC-000351
;;   meta-node: (Mn_p207638 $e0)
(Member $e0 influence)

;; p207641  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000478 tierC-000075 tierC-000076
;;   meta-node: (Mn_p207641 $e0)
(Member $e0 marry)

;; p207644  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000334 tierB-001040 tierB-001072
;;   meta-node: (Mn_p207644 $e0)
(Member $e0 pick_up)

;; p207647  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-001221 tierB-001637
;;   meta-node: (Mn_p207647 $e0)
(Member $e0 read)

;; p207648  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000688 tierC-000255 tierC-000256
;;   meta-node: (Mn_p207648 $e0)
(Member $e0 return)

;; p207649  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000311 tierC-000095 tierC-000096
;;   meta-node: (Mn_p207649 $e0)
(Member $e0 rule)

;; p207653  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000935 tierB-001202 tierB-001970
;;   meta-node: (Mn_p207653 $e0)
(Member $e0 solve)

;; p207654  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   meta-node: (Mn_p207654 $e0)
(Member $e0 stick)

;; p207655  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000075 tierC-000100 tierC-000338
;;   meta-node: (Mn_p207655 $e0)
(Member $e0 succeed)

;; p207656  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000700 tierC-000017 tierC-000018
;;   meta-node: (Mn_p207656 $e0)
(Member $e0 suggest)

;; p207658  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001234 tierC-000109 tierC-000110
;;   meta-node: (Mn_p207658 $e0)
(Member $e0 take_over)

;; p207659  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001257 tierB-001648 tierC-000022
;;   meta-node: (Mn_p207659 $e0)
(Member $e0 task)

;; p207669  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000305 tierC-000243 tierC-000244
;;   meta-node: (Mn_p207669 $x0)
(Member $x0 bench)

;; p207670  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001586 tierB-001638
;;   meta-node: (Mn_p207670 $x0)
(Member $x0 bottom)

;; p207671  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000227 tierC-000125 tierC-000126
;;   meta-node: (Mn_p207671 $x0)
(Member $x0 bridge)

;; p207676  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000782 tierC-000221 tierC-000222
;;   meta-node: (Mn_p207676 $x0)
(Member $x0 clear)

;; p207677  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000205 tierB-000261 tierB-000362
;;   meta-node: (Mn_p207677 $x0)
(Member $x0 cold)

;; p207678  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000391 tierC-000163 tierC-000164
;;   meta-node: (Mn_p207678 $x0)
(Member $x0 complex)

;; p207681  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001003 tierC-000041 tierC-000042
;;   meta-node: (Mn_p207681 $x0)
(Member $x0 couch)

;; p207688  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000246 tierB-001432 tierB-001488
;;   meta-node: (Mn_p207688 $x0)
(Member $x0 easy)

;; p207696  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000089 tierC-000221 tierC-000222
;;   meta-node: (Mn_p207696 $x0)
(Member $x0 important)

;; p207697  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000524 tierC-000269 tierC-000270
;;   meta-node: (Mn_p207697 $x0)
(Member $x0 isolated)

;; p207700  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000288 tierB-001762 tierB-001848
;;   meta-node: (Mn_p207700 $x0)
(Member $x0 law)

;; p207701  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001573 tierB-001670 tierB-001938
;;   meta-node: (Mn_p207701 $x0)
(Member $x0 living_room)

;; p207706  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000073 tierB-000352 tierB-000695
;;   meta-node: (Mn_p207706 $x0)
(Member $x0 noise)

;; p207709  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001087 tierC-000341 tierC-000342
;;   meta-node: (Mn_p207709 $x0)
(Member $x0 orchestra)

;; p207714  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000005 tierB-000617 tierB-001716
;;   meta-node: (Mn_p207714 $x0)
(Member $x0 population)

;; p207720  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001196 tierC-000163 tierC-000164
;;   meta-node: (Mn_p207720 $x0)
(Member $x0 simple)

;; p207726  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000156 tierB-001223 tierB-001453
;;   meta-node: (Mn_p207726 $x0)
(Member $x0 strong)

;; p207732  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000510 tierB-000931 tierB-001569
;;   meta-node: (Mn_p207732 $x0)
(Member $x0 valuable)

;; p207734  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000367 tierB-000832 tierB-001890
;;   meta-node: (Mn_p207734 $x0)
(Member $x0 yellow)

;; p207735  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000602 tierB-001773 tierB-001870
;;   meta-node: (Mn_p207735 $x0)
(Member $x0 young)

;; p207736  support 3 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierC-000083 tierC-000084
;;   meta-node: (Mn_p207736 $x0)
(Ordinal $x0 <num> line)

;; p207739  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000229 tierB-001518 tierB-001745
;;   meta-node: (Mn_p207739 $x0 $x1)
(RestOf $x0 $x1)

;; p207740  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000908 tierB-000997 tierB-001031
;;   meta-node: (Mn_p207740 $e0)
(Start $e0 (Year <num>))

;; p207741  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000559 tierB-000917 tierB-000939
;;   meta-node: (Mn_p207741 $e0)
(Time $e0 (Weekday sunday))

;; p207742  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000303 tierB-000598
;;   meta-node: (Mn_p207742 $e0)
(Time $e0 morning)

;; p207743  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000168 tierB-000699 tierB-001440
;;   meta-node: (Mn_p207743 $e0)
(Time $e0 soon)

;; p207744  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000378 tierB-001726
;;   meta-node: (Mn_p207744 $e0)
(Time $e0 tomorrow)

;; p207745  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000193 tierB-001094 tierB-001397
;;   meta-node: (Mn_p207745 $e0 $x0)
(With $e0 $x0)
