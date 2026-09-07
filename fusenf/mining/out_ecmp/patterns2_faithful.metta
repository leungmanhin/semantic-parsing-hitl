;; FUSE-NF §4.3.1 Frequent Subtree Mining — FAITHFUL view — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   patterns2_faithful.jsonl  (every unit with its fields and supporting record ids)
;;   patterns2.jsonl           (the miner's full inventory this view is cut from)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate           patterns2.jsonl — 5799 patterns over 740 records (the miner's inventory; this view mines nothing)
;;   size threshold      k = 4 atoms per pattern (the miner's --k)
;;   minimum support     3 records (document support; occurrences reported beside it)
;;   pattern language    skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded
;;   rooted subtree      atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded
;;   constants verbatim  n_lifted = 0 only; the 3939 constant-lifted (shape-stratum) patterns are an addition
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

;; ==================== CLOSED UNITS: 256 of 1652 rooted-subtree units (k = 4, support >= 3 of 740 records) ====================

;; p200070  support 37 (occ 37)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000013 tierC-000014 tierC-000017
;;   meta-node: (Mn_p200070 $x0)
(Member $x0 person)

;; p200089  support 30 (occ 30)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p200089 $x0 $x1)
(Possession $x0 $x1)

;; p200205  support 17 (occ 17)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   meta-node: (Mn_p200205 $x0)
(GroupOf $x0 child)

;; p200249  support 14 (occ 14)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   meta-node: (Mn_p200249 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))

;; p200282  support 13 (occ 13)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000066
;;   meta-node: (Mn_p200282 $x1 $x0)
(And (Member $x0 person) (Possession $x1 $x0))

;; p200289  support 13 (occ 17)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000311 tierA-000312 tierA-000313
;;   meta-node: (Mn_p200289 $e0)
(Member $e0 work)

;; p200326  support 12 (occ 12)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200326 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p200351  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   meta-node: (Mn_p200351 $e0)
(Member $e0 discover)

;; p200353  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200353 $x0)
(Member $x0 depot)

;; p200354  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000375 tierA-000377 tierA-000378
;;   meta-node: (Mn_p200354 $x0)
(Member $x0 physician)

;; p200410  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
;;   meta-node: (Mn_p200410 $e0)
(Member $e0 decide)

;; p200412  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (Mn_p200412 $x0)
(Member $x0 board)

;; p200413  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p200413 $x0)
(Member $x0 hall)

;; p200414  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p200414 $x0)
(Member $x0 school)

;; p200484  support 10 (occ 10)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   meta-node: (Mn_p200484 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child))

;; p200487  support 10 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000071
;;   meta-node: (Mn_p200487 $e0 $x0)
(And (Member $e0 build) (Patient $e0 $x0))

;; p200488  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p200488 $e0 $x0)
(And (Member $e0 lend) (Theme $e0 $x0))

;; p200498  support 10 (occ 10)  size 1  root $e0 (event)  depth 0
;;   e.g. tierC-000145 tierC-000146 tierC-000149
;;   meta-node: (Mn_p200498 $e0)
(Can $e0)

;; p200502  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   meta-node: (Mn_p200502 $e0)
(Member $e0 require)

;; p200504  support 10 (occ 10)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p200504 $x0)
(Member $x0 crate)

;; p200573  support 9 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000055 tierA-000057
;;   meta-node: (Mn_p200573 $e0)
(Member $e0 begin)

;; p200575  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p200575 $x0)
(Member $x0 ledger)

;; p200686  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000153 tierC-000154 tierC-000181
;;   meta-node: (Mn_p200686 $e0 $x0)
(And (Member $e0 have) (Theme $e0 $x0))

;; p200697  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000187 tierA-000191
;;   meta-node: (Mn_p200697 $e0)
(Member $e0 decision)

;; p200701  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000174 tierA-000177
;;   meta-node: (Mn_p200701 $e0)
(Member $e0 walk)

;; p200702  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000390 tierA-000392 tierA-000393
;;   meta-node: (Mn_p200702 $x0)
(Member $x0 automobile)

;; p200704  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   meta-node: (Mn_p200704 $x0)
(Member $x0 crew)

;; p200705  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000196 tierA-000197 tierA-000198
;;   meta-node: (Mn_p200705 $x0)
(Member $x0 family)

;; p200707  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000291 tierA-000292 tierA-000293
;;   meta-node: (Mn_p200707 $x0)
(Member $x0 song)

;; p200808  support 7 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000072
;;   meta-node: (Mn_p200808 $e0 $x0)
(And (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p200830  support 7 (occ 7)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200830 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 forklift))

;; p200837  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   meta-node: (Mn_p200837 $e0 $x0)
(And (Member $e0 require) (Theme $e0 $x0))

;; p200853  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000003 tierC-000004 tierC-000216
;;   meta-node: (Mn_p200853 $e0)
(Member $e0 locate)

;; p200855  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p200855 $x0)
(Member $x0 chef)

;; p200863  support 6 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200863 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))

;; p200864  support 6 (occ 10)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   meta-node: (Mn_p200864 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))

;; p200865  support 6 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p200865 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))

;; p200866  support 6 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200866 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))

;; p201014  support 6 (occ 6)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201014 $x0)
(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))

;; p201038  support 6 (occ 6)  size 1  root feed_pipe (constant)  depth 1
;;   e.g. tierA-000046 tierA-000047 tierA-000048
;;   meta-node: (Mn_p201038 feed_pipe)
(Inheritance feed_pipe pipe)

;; p201048  support 6 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (Mn_p201048 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p201049  support 6 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (Mn_p201049 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1))

;; p201050  support 6 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (Mn_p201050 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p201083  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p201083 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 arrive))

;; p201089  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201089 $x0)
(And (GroupOf $x0 lemon) (Member $x0 crate))

;; p201097  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   meta-node: (Mn_p201097 $x0)
(And (Member $x0 budget) (Possession $x0 next_year))

;; p201135  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000237
;;   meta-node: (Mn_p201135 $e0)
(Member $e0 become)

;; p201136  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000243 tierC-000244 tierC-000279
;;   meta-node: (Mn_p201136 $e0)
(Member $e0 find)

;; p201137  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000247 tierC-000248 tierC-000277
;;   meta-node: (Mn_p201137 $e0)
(Member $e0 portray)

;; p201139  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p201139 $e0)
(Member $e0 sell)

;; p201140  support 6 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000053 tierA-000058 tierA-000063
;;   meta-node: (Mn_p201140 $e0)
(Member $e0 start)

;; p201142  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000335 tierA-000336 tierA-000337
;;   meta-node: (Mn_p201142 $x0)
(Member $x0 bench)

;; p201143  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000399 tierA-000400 tierA-000401
;;   meta-node: (Mn_p201143 $x0)
(Member $x0 bridge)

;; p201147  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000190 tierA-000191 tierA-000192
;;   meta-node: (Mn_p201147 $x0)
(Member $x0 judge)

;; p201148  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201148 $x0)
(Member $x0 mechanic)

;; p201149  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000135 tierC-000136 tierC-000159
;;   meta-node: (Mn_p201149 $x0)
(Member $x0 view)

;; p201179  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201179 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 point) (Theme $e0 $x2))

;; p201180  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   meta-node: (Mn_p201180 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 club) (Member $x1 tournament) (Theme $e0 $x1))

;; p201181  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p201181 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 depot) (Past $e0) (Theme $e0 $x1))

;; p201186  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201186 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 school) (Past $e0) (Theme $e0 $x1))

;; p201187  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201187 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 kiln) (Past $e0) (Theme $e0 $x1))

;; p201190  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201190 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1))

;; p201191  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201191 $e0 $x0)
(And (GroupOf $x0 lemon) (Member $x0 crate) (Past $e0) (Theme $e0 $x0))

;; p201192  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201192 $e0 $x0)
(And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p201193  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201193 $e0 $x0)
(And (Inheritance north_route north) (Inheritance north_route route) (Member $x0 north_route) (Theme $e0 $x0))

;; p201194  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (Mn_p201194 $e0 $x0)
(And (Inheritance shoreline_survey survey) (Member $x0 shoreline_survey) (Patient $e0 $x0) (Time $e0 dawn))

;; p201195  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201195 $e0 $x0)
(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0))

;; p201438  support 5 (occ 5)  size 3  root $x1 (entity)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p201438 $x1 $x0)
(And (Member $x0 firm) (Member $x1 tender) (Possession $x1 $x0))

;; p201535  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p201535 $x0)
(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))

;; p201536  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   meta-node: (Mn_p201536 $x0)
(And (Inheritance evening_flight flight) (Member $x0 evening_flight))

;; p201537  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p201537 $x0)
(And (Inheritance loan_application application) (Member $x0 loan_application))

;; p201540  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p201540 $x0)
(And (Inheritance rescue_team team) (Member $x0 rescue_team))

;; p201542  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p201542 $x0)
(And (Inheritance summer_fair fair) (Member $x0 summer_fair))

;; p201571  support 5 (occ 5)  size 2  root monthly_servicing (constant)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p201571 monthly_servicing)
(And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing))

;; p201623  support 5 (occ 9)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000072
;;   meta-node: (Mn_p201623 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))

;; p201679  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000182
;;   meta-node: (Mn_p201679 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 take))

;; p201680  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000177 tierA-000180
;;   meta-node: (Mn_p201680 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 walk))

;; p201705  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000237 tierC-000238
;;   meta-node: (Mn_p201705 $e0 $x0)
(And (Member $e0 become) (Patient $e0 $x0))

;; p201708  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000010 tierC-000091 tierC-000138
;;   meta-node: (Mn_p201708 $e0 $x0)
(And (Member $e0 direct) (Patient $e0 $x0))

;; p201714  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p201714 $x0)
(And (Member $x0 file) (Member $x0 missing))

;; p201716  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201716 $x0)
(And (Member $x0 gearbox) (Member $x0 seized))

;; p201760  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (Mn_p201760 $x0)
(GroupOf $x0 sample)

;; p201762  support 5 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000126 tierC-000212 tierC-000215
;;   meta-node: (Mn_p201762 $e0)
(Member $e0 be)

;; p201775  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (Mn_p201775 $x0)
(Member $x0 chart)

;; p201778  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (Mn_p201778 $x0)
(Member $x0 committee)

;; p201785  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   meta-node: (Mn_p201785 $x0)
(Member $x0 fire)

;; p201788  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   meta-node: (Mn_p201788 $x0)
(Member $x0 footbridge)

;; p201791  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000301 tierA-000302 tierA-000303
;;   meta-node: (Mn_p201791 $x0)
(Member $x0 generator)

;; p201794  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (Mn_p201794 $x0)
(Member $x0 lane)

;; p201797  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000266 tierA-000267 tierA-000268
;;   meta-node: (Mn_p201797 $x0)
(Member $x0 library)

;; p201800  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   meta-node: (Mn_p201800 $x0)
(Member $x0 manifest)

;; p201801  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   meta-node: (Mn_p201801 $x0)
(Member $x0 manuscript)

;; p201803  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   meta-node: (Mn_p201803 $x0)
(Member $x0 museum)

;; p201804  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000296 tierA-000297 tierA-000298
;;   meta-node: (Mn_p201804 $x0)
(Member $x0 neighbour)

;; p201807  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   meta-node: (Mn_p201807 $x0)
(Member $x0 permit)

;; p201812  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   meta-node: (Mn_p201812 $x0)
(Member $x0 proposal)

;; p201813  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000207 tierA-000208 tierA-000209
;;   meta-node: (Mn_p201813 $x0)
(Member $x0 query)

;; p201820  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   meta-node: (Mn_p201820 $x0)
(Member $x0 squad)

;; p201821  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (Mn_p201821 $x0)
(Member $x0 storm)

;; p201825  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000212 tierA-000213 tierA-000214
;;   meta-node: (Mn_p201825 $x0)
(Member $x0 tower)

;; p201827  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000217 tierA-000218 tierA-000219
;;   meta-node: (Mn_p201827 $x0)
(Member $x0 vet)

;; p201828  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (Mn_p201828 $x0)
(Member $x0 vote)

;; p201829  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000276 tierA-000277 tierA-000278
;;   meta-node: (Mn_p201829 $x0)
(Member $x0 winner)

;; p201838  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p201838 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $x0 government) (Theme $e0 $x1))

;; p201889  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   meta-node: (Mn_p201889 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 biologist) (Member $x1 survey))

;; p201911  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (Mn_p201911 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 block) (Member $x1 lane) (Theme $e0 $x1))

;; p201920  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   meta-node: (Mn_p201920 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1))

;; p201921  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   meta-node: (Mn_p201921 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1))

;; p201922  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (Mn_p201922 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 board) (Member $x1 vote) (Theme $e0 $x1))

;; p201927  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p201927 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))

;; p201929  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   meta-node: (Mn_p201929 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 editor) (Member $x1 manuscript) (Theme $e0 $x1))

;; p201938  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   meta-node: (Mn_p201938 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 panel) (Member $x1 proposal) (Theme $e0 $x1))

;; p201940  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p201940 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 rescue_team) (Member $x1 search) (Theme $e0 $x1))

;; p201942  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p201942 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))

;; p201943  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201943 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 crate) (Past $e0) (Theme $e0 $x1))

;; p201944  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p201944 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 file) (Member $x1 missing) (Theme $e0 $x1))

;; p201948  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201948 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1))

;; p201960  support 4 (occ 4)  size 4  root $x0 (entity)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p201960 $x0 $e0 $x1)
(And (Before $x0 $e0) (Member $x0 lunch) (Member $x1 dress_rehearsal) (Patient $e0 $x1))

;; p201968  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   meta-node: (Mn_p201968 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0))

;; p201970  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (Mn_p201970 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))

;; p201974  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p201974 $e0 $x0)
(And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))

;; p201975  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p201975 $e0 $e1 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x1 ledger) (Stimulus $e0 $e1))

;; p201983  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201983 $e0 $x0)
(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p201984  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p201984 $e0 $x0)
(And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p201985  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (Mn_p201985 $e0 $x0 $x1)
(And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0))

;; p201986  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p201986 $e0 $x0 $x1)
(And (GroupOf $x0 sequence) (Manner $e0 $x1) (Member $e0 define) (Theme $e0 $x0))

;; p201987  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p201987 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point) (Theme $e0 $x1))

;; p201988  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201988 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $x0 point) (Member $x1 wreck) (Theme $e0 $x1))

;; p202014  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202014 $e0 $x0)
(And (Member $e0 build) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p202020  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p202020 $e0 $x0)
(And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p202023  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p202023 $e0 $x0 $x1)
(And (Member $x0 firm) (Member $x1 tender) (Possession $x1 $x0) (Theme $e0 $x1))

;; p202024  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p202024 $e0 $x0)
(And (Member $x0 gearbox) (Member $x0 seized) (Past $e0) (Patient $e0 $x0))

;; p202025  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p202025 $e0 $x0)
(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning))

;; p202029  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p202029 $e0 $x0)
(And (Past $e0) (Possession $x0 free_soil_party) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p202862  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p202862 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger))

;; p202882  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   meta-node: (Mn_p202882 $x0 $x1)
(And (Member $x0 departure) (Member $x1 ferry) (Possession $x0 $x1))

;; p202884  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000121
;;   meta-node: (Mn_p202884 $x0 $x1)
(And (Member $x0 family) (Member $x1 person) (Possession $x0 $x1))

;; p203143  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (Mn_p203143 $x0)
(And (GroupOf $x0 soil_sample) (Inheritance soil_sample sample))

;; p203146  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000363 tierA-000364 tierA-000365
;;   meta-node: (Mn_p203146 $x0)
(And (Inheritance night_crew crew) (Member $x0 night_crew))

;; p203147  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000347 tierA-000348 tierA-000349
;;   meta-node: (Mn_p203147 $x0)
(And (Inheritance spoil_mound mound) (Member $x0 spoil_mound))

;; p203209  support 4 (occ 4)  size 2  root regional_unit (constant)  depth 1
;;   e.g. tierC-000031 tierC-000032 tierC-000081
;;   meta-node: (Mn_p203209 regional_unit)
(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))

;; p203236  support 4 (occ 4)  size 1  root Married (constant)  depth 0
;;   e.g. tierC-000079 tierC-000080 tierC-000335
;;   meta-node: (Mn_p203236 Married)
(Symmetric Married)

;; p203271  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   meta-node: (Mn_p203271 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))

;; p203272  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   meta-node: (Mn_p203272 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))

;; p203273  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p203273 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 glazing))

;; p203282  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p203282 $e0 $x0 $x1)
(And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p203412  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000003 tierC-000004 tierC-000343
;;   meta-node: (Mn_p203412 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 locate))

;; p203702  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000279 tierC-000280 tierC-000313
;;   meta-node: (Mn_p203702 $e0 $x0)
(And (Member $e0 find) (Theme $e0 $x0))

;; p203703  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000076 tierC-000095 tierC-000096
;;   meta-node: (Mn_p203703 $e0)
(And (Member $e0 follow) (Past $e0))

;; p203704  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000258 tierC-000351
;;   meta-node: (Mn_p203704 $e0)
(And (Member $e0 influence) (Past $e0))

;; p203707  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000227 tierC-000228 tierC-000229
;;   meta-node: (Mn_p203707 $e0)
(And (Member $e0 play) (Past $e0))

;; p203712  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000099 tierC-000100 tierC-000359
;;   meta-node: (Mn_p203712 $e0)
(And (Member $e0 replace) (Past $e0))

;; p203722  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000335 tierA-000336 tierA-000337
;;   meta-node: (Mn_p203722 $x0)
(And (Member $x0 bench) (Member $x0 new))

;; p203726  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000257 tierA-000258 tierA-000259
;;   meta-node: (Mn_p203726 $x0)
(And (Member $x0 elm) (Member $x0 last))

;; p203864  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000113 tierC-000114 tierC-000117
;;   meta-node: (Mn_p203864 $x0)
(GroupOf $x0 tradition)

;; p203872  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000227 tierC-000228 tierC-000231
;;   meta-node: (Mn_p203872 $e0)
(Member $e0 add)

;; p203880  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000163 tierC-000164 tierC-000179
;;   meta-node: (Mn_p203880 $e0)
(Member $e0 form)

;; p203881  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   meta-node: (Mn_p203881 $e0)
(Member $e0 give_up)

;; p203891  support 4 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000053 tierC-000054 tierC-000185
;;   meta-node: (Mn_p203891 $e0)
(Member $e0 serve)

;; p203894  support 4 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000005 tierC-000006 tierC-000173
;;   meta-node: (Mn_p203894 $e0)
(Member $e0 use)

;; p203898  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000339 tierA-000340 tierA-000341
;;   meta-node: (Mn_p203898 $x0)
(Member $x0 boiler)

;; p203899  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000355 tierA-000356 tierA-000357
;;   meta-node: (Mn_p203899 $x0)
(Member $x0 calibration)

;; p203902  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   meta-node: (Mn_p203902 $x0)
(Member $x0 countersignature)

;; p203903  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000367 tierA-000368 tierA-000369
;;   meta-node: (Mn_p203903 $x0)
(Member $x0 courier)

;; p203904  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000082
;;   meta-node: (Mn_p203904 $x0)
(Member $x0 curator)

;; p203907  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000359 tierA-000360 tierA-000361
;;   meta-node: (Mn_p203907 $x0)
(Member $x0 descent)

;; p203915  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   meta-node: (Mn_p203915 $x0)
(Member $x0 founder)

;; p203916  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000317
;;   meta-node: (Mn_p203916 $x0)
(Member $x0 frame)

;; p203917  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000239
;;   meta-node: (Mn_p203917 $x0)
(Member $x0 freight)

;; p203918  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p203918 $x0)
(Member $x0 gate)

;; p203920  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000331 tierA-000332 tierA-000333
;;   meta-node: (Mn_p203920 $x0)
(Member $x0 hatch)

;; p203925  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (Mn_p203925 $x0)
(Member $x0 licence)

;; p203926  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000311 tierA-000312 tierA-000313
;;   meta-node: (Mn_p203926 $x0)
(Member $x0 mural)

