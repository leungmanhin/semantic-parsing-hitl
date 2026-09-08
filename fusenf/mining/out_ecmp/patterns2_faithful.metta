;; FUSE-NF §4.3.1 Frequent Subtree Mining — FAITHFUL view — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   patterns2_faithful.jsonl  (every unit with its fields and supporting record ids)
;;   patterns2.jsonl           (the miner's full inventory this view is cut from)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate           canonical_iteme.jsonl (762 records; 740 carry at least one pattern) — patterns2.jsonl: 5799 patterns, the miner's inventory; this view mines nothing
;;   size threshold      k = 4 atoms per pattern (the miner's --k)
;;   minimum support     3 records (document support; occurrences reported beside it)
;;   pattern language    skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded
;;   rooted subtree      atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded
;;   constants verbatim  n_lifted = 0 only; the 3939 constant-lifted (shape-stratum) patterns are an addition
;;   closure             closed = no larger faithful unit with exactly the same supporting records contains it (its atoms embed under a renaming of variables); two different units on the same records are both closed; computed within this view (the miner's own flag ranges over the full inventory, lifted patterns and joins included, and is kept as miner_dominated); closed units are the meta-node proposals, subsumed units the same evidence in fewer atoms (subsumed_by names the covering unit)
;;   meta-node           (Mn<Name> <root> <other variables>) for proposals = closed units of size >= 2 — Name = the unit's heads and constants in atom order along the tree (Member / GroupOf give their constant, roles their name, Ev / Fn for an event- or function-valued filler, Of<spec> for a filler with atoms of its own, ~NEG a Neg suffix; root tokens joined with '_', tokens inside a nested spec with '-'), the pattern id appended when two units would share a name (0 here); provisional; pack rule = (Implication (And <atoms>) (Mn<Name> …))
;;   proposals           closed units of size >= 2 (flag `proposal`); a subsumed unit is the same evidence in fewer atoms and is rendered for reading only; single-atom units are subtrees by the letter, kept in the JSONL and the counts, but a one-atom pack is a rename, so they are not rendered
;;
;; RECORD FORMAT (every record is one unit = one rooted subtree)
;;   ;; <pattern id>  support <records> (occ <matches>)  size <atoms>  root <variable> (<kind>)  depth <d>
;;   ;;   e.g. <up to three supporting record ids>
;;   ;;   meta-node: (Mn<Name> <root> <other variables>)      (closed units; a subsumed unit names its cover instead)
;;   <the unit as a conjunctive query>
;; Sections: CLOSED UNITS (the meta-node proposals) then SUBSUMED UNITS (a larger unit on the same records
;; contains them); each sorted by support desc, then pattern id. Single-atom units are not rendered.

;; ==================== CLOSED UNITS: 614 of 1652 rooted-subtree units (k = 4, support >= 3 of 762 records) ====================

;; p200015  support 171 (occ 171)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgent_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Theme $e0 $x1))

;; p200033  support 77 (occ 101)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgent_Past $e0 $x0)
(And (Agent $e0 $x0) (Past $e0))

;; p200041  support 63 (occ 71)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnPast_Theme $e0 $x0)
(And (Past $e0) (Theme $e0 $x0))

;; p200049  support 52 (occ 75)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnPast_Patient $e0 $x0)
(And (Past $e0) (Patient $e0 $x0))

;; p200053  support 50 (occ 58)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnAgent_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Patient $e0 $x1))

;; p200073  support 35 (occ 35)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgent_Past_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p200091  support 29 (occ 29)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (MnRecipient_Theme $e0 $x0 $x1)
(And (Recipient $e0 $x0) (Theme $e0 $x1))

;; p200099  support 28 (occ 28)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (MnAgent_Recipient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Recipient $e0 $x1))

;; p200125  support 25 (occ 31)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (MnAgent_Location $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1))

;; p200136  support 24 (occ 24)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (MnAgent_Recipient_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p200147  support 23 (occ 23)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnThemeOfCardinalityNum $e0 $x0)
(And (Cardinality $x0 <num>) (Theme $e0 $x0))

;; p200159  support 22 (occ 28)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnAgent_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p200170  support 20 (occ 20)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000075 tierA-000078 tierA-000108
;;   meta-node: (MnAgent_Might $e0 $x0)
(And (Agent $e0 $x0) (Might $e0))

;; p200191  support 18 (occ 28)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000041 tierC-000042 tierC-000049
;;   meta-node: (MnAgentOfPerson $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 person))

;; p200249  support 14 (occ 14)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   meta-node: (MnAgent_Buy_Past_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))

;; p200266  support 13 (occ 19)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000072
;;   meta-node: (MnAgentOfPerson_Past $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 person) (Past $e0))

;; p200281  support 13 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (MnLocation_Theme $e0 $x0 $x1)
(And (Location $e0 $x0) (Theme $e0 $x1))

;; p200282  support 13 (occ 13)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000066
;;   meta-node: (MnPossessionOfPerson $x1 $x0)
(And (Member $x0 person) (Possession $x1 $x0))

;; p200283  support 13 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000087 tierA-000108 tierA-000112
;;   meta-node: (MnMight_Theme $e0 $x0)
(And (Might $e0) (Theme $e0 $x0))

;; p200326  support 12 (occ 12)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (MnAgent_Give_Recipient_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p200331  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000108 tierA-000112 tierA-000122
;;   meta-node: (MnAgent_Might_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1))

;; p200339  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (MnHolder_Theme $e0 $x0 $x1)
(And (Holder $e0 $x0) (Theme $e0 $x1))

;; p200377  support 11 (occ 11)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgent_ThemeOfCardinalityNum $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))

;; p200400  support 11 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000187
;;   meta-node: (MnAgent_ThemeEv $e0 $e1 $x0)
(And (Agent $e0 $x0) (Theme $e0 $e1))

;; p200401  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (MnExperiencer_Location $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1))

;; p200402  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (MnDestroy_Patient $e0 $x0)
(And (Member $e0 destroy) (Patient $e0 $x0))

;; p200403  support 11 (occ 13)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (MnThemeOfPossession $e0 $x0 $x1)
(And (Possession $x0 $x1) (Theme $e0 $x0))

;; p200470  support 10 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
;;   meta-node: (MnAgent_Answer_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))

;; p200471  support 10 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (MnAgent_Teach_Recipient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))

;; p200480  support 10 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000006 tierA-000109 tierA-000110
;;   meta-node: (MnAgentOfCardinalityNum $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>))

;; p200482  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
;;   meta-node: (MnAgent_Decide $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 decide))

;; p200484  support 10 (occ 10)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   meta-node: (MnCardinalityNum_GroupOfChild $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child))

;; p200487  support 10 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000071
;;   meta-node: (MnBuild_Patient $e0 $x0)
(And (Member $e0 build) (Patient $e0 $x0))

;; p200488  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (MnLend_Theme $e0 $x0)
(And (Member $e0 lend) (Theme $e0 $x0))

;; p200490  support 10 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (MnSource_Theme $e0 $x0 $x1)
(And (Source $e0 $x0) (Theme $e0 $x1))

;; p200525  support 9 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnPast_ThemeOfCardinalityNum $e0 $x0)
(And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))

;; p200550  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
;;   meta-node: (MnAgent_Decide_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))

;; p200551  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (MnAgent_Lend_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))

;; p200558  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000143 tierA-000145 tierA-000148
;;   meta-node: (MnAgent_Cancel $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 cancel))

;; p200560  support 9 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (MnAgentOfBoard $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 board))

;; p200561  support 9 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (MnAgent_Source $e0 $x0 $x1)
(And (Agent $e0 $x0) (Source $e0 $x1))

;; p200562  support 9 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000313 tierA-000315 tierA-000316
;;   meta-node: (MnLocation_Work $e0 $x0)
(And (Location $e0 $x0) (Member $e0 work))

;; p200564  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (MnDiscover_Theme $e0 $x0)
(And (Member $e0 discover) (Theme $e0 $x0))

;; p200620  support 8 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgentOfSchool_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1))

;; p200621  support 8 (occ 20)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   meta-node: (MnAgentOfPossessionOfPerson $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1))

;; p200661  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   meta-node: (MnAgent_Abandon_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))

;; p200662  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000224 tierA-000226
;;   meta-node: (MnAgent_Destroy_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))

;; p200663  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   meta-node: (MnAgent_Reject_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))

;; p200664  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (MnAgent_Repair_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))

;; p200665  support 8 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (MnAgent_Source_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))

;; p200679  support 8 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000377 tierA-000380
;;   meta-node: (MnAgentOfPhysician $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 physician))

;; p200682  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000237
;;   meta-node: (MnCan_Theme $e0 $x0)
(And (Can $e0) (Theme $e0 $x0))

;; p200683  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (MnHolder_Require $e0 $x0)
(And (Holder $e0 $x0) (Member $e0 require))

;; p200684  support 8 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (MnLocationOfLedger $e0 $x0)
(And (Location $e0 $x0) (Member $x0 ledger))

;; p200686  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000153 tierC-000154 tierC-000181
;;   meta-node: (MnHave_Theme $e0 $x0)
(And (Member $e0 have) (Theme $e0 $x0))

;; p200758  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000006 tierA-000109 tierA-000110
;;   meta-node: (MnAgentOfCardinalityNum_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1))

;; p200759  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (MnAgentOfBoard_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 board) (Theme $e0 $x1))

;; p200760  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgentOfDepot_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))

;; p200762  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000077 tierC-000078
;;   meta-node: (MnBeforeEvOfPast_Past $e0 $e1)
(And (Before $e0 $e1) (Past $e0) (Past $e1))

;; p200793  support 7 (occ 7)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (MnPotteryStudioOfInheritanceStudio $x0)
(And (Inheritance pottery_studio studio) (Member $x0 pottery_studio))

;; p200805  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000145 tierA-000148 tierA-000150
;;   meta-node: (MnAgent_Cancel_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))

;; p200806  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (MnAgent_Discover_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))

;; p200807  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   meta-node: (MnAgent_Postpone_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))

;; p200808  support 7 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000072
;;   meta-node: (MnBuild_Past_Patient $e0 $x0)
(And (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p200809  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000300 tierA-000301 tierA-000303
;;   meta-node: (MnLend_Recipient_Theme $e0 $x0 $x1)
(And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p200822  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
;;   meta-node: (MnAgent_CoAgent $e0 $x0 $x1)
(And (Agent $e0 $x0) (CoAgent $e0 $x1))

;; p200829  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnBeneficiary_Past $e0 $x0)
(And (Beneficiary $e0 $x0) (Past $e0))

;; p200830  support 7 (occ 7)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnCardinalityNum_GroupOfForklift $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 forklift))

;; p200831  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (MnFuture_Patient $e0 $x0)
(And (Future $e0) (Patient $e0 $x0))

;; p200832  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000055 tierA-000057
;;   meta-node: (MnBegin_Patient $e0 $x0)
(And (Member $e0 begin) (Patient $e0 $x0))

;; p200837  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   meta-node: (MnRequire_Theme $e0 $x0)
(And (Member $e0 require) (Theme $e0 $x0))

;; p200863  support 6 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgent_Past_ThemeOfCardinalityNum $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))

;; p200864  support 6 (occ 10)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   meta-node: (MnAgentOfPossessionOfPerson_Past $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1))

;; p200865  support 6 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnBeneficiaryOfHall_Past_Theme $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1))

;; p200866  support 6 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnPast_ThemeOfCardinalityNum-GroupOfForklift $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))

;; p200965  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000382 tierA-000384
;;   meta-node: (MnAgentOfPhysician_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 physician) (Theme $e0 $x1))

;; p200971  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (MnPast_ThemeOfKiln $e0 $x0)
(And (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))

;; p201014  support 6 (occ 6)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (MnYardFloodlightOfInheritanceFloodlight $x0)
(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))

;; p201048  support 6 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (MnAgent_Lend_Recipient_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p201049  support 6 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   meta-node: (MnAgent_Repair_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1))

;; p201050  support 6 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (MnAgent_Teach_Recipient_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p201058  support 6 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000071
;;   meta-node: (MnAgent_Build_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1))

;; p201064  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (MnHolder_Require_Theme $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 require) (Theme $e0 $x1))

;; p201067  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000089 tierC-000090 tierC-000131
;;   meta-node: (MnWrite_Past_Patient $e0 $x0)
(And (Member $e0 write) (Past $e0) (Patient $e0 $x0))

;; p201083  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (MnAgent_Arrive $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 arrive))

;; p201087  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (MnForEv_Past $e0 $e1)
(And (For $e0 $e1) (Past $e0))

;; p201089  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (MnGroupOfLemon_Crate $x0)
(And (GroupOf $x0 lemon) (Member $x0 crate))

;; p201090  support 6 (occ 8)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000174 tierA-000178 tierC-000025
;;   meta-node: (MnThemeEvOfLocation $e1 $e0 $x0)
(And (Location $e0 $x0) (Theme $e1 $e0))

;; p201091  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000187 tierA-000191
;;   meta-node: (MnDecision_Theme $e0 $x0)
(And (Member $e0 decision) (Theme $e0 $x0))

;; p201092  support 6 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000009 tierC-000010 tierC-000091
;;   meta-node: (MnProduce_Patient $e0 $x0)
(And (Member $e0 produce) (Patient $e0 $x0))

;; p201097  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   meta-node: (MnBudget_PossessionNextYear $x0)
(And (Member $x0 budget) (Possession $x0 next_year))

;; p201099  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000292 tierA-000293
;;   meta-node: (MnThemeOfSong $e0 $x0)
(And (Member $x0 song) (Theme $e0 $x0))

;; p201100  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000055 tierA-000066 tierA-000070
;;   meta-node: (MnMight_Patient $e0 $x0)
(And (Might $e0) (Patient $e0 $x0))

;; p201162  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgentOfSchool_BeneficiaryOfHall $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Member $x1 hall))

;; p201163  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgentOfSchool_Beneficiary_Past $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Past $e0))

;; p201164  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgentOfSchool_Beneficiary_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Theme $e0 $x2))

;; p201165  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgent_BeneficiaryOfHall_Past $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Past $e0))

;; p201166  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgent_BeneficiaryOfHall_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Theme $e0 $x2))

;; p201167  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (MnAgentOfCardinalityNum-GroupOfClimber_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Theme $e0 $x1))

;; p201168  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (MnAgentOfCardinalityNum_ThemeOfNorthRoute $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $x1 north_route) (Theme $e0 $x1))

;; p201169  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgent_ThemeOfCardinalityNum-GroupOfForklift $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 forklift) (Theme $e0 $x1))

;; p201170  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgentOfDepot_ThemeOfCardinalityNum $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 depot) (Theme $e0 $x1))

;; p201171  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (MnAgentOfGroupOfClimber_ThemeOfNorthRoute $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $x1 north_route) (Theme $e0 $x1))

;; p201172  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgentOfDepot_ThemeOfGroupOfForklift $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $x0 depot) (Theme $e0 $x1))

;; p201173  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgent_Past_ThemeOfGroupOfForklift $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Past $e0) (Theme $e0 $x1))

;; p201174  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (MnAgent_ThemeOfNorthRouteOfInheritanceNorth $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance north_route north) (Member $x1 north_route) (Theme $e0 $x1))

;; p201175  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (MnAgent_ThemeOfNorthRouteOfInheritanceRoute $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance north_route route) (Member $x1 north_route) (Theme $e0 $x1))

;; p201176  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (MnAgentOfPotteryStudioOfInheritanceStudio_Past $e0 $x0)
(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0))

;; p201177  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (MnAgentOfPotteryStudioOfInheritanceStudio_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x1))

;; p201178  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (MnAgent_PatientOfYardFloodlightOfInheritanceFloodlight $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance yard_floodlight floodlight) (Member $x1 yard_floodlight) (Patient $e0 $x1))

;; p201179  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (MnAgent_LocationOfPoint_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 point) (Theme $e0 $x2))

;; p201180  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   meta-node: (MnAgentOfClub_ThemeOfTournament $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 club) (Member $x1 tournament) (Theme $e0 $x1))

;; p201181  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   meta-node: (MnAgentOfDepot_Past_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 depot) (Past $e0) (Theme $e0 $x1))

;; p201182  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (MnAgentOfElectrician_PatientOfYardFloodlight $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 electrician) (Member $x1 yard_floodlight) (Patient $e0 $x1))

;; p201183  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (MnAgentOfElectrician_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0) (Patient $e0 $x1))

;; p201184  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (MnAgentOfPotteryStudio_ThemeOfKiln $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Member $x1 kiln) (Theme $e0 $x1))

;; p201185  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (MnAgentOfPotteryStudio_Past_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x1))

;; p201186  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgentOfSchool_Past_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 school) (Past $e0) (Theme $e0 $x1))

;; p201187  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   meta-node: (MnAgent_Past_ThemeOfKiln $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 kiln) (Past $e0) (Theme $e0 $x1))

;; p201188  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (MnAgent_Past_PatientOfYardFloodlight $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Past $e0) (Patient $e0 $x1))

;; p201189  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnBeneficiaryOfHall_ThemeOfProjector $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Member $x1 projector) (Theme $e0 $x1))

;; p201190  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnBeneficiary_Past_ThemeOfProjector $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1))

;; p201191  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (MnPast_ThemeOfGroupOfLemon-Crate $e0 $x0)
(And (GroupOf $x0 lemon) (Member $x0 crate) (Past $e0) (Theme $e0 $x0))

;; p201192  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember $e0 $x0)
(And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p201193  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   meta-node: (MnThemeOfNorthRouteOfInheritanceNorth-InheritanceRoute $e0 $x0)
(And (Inheritance north_route north) (Inheritance north_route route) (Member $x0 north_route) (Theme $e0 $x0))

;; p201194  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   meta-node: (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn $e0 $x0)
(And (Inheritance shoreline_survey survey) (Member $x0 shoreline_survey) (Patient $e0 $x0) (Time $e0 dawn))

;; p201195  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   meta-node: (MnPast_PatientOfYardFloodlightOfInheritanceFloodlight $e0 $x0)
(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0))

;; p201410  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000392 tierA-000398
;;   meta-node: (MnAgentOfAutomobile_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1))

;; p201423  support 5 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (MnAgent_ThemeEvOfPatient $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p201425  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (MnHolder_ThemeOfCardinalityNum $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))

;; p201426  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   meta-node: (MnRequire_ThemeOfCardinalityNum $e0 $x0)
(And (Cardinality $x0 <num>) (Member $e0 require) (Theme $e0 $x0))

;; p201438  support 5 (occ 5)  size 3  root $x1 (entity)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (MnTender_PossessionOfFirm $x1 $x0)
(And (Member $x0 firm) (Member $x1 tender) (Possession $x1 $x0))

;; p201533  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (MnAfternoonSessionOfInheritanceSession $x0)
(And (Inheritance afternoon_session session) (Member $x0 afternoon_session))

;; p201535  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (MnDressRehearsalOfInheritanceRehearsal $x0)
(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))

;; p201536  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   meta-node: (MnEveningFlightOfInheritanceFlight $x0)
(And (Inheritance evening_flight flight) (Member $x0 evening_flight))

;; p201537  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (MnLoanApplicationOfInheritanceApplication $x0)
(And (Inheritance loan_application application) (Member $x0 loan_application))

;; p201540  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (MnRescueTeamOfInheritanceTeam $x0)
(And (Inheritance rescue_team team) (Member $x0 rescue_team))

;; p201542  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (MnSummerFairOfInheritanceFair $x0)
(And (Inheritance summer_fair fair) (Member $x0 summer_fair))

;; p201571  support 5 (occ 5)  size 2  root monthly_servicing (constant)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (MnInheritanceMonthly_InheritanceServicing monthly_servicing)
(And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing))

;; p201622  support 5 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgent_Beneficiary_Past_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0) (Theme $e0 $x2))

;; p201623  support 5 (occ 9)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000072
;;   meta-node: (MnAgent_Build_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1))

;; p201636  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
;;   meta-node: (MnAgent_CoAgent_Location $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2))

;; p201637  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000319
;;   meta-node: (MnAgent_Location_Work $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work))

;; p201641  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   meta-node: (MnThemeOfCardinalityNum-GroupOfEgg $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Theme $e0 $x0))

;; p201643  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   meta-node: (MnThemeOfBudget-PossessionNextYear $e0 $x0)
(And (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0))

;; p201676  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000241
;;   meta-node: (MnAgent_Future $e0 $x0)
(And (Agent $e0 $x0) (Future $e0))

;; p201677  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000181 tierA-000183 tierA-000184
;;   meta-node: (MnAgent_Goal $e0 $x0 $x1)
(And (Agent $e0 $x0) (Goal $e0 $x1))

;; p201679  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000182
;;   meta-node: (MnAgent_Take $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 take))

;; p201680  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000177 tierA-000180
;;   meta-node: (MnAgent_Walk $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 walk))

;; p201685  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000196 tierA-000197 tierA-000198
;;   meta-node: (MnAgentOfFamily $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 family))

;; p201686  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000191 tierA-000192
;;   meta-node: (MnAgentOfJudge $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 judge))

;; p201688  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (MnAgentOfTutor $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 tutor))

;; p201689  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000182 tierA-000186 tierA-000191
;;   meta-node: (MnAgent_PatientEv $e0 $e1 $x0)
(And (Agent $e0 $x0) (Patient $e0 $e1))

;; p201690  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000282 tierA-000283
;;   meta-node: (MnAgent_ThemeGlazing $e0 $x0)
(And (Agent $e0 $x0) (Theme $e0 glazing))

;; p201692  support 5 (occ 6)  size 2  root appear (constant)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAlsoEvOfPast appear $e0)
(And (Also appear $e0) (Past $e0))

;; p201697  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000013 tierC-000014 tierC-000062
;;   meta-node: (MnExperiencer_Past $e0 $x0)
(And (Experiencer $e0 $x0) (Past $e0))

;; p201700  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000243 tierC-000244 tierC-000279
;;   meta-node: (MnLocation_Find $e0 $x0)
(And (Location $e0 $x0) (Member $e0 find))

;; p201701  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000174 tierA-000177
;;   meta-node: (MnLocation_Walk $e0 $x0)
(And (Location $e0 $x0) (Member $e0 walk))

;; p201703  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000014 tierC-000243 tierC-000244
;;   meta-node: (MnLocation_Past $e0 $x0)
(And (Location $e0 $x0) (Past $e0))