;; p203929  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   meta-node: (Mn_p203929 $x0)
(Member $x0 painting)

;; p203930  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   meta-node: (Mn_p203930 $x0)
(Member $x0 pier)

;; p203933  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000351 tierA-000352 tierA-000353
;;   meta-node: (Mn_p203933 $x0)
(Member $x0 repair)

;; p203936  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000173 tierA-000174 tierA-000175
;;   meta-node: (Mn_p203936 $x0)
(Member $x0 shepherd)

;; p203937  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000343 tierA-000344 tierA-000345
;;   meta-node: (Mn_p203937 $x0)
(Member $x0 skylight)

;; p203940  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   meta-node: (Mn_p203940 $x0)
(Member $x0 trainer)

;; p203941  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000177 tierA-000178 tierA-000179
;;   meta-node: (Mn_p203941 $x0)
(Member $x0 ward)

;; p203980  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000265 tierA-000280 tierA-000310
;;   meta-node: (Mn_p203980 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p203985  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   meta-node: (Mn_p203985 $e0 $x0)
(And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation) (Time $e0 (Weekday thursday)))

;; p203987  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (Mn_p203987 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample) (Inheritance soil_sample sample) (Instrument $e0 post))

;; p203992  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (Mn_p203992 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $e0 examine) (Theme $e0 $x1))

;; p203993  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000382 tierA-000384
;;   meta-node: (Mn_p203993 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $x0 physician) (Theme $e0 $x1))

;; p203996  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (Mn_p203996 $e0 $x0)
(And (Agent $e0 $x0) (Inheritance night_delivery delivery) (Member $x0 licence) (Theme $e0 night_delivery))

;; p204000  support 3 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   meta-node: (Mn_p204000 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x1 survey))

;; p204003  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   meta-node: (Mn_p204003 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 welder) (Member $x1 frame))

;; p204004  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p204004 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 hall) (Theme $e0 photography))

;; p204019  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p204019 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 arrive) (Member $x0 freight) (Time $e0 (Hour <num>)))

;; p204047  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p204047 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 fund) (Member $x0 government) (Theme $e0 $x1))

;; p204066  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   meta-node: (Mn_p204066 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 postpone) (Member $x1 tournament) (Theme $e0 $x1))

;; p204068  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (Mn_p204068 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 sign) (Member $x1 chart) (Patient $e0 $x1))

;; p204079  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   meta-node: (Mn_p204079 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 airline) (Member $x1 evening_flight) (Theme $e0 $x1))

;; p204080  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p204080 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 bank) (Member $x1 loan_application) (Theme $e0 $x1))

;; p204083  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (Mn_p204083 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 clerk) (Member $x1 query) (Theme $e0 $x1))

;; p204089  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (Mn_p204089 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 judge) (Member $x1 case) (Theme $e0 $x1))

;; p204092  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p204092 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1))

;; p204093  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000072 tierC-000089 tierC-000090
;;   meta-node: (Mn_p204093 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))

;; p204095  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000387 tierA-000388
;;   meta-node: (Mn_p204095 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 physician) (Ordinal $x1 <num> scan) (Theme $e0 $x1))

;; p204096  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (Mn_p204096 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pilot) (Member $x1 tower) (Theme $e0 $x1))

;; p204104  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p204104 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 warden) (Theme $e0 visitor) (Time $e0 (Weekday sunday)))

;; p204118  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   meta-node: (Mn_p204118 $e0 $x0)
(And (Agent $e0 dara) (Location $e0 $x0) (Member $e0 work) (Member $x0 ledger))

;; p204137  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p204137 $e0 $x0 $x1)
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $x0 ranger) (Member $x1 survey))

;; p204138  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p204138 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait) (Member $x1 gate))

;; p204147  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p204147 $e0 $x0)
(And (Future $e0) (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p204151  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p204151 $e0 $x0)
(And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))

;; p204154  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204154 $e0 $x0 $x1)
(And (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))

;; p204157  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p204157 $e0 $x0)
(And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Member $x0 lathe) (Theme $e0 monthly_servicing))

;; p204158  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000091 tierA-000092
;;   meta-node: (Mn_p204158 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit) (Theme $e0 $x1))

;; p204159  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (Mn_p204159 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe) (Theme $e0 $x1))

;; p204160  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   meta-node: (Mn_p204160 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $x0 permit) (Member $x1 countersignature) (Theme $e0 $x1))

;; p204161  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   meta-node: (Mn_p204161 $e0 $x0)
(And (Inheritance afternoon_session session) (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p204162  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   meta-node: (Mn_p204162 $e0)
(And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing))

;; p204164  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (Mn_p204164 $e0 $x0)
(And (Inheritance north_route route) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))

;; p204165  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   meta-node: (Mn_p204165 $e0 $x0)
(And (Inheritance summer_fair fair) (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))

;; p204167  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (Mn_p204167 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1))

;; p204168  support 3 (occ 3)  size 4  root $e1 (event)  depth 3
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p204168 $e1 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger) (Stimulus $e1 $e0))

;; p204169  support 3 (occ 3)  size 4  root $e1 (event)  depth 3
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   meta-node: (Mn_p204169 $e1 $e0 $x0)
(And (Location $e0 $x0) (Member $e1 discover) (Member $x0 ledger) (Stimulus $e1 $e0))

;; p204170  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204170 $e0 $x0 $x1)
(And (Manner $e0 $x0) (Member $e0 define) (Member $x0 random) (Theme $e0 $x1))

;; p204172  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (Mn_p204172 $e0 $x0 $x1)
(And (Member $e0 abandon) (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0))

;; p204177  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p204177 $e0 $e1 $x0)
(And (Member $e0 cause) (Member $e1 destroy) (Patient $e1 $x0) (Theme $e0 $e1))

;; p204178  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204178 $e0 $x0)
(And (Member $e0 decide) (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0))

;; p204179  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (Mn_p204179 $e1 $e0 $x0)
(And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0) (Theme $e0 $x0))

;; p204180  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (Mn_p204180 $e1 $e0 $x0)
(And (Member $e0 decision) (Member $e1 reach) (Theme $e0 $x0) (Theme $e1 $e0))

;; p204183  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (Mn_p204183 $e0 $x0)
(And (Member $e0 discover) (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0))

;; p204184  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p204184 $e0 $x0 $x1)
(And (Member $e0 give) (Member $x0 answer) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204185  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   meta-node: (Mn_p204185 $e0 $x0 $x1)
(And (Member $e0 give) (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204186  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204186 $e0 $x0 $x1)
(And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204187  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204187 $e0 $x0 $x1)
(And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204188  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204188 $e0 $x0 $x1)
(And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204189  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (Mn_p204189 $e0 $x0 $x1)
(And (Member $e0 lend) (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204191  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204191 $e0 $x0)
(And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing))

;; p204192  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (Mn_p204192 $e0 $x0 $x1)
(And (Member $e0 teach) (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204193  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204193 $e0 $x0 $x1)
(And (Member $e0 teach) (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204194  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (Mn_p204194 $e0 $x0 $x1)
(And (Member $x0 departure) (Member $x1 ferry) (Possession $x0 $x1) (Theme $e0 $x0))

;; p204195  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204195 $e0 $x0)
(And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))

;; p204983  support 3 (occ 3)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   meta-node: (Mn_p204983 $x0)
(And (Inheritance feed_pipe pipe) (Member $x0 cracked) (Member $x0 feed_pipe))

;; p205011  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   meta-node: (Mn_p205011 $e0 $x0)
(And (Member $e0 destroy) (Member $x0 archive) (Patient $e0 $x0))

;; p205012  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   meta-node: (Mn_p205012 $e0 $x0)
(And (Member $e0 destroy) (Member $x0 footbridge) (Patient $e0 $x0))

;; p205013  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (Mn_p205013 $e0 $x0)
(And (Member $e0 destroy) (Member $x0 greenhouse) (Patient $e0 $x0))

;; p205023  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000300
;;   meta-node: (Mn_p205023 $e0 $x0)
(And (Member $e0 lend) (Member $x0 ladder) (Theme $e0 $x0))

;; p205310  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   meta-node: (Mn_p205310 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $e0 work))

;; p205311  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   meta-node: (Mn_p205311 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Might $e0) (Theme $e0 $x1))

;; p205313  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p205313 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1) (Theme $e0 $x2))

;; p205314  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p205314 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))

;; p205315  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (Mn_p205315 $e0 $e1 $x0)
(And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p205375  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000351 tierC-000352
;;   meta-node: (Mn_p205375 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 influence) (Past $e0))

;; p205560  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000311 tierA-000312 tierA-000313
;;   meta-node: (Mn_p205560 $e0)
(And (Agent $e0 ana) (Member $e0 work))

;; p205578  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   meta-node: (Mn_p205578 $e0 $x0)
(And (Goal $e0 $x0) (Member $e0 walk))

;; p205596  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000199 tierC-000200 tierC-000358
;;   meta-node: (Mn_p205596 $e0)
(And (Member $e0 bear) (Past $e0))

;; p205600  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000284 tierC-000341 tierC-000342
;;   meta-node: (Mn_p205600 $e0)
(And (Member $e0 conduct) (Past $e0))

;; p205747  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000080 tierC-000201 tierC-000202
;;   meta-node: (Mn_p205747 $e0)
(Member $e0 active)

;; p205754  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000129 tierA-000134 tierA-000139
;;   meta-node: (Mn_p205754 $e0)
(Member $e0 find_out)

;; p205765  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000391 tierA-000396 tierA-000400
;;   meta-node: (Mn_p205765 $x0)
(Member $x0 car)

;; p205775  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000003 tierC-000004 tierC-000064
;;   meta-node: (Mn_p205775 $x0)
(Member $x0 park)

;; ==================== SUBSUMED UNITS: 1396 of 1652 rooted-subtree units (k = 4, support >= 3 of 740 records) ====================

;; p200004  support 301 (occ 347)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200004 $e0 $x0)
(Agent $e0 $x0)

;; p200008  support 247 (occ 264)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200008 $e0 $x0)
(Theme $e0 $x0)

;; p200013  support 176 (occ 255)  size 1  root $e0 (event)  depth 0
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200013 $e0)
(Past $e0)

;; p200015  support 171 (occ 171)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200015 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Theme $e0 $x1))

;; p200022  support 122 (occ 148)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p200022 $e0 $x0)
(Patient $e0 $x0)

;; p200033  support 77 (occ 101)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200033 $e0 $x0)
(And (Agent $e0 $x0) (Past $e0))

;; p200039  support 65 (occ 76)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p200039 $e0 $x0)
(Location $e0 $x0)

;; p200041  support 63 (occ 71)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200041 $e0 $x0)
(And (Past $e0) (Theme $e0 $x0))

;; p200049  support 52 (occ 75)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p200049 $e0 $x0)
(And (Past $e0) (Patient $e0 $x0))

;; p200051  support 51 (occ 53)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200051 $x0)
(Cardinality $x0 <num>)

;; p200053  support 50 (occ 58)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p200053 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Patient $e0 $x1))

;; p200071  support 37 (occ 37)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p200071 $e0 $x0)
(Recipient $e0 $x0)

;; p200073  support 35 (occ 35)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200073 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p200076  support 34 (occ 41)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000098 tierA-000128 tierA-000129
;;   meta-node: (Mn_p200076 $e0 $x0)
(Experiencer $e0 $x0)

;; p200091  support 29 (occ 29)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p200091 $e0 $x0 $x1)
(And (Recipient $e0 $x0) (Theme $e0 $x1))

;; p200099  support 28 (occ 28)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200099 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Recipient $e0 $x1))

;; p200103  support 28 (occ 28)  size 1  root $e0 (event)  depth 0
;;   e.g. tierA-000055 tierA-000066 tierA-000070
;;   meta-node: (Mn_p200103 $e0)
(Might $e0)

;; p200125  support 25 (occ 31)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p200125 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1))

;; p200136  support 24 (occ 24)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200136 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p200147  support 23 (occ 23)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200147 $e0 $x0)
(And (Cardinality $x0 <num>) (Theme $e0 $x0))

;; p200159  support 22 (occ 28)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p200159 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p200170  support 20 (occ 20)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000075 tierA-000078 tierA-000108
;;   meta-node: (Mn_p200170 $e0 $x0)
(And (Agent $e0 $x0) (Might $e0))

;; p200191  support 18 (occ 28)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000041 tierC-000042 tierC-000049
;;   meta-node: (Mn_p200191 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 person))

;; p200219  support 16 (occ 18)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000187
;;   meta-node: (Mn_p200219 $e0 $e1)
(Theme $e0 $e1)

;; p200237  support 15 (occ 15)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (Mn_p200237 $e0 $x0)
(Holder $e0 $x0)

;; p200250  support 14 (occ 14)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   meta-node: (Mn_p200250 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))

;; p200251  support 14 (occ 14)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   meta-node: (Mn_p200251 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))

;; p200252  support 14 (occ 14)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   meta-node: (Mn_p200252 $e0 $x0)
(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))

;; p200255  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   meta-node: (Mn_p200255 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy))

;; p200256  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   meta-node: (Mn_p200256 $e0)
(And (Member $e0 buy) (Past $e0))

;; p200257  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   meta-node: (Mn_p200257 $e0 $x0)
(And (Member $e0 buy) (Theme $e0 $x0))

;; p200259  support 14 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   meta-node: (Mn_p200259 $e0)
(Member $e0 buy)

;; p200266  support 13 (occ 19)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000072
;;   meta-node: (Mn_p200266 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 person) (Past $e0))

;; p200281  support 13 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p200281 $e0 $x0 $x1)
(And (Location $e0 $x0) (Theme $e0 $x1))

;; p200283  support 13 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000087 tierA-000108 tierA-000112
;;   meta-node: (Mn_p200283 $e0 $x0)
(And (Might $e0) (Theme $e0 $x0))

;; p200288  support 13 (occ 13)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   meta-node: (Mn_p200288 $e0 $x0)
(Goal $e0 $x0)

;; p200329  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200329 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))

;; p200330  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200330 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))

;; p200331  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000108 tierA-000112 tierA-000122
;;   meta-node: (Mn_p200331 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1))

;; p200332  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200332 $e0 $x0 $x1)
(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p200338  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200338 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 give))

;; p200339  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (Mn_p200339 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Theme $e0 $x1))

;; p200340  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200340 $e0 $x0)
(And (Member $e0 give) (Recipient $e0 $x0))

;; p200341  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200341 $e0 $x0)
(And (Member $e0 give) (Theme $e0 $x0))

;; p200350  support 12 (occ 12)  size 1  root $e0 (event)  depth 0
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p200350 $e0)
(Future $e0)

;; p200352  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p200352 $e0)
(Member $e0 give)

;; p200355  support 12 (occ 13)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p200355 $e0 $x0)
(Source $e0 $x0)

;; p200377  support 11 (occ 11)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200377 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))

;; p200400  support 11 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000187
;;   meta-node: (Mn_p200400 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Theme $e0 $e1))

;; p200401  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p200401 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1))

;; p200402  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (Mn_p200402 $e0 $x0)
(And (Member $e0 destroy) (Patient $e0 $x0))

;; p200403  support 11 (occ 13)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p200403 $e0 $x0 $x1)
(And (Possession $x0 $x1) (Theme $e0 $x0))

;; p200409  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000077 tierC-000078
;;   meta-node: (Mn_p200409 $e0 $e1)
(Before $e0 $e1)

;; p200411  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (Mn_p200411 $e0)
(Member $e0 destroy)

;; p200470  support 10 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
;;   meta-node: (Mn_p200470 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))

;; p200471  support 10 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p200471 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))

;; p200480  support 10 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000006 tierA-000109 tierA-000110
;;   meta-node: (Mn_p200480 $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>))

;; p200481  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
;;   meta-node: (Mn_p200481 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 answer))

;; p200482  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
;;   meta-node: (Mn_p200482 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 decide))

;; p200483  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p200483 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 teach))

;; p200486  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
;;   meta-node: (Mn_p200486 $e0 $x0)
(And (Member $e0 answer) (Theme $e0 $x0))

;; p200489  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p200489 $e0 $x0)
(And (Member $e0 teach) (Recipient $e0 $x0))

;; p200490  support 10 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p200490 $e0 $x0 $x1)
(And (Source $e0 $x0) (Theme $e0 $x1))

;; p200499  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
;;   meta-node: (Mn_p200499 $e0)
(Member $e0 answer)

;; p200500  support 10 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000071
;;   meta-node: (Mn_p200500 $e0)
(Member $e0 build)

;; p200501  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p200501 $e0)
(Member $e0 lend)

;; p200503  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p200503 $e0)
(Member $e0 teach)

;; p200525  support 9 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200525 $e0 $x0)
(And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))

;; p200550  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
;;   meta-node: (Mn_p200550 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))

;; p200551  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p200551 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))

;; p200558  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000143 tierA-000145 tierA-000148
;;   meta-node: (Mn_p200558 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 cancel))

;; p200559  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p200559 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 lend))

;; p200560  support 9 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (Mn_p200560 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 board))

;; p200561  support 9 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p200561 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Source $e0 $x1))

;; p200562  support 9 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000313 tierA-000315 tierA-000316
;;   meta-node: (Mn_p200562 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 work))

;; p200563  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
;;   meta-node: (Mn_p200563 $e0 $x0)
(And (Member $e0 decide) (Theme $e0 $x0))

;; p200564  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p200564 $e0 $x0)
(And (Member $e0 discover) (Theme $e0 $x0))

;; p200574  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000143 tierA-000145 tierA-000148
;;   meta-node: (Mn_p200574 $e0)
(Member $e0 cancel)

;; p200620  support 8 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p200620 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1))

;; p200621  support 8 (occ 20)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   meta-node: (Mn_p200621 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1))

;; p200661  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   meta-node: (Mn_p200661 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))

;; p200662  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000224 tierA-000226
;;   meta-node: (Mn_p200662 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))

;; p200663  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   meta-node: (Mn_p200663 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))

;; p200664  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (Mn_p200664 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))

;; p200665  support 8 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p200665 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))

;; p200675  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   meta-node: (Mn_p200675 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 abandon))

;; p200676  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000224 tierA-000226
;;   meta-node: (Mn_p200676 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 destroy))

;; p200677  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   meta-node: (Mn_p200677 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 reject))

;; p200678  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (Mn_p200678 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 repair))

;; p200679  support 8 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000377 tierA-000380
;;   meta-node: (Mn_p200679 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 physician))

;; p200680  support 8 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p200680 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 school))

;; p200681  support 8 (occ 20)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   meta-node: (Mn_p200681 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Possession $x0 $x1))

;; p200682  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000237
;;   meta-node: (Mn_p200682 $e0 $x0)
(And (Can $e0) (Theme $e0 $x0))

;; p200683  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (Mn_p200683 $e0 $x0)
(And (Holder $e0 $x0) (Member $e0 require))

;; p200684  support 8 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p200684 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 ledger))

;; p200685  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   meta-node: (Mn_p200685 $e0 $x0)
(And (Member $e0 abandon) (Theme $e0 $x0))

;; p200687  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   meta-node: (Mn_p200687 $e0 $x0)
(And (Member $e0 reject) (Theme $e0 $x0))

;; p200688  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (Mn_p200688 $e0 $x0)
(And (Member $e0 repair) (Patient $e0 $x0))

;; p200696  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   meta-node: (Mn_p200696 $e0)
(Member $e0 abandon)

;; p200698  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000153 tierC-000154 tierC-000181
;;   meta-node: (Mn_p200698 $e0)
(Member $e0 have)

;; p200699  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   meta-node: (Mn_p200699 $e0)
(Member $e0 reject)

;; p200700  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (Mn_p200700 $e0)
(Member $e0 repair)

;; p200703  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000328 tierA-000332 tierA-000336
;;   meta-node: (Mn_p200703 $x0)
(Member $x0 big)

;; p200706  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (Mn_p200706 $x0)
(Member $x0 new)

;; p200758  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000006 tierA-000109 tierA-000110
;;   meta-node: (Mn_p200758 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1))