;; p201704  support 5 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAppear_Past $e0)
(And (Member $e0 appear) (Past $e0))

;; p201705  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000237 tierC-000238
;;   meta-node: (MnBecome_Patient $e0 $x0)
(And (Member $e0 become) (Patient $e0 $x0))

;; p201706  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   meta-node: (MnBorrow_Theme $e0 $x0)
(And (Member $e0 borrow) (Theme $e0 $x0))

;; p201707  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000253 tierA-000255 tierA-000257
;;   meta-node: (MnDie_Patient $e0 $x0)
(And (Member $e0 die) (Patient $e0 $x0))

;; p201708  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000010 tierC-000091 tierC-000138
;;   meta-node: (MnDirect_Patient $e0 $x0)
(And (Member $e0 direct) (Patient $e0 $x0))

;; p201709  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (MnReceive_Theme $e0 $x0)
(And (Member $e0 receive) (Theme $e0 $x0))

;; p201712  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000191 tierA-000192
;;   meta-node: (MnThemeOfCase $e0 $x0)
(And (Member $x0 case) (Theme $e0 $x0))

;; p201714  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (MnFile_Missing $x0)
(And (Member $x0 file) (Member $x0 missing))

;; p201716  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnGearbox_Seized $x0)
(And (Member $x0 gearbox) (Member $x0 seized))

;; p201724  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000025 tierC-000026 tierC-000203
;;   meta-node: (MnPast_ThemeEv $e0 $e1)
(And (Past $e0) (Theme $e0 $e1))

;; p201838  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (MnAgentOfGovernment_AgentJica_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $x0 government) (Theme $e0 $x1))

;; p201877  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgent_Beneficiary_ThemeOfProjector $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x2 projector) (Theme $e0 $x2))

;; p201878  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (MnAgent_Buy_ThemeOfCardinalityNum $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))

;; p201879  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (MnAgentOfChef_ThemeOfGroupOfLemon $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x0 chef) (Theme $e0 $x1))

;; p201880  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (MnAgent_ThemeOfGroupOfLemon-Crate $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x1 crate) (Theme $e0 $x1))

;; p201881  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (MnAgent_Past_ThemeOfGroupOfLemon $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Past $e0) (Theme $e0 $x1))

;; p201882  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (MnAgent_PatientOfAfternoonSessionOfInheritanceSession $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))

;; p201883  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (MnAgentOfRescueTeamOfInheritanceTeam_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance rescue_team team) (Member $x0 rescue_team) (Theme $e0 $x1))

;; p201884  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (MnAgent_PatientOfSummerFairOfInheritanceFair $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))

;; p201888  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (MnAgent_LocationOfPoint_Discover $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x1 point))

;; p201889  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   meta-node: (MnAgentOfBiologist_LocationOfSurvey $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 biologist) (Member $x1 survey))

;; p201890  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (MnAgentOfDiver_LocationOfPoint $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Member $x1 point))

;; p201891  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (MnAgentOfDiver_Location_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Theme $e0 $x2))

;; p201892  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (MnAgent_Location_ThemeOfWreck $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x2 wreck) (Theme $e0 $x2))

;; p201893  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationEskisehir_LocationTurkey $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey) (Member $x0 company))

;; p201895  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationEskisehir_Build $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Member $x0 company))

;; p201896  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationEskisehir_Past $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Past $e0))

;; p201897  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationEskisehir_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Patient $e0 $x1))

;; p201898  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationEskisehir_PatientOfHotel $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x1 hotel) (Patient $e0 $x1))

;; p201900  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationKazakhstan_Build $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Member $x0 company))

;; p201901  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationKazakhstan_Past $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Past $e0))

;; p201902  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationKazakhstan_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Patient $e0 $x1))

;; p201904  support 4 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationTurkey_Build $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Member $x0 company))

;; p201905  support 4 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationTurkey_Past $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company) (Past $e0))

;; p201906  support 4 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_LocationTurkey_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company) (Patient $e0 $x1))

;; p201907  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationTurkey_PatientOfHotel $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $x1 hotel) (Patient $e0 $x1))

;; p201911  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   meta-node: (MnAgent_Block_ThemeOfLane $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 block) (Member $x1 lane) (Theme $e0 $x1))

;; p201917  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_Build_Past $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Past $e0))

;; p201918  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_Build_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Patient $e0 $x1))

;; p201919  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_Build_PatientOfHotel $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 build) (Member $x1 hotel) (Patient $e0 $x1))

;; p201920  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   meta-node: (MnAgent_Make_PatientEvOfDecision $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1))

;; p201921  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   meta-node: (MnAgent_Reach_ThemeEvOfDecision $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1))

;; p201922  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   meta-node: (MnAgentOfBoard_ThemeOfVote $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 board) (Member $x1 vote) (Theme $e0 $x1))

;; p201923  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (MnAgentOfChef_ThemeOfCrate $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 chef) (Member $x1 crate) (Theme $e0 $x1))

;; p201924  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (MnAgentOfChef_Past_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 chef) (Past $e0) (Theme $e0 $x1))

;; p201925  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_PatientOfHotel $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 company) (Member $x1 hotel) (Patient $e0 $x1))

;; p201926  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgentOfCompany_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1))

;; p201927  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   meta-node: (MnAgentOfCouncil_PatientOfSummerFair $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))

;; p201928  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (MnAgentOfDiver_ThemeOfWreck $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 diver) (Member $x1 wreck) (Theme $e0 $x1))

;; p201929  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   meta-node: (MnAgentOfEditor_ThemeOfManuscript $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 editor) (Member $x1 manuscript) (Theme $e0 $x1))

;; p201931  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (MnAgentOfFirm_ThemeOfTender $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 firm) (Member $x1 tender) (Theme $e0 $x1))

;; p201933  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (MnAgentOfIntern_ThemeOfFile $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 intern) (Member $x1 file) (Theme $e0 $x1))

;; p201934  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (MnAgentOfIntern_ThemeOfMissing $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 intern) (Member $x1 missing) (Theme $e0 $x1))

;; p201935  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnAgentOfMechanic_PatientOfGearbox $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 gearbox) (Patient $e0 $x1))

;; p201936  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnAgentOfMechanic_PatientOfSeized $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 seized) (Patient $e0 $x1))

;; p201937  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnAgentOfMechanic_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0) (Patient $e0 $x1))

;; p201938  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   meta-node: (MnAgentOfPanel_ThemeOfProposal $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 panel) (Member $x1 proposal) (Theme $e0 $x1))

;; p201940  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   meta-node: (MnAgentOfRescueTeam_ThemeOfSearch $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 rescue_team) (Member $x1 search) (Theme $e0 $x1))

;; p201941  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgentOfSchool_ThemeOfProjector $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 school) (Member $x1 projector) (Theme $e0 $x1))

;; p201942  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   meta-node: (MnAgentOfTutor_PatientOfAfternoonSession $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))

;; p201943  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   meta-node: (MnAgent_Past_ThemeOfCrate $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 crate) (Past $e0) (Theme $e0 $x1))

;; p201944  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   meta-node: (MnAgent_ThemeOfFile-Missing $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 file) (Member $x1 missing) (Theme $e0 $x1))

;; p201945  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnAgent_PatientOfGearbox-Seized $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 gearbox) (Member $x1 seized) (Patient $e0 $x1))

;; p201946  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnAgent_Past_PatientOfGearbox $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 gearbox) (Past $e0) (Patient $e0 $x1))

;; p201947  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_Past_PatientOfHotel $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 hotel) (Past $e0) (Patient $e0 $x1))

;; p201948  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   meta-node: (MnAgent_Past_ThemeOfProjector $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1))

;; p201950  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnAgent_Past_PatientOfSeized $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 seized) (Past $e0) (Patient $e0 $x1))

;; p201952  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnAgent_Past_ThemeOfView $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 view) (Past $e0) (Theme $e0 $x1))

;; p201953  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnAgent_ThemeOfView-PossessionFreeSoilParty $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 view) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p201954  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnAgent_ThemeOfView-PossessionRepublicanParty $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 view) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p201956  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnAgent_Past_ThemeOfPossessionFreeSoilParty $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p201957  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnAgent_Past_ThemeOfPossessionRepublicanParty $e0 $x0 $x1)
(And (Agent $e0 $x0) (Past $e0) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p201958  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnAgent_ThemeOfPossessionFreeSoilParty-PossessionRepublicanParty $e0 $x0 $x1)
(And (Agent $e0 $x0) (Possession $x1 free_soil_party) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p201959  support 4 (occ 4)  size 4  root $x0 (entity)  depth 4
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal $x0 $e0 $x1)
(And (Before $x0 $e0) (Inheritance dress_rehearsal rehearsal) (Member $x1 dress_rehearsal) (Patient $e0 $x1))

;; p201960  support 4 (occ 4)  size 4  root $x0 (entity)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (MnBeforeEvOfPatientOfDressRehearsal_Lunch $x0 $e0 $x1)
(And (Before $x0 $e0) (Member $x0 lunch) (Member $x1 dress_rehearsal) (Patient $e0 $x1))

;; p201961  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnCan_MannerOfCardinalityNum_Define $e0 $x0)
(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define))

;; p201962  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnCan_MannerOfCardinalityNum_Theme $e0 $x0 $x1)
(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Theme $e0 $x1))

;; p201963  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnCan_Manner_ThemeOfGroupOfSequence $e0 $x0 $x1)
(And (Can $e0) (GroupOf $x0 sequence) (Manner $e0 $x1) (Theme $e0 $x0))

;; p201964  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnCan_Define_ThemeOfGroupOfSequence $e0 $x0)
(And (Can $e0) (GroupOf $x0 sequence) (Member $e0 define) (Theme $e0 $x0))

;; p201965  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p201966  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (MnHave_ThemeOfCardinalityNum-GroupOfChild $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))

;; p201967  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (MnHolder_ThemeOfCardinalityNum-GroupOfEgg $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0))

;; p201968  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   meta-node: (MnRequire_ThemeOfCardinalityNum-GroupOfEgg $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0))

;; p201969  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnMannerOfCardinalityNum_ThemeOfGroupOfSequence $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (GroupOf $x1 sequence) (Manner $e0 $x0) (Theme $e0 $x1))

;; p201970  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (MnHolder_Require_ThemeOfCardinalityNum $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))

;; p201971  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (MnHolderOfRecipe_ThemeOfCardinalityNum $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0))

;; p201972  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (MnHolderKristoffer_Have_ThemeOfCardinalityNum $e0 $x0)
(And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p201973  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnMannerOfCardinalityNum_Define_Theme $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))

;; p201974  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (MnBuy_Past_ThemeOfCardinalityNum $e0 $x0)
(And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))

;; p201975  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (MnExperiencer_StimulusEvOfLocationOfLedger $e0 $e1 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x1 ledger) (Stimulus $e0 $e1))

;; p201976  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (MnForEvOfPortray_Win_Past $e0 $e1)
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Past $e0))

;; p201977  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (MnForEvOfPortray_Win_Theme $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Theme $e0 $x0))

;; p201978  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (MnForEv_Win_ThemeOfEmmy $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))

;; p201979  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (MnForEvOfPortray_ThemeOfEmmy $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e1 portray) (Member $x0 emmy) (Theme $e0 $x0))

;; p201980  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (MnForEvOfPortray_Past_Theme $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e1 portray) (Past $e0) (Theme $e0 $x0))

;; p201981  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (MnForEv_Past_ThemeOfEmmy $e0 $e1 $x0)
(And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p201982  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (MnFuture_PatientOfAppleHarvestOfInheritanceHarvest $e0 $x0)
(And (Future $e0) (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p201983  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   meta-node: (MnFuture_PatientOfAppleHarvest_Time(MonthSeptember $e0 $x0)
(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p201984  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   meta-node: (MnHolderKristoffer_Have_ThemeOfGroupOfChild $e0 $x0)
(And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p201985  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   meta-node: (MnHolderOfRecipe_ThemeOfGroupOfEgg $e0 $x0 $x1)
(And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0))

;; p201986  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnManner_Define_ThemeOfGroupOfSequence $e0 $x0 $x1)
(And (GroupOf $x0 sequence) (Manner $e0 $x1) (Member $e0 define) (Theme $e0 $x0))

;; p201987  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (MnLocationOfPoint_Discover_Theme $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point) (Theme $e0 $x1))

;; p201988  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   meta-node: (MnLocationOfPoint_ThemeOfWreck $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $x0 point) (Member $x1 wreck) (Theme $e0 $x1))

;; p201990  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationEskisehir_LocationTurkey_PatientOfHotel $e0 $x0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Member $x0 hotel) (Patient $e0 $x0))

;; p201996  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationEskisehir_Build_PatientOfHotel $e0 $x0)
(And (Location $e0 eskisehir) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))

;; p201997  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationEskisehir_Past_PatientOfHotel $e0 $x0)
(And (Location $e0 eskisehir) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p202007  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationTurkey_Build_PatientOfHotel $e0 $x0)
(And (Location $e0 turkey) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))

;; p202008  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationTurkey_Past_PatientOfHotel $e0 $x0)
(And (Location $e0 turkey) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p202014  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnBuild_Past_PatientOfHotel $e0 $x0)
(And (Member $e0 build) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p202020  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (MnWin_Past_ThemeOfEmmy $e0 $x0)
(And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p202023  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   meta-node: (MnThemeOfTender-PossessionOfFirm $e0 $x0 $x1)
(And (Member $x0 firm) (Member $x1 tender) (Possession $x1 $x0) (Theme $e0 $x1))

;; p202024  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   meta-node: (MnPast_PatientOfGearbox-Seized $e0 $x0)
(And (Member $x0 gearbox) (Member $x0 seized) (Past $e0) (Patient $e0 $x0))

;; p202025  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   meta-node: (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning $e0 $x0)
(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning))

;; p202026  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnPast_ThemeOfView-PossessionFreeSoilParty $e0 $x0)
(And (Member $x0 view) (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p202027  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnPast_ThemeOfView-PossessionRepublicanParty $e0 $x0)
(And (Member $x0 view) (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p202029  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnPast_ThemeOfPossessionFreeSoilParty-PossessionRepublicanParty $e0 $x0)
(And (Past $e0) (Possession $x0 free_soil_party) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p202769  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (MnAgent_ThemeOfGroupOfSample $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 sample) (Theme $e0 $x1))

;; p202777  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000174 tierA-000178 tierC-000025
;;   meta-node: (MnAgent_ThemeEvOfLocation $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1))

;; p202785  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000208 tierA-000209
;;   meta-node: (MnAgentOfClerk_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 clerk) (Theme $e0 $x1))

;; p202789  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   meta-node: (MnAgentOfDelegation_Time(WeekdayThursday $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 delegation) (Time $e0 (Weekday thursday)))

;; p202798  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000071 tierC-000072 tierC-000089
;;   meta-node: (MnAgentOfPerson_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))

;; p202799  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000213 tierA-000214
;;   meta-node: (MnAgentOfPilot_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pilot) (Theme $e0 $x1))

;; p202804  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   meta-node: (MnAgent_ThemeOfDrill $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 drill) (Theme $e0 $x1))

;; p202807  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000302 tierA-000303
;;   meta-node: (MnAgent_ThemeOfGenerator $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 generator) (Theme $e0 $x1))

;; p202810  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   meta-node: (MnAgent_ThemeOfManifest $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 manifest) (Theme $e0 $x1))

;; p202815  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (MnAgent_ThemeOfScan $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 scan) (Theme $e0 $x1))

;; p202818  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000292 tierA-000293
;;   meta-node: (MnAgent_ThemeOfSong $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 song) (Theme $e0 $x1))

;; p202825  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (MnAgent_ThemeOfOrdinalNumScan $e0 $x0 $x1)
(And (Agent $e0 $x0) (Ordinal $x1 <num> scan) (Theme $e0 $x1))

;; p202831  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   meta-node: (MnButEvOfPast_Past $e0 $e1)
(And (But $e0 $e1) (Past $e0) (Past $e1))

;; p202839  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000004 tierA-000265 tierA-000280
;;   meta-node: (MnRecipient_ThemeOfCardinalityNum $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p202841  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000013 tierC-000014 tierC-000121
;;   meta-node: (MnExperiencerOfPerson_Past $e0 $x0)
(And (Experiencer $e0 $x0) (Member $x0 person) (Past $e0))

;; p202853  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   meta-node: (MnHolderOfPermit_Theme $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $x0 permit) (Theme $e0 $x1))

;; p202857  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (MnThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing $e0)
(And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p202862  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (MnLocationOfLedger_Error $e0 $x0)
(And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger))

;; p202882  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   meta-node: (MnDeparture_PossessionOfFerry $x0 $x1)
(And (Member $x0 departure) (Member $x1 ferry) (Possession $x0 $x1))

;; p202884  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000121
;;   meta-node: (MnFamily_PossessionOfPerson $x0 $x1)
(And (Member $x0 family) (Member $x1 person) (Possession $x0 $x1))

;; p202892  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000235 tierC-000236 tierC-000257
;;   meta-node: (MnPast_ThemeOfPossession $e0 $x0 $x1)
(And (Past $e0) (Possession $x0 $x1) (Theme $e0 $x0))

;; p203143  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (MnGroupOfSoilSampleOfInheritanceSample $x0)
(And (GroupOf $x0 soil_sample) (Inheritance soil_sample sample))

;; p203146  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000363 tierA-000364 tierA-000365
;;   meta-node: (MnNightCrewOfInheritanceCrew $x0)
(And (Inheritance night_crew crew) (Member $x0 night_crew))

;; p203147  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000347 tierA-000348 tierA-000349
;;   meta-node: (MnSpoilMoundOfInheritanceMound $x0)
(And (Inheritance spoil_mound mound) (Member $x0 spoil_mound))

;; p203209  support 4 (occ 4)  size 2  root regional_unit (constant)  depth 1
;;   e.g. tierC-000031 tierC-000032 tierC-000081
;;   meta-node: (MnInheritanceRegional_InheritanceUnit regional_unit)
(And (Inheritance regional_unit regional) (Inheritance regional_unit unit))

;; p203258  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   meta-node: (MnAgent_Location_Discover_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Theme $e0 $x2))

;; p203259  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationEskisehir_LocationTurkey_Build $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey) (Member $e0 build))

;; p203260  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationEskisehir_LocationTurkey_Past $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey) (Past $e0))

;; p203261  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationEskisehir_LocationTurkey_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey) (Patient $e0 $x1))

;; p203262  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationEskisehir_Build_Past $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Past $e0))

;; p203263  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationEskisehir_Build_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x1))

;; p203264  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationEskisehir_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x1))

;; p203265  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationKazakhstan_Build_Past $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Past $e0))

;; p203266  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationKazakhstan_Build_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Patient $e0 $x1))

;; p203267  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationKazakhstan_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Past $e0) (Patient $e0 $x1))

;; p203268  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationTurkey_Build_Past $e0 $x0)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Past $e0))

;; p203269  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationTurkey_Build_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x1))

;; p203270  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnAgent_LocationTurkey_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 turkey) (Past $e0) (Patient $e0 $x1))

;; p203271  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   meta-node: (MnAgent_Acquire_Past_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))

;; p203272  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   meta-node: (MnAgent_Purchase_Past_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))

;; p203273  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (MnAgent_Teach_Recipient_ThemeGlazing $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 glazing))

;; p203274  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnCan_Manner_Define_Theme $e0 $x0 $x1)
(And (Can $e0) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))

;; p203275  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   meta-node: (MnForEv_Win_Past_Theme $e0 $e1 $x0)
(And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0))

;; p203276  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationEskisehir_LocationTurkey_Build_Past $e0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Member $e0 build) (Past $e0))

;; p203277  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationEskisehir_LocationTurkey_Build_Patient $e0 $x0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x0))

;; p203278  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationEskisehir_LocationTurkey_Past_Patient $e0 $x0)
(And (Location $e0 eskisehir) (Location $e0 turkey) (Past $e0) (Patient $e0 $x0))

;; p203279  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationEskisehir_Build_Past_Patient $e0 $x0)
(And (Location $e0 eskisehir) (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p203280  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationKazakhstan_Build_Past_Patient $e0 $x0)
(And (Location $e0 kazakhstan) (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p203281  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   meta-node: (MnLocationTurkey_Build_Past_Patient $e0 $x0)
(And (Location $e0 turkey) (Member $e0 build) (Past $e0) (Patient $e0 $x0))

;; p203282  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   meta-node: (MnSell_Past_Recipient_Theme $e0 $x0 $x1)
(And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p203283  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   meta-node: (MnThemeOfView-PossessionFreeSoilParty-PossessionRepublicanParty $e0 $x0)
(And (Member $x0 view) (Possession $x0 free_soil_party) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203383  support 4 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000025 tierC-000026 tierC-000353
;;   meta-node: (MnAgent_Location_Patient $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2))

;; p203384  support 4 (occ 6)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000025 tierC-000026 tierC-000041
;;   meta-node: (MnThemeEvOfAgent-Location $e1 $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e1 $e0))

;; p203399  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (MnAgent_Order_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 order) (Theme $e0 $x1))

;; p203403  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (MnAgent_Sign_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 sign) (Patient $e0 $x1))

;; p203412  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000003 tierC-000004 tierC-000343
;;   meta-node: (MnExperiencer_Location_Locate $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 locate))

;; p203417  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000153 tierC-000154 tierC-000271
;;   meta-node: (MnHolder_Have_Theme $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))

;; p203434  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000241
;;   meta-node: (MnBecome_Past_ResultEv $e0 $e1)
(And (Member $e0 become) (Past $e0) (Result $e0 $e1))

;; p203435  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000183
;;   meta-node: (MnDesign_Past_Patient $e0 $x0)
(And (Member $e0 design) (Past $e0) (Patient $e0 $x0))

;; p203436  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000091 tierC-000092 tierC-000103
;;   meta-node: (MnProduce_Past_Patient $e0 $x0)
(And (Member $e0 produce) (Past $e0) (Patient $e0 $x0))

;; p203445  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (MnThemeOfNew-Roof $e0 $x0)
(And (Member $x0 new) (Member $x0 roof) (Theme $e0 $x0))

;; p203612  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000182 tierA-000184
;;   meta-node: (MnAgentOfGroupOfChild $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 child))

;; p203617  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000075 tierA-000076 tierA-000078
;;   meta-node: (MnAgent_Allow $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 allow))

;; p203624  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000127 tierC-000128 tierC-000329
;;   meta-node: (MnAgent_Sing $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 sing))

;; p203625  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   meta-node: (MnAgentOfAirline $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 airline))

;; p203629  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   meta-node: (MnAgentOfCommittee $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 committee))

;; p203635  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   meta-node: (MnAgentOfFire $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 fire))

;; p203637  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   meta-node: (MnAgentOfFlood $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 flood))

;; p203647  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000109 tierC-000110 tierC-000333
;;   meta-node: (MnBeforeEvOfTheme $e0 $e1 $x0)
(And (Before $e0 $e1) (Theme $e1 $x0))

;; p203675  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000137 tierA-000313 tierA-000322
;;   meta-node: (MnLocation_Might $e0 $x0)
(And (Location $e0 $x0) (Might $e0))

;; p203682  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000111 tierC-000112 tierC-000121
;;   meta-node: (MnLocationJapan_Past $e0)
(And (Location $e0 japan) (Past $e0))

;; p203696  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000054 tierA-000059 tierA-000064
;;   meta-node: (MnCommence_Patient $e0 $x0)
(And (Member $e0 commence) (Patient $e0 $x0))

;; p203702  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000279 tierC-000280 tierC-000313
;;   meta-node: (MnFind_Theme $e0 $x0)
(And (Member $e0 find) (Theme $e0 $x0))

;; p203703  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000076 tierC-000095 tierC-000096
;;   meta-node: (MnFollow_Past $e0)
(And (Member $e0 follow) (Past $e0))

;; p203704  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000258 tierC-000351
;;   meta-node: (MnInfluence_Past $e0)
(And (Member $e0 influence) (Past $e0))

;; p203707  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000227 tierC-000228 tierC-000229
;;   meta-node: (MnPlay_Past $e0)
(And (Member $e0 play) (Past $e0))

;; p203712  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000099 tierC-000100 tierC-000359
;;   meta-node: (MnReplace_Past $e0)
(And (Member $e0 replace) (Past $e0))

;; p203717  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000053 tierA-000058 tierA-000063
;;   meta-node: (MnStart_Patient $e0 $x0)
(And (Member $e0 start) (Patient $e0 $x0))

;; p203722  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000335 tierA-000336 tierA-000337
;;   meta-node: (MnBench_New $x0)
(And (Member $x0 bench) (Member $x0 new))

;; p203726  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000257 tierA-000258 tierA-000259
;;   meta-node: (MnElm_Last $x0)
(And (Member $x0 elm) (Member $x0 last))

;; p203735  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000022 tierA-000026 tierA-000027
;;   meta-node: (MnKiln_OrdinalNumBuy $x0)
(And (Member $x0 kiln) (Ordinal $x0 <num> buy))

;; p203736  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000297 tierA-000298
;;   meta-node: (MnThemeOfLadder $e0 $x0)
(And (Member $x0 ladder) (Theme $e0 $x0))

;; p203743  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000041 tierC-000042 tierC-000123
;;   meta-node: (MnThemeOfPerson $e0 $x0)
(And (Member $x0 person) (Theme $e0 $x0))

;; p203956  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (MnAgentOfGovernment_AgentJica_Fund $e0 $x0)
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund) (Member $x0 government))

;; p203968  support 3 (occ 3)  size 4  root $e1 (event)  depth 4
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAppearOfAlsoEvOfAgentOfPerson $e1 $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Member $x0 person))

;; p203969  support 3 (occ 4)  size 4  root $e1 (event)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAppearOfAlsoEvOfAgent-Past $e1 $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e0))

;; p203970  support 3 (occ 4)  size 4  root $e1 (event)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAppearOfAlsoEvOfAgent_Past $e1 $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e1))

;; p203971  support 3 (occ 3)  size 4  root appear (constant)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAlsoEvOfAgentOfPerson-Past appear $e0 $x0)
(And (Agent $e0 $x0) (Also appear $e0) (Member $x0 person) (Past $e0))

;; p203973  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAgentOfPerson_AppearOfAlsoEv $e0 $e1 $x0)
(And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Member $x0 person))

;; p203974  support 3 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAgent_AppearOfAlsoEv_Past $e0 $e1 $x0)
(And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Past $e0))

;; p203975  support 3 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAgent_AppearOfAlsoEvOfPast $e0 $e1 $x0)
(And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Past $e1))

;; p203976  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (MnAgentOfSchool_Beneficiary_Buy $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school))

;; p203977  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (MnAgent_BeneficiaryOfHall_Buy $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall))

;; p203978  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (MnAgentOfCardinalityNum-GroupOfClimber_Abandon $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 abandon))

;; p203979  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (MnAgentOfCardinalityNum_Abandon_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon) (Theme $e0 $x1))

;; p203980  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000265 tierA-000280 tierA-000310
;;   meta-node: (MnAgent_Recipient_ThemeOfCardinalityNum $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p203981  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (MnAgentOfBiologist_CoAgent_Location $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x0 biologist))

;; p203982  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (MnAgent_CoAgentOfRanger_Location $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x1 ranger))

;; p203983  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (MnAgent_CoAgent_LocationOfSurvey $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x2 survey))

;; p203984  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (MnAgentOfBiologist_CoAgentOfRanger $e0 $x0 $x1)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $x0 biologist) (Member $x1 ranger))

;; p203985  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   meta-node: (MnAgentOfDelegation_Future_Time(WeekdayThursday $e0 $x0)
(And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation) (Time $e0 (Weekday thursday)))

;; p203986  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (MnAgentOfGroupOfClimber_Abandon_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon) (Theme $e0 $x1))

;; p203987  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   meta-node: (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost $e0 $x0)
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample) (Inheritance soil_sample sample) (Instrument $e0 post))

;; p203988  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnAgent_Teach_RecipientOfGroupOfChild $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 child) (Member $e0 teach) (Recipient $e0 $x1))

;; p203989  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnAgentOfElder_RecipientOfGroupOfChild $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 child) (Member $x0 elder) (Recipient $e0 $x1))

;; p203990  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnAgent_RecipientOfGroupOfChild_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p203991  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (MnAgent_Buy_ThemeOfGroupOfForklift $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1))

;; p203992  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   meta-node: (MnAgent_Examine_ThemeOfGroupOfSample $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $e0 examine) (Theme $e0 $x1))

;; p203993  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000382 tierA-000384
;;   meta-node: (MnAgentOfPhysician_ThemeOfGroupOfSample $e0 $x0 $x1)
(And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $x0 physician) (Theme $e0 $x1))

;; p203994  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   meta-node: (MnAgent_ThemeOfEveningFlightOfInheritanceFlight $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance evening_flight flight) (Member $x1 evening_flight) (Theme $e0 $x1))

;; p203995  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (MnAgent_ThemeOfLoanApplicationOfInheritanceApplication $e0 $x0 $x1)
(And (Agent $e0 $x0) (Inheritance loan_application application) (Member $x1 loan_application) (Theme $e0 $x1))

;; p203996  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   meta-node: (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery $e0 $x0)
(And (Agent $e0 $x0) (Inheritance night_delivery delivery) (Member $x0 licence) (Theme $e0 night_delivery))

;; p203997  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (MnAgentOfPotteryStudioOfInheritanceStudio_Buy $e0 $x0)
(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio))

;; p203998  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (MnAgentOfDiver_Location_Discover $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x0 diver))

;; p203999  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   meta-node: (MnAgentOfBiologist_Location_Work $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x0 biologist))

;; p204000  support 3 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   meta-node: (MnAgent_LocationOfSurvey_Work $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x1 survey))

;; p204001  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (MnAgentOfCurator_LocationOfHall $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator) (Member $x1 hall))

;; p204002  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (MnAgentOfCurator_Location_ThemePhotography $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator) (Theme $e0 photography))

;; p204003  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   meta-node: (MnAgentOfWelder_LocationOfFrame $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 welder) (Member $x1 frame))

;; p204004  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   meta-node: (MnAgent_LocationOfHall_ThemePhotography $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 hall) (Theme $e0 photography))

;; p204006  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (MnAgentOfFirm_Abandon_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm) (Theme $e0 $x1))

;; p204007  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (MnAgent_Abandon_ThemeOfNorthRoute $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 north_route) (Theme $e0 $x1))

;; p204009  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (MnAgent_Abandon_ThemeOfTender $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 tender) (Theme $e0 $x1))

;; p204011  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (MnAgentOfClerk_Answer_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x1))

;; p204012  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (MnAgentOfPilot_Answer_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot) (Theme $e0 $x1))

;; p204013  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (MnAgent_Answer_ThemeOfQuery $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 query) (Theme $e0 $x1))

;; p204014  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (MnAgent_Answer_ThemeOfTower $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 tower) (Theme $e0 $x1))

;; p204018  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAgentOfPerson_Appear_Past $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 appear) (Member $x0 person) (Past $e0))

;; p204019  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   meta-node: (MnAgentOfFreight_Arrive_Time(HourNum $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 arrive) (Member $x0 freight) (Time $e0 (Hour <num>)))

;; p204020  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (MnAgentOfDepot_Buy_Past $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0))

;; p204021  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (MnAgentOfDepot_Buy_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1))

;; p204023  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (MnAgentOfPotteryStudio_Buy_Past $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0))

;; p204024  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (MnAgentOfPotteryStudio_Buy_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1))

;; p204025  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (MnAgentOfSchool_Buy_Past $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0))

;; p204026  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (MnAgentOfSchool_Buy_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Theme $e0 $x1))

;; p204028  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (MnAgent_Buy_ThemeOfKiln $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1))

;; p204031  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   meta-node: (MnAgentOfCouncil_Cancel_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1))

;; p204032  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   meta-node: (MnAgentOfTutor_Cancel_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1))

;; p204033  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   meta-node: (MnAgent_Cancel_PatientOfAfternoonSession $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1))

;; p204034  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   meta-node: (MnAgent_Cancel_PatientOfSummerFair $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1))

;; p204035  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (MnAgent_Cause_ThemeEvOfDestroy $e0 $e1 $x0)
(And (Agent $e0 $x0) (Member $e0 cause) (Member $e1 destroy) (Theme $e0 $e1))

;; p204036  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (MnAgent_Cause_ThemeEvOfPatient $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 cause) (Patient $e1 $x1) (Theme $e0 $e1))

;; p204037  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (MnAgentOfBoard_Decide_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board) (Theme $e0 $x1))

;; p204038  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (MnAgentOfJudge_Decide_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge) (Theme $e0 $x1))

;; p204039  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (MnAgent_Decide_ThemeOfBudget $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 budget) (Theme $e0 $x1))

;; p204040  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (MnAgent_Decide_ThemeOfCase $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 case) (Theme $e0 $x1))

;; p204041  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (MnAgent_Decide_ThemeOfPossessionNextYear $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Possession $x1 next_year) (Theme $e0 $x1))

;; p204042  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (MnAgentOfDiver_Discover_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver) (Theme $e0 $x1))

;; p204043  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (MnAgentOfIntern_Discover_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern) (Theme $e0 $x1))

;; p204044  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (MnAgent_Discover_ThemeOfFile $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 file) (Theme $e0 $x1))

;; p204045  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (MnAgent_Discover_ThemeOfMissing $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 missing) (Theme $e0 $x1))

;; p204046  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (MnAgent_Discover_ThemeOfWreck $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1))

;; p204047  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (MnAgentOfGovernment_Fund_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 fund) (Member $x0 government) (Theme $e0 $x1))

;; p204048  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (MnAgentOfSchool_Give_Recipient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Recipient $e0 $x1))

;; p204049  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (MnAgentOfSchool_Give_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Theme $e0 $x1))

;; p204050  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (MnAgentOfTrainer_Give_Recipient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Recipient $e0 $x1))

;; p204051  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (MnAgentOfTrainer_Give_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Theme $e0 $x1))

;; p204052  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (MnAgent_Give_ThemeOfAnswer $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 answer) (Theme $e0 $x1))

;; p204053  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   meta-node: (MnAgent_Give_ThemeOfManifest $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 manifest) (Theme $e0 $x1))

;; p204054  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (MnAgent_Give_RecipientOfRecruit $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 recruit) (Recipient $e0 $x1))

;; p204055  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (MnAgent_Give_RecipientOfWinner $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 winner) (Recipient $e0 $x1))

;; p204056  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (MnAgentOfMuseum_Lend_Recipient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Recipient $e0 $x1))

;; p204057  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (MnAgentOfMuseum_Lend_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Theme $e0 $x1))

;; p204058  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (MnAgentOfNeighbour_Lend_RecipientRavi $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 ravi))

;; p204059  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (MnAgentOfNeighbour_Lend_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1))

;; p204060  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (MnAgent_Lend_RecipientOfGallery $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 gallery) (Recipient $e0 $x1))

;; p204061  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (MnAgent_Lend_ThemeOfGenerator $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 generator) (Theme $e0 $x1))

;; p204062  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (MnAgent_Make_PatientEvOfTheme $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x1))

;; p204063  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (MnAgent_Order_ThemeOfScan $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 order) (Member $x1 scan) (Theme $e0 $x1))

;; p204064  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   meta-node: (MnAgent_Order_ThemeOfOrdinalNumScan $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x1 <num> scan) (Theme $e0 $x1))

;; p204065  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   meta-node: (MnAgentOfClub_Postpone_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club) (Theme $e0 $x1))

;; p204066  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   meta-node: (MnAgent_Postpone_ThemeOfTournament $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 postpone) (Member $x1 tournament) (Theme $e0 $x1))

;; p204067  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (MnAgent_Reach_ThemeEvOfTheme $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x1))

;; p204068  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   meta-node: (MnAgent_Sign_PatientOfChart $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 sign) (Member $x1 chart) (Patient $e0 $x1))

;; p204069  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnAgentOfElder_Teach_Recipient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Recipient $e0 $x1))

;; p204070  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnAgentOfElder_Teach_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Theme $e0 $x1))

;; p204071  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (MnAgentOfPotter_Teach_Recipient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x1))

;; p204072  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (MnAgentOfPotter_Teach_ThemeGlazing $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Theme $e0 glazing))

;; p204073  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (MnAgent_Teach_RecipientOfApprentice $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 apprentice) (Recipient $e0 $x1))

;; p204074  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (MnAgent_Teach_ThemeOfDrill $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 drill) (Theme $e0 $x1))

;; p204075  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnAgent_Teach_ThemeOfSong $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 song) (Theme $e0 $x1))

;; p204076  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (MnAgent_PatientEvOfDecision-Theme $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x1))

;; p204077  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (MnAgent_ThemeEvOfDecision-Theme $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x1))

;; p204078  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (MnAgent_ThemeEvOfDestroy-Patient $e0 $e1 $x0 $x1)
(And (Agent $e0 $x0) (Member $e1 destroy) (Patient $e1 $x1) (Theme $e0 $e1))

;; p204079  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   meta-node: (MnAgentOfAirline_ThemeOfEveningFlight $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 airline) (Member $x1 evening_flight) (Theme $e0 $x1))

;; p204080  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   meta-node: (MnAgentOfBank_ThemeOfLoanApplication $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 bank) (Member $x1 loan_application) (Theme $e0 $x1))

;; p204081  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (MnAgentOfBoard_ThemeOfBudget $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 board) (Member $x1 budget) (Theme $e0 $x1))

;; p204082  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (MnAgentOfBoard_ThemeOfPossessionNextYear $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 board) (Possession $x1 next_year) (Theme $e0 $x1))

;; p204083  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   meta-node: (MnAgentOfClerk_ThemeOfQuery $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 clerk) (Member $x1 query) (Theme $e0 $x1))

;; p204084  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnAgentOfElder_ThemeOfSong $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 elder) (Member $x1 song) (Theme $e0 $x1))

;; p204085  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnAgentOfElder_Recipient_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204087  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (MnAgentOfFerry_ThemeOfDeparture $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 ferry) (Member $x1 departure) (Theme $e0 $x1))

;; p204089  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   meta-node: (MnAgentOfJudge_ThemeOfCase $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 judge) (Member $x1 case) (Theme $e0 $x1))

;; p204090  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (MnAgentOfMuseum_RecipientOfGallery $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 museum) (Member $x1 gallery) (Recipient $e0 $x1))

;; p204091  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (MnAgentOfMuseum_Recipient_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204092  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (MnAgentOfNeighbour_RecipientRavi_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1))

;; p204093  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000072 tierC-000089 tierC-000090
;;   meta-node: (MnAgentOfPerson_Past_Patient $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))

;; p204094  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000387 tierA-000388
;;   meta-node: (MnAgentOfPhysician_ThemeOfScan $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 physician) (Member $x1 scan) (Theme $e0 $x1))

;; p204095  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000387 tierA-000388
;;   meta-node: (MnAgentOfPhysician_ThemeOfOrdinalNumScan $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 physician) (Ordinal $x1 <num> scan) (Theme $e0 $x1))

;; p204096  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   meta-node: (MnAgentOfPilot_ThemeOfTower $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pilot) (Member $x1 tower) (Theme $e0 $x1))

;; p204097  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (MnAgentOfPotter_RecipientOfApprentice $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 potter) (Member $x1 apprentice) (Recipient $e0 $x1))

;; p204098  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (MnAgentOfPotter_Recipient_ThemeGlazing $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1) (Theme $e0 glazing))

;; p204099  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (MnAgentOfPotteryStudio_ThemeOfOrdinalNumBuy $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1))

;; p204100  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (MnAgentOfSchool_RecipientOfWinner $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 school) (Member $x1 winner) (Recipient $e0 $x1))

;; p204101  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (MnAgentOfSchool_Recipient_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204102  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (MnAgentOfTrainer_RecipientOfRecruit $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 trainer) (Member $x1 recruit) (Recipient $e0 $x1))

;; p204103  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (MnAgentOfTrainer_Recipient_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204104  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   meta-node: (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 warden) (Theme $e0 visitor) (Time $e0 (Weekday sunday)))

;; p204105  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (MnAgent_Recipient_ThemeOfAnswer $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 answer) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204106  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (MnAgent_RecipientOfApprentice_ThemeGlazing $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1) (Theme $e0 glazing))

;; p204107  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (MnAgent_ThemeOfBudget-PossessionNextYear $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 budget) (Possession $x1 next_year) (Theme $e0 $x1))

;; p204109  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (MnAgent_Recipient_ThemeOfDrill $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 drill) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204110  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (MnAgent_RecipientOfGallery_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204111  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (MnAgent_Recipient_ThemeOfGenerator $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 generator) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204112  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (MnAgent_ThemeOfKiln-OrdinalNumBuy $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1))

;; p204113  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   meta-node: (MnAgent_Recipient_ThemeOfManifest $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 manifest) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204114  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (MnAgent_RecipientOfRecruit_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204115  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnAgent_Recipient_ThemeOfSong $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 song) (Recipient $e0 $x2) (Theme $e0 $x1))

;; p204116  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (MnAgent_RecipientOfWinner_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1) (Theme $e0 $x2))

;; p204117  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (MnAgent_Past_ThemeOfOrdinalNumBuy $e0 $x0 $x1)
(And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1))

;; p204118  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   meta-node: (MnAgentDara_LocationOfLedger_Work $e0 $x0)
(And (Agent $e0 dara) (Location $e0 $x0) (Member $e0 work) (Member $x0 ledger))

;; p204121  support 3 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   meta-node: (MnAppearOfAlsoEvOfPast_Past $e1 $e0)
(And (Also appear $e0) (Member $e1 appear) (Past $e0) (Past $e1))

;; p204122  support 3 (occ 3)  size 4  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (MnBeforeEvOfFuture-Patient_Lunch $x0 $e0 $x1)
(And (Before $x0 $e0) (Future $e0) (Member $x0 lunch) (Patient $e0 $x1))

;; p204123  support 3 (occ 3)  size 4  root $x0 (entity)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (MnBeforeEvOfFuture-PatientOfDressRehearsal $x0 $e0 $x1)
(And (Before $x0 $e0) (Future $e0) (Member $x1 dress_rehearsal) (Patient $e0 $x1))

;; p204124  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (MnBeneficiaryOfHall_Buy_Past $e0 $x0)
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Past $e0))

;; p204125  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (MnBeneficiaryOfHall_Buy_Theme $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Theme $e0 $x1))

;; p204126  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (MnCan_MannerOfCardinalityNum-GroupOfWay $e0 $x0)
(And (Can $e0) (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0))

;; p204127  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnCan_MannerOfCardinalityNum-Random $e0 $x0)
(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random))

;; p204128  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (MnCan_MannerOfGroupOfWay_Define $e0 $x0)
(And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))

;; p204129  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (MnCan_MannerOfGroupOfWay_Theme $e0 $x0 $x1)
(And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))

;; p204130  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnCan_MannerOfRandom_Define $e0 $x0)
(And (Can $e0) (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))

;; p204131  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnCan_MannerOfRandom_Theme $e0 $x0 $x1)
(And (Can $e0) (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))

;; p204132  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (MnBuy_ThemeOfCardinalityNum-GroupOfForklift $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))

;; p204133  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (MnMannerOfCardinalityNum-GroupOfWay_Define $e0 $x0)
(And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))

;; p204134  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (MnMannerOfCardinalityNum-GroupOfWay_Theme $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))

;; p204135  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnMannerOfCardinalityNum-Random_Define $e0 $x0)
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))

;; p204136  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnMannerOfCardinalityNum-Random_Theme $e0 $x0 $x1)
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))

;; p204137  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   meta-node: (MnCoAgentOfRanger_LocationOfSurvey $e0 $x0 $x1)
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $x0 ranger) (Member $x1 survey))

;; p204138  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   meta-node: (MnExperiencer_LocationOfGate_Wait $e0 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait) (Member $x1 gate))

;; p204139  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   meta-node: (MnExperiencer_Discover_StimulusEvOfLocation $e0 $e1 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e0 discover) (Stimulus $e0 $e1))

;; p204140  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (MnExperiencer_StimulusEvOfLocation-Error $e0 $e1 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e1 error) (Stimulus $e0 $e1))

;; p204141  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (MnExperiencerOfAuditor_StimulusEvOfLocation $e0 $e1 $x0 $x1)
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x0 auditor) (Stimulus $e0 $e1))

;; p204143  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (MnBecome_Past_ResultEvOfExperiencer $e1 $e0 $x0)
(And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0))