;; p200759  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (Mn_p200759 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 board) (Theme $e0 $x1))

;; p200760  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200760 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))

;; p200762  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000077 tierC-000078
;;   meta-node: (Mn_p200762 $e0 $e1)
(And (Before $e0 $e1) (Past $e0) (Past $e1))

;; p200793  support 7 (occ 7)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p200793 $x0)
(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))

;; p200801  support 7 (occ 7)  size 1  root pottery_studio (constant)  depth 1
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p200801 pottery_studio)
(Inheritance pottery_studio studio)

;; p200805  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000145 tierA-000148 tierA-000150
;;   meta-node: (Mn_p200805 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))

;; p200806  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p200806 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))

;; p200807  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   meta-node: (Mn_p200807 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))

;; p200809  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000300 tierA-000301 tierA-000303
;;   meta-node: (Mn_p200809 $e0 $x0 $x1)
(And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p200822  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
;;   meta-node: (Mn_p200822 $e0 $x0 $x1)
(And (Agent $e0 $x0) (CoAgent $e0 $x1))

;; p200823  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p200823 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 discover))

;; p200824  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   meta-node: (Mn_p200824 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 postpone))

;; p200825  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200825 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 depot))

;; p200827  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000077 tierC-000078
;;   meta-node: (Mn_p200827 $e0 $e1)
(And (Before $e0 $e1) (Past $e0))

;; p200828  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000077 tierC-000078
;;   meta-node: (Mn_p200828 $e0 $e1)
(And (Before $e0 $e1) (Past $e1))

;; p200829  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p200829 $e0 $x0)
(And (Beneficiary $e0 $x0) (Past $e0))

;; p200831  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p200831 $e0 $x0)
(And (Future $e0) (Patient $e0 $x0))

;; p200832  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000055 tierA-000057
;;   meta-node: (Mn_p200832 $e0 $x0)
(And (Member $e0 begin) (Patient $e0 $x0))

;; p200833  support 7 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000072
;;   meta-node: (Mn_p200833 $e0)
(And (Member $e0 build) (Past $e0))

;; p200834  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000145 tierA-000148 tierA-000150
;;   meta-node: (Mn_p200834 $e0 $x0)
(And (Member $e0 cancel) (Patient $e0 $x0))

;; p200835  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000300 tierA-000301 tierA-000303
;;   meta-node: (Mn_p200835 $e0 $x0)
(And (Member $e0 lend) (Recipient $e0 $x0))

;; p200836  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   meta-node: (Mn_p200836 $e0 $x0)
(And (Member $e0 postpone) (Theme $e0 $x0))

;; p200850  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p200850 $e0 $x0)
(Beneficiary $e0 $x0)

;; p200851  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
;;   meta-node: (Mn_p200851 $e0 $x0)
(CoAgent $e0 $x0)

;; p200852  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200852 $x0)
(GroupOf $x0 forklift)

;; p200854  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   meta-node: (Mn_p200854 $e0)
(Member $e0 postpone)

;; p200856  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p200856 $x0)
(Member $x0 kiln)

;; p200857  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p200857 $x0)
(Member $x0 pottery_studio)

;; p200965  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000382 tierA-000384
;;   meta-node: (Mn_p200965 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 physician) (Theme $e0 $x1))

;; p200966  support 6 (occ 10)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   meta-node: (Mn_p200966 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))

;; p200968  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p200968 $e0 $x0)
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0))

;; p200969  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p200969 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Theme $e0 $x1))

;; p200970  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p200970 $e0 $x0)
(And (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))

;; p200971  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p200971 $e0 $x0)
(And (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))

;; p201039  support 6 (occ 6)  size 1  root yard_floodlight (constant)  depth 1
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201039 yard_floodlight)
(Inheritance yard_floodlight floodlight)

;; p201058  support 6 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000071
;;   meta-node: (Mn_p201058 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))

;; p201059  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (Mn_p201059 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1))

;; p201060  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (Mn_p201060 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))

;; p201061  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (Mn_p201061 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 $x1))

;; p201062  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201062 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p201063  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p201063 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Theme $e0 $x0))

;; p201064  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (Mn_p201064 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 require) (Theme $e0 $x1))

;; p201065  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (Mn_p201065 $e0 $x0)
(And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))

;; p201066  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (Mn_p201066 $e0 $x0 $x1)
(And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p201067  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000089 tierC-000090 tierC-000131
;;   meta-node: (Mn_p201067 $e0 $x0)
(And (Member $e0 write) (Past $e0) (Patient $e0 $x0))

;; p201084  support 6 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000071
;;   meta-node: (Mn_p201084 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 build))

;; p201085  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201085 $e0 $x0)
(And (Beneficiary $e0 $x0) (Member $x0 hall))

;; p201086  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201086 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Theme $e0 $x1))

;; p201087  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p201087 $e0 $e1)
(And (For $e0 $e1) (Past $e0))

;; p201088  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p201088 $e0 $x0)
(And (GroupOf $x0 forklift) (Theme $e0 $x0))

;; p201090  support 6 (occ 8)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000174 tierA-000178 tierC-000025
;;   meta-node: (Mn_p201090 $e1 $e0 $x0)
(And (Location $e0 $x0) (Theme $e1 $e0))

;; p201091  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000187 tierA-000191
;;   meta-node: (Mn_p201091 $e0 $x0)
(And (Member $e0 decision) (Theme $e0 $x0))

;; p201092  support 6 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000009 tierC-000010 tierC-000091
;;   meta-node: (Mn_p201092 $e0 $x0)
(And (Member $e0 produce) (Patient $e0 $x0))

;; p201093  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (Mn_p201093 $e0)
(And (Member $e0 repair) (Past $e0))

;; p201094  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (Mn_p201094 $e0 $x0)
(And (Member $e0 teach) (Theme $e0 $x0))

;; p201095  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000089 tierC-000090 tierC-000131
;;   meta-node: (Mn_p201095 $e0)
(And (Member $e0 write) (Past $e0))

;; p201096  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000089 tierC-000090 tierC-000131
;;   meta-node: (Mn_p201096 $e0 $x0)
(And (Member $e0 write) (Patient $e0 $x0))

;; p201098  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201098 $e0 $x0)
(And (Member $x0 kiln) (Theme $e0 $x0))

;; p201099  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000292 tierA-000293
;;   meta-node: (Mn_p201099 $e0 $x0)
(And (Member $x0 song) (Theme $e0 $x0))

;; p201100  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000055 tierA-000066 tierA-000070
;;   meta-node: (Mn_p201100 $e0 $x0)
(And (Might $e0) (Patient $e0 $x0))

;; p201131  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p201131 $x0 $e0)
(Before $x0 $e0)

;; p201132  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p201132 $e0 $e1)
(For $e0 $e1)

;; p201133  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201133 $x0)
(GroupOf $x0 lemon)

;; p201134  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p201134 $e0)
(Member $e0 arrive)

;; p201138  support 6 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000009 tierC-000010 tierC-000091
;;   meta-node: (Mn_p201138 $e0)
(Member $e0 produce)

;; p201141  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000089 tierC-000090 tierC-000131
;;   meta-node: (Mn_p201141 $e0)
(Member $e0 write)

;; p201144  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   meta-node: (Mn_p201144 $x0)
(Member $x0 budget)

;; p201145  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000190 tierA-000191 tierA-000192
;;   meta-node: (Mn_p201145 $x0)
(Member $x0 case)

;; p201146  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201146 $x0)
(Member $x0 electrician)

;; p201150  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201150 $x0)
(Member $x0 yard_floodlight)

;; p201151  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000182 tierA-000186 tierA-000191
;;   meta-node: (Mn_p201151 $e0 $e1)
(Patient $e0 $e1)

;; p201152  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   meta-node: (Mn_p201152 $x0)
(Possession $x0 next_year)

;; p201153  support 6 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000123 tierC-000124 tierC-000197
;;   meta-node: (Mn_p201153 $e0 $e1)
(To $e0 $e1)

;; p201162  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201162 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Member $x1 hall))

;; p201163  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201163 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Past $e0))

;; p201164  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201164 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Theme $e0 $x2))

;; p201165  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201165 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Past $e0))

;; p201166  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201166 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Theme $e0 $x2))

;; p201167  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201167 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Theme $e0 $x1))

;; p201168  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201168 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $x1 north_route) (Theme $e0 $x1))

;; p201169  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p201169 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 forklift) (Theme $e0 $x1))

;; p201170  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p201170 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 depot) (Theme $e0 $x1))

;; p201171  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201171 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $x1 north_route) (Theme $e0 $x1))

;; p201172  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p201172 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $x0 depot) (Theme $e0 $x1))

;; p201173  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p201173 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Past $e0) (Theme $e0 $x1))

;; p201174  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201174 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance north_route north) (Member $x1 north_route) (Theme $e0 $x1))

;; p201175  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201175 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance north_route route) (Member $x1 north_route) (Theme $e0 $x1))

;; p201176  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201176 $e0 $x0)
(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0))

;; p201177  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201177 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x1))

;; p201178  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201178 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance yard_floodlight floodlight) (Member $x1 yard_floodlight) (Patient $e0 $x1))

;; p201182  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201182 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 electrician) (Member $x1 yard_floodlight) (Patient $e0 $x1))

;; p201183  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201183 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0) (Patient $e0 $x1))

;; p201184  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201184 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Member $x1 kiln) (Theme $e0 $x1))

;; p201185  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201185 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x1))

;; p201188  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201188 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Past $e0) (Patient $e0 $x1))

;; p201189  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201189 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Member $x1 projector) (Theme $e0 $x1))

;; p201404  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201404 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school))

;; p201405  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201405 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall))

;; p201406  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201406 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Theme $e0 $x1))

;; p201407  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p201407 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Theme $e0 $x1))

;; p201408  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201408 $e0 $x0)
(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio))

;; p201409  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201409 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 point))

;; p201410  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000392 tierA-000398
;;   meta-node: (Mn_p201410 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1))

;; p201411  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   meta-node: (Mn_p201411 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 club) (Theme $e0 $x1))

;; p201412  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (Mn_p201412 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 depot) (Past $e0))

;; p201413  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201413 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0))

;; p201414  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201414 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 electrician) (Patient $e0 $x1))

;; p201415  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201415 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0))

;; p201416  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201416 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Theme $e0 $x1))

;; p201417  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201417 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 school) (Past $e0))

;; p201418  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201418 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 kiln) (Theme $e0 $x1))

;; p201419  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201419 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 north_route) (Theme $e0 $x1))

;; p201420  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   meta-node: (Mn_p201420 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 tournament) (Theme $e0 $x1))

;; p201421  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201421 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Patient $e0 $x1))

;; p201423  support 5 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p201423 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p201424  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201424 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $x1 projector) (Theme $e0 $x1))

;; p201425  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (Mn_p201425 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))

;; p201426  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   meta-node: (Mn_p201426 $e0 $x0)
(And (Cardinality $x0 <num>) (Member $e0 require) (Theme $e0 $x0))

;; p201427  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201427 $e0 $x0)
(And (GroupOf $x0 lemon) (Past $e0) (Theme $e0 $x0))

;; p201428  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201428 $e0 $x0)
(And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p201429  support 5 (occ 5)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201429 $x0)
(And (Inheritance north_route north) (Inheritance north_route route) (Member $x0 north_route))

;; p201430  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201430 $e0 $x0)
(And (Inheritance north_route north) (Member $x0 north_route) (Theme $e0 $x0))

;; p201431  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201431 $e0 $x0)
(And (Inheritance north_route route) (Member $x0 north_route) (Theme $e0 $x0))

;; p201432  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (Mn_p201432 $e0 $x0)
(And (Inheritance shoreline_survey survey) (Member $x0 shoreline_survey) (Patient $e0 $x0))

;; p201433  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201433 $e0 $x0)
(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Patient $e0 $x0))

;; p201434  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201434 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $x0 point) (Theme $e0 $x1))

;; p201436  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201436 $e0 $x0)
(And (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p201437  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201437 $e0 $x0)
(And (Member $x0 crate) (Past $e0) (Theme $e0 $x0))

;; p201439  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201439 $e0 $x0)
(And (Member $x0 projector) (Past $e0) (Theme $e0 $x0))

;; p201440  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (Mn_p201440 $e0 $x0)
(And (Member $x0 shoreline_survey) (Patient $e0 $x0) (Time $e0 dawn))

;; p201441  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201441 $e0 $x0)
(And (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0))

;; p201533  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p201533 $x0)
(And (Inheritance afternoon_session session) (Member $x0 afternoon_session))

;; p201534  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201534 $x0)
(And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest))

;; p201538  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201538 $x0)
(And (Inheritance north_route north) (Member $x0 north_route))

;; p201539  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201539 $x0)
(And (Inheritance north_route route) (Member $x0 north_route))

;; p201541  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (Mn_p201541 $x0)
(And (Inheritance shoreline_survey survey) (Member $x0 shoreline_survey))

;; p201572  support 5 (occ 5)  size 2  root north_route (constant)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201572 north_route)
(And (Inheritance north_route north) (Inheritance north_route route))

;; p201586  support 5 (occ 5)  size 1  root afternoon_session (constant)  depth 1
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p201586 afternoon_session)
(Inheritance afternoon_session session)

;; p201587  support 5 (occ 5)  size 1  root apple_harvest (constant)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201587 apple_harvest)
(Inheritance apple_harvest harvest)

;; p201588  support 5 (occ 5)  size 1  root dress_rehearsal (constant)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p201588 dress_rehearsal)
(Inheritance dress_rehearsal rehearsal)

;; p201589  support 5 (occ 5)  size 1  root evening_flight (constant)  depth 1
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   meta-node: (Mn_p201589 evening_flight)
(Inheritance evening_flight flight)

;; p201590  support 5 (occ 5)  size 1  root loan_application (constant)  depth 1
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p201590 loan_application)
(Inheritance loan_application application)

;; p201591  support 5 (occ 5)  size 1  root monthly_servicing (constant)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p201591 monthly_servicing)
(Inheritance monthly_servicing monthly)

;; p201592  support 5 (occ 5)  size 1  root monthly_servicing (constant)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p201592 monthly_servicing)
(Inheritance monthly_servicing servicing)

;; p201593  support 5 (occ 5)  size 1  root north_route (constant)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201593 north_route)
(Inheritance north_route north)

;; p201594  support 5 (occ 5)  size 1  root north_route (constant)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201594 north_route)
(Inheritance north_route route)

;; p201595  support 5 (occ 5)  size 1  root rescue_team (constant)  depth 1
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p201595 rescue_team)
(Inheritance rescue_team team)

;; p201596  support 5 (occ 5)  size 1  root shoreline_survey (constant)  depth 1
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (Mn_p201596 shoreline_survey)
(Inheritance shoreline_survey survey)

;; p201597  support 5 (occ 5)  size 1  root summer_fair (constant)  depth 1
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p201597 summer_fair)
(Inheritance summer_fair fair)

;; p201622  support 5 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201622 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0) (Theme $e0 $x2))

;; p201633  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201633 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0))

;; p201634  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201634 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Theme $e0 $x2))

;; p201635  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201635 $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber))

;; p201636  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
;;   meta-node: (Mn_p201636 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2))

;; p201637  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000319
;;   meta-node: (Mn_p201637 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work))

;; p201638  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201638 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e0 $x2))

;; p201639  support 5 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000072
;;   meta-node: (Mn_p201639 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 build) (Past $e0))

;; p201641  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   meta-node: (Mn_p201641 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Theme $e0 $x0))

;; p201642  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201642 $e0 $x0)
(And (GroupOf $x0 lemon) (Member $x0 crate) (Theme $e0 $x0))

;; p201643  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   meta-node: (Mn_p201643 $e0 $x0)
(And (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0))

;; p201675  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201675 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1))

;; p201676  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000241
;;   meta-node: (Mn_p201676 $e0 $x0)
(And (Agent $e0 $x0) (Future $e0))

;; p201677  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000181 tierA-000183 tierA-000184
;;   meta-node: (Mn_p201677 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Goal $e0 $x1))

;; p201678  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201678 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 climber))

;; p201681  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000319
;;   meta-node: (Mn_p201681 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 work))

;; p201682  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000392 tierA-000398
;;   meta-node: (Mn_p201682 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 automobile))

;; p201683  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   meta-node: (Mn_p201683 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 club))

;; p201684  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201684 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 electrician))

;; p201685  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000196 tierA-000197 tierA-000198
;;   meta-node: (Mn_p201685 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 family))

;; p201686  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000191 tierA-000192
;;   meta-node: (Mn_p201686 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 judge))

;; p201687  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (Mn_p201687 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 pottery_studio))

;; p201688  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p201688 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 tutor))

;; p201689  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000182 tierA-000186 tierA-000191
;;   meta-node: (Mn_p201689 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Patient $e0 $e1))

;; p201690  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000282 tierA-000283
;;   meta-node: (Mn_p201690 $e0 $x0)
(And (Agent $e0 $x0) (Theme $e0 glazing))

;; p201692  support 5 (occ 6)  size 2  root appear (constant)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p201692 appear $e0)
(And (Also appear $e0) (Past $e0))

;; p201693  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201693 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 climber))

;; p201694  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   meta-node: (Mn_p201694 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 egg))

;; p201695  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
;;   meta-node: (Mn_p201695 $e0 $x0 $x1)
(And (CoAgent $e0 $x0) (Location $e0 $x1))

;; p201697  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000013 tierC-000014 tierC-000062
;;   meta-node: (Mn_p201697 $e0 $x0)
(And (Experiencer $e0 $x0) (Past $e0))

;; p201698  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   meta-node: (Mn_p201698 $e0 $x0)
(And (GroupOf $x0 egg) (Theme $e0 $x0))

;; p201699  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201699 $e0 $x0)
(And (GroupOf $x0 lemon) (Theme $e0 $x0))

;; p201700  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000243 tierC-000244 tierC-000279
;;   meta-node: (Mn_p201700 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 find))

;; p201701  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000174 tierA-000177
;;   meta-node: (Mn_p201701 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 walk))

;; p201702  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201702 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 point))

;; p201703  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000014 tierC-000243 tierC-000244
;;   meta-node: (Mn_p201703 $e0 $x0)
(And (Location $e0 $x0) (Past $e0))

;; p201704  support 5 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p201704 $e0)
(And (Member $e0 appear) (Past $e0))

;; p201706  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   meta-node: (Mn_p201706 $e0 $x0)
(And (Member $e0 borrow) (Theme $e0 $x0))

;; p201707  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000253 tierA-000255 tierA-000257
;;   meta-node: (Mn_p201707 $e0 $x0)
(And (Member $e0 die) (Patient $e0 $x0))

;; p201709  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p201709 $e0 $x0)
(And (Member $e0 receive) (Theme $e0 $x0))

;; p201710  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201710 $e0 $x0)
(And (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p201711  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   meta-node: (Mn_p201711 $e0 $x0)
(And (Member $x0 budget) (Theme $e0 $x0))

;; p201712  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000191 tierA-000192
;;   meta-node: (Mn_p201712 $e0 $x0)
(And (Member $x0 case) (Theme $e0 $x0))

;; p201713  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201713 $e0 $x0)
(And (Member $x0 crate) (Theme $e0 $x0))

;; p201715  support 5 (occ 5)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p201715 $x1 $x0)
(And (Member $x0 firm) (Possession $x1 $x0))

;; p201717  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201717 $e0 $x0)
(And (Member $x0 north_route) (Theme $e0 $x0))

;; p201718  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201718 $e0 $x0)
(And (Member $x0 projector) (Theme $e0 $x0))

;; p201720  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (Mn_p201720 $e0 $x0)
(And (Member $x0 shoreline_survey) (Patient $e0 $x0))

;; p201721  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p201721 $x0 $x1)
(And (Member $x0 tender) (Possession $x0 $x1))

;; p201722  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   meta-node: (Mn_p201722 $e0 $x0)
(And (Member $x0 tournament) (Theme $e0 $x0))

;; p201723  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (Mn_p201723 $e0 $x0)
(And (Member $x0 yard_floodlight) (Patient $e0 $x0))