;; p204145  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (MnExperiencerOfAuditor_StimulusEvOfError $e0 $e1 $x0)
(And (Experiencer $e0 $x0) (Member $e1 error) (Member $x0 auditor) (Stimulus $e0 $e1))

;; p204147  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   meta-node: (MnFuture_PatientOfDressRehearsalOfInheritanceRehearsal $e0 $x0)
(And (Future $e0) (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p204148  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnTeach_RecipientOfGroupOfChild_Theme $e0 $x0 $x1)
(And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204149  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnRecipientOfGroupOfChild_ThemeOfSong $e0 $x0 $x1)
(And (GroupOf $x0 child) (Member $x1 song) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204150  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (MnHolder_Require_ThemeOfGroupOfEgg $e0 $x0 $x1)
(And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))

;; p204151  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   meta-node: (MnBuy_Past_ThemeOfGroupOfForklift $e0 $x0)
(And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))

;; p204152  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (MnMannerOfGroupOfWay_ThemeOfGroupOfSequence $e0 $x0 $x1)
(And (GroupOf $x0 sequence) (GroupOf $x1 way) (Manner $e0 $x1) (Theme $e0 $x0))

;; p204153  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnMannerOfRandom_ThemeOfGroupOfSequence $e0 $x0 $x1)
(And (GroupOf $x0 sequence) (Manner $e0 $x1) (Member $x1 random) (Theme $e0 $x0))

;; p204154  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   meta-node: (MnMannerOfGroupOfWay_Define_Theme $e0 $x0 $x1)
(And (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))

;; p204155  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (MnHolder_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing $e0 $x0)
(And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p204156  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (MnHolderOfLathe_ThemeMonthlyServicingOfInheritanceMonthly $e0 $x0)
(And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Member $x0 lathe) (Theme $e0 monthly_servicing))

;; p204157  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   meta-node: (MnHolderOfLathe_ThemeMonthlyServicingOfInheritanceServicing $e0 $x0)
(And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Member $x0 lathe) (Theme $e0 monthly_servicing))

;; p204158  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000091 tierA-000092
;;   meta-node: (MnHolderOfPermit_Require_Theme $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit) (Theme $e0 $x1))

;; p204159  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   meta-node: (MnHolderOfRecipe_Require_Theme $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe) (Theme $e0 $x1))

;; p204160  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   meta-node: (MnHolderOfPermit_ThemeOfCountersignature $e0 $x0 $x1)
(And (Holder $e0 $x0) (Member $x0 permit) (Member $x1 countersignature) (Theme $e0 $x1))

;; p204161  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   meta-node: (MnCancel_PatientOfAfternoonSessionOfInheritanceSession $e0 $x0)
(And (Inheritance afternoon_session session) (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p204162  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   meta-node: (MnRequire_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing $e0)
(And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing))

;; p204163  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (MnAbandon_ThemeOfNorthRouteOfInheritanceNorth $e0 $x0)
(And (Inheritance north_route north) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))

;; p204164  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   meta-node: (MnAbandon_ThemeOfNorthRouteOfInheritanceRoute $e0 $x0)
(And (Inheritance north_route route) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))

;; p204165  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   meta-node: (MnCancel_PatientOfSummerFairOfInheritanceFair $e0 $x0)
(And (Inheritance summer_fair fair) (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))

;; p204167  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   meta-node: (MnLocation_Discover_ThemeOfWreck $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1))

;; p204168  support 3 (occ 3)  size 4  root $e1 (event)  depth 3
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   meta-node: (MnStimulusEvOfLocationOfLedger-Error $e1 $e0 $x0)
(And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger) (Stimulus $e1 $e0))

;; p204169  support 3 (occ 3)  size 4  root $e1 (event)  depth 3
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   meta-node: (MnDiscover_StimulusEvOfLocationOfLedger $e1 $e0 $x0)
(And (Location $e0 $x0) (Member $e1 discover) (Member $x0 ledger) (Stimulus $e1 $e0))

;; p204170  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   meta-node: (MnMannerOfRandom_Define_Theme $e0 $x0 $x1)
(And (Manner $e0 $x0) (Member $e0 define) (Member $x0 random) (Theme $e0 $x1))

;; p204171  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (MnAbandon_ThemeOfPossessionOfFirm $e0 $x0 $x1)
(And (Member $e0 abandon) (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1))

;; p204172  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   meta-node: (MnAbandon_ThemeOfTender-Possession $e0 $x0 $x1)
(And (Member $e0 abandon) (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0))

;; p204175  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (MnBuy_Past_ThemeOfKiln $e0 $x0)
(And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))

;; p204177  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   meta-node: (MnCause_ThemeEvOfDestroy-Patient $e0 $e1 $x0)
(And (Member $e0 cause) (Member $e1 destroy) (Patient $e1 $x0) (Theme $e0 $e1))

;; p204178  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   meta-node: (MnDecide_ThemeOfBudget-PossessionNextYear $e0 $x0)
(And (Member $e0 decide) (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0))

;; p204179  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   meta-node: (MnMake_PatientEvOfDecision-Theme $e1 $e0 $x0)
(And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0) (Theme $e0 $x0))

;; p204180  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   meta-node: (MnReach_ThemeEvOfDecision-Theme $e1 $e0 $x0)
(And (Member $e0 decision) (Member $e1 reach) (Theme $e0 $x0) (Theme $e1 $e0))

;; p204183  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   meta-node: (MnDiscover_ThemeOfFile-Missing $e0 $x0)
(And (Member $e0 discover) (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0))

;; p204184  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   meta-node: (MnGive_Recipient_ThemeOfAnswer $e0 $x0 $x1)
(And (Member $e0 give) (Member $x0 answer) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204185  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   meta-node: (MnGive_Recipient_ThemeOfManifest $e0 $x0 $x1)
(And (Member $e0 give) (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204186  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   meta-node: (MnGive_RecipientOfRecruit_Theme $e0 $x0 $x1)
(And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204187  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   meta-node: (MnGive_RecipientOfWinner_Theme $e0 $x0 $x1)
(And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204188  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   meta-node: (MnLend_RecipientOfGallery_Theme $e0 $x0 $x1)
(And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204189  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   meta-node: (MnLend_Recipient_ThemeOfGenerator $e0 $x0 $x1)
(And (Member $e0 lend) (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204191  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   meta-node: (MnTeach_RecipientOfApprentice_ThemeGlazing $e0 $x0)
(And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing))

;; p204192  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   meta-node: (MnTeach_Recipient_ThemeOfDrill $e0 $x0 $x1)
(And (Member $e0 teach) (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204193  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   meta-node: (MnTeach_Recipient_ThemeOfSong $e0 $x0 $x1)
(And (Member $e0 teach) (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p204194  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   meta-node: (MnThemeOfDeparture-PossessionOfFerry $e0 $x0 $x1)
(And (Member $x0 departure) (Member $x1 ferry) (Possession $x0 $x1) (Theme $e0 $x0))

;; p204195  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   meta-node: (MnPast_ThemeOfKiln-OrdinalNumBuy $e0 $x0)
(And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))

;; p204926  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000217 tierA-000218 tierA-000219
;;   meta-node: (MnAgentOfVet_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x0 vet) (Theme $e0 $x1))

;; p204931  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000399 tierA-000400 tierA-000401
;;   meta-node: (MnAgent_ThemeOfBridge $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 bridge) (Theme $e0 $x1))

;; p204940  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000277 tierA-000278
;;   meta-node: (MnAgent_ThemeOfMedal $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1))

;; p204941  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   meta-node: (MnAgent_ThemeOfPainting $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1))

;; p204945  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   meta-node: (MnAgent_ThemeOfWhistle $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1))

;; p204983  support 3 (occ 3)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   meta-node: (MnCracked_FeedPipeOfInheritancePipe $x0)
(And (Inheritance feed_pipe pipe) (Member $x0 cracked) (Member $x0 feed_pipe))

;; p205011  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   meta-node: (MnDestroy_PatientOfArchive $e0 $x0)
(And (Member $e0 destroy) (Member $x0 archive) (Patient $e0 $x0))

;; p205012  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   meta-node: (MnDestroy_PatientOfFootbridge $e0 $x0)
(And (Member $e0 destroy) (Member $x0 footbridge) (Patient $e0 $x0))

;; p205013  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (MnDestroy_PatientOfGreenhouse $e0 $x0)
(And (Member $e0 destroy) (Member $x0 greenhouse) (Patient $e0 $x0))

;; p205023  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000300
;;   meta-node: (MnLend_ThemeOfLadder $e0 $x0)
(And (Member $e0 lend) (Member $x0 ladder) (Theme $e0 $x0))

;; p205306  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   meta-node: (MnAgent_AgentJica_Fund_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund) (Theme $e0 $x1))

;; p205308  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (MnAgent_Beneficiary_Buy_Past $e0 $x0 $x1)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Past $e0))

;; p205309  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (MnAgent_Beneficiary_Buy_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Theme $e0 $x2))

;; p205310  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   meta-node: (MnAgent_CoAgent_Location_Work $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $e0 work))

;; p205311  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   meta-node: (MnAgent_Decide_Might_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 decide) (Might $e0) (Theme $e0 $x1))

;; p205312  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   meta-node: (MnAgent_Lend_RecipientRavi_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x1))

;; p205313  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   meta-node: (MnAgent_Receive_Source_Theme $e0 $x0 $x1 $x2)
(And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1) (Theme $e0 $x2))

;; p205314  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   meta-node: (MnBeneficiary_Buy_Past_Theme $e0 $x0 $x1)
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))

;; p205315  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   meta-node: (MnBecome_Past_Patient_ResultEv $e0 $e1 $x0)
(And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p205362  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000182 tierA-000184
;;   meta-node: (MnAgentOfCardinalityNum-GroupOfChild $e0 $x0)
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 child))

;; p205364  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000241
;;   meta-node: (MnAgent_Future_Arrive $e0 $x0)
(And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive))

;; p205366  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000177 tierA-000180
;;   meta-node: (MnAgent_Location_Walk $e0 $x0 $x1)
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 walk))

;; p205374  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   meta-node: (MnAgent_GiveUp_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 give_up) (Theme $e0 $x1))

;; p205375  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000351 tierC-000352
;;   meta-node: (MnAgent_Influence_Past $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 influence) (Past $e0))

;; p205376  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   meta-node: (MnAgent_Learn_Source $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1))

;; p205378  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   meta-node: (MnAgent_PutOff_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 put_off) (Theme $e0 $x1))

;; p205381  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   meta-node: (MnAgent_TurnDown_Theme $e0 $x0 $x1)
(And (Agent $e0 $x0) (Member $e0 turn_down) (Theme $e0 $x1))

;; p205396  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000279 tierC-000280 tierC-000314
;;   meta-node: (MnLocation_Find_Theme $e0 $x0 $x1)
(And (Location $e0 $x0) (Member $e0 find) (Theme $e0 $x1))

;; p205397  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000313 tierA-000322 tierA-000325
;;   meta-node: (MnLocation_Work_Might $e0 $x0)
(And (Location $e0 $x0) (Member $e0 work) (Might $e0))

;; p205398  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   meta-node: (MnPatientOfMeasureAgeNumYear-Founder $e0 $x0)
(And (Measure $x0 age <num> year) (Member $x0 founder) (Patient $e0 $x0))

;; p205401  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000055 tierA-000066 tierA-000070
;;   meta-node: (MnBegin_Might_Patient $e0 $x0)
(And (Member $e0 begin) (Might $e0) (Patient $e0 $x0))

;; p205402  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   meta-node: (MnBorrow_Source_Theme $e0 $x0 $x1)
(And (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1))

;; p205407  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000091 tierC-000297 tierC-000298
;;   meta-node: (MnDirect_Past_Patient $e0 $x0)
(And (Member $e0 direct) (Past $e0) (Patient $e0 $x0))

;; p205526  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000144 tierA-000149 tierA-000154
;;   meta-node: (MnAgent_CallOff $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 call_off))

;; p205533  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000077 tierA-000081
;;   meta-node: (MnAgent_Permit $e0 $x0)
(And (Agent $e0 $x0) (Member $e0 permit))

;; p205538  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000049 tierA-000302 tierA-000304
;;   meta-node: (MnAgentOfCrew $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 crew))

;; p205540  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000376 tierA-000381 tierA-000386
;;   meta-node: (MnAgentOfDoctor $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 doctor))

;; p205548  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000173 tierA-000174 tierA-000175
;;   meta-node: (MnAgentOfShepherd $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 shepherd))

;; p205549  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   meta-node: (MnAgentOfStorm $e0 $x0)
(And (Agent $e0 $x0) (Member $x0 storm))

;; p205560  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000311 tierA-000312 tierA-000313
;;   meta-node: (MnAgentAna_Work $e0)
(And (Agent $e0 ana) (Member $e0 work))

;; p205564  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000333 tierC-000334
;;   meta-node: (MnBeforeEv_Patient $e0 $e1 $x0)
(And (Before $e0 $e1) (Patient $e0 $x0))

;; p205578  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   meta-node: (MnGoal_Walk $e0 $x0)
(And (Goal $e0 $x0) (Member $e0 walk))

;; p205579  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000182 tierA-000184
;;   meta-node: (MnGoalOfPier $e0 $x0)
(And (Goal $e0 $x0) (Member $x0 pier))

;; p205582  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000090 tierA-000095
;;   meta-node: (MnHolder_Need $e0 $x0)
(And (Holder $e0 $x0) (Member $e0 need))

;; p205589  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000173 tierA-000174 tierA-000175
;;   meta-node: (MnLocationOfRidge $e0 $x0)
(And (Location $e0 $x0) (Member $x0 ridge))

;; p205590  support 3 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000025 tierC-000026 tierC-000280
;;   meta-node: (MnLocation_Ongoing $e0 $x0)
(And (Location $e0 $x0) (Ongoing $e0))

;; p205596  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000199 tierC-000200 tierC-000358
;;   meta-node: (MnBear_Past $e0)
(And (Member $e0 bear) (Past $e0))

;; p205600  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000284 tierC-000341 tierC-000342
;;   meta-node: (MnConduct_Past $e0)
(And (Member $e0 conduct) (Past $e0))

;; p205605  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000056 tierA-000060 tierA-000071
;;   meta-node: (MnEnd_Patient $e0 $x0)
(And (Member $e0 end) (Patient $e0 $x0))

;; p205608  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000163 tierC-000179 tierC-000180
;;   meta-node: (MnForm_Patient $e0 $x0)
(And (Member $e0 form) (Patient $e0 $x0))

;; p205616  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000023 tierC-000024 tierC-000094
;;   meta-node: (MnSpeak_Past $e0)
(And (Member $e0 speak) (Past $e0))

;; p205617  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000075 tierC-000100 tierC-000338
;;   meta-node: (MnSucceed_Past $e0)
(And (Member $e0 succeed) (Past $e0))

;; p205643  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000193 tierC-000194 tierC-000316
;;   meta-node: (MnPast_TimeLater $e0)
(And (Past $e0) (Time $e0 later))

;; ==================== SUBSUMED UNITS: 714 of 1652 rooted-subtree units (k = 4, support >= 3 of 762 records) ====================

;; p200250  support 14 (occ 14)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200249 (MnAgent_Buy_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))

;; p200251  support 14 (occ 14)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200249 (MnAgent_Buy_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))

;; p200252  support 14 (occ 14)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200249 (MnAgent_Buy_Past_Theme); not a proposal
(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))

;; p200255  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200249 (MnAgent_Buy_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy))

;; p200256  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200249 (MnAgent_Buy_Past_Theme); not a proposal
(And (Member $e0 buy) (Past $e0))

;; p200257  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200249 (MnAgent_Buy_Past_Theme); not a proposal
(And (Member $e0 buy) (Theme $e0 $x0))

;; p200329  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200326 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))

;; p200330  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200326 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))

;; p200332  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200326 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p200338  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200326 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 give))

;; p200340  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200326 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Member $e0 give) (Recipient $e0 $x0))

;; p200341  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200326 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Member $e0 give) (Theme $e0 $x0))

;; p200481  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
;;   subsumed by p200470 (MnAgent_Answer_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 answer))

;; p200483  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p200471 (MnAgent_Teach_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 teach))

;; p200486  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
;;   subsumed by p200470 (MnAgent_Answer_Theme); not a proposal
(And (Member $e0 answer) (Theme $e0 $x0))

;; p200489  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p200471 (MnAgent_Teach_Recipient); not a proposal
(And (Member $e0 teach) (Recipient $e0 $x0))

;; p200559  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p200551 (MnAgent_Lend_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend))

;; p200563  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
;;   subsumed by p200550 (MnAgent_Decide_Theme); not a proposal
(And (Member $e0 decide) (Theme $e0 $x0))

;; p200675  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   subsumed by p200661 (MnAgent_Abandon_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 abandon))

;; p200676  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000224 tierA-000226
;;   subsumed by p200662 (MnAgent_Destroy_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 destroy))

;; p200677  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   subsumed by p200663 (MnAgent_Reject_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 reject))

;; p200678  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   subsumed by p200664 (MnAgent_Repair_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 repair))

;; p200680  support 8 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p200620 (MnAgentOfSchool_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 school))

;; p200681  support 8 (occ 20)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   subsumed by p200621 (MnAgentOfPossessionOfPerson); not a proposal
(And (Agent $e0 $x0) (Possession $x0 $x1))

;; p200685  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   subsumed by p200661 (MnAgent_Abandon_Theme); not a proposal
(And (Member $e0 abandon) (Theme $e0 $x0))

;; p200687  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   subsumed by p200663 (MnAgent_Reject_Theme); not a proposal
(And (Member $e0 reject) (Theme $e0 $x0))

;; p200688  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   subsumed by p200664 (MnAgent_Repair_Patient); not a proposal
(And (Member $e0 repair) (Patient $e0 $x0))

;; p200823  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p200806 (MnAgent_Discover_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 discover))

;; p200824  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   subsumed by p200807 (MnAgent_Postpone_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 postpone))

;; p200825  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p200760 (MnAgentOfDepot_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 depot))

;; p200827  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000077 tierC-000078
;;   subsumed by p200762 (MnBeforeEvOfPast_Past); not a proposal
(And (Before $e0 $e1) (Past $e0))

;; p200828  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000077 tierC-000078
;;   subsumed by p200762 (MnBeforeEvOfPast_Past); not a proposal
(And (Before $e0 $e1) (Past $e1))

;; p200833  support 7 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000072
;;   subsumed by p200808 (MnBuild_Past_Patient); not a proposal
(And (Member $e0 build) (Past $e0))

;; p200834  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000145 tierA-000148 tierA-000150
;;   subsumed by p200805 (MnAgent_Cancel_Patient); not a proposal
(And (Member $e0 cancel) (Patient $e0 $x0))

;; p200835  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000300 tierA-000301 tierA-000303
;;   subsumed by p200809 (MnLend_Recipient_Theme); not a proposal
(And (Member $e0 lend) (Recipient $e0 $x0))

;; p200836  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   subsumed by p200807 (MnAgent_Postpone_Theme); not a proposal
(And (Member $e0 postpone) (Theme $e0 $x0))

;; p200966  support 6 (occ 10)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   subsumed by p200864 (MnAgentOfPossessionOfPerson_Past); not a proposal
(And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))

;; p200968  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p200865 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0))

;; p200969  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p200865 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Theme $e0 $x1))

;; p200970  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p200866 (MnPast_ThemeOfCardinalityNum-GroupOfForklift); not a proposal
(And (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))

;; p201059  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   subsumed by p201048 (MnAgent_Lend_Recipient_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1))

;; p201060  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   subsumed by p201049 (MnAgent_Repair_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))

;; p201061  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   subsumed by p201050 (MnAgent_Teach_Recipient_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 $x1))

;; p201062  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p200865 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p201063  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p200866 (MnPast_ThemeOfCardinalityNum-GroupOfForklift); not a proposal
(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Theme $e0 $x0))

;; p201065  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   subsumed by p201049 (MnAgent_Repair_Past_Patient); not a proposal
(And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))

;; p201066  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   subsumed by p201050 (MnAgent_Teach_Recipient_Theme); not a proposal
(And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p201084  support 6 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000071
;;   subsumed by p201058 (MnAgent_Build_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 build))

;; p201085  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p200865 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Member $x0 hall))

;; p201086  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p200865 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Theme $e0 $x1))

;; p201088  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p200866 (MnPast_ThemeOfCardinalityNum-GroupOfForklift); not a proposal
(And (GroupOf $x0 forklift) (Theme $e0 $x0))

;; p201093  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   subsumed by p201049 (MnAgent_Repair_Past_Patient); not a proposal
(And (Member $e0 repair) (Past $e0))

;; p201094  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   subsumed by p201050 (MnAgent_Teach_Recipient_Theme); not a proposal
(And (Member $e0 teach) (Theme $e0 $x0))

;; p201095  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000089 tierC-000090 tierC-000131
;;   subsumed by p201067 (MnWrite_Past_Patient); not a proposal
(And (Member $e0 write) (Past $e0))

;; p201096  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000089 tierC-000090 tierC-000131
;;   subsumed by p201067 (MnWrite_Past_Patient); not a proposal
(And (Member $e0 write) (Patient $e0 $x0))

;; p201098  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p200971 (MnPast_ThemeOfKiln); not a proposal
(And (Member $x0 kiln) (Theme $e0 $x0))

;; p201404  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201162 (MnAgentOfSchool_BeneficiaryOfHall); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school))

;; p201405  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201162 (MnAgentOfSchool_BeneficiaryOfHall); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall))

;; p201406  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201167 (MnAgentOfCardinalityNum-GroupOfClimber_Theme); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Theme $e0 $x1))

;; p201407  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p201169 (MnAgent_ThemeOfCardinalityNum-GroupOfForklift); not a proposal
(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Theme $e0 $x1))

;; p201408  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201176 (MnAgentOfPotteryStudioOfInheritanceStudio_Past); not a proposal
(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio))

;; p201409  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201179 (MnAgent_LocationOfPoint_Theme); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 point))

;; p201411  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   subsumed by p201180 (MnAgentOfClub_ThemeOfTournament); not a proposal
(And (Agent $e0 $x0) (Member $x0 club) (Theme $e0 $x1))

;; p201412  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p201181 (MnAgentOfDepot_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 depot) (Past $e0))

;; p201413  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201183 (MnAgentOfElectrician_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0))

;; p201414  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201182 (MnAgentOfElectrician_PatientOfYardFloodlight); not a proposal
(And (Agent $e0 $x0) (Member $x0 electrician) (Patient $e0 $x1))

;; p201415  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201176 (MnAgentOfPotteryStudioOfInheritanceStudio_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0))

;; p201416  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201177 (MnAgentOfPotteryStudioOfInheritanceStudio_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Theme $e0 $x1))

;; p201417  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201163 (MnAgentOfSchool_Beneficiary_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 school) (Past $e0))

;; p201418  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201184 (MnAgentOfPotteryStudio_ThemeOfKiln); not a proposal
(And (Agent $e0 $x0) (Member $x1 kiln) (Theme $e0 $x1))

;; p201419  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201168 (MnAgentOfCardinalityNum_ThemeOfNorthRoute); not a proposal
(And (Agent $e0 $x0) (Member $x1 north_route) (Theme $e0 $x1))

;; p201420  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   subsumed by p201180 (MnAgentOfClub_ThemeOfTournament); not a proposal
(And (Agent $e0 $x0) (Member $x1 tournament) (Theme $e0 $x1))

;; p201421  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201178 (MnAgent_PatientOfYardFloodlightOfInheritanceFloodlight); not a proposal
(And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Patient $e0 $x1))

;; p201424  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201189 (MnBeneficiaryOfHall_ThemeOfProjector); not a proposal
(And (Beneficiary $e0 $x0) (Member $x1 projector) (Theme $e0 $x1))

;; p201427  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201191 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (GroupOf $x0 lemon) (Past $e0) (Theme $e0 $x0))

;; p201428  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201192 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p201429  support 5 (occ 5)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201193 (MnThemeOfNorthRouteOfInheritanceNorth-InheritanceRoute); not a proposal
(And (Inheritance north_route north) (Inheritance north_route route) (Member $x0 north_route))

;; p201430  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201174 (MnAgent_ThemeOfNorthRouteOfInheritanceNorth); not a proposal
(And (Inheritance north_route north) (Member $x0 north_route) (Theme $e0 $x0))

;; p201431  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201175 (MnAgent_ThemeOfNorthRouteOfInheritanceRoute); not a proposal
(And (Inheritance north_route route) (Member $x0 north_route) (Theme $e0 $x0))

;; p201432  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p201194 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Inheritance shoreline_survey survey) (Member $x0 shoreline_survey) (Patient $e0 $x0))

;; p201433  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201178 (MnAgent_PatientOfYardFloodlightOfInheritanceFloodlight); not a proposal
(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Patient $e0 $x0))

;; p201434  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201179 (MnAgent_LocationOfPoint_Theme); not a proposal
(And (Location $e0 $x0) (Member $x0 point) (Theme $e0 $x1))

;; p201436  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201192 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p201437  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201191 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (Member $x0 crate) (Past $e0) (Theme $e0 $x0))

;; p201439  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201190 (MnBeneficiary_Past_ThemeOfProjector); not a proposal
(And (Member $x0 projector) (Past $e0) (Theme $e0 $x0))

;; p201440  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p201194 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Member $x0 shoreline_survey) (Patient $e0 $x0) (Time $e0 dawn))

;; p201441  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201188 (MnAgent_Past_PatientOfYardFloodlight); not a proposal
(And (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0))

;; p201534  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201192 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest))

;; p201538  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201174 (MnAgent_ThemeOfNorthRouteOfInheritanceNorth); not a proposal
(And (Inheritance north_route north) (Member $x0 north_route))

;; p201539  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201175 (MnAgent_ThemeOfNorthRouteOfInheritanceRoute); not a proposal
(And (Inheritance north_route route) (Member $x0 north_route))

;; p201541  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p201194 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Inheritance shoreline_survey survey) (Member $x0 shoreline_survey))

;; p201572  support 5 (occ 5)  size 2  root north_route (constant)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201193 (MnThemeOfNorthRouteOfInheritanceNorth-InheritanceRoute); not a proposal
(And (Inheritance north_route north) (Inheritance north_route route))

;; p201633  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201163 (MnAgentOfSchool_Beneficiary_Past); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0))

;; p201634  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201164 (MnAgentOfSchool_Beneficiary_Theme); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Theme $e0 $x2))

;; p201635  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201167 (MnAgentOfCardinalityNum-GroupOfClimber_Theme); not a proposal
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber))

;; p201638  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201179 (MnAgent_LocationOfPoint_Theme); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e0 $x2))

;; p201639  support 5 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000072
;;   subsumed by p201623 (MnAgent_Build_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 build) (Past $e0))

;; p201642  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201191 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (GroupOf $x0 lemon) (Member $x0 crate) (Theme $e0 $x0))

;; p201675  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201162 (MnAgentOfSchool_BeneficiaryOfHall); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1))

;; p201678  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201167 (MnAgentOfCardinalityNum-GroupOfClimber_Theme); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 climber))

;; p201681  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000319
;;   subsumed by p201637 (MnAgent_Location_Work); not a proposal
(And (Agent $e0 $x0) (Member $e0 work))

;; p201682  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000392 tierA-000398
;;   subsumed by p201410 (MnAgentOfAutomobile_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 automobile))

;; p201683  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   subsumed by p201180 (MnAgentOfClub_ThemeOfTournament); not a proposal
(And (Agent $e0 $x0) (Member $x0 club))

;; p201684  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201182 (MnAgentOfElectrician_PatientOfYardFloodlight); not a proposal
(And (Agent $e0 $x0) (Member $x0 electrician))

;; p201687  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201176 (MnAgentOfPotteryStudioOfInheritanceStudio_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 pottery_studio))

;; p201693  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201167 (MnAgentOfCardinalityNum-GroupOfClimber_Theme); not a proposal
(And (Cardinality $x0 <num>) (GroupOf $x0 climber))

;; p201694  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   subsumed by p201641 (MnThemeOfCardinalityNum-GroupOfEgg); not a proposal
(And (Cardinality $x0 <num>) (GroupOf $x0 egg))

;; p201695  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
;;   subsumed by p201636 (MnAgent_CoAgent_Location); not a proposal
(And (CoAgent $e0 $x0) (Location $e0 $x1))

;; p201698  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   subsumed by p201641 (MnThemeOfCardinalityNum-GroupOfEgg); not a proposal
(And (GroupOf $x0 egg) (Theme $e0 $x0))

;; p201699  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201191 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (GroupOf $x0 lemon) (Theme $e0 $x0))

;; p201702  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201179 (MnAgent_LocationOfPoint_Theme); not a proposal
(And (Location $e0 $x0) (Member $x0 point))

;; p201710  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201192 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p201711  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   subsumed by p201643 (MnThemeOfBudget-PossessionNextYear); not a proposal
(And (Member $x0 budget) (Theme $e0 $x0))

;; p201713  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201191 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (Member $x0 crate) (Theme $e0 $x0))

;; p201715  support 5 (occ 5)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p201438 (MnTender_PossessionOfFirm); not a proposal
(And (Member $x0 firm) (Possession $x1 $x0))

;; p201717  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201168 (MnAgentOfCardinalityNum_ThemeOfNorthRoute); not a proposal
(And (Member $x0 north_route) (Theme $e0 $x0))

;; p201718  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201189 (MnBeneficiaryOfHall_ThemeOfProjector); not a proposal
(And (Member $x0 projector) (Theme $e0 $x0))

;; p201720  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p201194 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Member $x0 shoreline_survey) (Patient $e0 $x0))

;; p201721  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p201438 (MnTender_PossessionOfFirm); not a proposal
(And (Member $x0 tender) (Possession $x0 $x1))

;; p201722  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   subsumed by p201180 (MnAgentOfClub_ThemeOfTournament); not a proposal
(And (Member $x0 tournament) (Theme $e0 $x0))

;; p201723  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201178 (MnAgent_PatientOfYardFloodlightOfInheritanceFloodlight); not a proposal
(And (Member $x0 yard_floodlight) (Patient $e0 $x0))

;; p201725  support 5 (occ 7)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p201423 (MnAgent_ThemeEvOfPatient); not a proposal
(And (Patient $e0 $x0) (Theme $e1 $e0))

;; p201726  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201192 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Patient $e0 $x0) (Time $e0 (Month september)))

;; p201727  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p201194 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Patient $e0 $x0) (Time $e0 dawn))

;; p201728  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   subsumed by p201643 (MnThemeOfBudget-PossessionNextYear); not a proposal
(And (Possession $x0 next_year) (Theme $e0 $x0))

;; p202763  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p201838 (MnAgentOfGovernment_AgentJica_Theme); not a proposal
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $x0 government))

;; p202768  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201879 (MnAgentOfChef_ThemeOfGroupOfLemon); not a proposal
(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Theme $e0 $x1))

;; p202770  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p201883 (MnAgentOfRescueTeamOfInheritanceTeam_Theme); not a proposal
(And (Agent $e0 $x0) (Inheritance rescue_team team) (Member $x0 rescue_team))

;; p202771  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   subsumed by p201889 (MnAgentOfBiologist_LocationOfSurvey); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 biologist))

;; p202772  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201890 (MnAgentOfDiver_LocationOfPoint); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver))

;; p202773  support 4 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   subsumed by p201889 (MnAgentOfBiologist_LocationOfSurvey); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 survey))

;; p202774  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201893 (MnAgentOfCompany_LocationEskisehir_LocationTurkey); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company))

;; p202775  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201900 (MnAgentOfCompany_LocationKazakhstan_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company))

;; p202776  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201893 (MnAgentOfCompany_LocationEskisehir_LocationTurkey); not a proposal
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company))

;; p202779  support 4 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201895 (MnAgentOfCompany_LocationEskisehir_Build); not a proposal
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company))

;; p202781  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p201920 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1))

;; p202782  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p201921 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1))

;; p202783  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201924 (MnAgentOfChef_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 chef) (Past $e0))

;; p202784  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201879 (MnAgentOfChef_ThemeOfGroupOfLemon); not a proposal
(And (Agent $e0 $x0) (Member $x0 chef) (Theme $e0 $x1))

;; p202786  support 4 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201896 (MnAgentOfCompany_LocationEskisehir_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 company) (Past $e0))

;; p202787  support 4 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201897 (MnAgentOfCompany_LocationEskisehir_Patient); not a proposal
(And (Agent $e0 $x0) (Member $x0 company) (Patient $e0 $x1))

;; p202788  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p201927 (MnAgentOfCouncil_PatientOfSummerFair); not a proposal
(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))

;; p202790  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201891 (MnAgentOfDiver_Location_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 diver) (Theme $e0 $x1))

;; p202791  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   subsumed by p201929 (MnAgentOfEditor_ThemeOfManuscript); not a proposal
(And (Agent $e0 $x0) (Member $x0 editor) (Theme $e0 $x1))

;; p202792  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p201931 (MnAgentOfFirm_ThemeOfTender); not a proposal
(And (Agent $e0 $x0) (Member $x0 firm) (Theme $e0 $x1))

;; p202793  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p201838 (MnAgentOfGovernment_AgentJica_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 government) (Theme $e0 $x1))

;; p202794  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p201933 (MnAgentOfIntern_ThemeOfFile); not a proposal
(And (Agent $e0 $x0) (Member $x0 intern) (Theme $e0 $x1))

;; p202795  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201937 (MnAgentOfMechanic_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0))

;; p202796  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201935 (MnAgentOfMechanic_PatientOfGearbox); not a proposal
(And (Agent $e0 $x0) (Member $x0 mechanic) (Patient $e0 $x1))

;; p202797  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   subsumed by p201938 (MnAgentOfPanel_ThemeOfProposal); not a proposal
(And (Agent $e0 $x0) (Member $x0 panel) (Theme $e0 $x1))

;; p202800  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p201883 (MnAgentOfRescueTeamOfInheritanceTeam_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 rescue_team) (Theme $e0 $x1))

;; p202801  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p201942 (MnAgentOfTutor_PatientOfAfternoonSession); not a proposal
(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))

;; p202802  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p201882 (MnAgent_PatientOfAfternoonSessionOfInheritanceSession); not a proposal
(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))

;; p202803  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201880 (MnAgent_ThemeOfGroupOfLemon-Crate); not a proposal
(And (Agent $e0 $x0) (Member $x1 crate) (Theme $e0 $x1))

;; p202805  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p201933 (MnAgentOfIntern_ThemeOfFile); not a proposal
(And (Agent $e0 $x0) (Member $x1 file) (Theme $e0 $x1))

;; p202806  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201935 (MnAgentOfMechanic_PatientOfGearbox); not a proposal
(And (Agent $e0 $x0) (Member $x1 gearbox) (Patient $e0 $x1))

;; p202808  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201898 (MnAgent_LocationEskisehir_PatientOfHotel); not a proposal
(And (Agent $e0 $x0) (Member $x1 hotel) (Patient $e0 $x1))

;; p202809  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p201911 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Agent $e0 $x0) (Member $x1 lane) (Theme $e0 $x1))

;; p202811  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   subsumed by p201929 (MnAgentOfEditor_ThemeOfManuscript); not a proposal
(And (Agent $e0 $x0) (Member $x1 manuscript) (Theme $e0 $x1))

;; p202812  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p201934 (MnAgentOfIntern_ThemeOfMissing); not a proposal
(And (Agent $e0 $x0) (Member $x1 missing) (Theme $e0 $x1))

;; p202813  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201877 (MnAgent_Beneficiary_ThemeOfProjector); not a proposal
(And (Agent $e0 $x0) (Member $x1 projector) (Theme $e0 $x1))

;; p202814  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   subsumed by p201938 (MnAgentOfPanel_ThemeOfProposal); not a proposal
(And (Agent $e0 $x0) (Member $x1 proposal) (Theme $e0 $x1))

;; p202816  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p201940 (MnAgentOfRescueTeam_ThemeOfSearch); not a proposal
(And (Agent $e0 $x0) (Member $x1 search) (Theme $e0 $x1))

;; p202817  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201936 (MnAgentOfMechanic_PatientOfSeized); not a proposal
(And (Agent $e0 $x0) (Member $x1 seized) (Patient $e0 $x1))

;; p202819  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p201884 (MnAgent_PatientOfSummerFairOfInheritanceFair); not a proposal
(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))

;; p202821  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p201931 (MnAgentOfFirm_ThemeOfTender); not a proposal
(And (Agent $e0 $x0) (Member $x1 tender) (Theme $e0 $x1))

;; p202822  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201952 (MnAgent_Past_ThemeOfView); not a proposal
(And (Agent $e0 $x0) (Member $x1 view) (Theme $e0 $x1))

;; p202823  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   subsumed by p201922 (MnAgentOfBoard_ThemeOfVote); not a proposal
(And (Agent $e0 $x0) (Member $x1 vote) (Theme $e0 $x1))

;; p202824  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201892 (MnAgent_Location_ThemeOfWreck); not a proposal
(And (Agent $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1))

;; p202827  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201953 (MnAgent_ThemeOfView-PossessionFreeSoilParty); not a proposal
(And (Agent $e0 $x0) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p202828  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201954 (MnAgent_ThemeOfView-PossessionRepublicanParty); not a proposal
(And (Agent $e0 $x0) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p202829  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p201960 (MnBeforeEvOfPatientOfDressRehearsal_Lunch); not a proposal
(And (Before $x0 $e0) (Member $x0 lunch) (Patient $e0 $x1))

;; p202830  support 4 (occ 4)  size 3  root $x0 (entity)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p201959 (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal); not a proposal
(And (Before $x0 $e0) (Member $x1 dress_rehearsal) (Patient $e0 $x1))

;; p202832  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201961 (MnCan_MannerOfCardinalityNum_Define); not a proposal
(And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0))

;; p202833  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201963 (MnCan_Manner_ThemeOfGroupOfSequence); not a proposal
(And (Can $e0) (GroupOf $x0 sequence) (Theme $e0 $x0))

;; p202834  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p201965 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p202835  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201961 (MnCan_MannerOfCardinalityNum_Define); not a proposal
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define))

;; p202836  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201962 (MnCan_MannerOfCardinalityNum_Theme); not a proposal
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Theme $e0 $x1))

;; p202837  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   subsumed by p201878 (MnAgent_Buy_ThemeOfCardinalityNum); not a proposal
(And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))

;; p202838  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p201966 (MnHave_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))

;; p202840  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p201975 (MnExperiencer_StimulusEvOfLocationOfLedger); not a proposal
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Stimulus $e0 $e1))

;; p202842  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201976 (MnForEvOfPortray_Win_Past); not a proposal
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray))

;; p202843  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201976 (MnForEvOfPortray_Win_Past); not a proposal
(And (For $e0 $e1) (Member $e1 portray) (Past $e0))

;; p202844  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201977 (MnForEvOfPortray_Win_Theme); not a proposal
(And (For $e0 $e1) (Member $e1 portray) (Theme $e0 $x0))

;; p202845  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201978 (MnForEv_Win_ThemeOfEmmy); not a proposal
(And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))

;; p202846  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201982 (MnFuture_PatientOfAppleHarvestOfInheritanceHarvest); not a proposal
(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p202847  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p201965 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p202848  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p201966 (MnHave_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))

;; p202849  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   subsumed by p201967 (MnHolder_ThemeOfCardinalityNum-GroupOfEgg); not a proposal
(And (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0))

;; p202850  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   subsumed by p201968 (MnRequire_ThemeOfCardinalityNum-GroupOfEgg); not a proposal
(And (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0))

;; p202851  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201963 (MnCan_Manner_ThemeOfGroupOfSequence); not a proposal
(And (GroupOf $x0 sequence) (Manner $e0 $x1) (Theme $e0 $x0))

;; p202852  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201964 (MnCan_Define_ThemeOfGroupOfSequence); not a proposal
(And (GroupOf $x0 sequence) (Member $e0 define) (Theme $e0 $x0))

;; p202854  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   subsumed by p201971 (MnHolderOfRecipe_ThemeOfCardinalityNum); not a proposal
(And (Holder $e0 $x0) (Member $x0 recipe) (Theme $e0 $x1))

;; p202855  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p201882 (MnAgent_PatientOfAfternoonSessionOfInheritanceSession); not a proposal
(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p202856  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p201959 (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal); not a proposal
(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p202858  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p201884 (MnAgent_PatientOfSummerFairOfInheritanceFair); not a proposal
(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))

;; p202861  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p201888 (MnAgent_LocationOfPoint_Discover); not a proposal
(And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point))

;; p202863  support 4 (occ 4)  size 3  root $e1 (event)  depth 3
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p201975 (MnExperiencer_StimulusEvOfLocationOfLedger); not a proposal
(And (Location $e0 $x0) (Member $x0 ledger) (Stimulus $e1 $e0))

;; p202864  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201892 (MnAgent_Location_ThemeOfWreck); not a proposal
(And (Location $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1))

;; p202866  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201898 (MnAgent_LocationEskisehir_PatientOfHotel); not a proposal
(And (Location $e0 eskisehir) (Member $x0 hotel) (Patient $e0 $x0))

;; p202869  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201907 (MnAgent_LocationTurkey_PatientOfHotel); not a proposal
(And (Location $e0 turkey) (Member $x0 hotel) (Patient $e0 $x0))

;; p202870  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p201911 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Member $e0 block) (Member $x0 lane) (Theme $e0 $x0))

;; p202873  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201919 (MnAgent_Build_PatientOfHotel); not a proposal
(And (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))

;; p202876  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p201920 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0))

;; p202877  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p201921 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Member $e0 decision) (Member $e1 reach) (Theme $e1 $e0))

;; p202880  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201978 (MnForEv_Win_ThemeOfEmmy); not a proposal
(And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))

;; p202883  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201981 (MnForEv_Past_ThemeOfEmmy); not a proposal
(And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p202885  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202023 (MnThemeOfTender-PossessionOfFirm); not a proposal
(And (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1))

;; p202886  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201946 (MnAgent_Past_PatientOfGearbox); not a proposal
(And (Member $x0 gearbox) (Past $e0) (Patient $e0 $x0))

;; p202887  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202025 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)))

;; p202888  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202025 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 morning))

;; p202889  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201947 (MnAgent_Past_PatientOfHotel); not a proposal
(And (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p202890  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201950 (MnAgent_Past_PatientOfSeized); not a proposal
(And (Member $x0 seized) (Past $e0) (Patient $e0 $x0))

;; p202891  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201952 (MnAgent_Past_ThemeOfView); not a proposal
(And (Member $x0 view) (Past $e0) (Theme $e0 $x0))

;; p202893  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201956 (MnAgent_Past_ThemeOfPossessionFreeSoilParty); not a proposal
(And (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p202894  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201957 (MnAgent_Past_ThemeOfPossessionRepublicanParty); not a proposal
(And (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203144  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p202857 (MnThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing))

;; p203145  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p202857 (MnThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p203379  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p201838 (MnAgentOfGovernment_AgentJica_Theme); not a proposal
(And (Agent $e0 $x0) (Agent $e0 jica) (Theme $e0 $x1))

;; p203382  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p201888 (MnAgent_LocationOfPoint_Discover); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover))

;; p203385  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201893 (MnAgentOfCompany_LocationEskisehir_LocationTurkey); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Location $e0 turkey))

;; p203386  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201895 (MnAgentOfCompany_LocationEskisehir_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build))

;; p203387  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201896 (MnAgentOfCompany_LocationEskisehir_Past); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0))

;; p203388  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201897 (MnAgentOfCompany_LocationEskisehir_Patient); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Patient $e0 $x1))

;; p203389  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201900 (MnAgentOfCompany_LocationKazakhstan_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build))

;; p203390  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201901 (MnAgentOfCompany_LocationKazakhstan_Past); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Past $e0))

;; p203391  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201902 (MnAgentOfCompany_LocationKazakhstan_Patient); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Patient $e0 $x1))

;; p203392  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201904 (MnAgentOfCompany_LocationTurkey_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build))

;; p203393  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201905 (MnAgentOfCompany_LocationTurkey_Past); not a proposal
(And (Agent $e0 $x0) (Location $e0 turkey) (Past $e0))

;; p203394  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201906 (MnAgentOfCompany_LocationTurkey_Patient); not a proposal
(And (Agent $e0 $x0) (Location $e0 turkey) (Patient $e0 $x1))

;; p203395  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203271 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))

;; p203396  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203271 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))