;; p201724  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000025 tierC-000026 tierC-000203
;;   meta-node: (Mn_p201724 $e0 $e1)
(And (Past $e0) (Theme $e0 $e1))

;; p201725  support 5 (occ 7)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p201725 $e1 $e0 $x0)
(And (Patient $e0 $x0) (Theme $e1 $e0))

;; p201726  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201726 $e0 $x0)
(And (Patient $e0 $x0) (Time $e0 (Month september)))

;; p201727  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (Mn_p201727 $e0 $x0)
(And (Patient $e0 $x0) (Time $e0 dawn))

;; p201728  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   meta-node: (Mn_p201728 $e0 $x0)
(And (Possession $x0 next_year) (Theme $e0 $x0))

;; p201757  support 5 (occ 6)  size 1  root appear (constant)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p201757 appear $e0)
(Also appear $e0)

;; p201758  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201758 $x0)
(GroupOf $x0 climber)

;; p201759  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   meta-node: (Mn_p201759 $x0)
(GroupOf $x0 egg)

;; p201761  support 5 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p201761 $e0)
(Member $e0 appear)

;; p201763  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   meta-node: (Mn_p201763 $e0)
(Member $e0 borrow)

;; p201764  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000253 tierA-000255 tierA-000257
;;   meta-node: (Mn_p201764 $e0)
(Member $e0 die)

;; p201765  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000010 tierC-000091 tierC-000138
;;   meta-node: (Mn_p201765 $e0)
(Member $e0 direct)

;; p201766  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p201766 $e0)
(Member $e0 receive)

;; p201767  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000182
;;   meta-node: (Mn_p201767 $e0)
(Member $e0 take)

;; p201768  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p201768 $x0)
(Member $x0 afternoon_session)

;; p201769  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   meta-node: (Mn_p201769 $x0)
(Member $x0 airline)

;; p201770  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201770 $x0)
(Member $x0 apple_harvest)

;; p201771  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000281 tierA-000282 tierA-000283
;;   meta-node: (Mn_p201771 $x0)
(Member $x0 apprentice)

;; p201772  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   meta-node: (Mn_p201772 $x0)
(Member $x0 archive)

;; p201773  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p201773 $x0)
(Member $x0 bank)

;; p201774  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000217 tierA-000218 tierA-000219
;;   meta-node: (Mn_p201774 $x0)
(Member $x0 caller)

;; p201776  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000207 tierA-000208 tierA-000209
;;   meta-node: (Mn_p201776 $x0)
(Member $x0 clerk)

;; p201777  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   meta-node: (Mn_p201777 $x0)
(Member $x0 club)

;; p201779  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p201779 $x0)
(Member $x0 council)

;; p201780  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201780 $x0)
(Member $x0 diver)

;; p201781  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p201781 $x0)
(Member $x0 dress_rehearsal)

;; p201782  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   meta-node: (Mn_p201782 $x0)
(Member $x0 editor)

;; p201783  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   meta-node: (Mn_p201783 $x0)
(Member $x0 evening_flight)

;; p201784  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p201784 $x0)
(Member $x0 file)

;; p201786  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p201786 $x0)
(Member $x0 firm)

;; p201787  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   meta-node: (Mn_p201787 $x0)
(Member $x0 flood)

;; p201789  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   meta-node: (Mn_p201789 $x0)
(Member $x0 gallery)

;; p201790  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201790 $x0)
(Member $x0 gearbox)

;; p201792  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (Mn_p201792 $x0)
(Member $x0 greenhouse)

;; p201793  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p201793 $x0)
(Member $x0 intern)

;; p201795  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000327 tierA-000331 tierA-000335
;;   meta-node: (Mn_p201795 $x0)
(Member $x0 large)

;; p201796  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p201796 $x0)
(Member $x0 lathe)

;; p201798  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p201798 $x0)
(Member $x0 loan_application)

;; p201799  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p201799 $x0)
(Member $x0 lunch)

;; p201802  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p201802 $x0)
(Member $x0 missing)

;; p201805  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (Mn_p201805 $x0)
(Member $x0 north_route)

;; p201806  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   meta-node: (Mn_p201806 $x0)
(Member $x0 panel)

;; p201808  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000212 tierA-000213 tierA-000214
;;   meta-node: (Mn_p201808 $x0)
(Member $x0 pilot)

;; p201809  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201809 $x0)
(Member $x0 point)

;; p201810  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000281 tierA-000282 tierA-000283
;;   meta-node: (Mn_p201810 $x0)
(Member $x0 potter)

;; p201811  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201811 $x0)
(Member $x0 projector)

;; p201814  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   meta-node: (Mn_p201814 $x0)
(Member $x0 recipe)

;; p201815  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p201815 $x0)
(Member $x0 rescue_team)

;; p201816  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p201816 $x0)
(Member $x0 scan)

;; p201817  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p201817 $x0)
(Member $x0 search)

;; p201818  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201818 $x0)
(Member $x0 seized)

;; p201819  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (Mn_p201819 $x0)
(Member $x0 shoreline_survey)

;; p201822  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p201822 $x0)
(Member $x0 summer_fair)

;; p201823  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p201823 $x0)
(Member $x0 tender)

;; p201824  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   meta-node: (Mn_p201824 $x0)
(Member $x0 tournament)

;; p201826  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p201826 $x0)
(Member $x0 tutor)

;; p201830  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201830 $x0)
(Member $x0 wreck)

;; p201831  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p201831 $x0)
(Ordinal $x0 <num> scan)

;; p201832  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000007 tierC-000008 tierC-000180
;;   meta-node: (Mn_p201832 $x0 $x1)
(PartOf $x0 $x1)

;; p201833  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000282 tierA-000283
;;   meta-node: (Mn_p201833 $e0)
(Theme $e0 glazing)

;; p201834  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201834 $e0)
(Time $e0 (Month september))

;; p201835  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (Mn_p201835 $e0)
(Time $e0 dawn)

;; p201877  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201877 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x2 projector) (Theme $e0 $x2))

;; p201878  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p201878 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))

;; p201879  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201879 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x0 chef) (Theme $e0 $x1))

;; p201880  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201880 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x1 crate) (Theme $e0 $x1))

;; p201881  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201881 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Past $e0) (Theme $e0 $x1))

;; p201882  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p201882 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))

;; p201883  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p201883 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance rescue_team team) (Member $x0 rescue_team) (Theme $e0 $x1))

;; p201884  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p201884 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))

;; p201888  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p201888 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x1 point))

;; p201890  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201890 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Member $x1 point))

;; p201891  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201891 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Theme $e0 $x2))

;; p201892  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201892 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x2 wreck) (Theme $e0 $x2))

;; p201893  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201893 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey) (Member $x0 company))

;; p201895  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201895 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Member $x0 company))

;; p201896  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201896 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Past $e0))

;; p201897  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201897 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Patient $e0 $x1))

;; p201898  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201898 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x1 hotel) (Patient $e0 $x1))

;; p201900  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201900 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Member $x0 company))

;; p201901  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201901 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Past $e0))

;; p201902  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201902 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Patient $e0 $x1))

;; p201904  support 4 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201904 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Member $x0 company))

;; p201905  support 4 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201905 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company) (Past $e0))

;; p201906  support 4 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201906 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company) (Patient $e0 $x1))

;; p201907  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201907 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $x1 hotel) (Patient $e0 $x1))

;; p201917  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201917 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Past $e0))

;; p201918  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201918 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Patient $e0 $x1))

;; p201919  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201919 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x1 hotel) (Patient $e0 $x1))

;; p201923  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201923 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 chef) (Member $x1 crate) (Theme $e0 $x1))

;; p201924  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p201924 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 chef) (Past $e0) (Theme $e0 $x1))

;; p201925  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201925 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 company) (Member $x1 hotel) (Patient $e0 $x1))

;; p201926  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201926 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))

;; p201928  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p201928 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 diver) (Member $x1 wreck) (Theme $e0 $x1))

;; p201931  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p201931 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 firm) (Member $x1 tender) (Theme $e0 $x1))

;; p201933  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p201933 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 intern) (Member $x1 file) (Theme $e0 $x1))

;; p201934  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p201934 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 intern) (Member $x1 missing) (Theme $e0 $x1))

;; p201935  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201935 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 gearbox) (Patient $e0 $x1))

;; p201936  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201936 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 seized) (Patient $e0 $x1))

;; p201937  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201937 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0) (Patient $e0 $x1))

;; p201941  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p201941 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 school) (Member $x1 projector) (Theme $e0 $x1))

;; p201945  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201945 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 gearbox) (Member $x1 seized) (Patient $e0 $x1))

;; p201946  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201946 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 gearbox) (Past $e0) (Patient $e0 $x1))

;; p201947  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201947 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 hotel) (Past $e0) (Patient $e0 $x1))

;; p201950  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p201950 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 seized) (Past $e0) (Patient $e0 $x1))

;; p201952  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p201952 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 view) (Past $e0) (Theme $e0 $x1))

;; p201953  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p201953 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 view) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p201954  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p201954 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 view) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p201956  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p201956 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p201957  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p201957 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p201958  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p201958 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Possession $x1 free_soil_party) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p201959  support 4 (occ 4)  size 4  root $x0 (entity)  depth 4
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p201959 $x0 $e0 $x1)
(And (Before $x0 $e0) (Inheritance dress_rehearsal rehearsal) (Member $x1 dress_rehearsal) (Patient $e0 $x1))

;; p201961  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p201961 $e0 $x0)
(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define))

;; p201962  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p201962 $e0 $x0 $x1)
(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Theme $e0 $x1))

;; p201963  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p201963 $e0 $x0 $x1)
(And (Can $e0) (GroupOf $x0 sequence) (Manner $e0 $x1) (Theme $e0 $x0))

;; p201964  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p201964 $e0 $x0)
(And (Can $e0) (GroupOf $x0 sequence) (Member $e0 define) (Theme $e0 $x0))

;; p201965  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p201965 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p201966  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p201966 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))

;; p201967  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (Mn_p201967 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0))

;; p201969  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p201969 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (GroupOf $x1 sequence) (Manner $e0 $x0) (Theme $e0 $x1))

;; p201971  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (Mn_p201971 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0))

;; p201972  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p201972 $e0 $x0)
(And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p201973  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p201973 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))

;; p201976  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p201976 $e0 $e1)
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Past $e0))

;; p201977  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p201977 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Theme $e0 $x0))

;; p201978  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p201978 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))

;; p201979  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p201979 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e1 portray) (Member $x0 emmy) (Theme $e0 $x0))

;; p201980  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p201980 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e1 portray) (Past $e0) (Theme $e0 $x0))

;; p201981  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p201981 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p201982  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p201982 $e0 $x0)
(And (Future $e0) (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p201990  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201990 $e0 $x0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Member $x0 hotel) (Patient $e0 $x0))

;; p201996  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201996 $e0 $x0)
(And (Location $e0 eskisehir) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))

;; p201997  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p201997 $e0 $x0)
(And (Location $e0 eskisehir) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p202007  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202007 $e0 $x0)
(And (Location $e0 turkey) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))

;; p202008  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202008 $e0 $x0)
(And (Location $e0 turkey) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p202026  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p202026 $e0 $x0)
(And (Member $x0 view) (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p202027  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p202027 $e0 $x0)
(And (Member $x0 view) (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p202763  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p202763 $e0 $x0)
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $x0 government))

;; p202768  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p202768 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Theme $e0 $x1))

;; p202769  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (Mn_p202769 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 sample) (Theme $e0 $x1))

;; p202770  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p202770 $e0 $x0)
(And (Agent $e0 $x0) (Inheritance rescue_team team) (Member $x0 rescue_team))

;; p202771  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   meta-node: (Mn_p202771 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 biologist))

;; p202772  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p202772 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver))

;; p202773  support 4 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   meta-node: (Mn_p202773 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 survey))

;; p202774  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202774 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company))

;; p202775  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202775 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company))

;; p202776  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202776 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company))

;; p202777  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000174 tierA-000178 tierC-000025
;;   meta-node: (Mn_p202777 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1))

;; p202779  support 4 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202779 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company))

;; p202781  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   meta-node: (Mn_p202781 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1))

;; p202782  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   meta-node: (Mn_p202782 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1))

;; p202783  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p202783 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 chef) (Past $e0))

;; p202784  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p202784 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 chef) (Theme $e0 $x1))

;; p202785  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000208 tierA-000209
;;   meta-node: (Mn_p202785 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 clerk) (Theme $e0 $x1))

;; p202786  support 4 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202786 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 company) (Past $e0))

;; p202787  support 4 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202787 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 company) (Patient $e0 $x1))

;; p202788  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p202788 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))

;; p202789  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   meta-node: (Mn_p202789 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 delegation) (Time $e0 (Weekday thursday)))

;; p202790  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p202790 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 diver) (Theme $e0 $x1))

;; p202791  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   meta-node: (Mn_p202791 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 editor) (Theme $e0 $x1))

;; p202792  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p202792 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 firm) (Theme $e0 $x1))

;; p202793  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p202793 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 government) (Theme $e0 $x1))

;; p202794  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p202794 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 intern) (Theme $e0 $x1))

;; p202795  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p202795 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0))

;; p202796  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p202796 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 mechanic) (Patient $e0 $x1))

;; p202797  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   meta-node: (Mn_p202797 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 panel) (Theme $e0 $x1))

;; p202798  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000071 tierC-000072 tierC-000089
;;   meta-node: (Mn_p202798 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))

;; p202799  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000213 tierA-000214
;;   meta-node: (Mn_p202799 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pilot) (Theme $e0 $x1))

;; p202800  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p202800 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 rescue_team) (Theme $e0 $x1))

;; p202801  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p202801 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))

;; p202802  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p202802 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))

;; p202803  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p202803 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 crate) (Theme $e0 $x1))

;; p202804  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   meta-node: (Mn_p202804 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 drill) (Theme $e0 $x1))

;; p202805  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p202805 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 file) (Theme $e0 $x1))

;; p202806  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p202806 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 gearbox) (Patient $e0 $x1))

;; p202807  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000302 tierA-000303
;;   meta-node: (Mn_p202807 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 generator) (Theme $e0 $x1))

;; p202808  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202808 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 hotel) (Patient $e0 $x1))

;; p202809  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (Mn_p202809 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 lane) (Theme $e0 $x1))

;; p202810  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   meta-node: (Mn_p202810 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 manifest) (Theme $e0 $x1))

;; p202811  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   meta-node: (Mn_p202811 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 manuscript) (Theme $e0 $x1))

;; p202812  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p202812 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 missing) (Theme $e0 $x1))

;; p202813  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (Mn_p202813 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 projector) (Theme $e0 $x1))

;; p202814  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   meta-node: (Mn_p202814 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 proposal) (Theme $e0 $x1))

;; p202815  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p202815 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 scan) (Theme $e0 $x1))

;; p202816  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p202816 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 search) (Theme $e0 $x1))

;; p202817  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p202817 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 seized) (Patient $e0 $x1))

;; p202818  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000292 tierA-000293
;;   meta-node: (Mn_p202818 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 song) (Theme $e0 $x1))

;; p202819  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p202819 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))

;; p202821  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p202821 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 tender) (Theme $e0 $x1))

;; p202822  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p202822 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 view) (Theme $e0 $x1))

;; p202823  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (Mn_p202823 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 vote) (Theme $e0 $x1))

;; p202824  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p202824 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1))

;; p202825  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p202825 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Ordinal $x1 <num> scan) (Theme $e0 $x1))

;; p202827  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p202827 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p202828  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p202828 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p202829  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p202829 $x0 $e0 $x1)
(And (Before $x0 $e0) (Member $x0 lunch) (Patient $e0 $x1))

;; p202830  support 4 (occ 4)  size 3  root $x0 (entity)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p202830 $x0 $e0 $x1)
(And (Before $x0 $e0) (Member $x1 dress_rehearsal) (Patient $e0 $x1))

;; p202831  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   meta-node: (Mn_p202831 $e0 $e1)
(And (But $e0 $e1) (Past $e0) (Past $e1))

;; p202832  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p202832 $e0 $x0)
(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0))

;; p202833  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p202833 $e0 $x0)
(And (Can $e0) (GroupOf $x0 sequence) (Theme $e0 $x0))

;; p202834  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p202834 $e0 $x0)
(And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p202835  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p202835 $e0 $x0)
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define))

;; p202836  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p202836 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Theme $e0 $x1))

;; p202837  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p202837 $e0 $x0)
(And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))

;; p202838  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p202838 $e0 $x0)
(And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))

;; p202839  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000004 tierA-000265 tierA-000280
;;   meta-node: (Mn_p202839 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p202840  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p202840 $e0 $e1 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Stimulus $e0 $e1))

;; p202841  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000013 tierC-000014 tierC-000121
;;   meta-node: (Mn_p202841 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 person) (Past $e0))

;; p202842  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p202842 $e0 $e1)
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray))

;; p202843  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p202843 $e0 $e1)
(And (For $e0 $e1) (Member $e1 portray) (Past $e0))

;; p202844  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p202844 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e1 portray) (Theme $e0 $x0))

;; p202845  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p202845 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))

;; p202846  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p202846 $e0 $x0)
(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p202847  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p202847 $e0 $x0)
(And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p202848  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p202848 $e0 $x0)
(And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))

;; p202849  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (Mn_p202849 $e0 $x0 $x1)
(And (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0))

;; p202850  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   meta-node: (Mn_p202850 $e0 $x0)
(And (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0))

;; p202851  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p202851 $e0 $x0 $x1)
(And (GroupOf $x0 sequence) (Manner $e0 $x1) (Theme $e0 $x0))

;; p202852  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p202852 $e0 $x0)
(And (GroupOf $x0 sequence) (Member $e0 define) (Theme $e0 $x0))

;; p202853  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   meta-node: (Mn_p202853 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $x0 permit) (Theme $e0 $x1))

;; p202854  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (Mn_p202854 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $x0 recipe) (Theme $e0 $x1))

;; p202855  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p202855 $e0 $x0)
(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p202856  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p202856 $e0 $x0)
(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p202857  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p202857 $e0)
(And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p202858  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p202858 $e0 $x0)
(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))

;; p202861  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p202861 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point))

;; p202863  support 4 (occ 4)  size 3  root $e1 (event)  depth 3
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p202863 $e1 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 ledger) (Stimulus $e1 $e0))

;; p202864  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p202864 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1))

;; p202866  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202866 $e0 $x0)
(And (Location $e0 eskisehir) (Member $x0 hotel) (Patient $e0 $x0))

;; p202869  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202869 $e0 $x0)
(And (Location $e0 turkey) (Member $x0 hotel) (Patient $e0 $x0))

;; p202870  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (Mn_p202870 $e0 $x0)
(And (Member $e0 block) (Member $x0 lane) (Theme $e0 $x0))

;; p202873  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202873 $e0 $x0)
(And (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))

;; p202876  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   meta-node: (Mn_p202876 $e1 $e0)
(And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0))

;; p202877  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   meta-node: (Mn_p202877 $e1 $e0)
(And (Member $e0 decision) (Member $e1 reach) (Theme $e1 $e0))

;; p202880  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p202880 $e0 $x0)
(And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))

;; p202883  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p202883 $e0 $x0)
(And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p202885  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p202885 $e0 $x0 $x1)
(And (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1))

;; p202886  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p202886 $e0 $x0)
(And (Member $x0 gearbox) (Past $e0) (Patient $e0 $x0))

;; p202887  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p202887 $e0 $x0)
(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)))

;; p202888  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p202888 $e0 $x0)
(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 morning))

;; p202889  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p202889 $e0 $x0)
(And (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p202890  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p202890 $e0 $x0)
(And (Member $x0 seized) (Past $e0) (Patient $e0 $x0))

;; p202891  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p202891 $e0 $x0)
(And (Member $x0 view) (Past $e0) (Theme $e0 $x0))

;; p202892  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000235 tierC-000236 tierC-000257
;;   meta-node: (Mn_p202892 $e0 $x0 $x1)
(And (Past $e0) (Possession $x0 $x1) (Theme $e0 $x0))

;; p202893  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p202893 $e0 $x0)
(And (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p202894  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p202894 $e0 $x0)
(And (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203144  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p203144 $e0)
(And (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing))

;; p203145  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p203145 $e0)
(And (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p203230  support 4 (occ 4)  size 1  root night_crew (constant)  depth 1
;;   e.g. tierA-000363 tierA-000364 tierA-000365
;;   meta-node: (Mn_p203230 night_crew)
(Inheritance night_crew crew)

;; p203231  support 4 (occ 4)  size 1  root night_delivery (constant)  depth 1
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (Mn_p203231 night_delivery)
(Inheritance night_delivery delivery)

;; p203232  support 4 (occ 4)  size 1  root regional_unit (constant)  depth 1
;;   e.g. tierC-000031 tierC-000032 tierC-000081
;;   meta-node: (Mn_p203232 regional_unit)
(Inheritance regional_unit regional)

;; p203233  support 4 (occ 4)  size 1  root regional_unit (constant)  depth 1
;;   e.g. tierC-000031 tierC-000032 tierC-000081
;;   meta-node: (Mn_p203233 regional_unit)
(Inheritance regional_unit unit)

;; p203234  support 4 (occ 4)  size 1  root soil_sample (constant)  depth 1
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (Mn_p203234 soil_sample)
(Inheritance soil_sample sample)

;; p203235  support 4 (occ 4)  size 1  root spoil_mound (constant)  depth 1
;;   e.g. tierA-000347 tierA-000348 tierA-000349
;;   meta-node: (Mn_p203235 spoil_mound)
(Inheritance spoil_mound mound)

;; p203258  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p203258 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Theme $e0 $x2))

;; p203259  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203259 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey) (Member $e0 build))

;; p203260  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203260 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey) (Past $e0))

;; p203261  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203261 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey) (Patient $e0 $x1))

;; p203262  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203262 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Past $e0))

;; p203263  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203263 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x1))

;; p203264  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203264 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x1))

;; p203265  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203265 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Past $e0))

;; p203266  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203266 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Patient $e0 $x1))

;; p203267  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203267 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Past $e0) (Patient $e0 $x1))

;; p203268  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203268 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Past $e0))

;; p203269  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203269 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x1))

;; p203270  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203270 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 turkey) (Past $e0) (Patient $e0 $x1))

;; p203274  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203274 $e0 $x0 $x1)
(And (Can $e0) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))

;; p203275  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203275 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))

;; p203276  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203276 $e0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Member $e0 build) (Past $e0))

;; p203277  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203277 $e0 $x0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x0))

;; p203278  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203278 $e0 $x0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Past $e0) (Patient $e0 $x0))

;; p203279  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203279 $e0 $x0)
(And (Location $e0 eskisehir) (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p203280  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203280 $e0 $x0)
(And (Location $e0 kazakhstan) (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p203281  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203281 $e0 $x0)
(And (Location $e0 turkey) (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p203283  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203283 $e0 $x0)
(And (Member $x0 view) (Possession $x0 free_soil_party) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203379  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p203379 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Agent $e0 jica) (Theme $e0 $x1))

;; p203382  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p203382 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover))

;; p203383  support 4 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000025 tierC-000026 tierC-000353
;;   meta-node: (Mn_p203383 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2))

;; p203384  support 4 (occ 6)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000025 tierC-000026 tierC-000041
;;   meta-node: (Mn_p203384 $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e1 $e0))

;; p203385  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203385 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey))

;; p203386  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203386 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build))

;; p203387  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203387 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0))

;; p203388  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203388 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Patient $e0 $x1))

;; p203389  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203389 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build))

;; p203390  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203390 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Past $e0))

;; p203391  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203391 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Patient $e0 $x1))

;; p203392  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203392 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build))

;; p203393  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203393 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey) (Past $e0))

;; p203394  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203394 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 turkey) (Patient $e0 $x1))

;; p203395  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   meta-node: (Mn_p203395 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))

;; p203396  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   meta-node: (Mn_p203396 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))

;; p203397  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (Mn_p203397 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 block) (Theme $e0 $x1))

;; p203398  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   meta-node: (Mn_p203398 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1))

;; p203399  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p203399 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 order) (Theme $e0 $x1))

;; p203400  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   meta-node: (Mn_p203400 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))

;; p203401  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   meta-node: (Mn_p203401 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))

;; p203402  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   meta-node: (Mn_p203402 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1))

;; p203403  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (Mn_p203403 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 sign) (Patient $e0 $x1))

;; p203404  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p203404 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 glazing))

;; p203407  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p203407 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 glazing))

;; p203408  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203408 $e0 $x0)
(And (Can $e0) (Manner $e0 $x0) (Member $e0 define))

;; p203409  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203409 $e0 $x0 $x1)
(And (Can $e0) (Manner $e0 $x0) (Theme $e0 $x1))

;; p203410  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203410 $e0 $x0)
(And (Can $e0) (Member $e0 define) (Theme $e0 $x0))

;; p203411  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203411 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))

;; p203413  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203413 $e0 $e1)
(And (For $e0 $e1) (Member $e0 win) (Past $e0))

;; p203414  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203414 $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))

;; p203415  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203415 $e0 $e1 $x0)
(And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))

;; p203416  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p203416 $e0 $x0)
(And (Future $e0) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p203417  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000153 tierC-000154 tierC-000271
;;   meta-node: (Mn_p203417 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))

;; p203418  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203418 $e0 $x0)
(And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p203419  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p203419 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))

;; p203420  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203420 $e0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Member $e0 build))

;; p203421  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203421 $e0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Past $e0))

;; p203422  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203422 $e0 $x0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Patient $e0 $x0))

;; p203423  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203423 $e0)
(And (Location $e0 eskisehir) (Member $e0 build) (Past $e0))

;; p203424  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203424 $e0 $x0)
(And (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x0))

;; p203425  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203425 $e0 $x0)
(And (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x0))

;; p203426  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203426 $e0)
(And (Location $e0 kazakhstan) (Member $e0 build) (Past $e0))

;; p203427  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203427 $e0 $x0)
(And (Location $e0 kazakhstan) (Member $e0 build) (Patient $e0 $x0))

;; p203428  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203428 $e0 $x0)
(And (Location $e0 kazakhstan) (Past $e0) (Patient $e0 $x0))

;; p203429  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203429 $e0)
(And (Location $e0 turkey) (Member $e0 build) (Past $e0))

;; p203430  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203430 $e0 $x0)
(And (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x0))

;; p203431  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203431 $e0 $x0)
(And (Location $e0 turkey) (Past $e0) (Patient $e0 $x0))

;; p203432  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203432 $e0 $x0 $x1)
(And (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))

;; p203433  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   meta-node: (Mn_p203433 $e0 $x0)
(And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))

;; p203434  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000241
;;   meta-node: (Mn_p203434 $e0 $e1)
(And (Member $e0 become) (Past $e0) (Result $e0 $e1))

;; p203435  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000183
;;   meta-node: (Mn_p203435 $e0 $x0)
(And (Member $e0 design) (Past $e0) (Patient $e0 $x0))

;; p203436  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000091 tierC-000092 tierC-000103
;;   meta-node: (Mn_p203436 $e0 $x0)
(And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))

;; p203437  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   meta-node: (Mn_p203437 $e0 $x0)
(And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))

;; p203438  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p203438 $e0 $x0)
(And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0))

;; p203439  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p203439 $e0 $x0)
(And (Member $e0 sell) (Past $e0) (Theme $e0 $x0))

;; p203440  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p203440 $e0 $x0 $x1)
(And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p203441  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p203441 $e0 $x0)
(And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 glazing))

;; p203442  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203442 $e0 $x0)
(And (Member $e0 win) (Past $e0) (Theme $e0 $x0))

;; p203443  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p203443 $e0 $x0)
(And (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0))

;; p203444  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p203444 $e0 $x0)
(And (Member $x0 gearbox) (Member $x0 seized) (Patient $e0 $x0))

;; p203445  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (Mn_p203445 $e0 $x0)
(And (Member $x0 new) (Member $x0 roof) (Theme $e0 $x0))

;; p203447  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p203447 $e0 $x0 $x1)
(And (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0))

;; p203448  support 4 (occ 4)  size 3  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203448 $x0)
(And (Member $x0 view) (Possession $x0 free_soil_party) (Possession $x0 republican_party))

;; p203449  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203449 $e0 $x0)
(And (Member $x0 view) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203450  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203450 $e0 $x0)
(And (Member $x0 view) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203451  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p203451 $e0 $x0 $x1)
(And (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p203452  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p203452 $e0 $x0)
(And (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning))

;; p203453  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203453 $e0 $x0)
(And (Possession $x0 free_soil_party) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203611  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p203611 $e0 $x0)
(And (Agent $e0 $x0) (Agent $e0 jica))

;; p203612  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000182 tierA-000184
;;   meta-node: (Mn_p203612 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 child))

;; p203613  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203613 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir))

;; p203614  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203614 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan))

;; p203615  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203615 $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey))

;; p203616  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   meta-node: (Mn_p203616 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 acquire))

;; p203617  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000075 tierA-000076 tierA-000078
;;   meta-node: (Mn_p203617 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 allow))

;; p203618  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (Mn_p203618 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 block))

;; p203619  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   meta-node: (Mn_p203619 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 make))

;; p203620  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p203620 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 order))

;; p203621  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   meta-node: (Mn_p203621 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 purchase))

;; p203622  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   meta-node: (Mn_p203622 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 reach))

;; p203623  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (Mn_p203623 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 sign))

;; p203624  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000127 tierC-000128 tierC-000329
;;   meta-node: (Mn_p203624 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 sing))

;; p203625  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   meta-node: (Mn_p203625 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 airline))

;; p203626  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   meta-node: (Mn_p203626 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 biologist))

;; p203627  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (Mn_p203627 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 chef))

;; p203628  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000208 tierA-000209
;;   meta-node: (Mn_p203628 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 clerk))

;; p203629  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (Mn_p203629 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 committee))

;; p203630  support 4 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203630 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 company))

;; p203631  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p203631 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 council))

;; p203632  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   meta-node: (Mn_p203632 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 delegation))

;; p203633  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p203633 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 diver))

;; p203634  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   meta-node: (Mn_p203634 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 editor))

;; p203635  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   meta-node: (Mn_p203635 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 fire))

;; p203636  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p203636 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 firm))

;; p203637  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   meta-node: (Mn_p203637 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 flood))

;; p203638  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p203638 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 government))

;; p203639  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p203639 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 intern))

;; p203640  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p203640 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 mechanic))

;; p203641  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   meta-node: (Mn_p203641 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 panel))

;; p203642  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000213 tierA-000214
;;   meta-node: (Mn_p203642 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 pilot))

;; p203643  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p203643 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 rescue_team))

;; p203644  support 4 (occ 6)  size 2  root $e1 (event)  depth 2
;;   e.g. tierC-000025 tierC-000026 tierC-000041
;;   meta-node: (Mn_p203644 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Theme $e1 $e0))

;; p203645  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   meta-node: (Mn_p203645 $e0 $x0)
(And (Agent $e0 $x0) (Time $e0 (Weekday thursday)))

;; p203646  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p203646 $e0 $x0)
(And (Agent $e0 jica) (Theme $e0 $x0))

;; p203647  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000109 tierC-000110 tierC-000333
;;   meta-node: (Mn_p203647 $e0 $e1 $x0)
(And (Before $e0 $e1) (Theme $e1 $x0))

;; p203648  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p203648 $x0 $e0)
(And (Before $x0 $e0) (Member $x0 lunch))

;; p203649  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p203649 $x0 $e0 $x1)
(And (Before $x0 $e0) (Patient $e0 $x1))

;; p203650  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   meta-node: (Mn_p203650 $e0 $e1)
(And (But $e0 $e1) (Past $e0))

;; p203651  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   meta-node: (Mn_p203651 $e0 $e1)
(And (But $e0 $e1) (Past $e1))

;; p203652  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203652 $e0 $x0)
(And (Can $e0) (Manner $e0 $x0))

;; p203653  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203653 $e0)
(And (Can $e0) (Member $e0 define))

;; p203654  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203654 $e0 $x0)
(And (Cardinality $x0 <num>) (Manner $e0 $x0))

;; p203655  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000003 tierC-000004 tierC-000343
;;   meta-node: (Mn_p203655 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 locate))

;; p203656  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000013 tierC-000014 tierC-000121
;;   meta-node: (Mn_p203656 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 person))

;; p203658  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p203658 $e0 $e1 $x0)
(And (Experiencer $e0 $x0) (Stimulus $e0 $e1))

;; p203659  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203659 $e0 $e1)
(And (For $e0 $e1) (Member $e0 win))

;; p203660  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203660 $e0 $e1)
(And (For $e0 $e1) (Member $e1 portray))

;; p203661  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203661 $e0 $e1 $x0)
(And (For $e0 $e1) (Theme $e0 $x0))

;; p203662  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (Mn_p203662 $e0)
(And (Future $e0) (Time $e0 (Month september)))

;; p203663  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203663 $e0 $x0)
(And (GroupOf $x0 child) (Theme $e0 $x0))

;; p203664  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (Mn_p203664 $e0 $x0)
(And (GroupOf $x0 sample) (Theme $e0 $x0))

;; p203665  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203665 $e0 $x0)
(And (GroupOf $x0 sequence) (Theme $e0 $x0))

;; p203666  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000153 tierC-000154 tierC-000271
;;   meta-node: (Mn_p203666 $e0 $x0)
(And (Holder $e0 $x0) (Member $e0 have))

;; p203667  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   meta-node: (Mn_p203667 $e0 $x0)
(And (Holder $e0 $x0) (Member $x0 permit))

;; p203668  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (Mn_p203668 $e0 $x0)
(And (Holder $e0 $x0) (Member $x0 recipe))

;; p203669  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203669 $e0)
(And (Holder $e0 kristoffer) (Member $e0 have))

;; p203670  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203670 $e0 $x0)
(And (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p203671  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (Mn_p203671 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 discover))

;; p203672  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p203672 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 error))

;; p203673  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000003 tierC-000004 tierC-000343
;;   meta-node: (Mn_p203673 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 locate))

;; p203674  support 4 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   meta-node: (Mn_p203674 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 survey))

;; p203675  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000137 tierA-000313 tierA-000322
;;   meta-node: (Mn_p203675 $e0 $x0)
(And (Location $e0 $x0) (Might $e0))

;; p203676  support 4 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000025 tierC-000026 tierC-000353
;;   meta-node: (Mn_p203676 $e0 $x0 $x1)
(And (Location $e0 $x0) (Patient $e0 $x1))

;; p203677  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p203677 $e1 $e0 $x0)
(And (Location $e0 $x0) (Stimulus $e1 $e0))

;; p203678  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203678 $e0)
(And (Location $e0 eskisehir) (Location $e0 turkey))

;; p203679  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203679 $e0)
(And (Location $e0 eskisehir) (Member $e0 build))

;; p203680  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203680 $e0)
(And (Location $e0 eskisehir) (Past $e0))

;; p203681  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203681 $e0 $x0)
(And (Location $e0 eskisehir) (Patient $e0 $x0))

;; p203682  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000111 tierC-000112 tierC-000121
;;   meta-node: (Mn_p203682 $e0)
(And (Location $e0 japan) (Past $e0))

;; p203683  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203683 $e0)
(And (Location $e0 kazakhstan) (Member $e0 build))

;; p203684  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203684 $e0)
(And (Location $e0 kazakhstan) (Past $e0))

;; p203685  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203685 $e0 $x0)
(And (Location $e0 kazakhstan) (Patient $e0 $x0))

;; p203686  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203686 $e0)
(And (Location $e0 turkey) (Member $e0 build))

;; p203687  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203687 $e0)
(And (Location $e0 turkey) (Past $e0))

;; p203688  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203688 $e0 $x0)
(And (Location $e0 turkey) (Patient $e0 $x0))

;; p203689  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203689 $e0 $x0)
(And (Manner $e0 $x0) (Member $e0 define))

;; p203690  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203690 $e0 $x0 $x1)
(And (Manner $e0 $x0) (Theme $e0 $x1))

;; p203691  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   meta-node: (Mn_p203691 $e0)
(And (Member $e0 acquire) (Past $e0))

;; p203692  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   meta-node: (Mn_p203692 $e0 $x0)
(And (Member $e0 acquire) (Theme $e0 $x0))

;; p203693  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000241
;;   meta-node: (Mn_p203693 $e0)
(And (Member $e0 become) (Past $e0))

;; p203694  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000241
;;   meta-node: (Mn_p203694 $e0 $e1)
(And (Member $e0 become) (Result $e0 $e1))

;; p203695  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (Mn_p203695 $e0 $x0)
(And (Member $e0 block) (Theme $e0 $x0))

;; p203696  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000054 tierA-000059 tierA-000064
;;   meta-node: (Mn_p203696 $e0 $x0)
(And (Member $e0 commence) (Patient $e0 $x0))

;; p203697  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   meta-node: (Mn_p203697 $e1 $e0)
(And (Member $e0 decision) (Patient $e1 $e0))

;; p203698  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   meta-node: (Mn_p203698 $e1 $e0)
(And (Member $e0 decision) (Theme $e1 $e0))

;; p203699  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203699 $e0 $x0)
(And (Member $e0 define) (Theme $e0 $x0))

;; p203700  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000183
;;   meta-node: (Mn_p203700 $e0)
(And (Member $e0 design) (Past $e0))

;; p203701  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000183
;;   meta-node: (Mn_p203701 $e0 $x0)
(And (Member $e0 design) (Patient $e0 $x0))

;; p203705  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   meta-node: (Mn_p203705 $e0 $e1)
(And (Member $e0 make) (Patient $e0 $e1))

;; p203706  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p203706 $e0 $x0)
(And (Member $e0 order) (Theme $e0 $x0))

;; p203708  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000091 tierC-000092 tierC-000103
;;   meta-node: (Mn_p203708 $e0)
(And (Member $e0 produce) (Past $e0))

;; p203709  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   meta-node: (Mn_p203709 $e0)
(And (Member $e0 purchase) (Past $e0))

;; p203710  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   meta-node: (Mn_p203710 $e0 $x0)
(And (Member $e0 purchase) (Theme $e0 $x0))

;; p203711  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   meta-node: (Mn_p203711 $e0 $e1)
(And (Member $e0 reach) (Theme $e0 $e1))

;; p203713  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p203713 $e0)
(And (Member $e0 sell) (Past $e0))

;; p203714  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p203714 $e0 $x0)
(And (Member $e0 sell) (Recipient $e0 $x0))

;; p203715  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p203715 $e0 $x0)
(And (Member $e0 sell) (Theme $e0 $x0))

;; p203716  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (Mn_p203716 $e0 $x0)
(And (Member $e0 sign) (Patient $e0 $x0))

;; p203717  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000053 tierA-000058 tierA-000063
;;   meta-node: (Mn_p203717 $e0 $x0)
(And (Member $e0 start) (Patient $e0 $x0))

;; p203718  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p203718 $e0)
(And (Member $e0 teach) (Theme $e0 glazing))

;; p203719  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203719 $e0)
(And (Member $e0 win) (Past $e0))

;; p203720  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203720 $e0 $x0)
(And (Member $e0 win) (Theme $e0 $x0))

;; p203721  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (Mn_p203721 $e0 $x0)
(And (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p203723  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   meta-node: (Mn_p203723 $x0 $x1)
(And (Member $x0 departure) (Possession $x0 $x1))

;; p203724  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p203724 $e0 $x0)
(And (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p203725  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   meta-node: (Mn_p203725 $e0 $x0)
(And (Member $x0 drill) (Theme $e0 $x0))

;; p203727  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203727 $e0 $x0)
(And (Member $x0 emmy) (Theme $e0 $x0))

;; p203728  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000017 tierC-000018 tierC-000121
;;   meta-node: (Mn_p203728 $x0 $x1)
(And (Member $x0 family) (Possession $x0 $x1))

;; p203729  support 4 (occ 4)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   meta-node: (Mn_p203729 $x1 $x0)
(And (Member $x0 ferry) (Possession $x1 $x0))

;; p203730  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p203730 $e0 $x0)
(And (Member $x0 file) (Theme $e0 $x0))

;; p203731  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p203731 $e0 $x0)
(And (Member $x0 gearbox) (Patient $e0 $x0))