;; p203397  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p201911 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Agent $e0 $x0) (Member $e0 block) (Theme $e0 $x1))

;; p203398  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p201920 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1))

;; p203400  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203272 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))

;; p203401  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203272 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))

;; p203402  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p201921 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1))

;; p203404  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203273 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 glazing))

;; p203407  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203273 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 glazing))

;; p203408  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201961 (MnCan_MannerOfCardinalityNum_Define); not a proposal
(And (Can $e0) (Manner $e0 $x0) (Member $e0 define))

;; p203409  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201962 (MnCan_MannerOfCardinalityNum_Theme); not a proposal
(And (Can $e0) (Manner $e0 $x0) (Theme $e0 $x1))

;; p203410  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201964 (MnCan_Define_ThemeOfGroupOfSequence); not a proposal
(And (Can $e0) (Member $e0 define) (Theme $e0 $x0))

;; p203411  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p201965 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))

;; p203413  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201976 (MnForEvOfPortray_Win_Past); not a proposal
(And (For $e0 $e1) (Member $e0 win) (Past $e0))

;; p203414  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201977 (MnForEvOfPortray_Win_Theme); not a proposal
(And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))

;; p203415  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201980 (MnForEvOfPortray_Past_Theme); not a proposal
(And (For $e0 $e1) (Past $e0) (Theme $e0 $x0))

;; p203416  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201983 (MnFuture_PatientOfAppleHarvest_Time(MonthSeptember); not a proposal
(And (Future $e0) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p203418  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p201972 (MnHolderKristoffer_Have_ThemeOfCardinalityNum); not a proposal
(And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p203419  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p201987 (MnLocationOfPoint_Discover_Theme); not a proposal
(And (Location $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))

;; p203420  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203259 (MnAgent_LocationEskisehir_LocationTurkey_Build); not a proposal
(And (Location $e0 eskisehir) (Location $e0 turkey) (Member $e0 build))

;; p203421  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203260 (MnAgent_LocationEskisehir_LocationTurkey_Past); not a proposal
(And (Location $e0 eskisehir) (Location $e0 turkey) (Past $e0))

;; p203422  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201990 (MnLocationEskisehir_LocationTurkey_PatientOfHotel); not a proposal
(And (Location $e0 eskisehir) (Location $e0 turkey) (Patient $e0 $x0))

;; p203423  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203262 (MnAgent_LocationEskisehir_Build_Past); not a proposal
(And (Location $e0 eskisehir) (Member $e0 build) (Past $e0))

;; p203424  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201996 (MnLocationEskisehir_Build_PatientOfHotel); not a proposal
(And (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x0))

;; p203425  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201997 (MnLocationEskisehir_Past_PatientOfHotel); not a proposal
(And (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x0))

;; p203426  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203265 (MnAgent_LocationKazakhstan_Build_Past); not a proposal
(And (Location $e0 kazakhstan) (Member $e0 build) (Past $e0))

;; p203427  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203266 (MnAgent_LocationKazakhstan_Build_Patient); not a proposal
(And (Location $e0 kazakhstan) (Member $e0 build) (Patient $e0 $x0))

;; p203428  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203267 (MnAgent_LocationKazakhstan_Past_Patient); not a proposal
(And (Location $e0 kazakhstan) (Past $e0) (Patient $e0 $x0))

;; p203429  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203268 (MnAgent_LocationTurkey_Build_Past); not a proposal
(And (Location $e0 turkey) (Member $e0 build) (Past $e0))

;; p203430  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p202007 (MnLocationTurkey_Build_PatientOfHotel); not a proposal
(And (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x0))

;; p203431  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p202008 (MnLocationTurkey_Past_PatientOfHotel); not a proposal
(And (Location $e0 turkey) (Past $e0) (Patient $e0 $x0))

;; p203432  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201973 (MnMannerOfCardinalityNum_Define_Theme); not a proposal
(And (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))

;; p203433  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203271 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))

;; p203437  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203272 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))

;; p203438  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203282 (MnSell_Past_Recipient_Theme); not a proposal
(And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0))

;; p203439  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203282 (MnSell_Past_Recipient_Theme); not a proposal
(And (Member $e0 sell) (Past $e0) (Theme $e0 $x0))

;; p203440  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203282 (MnSell_Past_Recipient_Theme); not a proposal
(And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p203441  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203273 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 glazing))

;; p203442  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p202020 (MnWin_Past_ThemeOfEmmy); not a proposal
(And (Member $e0 win) (Past $e0) (Theme $e0 $x0))

;; p203443  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p201944 (MnAgent_ThemeOfFile-Missing); not a proposal
(And (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0))

;; p203444  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201945 (MnAgent_PatientOfGearbox-Seized); not a proposal
(And (Member $x0 gearbox) (Member $x0 seized) (Patient $e0 $x0))

;; p203447  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202023 (MnThemeOfTender-PossessionOfFirm); not a proposal
(And (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0))

;; p203448  support 4 (occ 4)  size 3  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203283 (MnThemeOfView-PossessionFreeSoilParty-PossessionRepublicanParty); not a proposal
(And (Member $x0 view) (Possession $x0 free_soil_party) (Possession $x0 republican_party))

;; p203449  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201953 (MnAgent_ThemeOfView-PossessionFreeSoilParty); not a proposal
(And (Member $x0 view) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203450  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201954 (MnAgent_ThemeOfView-PossessionRepublicanParty); not a proposal
(And (Member $x0 view) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203451  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203282 (MnSell_Past_Recipient_Theme); not a proposal
(And (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p203452  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202025 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning))

;; p203453  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201958 (MnAgent_ThemeOfPossessionFreeSoilParty-PossessionRepublicanParty); not a proposal
(And (Possession $x0 free_soil_party) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203611  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p201838 (MnAgentOfGovernment_AgentJica_Theme); not a proposal
(And (Agent $e0 $x0) (Agent $e0 jica))

;; p203613  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201893 (MnAgentOfCompany_LocationEskisehir_LocationTurkey); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir))

;; p203614  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201900 (MnAgentOfCompany_LocationKazakhstan_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan))

;; p203615  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201893 (MnAgentOfCompany_LocationEskisehir_LocationTurkey); not a proposal
(And (Agent $e0 $x0) (Location $e0 turkey))

;; p203616  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203271 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 acquire))

;; p203618  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p201911 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Agent $e0 $x0) (Member $e0 block))

;; p203619  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p201920 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e0 make))

;; p203620  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p203399 (MnAgent_Order_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 order))

;; p203621  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203272 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 purchase))

;; p203622  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p201921 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e0 reach))

;; p203623  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p203403 (MnAgent_Sign_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 sign))

;; p203626  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   subsumed by p201889 (MnAgentOfBiologist_LocationOfSurvey); not a proposal
(And (Agent $e0 $x0) (Member $x0 biologist))

;; p203627  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201879 (MnAgentOfChef_ThemeOfGroupOfLemon); not a proposal
(And (Agent $e0 $x0) (Member $x0 chef))

;; p203628  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000208 tierA-000209
;;   subsumed by p202785 (MnAgentOfClerk_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 clerk))

;; p203630  support 4 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201893 (MnAgentOfCompany_LocationEskisehir_LocationTurkey); not a proposal
(And (Agent $e0 $x0) (Member $x0 company))

;; p203631  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p201927 (MnAgentOfCouncil_PatientOfSummerFair); not a proposal
(And (Agent $e0 $x0) (Member $x0 council))

;; p203632  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   subsumed by p202789 (MnAgentOfDelegation_Time(WeekdayThursday); not a proposal
(And (Agent $e0 $x0) (Member $x0 delegation))

;; p203633  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201890 (MnAgentOfDiver_LocationOfPoint); not a proposal
(And (Agent $e0 $x0) (Member $x0 diver))

;; p203634  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   subsumed by p201929 (MnAgentOfEditor_ThemeOfManuscript); not a proposal
(And (Agent $e0 $x0) (Member $x0 editor))

;; p203636  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p201931 (MnAgentOfFirm_ThemeOfTender); not a proposal
(And (Agent $e0 $x0) (Member $x0 firm))

;; p203638  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p201838 (MnAgentOfGovernment_AgentJica_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 government))

;; p203639  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p201933 (MnAgentOfIntern_ThemeOfFile); not a proposal
(And (Agent $e0 $x0) (Member $x0 intern))

;; p203640  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201935 (MnAgentOfMechanic_PatientOfGearbox); not a proposal
(And (Agent $e0 $x0) (Member $x0 mechanic))

;; p203641  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   subsumed by p201938 (MnAgentOfPanel_ThemeOfProposal); not a proposal
(And (Agent $e0 $x0) (Member $x0 panel))

;; p203642  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000213 tierA-000214
;;   subsumed by p202799 (MnAgentOfPilot_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 pilot))

;; p203643  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p201883 (MnAgentOfRescueTeamOfInheritanceTeam_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 rescue_team))

;; p203644  support 4 (occ 6)  size 2  root $e1 (event)  depth 2
;;   e.g. tierC-000025 tierC-000026 tierC-000041
;;   subsumed by p203384 (MnThemeEvOfAgent-Location); not a proposal
(And (Agent $e0 $x0) (Theme $e1 $e0))

;; p203645  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   subsumed by p202789 (MnAgentOfDelegation_Time(WeekdayThursday); not a proposal
(And (Agent $e0 $x0) (Time $e0 (Weekday thursday)))

;; p203646  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p201838 (MnAgentOfGovernment_AgentJica_Theme); not a proposal
(And (Agent $e0 jica) (Theme $e0 $x0))

;; p203648  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p201960 (MnBeforeEvOfPatientOfDressRehearsal_Lunch); not a proposal
(And (Before $x0 $e0) (Member $x0 lunch))

;; p203649  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p201959 (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal); not a proposal
(And (Before $x0 $e0) (Patient $e0 $x1))

;; p203650  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   subsumed by p202831 (MnButEvOfPast_Past); not a proposal
(And (But $e0 $e1) (Past $e0))

;; p203651  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   subsumed by p202831 (MnButEvOfPast_Past); not a proposal
(And (But $e0 $e1) (Past $e1))

;; p203652  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201961 (MnCan_MannerOfCardinalityNum_Define); not a proposal
(And (Can $e0) (Manner $e0 $x0))

;; p203653  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201961 (MnCan_MannerOfCardinalityNum_Define); not a proposal
(And (Can $e0) (Member $e0 define))

;; p203654  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201961 (MnCan_MannerOfCardinalityNum_Define); not a proposal
(And (Cardinality $x0 <num>) (Manner $e0 $x0))

;; p203655  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000003 tierC-000004 tierC-000343
;;   subsumed by p203412 (MnExperiencer_Location_Locate); not a proposal
(And (Experiencer $e0 $x0) (Member $e0 locate))

;; p203656  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000013 tierC-000014 tierC-000121
;;   subsumed by p202841 (MnExperiencerOfPerson_Past); not a proposal
(And (Experiencer $e0 $x0) (Member $x0 person))

;; p203658  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p201975 (MnExperiencer_StimulusEvOfLocationOfLedger); not a proposal
(And (Experiencer $e0 $x0) (Stimulus $e0 $e1))

;; p203659  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201976 (MnForEvOfPortray_Win_Past); not a proposal
(And (For $e0 $e1) (Member $e0 win))

;; p203660  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201976 (MnForEvOfPortray_Win_Past); not a proposal
(And (For $e0 $e1) (Member $e1 portray))

;; p203661  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201977 (MnForEvOfPortray_Win_Theme); not a proposal
(And (For $e0 $e1) (Theme $e0 $x0))

;; p203662  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201983 (MnFuture_PatientOfAppleHarvest_Time(MonthSeptember); not a proposal
(And (Future $e0) (Time $e0 (Month september)))

;; p203663  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p201965 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (GroupOf $x0 child) (Theme $e0 $x0))

;; p203664  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p202769 (MnAgent_ThemeOfGroupOfSample); not a proposal
(And (GroupOf $x0 sample) (Theme $e0 $x0))

;; p203665  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201963 (MnCan_Manner_ThemeOfGroupOfSequence); not a proposal
(And (GroupOf $x0 sequence) (Theme $e0 $x0))

;; p203666  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000153 tierC-000154 tierC-000271
;;   subsumed by p203417 (MnHolder_Have_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 have))

;; p203667  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   subsumed by p202853 (MnHolderOfPermit_Theme); not a proposal
(And (Holder $e0 $x0) (Member $x0 permit))

;; p203668  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   subsumed by p201971 (MnHolderOfRecipe_ThemeOfCardinalityNum); not a proposal
(And (Holder $e0 $x0) (Member $x0 recipe))

;; p203669  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p201972 (MnHolderKristoffer_Have_ThemeOfCardinalityNum); not a proposal
(And (Holder $e0 kristoffer) (Member $e0 have))

;; p203670  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p201965 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p203671  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p201888 (MnAgent_LocationOfPoint_Discover); not a proposal
(And (Location $e0 $x0) (Member $e0 discover))

;; p203672  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p202862 (MnLocationOfLedger_Error); not a proposal
(And (Location $e0 $x0) (Member $e0 error))

;; p203673  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000003 tierC-000004 tierC-000343
;;   subsumed by p203412 (MnExperiencer_Location_Locate); not a proposal
(And (Location $e0 $x0) (Member $e0 locate))

;; p203674  support 4 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   subsumed by p201889 (MnAgentOfBiologist_LocationOfSurvey); not a proposal
(And (Location $e0 $x0) (Member $x0 survey))

;; p203676  support 4 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000025 tierC-000026 tierC-000353
;;   subsumed by p203383 (MnAgent_Location_Patient); not a proposal
(And (Location $e0 $x0) (Patient $e0 $x1))

;; p203677  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p201975 (MnExperiencer_StimulusEvOfLocationOfLedger); not a proposal
(And (Location $e0 $x0) (Stimulus $e1 $e0))

;; p203678  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201893 (MnAgentOfCompany_LocationEskisehir_LocationTurkey); not a proposal
(And (Location $e0 eskisehir) (Location $e0 turkey))

;; p203679  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201895 (MnAgentOfCompany_LocationEskisehir_Build); not a proposal
(And (Location $e0 eskisehir) (Member $e0 build))

;; p203680  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201896 (MnAgentOfCompany_LocationEskisehir_Past); not a proposal
(And (Location $e0 eskisehir) (Past $e0))

;; p203681  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201897 (MnAgentOfCompany_LocationEskisehir_Patient); not a proposal
(And (Location $e0 eskisehir) (Patient $e0 $x0))

;; p203683  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201900 (MnAgentOfCompany_LocationKazakhstan_Build); not a proposal
(And (Location $e0 kazakhstan) (Member $e0 build))

;; p203684  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201901 (MnAgentOfCompany_LocationKazakhstan_Past); not a proposal
(And (Location $e0 kazakhstan) (Past $e0))

;; p203685  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201902 (MnAgentOfCompany_LocationKazakhstan_Patient); not a proposal
(And (Location $e0 kazakhstan) (Patient $e0 $x0))

;; p203686  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201904 (MnAgentOfCompany_LocationTurkey_Build); not a proposal
(And (Location $e0 turkey) (Member $e0 build))

;; p203687  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201905 (MnAgentOfCompany_LocationTurkey_Past); not a proposal
(And (Location $e0 turkey) (Past $e0))

;; p203688  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201906 (MnAgentOfCompany_LocationTurkey_Patient); not a proposal
(And (Location $e0 turkey) (Patient $e0 $x0))

;; p203689  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201961 (MnCan_MannerOfCardinalityNum_Define); not a proposal
(And (Manner $e0 $x0) (Member $e0 define))

;; p203690  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201962 (MnCan_MannerOfCardinalityNum_Theme); not a proposal
(And (Manner $e0 $x0) (Theme $e0 $x1))

;; p203691  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203271 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Member $e0 acquire) (Past $e0))

;; p203692  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203271 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Member $e0 acquire) (Theme $e0 $x0))

;; p203693  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000241
;;   subsumed by p203434 (MnBecome_Past_ResultEv); not a proposal
(And (Member $e0 become) (Past $e0))

;; p203694  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000241
;;   subsumed by p203434 (MnBecome_Past_ResultEv); not a proposal
(And (Member $e0 become) (Result $e0 $e1))

;; p203695  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p201911 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Member $e0 block) (Theme $e0 $x0))

;; p203697  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p201920 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Member $e0 decision) (Patient $e1 $e0))

;; p203698  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p201921 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Member $e0 decision) (Theme $e1 $e0))

;; p203699  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p201964 (MnCan_Define_ThemeOfGroupOfSequence); not a proposal
(And (Member $e0 define) (Theme $e0 $x0))

;; p203700  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000183
;;   subsumed by p203435 (MnDesign_Past_Patient); not a proposal
(And (Member $e0 design) (Past $e0))

;; p203701  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000183
;;   subsumed by p203435 (MnDesign_Past_Patient); not a proposal
(And (Member $e0 design) (Patient $e0 $x0))

;; p203705  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p201920 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Member $e0 make) (Patient $e0 $e1))

;; p203706  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p203399 (MnAgent_Order_Theme); not a proposal
(And (Member $e0 order) (Theme $e0 $x0))

;; p203708  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000091 tierC-000092 tierC-000103
;;   subsumed by p203436 (MnProduce_Past_Patient); not a proposal
(And (Member $e0 produce) (Past $e0))

;; p203709  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203272 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Member $e0 purchase) (Past $e0))

;; p203710  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203272 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Member $e0 purchase) (Theme $e0 $x0))

;; p203711  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p201921 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Member $e0 reach) (Theme $e0 $e1))

;; p203713  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203282 (MnSell_Past_Recipient_Theme); not a proposal
(And (Member $e0 sell) (Past $e0))

;; p203714  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203282 (MnSell_Past_Recipient_Theme); not a proposal
(And (Member $e0 sell) (Recipient $e0 $x0))

;; p203715  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203282 (MnSell_Past_Recipient_Theme); not a proposal
(And (Member $e0 sell) (Theme $e0 $x0))

;; p203716  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p203403 (MnAgent_Sign_Patient); not a proposal
(And (Member $e0 sign) (Patient $e0 $x0))

;; p203718  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203273 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Member $e0 teach) (Theme $e0 glazing))

;; p203719  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201976 (MnForEvOfPortray_Win_Past); not a proposal
(And (Member $e0 win) (Past $e0))

;; p203720  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201977 (MnForEvOfPortray_Win_Theme); not a proposal
(And (Member $e0 win) (Theme $e0 $x0))

;; p203721  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p201882 (MnAgent_PatientOfAfternoonSessionOfInheritanceSession); not a proposal
(And (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p203723  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   subsumed by p202882 (MnDeparture_PossessionOfFerry); not a proposal
(And (Member $x0 departure) (Possession $x0 $x1))

;; p203724  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p201959 (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal); not a proposal
(And (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p203725  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   subsumed by p202804 (MnAgent_ThemeOfDrill); not a proposal
(And (Member $x0 drill) (Theme $e0 $x0))

;; p203727  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p201978 (MnForEv_Win_ThemeOfEmmy); not a proposal
(And (Member $x0 emmy) (Theme $e0 $x0))

;; p203728  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000017 tierC-000018 tierC-000121
;;   subsumed by p202884 (MnFamily_PossessionOfPerson); not a proposal
(And (Member $x0 family) (Possession $x0 $x1))

;; p203729  support 4 (occ 4)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   subsumed by p202882 (MnDeparture_PossessionOfFerry); not a proposal
(And (Member $x0 ferry) (Possession $x1 $x0))

;; p203730  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p201933 (MnAgentOfIntern_ThemeOfFile); not a proposal
(And (Member $x0 file) (Theme $e0 $x0))

;; p203731  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201935 (MnAgentOfMechanic_PatientOfGearbox); not a proposal
(And (Member $x0 gearbox) (Patient $e0 $x0))

;; p203732  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000302 tierA-000303
;;   subsumed by p202807 (MnAgent_ThemeOfGenerator); not a proposal
(And (Member $x0 generator) (Theme $e0 $x0))

;; p203733  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202025 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Member $x0 hearing) (Patient $e0 $x0))

;; p203734  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p201898 (MnAgent_LocationEskisehir_PatientOfHotel); not a proposal
(And (Member $x0 hotel) (Patient $e0 $x0))

;; p203737  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p201911 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Member $x0 lane) (Theme $e0 $x0))

;; p203738  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   subsumed by p202810 (MnAgent_ThemeOfManifest); not a proposal
(And (Member $x0 manifest) (Theme $e0 $x0))

;; p203739  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   subsumed by p201929 (MnAgentOfEditor_ThemeOfManuscript); not a proposal
(And (Member $x0 manuscript) (Theme $e0 $x0))

;; p203740  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p201934 (MnAgentOfIntern_ThemeOfMissing); not a proposal
(And (Member $x0 missing) (Theme $e0 $x0))

;; p203741  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   subsumed by p203445 (MnThemeOfNew-Roof); not a proposal
(And (Member $x0 new) (Member $x0 roof))

;; p203742  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   subsumed by p203445 (MnThemeOfNew-Roof); not a proposal
(And (Member $x0 new) (Theme $e0 $x0))

;; p203744  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   subsumed by p201938 (MnAgentOfPanel_ThemeOfProposal); not a proposal
(And (Member $x0 proposal) (Theme $e0 $x0))

;; p203745  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   subsumed by p203445 (MnThemeOfNew-Roof); not a proposal
(And (Member $x0 roof) (Theme $e0 $x0))

;; p203746  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p202815 (MnAgent_ThemeOfScan); not a proposal
(And (Member $x0 scan) (Theme $e0 $x0))

;; p203747  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p201940 (MnAgentOfRescueTeam_ThemeOfSearch); not a proposal
(And (Member $x0 search) (Theme $e0 $x0))

;; p203748  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p201936 (MnAgentOfMechanic_PatientOfSeized); not a proposal
(And (Member $x0 seized) (Patient $e0 $x0))

;; p203749  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p201884 (MnAgent_PatientOfSummerFairOfInheritanceFair); not a proposal
(And (Member $x0 summer_fair) (Patient $e0 $x0))

;; p203750  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p201931 (MnAgentOfFirm_ThemeOfTender); not a proposal
(And (Member $x0 tender) (Theme $e0 $x0))

;; p203751  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201953 (MnAgent_ThemeOfView-PossessionFreeSoilParty); not a proposal
(And (Member $x0 view) (Possession $x0 free_soil_party))