;; p203732  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000302 tierA-000303
;;   meta-node: (Mn_p203732 $e0 $x0)
(And (Member $x0 generator) (Theme $e0 $x0))

;; p203733  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p203733 $e0 $x0)
(And (Member $x0 hearing) (Patient $e0 $x0))

;; p203734  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203734 $e0 $x0)
(And (Member $x0 hotel) (Patient $e0 $x0))

;; p203735  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000022 tierA-000026 tierA-000027
;;   meta-node: (Mn_p203735 $x0)
(And (Member $x0 kiln) (Ordinal $x0 <num> buy))

;; p203736  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000297 tierA-000298
;;   meta-node: (Mn_p203736 $e0 $x0)
(And (Member $x0 ladder) (Theme $e0 $x0))

;; p203737  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (Mn_p203737 $e0 $x0)
(And (Member $x0 lane) (Theme $e0 $x0))

;; p203738  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   meta-node: (Mn_p203738 $e0 $x0)
(And (Member $x0 manifest) (Theme $e0 $x0))

;; p203739  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   meta-node: (Mn_p203739 $e0 $x0)
(And (Member $x0 manuscript) (Theme $e0 $x0))

;; p203740  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (Mn_p203740 $e0 $x0)
(And (Member $x0 missing) (Theme $e0 $x0))

;; p203741  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (Mn_p203741 $x0)
(And (Member $x0 new) (Member $x0 roof))

;; p203742  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (Mn_p203742 $e0 $x0)
(And (Member $x0 new) (Theme $e0 $x0))

;; p203743  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000041 tierC-000042 tierC-000123
;;   meta-node: (Mn_p203743 $e0 $x0)
(And (Member $x0 person) (Theme $e0 $x0))

;; p203744  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   meta-node: (Mn_p203744 $e0 $x0)
(And (Member $x0 proposal) (Theme $e0 $x0))

;; p203745  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (Mn_p203745 $e0 $x0)
(And (Member $x0 roof) (Theme $e0 $x0))

;; p203746  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p203746 $e0 $x0)
(And (Member $x0 scan) (Theme $e0 $x0))

;; p203747  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (Mn_p203747 $e0 $x0)
(And (Member $x0 search) (Theme $e0 $x0))

;; p203748  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (Mn_p203748 $e0 $x0)
(And (Member $x0 seized) (Patient $e0 $x0))

;; p203749  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (Mn_p203749 $e0 $x0)
(And (Member $x0 summer_fair) (Patient $e0 $x0))

;; p203750  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (Mn_p203750 $e0 $x0)
(And (Member $x0 tender) (Theme $e0 $x0))

;; p203751  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203751 $x0)
(And (Member $x0 view) (Possession $x0 free_soil_party))

;; p203752  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203752 $x0)
(And (Member $x0 view) (Possession $x0 republican_party))

;; p203753  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203753 $e0 $x0)
(And (Member $x0 view) (Theme $e0 $x0))

;; p203754  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (Mn_p203754 $e0 $x0)
(And (Member $x0 vote) (Theme $e0 $x0))

;; p203755  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (Mn_p203755 $e0 $x0)
(And (Member $x0 wreck) (Theme $e0 $x0))

;; p203756  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p203756 $e0 $x0)
(And (Ordinal $x0 <num> scan) (Theme $e0 $x0))

;; p203757  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (Mn_p203757 $e0 $x0)
(And (Past $e0) (Recipient $e0 $x0))

;; p203758  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000241
;;   meta-node: (Mn_p203758 $e0 $e1)
(And (Past $e0) (Result $e0 $e1))

;; p203759  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p203759 $e0 $x0)
(And (Patient $e0 $x0) (Time $e0 (Weekday monday)))

;; p203760  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p203760 $e0 $x0)
(And (Patient $e0 $x0) (Time $e0 morning))

;; p203761  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203761 $x0)
(And (Possession $x0 free_soil_party) (Possession $x0 republican_party))

;; p203762  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203762 $e0 $x0)
(And (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203763  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203763 $e0 $x0)
(And (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203764  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p203764 $e0 $x0)
(And (Recipient $e0 $x0) (Theme $e0 glazing))

;; p203765  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p203765 $e0)
(And (Time $e0 (Weekday monday)) (Time $e0 morning))

;; p203860  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p203860 $e0)
(Agent $e0 jica)

;; p203861  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   meta-node: (Mn_p203861 $e0 $e1)
(But $e0 $e1)

;; p203862  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203862 $x0)
(GroupOf $x0 sequence)

;; p203863  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (Mn_p203863 $x0)
(GroupOf $x0 soil_sample)

;; p203865  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (Mn_p203865 $e0)
(Holder $e0 kristoffer)

;; p203866  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203866 $e0)
(Location $e0 eskisehir)

;; p203867  support 4 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000111 tierC-000112 tierC-000121
;;   meta-node: (Mn_p203867 $e0)
(Location $e0 japan)

;; p203868  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203868 $e0)
(Location $e0 kazakhstan)

;; p203869  support 4 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203869 $e0)
(Location $e0 turkey)

;; p203870  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203870 $e0 $x0)
(Manner $e0 $x0)

;; p203871  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   meta-node: (Mn_p203871 $e0)
(Member $e0 acquire)

;; p203873  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000075 tierA-000076 tierA-000078
;;   meta-node: (Mn_p203873 $e0)
(Member $e0 allow)

;; p203874  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (Mn_p203874 $e0)
(Member $e0 block)

;; p203875  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000054 tierA-000059 tierA-000064
;;   meta-node: (Mn_p203875 $e0)
(Member $e0 commence)

;; p203876  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p203876 $e0)
(Member $e0 define)

;; p203877  support 4 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000183
;;   meta-node: (Mn_p203877 $e0)
(Member $e0 design)

;; p203878  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p203878 $e0)
(Member $e0 error)

;; p203879  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000076 tierC-000095 tierC-000096
;;   meta-node: (Mn_p203879 $e0)
(Member $e0 follow)

;; p203882  support 4 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000139 tierC-000140 tierC-000189
;;   meta-node: (Mn_p203882 $e0)
(Member $e0 include)

;; p203883  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000258 tierC-000351
;;   meta-node: (Mn_p203883 $e0)
(Member $e0 influence)

;; p203884  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   meta-node: (Mn_p203884 $e0)
(Member $e0 make)

;; p203885  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000121 tierC-000122 tierC-000197
;;   meta-node: (Mn_p203885 $e0)
(Member $e0 move)

;; p203886  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p203886 $e0)
(Member $e0 order)

;; p203887  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000227 tierC-000228 tierC-000229
;;   meta-node: (Mn_p203887 $e0)
(Member $e0 play)

;; p203888  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   meta-node: (Mn_p203888 $e0)
(Member $e0 purchase)

;; p203889  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   meta-node: (Mn_p203889 $e0)
(Member $e0 reach)

;; p203890  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000099 tierC-000100 tierC-000359
;;   meta-node: (Mn_p203890 $e0)
(Member $e0 replace)

;; p203892  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (Mn_p203892 $e0)
(Member $e0 sign)

;; p203893  support 4 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000127 tierC-000128 tierC-000329
;;   meta-node: (Mn_p203893 $e0)
(Member $e0 sing)

;; p203895  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203895 $e0)
(Member $e0 win)

;; p203896  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p203896 $x0)
(Member $x0 auditor)

;; p203897  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   meta-node: (Mn_p203897 $x0)
(Member $x0 biologist)

;; p203900  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   meta-node: (Mn_p203900 $x0)
(Member $x0 coach)

;; p203901  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203901 $x0)
(Member $x0 company)

;; p203905  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   meta-node: (Mn_p203905 $x0)
(Member $x0 delegation)

;; p203906  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   meta-node: (Mn_p203906 $x0)
(Member $x0 departure)

;; p203908  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   meta-node: (Mn_p203908 $x0)
(Member $x0 drill)

;; p203909  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   meta-node: (Mn_p203909 $x0)
(Member $x0 driver)

;; p203910  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000291 tierA-000292 tierA-000293
;;   meta-node: (Mn_p203910 $x0)
(Member $x0 elder)

;; p203911  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000257 tierA-000258 tierA-000259
;;   meta-node: (Mn_p203911 $x0)
(Member $x0 elm)

;; p203912  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (Mn_p203912 $x0)
(Member $x0 emmy)

;; p203913  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   meta-node: (Mn_p203913 $x0)
(Member $x0 ferry)

;; p203914  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   meta-node: (Mn_p203914 $x0)
(Member $x0 foreman)

;; p203919  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p203919 $x0)
(Member $x0 government)

;; p203921  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p203921 $x0)
(Member $x0 hearing)

;; p203922  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (Mn_p203922 $x0)
(Member $x0 hotel)

;; p203923  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000296 tierA-000297 tierA-000298
;;   meta-node: (Mn_p203923 $x0)
(Member $x0 ladder)

;; p203924  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000257 tierA-000258 tierA-000259
;;   meta-node: (Mn_p203924 $x0)
(Member $x0 last)

;; p203927  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000363 tierA-000364 tierA-000365
;;   meta-node: (Mn_p203927 $x0)
(Member $x0 night_crew)

;; p203928  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000177 tierA-000178 tierA-000179
;;   meta-node: (Mn_p203928 $x0)
(Member $x0 nurse)

;; p203931  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   meta-node: (Mn_p203931 $x0)
(Member $x0 ranger)

;; p203932  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   meta-node: (Mn_p203932 $x0)
(Member $x0 recruit)

;; p203934  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000173 tierA-000174 tierA-000175
;;   meta-node: (Mn_p203934 $x0)
(Member $x0 ridge)

;; p203935  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (Mn_p203935 $x0)
(Member $x0 roof)

;; p203938  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000347 tierA-000348 tierA-000349
;;   meta-node: (Mn_p203938 $x0)
(Member $x0 spoil_mound)

;; p203939  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   meta-node: (Mn_p203939 $x0)
(Member $x0 survey)

;; p203942  support 4 (occ 6)  size 1  root $e0 (event)  depth 0
;;   e.g. tierC-000025 tierC-000026 tierC-000079
;;   meta-node: (Mn_p203942 $e0)
(Ongoing $e0)

;; p203943  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000022 tierA-000026 tierA-000027
;;   meta-node: (Mn_p203943 $x0)
(Ordinal $x0 <num> buy)

;; p203944  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203944 $x0)
(Possession $x0 free_soil_party)

;; p203945  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (Mn_p203945 $x0)
(Possession $x0 republican_party)

;; p203946  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000241
;;   meta-node: (Mn_p203946 $e0 $e1)
(Result $e0 $e1)

;; p203947  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p203947 $e0 $e1)
(Stimulus $e0 $e1)

;; p203948  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p203948 $e0)
(Theme $e0 monthly_servicing)

;; p203949  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p203949 $e0)
(Time $e0 (Weekday monday))

;; p203950  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   meta-node: (Mn_p203950 $e0)
(Time $e0 (Weekday thursday))

;; p203951  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000193 tierC-000194 tierC-000315
;;   meta-node: (Mn_p203951 $e0)
(Time $e0 later)

;; p203952  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (Mn_p203952 $e0)
(Time $e0 morning)

;; p203956  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p203956 $e0 $x0)
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund) (Member $x0 government))

;; p203968  support 3 (occ 3)  size 4  root $e1 (event)  depth 4
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p203968 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Member $x0 person))

;; p203969  support 3 (occ 4)  size 4  root $e1 (event)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p203969 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e0))

;; p203970  support 3 (occ 4)  size 4  root $e1 (event)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p203970 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e1))

;; p203971  support 3 (occ 3)  size 4  root appear (constant)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p203971 appear $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $x0 person) (Past $e0))

;; p203973  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p203973 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Member $x0 person))

;; p203974  support 3 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p203974 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Past $e0))

;; p203975  support 3 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p203975 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Past $e1))

;; p203976  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p203976 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school))

;; p203977  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p203977 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall))

;; p203978  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (Mn_p203978 $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 abandon))

;; p203979  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (Mn_p203979 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon) (Theme $e0 $x1))

;; p203981  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p203981 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x0 biologist))

;; p203982  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p203982 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x1 ranger))

;; p203983  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p203983 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x2 survey))

;; p203984  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p203984 $e0 $x0 $x1)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $x0 biologist) (Member $x1 ranger))

;; p203986  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (Mn_p203986 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon) (Theme $e0 $x1))

;; p203988  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p203988 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 child) (Member $e0 teach) (Recipient $e0 $x1))

;; p203989  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p203989 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 child) (Member $x0 elder) (Recipient $e0 $x1))

;; p203990  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p203990 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p203991  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p203991 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1))

;; p203994  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   meta-node: (Mn_p203994 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance evening_flight flight) (Member $x1 evening_flight) (Theme $e0 $x1))

;; p203995  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p203995 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance loan_application application) (Member $x1 loan_application) (Theme $e0 $x1))

;; p203997  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p203997 $e0 $x0)
(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio))

;; p203998  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (Mn_p203998 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x0 diver))

;; p203999  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   meta-node: (Mn_p203999 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x0 biologist))

;; p204001  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p204001 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator) (Member $x1 hall))

;; p204002  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p204002 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator) (Theme $e0 photography))

;; p204006  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (Mn_p204006 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm) (Theme $e0 $x1))

;; p204007  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (Mn_p204007 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 north_route) (Theme $e0 $x1))

;; p204009  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (Mn_p204009 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 tender) (Theme $e0 $x1))

;; p204011  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (Mn_p204011 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x1))

;; p204012  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (Mn_p204012 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot) (Theme $e0 $x1))

;; p204013  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (Mn_p204013 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 query) (Theme $e0 $x1))

;; p204014  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (Mn_p204014 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 tower) (Theme $e0 $x1))

;; p204018  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p204018 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 appear) (Member $x0 person) (Past $e0))

;; p204020  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p204020 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0))

;; p204021  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p204021 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1))

;; p204023  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204023 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0))

;; p204024  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204024 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1))

;; p204025  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p204025 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0))

;; p204026  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p204026 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Theme $e0 $x1))

;; p204028  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204028 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1))

;; p204031  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   meta-node: (Mn_p204031 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1))

;; p204032  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   meta-node: (Mn_p204032 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1))

;; p204033  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   meta-node: (Mn_p204033 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1))

;; p204034  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   meta-node: (Mn_p204034 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1))

;; p204035  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p204035 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 cause) (Member $e1 destroy) (Theme $e0 $e1))

;; p204036  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p204036 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cause) (Patient $e1 $x1) (Theme $e0 $e1))

;; p204037  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204037 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board) (Theme $e0 $x1))

;; p204038  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (Mn_p204038 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge) (Theme $e0 $x1))

;; p204039  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204039 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 budget) (Theme $e0 $x1))

;; p204040  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (Mn_p204040 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 case) (Theme $e0 $x1))

;; p204041  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204041 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Possession $x1 next_year) (Theme $e0 $x1))

;; p204042  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (Mn_p204042 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver) (Theme $e0 $x1))

;; p204043  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (Mn_p204043 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern) (Theme $e0 $x1))

;; p204044  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (Mn_p204044 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 file) (Theme $e0 $x1))

;; p204045  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (Mn_p204045 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 missing) (Theme $e0 $x1))

;; p204046  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (Mn_p204046 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1))

;; p204048  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204048 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Recipient $e0 $x1))

;; p204049  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204049 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Theme $e0 $x1))

;; p204050  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204050 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Recipient $e0 $x1))

;; p204051  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204051 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Theme $e0 $x1))

;; p204052  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p204052 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 answer) (Theme $e0 $x1))

;; p204053  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   meta-node: (Mn_p204053 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 manifest) (Theme $e0 $x1))

;; p204054  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204054 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 recruit) (Recipient $e0 $x1))

;; p204055  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204055 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 winner) (Recipient $e0 $x1))

;; p204056  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204056 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Recipient $e0 $x1))

;; p204057  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204057 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Theme $e0 $x1))

;; p204058  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p204058 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 ravi))

;; p204059  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p204059 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1))

;; p204060  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204060 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 gallery) (Recipient $e0 $x1))

;; p204061  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (Mn_p204061 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 generator) (Theme $e0 $x1))

;; p204062  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (Mn_p204062 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x1))

;; p204063  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p204063 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 order) (Member $x1 scan) (Theme $e0 $x1))

;; p204064  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p204064 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x1 <num> scan) (Theme $e0 $x1))

;; p204065  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   meta-node: (Mn_p204065 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club) (Theme $e0 $x1))

;; p204067  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (Mn_p204067 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x1))

;; p204069  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204069 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Recipient $e0 $x1))

;; p204070  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204070 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Theme $e0 $x1))

;; p204071  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204071 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x1))

;; p204072  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204072 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Theme $e0 glazing))

;; p204073  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204073 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 apprentice) (Recipient $e0 $x1))

;; p204074  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (Mn_p204074 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 drill) (Theme $e0 $x1))

;; p204075  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204075 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 song) (Theme $e0 $x1))

;; p204076  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (Mn_p204076 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x1))

;; p204077  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (Mn_p204077 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x1))

;; p204078  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p204078 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e1 destroy) (Patient $e1 $x1) (Theme $e0 $e1))

;; p204081  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204081 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 board) (Member $x1 budget) (Theme $e0 $x1))

;; p204082  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204082 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 board) (Possession $x1 next_year) (Theme $e0 $x1))

;; p204084  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204084 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 elder) (Member $x1 song) (Theme $e0 $x1))

;; p204085  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204085 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204087  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (Mn_p204087 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 ferry) (Member $x1 departure) (Theme $e0 $x1))

;; p204090  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204090 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 museum) (Member $x1 gallery) (Recipient $e0 $x1))

;; p204091  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204091 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204094  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000387 tierA-000388
;;   meta-node: (Mn_p204094 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 physician) (Member $x1 scan) (Theme $e0 $x1))

;; p204097  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204097 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 potter) (Member $x1 apprentice) (Recipient $e0 $x1))

;; p204098  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204098 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1) (Theme $e0 glazing))

;; p204099  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204099 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1))

;; p204100  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204100 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 school) (Member $x1 winner) (Recipient $e0 $x1))

;; p204101  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204101 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204102  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204102 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 trainer) (Member $x1 recruit) (Recipient $e0 $x1))

;; p204103  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204103 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204105  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p204105 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 answer) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204106  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204106 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1) (Theme $e0 glazing))

;; p204107  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204107 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 budget) (Possession $x1 next_year) (Theme $e0 $x1))

;; p204109  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (Mn_p204109 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 drill) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204110  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204110 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204111  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (Mn_p204111 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 generator) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204112  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204112 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1))

;; p204113  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   meta-node: (Mn_p204113 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 manifest) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204114  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204114 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204115  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204115 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 song) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204116  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204116 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204117  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204117 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1))

;; p204121  support 3 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p204121 $e1 $e0)
(And (Also appear $e0) (Member $e1 appear) (Past $e0) (Past $e1))

;; p204122  support 3 (occ 3)  size 4  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p204122 $x0 $e0 $x1)
(And (Before $x0 $e0) (Future $e0) (Member $x0 lunch) (Patient $e0 $x1))

;; p204123  support 3 (occ 3)  size 4  root $x0 (entity)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p204123 $x0 $e0 $x1)
(And (Before $x0 $e0) (Future $e0) (Member $x1 dress_rehearsal) (Patient $e0 $x1))

;; p204124  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p204124 $e0 $x0)
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Past $e0))

;; p204125  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p204125 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Theme $e0 $x1))

;; p204126  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204126 $e0 $x0)
(And (Can $e0) (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0))

;; p204127  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204127 $e0 $x0)
(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random))

;; p204128  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204128 $e0 $x0)
(And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))

;; p204129  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204129 $e0 $x0 $x1)
(And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))