;; p203752  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201954 (MnAgent_ThemeOfView-PossessionRepublicanParty); not a proposal
(And (Member $x0 view) (Possession $x0 republican_party))

;; p203753  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201952 (MnAgent_Past_ThemeOfView); not a proposal
(And (Member $x0 view) (Theme $e0 $x0))

;; p203754  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   subsumed by p201922 (MnAgentOfBoard_ThemeOfVote); not a proposal
(And (Member $x0 vote) (Theme $e0 $x0))

;; p203755  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201892 (MnAgent_Location_ThemeOfWreck); not a proposal
(And (Member $x0 wreck) (Theme $e0 $x0))

;; p203756  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p202825 (MnAgent_ThemeOfOrdinalNumScan); not a proposal
(And (Ordinal $x0 <num> scan) (Theme $e0 $x0))

;; p203757  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203282 (MnSell_Past_Recipient_Theme); not a proposal
(And (Past $e0) (Recipient $e0 $x0))

;; p203758  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000158 tierC-000241
;;   subsumed by p203434 (MnBecome_Past_ResultEv); not a proposal
(And (Past $e0) (Result $e0 $e1))

;; p203759  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202025 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Patient $e0 $x0) (Time $e0 (Weekday monday)))

;; p203760  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202025 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Patient $e0 $x0) (Time $e0 morning))

;; p203761  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201958 (MnAgent_ThemeOfPossessionFreeSoilParty-PossessionRepublicanParty); not a proposal
(And (Possession $x0 free_soil_party) (Possession $x0 republican_party))

;; p203762  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201953 (MnAgent_ThemeOfView-PossessionFreeSoilParty); not a proposal
(And (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203763  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p201954 (MnAgent_ThemeOfView-PossessionRepublicanParty); not a proposal
(And (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203764  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203273 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Recipient $e0 $x0) (Theme $e0 glazing))

;; p203765  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202025 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Time $e0 (Weekday monday)) (Time $e0 morning))

;; p204865  support 3 (occ 4)  size 3  root $e1 (event)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203968 (MnAppearOfAlsoEvOfAgentOfPerson); not a proposal
(And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear))

;; p204866  support 3 (occ 3)  size 3  root appear (constant)  depth 3
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203968 (MnAppearOfAlsoEvOfAgentOfPerson); not a proposal
(And (Agent $e0 $x0) (Also appear $e0) (Member $x0 person))

;; p204867  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203973 (MnAgentOfPerson_AppearOfAlsoEv); not a proposal
(And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear))

;; p204868  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   subsumed by p203978 (MnAgentOfCardinalityNum-GroupOfClimber_Abandon); not a proposal
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon))

;; p204869  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p203981 (MnAgentOfBiologist_CoAgent_Location); not a proposal
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $x0 biologist))

;; p204870  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p203982 (MnAgent_CoAgentOfRanger_Location); not a proposal
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $x1 ranger))

;; p204871  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   subsumed by p203985 (MnAgentOfDelegation_Future_Time(WeekdayThursday); not a proposal
(And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation))

;; p204872  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   subsumed by p203978 (MnAgentOfCardinalityNum-GroupOfClimber_Abandon); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon))

;; p204873  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p203987 (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample) (Inheritance soil_sample sample))

;; p204874  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p203987 (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample) (Instrument $e0 post))

;; p204875  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p203988 (MnAgent_Teach_RecipientOfGroupOfChild); not a proposal
(And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1))

;; p204876  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p203996 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Agent $e0 $x0) (Inheritance night_delivery delivery) (Theme $e0 night_delivery))

;; p204877  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204001 (MnAgentOfCurator_LocationOfHall); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator))

;; p204878  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   subsumed by p204003 (MnAgentOfWelder_LocationOfFrame); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 welder))

;; p204879  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   subsumed by p204003 (MnAgentOfWelder_LocationOfFrame); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 frame))

;; p204880  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204001 (MnAgentOfCurator_LocationOfHall); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 hall))

;; p204881  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   subsumed by p204006 (MnAgentOfFirm_Abandon_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm))

;; p204883  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   subsumed by p204011 (MnAgentOfClerk_Answer_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk))

;; p204884  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   subsumed by p204012 (MnAgentOfPilot_Answer_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot))

;; p204886  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203973 (MnAgentOfPerson_AppearOfAlsoEv); not a proposal
(And (Agent $e0 $x0) (Member $e0 appear) (Member $x0 person))

;; p204887  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204019 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Agent $e0 $x0) (Member $e0 arrive) (Member $x0 freight))

;; p204888  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   subsumed by p204020 (MnAgentOfDepot_Buy_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot))

;; p204889  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p203997 (MnAgentOfPotteryStudioOfInheritanceStudio_Buy); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio))

;; p204890  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p203976 (MnAgentOfSchool_Beneficiary_Buy); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school))

;; p204892  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   subsumed by p204031 (MnAgentOfCouncil_Cancel_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council))

;; p204893  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   subsumed by p204032 (MnAgentOfTutor_Cancel_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))

;; p204894  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204037 (MnAgentOfBoard_Decide_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board))

;; p204895  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   subsumed by p204038 (MnAgentOfJudge_Decide_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge))

;; p204896  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   subsumed by p203998 (MnAgentOfDiver_Location_Discover); not a proposal
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver))

;; p204897  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   subsumed by p204043 (MnAgentOfIntern_Discover_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern))

;; p204898  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p203956 (MnAgentOfGovernment_AgentJica_Fund); not a proposal
(And (Agent $e0 $x0) (Member $e0 fund) (Member $x0 government))

;; p204899  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204048 (MnAgentOfSchool_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school))

;; p204900  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204050 (MnAgentOfTrainer_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer))

;; p204901  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204056 (MnAgentOfMuseum_Lend_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum))

;; p204902  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204058 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour))

;; p204903  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   subsumed by p204065 (MnAgentOfClub_Postpone_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club))

;; p204904  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204069 (MnAgentOfElder_Teach_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder))

;; p204905  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204071 (MnAgentOfPotter_Teach_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter))

;; p204906  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   subsumed by p203999 (MnAgentOfBiologist_Location_Work); not a proposal
(And (Agent $e0 $x0) (Member $e0 work) (Member $x0 biologist))

;; p204907  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204035 (MnAgent_Cause_ThemeEvOfDestroy); not a proposal
(And (Agent $e0 $x0) (Member $e1 destroy) (Theme $e0 $e1))

;; p204908  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   subsumed by p204079 (MnAgentOfAirline_ThemeOfEveningFlight); not a proposal
(And (Agent $e0 $x0) (Member $x0 airline) (Theme $e0 $x1))

;; p204909  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p204080 (MnAgentOfBank_ThemeOfLoanApplication); not a proposal
(And (Agent $e0 $x0) (Member $x0 bank) (Theme $e0 $x1))

;; p204910  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204002 (MnAgentOfCurator_Location_ThemePhotography); not a proposal
(And (Agent $e0 $x0) (Member $x0 curator) (Theme $e0 photography))

;; p204911  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p203989 (MnAgentOfElder_RecipientOfGroupOfChild); not a proposal
(And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1))

;; p204912  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204070 (MnAgentOfElder_Teach_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 elder) (Theme $e0 $x1))

;; p204913  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204087 (MnAgentOfFerry_ThemeOfDeparture); not a proposal
(And (Agent $e0 $x0) (Member $x0 ferry) (Theme $e0 $x1))

;; p204914  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204019 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Agent $e0 $x0) (Member $x0 freight) (Time $e0 (Hour <num>)))

;; p204915  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   subsumed by p204038 (MnAgentOfJudge_Decide_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 judge) (Theme $e0 $x1))

;; p204916  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p203996 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Agent $e0 $x0) (Member $x0 licence) (Theme $e0 night_delivery))

;; p204917  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204056 (MnAgentOfMuseum_Lend_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1))

;; p204918  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204057 (MnAgentOfMuseum_Lend_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 museum) (Theme $e0 $x1))

;; p204919  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204058 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi))

;; p204920  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204059 (MnAgentOfNeighbour_Lend_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 neighbour) (Theme $e0 $x1))

;; p204921  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204071 (MnAgentOfPotter_Teach_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1))

;; p204922  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204072 (MnAgentOfPotter_Teach_ThemeGlazing); not a proposal
(And (Agent $e0 $x0) (Member $x0 potter) (Theme $e0 glazing))

;; p204923  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204048 (MnAgentOfSchool_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1))

;; p204924  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204050 (MnAgentOfTrainer_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1))

;; p204925  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204051 (MnAgentOfTrainer_Give_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 trainer) (Theme $e0 $x1))

;; p204927  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204104 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Member $x0 warden) (Theme $e0 visitor))

;; p204928  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204104 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Member $x0 warden) (Time $e0 (Weekday sunday)))

;; p204929  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p204052 (MnAgent_Give_ThemeOfAnswer); not a proposal
(And (Agent $e0 $x0) (Member $x1 answer) (Theme $e0 $x1))

;; p204930  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204073 (MnAgent_Teach_RecipientOfApprentice); not a proposal
(And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1))

;; p204932  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204039 (MnAgent_Decide_ThemeOfBudget); not a proposal
(And (Agent $e0 $x0) (Member $x1 budget) (Theme $e0 $x1))

;; p204933  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   subsumed by p204040 (MnAgent_Decide_ThemeOfCase); not a proposal
(And (Agent $e0 $x0) (Member $x1 case) (Theme $e0 $x1))

;; p204934  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p204068 (MnAgent_Sign_PatientOfChart); not a proposal
(And (Agent $e0 $x0) (Member $x1 chart) (Patient $e0 $x1))

;; p204936  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204087 (MnAgentOfFerry_ThemeOfDeparture); not a proposal
(And (Agent $e0 $x0) (Member $x1 departure) (Theme $e0 $x1))

;; p204937  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   subsumed by p203994 (MnAgent_ThemeOfEveningFlightOfInheritanceFlight); not a proposal
(And (Agent $e0 $x0) (Member $x1 evening_flight) (Theme $e0 $x1))

;; p204938  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204060 (MnAgent_Lend_RecipientOfGallery); not a proposal
(And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1))

;; p204939  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p203995 (MnAgent_ThemeOfLoanApplicationOfInheritanceApplication); not a proposal
(And (Agent $e0 $x0) (Member $x1 loan_application) (Theme $e0 $x1))

;; p204942  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   subsumed by p204013 (MnAgent_Answer_ThemeOfQuery); not a proposal
(And (Agent $e0 $x0) (Member $x1 query) (Theme $e0 $x1))

;; p204943  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204054 (MnAgent_Give_RecipientOfRecruit); not a proposal
(And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1))

;; p204944  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   subsumed by p204014 (MnAgent_Answer_ThemeOfTower); not a proposal
(And (Agent $e0 $x0) (Member $x1 tower) (Theme $e0 $x1))

;; p204946  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204055 (MnAgent_Give_RecipientOfWinner); not a proposal
(And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1))

;; p204947  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204099 (MnAgentOfPotteryStudio_ThemeOfOrdinalNumBuy); not a proposal
(And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1))

;; p204948  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   subsumed by p204062 (MnAgent_Make_PatientEvOfTheme); not a proposal
(And (Agent $e0 $x0) (Patient $e0 $e1) (Theme $e1 $x1))

;; p204949  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204041 (MnAgent_Decide_ThemeOfPossessionNextYear); not a proposal
(And (Agent $e0 $x0) (Possession $x1 next_year) (Theme $e0 $x1))

;; p204950  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   subsumed by p204067 (MnAgent_Reach_ThemeEvOfTheme); not a proposal
(And (Agent $e0 $x0) (Theme $e0 $e1) (Theme $e1 $x1))

;; p204951  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204118 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Agent $e0 dara) (Location $e0 $x0) (Member $x0 ledger))

;; p204953  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203969 (MnAppearOfAlsoEvOfAgent-Past); not a proposal
(And (Also appear $e0) (Member $e1 appear) (Past $e0))

;; p204954  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203970 (MnAppearOfAlsoEvOfAgent_Past); not a proposal
(And (Also appear $e0) (Member $e1 appear) (Past $e1))

;; p204955  support 3 (occ 3)  size 3  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p204122 (MnBeforeEvOfFuture-Patient_Lunch); not a proposal
(And (Before $x0 $e0) (Future $e0) (Member $x0 lunch))

;; p204956  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p203977 (MnAgent_BeneficiaryOfHall_Buy); not a proposal
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall))

;; p204957  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   subsumed by p204126 (MnCan_MannerOfCardinalityNum-GroupOfWay); not a proposal
(And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0))

;; p204958  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p204127 (MnCan_MannerOfCardinalityNum-Random); not a proposal
(And (Can $e0) (Manner $e0 $x0) (Member $x0 random))

;; p204959  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p203982 (MnAgent_CoAgentOfRanger_Location); not a proposal
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $x0 ranger))

;; p204960  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p203983 (MnAgent_CoAgent_LocationOfSurvey); not a proposal
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $x1 survey))

;; p204961  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204138 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x1 gate))

;; p204963  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   subsumed by p204143 (MnBecome_Past_ResultEvOfExperiencer); not a proposal
(And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0))

;; p204964  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204140 (MnExperiencer_StimulusEvOfLocation-Error); not a proposal
(And (Experiencer $e0 $x0) (Member $e1 error) (Stimulus $e0 $e1))

;; p204965  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204141 (MnExperiencerOfAuditor_StimulusEvOfLocation); not a proposal
(And (Experiencer $e0 $x0) (Member $x0 auditor) (Stimulus $e0 $e1))

;; p204967  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   subsumed by p204143 (MnBecome_Past_ResultEvOfExperiencer); not a proposal
(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))

;; p204969  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p204123 (MnBeforeEvOfFuture-PatientOfDressRehearsal); not a proposal
(And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p204970  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p203988 (MnAgent_Teach_RecipientOfGroupOfChild); not a proposal
(And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0))

;; p204971  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p203990 (MnAgent_RecipientOfGroupOfChild_Theme); not a proposal
(And (GroupOf $x0 child) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p204972  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   subsumed by p203991 (MnAgent_Buy_ThemeOfGroupOfForklift); not a proposal
(And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))

;; p204973  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p203992 (MnAgent_Examine_ThemeOfGroupOfSample); not a proposal
(And (GroupOf $x0 sample) (Member $e0 examine) (Theme $e0 $x0))

;; p204974  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   subsumed by p204128 (MnCan_MannerOfGroupOfWay_Define); not a proposal
(And (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))

;; p204975  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   subsumed by p204129 (MnCan_MannerOfGroupOfWay_Theme); not a proposal
(And (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))

;; p204976  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204155 (MnHolder_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing))

;; p204977  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204155 (MnHolder_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p204978  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000091 tierA-000092
;;   subsumed by p204158 (MnHolderOfPermit_Require_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit))

;; p204979  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   subsumed by p204159 (MnHolderOfRecipe_Require_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe))

;; p204980  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204156 (MnHolderOfLathe_ThemeMonthlyServicingOfInheritanceMonthly); not a proposal
(And (Holder $e0 $x0) (Member $x0 lathe) (Theme $e0 monthly_servicing))

;; p204981  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   subsumed by p204160 (MnHolderOfPermit_ThemeOfCountersignature); not a proposal
(And (Holder $e0 $x0) (Member $x1 countersignature) (Theme $e0 $x1))

;; p204982  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   subsumed by p203994 (MnAgent_ThemeOfEveningFlightOfInheritanceFlight); not a proposal
(And (Inheritance evening_flight flight) (Member $x0 evening_flight) (Theme $e0 $x0))

;; p204984  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p203995 (MnAgent_ThemeOfLoanApplicationOfInheritanceApplication); not a proposal
(And (Inheritance loan_application application) (Member $x0 loan_application) (Theme $e0 $x0))

;; p204985  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   subsumed by p204162 (MnRequire_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Inheritance monthly_servicing monthly) (Member $e0 require) (Theme $e0 monthly_servicing))

;; p204986  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   subsumed by p204162 (MnRequire_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing))

;; p204988  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204138 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Location $e0 $x0) (Member $e0 wait) (Member $x0 gate))

;; p204990  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204118 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Location $e0 $x0) (Member $e0 work) (Member $x0 ledger))

;; p204991  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   subsumed by p204000 (MnAgent_LocationOfSurvey_Work); not a proposal
(And (Location $e0 $x0) (Member $e0 work) (Member $x0 survey))

;; p204992  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   subsumed by p204139 (MnExperiencer_Discover_StimulusEvOfLocation); not a proposal
(And (Location $e0 $x0) (Member $e1 discover) (Stimulus $e1 $e0))

;; p204993  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204004 (MnAgent_LocationOfHall_ThemePhotography); not a proposal
(And (Location $e0 $x0) (Member $x0 hall) (Theme $e0 photography))

;; p204994  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p204130 (MnCan_MannerOfRandom_Define); not a proposal
(And (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))

;; p204995  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p204131 (MnCan_MannerOfRandom_Theme); not a proposal
(And (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))

;; p204996  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   subsumed by p204007 (MnAgent_Abandon_ThemeOfNorthRoute); not a proposal
(And (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))

;; p204997  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   subsumed by p204009 (MnAgent_Abandon_ThemeOfTender); not a proposal
(And (Member $e0 abandon) (Member $x0 tender) (Theme $e0 $x0))

;; p204998  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   subsumed by p204171 (MnAbandon_ThemeOfPossessionOfFirm); not a proposal
(And (Member $e0 abandon) (Possession $x0 $x1) (Theme $e0 $x0))

;; p204999  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   subsumed by p204013 (MnAgent_Answer_ThemeOfQuery); not a proposal
(And (Member $e0 answer) (Member $x0 query) (Theme $e0 $x0))

;; p205000  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   subsumed by p204014 (MnAgent_Answer_ThemeOfTower); not a proposal
(And (Member $e0 answer) (Member $x0 tower) (Theme $e0 $x0))

;; p205002  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204028 (MnAgent_Buy_ThemeOfKiln); not a proposal
(And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0))

;; p205004  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   subsumed by p204033 (MnAgent_Cancel_PatientOfAfternoonSession); not a proposal
(And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p205005  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   subsumed by p204034 (MnAgent_Cancel_PatientOfSummerFair); not a proposal
(And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))

;; p205006  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204035 (MnAgent_Cause_ThemeEvOfDestroy); not a proposal
(And (Member $e0 cause) (Member $e1 destroy) (Theme $e0 $e1))

;; p205007  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204036 (MnAgent_Cause_ThemeEvOfPatient); not a proposal
(And (Member $e0 cause) (Patient $e1 $x0) (Theme $e0 $e1))

;; p205008  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204039 (MnAgent_Decide_ThemeOfBudget); not a proposal
(And (Member $e0 decide) (Member $x0 budget) (Theme $e0 $x0))

;; p205009  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   subsumed by p204040 (MnAgent_Decide_ThemeOfCase); not a proposal
(And (Member $e0 decide) (Member $x0 case) (Theme $e0 $x0))

;; p205010  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204041 (MnAgent_Decide_ThemeOfPossessionNextYear); not a proposal
(And (Member $e0 decide) (Possession $x0 next_year) (Theme $e0 $x0))

;; p205014  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   subsumed by p204044 (MnAgent_Discover_ThemeOfFile); not a proposal
(And (Member $e0 discover) (Member $x0 file) (Theme $e0 $x0))

;; p205015  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   subsumed by p204045 (MnAgent_Discover_ThemeOfMissing); not a proposal
(And (Member $e0 discover) (Member $x0 missing) (Theme $e0 $x0))

;; p205016  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   subsumed by p204046 (MnAgent_Discover_ThemeOfWreck); not a proposal
(And (Member $e0 discover) (Member $x0 wreck) (Theme $e0 $x0))

;; p205017  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p204052 (MnAgent_Give_ThemeOfAnswer); not a proposal
(And (Member $e0 give) (Member $x0 answer) (Theme $e0 $x0))

;; p205018  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   subsumed by p204053 (MnAgent_Give_ThemeOfManifest); not a proposal
(And (Member $e0 give) (Member $x0 manifest) (Theme $e0 $x0))

;; p205019  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204054 (MnAgent_Give_RecipientOfRecruit); not a proposal
(And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0))

;; p205020  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204055 (MnAgent_Give_RecipientOfWinner); not a proposal
(And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0))

;; p205021  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204060 (MnAgent_Lend_RecipientOfGallery); not a proposal
(And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0))

;; p205022  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   subsumed by p204061 (MnAgent_Lend_ThemeOfGenerator); not a proposal
(And (Member $e0 lend) (Member $x0 generator) (Theme $e0 $x0))

;; p205024  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   subsumed by p204062 (MnAgent_Make_PatientEvOfTheme); not a proposal
(And (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x0))

;; p205025  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p204063 (MnAgent_Order_ThemeOfScan); not a proposal
(And (Member $e0 order) (Member $x0 scan) (Theme $e0 $x0))

;; p205026  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p204064 (MnAgent_Order_ThemeOfOrdinalNumScan); not a proposal
(And (Member $e0 order) (Ordinal $x0 <num> scan) (Theme $e0 $x0))

;; p205027  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   subsumed by p204066 (MnAgent_Postpone_ThemeOfTournament); not a proposal
(And (Member $e0 postpone) (Member $x0 tournament) (Theme $e0 $x0))

;; p205028  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   subsumed by p204067 (MnAgent_Reach_ThemeEvOfTheme); not a proposal
(And (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x0))

;; p205029  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p204068 (MnAgent_Sign_PatientOfChart); not a proposal
(And (Member $e0 sign) (Member $x0 chart) (Patient $e0 $x0))

;; p205030  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204073 (MnAgent_Teach_RecipientOfApprentice); not a proposal
(And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0))

;; p205031  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   subsumed by p204074 (MnAgent_Teach_ThemeOfDrill); not a proposal
(And (Member $e0 teach) (Member $x0 drill) (Theme $e0 $x0))

;; p205032  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204075 (MnAgent_Teach_ThemeOfSong); not a proposal
(And (Member $e0 teach) (Member $x0 song) (Theme $e0 $x0))