;; p204130  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204130 $e0 $x0)
(And (Can $e0) (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))

;; p204131  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204131 $e0 $x0 $x1)
(And (Can $e0) (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))

;; p204132  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p204132 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))

;; p204133  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204133 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))

;; p204134  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204134 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))

;; p204135  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204135 $e0 $x0)
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))

;; p204136  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204136 $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))

;; p204139  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   meta-node: (Mn_p204139 $e0 $e1 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e0 discover) (Stimulus $e0 $e1))

;; p204140  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p204140 $e0 $e1 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e1 error) (Stimulus $e0 $e1))

;; p204141  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p204141 $e0 $e1 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x0 auditor) (Stimulus $e0 $e1))

;; p204143  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (Mn_p204143 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))

;; p204145  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p204145 $e0 $e1 $x0)
(And (Experiencer $e0 $x0) (Member $e1 error) (Member $x0 auditor) (Stimulus $e0 $e1))

;; p204148  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204148 $e0 $x0 $x1)
(And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204149  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204149 $e0 $x0 $x1)
(And (GroupOf $x0 child) (Member $x1 song) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204150  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (Mn_p204150 $e0 $x0 $x1)
(And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))

;; p204152  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204152 $e0 $x0 $x1)
(And (GroupOf $x0 sequence) (GroupOf $x1 way) (Manner $e0 $x1) (Theme $e0 $x0))

;; p204153  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204153 $e0 $x0 $x1)
(And (GroupOf $x0 sequence) (Manner $e0 $x1) (Member $x1 random) (Theme $e0 $x0))

;; p204155  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p204155 $e0 $x0)
(And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p204156  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p204156 $e0 $x0)
(And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Member $x0 lathe) (Theme $e0 monthly_servicing))

;; p204163  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (Mn_p204163 $e0 $x0)
(And (Inheritance north_route north) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))

;; p204171  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (Mn_p204171 $e0 $x0 $x1)
(And (Member $e0 abandon) (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1))

;; p204175  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204175 $e0 $x0)
(And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))

;; p204865  support 3 (occ 4)  size 3  root $e1 (event)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p204865 $e1 $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear))

;; p204866  support 3 (occ 3)  size 3  root appear (constant)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p204866 appear $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $x0 person))

;; p204867  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p204867 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear))

;; p204868  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (Mn_p204868 $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon))

;; p204869  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p204869 $e0 $x0 $x1)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $x0 biologist))

;; p204870  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p204870 $e0 $x0 $x1)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $x1 ranger))

;; p204871  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   meta-node: (Mn_p204871 $e0 $x0)
(And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation))

;; p204872  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (Mn_p204872 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon))

;; p204873  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (Mn_p204873 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample) (Inheritance soil_sample sample))

;; p204874  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (Mn_p204874 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample) (Instrument $e0 post))

;; p204875  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204875 $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1))

;; p204876  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (Mn_p204876 $e0 $x0)
(And (Agent $e0 $x0) (Inheritance night_delivery delivery) (Theme $e0 night_delivery))

;; p204877  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p204877 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator))

;; p204878  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   meta-node: (Mn_p204878 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 welder))

;; p204879  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   meta-node: (Mn_p204879 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 frame))

;; p204880  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p204880 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 hall))

;; p204881  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (Mn_p204881 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm))

;; p204883  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (Mn_p204883 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk))

;; p204884  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (Mn_p204884 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot))

;; p204886  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p204886 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 appear) (Member $x0 person))

;; p204887  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p204887 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 arrive) (Member $x0 freight))

;; p204888  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p204888 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot))

;; p204889  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204889 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio))

;; p204890  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p204890 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school))

;; p204892  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   meta-node: (Mn_p204892 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council))

;; p204893  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   meta-node: (Mn_p204893 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))

;; p204894  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204894 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board))

;; p204895  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (Mn_p204895 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge))

;; p204896  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (Mn_p204896 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver))

;; p204897  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (Mn_p204897 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern))

;; p204898  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p204898 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 fund) (Member $x0 government))

;; p204899  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204899 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school))

;; p204900  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204900 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer))

;; p204901  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204901 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum))

;; p204902  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p204902 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour))

;; p204903  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   meta-node: (Mn_p204903 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club))

;; p204904  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204904 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder))

;; p204905  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204905 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter))

;; p204906  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   meta-node: (Mn_p204906 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 work) (Member $x0 biologist))

;; p204907  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p204907 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e1 destroy) (Theme $e0 $e1))

;; p204908  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   meta-node: (Mn_p204908 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 airline) (Theme $e0 $x1))

;; p204909  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p204909 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 bank) (Theme $e0 $x1))

;; p204910  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p204910 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 curator) (Theme $e0 photography))

;; p204911  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204911 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1))

;; p204912  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204912 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 elder) (Theme $e0 $x1))

;; p204913  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (Mn_p204913 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 ferry) (Theme $e0 $x1))

;; p204914  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p204914 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 freight) (Time $e0 (Hour <num>)))

;; p204915  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (Mn_p204915 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 judge) (Theme $e0 $x1))

;; p204916  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (Mn_p204916 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 licence) (Theme $e0 night_delivery))

;; p204917  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204917 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1))

;; p204918  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204918 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 museum) (Theme $e0 $x1))

;; p204919  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p204919 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi))

;; p204920  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p204920 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 neighbour) (Theme $e0 $x1))

;; p204921  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204921 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1))

;; p204922  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204922 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 potter) (Theme $e0 glazing))

;; p204923  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204923 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1))

;; p204924  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204924 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1))

;; p204925  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204925 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 trainer) (Theme $e0 $x1))

;; p204926  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000217 tierA-000218 tierA-000219
;;   meta-node: (Mn_p204926 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 vet) (Theme $e0 $x1))

;; p204927  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p204927 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 warden) (Theme $e0 visitor))

;; p204928  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p204928 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 warden) (Time $e0 (Weekday sunday)))

;; p204929  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p204929 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 answer) (Theme $e0 $x1))

;; p204930  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p204930 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1))

;; p204931  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000399 tierA-000400 tierA-000401
;;   meta-node: (Mn_p204931 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 bridge) (Theme $e0 $x1))

;; p204932  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204932 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 budget) (Theme $e0 $x1))

;; p204933  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (Mn_p204933 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 case) (Theme $e0 $x1))

;; p204934  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (Mn_p204934 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 chart) (Patient $e0 $x1))

;; p204936  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (Mn_p204936 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 departure) (Theme $e0 $x1))

;; p204937  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   meta-node: (Mn_p204937 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 evening_flight) (Theme $e0 $x1))

;; p204938  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p204938 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1))

;; p204939  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p204939 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 loan_application) (Theme $e0 $x1))

;; p204940  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000277 tierA-000278
;;   meta-node: (Mn_p204940 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1))

;; p204941  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   meta-node: (Mn_p204941 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1))

;; p204942  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (Mn_p204942 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 query) (Theme $e0 $x1))

;; p204943  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p204943 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1))

;; p204944  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (Mn_p204944 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 tower) (Theme $e0 $x1))

;; p204945  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   meta-node: (Mn_p204945 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1))

;; p204946  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p204946 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1))

;; p204947  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p204947 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1))

;; p204948  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (Mn_p204948 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Patient $e0 $e1) (Theme $e1 $x1))

;; p204949  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p204949 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Possession $x1 next_year) (Theme $e0 $x1))

;; p204950  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (Mn_p204950 $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Theme $e0 $e1) (Theme $e1 $x1))

;; p204951  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   meta-node: (Mn_p204951 $e0 $x0)
(And (Agent $e0 dara) (Location $e0 $x0) (Member $x0 ledger))

;; p204953  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p204953 $e1 $e0)
(And (Also appear $e0) (Member $e1 appear) (Past $e0))

;; p204954  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p204954 $e1 $e0)
(And (Also appear $e0) (Member $e1 appear) (Past $e1))

;; p204955  support 3 (occ 3)  size 3  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p204955 $x0 $e0)
(And (Before $x0 $e0) (Future $e0) (Member $x0 lunch))

;; p204956  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p204956 $e0 $x0)
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall))

;; p204957  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204957 $e0 $x0)
(And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0))

;; p204958  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204958 $e0 $x0)
(And (Can $e0) (Manner $e0 $x0) (Member $x0 random))

;; p204959  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p204959 $e0 $x0 $x1)
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $x0 ranger))

;; p204960  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p204960 $e0 $x0 $x1)
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $x1 survey))

;; p204961  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p204961 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x1 gate))

;; p204963  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (Mn_p204963 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))

;; p204964  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p204964 $e0 $e1 $x0)
(And (Experiencer $e0 $x0) (Member $e1 error) (Stimulus $e0 $e1))

;; p204965  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p204965 $e0 $e1 $x0)
(And (Experiencer $e0 $x0) (Member $x0 auditor) (Stimulus $e0 $e1))

;; p204967  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (Mn_p204967 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))

;; p204969  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p204969 $e0 $x0)
(And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p204970  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204970 $e0 $x0)
(And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0))

;; p204971  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p204971 $e0 $x0 $x1)
(And (GroupOf $x0 child) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204972  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (Mn_p204972 $e0 $x0)
(And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))

;; p204973  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (Mn_p204973 $e0 $x0)
(And (GroupOf $x0 sample) (Member $e0 examine) (Theme $e0 $x0))

;; p204974  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204974 $e0 $x0)
(And (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))

;; p204975  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p204975 $e0 $x0 $x1)
(And (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))

;; p204976  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p204976 $e0 $x0)
(And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing))

;; p204977  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p204977 $e0 $x0)
(And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p204978  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000091 tierA-000092
;;   meta-node: (Mn_p204978 $e0 $x0)
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit))

;; p204979  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (Mn_p204979 $e0 $x0)
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe))

;; p204980  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p204980 $e0 $x0)
(And (Holder $e0 $x0) (Member $x0 lathe) (Theme $e0 monthly_servicing))

;; p204981  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   meta-node: (Mn_p204981 $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $x1 countersignature) (Theme $e0 $x1))

;; p204982  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   meta-node: (Mn_p204982 $e0 $x0)
(And (Inheritance evening_flight flight) (Member $x0 evening_flight) (Theme $e0 $x0))

;; p204984  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p204984 $e0 $x0)
(And (Inheritance loan_application application) (Member $x0 loan_application) (Theme $e0 $x0))

;; p204985  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   meta-node: (Mn_p204985 $e0)
(And (Inheritance monthly_servicing monthly) (Member $e0 require) (Theme $e0 monthly_servicing))

;; p204986  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   meta-node: (Mn_p204986 $e0)
(And (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing))

;; p204988  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p204988 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 wait) (Member $x0 gate))

;; p204990  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   meta-node: (Mn_p204990 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 work) (Member $x0 ledger))

;; p204991  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   meta-node: (Mn_p204991 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 work) (Member $x0 survey))

;; p204992  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   meta-node: (Mn_p204992 $e1 $e0 $x0)
(And (Location $e0 $x0) (Member $e1 discover) (Stimulus $e1 $e0))

;; p204993  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p204993 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 hall) (Theme $e0 photography))

;; p204994  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204994 $e0 $x0)
(And (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))

;; p204995  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p204995 $e0 $x0 $x1)
(And (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))

;; p204996  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (Mn_p204996 $e0 $x0)
(And (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))

;; p204997  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (Mn_p204997 $e0 $x0)
(And (Member $e0 abandon) (Member $x0 tender) (Theme $e0 $x0))

;; p204998  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (Mn_p204998 $e0 $x0 $x1)
(And (Member $e0 abandon) (Possession $x0 $x1) (Theme $e0 $x0))

;; p204999  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (Mn_p204999 $e0 $x0)
(And (Member $e0 answer) (Member $x0 query) (Theme $e0 $x0))

;; p205000  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (Mn_p205000 $e0 $x0)
(And (Member $e0 answer) (Member $x0 tower) (Theme $e0 $x0))

;; p205002  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p205002 $e0 $x0)
(And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0))

;; p205004  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   meta-node: (Mn_p205004 $e0 $x0)
(And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p205005  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   meta-node: (Mn_p205005 $e0 $x0)
(And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))

;; p205006  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p205006 $e0 $e1)
(And (Member $e0 cause) (Member $e1 destroy) (Theme $e0 $e1))

;; p205007  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p205007 $e0 $e1 $x0)
(And (Member $e0 cause) (Patient $e1 $x0) (Theme $e0 $e1))

;; p205008  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p205008 $e0 $x0)
(And (Member $e0 decide) (Member $x0 budget) (Theme $e0 $x0))

;; p205009  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (Mn_p205009 $e0 $x0)
(And (Member $e0 decide) (Member $x0 case) (Theme $e0 $x0))

;; p205010  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (Mn_p205010 $e0 $x0)
(And (Member $e0 decide) (Possession $x0 next_year) (Theme $e0 $x0))

;; p205014  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (Mn_p205014 $e0 $x0)
(And (Member $e0 discover) (Member $x0 file) (Theme $e0 $x0))

;; p205015  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (Mn_p205015 $e0 $x0)
(And (Member $e0 discover) (Member $x0 missing) (Theme $e0 $x0))

;; p205016  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (Mn_p205016 $e0 $x0)
(And (Member $e0 discover) (Member $x0 wreck) (Theme $e0 $x0))

;; p205017  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p205017 $e0 $x0)
(And (Member $e0 give) (Member $x0 answer) (Theme $e0 $x0))

;; p205018  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   meta-node: (Mn_p205018 $e0 $x0)
(And (Member $e0 give) (Member $x0 manifest) (Theme $e0 $x0))

;; p205019  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p205019 $e0 $x0)
(And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0))

;; p205020  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p205020 $e0 $x0)
(And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0))

;; p205021  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p205021 $e0 $x0)
(And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0))

;; p205022  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (Mn_p205022 $e0 $x0)
(And (Member $e0 lend) (Member $x0 generator) (Theme $e0 $x0))

;; p205024  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (Mn_p205024 $e0 $e1 $x0)
(And (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x0))

;; p205025  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p205025 $e0 $x0)
(And (Member $e0 order) (Member $x0 scan) (Theme $e0 $x0))

;; p205026  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (Mn_p205026 $e0 $x0)
(And (Member $e0 order) (Ordinal $x0 <num> scan) (Theme $e0 $x0))

;; p205027  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   meta-node: (Mn_p205027 $e0 $x0)
(And (Member $e0 postpone) (Member $x0 tournament) (Theme $e0 $x0))

;; p205028  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (Mn_p205028 $e0 $e1 $x0)
(And (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x0))

;; p205029  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (Mn_p205029 $e0 $x0)
(And (Member $e0 sign) (Member $x0 chart) (Patient $e0 $x0))

;; p205030  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p205030 $e0 $x0)
(And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0))

;; p205031  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (Mn_p205031 $e0 $x0)
(And (Member $e0 teach) (Member $x0 drill) (Theme $e0 $x0))

;; p205032  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p205032 $e0 $x0)
(And (Member $e0 teach) (Member $x0 song) (Theme $e0 $x0))

;; p205033  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p205033 $e0 $x0 $x1)
(And (Member $x0 answer) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205034  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p205034 $e0 $x0)
(And (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing))

;; p205035  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (Mn_p205035 $e0 $x0 $x1)
(And (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205036  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (Mn_p205036 $e0 $x0 $x1)
(And (Member $x0 ferry) (Possession $x1 $x0) (Theme $e0 $x1))

;; p205037  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p205037 $e0 $x0 $x1)
(And (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205038  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (Mn_p205038 $e0 $x0 $x1)
(And (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205039  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   meta-node: (Mn_p205039 $e0 $x0 $x1)
(And (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205040  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p205040 $e0 $x0 $x1)
(And (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205041  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p205041 $e0 $x0 $x1)
(And (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205042  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p205042 $e0 $x0 $x1)
(And (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205043  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p205043 $e0 $x0)
(And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))

;; p205269  support 3 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p205269 $e1 $e0)
(And (Also appear $e0) (Member $e1 appear))

;; p205270  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   meta-node: (Mn_p205270 $x0)
(And (Inheritance feed_pipe pipe) (Member $x0 feed_pipe))

;; p205271  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (Mn_p205271 $e0)
(And (Inheritance night_delivery delivery) (Theme $e0 night_delivery))

;; p205306  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p205306 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund) (Theme $e0 $x1))

;; p205308  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p205308 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Past $e0))

;; p205309  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p205309 $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Theme $e0 $x2))

;; p205312  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p205312 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x1))

;; p205358  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p205358 $e0 $x0)
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund))

;; p205360  support 3 (occ 4)  size 3  root appear (constant)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p205360 appear $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Past $e0))

;; p205361  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p205361 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy))

;; p205362  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000182 tierA-000184
;;   meta-node: (Mn_p205362 $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 child))

;; p205363  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   meta-node: (Mn_p205363 $e0 $x0 $x1)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $e0 work))

;; p205364  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000241
;;   meta-node: (Mn_p205364 $e0 $x0)
(And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive))

;; p205365  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   meta-node: (Mn_p205365 $e0 $x0)
(And (Agent $e0 $x0) (Future $e0) (Time $e0 (Weekday thursday)))

;; p205366  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000177 tierA-000180
;;   meta-node: (Mn_p205366 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 walk))

;; p205367  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p205367 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e0 photography))

;; p205368  support 3 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p205368 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 appear) (Past $e0))

;; p205369  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p205369 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 arrive) (Time $e0 (Hour <num>)))

;; p205370  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p205370 $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 cause) (Theme $e0 $e1))

;; p205371  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   meta-node: (Mn_p205371 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 decide) (Might $e0))

;; p205372  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (Mn_p205372 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 examine) (Theme $e0 $x1))

;; p205373  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p205373 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 fund) (Theme $e0 $x1))

;; p205374  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   meta-node: (Mn_p205374 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give_up) (Theme $e0 $x1))

;; p205376  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   meta-node: (Mn_p205376 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1))

;; p205377  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p205377 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi))

;; p205378  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   meta-node: (Mn_p205378 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 put_off) (Theme $e0 $x1))

;; p205379  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p205379 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1))

;; p205380  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p205380 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 receive) (Theme $e0 $x1))

;; p205381  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   meta-node: (Mn_p205381 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 turn_down) (Theme $e0 $x1))

;; p205383  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p205383 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Recipient $e0 ravi) (Theme $e0 $x1))

;; p205384  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p205384 $e0 $x0)
(And (Agent $e0 $x0) (Theme $e0 visitor) (Time $e0 (Weekday sunday)))

;; p205385  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   meta-node: (Mn_p205385 $e0 $x0)
(And (Agent $e0 dara) (Location $e0 $x0) (Member $e0 work))

;; p205386  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p205386 $e0 $x0)
(And (Agent $e0 jica) (Member $e0 fund) (Theme $e0 $x0))

;; p205387  support 3 (occ 3)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p205387 $x0 $e0 $x1)
(And (Before $x0 $e0) (Future $e0) (Patient $e0 $x1))

;; p205388  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p205388 $e0 $x0)
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0))

;; p205389  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p205389 $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))

;; p205390  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p205390 $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0))

;; p205391  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p205391 $e0 $x0)
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random))

;; p205392  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   meta-node: (Mn_p205392 $e0 $x0 $x1)
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $e0 work))

;; p205393  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p205393 $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait))

;; p205394  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   meta-node: (Mn_p205394 $e0 $e1 $x0)
(And (Experiencer $e0 $x0) (Member $e0 discover) (Stimulus $e0 $e1))

;; p205395  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p205395 $e1 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 error) (Stimulus $e1 $e0))

;; p205396  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000279 tierC-000280 tierC-000314
;;   meta-node: (Mn_p205396 $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $e0 find) (Theme $e0 $x1))

;; p205397  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000313 tierA-000322 tierA-000325
;;   meta-node: (Mn_p205397 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 work) (Might $e0))

;; p205398  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   meta-node: (Mn_p205398 $e0 $x0)
(And (Measure $x0 age <num> year) (Member $x0 founder) (Patient $e0 $x0))

;; p205399  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (Mn_p205399 $e0 $x0)
(And (Member $e0 become) (Past $e0) (Patient $e0 $x0))

;; p205400  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (Mn_p205400 $e0 $e1 $x0)
(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))

;; p205401  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000055 tierA-000066 tierA-000070
;;   meta-node: (Mn_p205401 $e0 $x0)
(And (Member $e0 begin) (Might $e0) (Patient $e0 $x0))

;; p205402  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   meta-node: (Mn_p205402 $e0 $x0 $x1)
(And (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1))

;; p205403  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   meta-node: (Mn_p205403 $e0 $x0)
(And (Member $e0 decide) (Might $e0) (Theme $e0 $x0))

;; p205404  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (Mn_p205404 $e1 $e0 $x0)
(And (Member $e0 decision) (Patient $e1 $e0) (Theme $e0 $x0))

;; p205405  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (Mn_p205405 $e1 $e0 $x0)
(And (Member $e0 decision) (Theme $e0 $x0) (Theme $e1 $e0))

;; p205406  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p205406 $e1 $e0 $x0)
(And (Member $e0 destroy) (Patient $e0 $x0) (Theme $e1 $e0))

;; p205407  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000091 tierC-000297 tierC-000298
;;   meta-node: (Mn_p205407 $e0 $x0)
(And (Member $e0 direct) (Past $e0) (Patient $e0 $x0))

;; p205408  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p205408 $e0 $x0)
(And (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x0))

;; p205409  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p205409 $e0 $x0 $x1)
(And (Member $e0 receive) (Source $e0 $x0) (Theme $e0 $x1))

;; p205410  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (Mn_p205410 $e0 $x0 $x1)
(And (Member $x0 departure) (Possession $x0 $x1) (Theme $e0 $x0))

;; p205411  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p205411 $e0 $x0)
(And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0))

;; p205412  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (Mn_p205412 $e0 $e1 $x0)
(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p205522  support 3 (occ 4)  size 2  root appear (constant)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p205522 appear $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0))

;; p205523  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (Mn_p205523 $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample))

;; p205524  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (Mn_p205524 $e0 $x0)
(And (Agent $e0 $x0) (Instrument $e0 post))

;; p205525  support 3 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (Mn_p205525 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 appear))

;; p205526  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000144 tierA-000149 tierA-000154
;;   meta-node: (Mn_p205526 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 call_off))

;; p205527  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p205527 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 cause))

;; p205528  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (Mn_p205528 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 examine))

;; p205529  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p205529 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 fund))

;; p205530  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   meta-node: (Mn_p205530 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 give_up))

;; p205531  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000351 tierC-000352
;;   meta-node: (Mn_p205531 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 influence))

;; p205532  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   meta-node: (Mn_p205532 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 learn))

;; p205533  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000077 tierA-000081
;;   meta-node: (Mn_p205533 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 permit))

;; p205534  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   meta-node: (Mn_p205534 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 put_off))

;; p205535  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p205535 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 receive))

;; p205536  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   meta-node: (Mn_p205536 $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 turn_down))

;; p205537  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p205537 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 bank))

;; p205538  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000049 tierA-000302 tierA-000304
;;   meta-node: (Mn_p205538 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 crew))

;; p205539  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p205539 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 curator))

;; p205540  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000376 tierA-000381 tierA-000386
;;   meta-node: (Mn_p205540 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 doctor))

;; p205541  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p205541 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 elder))

;; p205542  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (Mn_p205542 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 ferry))

;; p205543  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p205543 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 freight))

;; p205544  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (Mn_p205544 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 licence))

;; p205545  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p205545 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 museum))

;; p205546  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p205546 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 neighbour))

;; p205547  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p205547 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 potter))

;; p205548  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000173 tierA-000174 tierA-000175
;;   meta-node: (Mn_p205548 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 shepherd))

;; p205549  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (Mn_p205549 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 storm))

;; p205550  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p205550 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 trainer))

;; p205551  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000217 tierA-000218 tierA-000219
;;   meta-node: (Mn_p205551 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 vet))

;; p205552  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p205552 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 warden))

;; p205553  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   meta-node: (Mn_p205553 $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 welder))

;; p205554  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p205554 $e0 $x0)
(And (Agent $e0 $x0) (Recipient $e0 ravi))

;; p205555  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (Mn_p205555 $e0 $x0)
(And (Agent $e0 $x0) (Theme $e0 night_delivery))

;; p205556  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p205556 $e0 $x0)
(And (Agent $e0 $x0) (Theme $e0 photography))

;; p205557  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p205557 $e0 $x0)
(And (Agent $e0 $x0) (Theme $e0 visitor))

;; p205558  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p205558 $e0 $x0)
(And (Agent $e0 $x0) (Time $e0 (Hour <num>)))

;; p205559  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p205559 $e0 $x0)
(And (Agent $e0 $x0) (Time $e0 (Weekday sunday)))

;; p205561  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   meta-node: (Mn_p205561 $e0 $x0)
(And (Agent $e0 dara) (Location $e0 $x0))

;; p205562  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   meta-node: (Mn_p205562 $e0)
(And (Agent $e0 dara) (Member $e0 work))

;; p205563  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p205563 $e0)
(And (Agent $e0 jica) (Member $e0 fund))

;; p205564  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000333 tierC-000334
;;   meta-node: (Mn_p205564 $e0 $e1 $x0)
(And (Before $e0 $e1) (Patient $e0 $x0))

;; p205565  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (Mn_p205565 $x0 $e0)
(And (Before $x0 $e0) (Future $e0))

;; p205566  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (Mn_p205566 $e0 $x0)
(And (Beneficiary $e0 $x0) (Member $e0 buy))

;; p205567  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p205567 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 way))

;; p205568  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p205568 $x0)
(And (Cardinality $x0 <num>) (Member $x0 random))

;; p205569  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   meta-node: (Mn_p205569 $e0 $x0)
(And (CoAgent $e0 $x0) (Member $e0 work))

;; p205570  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (Mn_p205570 $e0 $x0)
(And (CoAgent $e0 $x0) (Member $x0 ranger))

;; p205572  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   meta-node: (Mn_p205572 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 discover))

;; p205573  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p205573 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e0 wait))

;; p205574  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p205574 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 auditor))

;; p205575  support 3 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (Mn_p205575 $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Result $e1 $e0))

;; p205576  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000241
;;   meta-node: (Mn_p205576 $e0)
(And (Future $e0) (Member $e0 arrive))

;; p205577  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   meta-node: (Mn_p205577 $e0)
(And (Future $e0) (Time $e0 (Weekday thursday)))

;; p205579  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000182 tierA-000184
;;   meta-node: (Mn_p205579 $e0 $x0)
(And (Goal $e0 $x0) (Member $x0 pier))

;; p205580  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (Mn_p205580 $e0 $x0)
(And (GroupOf $x0 child) (Recipient $e0 $x0))

;; p205581  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p205581 $e0 $x0)
(And (GroupOf $x0 way) (Manner $e0 $x0))

;; p205582  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000090 tierA-000095
;;   meta-node: (Mn_p205582 $e0 $x0)
(And (Holder $e0 $x0) (Member $e0 need))

;; p205583  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p205583 $e0 $x0)
(And (Holder $e0 $x0) (Member $x0 lathe))

;; p205584  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (Mn_p205584 $e0 $x0)
(And (Holder $e0 $x0) (Theme $e0 monthly_servicing))

;; p205585  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p205585 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 wait))

;; p205586  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   meta-node: (Mn_p205586 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 frame))

;; p205587  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p205587 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 gate))

;; p205588  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p205588 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 hall))

;; p205589  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000173 tierA-000174 tierA-000175
;;   meta-node: (Mn_p205589 $e0 $x0)
(And (Location $e0 $x0) (Member $x0 ridge))

;; p205590  support 3 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000025 tierC-000026 tierC-000280
;;   meta-node: (Mn_p205590 $e0 $x0)
(And (Location $e0 $x0) (Ongoing $e0))

;; p205591  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p205591 $e0 $x0)
(And (Location $e0 $x0) (Theme $e0 photography))

;; p205592  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p205592 $e0 $x0)
(And (Manner $e0 $x0) (Member $x0 random))

;; p205593  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   meta-node: (Mn_p205593 $x0)
(And (Measure $x0 age <num> year) (Member $x0 founder))

;; p205594  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   meta-node: (Mn_p205594 $e0 $x0)
(And (Measure $x0 age <num> year) (Patient $e0 $x0))

;; p205595  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p205595 $e0)
(And (Member $e0 arrive) (Time $e0 (Hour <num>)))

;; p205597  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000055 tierA-000066 tierA-000070
;;   meta-node: (Mn_p205597 $e0)
(And (Member $e0 begin) (Might $e0))

;; p205598  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   meta-node: (Mn_p205598 $e0 $x0)
(And (Member $e0 borrow) (Source $e0 $x0))

;; p205599  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p205599 $e0 $e1)
(And (Member $e0 cause) (Theme $e0 $e1))

;; p205601  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   meta-node: (Mn_p205601 $e0)
(And (Member $e0 decide) (Might $e0))

;; p205602  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p205602 $e1 $e0)
(And (Member $e0 destroy) (Theme $e1 $e0))

;; p205603  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000091 tierC-000297 tierC-000298
;;   meta-node: (Mn_p205603 $e0)
(And (Member $e0 direct) (Past $e0))

;; p205604  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   meta-node: (Mn_p205604 $e0 $e1)
(And (Member $e0 discover) (Stimulus $e0 $e1))

;; p205605  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000056 tierA-000060 tierA-000071
;;   meta-node: (Mn_p205605 $e0 $x0)
(And (Member $e0 end) (Patient $e0 $x0))

;; p205606  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (Mn_p205606 $e1 $e0)
(And (Member $e0 error) (Stimulus $e1 $e0))

;; p205607  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (Mn_p205607 $e0 $x0)
(And (Member $e0 examine) (Theme $e0 $x0))

;; p205608  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000163 tierC-000179 tierC-000180
;;   meta-node: (Mn_p205608 $e0 $x0)
(And (Member $e0 form) (Patient $e0 $x0))

;; p205609  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p205609 $e0 $x0)
(And (Member $e0 fund) (Theme $e0 $x0))

;; p205610  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   meta-node: (Mn_p205610 $e0 $x0)
(And (Member $e0 give_up) (Theme $e0 $x0))

;; p205611  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   meta-node: (Mn_p205611 $e0 $x0)
(And (Member $e0 learn) (Source $e0 $x0))

;; p205612  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p205612 $e0)
(And (Member $e0 lend) (Recipient $e0 ravi))

;; p205613  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   meta-node: (Mn_p205613 $e0 $x0)
(And (Member $e0 put_off) (Theme $e0 $x0))

;; p205614  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (Mn_p205614 $e0 $x0)
(And (Member $e0 receive) (Source $e0 $x0))

;; p205615  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   meta-node: (Mn_p205615 $e0)
(And (Member $e0 require) (Theme $e0 monthly_servicing))

;; p205616  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000023 tierC-000024 tierC-000094
;;   meta-node: (Mn_p205616 $e0)
(And (Member $e0 speak) (Past $e0))

;; p205617  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000075 tierC-000100 tierC-000338
;;   meta-node: (Mn_p205617 $e0)
(And (Member $e0 succeed) (Past $e0))

;; p205618  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   meta-node: (Mn_p205618 $e0 $x0)
(And (Member $e0 turn_down) (Theme $e0 $x0))

;; p205619  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000313 tierA-000322 tierA-000325
;;   meta-node: (Mn_p205619 $e0)
(And (Member $e0 work) (Might $e0))

;; p205620  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p205620 $e0 $x0)
(And (Member $x0 answer) (Theme $e0 $x0))

;; p205621  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (Mn_p205621 $e0 $x0)
(And (Member $x0 apprentice) (Recipient $e0 $x0))

;; p205622  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   meta-node: (Mn_p205622 $e0 $x0)
(And (Member $x0 archive) (Patient $e0 $x0))

;; p205623  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000399 tierA-000400 tierA-000401
;;   meta-node: (Mn_p205623 $e0 $x0)
(And (Member $x0 bridge) (Theme $e0 $x0))

;; p205624  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (Mn_p205624 $e0 $x0)
(And (Member $x0 chart) (Patient $e0 $x0))

;; p205625  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   meta-node: (Mn_p205625 $e0 $x0)
(And (Member $x0 countersignature) (Theme $e0 $x0))

;; p205626  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   meta-node: (Mn_p205626 $x0)
(And (Member $x0 cracked) (Member $x0 feed_pipe))

;; p205627  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (Mn_p205627 $e0 $x0)
(And (Member $x0 departure) (Theme $e0 $x0))

;; p205628  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   meta-node: (Mn_p205628 $e0 $x0)
(And (Member $x0 evening_flight) (Theme $e0 $x0))

;; p205630  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   meta-node: (Mn_p205630 $e0 $x0)
(And (Member $x0 footbridge) (Patient $e0 $x0))

;; p205631  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   meta-node: (Mn_p205631 $e0 $x0)
(And (Member $x0 founder) (Patient $e0 $x0))

;; p205632  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (Mn_p205632 $e0 $x0)
(And (Member $x0 gallery) (Recipient $e0 $x0))

;; p205633  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (Mn_p205633 $e0 $x0)
(And (Member $x0 greenhouse) (Patient $e0 $x0))

;; p205634  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (Mn_p205634 $e0 $x0)
(And (Member $x0 loan_application) (Theme $e0 $x0))

;; p205635  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000277 tierA-000278
;;   meta-node: (Mn_p205635 $e0 $x0)
(And (Member $x0 medal) (Theme $e0 $x0))

;; p205636  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   meta-node: (Mn_p205636 $e0 $x0)
(And (Member $x0 painting) (Theme $e0 $x0))

;; p205637  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (Mn_p205637 $e0 $x0)
(And (Member $x0 query) (Theme $e0 $x0))

;; p205638  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (Mn_p205638 $e0 $x0)
(And (Member $x0 recruit) (Recipient $e0 $x0))

;; p205639  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (Mn_p205639 $e0 $x0)
(And (Member $x0 tower) (Theme $e0 $x0))

;; p205640  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   meta-node: (Mn_p205640 $e0 $x0)
(And (Member $x0 whistle) (Theme $e0 $x0))

;; p205641  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (Mn_p205641 $e0 $x0)
(And (Member $x0 winner) (Recipient $e0 $x0))

;; p205642  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (Mn_p205642 $e0 $x0)
(And (Ordinal $x0 <num> buy) (Theme $e0 $x0))

;; p205643  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000193 tierC-000194 tierC-000316
;;   meta-node: (Mn_p205643 $e0)
(And (Past $e0) (Time $e0 later))

;; p205644  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (Mn_p205644 $e0 $e1 $x0)
(And (Patient $e0 $e1) (Theme $e1 $x0))

;; p205645  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (Mn_p205645 $e0 $e1 $x0)
(And (Patient $e0 $x0) (Result $e0 $e1))

;; p205646  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p205646 $e0 $x0)
(And (Recipient $e0 ravi) (Theme $e0 $x0))

;; p205647  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (Mn_p205647 $e0 $e1 $x0)
(And (Theme $e0 $e1) (Theme $e1 $x0))

;; p205648  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p205648 $e0)
(And (Theme $e0 visitor) (Time $e0 (Weekday sunday)))

;; p205741  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000311 tierA-000312 tierA-000313
;;   meta-node: (Mn_p205741 $e0)
(Agent $e0 ana)

;; p205742  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   meta-node: (Mn_p205742 $e0)
(Agent $e0 dara)

;; p205743  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000340 tierA-000344 tierA-000348
;;   meta-node: (Mn_p205743 $x0)
(Degree $x0 big very)

;; p205744  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (Mn_p205744 $x0)
(GroupOf $x0 way)

;; p205745  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (Mn_p205745 $e0)
(Instrument $e0 post)

;; p205746  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   meta-node: (Mn_p205746 $x0)
(Measure $x0 age <num> year)

;; p205748  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000199 tierC-000200 tierC-000358
;;   meta-node: (Mn_p205748 $e0)
(Member $e0 bear)

;; p205749  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000144 tierA-000149 tierA-000154
;;   meta-node: (Mn_p205749 $e0)
(Member $e0 call_off)

;; p205750  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (Mn_p205750 $e0)
(Member $e0 cause)

;; p205751  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000284 tierC-000341 tierC-000342
;;   meta-node: (Mn_p205751 $e0)
(Member $e0 conduct)

;; p205752  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000056 tierA-000060 tierA-000071
;;   meta-node: (Mn_p205752 $e0)
(Member $e0 end)

;; p205753  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (Mn_p205753 $e0)
(Member $e0 examine)

;; p205755  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (Mn_p205755 $e0)
(Member $e0 fund)

;; p205756  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   meta-node: (Mn_p205756 $e0)
(Member $e0 learn)

;; p205757  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000090 tierA-000095
;;   meta-node: (Mn_p205757 $e0)
(Member $e0 need)

;; p205758  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000077 tierA-000081
;;   meta-node: (Mn_p205758 $e0)
(Member $e0 permit)

;; p205759  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   meta-node: (Mn_p205759 $e0)
(Member $e0 put_off)

;; p205760  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000023 tierC-000024 tierC-000094
;;   meta-node: (Mn_p205760 $e0)
(Member $e0 speak)

;; p205761  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000075 tierC-000100 tierC-000338
;;   meta-node: (Mn_p205761 $e0)
(Member $e0 succeed)

;; p205762  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   meta-node: (Mn_p205762 $e0)
(Member $e0 turn_down)

;; p205763  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (Mn_p205763 $e0)
(Member $e0 wait)

;; p205764  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (Mn_p205764 $x0)
(Member $x0 answer)

;; p205766  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   meta-node: (Mn_p205766 $x0)
(Member $x0 cracked)

;; p205767  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000351 tierA-000355 tierA-000359
;;   meta-node: (Mn_p205767 $x0)
(Member $x0 difficult)

;; p205768  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000376 tierA-000381 tierA-000386
;;   meta-node: (Mn_p205768 $x0)
(Member $x0 doctor)

;; p205769  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   meta-node: (Mn_p205769 $x0)
(Member $x0 feed_pipe)

;; p205770  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   meta-node: (Mn_p205770 $x0)
(Member $x0 fitter)

;; p205771  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000352 tierA-000356 tierA-000360
;;   meta-node: (Mn_p205771 $x0)
(Member $x0 hard)

;; p205772  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000095 tierC-000096 tierC-000115
;;   meta-node: (Mn_p205772 $x0)
(Member $x0 house)

;; p205773  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000339 tierA-000343 tierA-000347
;;   meta-node: (Mn_p205773 $x0)
(Member $x0 huge)

;; p205774  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000276 tierA-000277 tierA-000278
;;   meta-node: (Mn_p205774 $x0)
(Member $x0 medal)

;; p205776  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (Mn_p205776 $x0)
(Member $x0 random)

;; p205777  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p205777 $x0)
(Member $x0 warden)

;; p205778  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   meta-node: (Mn_p205778 $x0)
(Member $x0 welder)

;; p205779  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierC-000143 tierC-000144 tierC-000279
;;   meta-node: (Mn_p205779 $x0)
(Member $x0 western)

;; p205780  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   meta-node: (Mn_p205780 $x0)
(Member $x0 whistle)

;; p205781  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (Mn_p205781 $e0)
(Recipient $e0 ravi)

;; p205782  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierC-000203 tierC-000204 tierC-000348
;;   meta-node: (Mn_p205782 $e0)
(Source $e0 manila)

;; p205784  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (Mn_p205784 $e0)
(Theme $e0 night_delivery)

;; p205785  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (Mn_p205785 $e0)
(Theme $e0 photography)

;; p205786  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p205786 $e0)
(Theme $e0 visitor)

;; p205787  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (Mn_p205787 $e0)
(Time $e0 (Hour <num>))

;; p205788  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (Mn_p205788 $e0)
(Time $e0 (Weekday sunday))

;; p205789  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000257 tierA-000258 tierA-000260
;;   meta-node: (Mn_p205789 $e0)
(Time $e0 that_autumn)