;; p205033  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p204105 (MnAgent_Recipient_ThemeOfAnswer); not a proposal
(And (Member $x0 answer) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205034  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204106 (MnAgent_RecipientOfApprentice_ThemeGlazing); not a proposal
(And (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing))

;; p205035  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   subsumed by p204109 (MnAgent_Recipient_ThemeOfDrill); not a proposal
(And (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205036  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204194 (MnThemeOfDeparture-PossessionOfFerry); not a proposal
(And (Member $x0 ferry) (Possession $x1 $x0) (Theme $e0 $x1))

;; p205037  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204110 (MnAgent_RecipientOfGallery_Theme); not a proposal
(And (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205038  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   subsumed by p204111 (MnAgent_Recipient_ThemeOfGenerator); not a proposal
(And (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205039  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   subsumed by p204113 (MnAgent_Recipient_ThemeOfManifest); not a proposal
(And (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205040  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204114 (MnAgent_RecipientOfRecruit_Theme); not a proposal
(And (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205041  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204115 (MnAgent_Recipient_ThemeOfSong); not a proposal
(And (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205042  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204116 (MnAgent_RecipientOfWinner_Theme); not a proposal
(And (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205043  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204117 (MnAgent_Past_ThemeOfOrdinalNumBuy); not a proposal
(And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))

;; p205269  support 3 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203968 (MnAppearOfAlsoEvOfAgentOfPerson); not a proposal
(And (Also appear $e0) (Member $e1 appear))

;; p205270  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   subsumed by p204983 (MnCracked_FeedPipeOfInheritancePipe); not a proposal
(And (Inheritance feed_pipe pipe) (Member $x0 feed_pipe))

;; p205271  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p203996 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Inheritance night_delivery delivery) (Theme $e0 night_delivery))

;; p205358  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p203956 (MnAgentOfGovernment_AgentJica_Fund); not a proposal
(And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund))

;; p205360  support 3 (occ 4)  size 3  root appear (constant)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203969 (MnAppearOfAlsoEvOfAgent-Past); not a proposal
(And (Agent $e0 $x0) (Also appear $e0) (Past $e0))

;; p205361  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p203976 (MnAgentOfSchool_Beneficiary_Buy); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy))

;; p205363  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   subsumed by p205310 (MnAgent_CoAgent_Location_Work); not a proposal
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $e0 work))

;; p205365  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   subsumed by p203985 (MnAgentOfDelegation_Future_Time(WeekdayThursday); not a proposal
(And (Agent $e0 $x0) (Future $e0) (Time $e0 (Weekday thursday)))

;; p205367  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204002 (MnAgentOfCurator_Location_ThemePhotography); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e0 photography))

;; p205368  support 3 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203974 (MnAgent_AppearOfAlsoEv_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 appear) (Past $e0))

;; p205369  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204019 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Agent $e0 $x0) (Member $e0 arrive) (Time $e0 (Hour <num>)))

;; p205370  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204035 (MnAgent_Cause_ThemeEvOfDestroy); not a proposal
(And (Agent $e0 $x0) (Member $e0 cause) (Theme $e0 $e1))

;; p205371  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   subsumed by p205311 (MnAgent_Decide_Might_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 decide) (Might $e0))

;; p205372  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p203992 (MnAgent_Examine_ThemeOfGroupOfSample); not a proposal
(And (Agent $e0 $x0) (Member $e0 examine) (Theme $e0 $x1))

;; p205373  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p204047 (MnAgentOfGovernment_Fund_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 fund) (Theme $e0 $x1))

;; p205377  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204058 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi))

;; p205379  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   subsumed by p205313 (MnAgent_Receive_Source_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1))

;; p205380  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   subsumed by p205313 (MnAgent_Receive_Source_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 receive) (Theme $e0 $x1))

;; p205383  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204092 (MnAgentOfNeighbour_RecipientRavi_Theme); not a proposal
(And (Agent $e0 $x0) (Recipient $e0 ravi) (Theme $e0 $x1))

;; p205384  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204104 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Theme $e0 visitor) (Time $e0 (Weekday sunday)))

;; p205385  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204118 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Agent $e0 dara) (Location $e0 $x0) (Member $e0 work))

;; p205386  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p205306 (MnAgent_AgentJica_Fund_Theme); not a proposal
(And (Agent $e0 jica) (Member $e0 fund) (Theme $e0 $x0))

;; p205387  support 3 (occ 3)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p204122 (MnBeforeEvOfFuture-Patient_Lunch); not a proposal
(And (Before $x0 $e0) (Future $e0) (Patient $e0 $x1))

;; p205388  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p204124 (MnBeneficiaryOfHall_Buy_Past); not a proposal
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0))

;; p205389  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p204125 (MnBeneficiaryOfHall_Buy_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))

;; p205390  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   subsumed by p204126 (MnCan_MannerOfCardinalityNum-GroupOfWay); not a proposal
(And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0))

;; p205391  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p204127 (MnCan_MannerOfCardinalityNum-Random); not a proposal
(And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random))

;; p205392  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   subsumed by p205310 (MnAgent_CoAgent_Location_Work); not a proposal
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $e0 work))

;; p205393  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204138 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait))

;; p205394  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   subsumed by p204139 (MnExperiencer_Discover_StimulusEvOfLocation); not a proposal
(And (Experiencer $e0 $x0) (Member $e0 discover) (Stimulus $e0 $e1))

;; p205395  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204140 (MnExperiencer_StimulusEvOfLocation-Error); not a proposal
(And (Location $e0 $x0) (Member $e0 error) (Stimulus $e1 $e0))

;; p205399  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   subsumed by p205315 (MnBecome_Past_Patient_ResultEv); not a proposal
(And (Member $e0 become) (Past $e0) (Patient $e0 $x0))

;; p205400  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   subsumed by p205315 (MnBecome_Past_Patient_ResultEv); not a proposal
(And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1))

;; p205403  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   subsumed by p205311 (MnAgent_Decide_Might_Theme); not a proposal
(And (Member $e0 decide) (Might $e0) (Theme $e0 $x0))

;; p205404  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   subsumed by p204076 (MnAgent_PatientEvOfDecision-Theme); not a proposal
(And (Member $e0 decision) (Patient $e1 $e0) (Theme $e0 $x0))

;; p205405  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   subsumed by p204077 (MnAgent_ThemeEvOfDecision-Theme); not a proposal
(And (Member $e0 decision) (Theme $e0 $x0) (Theme $e1 $e0))

;; p205406  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204078 (MnAgent_ThemeEvOfDestroy-Patient); not a proposal
(And (Member $e0 destroy) (Patient $e0 $x0) (Theme $e1 $e0))

;; p205408  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p205312 (MnAgent_Lend_RecipientRavi_Theme); not a proposal
(And (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x0))

;; p205409  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   subsumed by p205313 (MnAgent_Receive_Source_Theme); not a proposal
(And (Member $e0 receive) (Source $e0 $x0) (Theme $e0 $x1))

;; p205410  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204194 (MnThemeOfDeparture-PossessionOfFerry); not a proposal
(And (Member $x0 departure) (Possession $x0 $x1) (Theme $e0 $x0))

;; p205411  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204112 (MnAgent_ThemeOfKiln-OrdinalNumBuy); not a proposal
(And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0))

;; p205412  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   subsumed by p205315 (MnBecome_Past_Patient_ResultEv); not a proposal
(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p205522  support 3 (occ 4)  size 2  root appear (constant)  depth 2
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203968 (MnAppearOfAlsoEvOfAgentOfPerson); not a proposal
(And (Agent $e0 $x0) (Also appear $e0))

;; p205523  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p203987 (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample))

;; p205524  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p203987 (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost); not a proposal
(And (Agent $e0 $x0) (Instrument $e0 post))

;; p205525  support 3 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000049 tierC-000050 tierC-000128
;;   subsumed by p203973 (MnAgentOfPerson_AppearOfAlsoEv); not a proposal
(And (Agent $e0 $x0) (Member $e0 appear))

;; p205527  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204035 (MnAgent_Cause_ThemeEvOfDestroy); not a proposal
(And (Agent $e0 $x0) (Member $e0 cause))

;; p205528  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p203992 (MnAgent_Examine_ThemeOfGroupOfSample); not a proposal
(And (Agent $e0 $x0) (Member $e0 examine))

;; p205529  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p203956 (MnAgentOfGovernment_AgentJica_Fund); not a proposal
(And (Agent $e0 $x0) (Member $e0 fund))

;; p205530  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   subsumed by p205374 (MnAgent_GiveUp_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 give_up))

;; p205531  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000351 tierC-000352
;;   subsumed by p205375 (MnAgent_Influence_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 influence))

;; p205532  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   subsumed by p205376 (MnAgent_Learn_Source); not a proposal
(And (Agent $e0 $x0) (Member $e0 learn))

;; p205534  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   subsumed by p205378 (MnAgent_PutOff_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 put_off))

;; p205535  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   subsumed by p205313 (MnAgent_Receive_Source_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 receive))

;; p205536  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   subsumed by p205381 (MnAgent_TurnDown_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 turn_down))

;; p205537  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p204080 (MnAgentOfBank_ThemeOfLoanApplication); not a proposal
(And (Agent $e0 $x0) (Member $x0 bank))

;; p205539  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204001 (MnAgentOfCurator_LocationOfHall); not a proposal
(And (Agent $e0 $x0) (Member $x0 curator))

;; p205541  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p203989 (MnAgentOfElder_RecipientOfGroupOfChild); not a proposal
(And (Agent $e0 $x0) (Member $x0 elder))

;; p205542  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204087 (MnAgentOfFerry_ThemeOfDeparture); not a proposal
(And (Agent $e0 $x0) (Member $x0 ferry))

;; p205543  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204019 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Agent $e0 $x0) (Member $x0 freight))

;; p205544  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p203996 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Agent $e0 $x0) (Member $x0 licence))

;; p205545  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204056 (MnAgentOfMuseum_Lend_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 museum))

;; p205546  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204058 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Member $x0 neighbour))

;; p205547  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204071 (MnAgentOfPotter_Teach_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 potter))

;; p205550  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204050 (MnAgentOfTrainer_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 trainer))

;; p205551  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000217 tierA-000218 tierA-000219
;;   subsumed by p204926 (MnAgentOfVet_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 vet))

;; p205552  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204104 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Member $x0 warden))

;; p205553  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   subsumed by p204003 (MnAgentOfWelder_LocationOfFrame); not a proposal
(And (Agent $e0 $x0) (Member $x0 welder))

;; p205554  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204058 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Recipient $e0 ravi))

;; p205555  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p203996 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Agent $e0 $x0) (Theme $e0 night_delivery))

;; p205556  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204002 (MnAgentOfCurator_Location_ThemePhotography); not a proposal
(And (Agent $e0 $x0) (Theme $e0 photography))

;; p205557  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204104 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Theme $e0 visitor))

;; p205558  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204019 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Agent $e0 $x0) (Time $e0 (Hour <num>)))

;; p205559  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204104 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Time $e0 (Weekday sunday)))

;; p205561  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204118 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Agent $e0 dara) (Location $e0 $x0))

;; p205562  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204118 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Agent $e0 dara) (Member $e0 work))

;; p205563  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p203956 (MnAgentOfGovernment_AgentJica_Fund); not a proposal
(And (Agent $e0 jica) (Member $e0 fund))

;; p205565  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p204122 (MnBeforeEvOfFuture-Patient_Lunch); not a proposal
(And (Before $x0 $e0) (Future $e0))

;; p205566  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p203976 (MnAgentOfSchool_Beneficiary_Buy); not a proposal
(And (Beneficiary $e0 $x0) (Member $e0 buy))

;; p205567  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   subsumed by p204126 (MnCan_MannerOfCardinalityNum-GroupOfWay); not a proposal
(And (Cardinality $x0 <num>) (GroupOf $x0 way))

;; p205568  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p204127 (MnCan_MannerOfCardinalityNum-Random); not a proposal
(And (Cardinality $x0 <num>) (Member $x0 random))

;; p205569  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   subsumed by p205310 (MnAgent_CoAgent_Location_Work); not a proposal
(And (CoAgent $e0 $x0) (Member $e0 work))

;; p205570  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p203982 (MnAgent_CoAgentOfRanger_Location); not a proposal
(And (CoAgent $e0 $x0) (Member $x0 ranger))

;; p205572  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   subsumed by p204139 (MnExperiencer_Discover_StimulusEvOfLocation); not a proposal
(And (Experiencer $e0 $x0) (Member $e0 discover))

;; p205573  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204138 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Experiencer $e0 $x0) (Member $e0 wait))

;; p205574  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204141 (MnExperiencerOfAuditor_StimulusEvOfLocation); not a proposal
(And (Experiencer $e0 $x0) (Member $x0 auditor))

;; p205575  support 3 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   subsumed by p204143 (MnBecome_Past_ResultEvOfExperiencer); not a proposal
(And (Experiencer $e0 $x0) (Result $e1 $e0))

;; p205576  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000241
;;   subsumed by p205364 (MnAgent_Future_Arrive); not a proposal
(And (Future $e0) (Member $e0 arrive))

;; p205577  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   subsumed by p203985 (MnAgentOfDelegation_Future_Time(WeekdayThursday); not a proposal
(And (Future $e0) (Time $e0 (Weekday thursday)))

;; p205580  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p203988 (MnAgent_Teach_RecipientOfGroupOfChild); not a proposal
(And (GroupOf $x0 child) (Recipient $e0 $x0))

;; p205581  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000146 tierC-000261 tierC-000262
;;   subsumed by p204126 (MnCan_MannerOfCardinalityNum-GroupOfWay); not a proposal
(And (GroupOf $x0 way) (Manner $e0 $x0))

;; p205583  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204156 (MnHolderOfLathe_ThemeMonthlyServicingOfInheritanceMonthly); not a proposal
(And (Holder $e0 $x0) (Member $x0 lathe))

;; p205584  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204155 (MnHolder_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Holder $e0 $x0) (Theme $e0 monthly_servicing))

;; p205585  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204138 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Location $e0 $x0) (Member $e0 wait))

;; p205586  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   subsumed by p204003 (MnAgentOfWelder_LocationOfFrame); not a proposal
(And (Location $e0 $x0) (Member $x0 frame))

;; p205587  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204138 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Location $e0 $x0) (Member $x0 gate))

;; p205588  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204001 (MnAgentOfCurator_LocationOfHall); not a proposal
(And (Location $e0 $x0) (Member $x0 hall))

;; p205591  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204002 (MnAgentOfCurator_Location_ThemePhotography); not a proposal
(And (Location $e0 $x0) (Theme $e0 photography))

;; p205592  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000145 tierC-000146 tierC-000261
;;   subsumed by p204127 (MnCan_MannerOfCardinalityNum-Random); not a proposal
(And (Manner $e0 $x0) (Member $x0 random))

;; p205593  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   subsumed by p205398 (MnPatientOfMeasureAgeNumYear-Founder); not a proposal
(And (Measure $x0 age <num> year) (Member $x0 founder))

;; p205594  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   subsumed by p205398 (MnPatientOfMeasureAgeNumYear-Founder); not a proposal
(And (Measure $x0 age <num> year) (Patient $e0 $x0))

;; p205595  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204019 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Member $e0 arrive) (Time $e0 (Hour <num>)))

;; p205597  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000055 tierA-000066 tierA-000070
;;   subsumed by p205401 (MnBegin_Might_Patient); not a proposal
(And (Member $e0 begin) (Might $e0))

;; p205598  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   subsumed by p205402 (MnBorrow_Source_Theme); not a proposal
(And (Member $e0 borrow) (Source $e0 $x0))

;; p205599  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204035 (MnAgent_Cause_ThemeEvOfDestroy); not a proposal
(And (Member $e0 cause) (Theme $e0 $e1))

;; p205601  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   subsumed by p205311 (MnAgent_Decide_Might_Theme); not a proposal
(And (Member $e0 decide) (Might $e0))

;; p205602  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204035 (MnAgent_Cause_ThemeEvOfDestroy); not a proposal
(And (Member $e0 destroy) (Theme $e1 $e0))

;; p205603  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000091 tierC-000297 tierC-000298
;;   subsumed by p205407 (MnDirect_Past_Patient); not a proposal
(And (Member $e0 direct) (Past $e0))

;; p205604  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   subsumed by p204139 (MnExperiencer_Discover_StimulusEvOfLocation); not a proposal
(And (Member $e0 discover) (Stimulus $e0 $e1))

;; p205606  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204140 (MnExperiencer_StimulusEvOfLocation-Error); not a proposal
(And (Member $e0 error) (Stimulus $e1 $e0))

;; p205607  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p203992 (MnAgent_Examine_ThemeOfGroupOfSample); not a proposal
(And (Member $e0 examine) (Theme $e0 $x0))

;; p205609  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
;;   subsumed by p204047 (MnAgentOfGovernment_Fund_Theme); not a proposal
(And (Member $e0 fund) (Theme $e0 $x0))

;; p205610  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   subsumed by p205374 (MnAgent_GiveUp_Theme); not a proposal
(And (Member $e0 give_up) (Theme $e0 $x0))

;; p205611  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   subsumed by p205376 (MnAgent_Learn_Source); not a proposal
(And (Member $e0 learn) (Source $e0 $x0))

;; p205612  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204058 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Member $e0 lend) (Recipient $e0 ravi))

;; p205613  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   subsumed by p205378 (MnAgent_PutOff_Theme); not a proposal
(And (Member $e0 put_off) (Theme $e0 $x0))

;; p205614  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   subsumed by p205313 (MnAgent_Receive_Source_Theme); not a proposal
(And (Member $e0 receive) (Source $e0 $x0))

;; p205615  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   subsumed by p204162 (MnRequire_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Member $e0 require) (Theme $e0 monthly_servicing))

;; p205618  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   subsumed by p205381 (MnAgent_TurnDown_Theme); not a proposal
(And (Member $e0 turn_down) (Theme $e0 $x0))

;; p205619  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000313 tierA-000322 tierA-000325
;;   subsumed by p205397 (MnLocation_Work_Might); not a proposal
(And (Member $e0 work) (Might $e0))

;; p205620  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p204052 (MnAgent_Give_ThemeOfAnswer); not a proposal
(And (Member $x0 answer) (Theme $e0 $x0))

;; p205621  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204073 (MnAgent_Teach_RecipientOfApprentice); not a proposal
(And (Member $x0 apprentice) (Recipient $e0 $x0))

;; p205622  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   subsumed by p205011 (MnDestroy_PatientOfArchive); not a proposal
(And (Member $x0 archive) (Patient $e0 $x0))

;; p205623  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000399 tierA-000400 tierA-000401
;;   subsumed by p204931 (MnAgent_ThemeOfBridge); not a proposal
(And (Member $x0 bridge) (Theme $e0 $x0))

;; p205624  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p204068 (MnAgent_Sign_PatientOfChart); not a proposal
(And (Member $x0 chart) (Patient $e0 $x0))

;; p205625  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   subsumed by p204160 (MnHolderOfPermit_ThemeOfCountersignature); not a proposal
(And (Member $x0 countersignature) (Theme $e0 $x0))

;; p205626  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   subsumed by p204983 (MnCracked_FeedPipeOfInheritancePipe); not a proposal
(And (Member $x0 cracked) (Member $x0 feed_pipe))

;; p205627  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204087 (MnAgentOfFerry_ThemeOfDeparture); not a proposal
(And (Member $x0 departure) (Theme $e0 $x0))

;; p205628  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   subsumed by p203994 (MnAgent_ThemeOfEveningFlightOfInheritanceFlight); not a proposal
(And (Member $x0 evening_flight) (Theme $e0 $x0))

;; p205630  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   subsumed by p205012 (MnDestroy_PatientOfFootbridge); not a proposal
(And (Member $x0 footbridge) (Patient $e0 $x0))

;; p205631  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   subsumed by p205398 (MnPatientOfMeasureAgeNumYear-Founder); not a proposal
(And (Member $x0 founder) (Patient $e0 $x0))

;; p205632  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204060 (MnAgent_Lend_RecipientOfGallery); not a proposal
(And (Member $x0 gallery) (Recipient $e0 $x0))

;; p205633  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   subsumed by p205013 (MnDestroy_PatientOfGreenhouse); not a proposal
(And (Member $x0 greenhouse) (Patient $e0 $x0))

;; p205634  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p203995 (MnAgent_ThemeOfLoanApplicationOfInheritanceApplication); not a proposal
(And (Member $x0 loan_application) (Theme $e0 $x0))

;; p205635  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000277 tierA-000278
;;   subsumed by p204940 (MnAgent_ThemeOfMedal); not a proposal
(And (Member $x0 medal) (Theme $e0 $x0))

;; p205636  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   subsumed by p204941 (MnAgent_ThemeOfPainting); not a proposal
(And (Member $x0 painting) (Theme $e0 $x0))

;; p205637  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   subsumed by p204013 (MnAgent_Answer_ThemeOfQuery); not a proposal
(And (Member $x0 query) (Theme $e0 $x0))

;; p205638  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204054 (MnAgent_Give_RecipientOfRecruit); not a proposal
(And (Member $x0 recruit) (Recipient $e0 $x0))

;; p205639  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   subsumed by p204014 (MnAgent_Answer_ThemeOfTower); not a proposal
(And (Member $x0 tower) (Theme $e0 $x0))

;; p205640  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   subsumed by p204945 (MnAgent_ThemeOfWhistle); not a proposal
(And (Member $x0 whistle) (Theme $e0 $x0))

;; p205641  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204055 (MnAgent_Give_RecipientOfWinner); not a proposal
(And (Member $x0 winner) (Recipient $e0 $x0))

;; p205642  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204099 (MnAgentOfPotteryStudio_ThemeOfOrdinalNumBuy); not a proposal
(And (Ordinal $x0 <num> buy) (Theme $e0 $x0))

;; p205644  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   subsumed by p204062 (MnAgent_Make_PatientEvOfTheme); not a proposal
(And (Patient $e0 $e1) (Theme $e1 $x0))

;; p205645  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000001 tierC-000241 tierC-000242
;;   subsumed by p205315 (MnBecome_Past_Patient_ResultEv); not a proposal
(And (Patient $e0 $x0) (Result $e0 $e1))

;; p205646  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204092 (MnAgentOfNeighbour_RecipientRavi_Theme); not a proposal
(And (Recipient $e0 ravi) (Theme $e0 $x0))

;; p205647  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   subsumed by p204067 (MnAgent_Reach_ThemeEvOfTheme); not a proposal
(And (Theme $e0 $e1) (Theme $e1 $x0))

;; p205648  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204104 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Theme $e0 visitor) (Time $e0 (Weekday sunday)))
